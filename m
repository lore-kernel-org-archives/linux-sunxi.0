Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C18C8C7
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Jun 2023 13:55:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f50470d77cso4047117e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Jun 2023 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685800517; x=1688392517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uMJtRJCEoUchF8AhyKudbG8Fza7v+B4MIhhv0odlo4=;
        b=fJuP9hhzghgCjl2gCiS1yYd9RI/O6ZYxBux+Ox9ycDQquA0WCfi7lwunsxlMX0sBNM
         +d8NtSpoUFSd99Ire+Aqs/Fhhy+lLprMI8UpbIjuXgZcDHohYT+X3+xmrA1aT7wgFit/
         HuftDgX+70xBsWHKvDYwLZbP/0SjjiI3zGYcrFopyW+bTAgdS+YbwpiI9fnaFjAmlykc
         SxE9y4MDRdVGoE+6kKSTB41GXw7dC/lh6CU1J3yYhIldHA0vCphOrp1KBv95pl4V354k
         Kbqku1KuStGAcyKXOwfC5444A+FT06c3zjfDOJDwMU8p9fWsPHdet3A3jlftt6R/xmFU
         rzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685800517; x=1688392517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uMJtRJCEoUchF8AhyKudbG8Fza7v+B4MIhhv0odlo4=;
        b=VF02WK4bdldbNUD/qxbwEBCnHgIvceLCQosxlm9tlYx37Z5eb6RQyAvcFjTc6nO7QZ
         Crj7WSlQOzoJg8IVEgPP6Nx2c1YuaklIQAiF/5Xt+pkfGgiaoV432IcEeWiyf1NPmnst
         5zUjCEUc2wNOn6T7vqFoSez+c+qN/fo4YaRtNk2uL2XFW6sjzTbsWbFYBToKXUmaygCO
         QrPCBw8pIX/aIH6uafKnGHXv2wUx9CTg7eldRCaq3+HsUnshPfza31hwC8ljmUy1eaNv
         er9zZ/UQH8UbOQycqq8bEpmsZQD0CDfXBzkJLkfBijC++9tDlHSgZT4Epj4NsCJH8UgI
         2L+A==
X-Gm-Message-State: AC+VfDzBSDnLNVpK/mItwhBNHPtO+cP8iqSFkuOHOO1vYXKCVWQSGbPr
	zcPK0wJPs9v7q215mqrR6BI=
X-Google-Smtp-Source: ACHHUZ5qyMOqkNMCuBQZNPKiYhC+z4hdisBgMTKbzbf+FnZhdZn7vzEKwTc4eoe2MtDxWNCsVuGNpA==
X-Received: by 2002:ac2:4886:0:b0:4f3:85eb:97b1 with SMTP id x6-20020ac24886000000b004f385eb97b1mr3137446lfc.8.1685800517400;
        Sat, 03 Jun 2023 06:55:17 -0700 (PDT)
Received: from SerialExperiment.lan ([46.251.215.215])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b004ec7c0f2178sm494016lfl.63.2023.06.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 06:55:17 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2]  sunxi: H616: add DRAM type selection
Date: Sat,  3 Jun 2023 16:55:05 +0300
Message-Id: <20230603135506.51071-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230603135506.51071-1-iuncuim@gmail.com>
References: <20230603135506.51071-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: iuncuim <iuncuim@gmail.com>

Allwinner H616 SoC supports several types of DRAM memory. To further
integrate other types of memory, we need to add this delimitation.
---
 arch/arm/mach-sunxi/Kconfig               | 12 ++++++++++--
 arch/arm/mach-sunxi/dram_timings/Makefile |  3 +--
 configs/orangepi_zero2_defconfig          |  1 +
 configs/x96_mate_defconfig                |  1 +
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6dcbb096f7..3ad37ef6ba 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -442,7 +442,7 @@ config ARM_BOOT_HOOK_RMR
 	This allows both the SPL and the U-Boot proper to be entered in
 	either mode and switch to AArch64 if needed.
 
-if SUNXI_DRAM_DW || DRAM_SUN50I_H6
+if SUNXI_DRAM_DW || DRAM_SUN50I_H6 || DRAM_SUN50I_H616
 config SUNXI_DRAM_DDR3
 	bool
 
@@ -487,6 +487,14 @@ config SUNXI_DRAM_H6_DDR3_1333
 	This option is the DDR3 timing used by the boot0 on H6 TV boxes
 	which use a DDR3-1333 timing.
 
+config SUNXI_DRAM_H616_DDR3_1333
+	bool "DDR3-1333 boot0 timings on the H616 DRAM controller"
+	select SUNXI_DRAM_DDR3
+	depends on DRAM_SUN50I_H616
+	---help---
+	This option is the DDR3 timing used by the boot0 on H616 TV boxes
+	which use a DDR3-1333 timing.
+
 config SUNXI_DRAM_DDR2_V3S
 	bool "DDR2 found in V3s chip"
 	select SUNXI_DRAM_DDR2
@@ -1075,4 +1083,4 @@ config CHIP_DIP_SCAN
 	select W1_GPIO
 	select W1_EEPROM
 	select W1_EEPROM_DS24XXX
-	select CMD_EXTENSION
+	select CMD_EXTENSION
\ No newline at end of file
diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-sunxi/dram_timings/Makefile
index 39a8756c29..4d78c04c9a 100644
--- a/arch/arm/mach-sunxi/dram_timings/Makefile
+++ b/arch/arm/mach-sunxi/dram_timings/Makefile
@@ -3,5 +3,4 @@ obj-$(CONFIG_SUNXI_DRAM_LPDDR3_STOCK)	+= lpddr3_stock.o
 obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+= ddr2_v3s.o
 obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+= h6_lpddr3.o
 obj-$(CONFIG_SUNXI_DRAM_H6_DDR3_1333)	+= h6_ddr3_1333.o
-# currently only DDR3 is supported on H616
-obj-$(CONFIG_MACH_SUN50I_H616)		+= h616_ddr3_1333.o
+obj-$(CONFIG_SUNXI_DRAM_H616_DDR3_1333)	+= h616_ddr3_1333.o
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 6cb942f511..e38cc20ac7 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -7,6 +7,7 @@ CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
 CONFIG_DRAM_SUN50I_H616_TPR10=0xf83438
 CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index aedb327702..2a326bf202 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -11,6 +11,7 @@ CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
 CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
 CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
 CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
-- 
2.40.1

