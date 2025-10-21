Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E012C0F83
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Oct 2025 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090857; cv=none; b=AdDyklsUqjGcX8ncfOCRa+0zF3AaAtutHcSv0ZWwpgrqgn71BP9oCS0T3rww68NlO6FwRLEvg5R74Ve2vOKHT4PaUh+YJpNkqMZ59zyfjwZaEJT4N1lo7OEhbfZJq3AlGdJu/RqW4BPm/pu6w+krP8CFMfQ6sirgo0rFwaZvu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090857; c=relaxed/simple;
	bh=IS65v84jBDq+naEks7uPZUnSShg7OV+biWQlaPBJhq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u62IsvQx9r0oS5VnocE/xelV9FZoIQMWPHNTveNLbC1s4rBU6+Kqof+eKTrJ6x93jF6U+mEgTJbYRAuV9zA8tr0JBsEqXIdMr0sbk9qRMqZnnnGBtQPtYl24ePYbRth0B8sp97g2GYI8BBIu5vFxLCW/iwnUM3BsT983ERDE99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6505E1063;
	Tue, 21 Oct 2025 16:54:05 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79CDE3F66E;
	Tue, 21 Oct 2025 16:54:12 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rudi Horn <dyn-git@rudi-horn.de>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: dram: detect non-power-of-2 sized DRAM chips
Date: Wed, 22 Oct 2025 00:53:34 +0100
Message-ID: <20251021235334.7557-1-andre.przywara@arm.com>
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
the size of the memory to 75% when this test fails.

This enables boards which ship with such odd memory sizes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

I don't really have a board with such an odd size to test that, though the
function worked on a 12GB A733 board. But that's not supporting the SPL
or any kind of DRAM init yet, so was tested out of context.
I would be grateful if anyone with a 1.5GB or 3GB board could test this.

Thanks,
Andre

 arch/arm/include/asm/arch-sunxi/dram.h |  1 +
 arch/arm/mach-sunxi/dram_dw_helpers.c  | 16 +++++++++++++++-
 arch/arm/mach-sunxi/dram_helpers.c     | 12 ++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

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
index 24767354935..14f6b24c30f 100644
--- a/arch/arm/mach-sunxi/dram_dw_helpers.c
+++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
@@ -143,8 +143,22 @@ void mctl_auto_detect_dram_size(const struct dram_para *para,
 
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
+		size = (size / 4) * 3;
+		debug("capping memory at %ld MB\n", size >> 20);
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

