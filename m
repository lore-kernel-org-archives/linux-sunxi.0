Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D91FD9
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Jun 2023 13:55:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f4f8b94c06so4027344e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Jun 2023 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685800520; x=1688392520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEdFNfR69r2fIEm+YUJUSgi4gXTSxM4ZI4Q9oOAt61c=;
        b=YMWY0dagJ+sa5N/3n0/vWYnegwNZMTHNfzxOqyDjBMsV8ILFvq8NKgXPLEkXIIBfVB
         gQmxwVVX99rvx0DFY58SiXmRRen6qtZQWNHC0Z+VC5PYVntms5Bwz44ia1naBRwavqVt
         0ZjHgiDlfnLT+59sFwN01gILEb1IvKUYxjDOcroU9lW11c+6H4BBcdpeCc2XVX50NPxQ
         H6X6Hip9rYb5029r0lx3oP26t/19yTxJJ85Orv9DLQdWN53YicL4lWUX6PTkx1A30WpU
         Vb+FKyyecCYw3SO5ac8szUL2GEn+oJVI93KFXoJqt5UR3LKyrnzTiJhzb38w7PqRKXJS
         7mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685800520; x=1688392520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEdFNfR69r2fIEm+YUJUSgi4gXTSxM4ZI4Q9oOAt61c=;
        b=Ad17aBDvPv65BcQwCmwQQsvyHA7TG+JTRW9/v7KV38YSfpfr+t3IXEAXWTAAAOqVYe
         gnG9mOePcxfgfCdpf/ZB0vyrOIGYo+fGc284GPghJT0RSCCYTP6JZ5zBAEyEmFPQW/YQ
         HTc8HAwFB7NCjY8+Kt59G+iyOhDqV1/1SZ/nFL7QKZZF7Zxp8nEE+ReM2tN42JhdTjBE
         Pc9RSd/h2UBvN/RWs7Qtb6RiB0h/DHMr7GBKKvzlFJCwYU1qIMuKj5apfCD0EvYFazPP
         R1W5IL1XrJUV1jtZTiqaD+dobSR/vUP205pmxk6Sri4zYqjlaLgTL6jmD4eOCnQkHLd7
         2erA==
X-Gm-Message-State: AC+VfDwqqKwwuvW1jq7ok6Vt6Z2xeH1hoJiPjlFP4IK7tdiL4fVx9dc1
	nGA9PvRtVjdGMPcvrHD8zJc=
X-Google-Smtp-Source: ACHHUZ6UAcL6f2Fdbo80O8VzSJH98E+LBj+h5w/BO9bRMFaYr8MPkb0SK1QziRkgzARGMTJexAU6eQ==
X-Received: by 2002:ac2:51b1:0:b0:4f3:9f9b:ad09 with SMTP id f17-20020ac251b1000000b004f39f9bad09mr2875286lfk.38.1685800520037;
        Sat, 03 Jun 2023 06:55:20 -0700 (PDT)
Received: from SerialExperiment.lan ([46.251.215.215])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b004ec7c0f2178sm494016lfl.63.2023.06.03.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 06:55:19 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: H616: add LPDDR3 DRAM support
Date: Sat,  3 Jun 2023 16:55:06 +0300
Message-Id: <20230603135506.51071-3-iuncuim@gmail.com>
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

The H616 SoC has support for several types of DRAM: DDR3, LPDDR3,
DDR4 and LPDDR4.
At the moment, the driver only supports DDR3 memory.
Let's extend the driver to support the LPDDR3 memory. All "magic"
values obtained from the boot0.
---
 .../include/asm/arch-sunxi/dram_sun50i_h616.h |   1 +
 arch/arm/mach-sunxi/Kconfig                   |  10 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 215 ++++++++++++------
 arch/arm/mach-sunxi/dram_timings/Makefile     |   1 +
 .../arm/mach-sunxi/dram_timings/h616_lpddr3.c |  95 ++++++++
 5 files changed, 255 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
index 6db869c098..bf4188fa89 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
@@ -148,6 +148,7 @@ check_member(sunxi_mctl_ctl_reg, unk_0x4240, 0x4240);
 struct dram_para {
 	u32 clk;
 	enum sunxi_dram_type type;
+	u8 phy_init[27];
 	u8 cols;
 	u8 rows;
 	u8 ranks;
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 3ad37ef6ba..5ce82a955c 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -487,6 +487,14 @@ config SUNXI_DRAM_H6_DDR3_1333
 	This option is the DDR3 timing used by the boot0 on H6 TV boxes
 	which use a DDR3-1333 timing.
 
+config SUNXI_DRAM_H616_LPDDR3
+	bool "LPDDR3 DRAM chips on the H616 DRAM controller"
+	select SUNXI_DRAM_LPDDR3
+	depends on DRAM_SUN50I_H616
+	---help---
+	This option is the LPDDR3 timing used by the stock boot0 by
+	Allwinner.
+
 config SUNXI_DRAM_H616_DDR3_1333
 	bool "DDR3-1333 boot0 timings on the H616 DRAM controller"
 	select SUNXI_DRAM_DDR3
@@ -1083,4 +1091,4 @@ config CHIP_DIP_SCAN
 	select W1_GPIO
 	select W1_EEPROM
 	select W1_EEPROM_DS24XXX
-	select CMD_EXTENSION
\ No newline at end of file
+	select CMD_EXTENSION
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 1f9416d6ea..d34b218ee5 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -227,13 +227,6 @@ static void mctl_set_addrmap(struct dram_para *para)
 	mctl_ctl->addrmap[8] = 0x3F3F;
 }
 
-static const u8 phy_init[] = {
-	0x07, 0x0b, 0x02, 0x16, 0x0d, 0x0e, 0x14, 0x19,
-	0x0a, 0x15, 0x03, 0x13, 0x04, 0x0c, 0x10, 0x06,
-	0x0f, 0x11, 0x1a, 0x01, 0x12, 0x17, 0x00, 0x08,
-	0x09, 0x05, 0x18
-};
-
 static void mctl_phy_configure_odt(struct dram_para *para)
 {
 	unsigned int val;
@@ -263,19 +256,31 @@ static void mctl_phy_configure_odt(struct dram_para *para)
 	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x34c);
 
 	val = para->dx_odt & 0x1f;
-	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x380);
+	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x380);
+	else
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x380);
 	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x384);
 
 	val = (para->dx_odt >> 8) & 0x1f;
-	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c0);
+	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x3c0);
+	else
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c0);
 	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c4);
 
 	val = (para->dx_odt >> 16) & 0x1f;
-	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x400);
+	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x400);
+	else
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x400);
 	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x404);
 
 	val = (para->dx_odt >> 24) & 0x1f;
-	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x440);
+	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x440);
+	else
+		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x440);
 	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x444);
 
 	dmb();
@@ -793,31 +798,47 @@ static void mctl_phy_ca_bit_delay_compensation(struct dram_para *para)
 	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e0);
 	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7f4);
 
-	/* following configuration is DDR3 specific */
-	val = (para->tpr10 >> 7) & 0x1e;
-	if (para->tpr2 & 1) {
-		writel(val, SUNXI_DRAM_PHY0_BASE + 0x794);
-		if (para->ranks == 2) {
-			val = (para->tpr10 >> 11) & 0x1e;
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e4);
-		}
-		if (para->tpr0 & BIT(31)) {
-			val = (para->tpr0 << 1) & 0x3e;
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x790);
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7cc);
-		}
-	} else {
-		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
-		if (para->ranks == 2) {
-			val = (para->tpr10 >> 11) & 0x1e;
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
+	if (para->type == SUNXI_DRAM_TYPE_DDR3) {
+		val = (para->tpr10 >> 7) & 0x1e;
+		if (para->tpr2 & 1) {
+			writel(val, SUNXI_DRAM_PHY0_BASE + 0x794);
+			if (para->ranks == 2) {
+				val = (para->tpr10 >> 11) & 0x1e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e4);
+			}
+			if (para->tpr0 & BIT(31)) {
+				val = (para->tpr0 << 1) & 0x3e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x790);
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7cc);
+			}
+		} else {
+			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
+			if (para->ranks == 2) {
+				val = (para->tpr10 >> 11) & 0x1e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
+			}
+			if (para->tpr0 & BIT(31)) {
+				val = (para->tpr0 << 1) & 0x3e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
+			}
 		}
-		if (para->tpr0 & BIT(31)) {
-			val = (para->tpr0 << 1) & 0x3e;
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
-			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
+	} else if (para->type == SUNXI_DRAM_TYPE_LPDDR3) {
+		val = (para->tpr10 >> 7) & 0x1e;
+		if (para->tpr2 & 1) {
+			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a0);
+			if (para->ranks == 2) {
+				val = (para->tpr10 >> 11) & 0x1e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
+			}
+		} else {
+			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e8);
+			if (para->ranks == 2) {
+				val = (para->tpr10 >> 11) & 0x1e;
+				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7f8);
+			}
 		}
 	}
 }
@@ -838,11 +859,22 @@ static bool mctl_phy_init(struct dram_para *para)
 	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 0x3c, 0xf, val);
 
 	if (para->tpr2 & 0x100) {
-		val = 9;
-		val2 = 7;
+		if (para->type == SUNXI_DRAM_TYPE_DDR3) {
+			val = 9;
+			val2 = 7;
+		} else if (para->type == SUNXI_DRAM_TYPE_LPDDR3) {
+			// FIXME: don't know that values in this case, so fill the same 
+			val = 14;
+			val2 = 8;
+		}
 	} else {
-		val = 13;
-		val2 = 9;
+		if (para->type == SUNXI_DRAM_TYPE_DDR3) {
+			val = 13;
+			val2 = 9;
+		} else if (para->type == SUNXI_DRAM_TYPE_LPDDR3) {
+			val = 14;
+			val2 = 8;
+		}
 	}
 
 	writel(val, SUNXI_DRAM_PHY0_BASE + 0x14);
@@ -861,18 +893,26 @@ static bool mctl_phy_init(struct dram_para *para)
 	writel(val2, SUNXI_DRAM_PHY0_BASE + 0x37c);
 
 	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xc0);
-	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
-		writel(phy_init[i], &ptr[i]);
+	for (i = 0; i < ARRAY_SIZE(para->phy_init); i++)
+		writel(para->phy_init[i], &ptr[i]);
 
 	if (para->tpr10 & TPR10_CA_BIT_DELAY)
 		mctl_phy_ca_bit_delay_compensation(para);
 
-	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
-	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
+	if (para->type == SUNXI_DRAM_TYPE_DDR3)
+		val = 0x80;
+	else if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		val = 0xc0;
+	writel(val, SUNXI_DRAM_PHY0_BASE + 0x3dc);
+	writel(val, SUNXI_DRAM_PHY0_BASE + 0x45c);
 
 	mctl_phy_configure_odt(para);
 
-	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
+	if (para->type == SUNXI_DRAM_TYPE_DDR3) {
+		clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
+	} else if (para->type == SUNXI_DRAM_TYPE_LPDDR3) {
+		clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xb);
+	}
 
 	if (para->clk <= 672)
 		writel(0xf, SUNXI_DRAM_PHY0_BASE + 0x20);
@@ -922,21 +962,39 @@ static bool mctl_phy_init(struct dram_para *para)
 		mr2 = 0x20;
 	}
 
-	writel(mr0, &mctl_ctl->mrctrl1);
-	writel(0x80000030, &mctl_ctl->mrctrl0);
-	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
-
-	writel(4, &mctl_ctl->mrctrl1);
-	writel(0x80001030, &mctl_ctl->mrctrl0);
-	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
-
-	writel(mr2, &mctl_ctl->mrctrl1);
-	writel(0x80002030, &mctl_ctl->mrctrl0);
-	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
-
-	writel(0, &mctl_ctl->mrctrl1);
-	writel(0x80003030, &mctl_ctl->mrctrl0);
-	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+	if (para->type == SUNXI_DRAM_TYPE_DDR3) {
+		writel(mr0, &mctl_ctl->mrctrl1);
+		writel(0x80000030, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(4, &mctl_ctl->mrctrl1);
+		writel(0x80001030, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(mr2, &mctl_ctl->mrctrl1);
+		writel(0x80002030, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(0, &mctl_ctl->mrctrl1);
+		writel(0x80003030, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+	} else if (para->type == SUNXI_DRAM_TYPE_LPDDR3) {
+		writel(mr0, &mctl_ctl->mrctrl1);
+		writel(0x800000f0, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(4, &mctl_ctl->mrctrl1);
+		writel(0x800000f0, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(mr2, &mctl_ctl->mrctrl1);
+		writel(0x800000f0, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+
+		writel(0x301, &mctl_ctl->mrctrl1);
+		writel(0x800000f0, &mctl_ctl->mrctrl0);
+		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
+	}
 
 	writel(0, SUNXI_DRAM_PHY0_BASE + 0x54);
 
@@ -1011,7 +1069,10 @@ static bool mctl_ctrl_init(struct dram_para *para)
 	setbits_le32(&mctl_com->unk_0x008, 0xff00);
 
 	reg_val = MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(para->ranks);
-	reg_val |= MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
+	if (para->type == SUNXI_DRAM_TYPE_DDR3)
+		reg_val |= MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
+	else if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		reg_val |= MSTR_DEVICETYPE_LPDDR3;
 	if (para->bus_full_width)
 		reg_val |= MSTR_BUSWIDTH_FULL;
 	else
@@ -1023,10 +1084,14 @@ static bool mctl_ctrl_init(struct dram_para *para)
 	else
 		writel(0x0201, &mctl_ctl->odtmap);
 
-	writel(0x06000400, &mctl_ctl->odtcfg);
-	writel(0x06000400, &mctl_ctl->unk_0x2240);
-	writel(0x06000400, &mctl_ctl->unk_0x3240);
-	writel(0x06000400, &mctl_ctl->unk_0x4240);
+	if (para->type == SUNXI_DRAM_TYPE_DDR3)
+		reg_val = 0x06000400;
+	else if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
+		reg_val = 0x09020400;
+	writel(reg_val, &mctl_ctl->odtcfg);
+	writel(reg_val, &mctl_ctl->unk_0x2240);
+	writel(reg_val, &mctl_ctl->unk_0x3240);
+	writel(reg_val, &mctl_ctl->unk_0x4240);
 
 	writel(BIT(31), &mctl_com->cr);
 
@@ -1155,13 +1220,31 @@ static unsigned long mctl_calc_size(struct dram_para *para)
 	return (1ULL << (para->cols + para->rows + 3)) * width * para->ranks;
 }
 
+#define SUN50I_H616_DDR3_PHY_INIT				\
+	{ 0x07, 0x0b, 0x02, 0x16, 0x0d, 0x0e, 0x14, 0x19,	\
+	  0x0a, 0x15, 0x03, 0x13, 0x04, 0x0c, 0x10, 0x06,	\
+	  0x0f, 0x11, 0x1a, 0x01, 0x12, 0x17, 0x00, 0x08,	\
+	  0x09, 0x05, 0x18 }
+
+#define SUN50I_H616_LPDDR3_PHY_INIT				\
+	{ 0x18, 0x06, 0x00, 0x05, 0x04, 0x03, 0x09, 0x02,	\
+	  0x08, 0x01, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,	\
+	  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x07,	\
+	  0x17, 0x19, 0x1a }
+
 unsigned long sunxi_dram_init(void)
 {
 	struct sunxi_prcm_reg *const prcm =
 		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 	struct dram_para para = {
-		.clk = CONFIG_DRAM_CLK,
+#ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333
 		.type = SUNXI_DRAM_TYPE_DDR3,
+		.phy_init = SUN50I_H616_DDR3_PHY_INIT,
+#elif defined(CONFIG_SUNXI_DRAM_H616_LPDDR3)
+		.type = SUNXI_DRAM_TYPE_LPDDR3,
+		.phy_init = SUN50I_H616_LPDDR3_PHY_INIT,
+#endif
+		.clk = CONFIG_DRAM_CLK,
 		.dx_odt = CONFIG_DRAM_SUN50I_H616_DX_ODT,
 		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
 		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
@@ -1187,4 +1270,4 @@ unsigned long sunxi_dram_init(void)
 	mctl_set_master_priority();
 
 	return size;
-};
+};
\ No newline at end of file
diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-sunxi/dram_timings/Makefile
index 4d78c04c9a..8bfd99448a 100644
--- a/arch/arm/mach-sunxi/dram_timings/Makefile
+++ b/arch/arm/mach-sunxi/dram_timings/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+= ddr2_v3s.o
 obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+= h6_lpddr3.o
 obj-$(CONFIG_SUNXI_DRAM_H6_DDR3_1333)	+= h6_ddr3_1333.o
 obj-$(CONFIG_SUNXI_DRAM_H616_DDR3_1333)	+= h616_ddr3_1333.o
+obj-$(CONFIG_SUNXI_DRAM_H616_LPDDR3)	+= h616_lpddr3.o
diff --git a/arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c b/arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
new file mode 100644
index 0000000000..dcd504cae4
--- /dev/null
+++ b/arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
@@ -0,0 +1,95 @@
+/*
+ * sun50i H616 LPDDR3 timings, as programmed by Allwinner's boot0
+ *
+ * The chips are probably able to be driven by a faster clock, but boot0
+ * uses a more conservative timing (as usual).
+ *
+ * (C) Copyright 2020 Jernej Skrabec <jernej.skrabec@siol.net>
+ * Based on H6 DDR3 timings:
+ * (C) Copyright 2018,2019 Arm Ltd.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <asm/arch/dram.h>
+#include <asm/arch/cpu.h>
+
+void mctl_set_timing_params(struct dram_para *para)
+{
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	u8 tccd		= 2;
+	u8 tfaw		= ns_to_t(50);
+	u8 trrd		= max(ns_to_t(6), 4);
+	u8 trcd		= ns_to_t(24);
+	u8 trc		= ns_to_t(70);
+	u8 txp		= max(ns_to_t(8), 3);
+	u8 trtp		= max(ns_to_t(8), 2);
+	u8 trp		= ns_to_t(27);
+	u8 tras		= ns_to_t(41);
+	u16 trefi	= ns_to_t(7800) / 64;
+	u16 trfc	= ns_to_t(210);
+	u16 txsr	= 88;
+
+	u8 tmrw		= 5;
+	u8 tmrd		= 5;
+	u8 tmod		= max(ns_to_t(15), 12);
+	u8 tcke		= max(ns_to_t(6), 3);
+	u8 tcksrx	= max(ns_to_t(12), 4);
+	u8 tcksre	= max(ns_to_t(12), 4);
+	u8 tckesr	= tcke + 2;
+	u8 trasmax	= (para->clk / 2) / 16;
+	u8 txs		= ns_to_t(360) / 32;
+	u8 txsdll	= 16;
+	u8 txsabort	= 4;
+	u8 txsfast	= 4;
+	u8 tcl		= 7;
+	u8 tcwl		= 4;
+	u8 t_rdata_en	= 12;
+	u8 t_wr_lat	= 6;
+
+	u8 twtp		= 16;
+	u8 twr2rd	= trtp + 9;
+	u8 trd2wr	= 13;
+
+	/* DRAM timing grabbed from tvbox with LPDDR3 memory */
+	writel((twtp << 24) | (tfaw << 16) | (trasmax << 8) | tras,
+	       &mctl_ctl->dramtmg[0]);
+	writel((txp << 16) | (trtp << 8) | trc, &mctl_ctl->dramtmg[1]);
+	writel((tcwl << 24) | (tcl << 16) | (trd2wr << 8) | twr2rd,
+	       &mctl_ctl->dramtmg[2]);
+	writel((tmrw << 20) | (tmrd << 12) | tmod, &mctl_ctl->dramtmg[3]);
+	writel((trcd << 24) | (tccd << 16) | (trrd << 8) | trp,
+	       &mctl_ctl->dramtmg[4]);
+	writel((tcksrx << 24) | (tcksre << 16) | (tckesr << 8) | tcke,
+	       &mctl_ctl->dramtmg[5]);
+	/* Value suggested by ZynqMP manual and used by libdram */
+	writel((txp + 2) | 0x02020000, &mctl_ctl->dramtmg[6]);
+	writel((txsfast << 24) | (txsabort << 16) | (txsdll << 8) | txs,
+	       &mctl_ctl->dramtmg[8]);
+	writel(0x00020208, &mctl_ctl->dramtmg[9]);
+	writel(0xE0C05, &mctl_ctl->dramtmg[10]);
+	writel(0x440C021C, &mctl_ctl->dramtmg[11]);
+	writel(8, &mctl_ctl->dramtmg[12]);
+	writel(0xA100002, &mctl_ctl->dramtmg[13]);
+	writel(txsr, &mctl_ctl->dramtmg[14]);
+
+	writel(0x4f0112, &mctl_ctl->init[0]);
+	writel(0x420000, &mctl_ctl->init[1]);
+	writel(0xd05, &mctl_ctl->init[2]);
+	writel(0x83001c, &mctl_ctl->init[3]);
+	writel(0x00010000, &mctl_ctl->init[4]);
+
+	writel(0, &mctl_ctl->dfimisc);
+	clrsetbits_le32(&mctl_ctl->rankctl, 0xff0, 0x660);
+
+	/* Configure DFI timing */
+	writel(t_wr_lat | 0x2000000 | (t_rdata_en << 16) | 0x808000,
+	       &mctl_ctl->dfitmg0);
+	writel(0x100202, &mctl_ctl->dfitmg1);
+
+	/* set refresh timing */
+	writel((trefi << 16) | trfc, &mctl_ctl->rfshtmg);
+}
-- 
2.40.1

