Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9F11E04AC
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 01:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078430; cv=none; b=ecmwog14G+jOQcsWB9rKp2bql4aFW/PbxF+i4vwCBhCS3XC11WDs9aG45DNlhfs74vomb7aI4WlImKPrl8rnAkYNTnEfqrcCkvBY0UgrbdW6kg+hKSESfalgXu33tqI7cDm2lfPeRrgGrTUhIpM7Pi1RfHxWovjwy8kTtN/uWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078430; c=relaxed/simple;
	bh=IHxilmlXmr+G0gvxxFdININkpAv9oZvEurOI/n9aWXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pmv0BQiYfZxkFNnNMuUcEFbVQM3slBL8DVGXPSXqZfbqsx3ogK8UY3NMGuMm2Pg+IOqDRgwUU2Yh6eZnctceYtjQV4yWLCGlZx7lOX883i9UHKdWFpkJAnrWujs10v1i7mBVunnpOYBqcILpoeQCHLf/1TobaYu+VTS2Z+AaSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3669616F2;
	Thu, 16 Jan 2025 17:47:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 643F43F673;
	Thu, 16 Jan 2025 17:47:05 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Simon Glass <sjg@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Parthiban <parthiban@linumiz.com>
Subject: [PATCH 1/8] sunxi: clock: improve grouping of default clock register values
Date: Fri, 17 Jan 2025 01:45:30 +0000
Message-ID: <20250117014537.22513-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20250117014537.22513-1-andre.przywara@arm.com>
References: <20250117014537.22513-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With each new SoC added to the clock_sun50i_h6.h header file, we add a
list of default values for the bus clock registers. This list gets a bit
hard to read, as the spacing between the lines looks confusing.

Tighten the lines by removing empty lines, to make it more obvious which
values belong together. Also remove those comments that were more or
less duplicating the next code line, and didn't add any information.

This makes it easier to find existing values and to add support for new
SoCs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h   | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index a84a57e5b41..76dd33c9477 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -267,31 +267,23 @@ struct sunxi_ccm_reg {
 #define CCM_CPU_AXI_DEFAULT_FACTORS	0x301
 
 #ifdef CONFIG_MACH_SUN50I_H6				/* H6 */
-#define CCM_PLL6_DEFAULT		0xa0006300
 
-/* psi_ahb1_ahb2 bit field */
+#define CCM_PLL6_DEFAULT		0xa0006300
 #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000102
-
-/* ahb3 bit field */
 #define CCM_AHB3_DEFAULT		0x03000002
-
-/* apb1 bit field */
 #define CCM_APB1_DEFAULT		0x03000102
+
 #elif CONFIG_MACH_SUN50I_H616				/* H616 */
-#define CCM_PLL6_DEFAULT		0xa8003100
 
-/* psi_ahb1_ahb2 bit field */
+#define CCM_PLL6_DEFAULT		0xa8003100
 #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
-
-/* ahb3 bit field */
 #define CCM_AHB3_DEFAULT		0x03000002
-
-/* apb1 bit field */
 #define CCM_APB1_DEFAULT		0x03000102
+
 #elif CONFIG_MACH_SUN8I_R528				/* R528 */
+
 #define CCM_PLL6_DEFAULT		0xe8216300
 #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
-//#define CCM_AHB3_DEFAULT		0x03000002
 #define CCM_APB1_DEFAULT		0x03000102
 #endif
 
-- 
2.46.2

