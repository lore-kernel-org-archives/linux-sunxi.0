Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1678F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729801; cv=none; b=WznJ/YG9U9dA/BZYSJBkEIWnRCa6ckCtXngNFpaH/q7G932DvM1uDye2Y+2FbjTHBwTybR79y5Sxagab8RaMy6Rs8UtZqUpxGC04GEWTQdVTyOMQEEui2ZIr0twWL5iFxYIknaK1BH2AJyiKifU9+3cNee5rkZ0YUFxXYkrwsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729801; c=relaxed/simple;
	bh=SPn27zbv4GNIXXvZ36wpKaek34uHN+73MmLZ9Ag1k2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIGTioq/Ksv//5QhKQZ3otaF1DLmOGlhw+tTzL+jMILPEwIqHJjwdsBWx+cZpoFfFj2DALU5C0+yt/DmHhclHoBApFgW22fLA1eFjP7QAqsX6FJbm+R5NCMbMnwXRIn9WJwjB7oG7fI/iLY6th56NgZS4k/+qMtk1yPpfsEGlrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD86339;
	Sun, 23 Mar 2025 04:36:46 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3034D3F694;
	Sun, 23 Mar 2025 04:36:39 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 23/34] spl: reorder SPL_MAX_SIZE defaults for sunxi
Date: Sun, 23 Mar 2025 11:35:33 +0000
Message-ID: <20250323113544.7933-24-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the Kconfig defaults for the maximum SPL size, to make the
Allwinner specific values more readable and extensible: many older SoCs
need to be limited to 32KB, so make this the last ARCH_SUNXI entry, used
as a fallback unless explicitly overridden before.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 common/spl/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index 94e118f8465..29d30f5040d 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -80,11 +80,10 @@ config SPL_MAX_SIZE
 	default 0x1b000 if AM33XX && !TI_SECURE_DEVICE
 	default 0xec00 if OMAP34XX
 	default 0x10000 if ARCH_MX6 && !MX6_OCRAM_256KB
-	default 0x7fa0 if SUNXI_SRAM_ADDRESS = 0x10000
-	default 0x7fa0 if SUNXI_SRAM_ADDRESS = 0x20000 && !MACH_SUN50I_H616
 	default 0xbfa0 if MACH_SUN50I_H616
 	default 0x7000 if RCAR_GEN3
 	default 0x5fa0 if SUNXI_SRAM_ADDRESS = 0x0
+	default 0x7fa0 if ARCH_SUNXI
 	default 0x10000 if ASPEED_AST2600
 	default 0x27000 if IMX8MM && SPL_TEXT_BASE = 0x7E1000
 	default 0x30000 if ARCH_SC5XX && (SC59X_64 || SC59X)
-- 
2.46.3

