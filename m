Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4493FEAF1
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092306; cv=none; b=izfuMt7hBAUTeXki1SvEGUXZ3IEKO6paOaSRGDLgE/T5PdYwSJAAUZ9oNJgT05gmXvh/lXvZm//ROqxZylvRCDZg/rv8KAhn7NwyVHGyHtHrHiZZZ88QUxSKeMaeIo41ovy8SBUAZ+qPRuV4AtA+Ax5bSYAHpWNDq2v21Pp/alA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092306; c=relaxed/simple;
	bh=8erzWeX3W5yF9GoTHi2946C64Fdjb1scwmkoB3lMEoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lywV6plJODp4Kc9W4vu2rfrIcO30QP9p5QyEKQND3Cij5ENqOyiAEsLNDhHCFllToFQCPTdXd/EAzqwHXu1V8mfvHdvEZpcQuKu72nIR6JRrhP7vaSp1JWZV2iewrvHBu99ZoWuLASYbb21UCgSV6IacaMiehudIHzMj9S8XSpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C84D16A3;
	Fri,  1 Aug 2025 16:51:35 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6A83F673;
	Fri,  1 Aug 2025 16:51:42 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] sunxi: a133: dram: fix data type for address variable
Date: Sat,  2 Aug 2025 00:49:16 +0100
Message-ID: <20250801234918.19176-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250801234918.19176-1-andre.przywara@arm.com>
References: <20250801234918.19176-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variables holding addresses are typically using the "long" C type in
U-Boot, to be easily compatible with both 32-bit and 64-bit builds.

The A133 DRAM driver is typically compiled for AArch64, so u64 is the
same type as unsigned long, but that breaks when compiling the DRAM
driver in AArch32 (for some experiments).

Fix the type to make the code more portable.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_a133.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_a133.c b/arch/arm/mach-sunxi/dram_sun50i_a133.c
index 3a231141168..1496f99624d 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_a133.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_a133.c
@@ -416,7 +416,7 @@ static void mctl_com_init(const struct dram_para *para,
 static void mctl_drive_odt_config(const struct dram_para *para)
 {
 	u32 val;
-	u64 base;
+	ulong base;
 	u32 i;
 
 	/* DX drive */
-- 
2.46.3

