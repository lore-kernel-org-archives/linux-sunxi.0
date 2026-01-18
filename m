Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B9B227563
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768780817; cv=none; b=BwifMPIUcYEQ0U9+1vdCK3jpvoCN1vatPHiMpG79i1CziDp6du0eNPLR0vfmrV6yuCUAC2bkttgUzA/4E4CDn/Ftp1ufUUSuxSfjxGGEZlFfqgJ0/Y6VioEw7TorZT0NdIwsHf0yNcXBpKwcBrakZ2YoPmDuMBn3hbQ8AzWqOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768780817; c=relaxed/simple;
	bh=74yp+/CXKXytZV43wM1dF0PMinYaLhU3Xb/2t7o9UuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXmNfjffEM0xR2lYhWhK4f8gCz6b7iI138/VPgttCbqiNMttSqfLZoZ065NrhcwPSJu+lyPWqlu6U1JjgPAmPnqxK+mJ0rPgCnIcdO9jxQa93BAqT5pfzo/FbJ0+6g09QPlQj2DrI95sAjIRUEa9fGhjpG2Qxt8f6feQiEu+jVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CAC51517;
	Sun, 18 Jan 2026 16:00:06 -0800 (PST)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9C013F740;
	Sun, 18 Jan 2026 16:00:11 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rudi Horn <dyn-git@rudi-horn.de>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] sunxi: dram: detect non-power-of-2 sized DRAM chips
Date: Mon, 19 Jan 2026 00:59:05 +0100
Message-ID: <20260118235905.23752-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards feature an "odd" DRAM size, where the total RAM is 1.5GB or
3GB. Our existing DRAM size detection routines can only detect power-of-2
sized configuration, and on those boards the DRAM size is overestimated,
so this typically breaks the boot quite early.

There doesn't seem to be an easy explicit way to detect those odd-sized
chips, but we can test whether the later part of the memory behaves like
memory, by verifying that a written pattern can be read back.
Experiments show that there is no aliasing effect here, as all locations
in the unimplemented range always return some fixed pattern, and cannot
be changed.

Also so far all those boards use a factor of 3 of some lower power-of-2
number, or 3/4th of some higher number. The size detection routine
discovers the higher number, so we can check for some memory cells beyond
75% of the detected size to be legit.

Add a routine the inverts all bits at a given location in memory, and
reads that back to prove that the new value was stored.
Then test the memory cell at exactly 3/4th of the detected size, and cap
the size of the memory to 75% when this test fails. For good measure
also make sure that memory just below the assumed memory end really
works.

This enables boards which ship with such odd memory sizes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

v2 just adds the "positive" check, so whether memory just below 3/4th is
accessible, when the test for above 3/4th failed.
Please test if you have a board with such "odd"-sized DRAM.

Cheers,
Andre

 arch/arm/include/asm/arch-sunxi/dram.h |  1 +
 arch/arm/mach-sunxi/dram_dw_helpers.c  | 22 +++++++++++++++++++++-
 arch/arm/mach-sunxi/dram_helpers.c     | 12 ++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram.h b/arch/arm/include/asm/arch-sunxi/dram.h
index 0eccb1e6c28..59e2e980bfa 100644
--- a/arch/arm/include/asm/arch-sunxi/dram.h
+++ b/arch/arm/include/asm/arch-sunxi/dram.h
@@ -45,5 +45,6 @@ unsigned long sunxi_dram_init(void);
 void mctl_await_completion(u32 *reg, u32 mask, u32 val);
 bool mctl_mem_matches(u32 offset);
 bool mctl_mem_matches_base(u32 offset, ulong base);
+bool mctl_check_memory(phys_addr_t addr);
 
 #endif /* _SUNXI_DRAM_H */
diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunxi/dram_dw_helpers.c
index 24767354935..d2af2d57fde 100644
--- a/arch/arm/mach-sunxi/dram_dw_helpers.c
+++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
@@ -143,8 +143,28 @@ void mctl_auto_detect_dram_size(const struct dram_para *para,
 
 unsigned long mctl_calc_size(const struct dram_config *config)
 {
+	unsigned long size;
 	u8 width = config->bus_full_width ? 4 : 2;
 
 	/* 8 banks */
-	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
+	size = (1ULL << (config->cols + config->rows + 3)) * width *
+		config->ranks;
+
+	/*
+	 * There are boards with non-power-of-2 sized DRAM chips, like 1.5GB
+	 * or 3GB. They are detected as the larger power-of-2 (2GB and 4GB),
+	 * so test the last quarter for being able to store values.
+	 */
+	if (!mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
+		if (mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64)) {
+			size = (size / 4) * 3;
+			debug("capping memory at %ld MB\n", size >> 20);
+		} else {
+			printf("DRAM test failure at address 0x%lx\n",
+			       CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64);
+			return 0;
+		}
+	}
+
+	return size;
 }
diff --git a/arch/arm/mach-sunxi/dram_helpers.c b/arch/arm/mach-sunxi/dram_helpers.c
index 83dbe4ca98f..376b7d14f86 100644
--- a/arch/arm/mach-sunxi/dram_helpers.c
+++ b/arch/arm/mach-sunxi/dram_helpers.c
@@ -62,3 +62,15 @@ bool mctl_mem_matches(u32 offset)
 	return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
 }
 #endif
+
+bool mctl_check_memory(phys_addr_t addr)
+{
+	uint32_t orig, val;
+
+	orig = readl(addr);
+	writel(~orig, addr);
+	val = readl(addr);
+	writel(orig, addr);
+
+	return ~orig == val;
+}
-- 
2.46.4

