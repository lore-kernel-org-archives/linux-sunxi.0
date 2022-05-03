Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D1D33ED
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3803E1516;
	Tue,  3 May 2022 14:21:04 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BAC13FA53;
	Tue,  3 May 2022 14:21:02 -0700 (PDT)
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
Subject: [PATCH 3/7] spi: sunxi: improve SPI clock calculation
Date: Tue,  3 May 2022 22:20:36 +0100
Message-Id: <20220503212040.27884-4-andre.przywara@arm.com>
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

The current SPI clock divider calculation has two problems:
- We use a normal round-down division, which results in a divider
  typically being too small, resulting in a too high frequency on the bus.
- The calculation for the power-of-two divider is very inaccurate, and
  again rounds down, which might lead to wild bus frequencies.

This wasn't a real problem so far, since most chips can handle slightly
higher bus frequencies just fine. Also the actual speed was mostly lost
anyway, due to release_bus() reseting the device. And the power-of-2
calculation was probably never used, because it only applies to
frequencies below 47 KHz.
However this will become a problem for the F1C100s support, due to its
much higher base frequency.

Calculate a safe divider correctly (using round-up), and re-use that
value when calculating the power-of-2 value. We also separate the
maximum frequency and the input clock on the way, since they will be
different for the F1C100s.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sunxi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index d6b2dd09514..d1e8692ede2 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -72,7 +72,9 @@ DECLARE_GLOBAL_DATA_PTR;
 #define SUN4I_XMIT_CNT(cnt)		((cnt) & SUN4I_MAX_XFER_SIZE)
 #define SUN4I_FIFO_STA_RF_CNT_BITS	0
 
-#define SUN4I_SPI_MAX_RATE		24000000
+/* the SPI mod clock, defaulting to be 1/1 of the HOSC@24MHz */
+#define SUNXI_INPUT_CLOCK		24000000	/* 24 MHz */
+#define SUN4I_SPI_MAX_RATE		SUNXI_INPUT_CLOCK
 #define SUN4I_SPI_MIN_RATE		3000
 #define SUN4I_SPI_DEFAULT_RATE		1000000
 #define SUN4I_SPI_TIMEOUT_US		1000000
@@ -242,17 +244,18 @@ static void sun4i_spi_set_speed_mode(struct udevice *dev)
 	 * frequency, fall back to CDR1.
 	 */
 
-	div = SUN4I_SPI_MAX_RATE / (2 * priv->freq);
+	div = DIV_ROUND_UP(SUNXI_INPUT_CLOCK, priv->freq);
 	reg = readl(SPI_REG(priv, SPI_CCR));
 
-	if (div <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
+	if ((div / 2) <= (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
+		div /= 2;
 		if (div > 0)
 			div--;
 
 		reg &= ~(SUN4I_CLK_CTL_CDR2_MASK | SUN4I_CLK_CTL_DRS);
 		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
 	} else {
-		div = __ilog2(SUN4I_SPI_MAX_RATE) - __ilog2(priv->freq);
+		div = fls(div - 1);
 		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
 		reg |= SUN4I_CLK_CTL_CDR1(div);
 	}
-- 
2.35.3

