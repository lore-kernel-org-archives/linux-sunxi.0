Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790213FC1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Sep 2021 15:58:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04632D6E;
	Fri,  3 Sep 2021 08:49:25 -0700 (PDT)
Received: from e110479.cambridge.arm.com (e110479.cambridge.arm.com [10.1.34.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0C93F766;
	Fri,  3 Sep 2021 08:49:23 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: mmc: A20: Fix MMC optimisation
Date: Fri,  3 Sep 2021 16:49:16 +0100
Message-Id: <20210903154916.5264-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Some SoCs (as seen on A20) seem to misreport the MMC FIFO level if the
FIFO is completely full: the level size reads as zero, but the FIFO_FULL
bit is set. We won't do a single iteration of the read loop in this
case, so will be stuck forever.

Check for this situation and use a safe minimal FIFO size instead when
we hit this case.

This fixes MMC boot on A20 devices after the MMC FIFO optimisation
(9faae5457f52).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 178b8cf106..aaab0cf866 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -349,10 +349,14 @@ static int mmc_trans_data_by_cpu(struct sunxi_mmc_priv *priv, struct mmc *mmc,
 		 * register without checking the status register after every
 		 * read. That saves half of the costly MMIO reads, effectively
 		 * doubling the read performance.
+		 * Some SoCs (A20) report a level of 0 if the FIFO is
+		 * completely full (value masked out?). Use a safe minimal
+		 * FIFO size in this case.
 		 */
-		for (in_fifo = SUNXI_MMC_STATUS_FIFO_LEVEL(status);
-		     in_fifo > 0;
-		     in_fifo--)
+		in_fifo = SUNXI_MMC_STATUS_FIFO_LEVEL(status);
+		if (in_fifo == 0 && (status & SUNXI_MMC_STATUS_FIFO_FULL))
+			in_fifo = 32;
+		for (; in_fifo > 0; in_fifo--)
 			buff[i++] = readl_relaxed(&priv->reg->fifo);
 		dmb();
 	}
-- 
2.17.1

