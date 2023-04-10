Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF7A258F
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50489c6171dso1205174a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5ioJ3vtuZds1lZY2WxiuKhTeUKrB/BZ90EinWvvvTQ=;
        b=MsHPNBsuMm04WBLylv6uW8tEfTotZksTxQGcUu9e9u1KzSuBisz959Pja9eghCy3Cq
         gNKxWzUWacMKlN/JjON6gmzgiSP/0WwC9hRd24NQR+Kn9CNugU6nrr16aHQUkOrJ9Ywx
         Xny7ACye7wn4sJx9uEMEO0P+xQZgbu2gn4kTx4J2s1HOkeo52aDn/lnsQoWg/1s0cdVH
         5knH3nUqawowK+cWAQpOFRatYiQq0Xnpg5MHmpIpFFE41ahkX+3lwD9lK+STfpegWD8y
         hhRUWvJk75bQDqnwyaUNddYe7oac3UQWQJg5xUVraGHYKSuUOxVpN/XUy3NW8gnF4Dr8
         ltCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5ioJ3vtuZds1lZY2WxiuKhTeUKrB/BZ90EinWvvvTQ=;
        b=SzKBf4rrXYmYi2ly4YjP7Q1ghluUCyAPCP7LoTfsvmoZ6VJlBS9bV4aIM0QmmAVduR
         FgO/SLKheK2obSfL0D6TCMtenr0U5DVpRWEKfFDGy0yivubLQFupIOz4daasznfMEQ93
         Mo4Pu5ctCDJgPu4hY4kIvK+w559MXTqIFXx5yFMuWq7MITec2MwLjE/WdWcU9T+vzsFr
         tuWxBN88VWks1CYDs9u2w+N17KScgw9NPW2UM/fkBsFGkVdNOU5y8H+k4/yZrn6e2m0c
         +Nl3FHuULT7cnqRIVLs/S1/Z1a8j2SgmcUwX3EITXr5as+6ipnjsARm4AsU1pcs/MiDR
         mDrQ==
X-Gm-Message-State: AAQBX9dq489Vl2aCC6OiG/dMdXVFShS+gGBdm0ckHO5I/RFvO2BAsIUx
	XdB1KhVWLVJCZ3mPHDZ0nxs=
X-Google-Smtp-Source: AKy350aw3Lz2G1r0RxAZ8/JhedzB4TU3epePiG4uJyaQ/wFF7d3x7QVCBFvIkLkMEHWofs+0V0aLFQ==
X-Received: by 2002:aa7:db52:0:b0:504:b511:1a39 with SMTP id n18-20020aa7db52000000b00504b5111a39mr157930edt.12.1681114890304;
        Mon, 10 Apr 2023 01:21:30 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:30 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 08/10] sunxi: Parameterize "unknown feature" in H616 DRAM driver
Date: Mon, 10 Apr 2023 10:21:17 +0200
Message-Id: <20230410082119.24616-9-jernej.skrabec@gmail.com>
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

Part of the code, previously known as "unknown feature", also doesn't
have constant values. They are derived from TPR0 parameter in vendor
DRAM code.

Let's move that code to separate function and introduce TPR0 parameter
here too, to ease adding new boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_sun50i_h616.h |  1 +
 arch/arm/mach-sunxi/Kconfig                   |  6 +++
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 47 ++++++++++++++-----
 configs/x96_mate_defconfig                    |  1 +
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
index 034ba98bc243..615532c6eebb 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
@@ -156,6 +156,7 @@ struct dram_para {
 	u32 dx_dri;
 	u32 ca_dri;
 	u32 odt_en;
+	u32 tpr0;
 	u32 tpr10;
 	u32 tpr11;
 	u32 tpr12;
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 7b38e83c2d7e..fe34755f88ec 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -73,6 +73,12 @@ config DRAM_SUN50I_H616_ODT_EN
 	help
 	  ODT EN value from vendor DRAM settings.
 
+config DRAM_SUN50I_H616_TPR0
+	hex "H616 DRAM TPR0 parameter"
+	default 0x0
+	help
+	  TPR0 value from vendor DRAM settings.
+
 config DRAM_SUN50I_H616_TPR10
 	hex "H616 DRAM TPR10 parameter"
 	help
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index f5d8718fefff..44bb15367beb 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -773,6 +773,39 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
 	}
 }
 
+static void mctl_phy_ca_bit_delay_compensation(struct dram_para *para)
+{
+	u32 val, *ptr;
+	int i;
+
+	if (para->tpr0 & BIT(30))
+		val = (para->tpr0 >> 7) & 0x3e;
+	else
+		val = (para->tpr10 >> 3) & 0x1e;
+
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
+	for (i = 0; i < 32; i++)
+		writel(val, &ptr[i]);
+
+	val = (para->tpr10 << 1) & 0x1e;
+	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7dc);
+	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e0);
+
+	/* following configuration is DDR3 specific */
+	val = (para->tpr10 >> 7) & 0x1e;
+	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
+	if (para->ranks == 2) {
+		val = (para->tpr10 >> 11) & 0x1e;
+		writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
+	}
+	if (para->tpr0 & BIT(31)) {
+		val = (para->tpr0 << 1) & 0x3e;
+		writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
+		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
+		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
+	}
+}
+
 static bool mctl_phy_init(struct dram_para *para)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
@@ -807,17 +840,8 @@ static bool mctl_phy_init(struct dram_para *para)
 	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
 		writel(phy_init[i], &ptr[i]);
 
-	if (para->tpr10 & TPR10_CA_BIT_DELAY) {
-		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
-		for (i = 0; i < 32; i++)
-			writel(0x16, &ptr[i]);
-		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x78c);
-		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7a4);
-		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7b8);
-		writel(0x8, SUNXI_DRAM_PHY0_BASE + 0x7d4);
-		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7dc);
-		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7e0);
-	}
+	if (para->tpr10 & TPR10_CA_BIT_DELAY)
+		mctl_phy_ca_bit_delay_compensation(para);
 
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
@@ -1110,6 +1134,7 @@ unsigned long sunxi_dram_init(void)
 		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
 		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
 		.odt_en = CONFIG_DRAM_SUN50I_H616_ODT_EN,
+		.tpr0 = CONFIG_DRAM_SUN50I_H616_TPR0,
 		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
 		.tpr11 = CONFIG_DRAM_SUN50I_H616_TPR11,
 		.tpr12 = CONFIG_DRAM_SUN50I_H616_TPR12,
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index acc64898da19..aedb3277022a 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -6,6 +6,7 @@ CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
 CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
 CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
+CONFIG_DRAM_SUN50I_H616_TPR0=0xc0000c05
 CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
 CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
 CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
-- 
2.40.0

