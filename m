Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB443E4B0
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142225; cv=none; b=b8rlKGzL1C3x9BS/tqUETd6eiMDpmNr85w37aYQsHkD5kINHCxXdTdsHmao94e44OT7q6i5kcey9sgjQPeFRlUwrSklephje7Ym9gJIyGAIxYXi6OlJjlLoZNcw9HpRihpYk2stw+pc3TFdDrQ73g6pcCdmltIq9iT0dWxiZSBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142225; c=relaxed/simple;
	bh=Ifbyio3c3i98SGgUP6c8F0DhtgS7RsGBfozDg9MTn+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxYF1sAPV03Af1vx7cBGdzJpAbRAbNhyAH1TJAzF0H8cdRJLrxWxqFXsEwYK6mKnApkJEviyJaQlfSX/s32o6m8fMVOxmXd8irJSu6Cj77tNlNoAutQxHIVOIZdBPbCuBD0rlFPYckarx9So+zAqTO34P3UyQmP02mZxawGRwPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9865AZ+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9865AZ+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso58201475e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142220; x=1792747020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kk7HOnRLnBu9xh7gP1Xg9Ul+E0GB0GrdeLhfGQE8DU=;
        b=m9865AZ+IitnNE2JxPKOmoQFoWqOZDJpy2BwjHTmrKQQousP0ydm5KtMllCDXCLIjh
         YHx9dW0y6lb3jq+PnNQzm5O97V7/pwMNG8sUnuE0HqaOAliA4vyh1V6dtLx3Mr13sZtf
         2hLmUToIAdZA/dW7l9xa5ZzvH+PCRqYjCfwXeUJzcAMIVAOdScaPZmNbFF+30h9LDMjB
         DfidOiBG+1/y3KwV+MIR5Gictj4TBZ9+TxLUiwkhEAaphP52C+ZYLlxJMQk10w3EWTvV
         XER8AxNZr6mReeM5j/AftqC78yxksBfIAhgDdxPlksOiYseOfHRIr3bSzx3lCqnYRTNt
         d/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142220; x=1792747020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kk7HOnRLnBu9xh7gP1Xg9Ul+E0GB0GrdeLhfGQE8DU=;
        b=FE+kPh0XWQtmuS0L7dctod9V+Jo2cv/y22YgMHIh/JhLCgMACsosmZj7TE79+UITw/
         V2W7JQQTFjZMbj/5cHpbMg9IlFZT18sCGJCBB/TlCiukg4RQh9vZIrVhDS4i29yS/RF9
         l074/KWNnucUIp24Vq+GHsEzslloy+hKMF5qWxlz/e8/fgz82AurqfCNsQYiZFk/q86R
         ZSrs5UcsPWacqUFbvR0ly5c3eK4KbxLkx4/K67A4KoE+0QitB/E+3KjOxOA+FMQDUbO8
         qabBOfEJDVAb3eoRD7zbbHCSgtlNTTMq5hmdDdhnr0fETlnR6oEgCHwVFYYfUdYx1+RA
         iGxg==
X-Forwarded-Encrypted: i=1; AKwUvBxbJrkAN2aWZop4aW8ZSEGGNm55eGG9Po8n6yRXBgSGXKHKmh/syY0HHOW44/E81EIZqJQoGrmkugOhsA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI44xmAtd5k90TocEF21me9JeNnbrQjqVUMEaTxuc1hem4PHVYd
	KHbSWkx+fMc6MnlqTQAcX4zJehq49qM3SfJjlKG2cG0qLVN1+wRomwik
X-Gm-Gg: AYBFou3XSsofy9RpbvdCPuxFgd1ebKCFj2Lv+L9G9DCQRy81EkZfveSmvo8l8Hf80Al
	TESEQuRDpwlZzAJv49kxNVHpGti5fPq3ncFMh3yXUeg/BI2N4/L+fh0tXxOJryUx5A1o0XARd7X
	vnXRfUjfqodRQD6mml/dBOs2TN9TnUoRYOZhOPvnTrKDvhTeQxJXbm1eWvEPXD24GjQBs0B2XLl
	8Gk7DSh8nUaRtP9Wixdn7XRYscCzzEqMqX3qfn9q6TRlakktW7s9bG8LkrESkxJeQDz4TMfsBJN
	IiPPMVZyczOIFHhCcDzgsiSiXpgxSzLaxx/FmQC6yiuG4WR8Hc2wQn1oBTjMwmaPx7mf2FmaiY6
	THcoFoHswD8ZFvaydDfIorUK0ryXOE6ipcmg1hsjrvbqcseeBqh6b7frsxF/0pKkgi7Us/jCM7d
	RaHjanRzMvKbSB9oYHqpdddBICQmF1QaFcKncDOGY5aucI/YIVXOs4/b4Gs7mxFkMcWSNisQ==
X-Received: by 2002:a05:600c:820c:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a18e4d5563mr430330745e9.22.1792142219904;
        Fri, 16 Oct 2026 02:16:59 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:16:49 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH 1/7] sunxi: add support for the Allwinner B288
Date: Fri, 16 Oct 2026 10:16:02 +0100
Message-ID: <20261016091608.121842-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
References: <20261016091608.121842-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 is a dual Cortex-A7 SoC of the sun8i family, used in e-readers.
Its memory map follows the H3, but the RTC, CPUCFG and SID sit where the
A20 has them, and there is no SRAM A2.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/cpu/armv7/sunxi/psci.c             |  9 +++++++--
 arch/arm/include/asm/arch-sunxi/cpu.h       |  1 +
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h | 16 +++++++++++++---
 arch/arm/mach-sunxi/Kconfig                 | 13 +++++++++++++
 arch/arm/mach-sunxi/board.c                 |  4 ++++
 arch/arm/mach-sunxi/clock_sun6i.c           |  1 +
 arch/arm/mach-sunxi/cpu_info.c              |  2 ++
 include/sunxi_gpio.h                        |  1 +
 8 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/arch/arm/cpu/armv7/sunxi/psci.c b/arch/arm/cpu/armv7/sunxi/psci.c
index 4c30f3294b7..18a93546f16 100644
--- a/arch/arm/cpu/armv7/sunxi/psci.c
+++ b/arch/arm/cpu/armv7/sunxi/psci.c
@@ -53,6 +53,7 @@
  * CPU state, rather than the older CPUCFG system.
  */
 #define SUN8I_R528_SOFT_ENTRY			(0x1c8)
+#define SUN8I_B288_SOFT_ENTRY			(0x1e4)
 #define SUN8I_R528_C0_RST_CTRL			(0x0000)
 #define SUN8I_R528_C0_CTRL_REG0			(0x0010)
 #define SUN8I_R528_C0_CPU_STATUS		(0x0080)
@@ -126,6 +127,9 @@ static void __secure sunxi_cpu_set_entry(int __always_unused cpu, void *entry)
 	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
 		writel((u32)entry,
 		       SUNXI_R_CPUCFG_BASE + SUN8I_R528_SOFT_ENTRY);
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_B288)) {
+		/* the B288 BROM takes the secondary entry from the RTC */
+		writel((u32)entry, SUNXI_RTC_BASE + SUN8I_B288_SOFT_ENTRY);
 	} else {
 		writel((u32)entry, SUNXI_CPUCFG_BASE + SUNXI_PRIV0);
 	}
@@ -144,8 +148,9 @@ static void __secure sunxi_cpu_set_power(int cpu, bool on)
 	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R40)) {
 		clamp = (void *)SUNXI_CPUCFG_BASE + SUN8I_R40_PWR_CLAMP(cpu);
 		pwroff = (void *)SUNXI_CPUCFG_BASE + SUN8I_R40_PWROFF;
-	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528)) {
-		/* R528 leaves both cores powered up, manages them via reset */
+	} else if (IS_ENABLED(CONFIG_MACH_SUN8I_R528) ||
+		   IS_ENABLED(CONFIG_MACH_SUN8I_B288)) {
+		/* Both leave the cores powered and manage them via reset */
 		return;
 	} else {
 		if (IS_ENABLED(CONFIG_MACH_SUN6I) ||
diff --git a/arch/arm/include/asm/arch-sunxi/cpu.h b/arch/arm/include/asm/arch-sunxi/cpu.h
index 768c6572d6b..7515d98959d 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu.h
@@ -21,5 +21,6 @@
 #define SOCID_V3S	0x1681
 #define SOCID_H5	0x1718
 #define SOCID_R40	0x1701
+#define SOCID_B288	0x1699
 
 #endif /* _SUNXI_CPU_H */
diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h b/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
index f023a4cfd93..559544daf58 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
@@ -13,7 +13,8 @@
 
 #if defined(CONFIG_SUNXI_GEN_SUN6I) && \
     !defined(CONFIG_MACH_SUN8I_R40) && \
-    !defined(CONFIG_MACH_SUN8I_V3S)
+    !defined(CONFIG_MACH_SUN8I_V3S) && \
+    !defined(CONFIG_MACH_SUN8I_B288)
 #define SUNXI_SRAM_A2_BASE		0x00040000
 #ifdef CONFIG_MACH_SUN8I_H3
 #define SUNXI_SRAM_A2_SIZE		(48 * 1024)	/* 16+32 kiB */
@@ -77,6 +78,9 @@ defined(CONFIG_MACH_SUN50I)
 /* SID address space starts at 0x01c1400, but e-fuse is at offset 0x200 */
 #define SUNXI_SIDC_BASE			0x01c14000
 #define SUNXI_SID_BASE			0x01c14200
+#elif defined(CONFIG_MACH_SUN8I_B288)
+/* The H3's SID address, but with the e-fuse at offset 0, as on the A10 */
+#define SUNXI_SID_BASE			0x01c14000
 #else
 #define SUNXI_SID_BASE			0x01c23800
 #endif
@@ -86,7 +90,8 @@ defined(CONFIG_MACH_SUN50I)
 #define SUNXI_TP_BASE			0x01c25000
 #define SUNXI_PMU_BASE			0x01c25400
 
-#if defined CONFIG_MACH_SUN7I || defined CONFIG_MACH_SUN8I_R40
+#if defined CONFIG_MACH_SUN7I || defined CONFIG_MACH_SUN8I_R40 || \
+    defined CONFIG_MACH_SUN8I_B288
 #define SUNXI_CPUCFG_BASE		0x01c25c00
 #endif
 
@@ -144,12 +149,17 @@ defined(CONFIG_MACH_SUN50I)
 #define SUNXI_HDMI_BASE			0x01ee0000
 #endif
 
+#ifdef CONFIG_MACH_SUN8I_B288
+#define SUNXI_RTC_BASE			0x01c20400
+#else
 #define SUNXI_RTC_BASE			0x01f00000
+#endif
 #define SUNXI_PRCM_BASE			0x01f01400
 
 #if defined CONFIG_SUNXI_GEN_SUN6I && \
     !defined CONFIG_MACH_SUN8I_A83T && \
-    !defined CONFIG_MACH_SUN8I_R40
+    !defined CONFIG_MACH_SUN8I_R40 && \
+    !defined CONFIG_MACH_SUN8I_B288
 #define SUNXI_CPUCFG_BASE		0x01f01c00
 #endif
 
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index b0c5d3cd903..ed2402f71f2 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -490,6 +490,18 @@ config MACH_SUN8I_R528
 	select DRAM_SUN20I_D1
 	imply OF_UPSTREAM
 
+config MACH_SUN8I_B288
+	bool "sun8i (Allwinner B288)"
+	select CPU_V7A
+	select CPU_V7_HAS_NONSEC
+	select CPU_V7_HAS_VIRT
+	select ARCH_SUPPORT_PSCI
+	select SUNXI_GEN_SUN6I
+	select SUNXI_DRAM_DW
+	select SUNXI_DRAM_DW_32BIT
+	select SUPPORT_SPL
+	imply OF_UPSTREAM
+
 config MACH_SUN8I_V3S
 	bool "sun8i (Allwinner V3/V3s/S3/S3L)"
 	select CPU_V7A
@@ -579,6 +591,7 @@ config MACH_SUN8I
 	default y if MACH_SUNXI_H3_H5
 	default y if MACH_SUN8I_R40
 	default y if MACH_SUN8I_V3S
+	default y if MACH_SUN8I_B288
 
 config RESERVE_ALLWINNER_BOOT0_HEADER
 	bool "reserve space for Allwinner boot0 header"
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 432b1c10f92..c2b01896da9 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -153,6 +153,10 @@ static int gpio_init(void)
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(8), SUN8I_V3S_GPB_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_V3S_GPB_UART0);
 	sunxi_gpio_set_pull(SUNXI_GPB(9), SUNXI_GPIO_PULL_UP);
+#elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN8I_B288)
+	sunxi_gpio_set_cfgpin(SUNXI_GPB(4), SUN8I_B288_GPB_UART0);
+	sunxi_gpio_set_cfgpin(SUNXI_GPB(5), SUN8I_B288_GPB_UART0);
+	sunxi_gpio_set_pull(SUNXI_GPB(5), SUNXI_GPIO_PULL_UP);
 #elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN9I)
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
diff --git a/arch/arm/mach-sunxi/clock_sun6i.c b/arch/arm/mach-sunxi/clock_sun6i.c
index 657736c7ac2..d8e549a0adb 100644
--- a/arch/arm/mach-sunxi/clock_sun6i.c
+++ b/arch/arm/mach-sunxi/clock_sun6i.c
@@ -305,6 +305,7 @@ void clock_set_pll10(unsigned int clk)
 
 #if defined(CONFIG_MACH_SUN8I_A33) || \
     defined(CONFIG_MACH_SUN8I_R40) || \
+    defined(CONFIG_MACH_SUN8I_B288) || \
     defined(CONFIG_MACH_SUN50I)
 void clock_set_pll11(unsigned int clk, bool sigma_delta_enable)
 {
diff --git a/arch/arm/mach-sunxi/cpu_info.c b/arch/arm/mach-sunxi/cpu_info.c
index c3a51d9956e..7c04105ad6d 100644
--- a/arch/arm/mach-sunxi/cpu_info.c
+++ b/arch/arm/mach-sunxi/cpu_info.c
@@ -86,6 +86,8 @@ int print_cpuinfo(void)
 	printf("CPU:   Allwinner A33 (SUN8I %04x)\n", sunxi_get_sram_id());
 #elif defined CONFIG_MACH_SUN8I_A83T
 	printf("CPU:   Allwinner A83T (SUN8I %04x)\n", sunxi_get_sram_id());
+#elif defined CONFIG_MACH_SUN8I_B288
+	printf("CPU:   Allwinner B288 (SUN8I %04x)\n", sunxi_get_sram_id());
 #elif defined CONFIG_MACH_SUN8I_H3
 	printf("CPU:   Allwinner H3 (SUN8I %04x)\n", sunxi_get_sram_id());
 #elif defined CONFIG_MACH_SUN8I_R40
diff --git a/include/sunxi_gpio.h b/include/sunxi_gpio.h
index 12b54c8dda4..ad2bd0470f8 100644
--- a/include/sunxi_gpio.h
+++ b/include/sunxi_gpio.h
@@ -116,6 +116,7 @@ enum sunxi_gpio_number {
 #define SUN8I_A33_GPB_UART0	3
 #define SUN8I_A83T_GPB_UART0	2
 #define SUN8I_V3S_GPB_UART0	3
+#define SUN8I_B288_GPB_UART0	2
 #define SUN50I_GPB_UART0	4
 
 #define SUNXI_GPC_NAND		2
-- 
2.52.0

