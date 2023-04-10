Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A28D2580
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ga37so11156582ejc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCoCw1m+fd3QY4SRCXD/tYx9FrZaXFRerbTr6gPNjmA=;
        b=ie+m0zdSEq7WCHFmyP1kp2txApqQ+oqFWYPvVr4Et4tc9nOuCr6/5blMi02dvngXF/
         T/SF79KZ0Iao2wdqYsZ6HKwqeqpwvTOH27mc3+oBUWrJlcet5t1BITn08sX7cCcUDaKW
         qo+Iazlh+Pz9CluDOWVWjt/ez8I3NwXwAeR+J5egpVpZK12TgEe7rVdmKyOwAD/Pyw8e
         re1Z/0ZAnvnciURsC4xIojt+j6PkvZ7vj/TomkE+/YJDyxWvwOxKuiwvUINwpmihZNjE
         nSYkYM6hC6Rn4sxauqHVPcBermCuuKYjJNvwWH5mwoXUp914P6V7LcpFrmSsMHPHBmNl
         3FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCoCw1m+fd3QY4SRCXD/tYx9FrZaXFRerbTr6gPNjmA=;
        b=PXHDkfYSYnHG7tWegOTZiRE0NB+46cgVXiiK+GOkxtUAGiX+coJW89qhMD1t5RzBvN
         KqjaRXiRF+DsfcVoDSnAzZ6dNdv4cCgZ0n4epD26lyaR93sGfbBpvCx4gCGRCQ7XCcow
         sKD4GJ2umxojTmO2I9f7pfYwwRgyR/CrSyzS6lTcZ85UgGPU20BvkF4me0X/eINufEV9
         ytzNRYd4HsBrvc3qxUFNhXiyCTRusWGL6CSmq7AoGkbIrSwcDm3Ij8eZt5RgwzJsqLD5
         R2wl5s/dXdzG6G7aNirZ8yY62ao5+cA6+LTlBKajrN8YcdIpxNgnTIe4jxhBTCeOlnlS
         OZ+g==
X-Gm-Message-State: AAQBX9fzs9T+zz3fa5kbLksm8nKsg/7QuaELOu/pjQQX9KmTKmWAb47Y
	NYexZGFW+YldzYunVmQNd6I=
X-Google-Smtp-Source: AKy350a7ODbT9lD5BkOayjdRvpmnRqhB0VQkANJuzyScvZzfu7RzeXbvZC0cuSk+Rv+PG7EdgydxaA==
X-Received: by 2002:a17:907:20f4:b0:92b:f118:ef32 with SMTP id rh20-20020a17090720f400b0092bf118ef32mr5309516ejb.48.1681114886231;
        Mon, 10 Apr 2023 01:21:26 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 03/10] sunxi: parameterize H616 DRAM ODT values
Date: Mon, 10 Apr 2023 10:21:12 +0200
Message-Id: <20230410082119.24616-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410082119.24616-1-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While ODT values for same memory type are similar, they are not
necessary the same. Let's parameterize them and make parameter same as
in vendor DRAM settings. That way it will be easy to introduce new board
support.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_sun50i_h616.h |  3 +
 arch/arm/mach-sunxi/Kconfig                   | 15 +++++
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 59 ++++++++++++-------
 configs/orangepi_zero2_defconfig              |  3 +
 configs/x96_mate_defconfig                    |  3 +
 5 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
index 134679d55205..c9e1f84bfcdd 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
@@ -144,6 +144,9 @@ struct dram_para {
 	u8 rows;
 	u8 ranks;
 	u8 bus_full_width;
+	u32 dx_odt;
+	u32 dx_dri;
+	u32 ca_dri;
 };
 
 
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6417aee944bc..14fb9a95905a 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -83,6 +83,21 @@ config DRAM_SUN50I_H616_UNKNOWN_FEATURE
 	---help---
 	  Select this when DRAM on your H616 board needs this unknown
 	  feature.
+
+config DRAM_SUN50I_H616_DX_ODT
+	hex "H616 DRAM DX ODT parameter"
+	help
+	  DX ODT value from vendor DRAM settings.
+
+config DRAM_SUN50I_H616_DX_DRI
+	hex "H616 DRAM DX DRI parameter"
+	help
+	  DX DRI value from vendor DRAM settings.
+
+config DRAM_SUN50I_H616_CA_DRI
+	hex "H616 DRAM CA DRI parameter"
+	help
+	  CA DRI value from vendor DRAM settings.
 endif
 
 config SUN6I_PRCM
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 49983bf7a1b8..06a07dfbf9cc 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -234,37 +234,49 @@ static const u8 phy_init[] = {
 	0x09, 0x05, 0x18
 };
 
-static void mctl_phy_configure_odt(void)
+static void mctl_phy_configure_odt(struct dram_para *para)
 {
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x388);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x38c);
+	unsigned int val;
 
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x3c8);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x3cc);
+	val = para->dx_dri & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x388);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x38c);
 
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x408);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x40c);
+	val = (para->dx_dri >> 8) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c8);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3cc);
 
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x448);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x44c);
+	val = (para->dx_dri >> 16) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x408);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x40c);
 
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x340);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x344);
+	val = (para->dx_dri >> 24) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x448);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x44c);
 
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x348);
-	writel_relaxed(0xe, SUNXI_DRAM_PHY0_BASE + 0x34c);
+	val = para->ca_dri & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x340);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x344);
 
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x380);
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x384);
+	val = (para->ca_dri >> 8) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x348);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x34c);
 
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x3c0);
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x3c4);
+	val = para->dx_odt & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x380);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x384);
 
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x400);
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x404);
+	val = (para->dx_odt >> 8) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c0);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c4);
 
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x440);
-	writel_relaxed(0x8, SUNXI_DRAM_PHY0_BASE + 0x444);
+	val = (para->dx_odt >> 16) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x400);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x404);
+
+	val = (para->dx_odt >> 24) & 0x1f;
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x440);
+	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x444);
 
 	dmb();
 }
@@ -722,7 +734,7 @@ static bool mctl_phy_init(struct dram_para *para)
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
 
 	if (IS_ENABLED(CONFIG_DRAM_ODT_EN))
-		mctl_phy_configure_odt();
+		mctl_phy_configure_odt(para);
 
 	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
 
@@ -1007,6 +1019,9 @@ unsigned long sunxi_dram_init(void)
 	struct dram_para para = {
 		.clk = CONFIG_DRAM_CLK,
 		.type = SUNXI_DRAM_TYPE_DDR3,
+		.dx_odt = CONFIG_DRAM_SUN50I_H616_DX_ODT,
+		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
+		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
 	};
 	unsigned long size;
 
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 72fc419ca7e4..d70b15a07705 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -6,6 +6,9 @@ CONFIG_DRAM_SUN50I_H616_WRITE_LEVELING=y
 CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
 CONFIG_DRAM_SUN50I_H616_READ_TRAINING=y
 CONFIG_DRAM_SUN50I_H616_WRITE_TRAINING=y
+CONFIG_DRAM_SUN50I_H616_DX_ODT=0x08080808
+CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
+CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index 38b82c3a3ecd..60cc8fbe751c 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -3,6 +3,9 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h616-x96-mate"
 CONFIG_SPL=y
 CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
+CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
+CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
+CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-- 
2.40.0

