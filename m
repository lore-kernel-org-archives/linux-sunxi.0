Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816D033EE
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 459EA143D;
	Tue,  3 May 2022 14:21:02 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B66B3FA53;
	Tue,  3 May 2022 14:21:00 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 2/7] spi: sunxi: refactor SPI speed/mode programming
Date: Tue,  3 May 2022 22:20:35 +0100
Message-Id: <20220503212040.27884-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220503212040.27884-1-andre.przywara@arm.com>
References: <20220503212040.27884-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As George rightfully pointed out [1], the spi-sunxi driver programs the
speed and mode settings only when the respective functions are called,
but this gets lost over a call to release_bus(). That asserts the
reset line, thus forces each SPI register back to its default value.
Adding to that, trying to program SPI_CCR and SPI_TCR might be pointless
in the first place, when the reset line is still asserted (before
claim_bus()), so those setting won't apply most of the time. In reality
I see two nested claim_bus() calls for the first use, so settings between
the two would work (for instance for the initial "sf probe"). However
later on the speed setting is not programmed into the hardware anymore.

So far we get away with that default frequency, because that is a rather
tame 24 MHz, which most SPI flash chips can handle just fine.

Move the actual register programming into a separate function, and use
.set_speed and .set_mode just to set the variables in our priv structure.
Then we only call this new function in claim_bus(), when we are sure
that register accesses actually work and are preserved.

[1] https://lore.kernel.org/u-boot/20210725231636.879913-17-me@yifangu.com/

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reported-by: George Hilliard <thirtythreeforty@gmail.com>
---
 drivers/spi/spi-sunxi.c | 95 ++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 43 deletions(-)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index b6cd7ddafad..d6b2dd09514 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -221,6 +221,56 @@ err_ahb:
 	return ret;
 }
 
+static void sun4i_spi_set_speed_mode(struct udevice *dev)
+{
+	struct sun4i_spi_priv *priv = dev_get_priv(dev);
+	unsigned int div;
+	u32 reg;
+
+	/*
+	 * Setup clock divider.
+	 *
+	 * We have two choices there. Either we can use the clock
+	 * divide rate 1, which is calculated thanks to this formula:
+	 * SPI_CLK = MOD_CLK / (2 ^ (cdr + 1))
+	 * Or we can use CDR2, which is calculated with the formula:
+	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
+	 * Whether we use the former or the latter is set through the
+	 * DRS bit.
+	 *
+	 * First try CDR2, and if we can't reach the expected
+	 * frequency, fall back to CDR1.
+	 */
+
+	div = SUN4I_SPI_MAX_RATE / (2 * priv->freq);
+	reg = readl(SPI_REG(priv, SPI_CCR));
+
+	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
+		if (div > 0)
+			div--;
+
+		reg &= ~(SUN4I_CLK_CTL_CDR2_MASK | SUN4I_CLK_CTL_DRS);
+		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
+	} else {
+		div = __ilog2(SUN4I_SPI_MAX_RATE) - __ilog2(priv->freq);
+		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
+		reg |= SUN4I_CLK_CTL_CDR1(div);
+	}
+
+	writel(reg, SPI_REG(priv, SPI_CCR));
+
+	reg = readl(SPI_REG(priv, SPI_TCR));
+	reg &= ~(SPI_BIT(priv, SPI_TCR_CPOL) | SPI_BIT(priv, SPI_TCR_CPHA));
+
+	if (priv->mode & SPI_CPOL)
+		reg |= SPI_BIT(priv, SPI_TCR_CPOL);
+
+	if (priv->mode & SPI_CPHA)
+		reg |= SPI_BIT(priv, SPI_TCR_CPHA);
+
+	writel(reg, SPI_REG(priv, SPI_TCR));
+}
+
 static int sun4i_spi_claim_bus(struct udevice *dev)
 {
 	struct sun4i_spi_priv *priv = dev_get_priv(dev->parent);
@@ -240,6 +290,8 @@ static int sun4i_spi_claim_bus(struct udevice *dev)
 	setbits_le32(SPI_REG(priv, SPI_TCR), SPI_BIT(priv, SPI_TCR_CS_MANUAL) |
 		     SPI_BIT(priv, SPI_TCR_CS_ACTIVE_LOW));
 
+	sun4i_spi_set_speed_mode(dev->parent);
+
 	return 0;
 }
 
@@ -329,46 +381,14 @@ static int sun4i_spi_set_speed(struct udevice *dev, uint speed)
 {
 	struct sun4i_spi_plat *plat = dev_get_plat(dev);
 	struct sun4i_spi_priv *priv = dev_get_priv(dev);
-	unsigned int div;
-	u32 reg;
 
 	if (speed > plat->max_hz)
 		speed = plat->max_hz;
 
 	if (speed < SUN4I_SPI_MIN_RATE)
 		speed = SUN4I_SPI_MIN_RATE;
-	/*
-	 * Setup clock divider.
-	 *
-	 * We have two choices there. Either we can use the clock
-	 * divide rate 1, which is calculated thanks to this formula:
-	 * SPI_CLK = MOD_CLK / (2 ^ (cdr + 1))
-	 * Or we can use CDR2, which is calculated with the formula:
-	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
-	 * Whether we use the former or the latter is set through the
-	 * DRS bit.
-	 *
-	 * First try CDR2, and if we can't reach the expected
-	 * frequency, fall back to CDR1.
-	 */
-
-	div = SUN4I_SPI_MAX_RATE / (2 * speed);
-	reg = readl(SPI_REG(priv, SPI_CCR));
-
-	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
-		if (div > 0)
-			div--;
-
-		reg &= ~(SUN4I_CLK_CTL_CDR2_MASK | SUN4I_CLK_CTL_DRS);
-		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
-	} else {
-		div = __ilog2(SUN4I_SPI_MAX_RATE) - __ilog2(speed);
-		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
-		reg |= SUN4I_CLK_CTL_CDR1(div);
-	}
 
 	priv->freq = speed;
-	writel(reg, SPI_REG(priv, SPI_CCR));
 
 	return 0;
 }
@@ -376,19 +396,8 @@ static int sun4i_spi_set_speed(struct udevice *dev, uint speed)
 static int sun4i_spi_set_mode(struct udevice *dev, uint mode)
 {
 	struct sun4i_spi_priv *priv = dev_get_priv(dev);
-	u32 reg;
-
-	reg = readl(SPI_REG(priv, SPI_TCR));
-	reg &= ~(SPI_BIT(priv, SPI_TCR_CPOL) | SPI_BIT(priv, SPI_TCR_CPHA));
-
-	if (mode & SPI_CPOL)
-		reg |= SPI_BIT(priv, SPI_TCR_CPOL);
-
-	if (mode & SPI_CPHA)
-		reg |= SPI_BIT(priv, SPI_TCR_CPHA);
 
 	priv->mode = mode;
-	writel(reg, SPI_REG(priv, SPI_TCR));
 
 	return 0;
 }
-- 
2.35.3

