Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF012EC0A0
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970405; cv=none; b=J7AQglXLTWFLgcPlQErZTt6z2Lz/Nh7JWmKLqodw08RwnScTd3baYP4KgcYxqCr0qvljmTB9OUiRnPS6euTkSnwVb/B5JfR6TtWeOiLB8ENwtPGhQ63+r87vYPZDhVzsF0DfexkeZzDcZqZnYdhj6sN+4D9cO1RhWpTZ1ofqLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970405; c=relaxed/simple;
	bh=lV2dRjkdNkPGWA2SazQ+3r+dwekW1DBkAwSqCuRgHhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UUPPo+/fqsGSvgFUeT2R64p/tYvMH5OS9kXVtb5JVARJd9JHXXyCJ9u863P+JmmY/tulKOZytwAMY4/JHiL8z3rtpHy1YpBpCOiQ9KpFE6Nx15+YqMgpIgTlwG4geeKGuYCt6UhFaQp9jUTslaltMap3IKZp+eCZ8U6vDpJ3aN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3D81063;
	Mon, 20 Oct 2025 07:26:34 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8403F63F;
	Mon, 20 Oct 2025 07:26:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH] sunxi: a523: Re-use H6/H616 DRAM size detection method
Date: Mon, 20 Oct 2025 15:26:22 +0100
Message-Id: <20251020142622.1849108-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H6 and H616 DRAM initialisation code recently gained a joint and
improved size detection routine, which helped to avoid the occasional
DRAM size misdetection.

Use the same code for the A523 DRAM initialisation as well, which
suffers from the same misdetection at times.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Makefile           |  2 +-
 arch/arm/mach-sunxi/dram_sun55i_a523.c | 82 +-------------------------
 2 files changed, 4 insertions(+), 80 deletions(-)

diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 579530f27e3..9c79b55abf3 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -47,6 +47,6 @@ obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_sun50i_h616.o dram_dw_helpers.o
 obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_timings/
 obj-$(CONFIG_DRAM_SUN50I_A133)	+= dram_sun50i_a133.o
 obj-$(CONFIG_DRAM_SUN50I_A133)	+= dram_timings/
-obj-$(CONFIG_MACH_SUN55I_A523)	+= dram_sun55i_a523.o
+obj-$(CONFIG_MACH_SUN55I_A523)	+= dram_sun55i_a523.o dram_dw_helpers.o
 obj-$(CONFIG_DRAM_SUN55I_A523)	+= dram_timings/
 endif
diff --git a/arch/arm/mach-sunxi/dram_sun55i_a523.c b/arch/arm/mach-sunxi/dram_sun55i_a523.c
index 30bbeb40d0b..1ffb62863e2 100644
--- a/arch/arm/mach-sunxi/dram_sun55i_a523.c
+++ b/arch/arm/mach-sunxi/dram_sun55i_a523.c
@@ -12,6 +12,7 @@
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
+#include <asm/arch/dram_dw_helpers.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/prcm.h>
 #include <linux/bitops.h>
@@ -1387,91 +1388,14 @@ static bool mctl_ctrl_init(const struct dram_para *para,
 	return true;
 }
 
-static bool mctl_core_init(const struct dram_para *para,
-			   const struct dram_config *config)
+bool mctl_core_init(const struct dram_para *para,
+		    const struct dram_config *config)
 {
 	mctl_sys_init(config->clk);
 
 	return mctl_ctrl_init(para, config);
 }
 
-static void mctl_auto_detect_rank_width(const struct dram_para *para,
-					struct dram_config *config)
-{
-	/* this is minimum size that it's supported */
-	config->cols = 8;
-	config->rows = 13;
-
-	/*
-	 * Strategy here is to test most demanding combination first and least
-	 * demanding last, otherwise HW might not be fully utilized. For
-	 * example, half bus width and rank = 1 combination would also work
-	 * on HW with full bus width and rank = 2, but only 1/4 RAM would be
-	 * visible.
-	 */
-
-	debug("testing 32-bit width, rank = 2\n");
-	config->bus_full_width = 1;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 32-bit width, rank = 1\n");
-	config->bus_full_width = 1;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 2\n");
-	config->bus_full_width = 0;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 1\n");
-	config->bus_full_width = 0;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	panic("This DRAM setup is currently not supported.\n");
-}
-
-static void mctl_auto_detect_dram_size(const struct dram_para *para,
-				       struct dram_config *config)
-{
-	/* detect row address bits */
-	config->cols = 8;
-	config->rows = 16;
-	mctl_core_init(para, config);
-
-	for (config->rows = 13; config->rows < 16; config->rows++) {
-		/* 8 banks, 8 bit per byte and 16/32 bit width */
-		if (mctl_mem_matches((1 << (config->rows + config->cols +
-					    4 + config->bus_full_width))))
-			break;
-	}
-
-	/* detect column address bits */
-	config->cols = 11;
-	mctl_core_init(para, config);
-
-	for (config->cols = 8; config->cols < 11; config->cols++) {
-		/* 8 bits per byte and 16/32 bit width */
-		if (mctl_mem_matches(1 << (config->cols + 1 +
-					   config->bus_full_width)))
-			break;
-	}
-}
-
-static unsigned long long mctl_calc_size(const struct dram_config *config)
-{
-	u8 width = config->bus_full_width ? 4 : 2;
-
-	/* 8 banks */
-	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
-}
-
 static const struct dram_para para = {
 #ifdef CONFIG_SUNXI_DRAM_A523_DDR3
 	.type = SUNXI_DRAM_TYPE_DDR3,
-- 
2.25.1

