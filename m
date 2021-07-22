Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9729D6
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:02 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935447tympp7jf
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:45 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: UIkxF7XA8bC3xmJedzJvBHW9cuCmyChnv0H8ggIVhCAzAlystGLPc4+lXCw2U
	KuXw3lmWhsnjHzoscMtIlUT5CEJ81z2h2qJRfiBsYLBxbfbtVoB4Lh02p66lyATiR5Mk0ON
	i7HvOIEsrfdVdT48LsGXaFcsHBZOU93Umylt4TiphppZYD7IhyhSeMZM9wY7ZY2dLkiM/O+
	qyC2klUUSVVzkfr6jyaKpztpiDiJi6Lol2qAVzt5IH09W1wsgSuc3XVmW2FzUq9nzPAI4sF
	oMQJBnX6dFwU0DhC5jKlCAfu6DdLQLE5LzfvO1CTg9LBCusmMhIWVgEtGxm480UC6F1zrrT
	vl6Eg+aNTRzcqTaEOcGmpP/6+N5Dg==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 08/13] sunxi: add Kconfig option for R329
Date: Thu, 22 Jul 2021 14:30:10 +0800
Message-Id: <20210722063015.421923-9-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam3

As most code are ready for basic R329 support, let's add a Kconfig
option for it.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/mach-sunxi/Kconfig    | 14 +++++++++++++-
 arch/arm/mach-sunxi/cpu_info.c |  2 ++
 common/spl/Kconfig             |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index c9bb47a8bd..9d3ec82497 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -128,6 +128,7 @@ config SUN8I_RSB
 config SUNXI_SRAM_ADDRESS
 	hex
 	default 0x10000 if MACH_SUN9I || MACH_SUN50I || MACH_SUN50I_H5
+	default 0x100000 if MACH_SUN50I_R329
 	default 0x20000 if SUN50I_GEN_H6
 	default 0x0
 	---help---
@@ -371,6 +372,12 @@ config MACH_SUN50I_H616
 	select DRAM_SUN50I_H616
 	select SUN50I_GEN_H6
 
+config MACH_SUN50I_R329
+	bool "sun50i (Allwinner R329)"
+	select ARM64
+	select DRAM_SUN50I_R329
+	select SUN50I_GEN_H6
+
 endchoice
 
 # The sun8i SoCs share a lot, this helps to avoid a lot of "if A23 || A33"
@@ -420,7 +427,8 @@ config SUNXI_DRAM_LPDDR3
 
 choice
 	prompt "DRAM Type and Timing"
-	default SUNXI_DRAM_DDR3_1333 if !MACH_SUN8I_V3S
+	default SUNXI_DRAM_DDR3_1333 if !MACH_SUN8I_V3S && !MACH_SUN50I_R329
+	default SUNXI_DRAM_DDR3_R329 if MACH_SUN50I_R329
 	default SUNXI_DRAM_DDR2_V3S if MACH_SUN8I_V3S
 
 config SUNXI_DRAM_DDR3_1333
@@ -488,6 +496,7 @@ config DRAM_CLK
 		       MACH_SUN8I_V3S
 	default 672 if MACH_SUN50I
 	default 744 if MACH_SUN50I_H6
+	default 775 if MACH_SUN50I_R329
 	default 720 if MACH_SUN50I_H616
 	---help---
 	Set the dram clock speed, valid range 240 - 480 (prior to sun9i),
@@ -510,6 +519,7 @@ config DRAM_ZQ
 		       MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_A83T
 	default 127 if MACH_SUN7I
 	default 14779 if MACH_SUN8I_V3S
+	default 3067 if MACH_SUN50I_R329
 	default 3881979 if MACH_SUNXI_H3_H5 || MACH_SUN8I_R40 || MACH_SUN50I_H6
 	default 4145117 if MACH_SUN9I
 	default 3881915 if MACH_SUN50I
@@ -616,6 +626,7 @@ config SYS_CLK_FREQ
 	default 1008000000 if MACH_SUN9I
 	default 888000000 if MACH_SUN50I_H6
 	default 1008000000 if MACH_SUN50I_H616
+	default 1008000000 if MACH_SUN50I_R329
 
 config SYS_CONFIG_NAME
 	default "sun4i" if MACH_SUN4I
@@ -627,6 +638,7 @@ config SYS_CONFIG_NAME
 	default "sun50i" if MACH_SUN50I
 	default "sun50i" if MACH_SUN50I_H6
 	default "sun50i" if MACH_SUN50I_H616
+	default "sun50i" if MACH_SUN50I_R329
 
 config SYS_BOARD
 	default "sunxi"
diff --git a/arch/arm/mach-sunxi/cpu_info.c b/arch/arm/mach-sunxi/cpu_info.c
index ba33ef2430..8021f4c307 100644
--- a/arch/arm/mach-sunxi/cpu_info.c
+++ b/arch/arm/mach-sunxi/cpu_info.c
@@ -101,6 +101,8 @@ int print_cpuinfo(void)
 	puts("CPU:   Allwinner H6 (SUN50I)\n");
 #elif defined CONFIG_MACH_SUN50I_H616
 	puts("CPU:   Allwinner H616 (SUN50I)\n");
+#elif defined CONFIG_MACH_SUN50I_R329
+	puts("CPU:   Allwinner R329 (SUN50I)\n");
 #else
 #warning Please update cpu_info.c with correct CPU information
 	puts("CPU:   SUNXI Family\n");
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index 2df3e5d869..ed4477ff93 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -150,6 +150,7 @@ config SPL_TEXT_BASE
 	hex "SPL Text Base"
 	default ISW_ENTRY_ADDR if AM43XX || AM33XX || OMAP54XX || ARCH_KEYSTONE
 	default 0x10060 if MACH_SUN50I || MACH_SUN50I_H5 || MACH_SUN9I
+	default 0x100060 if MACH_SUN50I_R329
 	default 0x20060 if SUN50I_GEN_H6
 	default 0x00060 if ARCH_SUNXI
 	default 0xfffc0000 if ARCH_ZYNQMP
-- 
2.30.2

