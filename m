Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C3258F
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:28 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id qa44so10507682ejc.4
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOzZjCBbW6+7y6QE3tiBzoV7TtxOr1XIoHJXCc6I79o=;
        b=iseOmGF4xZl91LAwWCo9ykWpSnG25wlTv8wusNCMZOuBHer1KVw2vDVoBFjWT3JoL7
         og5l5PelYCzp5JtOaZMN1PdEEh5Zf/VqLUIFCvf2RfLFSiwvF0jIwQYOnocJ1gx1GsBo
         /YwRDEkLuE7vv3fBezxsH9IHnKAzFM/2cWMNNdvGer60GkwbWlbXDLblrQGBQ/foMVaY
         r+yglQe//DIc+SKfQHtMxv+ifrxe4aWlTJohBvCUOZXEb9iQSyv7QyFLFobQs4XynGmW
         YgE8dRToWSrXtkMCom65bSbJB70nlvLQJ0jTs503vFkDl/I8WSpxqgBCuyx/OPLUaTSV
         mwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOzZjCBbW6+7y6QE3tiBzoV7TtxOr1XIoHJXCc6I79o=;
        b=uT0nh533ZppFRyJLfmpW/tgTE4CTjUcuYfNWFgBPNWf8/f7JIJjuxD+GyAWFZ1+q3c
         CkU9mbjUjj9T+8jZY+yFEw1CkO1XGtvxn2aMrIXE+gLJBAjF3zXl6h1zO1rmD9JQ7qo3
         OMaw88qjPJlDcNNtI2RGIL1uxPp+sLr1+Pk5Vu35TCpl1yUJSsAOKbbJnFpVHOPFusTU
         7td8c1gWi4FEMPbDPoEYICO26pgz01+J4HeMDnwj7bpUHMaXdKBZWv4baWbTKZjy/a0W
         Bc5Q6LuCnzuuzWLm9+yhVBXKLKmWsWRpNywoOOuXkn6OANJgLgWtBgW9Lx1usROhQJ7s
         NbUQ==
X-Gm-Message-State: AAQBX9fO0+sj8m3XWvG7AH+36dnaNQAE2Jh6iuzKWGyo/UuKC+s+aQIt
	zcHZIF9B5DeYbDz9FOQnpyw=
X-Google-Smtp-Source: AKy350brO25haTdKFEEbLA24xnd+g3gOgU891lqKkqwjR3567X+nZnQYJuQ8j2hFTYuq6XMPJ1CvOA==
X-Received: by 2002:a17:907:3546:b0:94c:6063:c021 with SMTP id aa6-20020a170907354600b0094c6063c021mr165553ejc.45.1681114886982;
        Mon, 10 Apr 2023 01:21:26 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:26 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 04/10] sunxi: Convert H616 DRAM options to single setting
Date: Mon, 10 Apr 2023 10:21:13 +0200
Message-Id: <20230410082119.24616-5-jernej.skrabec@gmail.com>
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

Vendor DRAM settings use TPR10 parameter to enable various features.
There are many mores features that just those that are currently
mentioned. Since new will be added later and most are not known, let's
reuse value from vendor DRAM driver as-is. This will also help adding
support for new boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_sun50i_h616.h |   9 +
 arch/arm/mach-sunxi/Kconfig                   |  38 +---
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 197 +++++++++---------
 configs/orangepi_zero2_defconfig              |   5 +-
 configs/x96_mate_defconfig                    |   1 +
 5 files changed, 117 insertions(+), 133 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
index c9e1f84bfcdd..dbdc6b694ec1 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
@@ -137,6 +137,14 @@ check_member(sunxi_mctl_ctl_reg, unk_0x4240, 0x4240);
 #define MSTR_ACTIVE_RANKS(x)	(((x == 2) ? 3 : 1) << 24)
 #define MSTR_BURST_LENGTH(x)	(((x) >> 1) << 16)
 
+#define TPR10_CA_BIT_DELAY	BIT(16)
+#define TPR10_DX_BIT_DELAY0	BIT(17)
+#define TPR10_DX_BIT_DELAY1	BIT(18)
+#define TPR10_WRITE_LEVELING	BIT(20)
+#define TPR10_READ_CALIBRATION	BIT(21)
+#define TPR10_READ_TRAINING	BIT(22)
+#define TPR10_WRITE_TRAINING	BIT(23)
+
 struct dram_para {
 	u32 clk;
 	enum sunxi_dram_type type;
@@ -147,6 +155,7 @@ struct dram_para {
 	u32 dx_odt;
 	u32 dx_dri;
 	u32 ca_dri;
+	u32 tpr10;
 };
 
 
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 14fb9a95905a..1b47a49f938c 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -52,38 +52,6 @@ config DRAM_SUN50I_H616
 	  like H616.
 
 if DRAM_SUN50I_H616
-config DRAM_SUN50I_H616_WRITE_LEVELING
-	bool "H616 DRAM write leveling"
-	---help---
-	  Select this when DRAM on your H616 board needs write leveling.
-
-config DRAM_SUN50I_H616_READ_CALIBRATION
-	bool "H616 DRAM read calibration"
-	---help---
-	  Select this when DRAM on your H616 board needs read calibration.
-
-config DRAM_SUN50I_H616_READ_TRAINING
-	bool "H616 DRAM read training"
-	---help---
-	  Select this when DRAM on your H616 board needs read training.
-
-config DRAM_SUN50I_H616_WRITE_TRAINING
-	bool "H616 DRAM write training"
-	---help---
-	  Select this when DRAM on your H616 board needs write training.
-
-config DRAM_SUN50I_H616_BIT_DELAY_COMPENSATION
-	bool "H616 DRAM bit delay compensation"
-	---help---
-	  Select this when DRAM on your H616 board needs bit delay
-	  compensation.
-
-config DRAM_SUN50I_H616_UNKNOWN_FEATURE
-	bool "H616 DRAM unknown feature"
-	---help---
-	  Select this when DRAM on your H616 board needs this unknown
-	  feature.
-
 config DRAM_SUN50I_H616_DX_ODT
 	hex "H616 DRAM DX ODT parameter"
 	help
@@ -98,6 +66,12 @@ config DRAM_SUN50I_H616_CA_DRI
 	hex "H616 DRAM CA DRI parameter"
 	help
 	  CA DRI value from vendor DRAM settings.
+
+config DRAM_SUN50I_H616_TPR10
+	hex "H616 DRAM TPR10 parameter"
+	help
+	  TPR10 value from vendor DRAM settings. It tells which features
+	  should be configured, like write leveling, read calibration, etc.
 endif
 
 config SUN6I_PRCM
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 06a07dfbf9cc..630c7c3be882 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -577,109 +577,112 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	u32 *ptr;
 	int i;
 
-	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x60, 1);
-	setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 8);
-	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
+	if (para->tpr10 & TPR10_DX_BIT_DELAY1) {
+		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x60, 1);
+		setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 8);
+		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x484);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x16, ptr);
-		writel_relaxed(0x16, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4d0);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x590);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4cc);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x58c);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x484);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x16, ptr);
+			writel_relaxed(0x16, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4d0);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x590);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4cc);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x58c);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x1a, ptr);
-		writel_relaxed(0x1a, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x524);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e4);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x520);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e0);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x1a, ptr);
+			writel_relaxed(0x1a, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x524);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e4);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x520);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e0);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x604);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x1a, ptr);
-		writel_relaxed(0x1a, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x650);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x710);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x64c);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x70c);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x604);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x1a, ptr);
+			writel_relaxed(0x1a, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x650);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x710);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x64c);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x70c);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x658);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x1a, ptr);
-		writel_relaxed(0x1a, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a4);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x764);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a0);
-	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x760);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x658);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x1a, ptr);
+			writel_relaxed(0x1a, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a4);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x764);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a0);
+		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x760);
 
-	dmb();
+		dmb();
 
-	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x60, 1);
+		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x60, 1);
+	}
 
-	/* second part */
-	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
-	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 4);
+	if (para->tpr10 & TPR10_DX_BIT_DELAY0) {
+		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
+		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 4);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x480);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x10, ptr);
-		writel_relaxed(0x10, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x528);
-	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x5e8);
-	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x4c8);
-	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x588);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x480);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x10, ptr);
+			writel_relaxed(0x10, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x528);
+		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x5e8);
+		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x4c8);
+		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x588);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x12, ptr);
-		writel_relaxed(0x12, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x52c);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5ec);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x51c);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5dc);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x12, ptr);
+			writel_relaxed(0x12, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x52c);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5ec);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x51c);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5dc);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x600);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x12, ptr);
-		writel_relaxed(0x12, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x6a8);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x768);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x648);
-	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x708);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x600);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x12, ptr);
+			writel_relaxed(0x12, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x6a8);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x768);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x648);
+		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x708);
 
-	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x654);
-	for (i = 0; i < 9; i++) {
-		writel_relaxed(0x14, ptr);
-		writel_relaxed(0x14, ptr + 0x30);
-		ptr += 2;
-	}
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x6ac);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x76c);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x69c);
-	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x75c);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x654);
+		for (i = 0; i < 9; i++) {
+			writel_relaxed(0x14, ptr);
+			writel_relaxed(0x14, ptr + 0x30);
+			ptr += 2;
+		}
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x6ac);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x76c);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x69c);
+		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x75c);
 
-	dmb();
+		dmb();
 
-	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
+		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
+	}
 
 	return true;
 }
@@ -718,7 +721,7 @@ static bool mctl_phy_init(struct dram_para *para)
 	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
 		writel(phy_init[i], &ptr[i]);
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_UNKNOWN_FEATURE)) {
+	if (para->tpr10 & TPR10_CA_BIT_DELAY) {
 		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
 		for (i = 0; i < 32; i++)
 			writel(0x16, &ptr[i]);
@@ -800,7 +803,7 @@ static bool mctl_phy_init(struct dram_para *para)
 	clrbits_le32(&mctl_ctl->rfshctl3, 1);
 	writel(1, &mctl_ctl->swctl);
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_WRITE_LEVELING)) {
+	if (para->tpr10 & TPR10_WRITE_LEVELING) {
 		for (i = 0; i < 5; i++)
 			if (mctl_phy_write_leveling(para))
 				break;
@@ -810,7 +813,7 @@ static bool mctl_phy_init(struct dram_para *para)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION)) {
+	if (para->tpr10 & TPR10_READ_CALIBRATION) {
 		for (i = 0; i < 5; i++)
 			if (mctl_phy_read_calibration(para))
 				break;
@@ -820,7 +823,7 @@ static bool mctl_phy_init(struct dram_para *para)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_READ_TRAINING)) {
+	if (para->tpr10 & TPR10_READ_TRAINING) {
 		for (i = 0; i < 5; i++)
 			if (mctl_phy_read_training(para))
 				break;
@@ -830,7 +833,7 @@ static bool mctl_phy_init(struct dram_para *para)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_WRITE_TRAINING)) {
+	if (para->tpr10 & TPR10_WRITE_TRAINING) {
 		for (i = 0; i < 5; i++)
 			if (mctl_phy_write_training(para))
 				break;
@@ -840,8 +843,7 @@ static bool mctl_phy_init(struct dram_para *para)
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_BIT_DELAY_COMPENSATION))
-		mctl_phy_bit_delay_compensation(para);
+	mctl_phy_bit_delay_compensation(para);
 
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x60, 4);
 
@@ -1022,6 +1024,7 @@ unsigned long sunxi_dram_init(void)
 		.dx_odt = CONFIG_DRAM_SUN50I_H616_DX_ODT,
 		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
 		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
+		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
 	};
 	unsigned long size;
 
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index d70b15a07705..6cb942f511a1 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -2,13 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h616-orangepi-zero2"
 CONFIG_SPL=y
-CONFIG_DRAM_SUN50I_H616_WRITE_LEVELING=y
-CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
-CONFIG_DRAM_SUN50I_H616_READ_TRAINING=y
-CONFIG_DRAM_SUN50I_H616_WRITE_TRAINING=y
 CONFIG_DRAM_SUN50I_H616_DX_ODT=0x08080808
 CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
+CONFIG_DRAM_SUN50I_H616_TPR10=0xf83438
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index 60cc8fbe751c..b00daa458b28 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -6,6 +6,7 @@ CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
 CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
 CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
+CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-- 
2.40.0

