Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64D257C
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:27 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id jg21so10470510ejc.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NzH6r5zRieRTR6iTv4dVyEJg/cw0VVSA/6toBgXcJA=;
        b=MOgN2k8Q0oK/UChXuHnTVsF/BnV4r5fXVUON3O3w5WdPHnwcUiBsmg8cmX30P0J3dk
         Ms4qLY9fTmFCHW0OXGa/1IpC5RCt0uGEa7vgYH8HGYpcCEXrmyKOVFyK616HKN2g4TVB
         4fcnKl7S6Hfn7H67tDlAo26lxRJaQsO8tCbZRBd11eaXoLZhxH1by4l0m5a5mY1Ylmxl
         SunnE664jqRvr+JHeGn0FH0o59DQED3PFDot4GiVmfaUPYrTEs65bXSgK58scfQ/VR4T
         4c8o6iQk9OkMj4DepdhNDBnkg/71/Rsj1cxV7dNFjjpDwhT5xIWFWGrjQV5pqM7Is3+L
         748g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NzH6r5zRieRTR6iTv4dVyEJg/cw0VVSA/6toBgXcJA=;
        b=4GzbNdwgYOdgz08gLBLud1D/xUtGwJy4pSF4Snj/ZpV/iPAXZ8Yn5SDCpMEDvHd0H/
         DBME1Ob4VD5O7kH3nNDb+QjUax2+OfxcVgySWIufJFfUTLR4eFm/ulUQKVCVIxCIfvtk
         D0YEW3yAueZ5/rB2Y+DKH9i4xSsyv8jjIaJwzqCPuFLPbtwiPRlW4N/WA4F868jb3CVG
         iuUAgi3mF8g+vuhmTwyft44KFNJbmaeBGf+LuhnjxvVdeWH/v57Pv+s/wDcDWEifjCr1
         jTmBcjSX5HX+Ax1OPZ969jBHlX9eCwru4jSAtXH8GG4W+KH+najozW6RQvU49arwW52P
         zmHw==
X-Gm-Message-State: AAQBX9dPTHitjqHoz88f3ltmTz3qcG41mmvPOZakWdG2L8EFV52WBvli
	CBkQwXoI+oP3qaFQvFk9RWk=
X-Google-Smtp-Source: AKy350alW1N+jR8cbCX0YWkwkv2bylYHpfuT99YD2xEInkoaBdpjeQtn1TU8medJdy+7/zrAEBWg1w==
X-Received: by 2002:a17:906:f0da:b0:94a:9ae2:1642 with SMTP id dk26-20020a170906f0da00b0094a9ae21642mr1163057ejb.46.1681114885424;
        Mon, 10 Apr 2023 01:21:25 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 02/10] sunxi: cosmetic: Fix H616 DRAM driver code style
Date: Mon, 10 Apr 2023 10:21:11 +0200
Message-Id: <20230410082119.24616-3-jernej.skrabec@gmail.com>
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

Fix code style for pointer declaration. This is just cosmetic change to
avoid checkpatch errors in later commits.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 74 +++++++++++++-------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 039e76224367..49983bf7a1b8 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -285,7 +285,7 @@ static bool mctl_phy_write_leveling(struct dram_para *para)
 	else
 		val = 3;
 
-	mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x188), val, val);
+	mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x188), val, val);
 
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 4);
 
@@ -314,7 +314,7 @@ static bool mctl_phy_write_leveling(struct dram_para *para)
 		else
 			val = 3;
 
-		mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x188), val, val);
+		mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x188), val, val);
 
 		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 4);
 	}
@@ -398,26 +398,26 @@ static bool mctl_phy_read_training(struct dram_para *para)
 	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 6);
 	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 1);
 
-	mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x840), 0xc, 0xc);
+	mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x840), 0xc, 0xc);
 	if (readl(SUNXI_DRAM_PHY0_BASE + 0x840) & 3)
 		result = false;
 
 	if (para->bus_full_width) {
-		mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0xa40), 0xc, 0xc);
+		mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0xa40), 0xc, 0xc);
 		if (readl(SUNXI_DRAM_PHY0_BASE + 0xa40) & 3)
 			result = false;
 	}
 
-	ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x898);
-	ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x850);
+	ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x898);
+	ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x850);
 	for (i = 0; i < 9; i++) {
 		val1 = readl(&ptr1[i]);
 		val2 = readl(&ptr2[i]);
 		if (val1 - val2 <= 6)
 			result = false;
 	}
-	ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x8bc);
-	ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x874);
+	ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x8bc);
+	ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x874);
 	for (i = 0; i < 9; i++) {
 		val1 = readl(&ptr1[i]);
 		val2 = readl(&ptr2[i]);
@@ -426,8 +426,8 @@ static bool mctl_phy_read_training(struct dram_para *para)
 	}
 
 	if (para->bus_full_width) {
-		ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xa98);
-		ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xa50);
+		ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xa98);
+		ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xa50);
 		for (i = 0; i < 9; i++) {
 			val1 = readl(&ptr1[i]);
 			val2 = readl(&ptr2[i]);
@@ -435,8 +435,8 @@ static bool mctl_phy_read_training(struct dram_para *para)
 				result = false;
 		}
 
-		ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xabc);
-		ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xa74);
+		ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xabc);
+		ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xa74);
 		for (i = 0; i < 9; i++) {
 			val1 = readl(&ptr1[i]);
 			val2 = readl(&ptr2[i]);
@@ -454,12 +454,12 @@ static bool mctl_phy_read_training(struct dram_para *para)
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 6);
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 1);
 
-		mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x840), 0xc, 0xc);
+		mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x840), 0xc, 0xc);
 		if (readl(SUNXI_DRAM_PHY0_BASE + 0x840) & 3)
 			result = false;
 
 		if (para->bus_full_width) {
-			mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0xa40), 0xc, 0xc);
+			mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0xa40), 0xc, 0xc);
 			if (readl(SUNXI_DRAM_PHY0_BASE + 0xa40) & 3)
 				result = false;
 		}
@@ -488,26 +488,26 @@ static bool mctl_phy_write_training(struct dram_para *para)
 	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
 	setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x20);
 
-	mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x8e0), 3, 3);
+	mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x8e0), 3, 3);
 	if (readl(SUNXI_DRAM_PHY0_BASE + 0x8e0) & 0xc)
 		result = false;
 
 	if (para->bus_full_width) {
-		mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0xae0), 3, 3);
+		mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0xae0), 3, 3);
 		if (readl(SUNXI_DRAM_PHY0_BASE + 0xae0) & 0xc)
 			result = false;
 	}
 
-	ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x938);
-	ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x8f0);
+	ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x938);
+	ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x8f0);
 	for (i = 0; i < 9; i++) {
 		val1 = readl(&ptr1[i]);
 		val2 = readl(&ptr2[i]);
 		if (val1 - val2 <= 6)
 			result = false;
 	}
-	ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x95c);
-	ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x914);
+	ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x95c);
+	ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x914);
 	for (i = 0; i < 9; i++) {
 		val1 = readl(&ptr1[i]);
 		val2 = readl(&ptr2[i]);
@@ -516,16 +516,16 @@ static bool mctl_phy_write_training(struct dram_para *para)
 	}
 
 	if (para->bus_full_width) {
-		ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xb38);
-		ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xaf0);
+		ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xb38);
+		ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xaf0);
 		for (i = 0; i < 9; i++) {
 			val1 = readl(&ptr1[i]);
 			val2 = readl(&ptr2[i]);
 			if (val1 - val2 <= 6)
 				result = false;
 		}
-		ptr1 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xb5c);
-		ptr2 = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xb14);
+		ptr1 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xb5c);
+		ptr2 = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xb14);
 		for (i = 0; i < 9; i++) {
 			val1 = readl(&ptr1[i]);
 			val2 = readl(&ptr2[i]);
@@ -542,12 +542,12 @@ static bool mctl_phy_write_training(struct dram_para *para)
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x20);
 
-		mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x8e0), 3, 3);
+		mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x8e0), 3, 3);
 		if (readl(SUNXI_DRAM_PHY0_BASE + 0x8e0) & 0xc)
 			result = false;
 
 		if (para->bus_full_width) {
-			mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0xae0), 3, 3);
+			mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0xae0), 3, 3);
 			if (readl(SUNXI_DRAM_PHY0_BASE + 0xae0) & 0xc)
 				result = false;
 		}
@@ -569,7 +569,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 8);
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x484);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x484);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x16, ptr);
 		writel_relaxed(0x16, ptr + 0x30);
@@ -580,7 +580,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4cc);
 	writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x58c);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x1a, ptr);
 		writel_relaxed(0x1a, ptr + 0x30);
@@ -591,7 +591,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x520);
 	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e0);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x604);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x604);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x1a, ptr);
 		writel_relaxed(0x1a, ptr + 0x30);
@@ -602,7 +602,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x64c);
 	writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x70c);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x658);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x658);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x1a, ptr);
 		writel_relaxed(0x1a, ptr + 0x30);
@@ -621,7 +621,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 4);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x480);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x480);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x10, ptr);
 		writel_relaxed(0x10, ptr + 0x30);
@@ -632,7 +632,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x4c8);
 	writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x588);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x12, ptr);
 		writel_relaxed(0x12, ptr + 0x30);
@@ -643,7 +643,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x51c);
 	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5dc);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x600);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x600);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x12, ptr);
 		writel_relaxed(0x12, ptr + 0x30);
@@ -654,7 +654,7 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x648);
 	writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x708);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x654);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x654);
 	for (i = 0; i < 9; i++) {
 		writel_relaxed(0x14, ptr);
 		writel_relaxed(0x14, ptr + 0x30);
@@ -702,12 +702,12 @@ static bool mctl_phy_init(struct dram_para *para)
 	writel(9, SUNXI_DRAM_PHY0_BASE + 0x370);
 	writel(9, SUNXI_DRAM_PHY0_BASE + 0x37c);
 
-	ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0xc0);
+	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xc0);
 	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
 		writel(phy_init[i], &ptr[i]);
 
 	if (IS_ENABLED(CONFIG_DRAM_SUN50I_H616_UNKNOWN_FEATURE)) {
-		ptr = (u32*)(SUNXI_DRAM_PHY0_BASE + 0x780);
+		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
 		for (i = 0; i < 32; i++)
 			writel(0x16, &ptr[i]);
 		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x78c);
@@ -738,7 +738,7 @@ static bool mctl_phy_init(struct dram_para *para)
 
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x14c, 8);
 
-	mctl_await_completion((u32*)(SUNXI_DRAM_PHY0_BASE + 0x180), 4, 4);
+	mctl_await_completion((u32 *)(SUNXI_DRAM_PHY0_BASE + 0x180), 4, 4);
 
 	writel(0x37, SUNXI_DRAM_PHY0_BASE + 0x58);
 	clrbits_le32(&mctl_com->unk_0x500, 0x200);
-- 
2.40.0

