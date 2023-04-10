Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA18257C
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:31 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id q23so1337429ejz.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw47KLFJI1pI2wP8kBY5dgsWQvdNFi0hkD8LY470L/E=;
        b=UXnroUlnur6QRYQIs7mNv0Nm+Mi/a1mxtQRUfutZnw02vsSTXiZvvkr7flfaJ5ZAoe
         GIksiVEdIrk76xWBcPQUBWKBgesVNA5aLTtOeQCXFkwdSLNw8XtNuiKZn/7d2wGni10l
         KP6XOZ1dy37DXNURJlTJ5cNPUQlIYWc8hYqWomukNJAWERYaEJSb56xnLVL8XjbsHuZa
         iNAj+uL3Px+OjcEfmSRv9AHouqk7F8mrJ9oBPncBtObvb9wvTjouTZylU973JeEBJS9S
         2PD3WcGMMHHK3WbsZz1VR9M44Dfm0rMjQ2EzGNTVg3pmSj2UImsAuVWkOWYfkhgEYzvt
         G5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw47KLFJI1pI2wP8kBY5dgsWQvdNFi0hkD8LY470L/E=;
        b=0dV6AIcX6tpXtyXvmAjbV55vZBAz46RxBdz7Q6Ep4cA90aPscjaFigVKtd5IPEacrU
         fb/YwlKbrIcUZv8f+c1Ob/8q5c1mgy7HiJ7945neKjyEXXXjtrvabm+SDWW4Sgxyvsqw
         uwMcALwz9oHDjjYgJB2ts/wqrNX6xKWJmlq/xmQCxLRA4FFsdHxJryVjuRA2+/b/mpNT
         WAdx40BUVrQY5d+R2/psSP4hn9+15IBpZIgC+tIkAAiFNZdrKoFdWc5EKHEn2cM0ldY7
         Vq1ieUwohHHlUGRTD8uF6bl0H+nfmsO94wfPAxvhRuzMN2TvqfVhHUU/LZUamogNaFCb
         0wmw==
X-Gm-Message-State: AAQBX9e3kasKuwAUg0CQXUVMhQpp5gb2ioPQQwkX7N6JFerUrn4tBx8M
	ITEbKv7FBXLQMnvq4SrB8Xo=
X-Google-Smtp-Source: AKy350b9RpNkeM6poJa6QMeC2wxzlQRdwYxV9YBCcFeTJJfrvqKlZP1//UR4kT2koFiWR9ebE3ZJVA==
X-Received: by 2002:a17:906:480b:b0:8b1:75a5:4a92 with SMTP id w11-20020a170906480b00b008b175a54a92mr2319088ejq.72.1681114889468;
        Mon, 10 Apr 2023 01:21:29 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/10] sunxi: Parameterize bit delay code in H616 DRAM driver
Date: Mon, 10 Apr 2023 10:21:16 +0200
Message-Id: <20230410082119.24616-8-jernej.skrabec@gmail.com>
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

These values are highly board specific and thus make sense to add
parameter for them. To ease adding support for new boards, let's make
them same as in vendor DRAM settings.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_sun50i_h616.h |   3 +
 arch/arm/mach-sunxi/Kconfig                   |  18 ++
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 189 +++++++++++++-----
 configs/x96_mate_defconfig                    |   2 +
 4 files changed, 163 insertions(+), 49 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
index dbdc6b694ec1..034ba98bc243 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
@@ -155,7 +155,10 @@ struct dram_para {
 	u32 dx_odt;
 	u32 dx_dri;
 	u32 ca_dri;
+	u32 odt_en;
 	u32 tpr10;
+	u32 tpr11;
+	u32 tpr12;
 };
 
 
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 4300d388e066..7b38e83c2d7e 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -67,11 +67,29 @@ config DRAM_SUN50I_H616_CA_DRI
 	help
 	  CA DRI value from vendor DRAM settings.
 
+config DRAM_SUN50I_H616_ODT_EN
+	hex "H616 DRAM ODT EN parameter"
+	default 0x1
+	help
+	  ODT EN value from vendor DRAM settings.
+
 config DRAM_SUN50I_H616_TPR10
 	hex "H616 DRAM TPR10 parameter"
 	help
 	  TPR10 value from vendor DRAM settings. It tells which features
 	  should be configured, like write leveling, read calibration, etc.
+
+config DRAM_SUN50I_H616_TPR11
+	hex "H616 DRAM TPR11 parameter"
+	default 0x0
+	help
+	  TPR11 value from vendor DRAM settings.
+
+config DRAM_SUN50I_H616_TPR12
+	hex "H616 DRAM TPR12 parameter"
+	default 0x0
+	help
+	  TPR12 value from vendor DRAM settings.
 endif
 
 config SUN6I_PRCM
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 3fe45845b78e..f5d8718fefff 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -574,7 +574,7 @@ static bool mctl_phy_write_training(struct dram_para *para)
 
 static void mctl_phy_bit_delay_compensation(struct dram_para *para)
 {
-	u32 *ptr;
+	u32 *ptr, val;
 	int i;
 
 	if (para->tpr10 & TPR10_DX_BIT_DELAY1) {
@@ -582,49 +582,93 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 8);
 		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
 
+		if (para->tpr10 & BIT(30))
+			val = para->tpr11 & 0x3f;
+		else
+			val = (para->tpr11 & 0xf) << 1;
+
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x484);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x16, ptr);
-			writel_relaxed(0x16, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4d0);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x590);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4cc);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x58c);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 15) & 0x1e;
+		else
+			val = (para->tpr11 >> 15) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4d0);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x590);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4cc);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x58c);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr11 >> 8) & 0x3f;
+		else
+			val = (para->tpr11 >> 3) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x1a, ptr);
-			writel_relaxed(0x1a, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x524);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e4);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x520);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e0);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 19) & 0x1e;
+		else
+			val = (para->tpr11 >> 19) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x524);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e4);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x520);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e0);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr11 >> 16) & 0x3f;
+		else
+			val = (para->tpr11 >> 7) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x604);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x1a, ptr);
-			writel_relaxed(0x1a, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x650);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x710);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x64c);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x70c);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 23) & 0x1e;
+		else
+			val = (para->tpr11 >> 23) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x650);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x710);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x64c);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x70c);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr11 >> 24) & 0x3f;
+		else
+			val = (para->tpr11 >> 11) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x658);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x1a, ptr);
-			writel_relaxed(0x1a, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a4);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x764);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a0);
-		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x760);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 27) & 0x1e;
+		else
+			val = (para->tpr11 >> 27) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a4);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x764);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a0);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x760);
 
 		dmb();
 
@@ -635,49 +679,93 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
 		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
 		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 4);
 
+		if (para->tpr10 & BIT(30))
+			val = para->tpr12 & 0x3f;
+		else
+			val = (para->tpr12 & 0xf) << 1;
+
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x480);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x10, ptr);
-			writel_relaxed(0x10, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x528);
-		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x5e8);
-		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x4c8);
-		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x588);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en << 1) & 0x1e;
+		else
+			val = (para->tpr12 >> 15) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x528);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e8);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4c8);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x588);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr12 >> 8) & 0x3f;
+		else
+			val = (para->tpr12 >> 3) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x12, ptr);
-			writel_relaxed(0x12, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x52c);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5ec);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x51c);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5dc);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 3) & 0x1e;
+		else
+			val = (para->tpr12 >> 19) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x52c);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5ec);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x51c);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5dc);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr12 >> 16) & 0x3f;
+		else
+			val = (para->tpr12 >> 7) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x600);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x12, ptr);
-			writel_relaxed(0x12, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x6a8);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x768);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x648);
-		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x708);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 7) & 0x1e;
+		else
+			val = (para->tpr12 >> 23) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a8);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x768);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x648);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x708);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->tpr12 >> 24) & 0x3f;
+		else
+			val = (para->tpr12 >> 11) & 0x1e;
 
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x654);
 		for (i = 0; i < 9; i++) {
-			writel_relaxed(0x14, ptr);
-			writel_relaxed(0x14, ptr + 0x30);
+			writel_relaxed(val, ptr);
+			writel_relaxed(val, ptr + 0x30);
 			ptr += 2;
 		}
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x6ac);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x76c);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x69c);
-		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x75c);
+
+		if (para->tpr10 & BIT(30))
+			val = (para->odt_en >> 11) & 0x1e;
+		else
+			val = (para->tpr12 >> 27) & 0x1e;
+
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6ac);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x76c);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x69c);
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x75c);
 
 		dmb();
 
@@ -1021,7 +1109,10 @@ unsigned long sunxi_dram_init(void)
 		.dx_odt = CONFIG_DRAM_SUN50I_H616_DX_ODT,
 		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
 		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
+		.odt_en = CONFIG_DRAM_SUN50I_H616_ODT_EN,
 		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
+		.tpr11 = CONFIG_DRAM_SUN50I_H616_TPR11,
+		.tpr12 = CONFIG_DRAM_SUN50I_H616_TPR12,
 	};
 	unsigned long size;
 
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index b00daa458b28..acc64898da19 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -7,6 +7,8 @@ CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
 CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
 CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
+CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
+CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-- 
2.40.0

