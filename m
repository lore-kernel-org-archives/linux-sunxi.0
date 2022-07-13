Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD8646A7
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 15:28:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 862E41C01;
	Wed, 13 Jul 2022 08:28:06 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CAC3F73D;
	Wed, 13 Jul 2022 08:28:05 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 1/3] sunxi: armv8: fel: load only 32-bit values
Date: Wed, 13 Jul 2022 16:27:56 +0100
Message-Id: <20220713152758.56929-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713152758.56929-1-andre.przywara@arm.com>
References: <20220713152758.56929-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the values and the MMIO addresses that we need during the 64-bit FEL
restore are smaller than 2^32, so we don't need to do any 64-bit loads.

Change the loads to only load 32 bits worth of data, that saves us some
bytes for storing the values.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/cpu/armv8/fel_utils.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/cpu/armv8/fel_utils.S b/arch/arm/cpu/armv8/fel_utils.S
index 5266515f14..2fe38a1a04 100644
--- a/arch/arm/cpu/armv8/fel_utils.S
+++ b/arch/arm/cpu/armv8/fel_utils.S
@@ -39,15 +39,15 @@ ENTRY(return_to_fel)
 	adr	x1, fel_stash_addr	// to find the fel_stash address in AA32
 	str	w2, [x1]
 
-	ldr	x0, =0xfa50392f		// CPU hotplug magic
+	ldr	w0, =0xfa50392f		// CPU hotplug magic
 #ifdef CONFIG_MACH_SUN50I_H616
-	ldr	x2, =(SUNXI_R_CPUCFG_BASE + 0x1c0)
+	ldr	w2, =(SUNXI_R_CPUCFG_BASE + 0x1c0)
 	str	w0, [x2], #0x4
 #elif CONFIG_MACH_SUN50I_H6
-	ldr	x2, =(SUNXI_RTC_BASE + 0x1b8)	// BOOT_CPU_HP_FLAG_REG
+	ldr	w2, =(SUNXI_RTC_BASE + 0x1b8)	// BOOT_CPU_HP_FLAG_REG
 	str	w0, [x2], #0x4
 #else
-	ldr	x2, =(SUNXI_CPUCFG_BASE + 0x1a4) // offset for CPU hotplug base
+	ldr	w2, =(SUNXI_CPUCFG_BASE + 0x1a4) // offset for CPU hotplug base
 	str	w0, [x2, #0x8]
 #endif
 	adr	x0, back_in_32
-- 
2.25.1

