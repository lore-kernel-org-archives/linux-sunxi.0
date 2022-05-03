Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740DC33C9
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2907712FC;
	Tue,  3 May 2022 14:21:06 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F2A73FA53;
	Tue,  3 May 2022 14:21:04 -0700 (PDT)
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
Subject: [PATCH 4/7] spi: sunxi: Add support for F1C100s SPI controller
Date: Tue,  3 May 2022 22:20:37 +0100
Message-Id: <20220503212040.27884-5-andre.przywara@arm.com>
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

The SPI controllers in the Allwinner F1Cx00 series of SoCs are
compatible to the H3 IP. The only difference in the integration is
the missing mod clock in the F1C100, instead the SPI clock is directly
derived from the AHB clock.
We *should* be able to model this through the DT, but the addition of
get_rate() requires quite some refactoring, so it's not really worth in
this simple case: We programmed both the PLL_PERIPH to 600 MHz and the
PLL/AHB divider to 3 in the SPL, so we know the SPI base clock is 200
MHz. Since we used a hard coded fixed clock rate of 24 MHz for all the
other SoCs so far, we can as well do the same for the F1C100.

Define the SPI input clock and maximum frequency differently when
compiling for the F1C100 SoC.
Also adjust the power-of-2 divider programming, because that uses a
"minus one" encoding, compared to the other SoCs.

This allows to enable SPI flash support for the F1C100 boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sunxi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index d1e8692ede2..2f33337725e 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -72,9 +72,15 @@ DECLARE_GLOBAL_DATA_PTR;
 #define SUN4I_XMIT_CNT(cnt)		((cnt) & SUN4I_MAX_XFER_SIZE)
 #define SUN4I_FIFO_STA_RF_CNT_BITS	0
 
+#ifdef CONFIG_MACH_SUNIV
+/* the AHB clock, which we programmed to be 1/3 of PLL_PERIPH@600MHz */
+#define SUNXI_INPUT_CLOCK		200000000	/* 200 MHz */
+#define SUN4I_SPI_MAX_RATE		(SUNXI_INPUT_CLOCK / 2)
+#else
 /* the SPI mod clock, defaulting to be 1/1 of the HOSC@24MHz */
 #define SUNXI_INPUT_CLOCK		24000000	/* 24 MHz */
 #define SUN4I_SPI_MAX_RATE		SUNXI_INPUT_CLOCK
+#endif
 #define SUN4I_SPI_MIN_RATE		3000
 #define SUN4I_SPI_DEFAULT_RATE		1000000
 #define SUN4I_SPI_TIMEOUT_US		1000000
@@ -256,6 +262,9 @@ static void sun4i_spi_set_speed_mode(struct udevice *dev)
 		reg |= SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
 	} else {
 		div = fls(div - 1);
+		/* The F1C100s encodes the divider as 2^(n+1) */
+		if (CONFIG_IS_ENABLED(CONFIG_MACH_SUNIV))
+			div--;
 		reg &= ~((SUN4I_CLK_CTL_CDR1_MASK << 8) | SUN4I_CLK_CTL_DRS);
 		reg |= SUN4I_CLK_CTL_CDR1(div);
 	}
-- 
2.35.3

