Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC2B2C80
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388136; cv=none; b=ICQUz8unBjGkE38k3I9SJWQSdNGyH3eUoHNcRNTjtjID+UDwjAgNhnqN5KSXCPqhbKtjI+CUvlFrZgOoVKwcbT3/OSRLBMHViKQqNNv+kffem4itzJaTPa2mOPRXXjQheLyfQ+IjX8upXnSV0vJe2mKAhUMgjmn/CGaxqiL8FG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388136; c=relaxed/simple;
	bh=9joqdM0kFC6OHxrRmmeN0RLAx0GJFz/wfDC99OcnVg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NegmG7/h7fraiC4ryTISjwrj3I+mjZBI4z4IZ/LjoP/99N3V5linP/5W2RZoCaSfLO0jh13Bzv3WsS7SVgFW9nzPWif91sy/auTbA8gNB5h/BtK7cN2Lxx4JBfR/V6GUoA0TMcM7Cv+QOQ/2ZXyQWnkD8KLrX7xxXh4DRpWyVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvJHNrpV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvJHNrpV"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4403934a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388133; x=1744992933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT0F91CBZ5cB0JDXSj1e0tey/TyTjr0AH6774qDqY8Q=;
        b=YvJHNrpVWgtAMkX7E+gOFXFo6i9ZHuP7VZLyVRd+gSIdTp969Mwtb3Vq9VBYZv3cFc
         WuRuJ7LLpr5lPQil1mW7ED8+uCaUPUhjSeBbEnBdynU70b+xNzd9TZIzLFRMWT5CxNyH
         jNDk4IAGJpUh9IizVx7ZdOlzOGEy71aAyQwNCopN4JOzCqayyfBhKd3ER1cIAHokFMaV
         mEJsgVfNN2+Ec20neVjSEIQrMWHhcG1ckiNf9Kq2/IBlldBjiXufxtYko9VzCyT3SHzQ
         AXXiYSSnrar1pBlKTXDbhe9EmQfOn6CFK3yUdwzp8zqKUd5rjwS7Lrj8jFHVdioRrfqO
         F+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388133; x=1744992933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yT0F91CBZ5cB0JDXSj1e0tey/TyTjr0AH6774qDqY8Q=;
        b=SVZyrdYo8bR3/QkX2wpOGH+KAVmO5FOvBn4obFVy2xTVkV/b50VMsKtuz9wCQ2dFb2
         xclT9tTUqCOW9CtYSwUKvxOGWhvsF07+Vwhevln31f3c6/qRSgE11sNPOhwukeQP62ZO
         gbSTh3Ic5+8NPYRo31l87LC7x4Jhymn/qc/QP6No608s9rngQpQorBHO1hNZyA+aJjpx
         5MImxQny/q/MS2WdNyMQ4j5ZUvRNMhhz0+8orjZOmPTmLlxIgCs+OFS0wpsHCYk7xhuk
         cZV4vXlVgwHUK4YLCQzlQofX8WP6iyLcAQ5jeZyqoJAZUS2sZ9jePWXTMvLrkd1z4TLa
         Pepw==
X-Forwarded-Encrypted: i=1; AJvYcCVLz1MIXKl259vrtT3SBFEOkBn8KVXL/3tEVYBdab3iN1eajX+mAgHMyFmTjHRgiYXJ0RWQpCqTTNdfSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPXFFZCV1w0BKM4/8MFrgD0p5kAcNtS6KMTFhmzlAjLH2bZkrK
	twxH9pZwiDA1UMVhTR5NnnQY831cGZq2Mya3SQvlvWU8MPeQE1qT
X-Gm-Gg: ASbGncstuRFvyeQfxJkh+7xtbiwJBmItjbZhjmkPj3G+fI9M5RDqwszbvME7S5hHeoG
	n9gP1gJSanlctkT/rjxVeRA7pkRFGcJynv5ZizlPqPKOH83L6LAbcZTTZ/uZl/F8jnbJ8RvInsQ
	zCJwZIJx4CQaVoVedXtKMy0RrtSg0O12qxGWZq3O97lX29u9T8MCrmPauJ1lbBGxgOMEbkLOfZH
	/MCMexNmtj7gW/zWyHDknPcWff2hLH9ObnSUOlxLdyE28bTVCV9QhC/qafOIgt69gyWOxDRdaPs
	jD3ZfKP9lGtOa9Frj2x8KaMMny74w7fWv7np84m6l10npqHzg9nQnQMssRPxS7EeJYsT
X-Google-Smtp-Source: AGHT+IEk5cUxa5igAyqTVLGP/ed1g+vshxe2NPkqgXw52+gFYWurM1UXbcbYD9jfUgNa0YaAoWF6MQ==
X-Received: by 2002:a05:6402:51c7:b0:5db:68bd:ab78 with SMTP id 4fb4d7f45d1cf-5f362fb5495mr3019556a12.10.1744388132684;
        Fri, 11 Apr 2025 09:15:32 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:32 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/5] sunxi: h6: dram: split dram_para struct
Date: Fri, 11 Apr 2025 18:14:38 +0200
Message-ID: <20250411161439.4743-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411161439.4743-1-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change is same as in 78aa00c38e86 ("sunxi: H616: dram: split struct
dram_para"), but for H6. This is needed in order to extract common code
between H6 and H616 later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_sun50i_h6.h   |   7 +-
 arch/arm/mach-sunxi/dram_sun50i_h6.c          | 145 ++++++++++--------
 2 files changed, 82 insertions(+), 70 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
index f05a1845b32b..af6cd337d7e0 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
@@ -315,12 +315,15 @@ check_member(sunxi_mctl_phy_reg, dx[3].reserved_0xf0, 0xaf0);
 struct dram_para {
 	u32 clk;
 	enum sunxi_dram_type type;
+	const u8 dx_read_delays[NR_OF_BYTE_LANES][RD_LINES_PER_BYTE_LANE];
+	const u8 dx_write_delays[NR_OF_BYTE_LANES][WR_LINES_PER_BYTE_LANE];
+};
+
+struct dram_config {
 	u8 cols;
 	u8 rows;
 	u8 ranks;
 	u8 bus_full_width;
-	const u8 dx_read_delays[NR_OF_BYTE_LANES][RD_LINES_PER_BYTE_LANE];
-	const u8 dx_write_delays[NR_OF_BYTE_LANES][WR_LINES_PER_BYTE_LANE];
 };
 
 static inline int ns_to_t(int nanoseconds)
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index 24b2cb1579f4..6a9e53f965eb 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -35,13 +35,16 @@
  */
 
 static void mctl_sys_init(u32 clk_rate);
-static void mctl_com_init(const struct dram_para *para);
-static bool mctl_channel_init(const struct dram_para *para);
+static void mctl_com_init(const struct dram_para *para,
+			  const struct dram_config *config);
+static bool mctl_channel_init(const struct dram_para *para,
+			      const struct dram_config *config);
 
-static bool mctl_core_init(struct dram_para *para)
+static bool mctl_core_init(const struct dram_para *para,
+			   const struct dram_config *config)
 {
 	mctl_sys_init(para->clk);
-	mctl_com_init(para);
+	mctl_com_init(para, config);
 	switch (para->type) {
 	case SUNXI_DRAM_TYPE_LPDDR3:
 	case SUNXI_DRAM_TYPE_DDR3:
@@ -50,7 +53,7 @@ static bool mctl_core_init(struct dram_para *para)
 	default:
 		panic("Unsupported DRAM type!");
 	};
-	return mctl_channel_init(para);
+	return mctl_channel_init(para, config);
 }
 
 /* PHY initialisation */
@@ -196,15 +199,15 @@ static void mctl_sys_init(u32 clk_rate)
 	writel(0x8000, &mctl_ctl->unk_0x00c);
 }
 
-static void mctl_set_addrmap(const struct dram_para *para)
+static void mctl_set_addrmap(const struct dram_config *config)
 {
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
-	u8 cols = para->cols;
-	u8 rows = para->rows;
-	u8 ranks = para->ranks;
+	u8 cols = config->cols;
+	u8 rows = config->rows;
+	u8 ranks = config->ranks;
 
-	if (!para->bus_full_width)
+	if (!config->bus_full_width)
 		cols -= 1;
 
 	/* Ranks */
@@ -282,7 +285,8 @@ static void mctl_set_addrmap(const struct dram_para *para)
 	mctl_ctl->addrmap[8] = 0x3F3F;
 }
 
-static void mctl_com_init(const struct dram_para *para)
+static void mctl_com_init(const struct dram_para *para,
+			  const struct dram_config *config)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
@@ -292,7 +296,7 @@ static void mctl_com_init(const struct dram_para *para)
 			(struct sunxi_mctl_phy_reg *)SUNXI_DRAM_PHY0_BASE;
 	u32 reg_val, tmp;
 
-	mctl_set_addrmap(para);
+	mctl_set_addrmap(config);
 
 	setbits_le32(&mctl_com->cr, BIT(31));
 
@@ -311,12 +315,12 @@ static void mctl_com_init(const struct dram_para *para)
 	clrsetbits_le32(&mctl_com->unk_0x008, 0x3f00, reg_val);
 
 	/* TODO: DDR4 */
-	reg_val = MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(para->ranks);
+	reg_val = MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(config->ranks);
 	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
 		reg_val |= MSTR_DEVICETYPE_LPDDR3;
 	if (para->type == SUNXI_DRAM_TYPE_DDR3)
 		reg_val |= MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
-	if (para->bus_full_width)
+	if (config->bus_full_width)
 		reg_val |= MSTR_BUSWIDTH_FULL;
 	else
 		reg_val |= MSTR_BUSWIDTH_HALF;
@@ -328,7 +332,7 @@ static void mctl_com_init(const struct dram_para *para)
 		reg_val = DCR_DDR3 | DCR_DDR8BANK | DCR_DDR2T;
 	writel(reg_val | 0x400, &mctl_phy->dcr);
 
-	if (para->ranks == 2)
+	if (config->ranks == 2)
 		writel(0x0303, &mctl_ctl->odtmap);
 	else
 		writel(0x0201, &mctl_ctl->odtmap);
@@ -346,7 +350,7 @@ static void mctl_com_init(const struct dram_para *para)
 	}
 	writel(reg_val, &mctl_ctl->odtcfg);
 
-	if (!para->bus_full_width) {
+	if (!config->bus_full_width) {
 		writel(0x0, &mctl_phy->dx[2].gcr[0]);
 		writel(0x0, &mctl_phy->dx[3].gcr[0]);
 	}
@@ -411,7 +415,8 @@ static void mctl_bit_delay_set(const struct dram_para *para)
 	}
 }
 
-static bool mctl_channel_init(const struct dram_para *para)
+static bool mctl_channel_init(const struct dram_para *para,
+			      const struct dram_config *config)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
@@ -446,14 +451,14 @@ static bool mctl_channel_init(const struct dram_para *para)
 
 	udelay(100);
 
-	if (para->ranks == 2)
+	if (config->ranks == 2)
 		setbits_le32(&mctl_phy->dtcr[1], 0x30000);
 	else
 		clrsetbits_le32(&mctl_phy->dtcr[1], 0x30000, 0x10000);
 
 	if (sunxi_dram_is_lpddr(para->type))
 		clrbits_le32(&mctl_phy->dtcr[1], BIT(1));
-	if (para->ranks == 2) {
+	if (config->ranks == 2) {
 		writel(0x00010001, &mctl_phy->rankidr);
 		writel(0x20000, &mctl_phy->odtcr);
 	} else {
@@ -555,11 +560,12 @@ static bool mctl_channel_init(const struct dram_para *para)
 	return true;
 }
 
-static void mctl_auto_detect_rank_width(struct dram_para *para)
+static void mctl_auto_detect_rank_width(const struct dram_para *para,
+					struct dram_config *config)
 {
 	/* this is minimum size that it's supported */
-	para->cols = 8;
-	para->rows = 13;
+	config->cols = 8;
+	config->rows = 13;
 
 	/*
 	 * Previous versions of this driver tried to auto detect the rank
@@ -575,68 +581,69 @@ static void mctl_auto_detect_rank_width(struct dram_para *para)
 	 */
 
 	debug("testing 32-bit width, rank = 2\n");
-	para->bus_full_width = 1;
-	para->ranks = 2;
-	if (mctl_core_init(para))
+	config->bus_full_width = 1;
+	config->ranks = 2;
+	if (mctl_core_init(para, config))
 		return;
 
 	debug("testing 32-bit width, rank = 1\n");
-	para->bus_full_width = 1;
-	para->ranks = 1;
-	if (mctl_core_init(para))
+	config->bus_full_width = 1;
+	config->ranks = 1;
+	if (mctl_core_init(para, config))
 		return;
 
 	debug("testing 16-bit width, rank = 2\n");
-	para->bus_full_width = 0;
-	para->ranks = 2;
-	if (mctl_core_init(para))
+	config->bus_full_width = 0;
+	config->ranks = 2;
+	if (mctl_core_init(para, config))
 		return;
 
 	debug("testing 16-bit width, rank = 1\n");
-	para->bus_full_width = 0;
-	para->ranks = 1;
-	if (mctl_core_init(para))
+	config->bus_full_width = 0;
+	config->ranks = 1;
+	if (mctl_core_init(para, config))
 		return;
 
 	panic("This DRAM setup is currently not supported.\n");
 }
 
-static void mctl_auto_detect_dram_size(struct dram_para *para)
+static void mctl_auto_detect_dram_size(const struct dram_para *para,
+				       struct dram_config *config)
 {
 	/* TODO: non-(LP)DDR3 */
 
 	/* detect row address bits */
-	para->cols = 8;
-	para->rows = 18;
-	mctl_core_init(para);
+	config->cols = 8;
+	config->rows = 18;
+	mctl_core_init(para, config);
 
-	for (para->rows = 13; para->rows < 18; para->rows++) {
+	for (config->rows = 13; config->rows < 18; config->rows++) {
 		/* 8 banks, 8 bit per byte and 16/32 bit width */
-		if (mctl_mem_matches((1 << (para->rows + para->cols +
-					    4 + para->bus_full_width))))
+		if (mctl_mem_matches((1 << (config->rows + config->cols +
+					    4 + config->bus_full_width))))
 			break;
 	}
 
 	/* detect column address bits */
-	para->cols = 11;
-	mctl_core_init(para);
+	config->cols = 11;
+	mctl_core_init(para, config);
 
-	for (para->cols = 8; para->cols < 11; para->cols++) {
+	for (config->cols = 8; config->cols < 11; config->cols++) {
 		/* 8 bits per byte and 16/32 bit width */
-		if (mctl_mem_matches(1 << (para->cols + 1 +
-					   para->bus_full_width)))
+		if (mctl_mem_matches(1 << (config->cols + 1 +
+					   config->bus_full_width)))
 			break;
 	}
 }
 
-unsigned long mctl_calc_size(struct dram_para *para)
+unsigned long mctl_calc_size(const struct dram_config *config)
 {
-	u8 width = para->bus_full_width ? 4 : 2;
+	u8 width = config->bus_full_width ? 4 : 2;
 
 	/* TODO: non-(LP)DDR3 */
 
 	/* 8 banks */
-	return (1ULL << (para->cols + para->rows + 3)) * width * para->ranks;
+	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
 }
 
 #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
@@ -661,36 +668,38 @@ unsigned long mctl_calc_size(struct dram_para *para)
 	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
 	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 }}
 
-unsigned long sunxi_dram_init(void)
-{
-	struct sunxi_mctl_com_reg * const mctl_com =
-			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
-	struct sunxi_prcm_reg *const prcm =
-		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
-	struct dram_para para = {
-		.clk = CONFIG_DRAM_CLK,
+static const struct dram_para para = {
+	.clk = CONFIG_DRAM_CLK,
 #ifdef CONFIG_SUNXI_DRAM_H6_LPDDR3
-		.type = SUNXI_DRAM_TYPE_LPDDR3,
-		.dx_read_delays  = SUN50I_H6_LPDDR3_DX_READ_DELAYS,
-		.dx_write_delays = SUN50I_H6_LPDDR3_DX_WRITE_DELAYS,
+	.type = SUNXI_DRAM_TYPE_LPDDR3,
+	.dx_read_delays  = SUN50I_H6_LPDDR3_DX_READ_DELAYS,
+	.dx_write_delays = SUN50I_H6_LPDDR3_DX_WRITE_DELAYS,
 #elif defined(CONFIG_SUNXI_DRAM_H6_DDR3_1333)
-		.type = SUNXI_DRAM_TYPE_DDR3,
-		.dx_read_delays  = SUN50I_H6_DDR3_DX_READ_DELAYS,
-		.dx_write_delays = SUN50I_H6_DDR3_DX_WRITE_DELAYS,
+	.type = SUNXI_DRAM_TYPE_DDR3,
+	.dx_read_delays  = SUN50I_H6_DDR3_DX_READ_DELAYS,
+	.dx_write_delays = SUN50I_H6_DDR3_DX_WRITE_DELAYS,
 #endif
-	};
+};
+
+unsigned long sunxi_dram_init(void)
+{
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	struct dram_config config;
 
 	unsigned long size;
 
 	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
 	clrbits_le32(&prcm->ohms240, 0x3f);
 
-	mctl_auto_detect_rank_width(&para);
-	mctl_auto_detect_dram_size(&para);
+	mctl_auto_detect_rank_width(&para, &config);
+	mctl_auto_detect_dram_size(&para, &config);
 
-	mctl_core_init(&para);
+	mctl_core_init(&para, &config);
 
-	size = mctl_calc_size(&para);
+	size = mctl_calc_size(&config);
 
 	clrsetbits_le32(&mctl_com->cr, 0xf0, (size >> (10 + 10 + 4)) & 0xf0);
 
-- 
2.49.0

