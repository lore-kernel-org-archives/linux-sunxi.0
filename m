Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A16259CA4
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912867; cv=none; b=GGAbCuc4zhy5wY0CuXMahkO9kHmyQjUxNfr5f1P7V8LawxWu86VyhXqSemmLE9RR7rjsLLezxHMc9HuNCNdWAFpFp7XdT7JlzXxwUE7UGQa+GJM6FwwLWMrG9WZV+QaCbfEde6ZY0u8AFOMOz1BmyY+ANp8ym78Fzq/t616RK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912867; c=relaxed/simple;
	bh=eoZp673i5jCWjD/dmTmXBODGiqFPJBw05gFuDg/jTXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nNJDM6o/ZPVjs5mXPRQYDLNEYa6+XHcfNCrs0cBlAtPogcOvY3hdAudbgbfdwsn1ySljtuUYt4T9fsVWyFCfLyuvEet5BAFLKAFAOPYh62LlpXPWfWfd2KzizpDNOdsCdkdbNTGrs1OQLdj9QlXjr4spJgcZARLJPxQQ0MDTdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F27D31756;
	Tue, 25 Mar 2025 07:27:47 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 277F63F694;
	Tue, 25 Mar 2025 07:27:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: FIXUP! sunxi: mmc: Improve reset procedure
Date: Tue, 25 Mar 2025 14:27:37 +0000
Message-Id: <20250325142737.1702796-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325133953.1dab37c8@donnerap.manchester.arm.com>
References: <20250325133953.1dab37c8@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jernej,

what do you think about this solution the A10 compilation problem?
That looks like a simple change, somewhat half of the way to the proper
solution.
If you agree, I'd squash that into your patch, then push it for U-Boot
next.

Cheers,
Andre


Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 10 +++++-----
 drivers/mmc/sunxi_mmc.h |  4 ++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 31dbfb10c59..951e6acd34d 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -449,23 +449,23 @@ out:
 	return error;
 }
 
-static void sunxi_mmc_reset(struct sunxi_mmc *regs)
+static void sunxi_mmc_reset(void *regs)
 {
 	/* Reset controller */
-	writel(SUNXI_MMC_GCTRL_RESET, &regs->gctrl);
+	writel(SUNXI_MMC_GCTRL_RESET, regs + SUNXI_MMC_GCTRL);
 	udelay(1000);
 
 	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
 		/* Reset card */
-		writel(SUNXI_MMC_HWRST_ASSERT, &regs->hwrst);
+		writel(SUNXI_MMC_HWRST_ASSERT, regs + SUNXI_MMC_HWRST);
 		udelay(10);
-		writel(SUNXI_MMC_HWRST_DEASSERT, &regs->hwrst);
+		writel(SUNXI_MMC_HWRST_DEASSERT, regs + SUNXI_MMC_HWRST);
 		udelay(300);
 
 		/* Setup FIFO R/W threshold. Needed on H616. */
 		writel(SUNXI_MMC_THLDC_READ_THLD(512) |
 		       SUNXI_MMC_THLDC_WRITE_EN |
-		       SUNXI_MMC_THLDC_READ_EN, &regs->thldc);
+		       SUNXI_MMC_THLDC_READ_EN, regs + SUNXI_MMC_THLDC);
 	}
 }
 
diff --git a/drivers/mmc/sunxi_mmc.h b/drivers/mmc/sunxi_mmc.h
index 9d55904c213..bc313dcabe0 100644
--- a/drivers/mmc/sunxi_mmc.h
+++ b/drivers/mmc/sunxi_mmc.h
@@ -12,6 +12,10 @@
 
 #include <linux/types.h>
 
+#define SUNXI_MMC_GCTRL		0x000
+#define SUNXI_MMC_HWRST		0x078
+#define SUNXI_MMC_THLDC		0x100
+
 struct sunxi_mmc {
 	u32 gctrl;		/* 0x00 global control */
 	u32 clkcr;		/* 0x04 clock control */
-- 
2.25.1

