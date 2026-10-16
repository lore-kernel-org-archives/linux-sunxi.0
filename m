Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428F3BE17E
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142228; cv=none; b=N02YjrxsBYmaedjPMolM5KpYNJaOGfEtZzg4nyhvjBblgPILdBU90Dx5JqrauwnSHWO9RSu3S/8aWYV0ihaWp/lDu3w89H+9f+H1hAFtdsNjJRdgvsPJNQrw98qt/E0D964cFPWjEhzGdvB2nZi1Ofaow0r1k+u/IUNdCRVNSRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142228; c=relaxed/simple;
	bh=BTM1eH6dabHVTGt0lQ7T38psoEJBrrB0zhDjJWVQISA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3HyJB48NW6M6EpjQQuhaKEwBRC5v9SFkjQZ7nbFSb3wVT2UhlWNVQ5gA8sdpdFOB42meZMmtXdhhmSVAz0DE+Ms7C/UwE7D4c0f9ios+4IDMWL/6o0NhnPf6VUImKhtob68Dh3nk8Z4os4ZG4qqG+DrDSWw+9ydCnBuTjnp9h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYx8CNfk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYx8CNfk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4827225e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142225; x=1792747025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyWQF35hcWmRxlA01MHKEa5B34AI8NL/fene+IY7BiA=;
        b=hYx8CNfkL8+f5wVW4iU1+rggu6ggm2mY+TnQx6zdlv8BIBu7l+esONxyWardFXATMw
         u0f7BuqkMWn7x12NX0HNyagMIae0WoWN4VTbnQAaskan9/zHyIAR7RGYbYGJP/+p6ZVg
         ll9WOwSuDSfefazI57y39cmVx1IIHOsgaEoeEVJB/MWYhN8HzVEz03HqVR5KKmK5sj9W
         Ncs3hzfcSV1XnssvSuNW9HDFPhgB9lU/OoiPX8efaQsKIbvzoTttDpgOy+tZOGxnHBPc
         r2CK9MqGbAQ7p79HN4SF7m+Qbfbhhbz7MXWZnjYSelgoZLYWoy/rImZW9d0moXA6M3ab
         e3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142225; x=1792747025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyWQF35hcWmRxlA01MHKEa5B34AI8NL/fene+IY7BiA=;
        b=25xNKp+fqeKLcj7L8k04Zr4QaQJm3Tb5v9evEb5n787U3oL/R3fxN1XSxtQCdyrWre
         nj6w7d+I3mXLS71aUS9Yc3wOUI9JcVE9PoKoKGI6biI+uUIalbHHGpaqBAdlLtX9R2tX
         eFlreq0IoHFyfPJGnB0o7a/wwghw8QBnpLscvq9WPUztu+u3kLtox6BPsJSmPaAXE4dI
         AxPa+OnKao1RsCatZiQUn26+c784iE317KIiS3aZh5zWDLO28nnjLxALXKGLTD17tI27
         bOjpjdPuRdfqadg3APK7cghMVE3BFkLLDEfQXW6Zt1v1p/UvqvqpsmvsVQeoA3KBBkGR
         9JsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsUqjut7NjrFO2ga1grsxsKp6y6C753JNCeqTvlxZgl2SuEYRmbecYKiHNUaNAdIIB+GO9m7saJECESw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLMyGUD1OrDSSnIhrrEJlIvEq4ewqS8R7Z4F08lyrbvnPREiFmk
	CCllPwrV+Nx2vekwSjwWB4vi9ymw3wJ2zl7UX6fmjnjL9dn1iSP3728m
X-Gm-Gg: AYBFou0Y9gJxESlSfCKboId/K97N4HgdHFbP3/SrkeTDIU9F720GLFlFRSZfp7H3jr/
	/O0eDjGiATsEpY8oWzpOGB2T7AWdNYCZ3RLvi2gOXMl+NV7yjVUUV9S6JO4kBDZy5yN31NQFgb8
	2P8y/39uznx6YisKPAEghfF3gBUzTNddSLa7JQmnFLhfzSNqZlNFAiy/4Co3dDSckDQHHvacUbA
	O0FNmd6xTEazbeJkplrIEk9OfP5Z0qhUYyoU2VKewnyyIpX/8UdFDEknG7ZRuO8iTmQv5Usi0Rf
	McCCIN2TBNLxvECNR0Nd5A77jMadpMFa7sQW9NfTQTsk73pP+kWDx286fPY7RJ8j91A1g1A7dhO
	9khDOk7sZw/EceEvXKgmnN3tC1F3mexlMXSW2LalGYLYXNYEy660s8HYrHXAPZnWH+ClluN6+aB
	0l7Z12fl6ar9DGdWiUZLTTXNCS3pJlZv9byaoIZX8FuVNwacHiyw4erEBq00M=
X-Received: by 2002:a05:600c:484a:b0:4a1:bb4c:39c1 with SMTP id 5b1f17b1804b1-4a1c66cc388mr40791295e9.16.1792142224960;
        Fri, 16 Oct 2026 02:17:04 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:17:00 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH 2/7] sunxi: dram: support the Allwinner B288
Date: Fri, 16 Oct 2026 10:16:03 +0100
Message-ID: <20261016091608.121842-3-pmazzini@gmail.com>
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

The B288 has the DW controller and PHY of the H3, set up as on the H5.
Gate training finds its ranks and bus width, as in the vendor code.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/mach-sunxi/Kconfig         |  1 +
 arch/arm/mach-sunxi/dram_sunxi_dw.c | 97 +++++++++++++++++++++++++----
 2 files changed, 86 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index ed2402f71f2..0326c7a976b 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -788,6 +788,7 @@ config DRAM_ODT_EN
 	depends on !MACH_SUN50I_H616
 	depends on !MACH_SUN55I_A523
 	default y if MACH_SUN8I_A23
+	default y if MACH_SUN8I_B288
 	default y if MACH_SUNXI_H3_H5
 	default y if MACH_SUN8I_R40
 	default y if MACH_SUN50I
diff --git a/arch/arm/mach-sunxi/dram_sunxi_dw.c b/arch/arm/mach-sunxi/dram_sunxi_dw.c
index 4ed295909ce..ee96186abc6 100644
--- a/arch/arm/mach-sunxi/dram_sunxi_dw.c
+++ b/arch/arm/mach-sunxi/dram_sunxi_dw.c
@@ -21,6 +21,10 @@ static void mctl_phy_init(u32 val)
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
 
+	/* the B288 latches the configuration before triggering */
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_B288))
+		writel(val, &mctl_ctl->pir);
+
 	writel(val | PIR_INIT, &mctl_ctl->pir);
 	mctl_await_completion(&mctl_ctl->pgsr[0], PGSR_INIT_DONE, 0x1);
 }
@@ -48,6 +52,11 @@ static void mctl_set_bit_delays(struct dram_para *para)
 	for (i = 0; i < 4; i++)
 		writel(0x6 << 24, &mctl_ctl->dx[i].sdlr);
 #endif
+	if (IS_ENABLED(CONFIG_MACH_SUN8I_B288)) {
+		/* boot0 uses 8 on DX0/DX1 and 6 on DX2/DX3 */
+		for (i = 0; i < 4; i++)
+			writel((i < 2 ? 0x8 : 0x6) << 24, &mctl_ctl->dx[i].sdlr);
+	}
 
 	setbits_le32(&mctl_ctl->pgcr[0], 1 << 26);
 }
@@ -248,9 +257,24 @@ static void mctl_set_master_priority_r40(void)
 	MBUS_CONF(UNKNOWN3, true,    HIGH, 0, 1280,  144,   64);
 }
 
+/*
+ * The B288 boot0 only sets the MBUS window timer: it leaves the per-port
+ * table, bwcr and mapr alone, so no master is bandwidth limited.
+ */
+static void mctl_set_master_priority_b288(void)
+{
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+
+	clrsetbits_le32(&mctl_com->tmr, 0xfff, 399);
+}
+
 static void mctl_set_master_priority(uint16_t socid)
 {
 	switch (socid) {
+	case SOCID_B288:
+		mctl_set_master_priority_b288();
+		return;
 	case SOCID_H3:
 		mctl_set_master_priority_h3();
 		return;
@@ -430,14 +454,15 @@ static void mctl_sys_init(uint16_t socid, struct dram_para *para)
 	clrbits_le32(&ccm->ahb_gate0, 1 << AHB_GATE_OFFSET_MCTL);
 	clrbits_le32(&ccm->ahb_reset0_cfg, 1 << AHB_RESET_OFFSET_MCTL);
 	clrbits_le32(&ccm->pll5_cfg, CCM_PLL5_CTRL_EN);
-	if (socid == SOCID_A64 || socid == SOCID_R40)
+	if (socid == SOCID_A64 || socid == SOCID_R40 || socid == SOCID_B288)
 		clrbits_le32(&ccm->pll11_cfg, CCM_PLL11_CTRL_EN);
 	udelay(10);
 
 	clrbits_le32(&ccm->dram_clk_cfg, CCM_DRAMCLK_CFG_RST);
 	udelay(1000);
 
-	if (socid == SOCID_A64 || socid == SOCID_R40) {
+	if (socid == SOCID_A64 || socid == SOCID_R40 || socid == SOCID_B288) {
+		/* The B288 feeds the controller from PLL_DDR1 (pll11), too */
 		clock_set_pll11(CONFIG_DRAM_CLK * 2 * 1000000, false);
 		clrsetbits_le32(&ccm->dram_clk_cfg,
 				CCM_DRAMCLK_CFG_DIV_MASK |
@@ -464,7 +489,8 @@ static void mctl_sys_init(uint16_t socid, struct dram_para *para)
 	setbits_le32(&ccm->dram_clk_cfg, CCM_DRAMCLK_CFG_RST);
 	udelay(10);
 
-	writel(socid == SOCID_H5 ? 0x8000 : 0xc00e, &mctl_ctl->clken);
+	writel((socid == SOCID_H5 || socid == SOCID_B288) ? 0x8000 : 0xc00e,
+	       &mctl_ctl->clken);
 	udelay(500);
 }
 
@@ -473,6 +499,14 @@ static void mctl_sys_init(uint16_t socid, struct dram_para *para)
 #define DX_GCR_ODT_ALWAYS_ON	(0x1 << 4)
 #define DX_GCR_ODT_OFF		(0x2 << 4)
 
+static void mctl_set_odtmap(struct dram_para *para)
+{
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	writel(para->dual_rank ? 0x00000303 : 0x00000201, &mctl_ctl->odtmap);
+}
+
 static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
@@ -488,7 +522,7 @@ static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 
 	/* setting VTC, default disable all VT */
 	clrbits_le32(&mctl_ctl->pgcr[0], (1 << 30) | 0x3f);
-	if (socid == SOCID_H5)
+	if (socid == SOCID_H5 || socid == SOCID_B288)
 		setbits_le32(&mctl_ctl->pgcr[1], (1 << 24) | (1 << 26));
 	else
 		clrsetbits_le32(&mctl_ctl->pgcr[1], 1 << 24, 1 << 26);
@@ -515,8 +549,9 @@ static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 	}
 
 	/* AC PDR should always ON */
-	clrsetbits_le32(&mctl_ctl->aciocr, socid == SOCID_H5 ? (0x1 << 11) : 0,
-			0x1 << 1);
+	clrsetbits_le32(&mctl_ctl->aciocr,
+			(socid == SOCID_H5 || socid == SOCID_B288) ?
+			(0x1 << 11) : 0, 0x1 << 1);
 
 	/* set DQS auto gating PD mode */
 	setbits_le32(&mctl_ctl->pgcr[2], 0x3 << 6);
@@ -535,7 +570,8 @@ static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 		/* dphy & aphy phase select 270 degree */
 		clrsetbits_le32(&mctl_ctl->pgcr[2], (0x3 << 10) | (0x3 << 8),
 				(0x1 << 10) | (0x1 << 8));
-	} else if (socid == SOCID_A64 || socid == SOCID_H5) {
+	} else if (socid == SOCID_A64 || socid == SOCID_H5 ||
+		   socid == SOCID_B288) {
 		/* dphy & aphy phase select ? */
 		clrsetbits_le32(&mctl_ctl->pgcr[2], (0x3 << 10) | (0x3 << 8),
 				(0x0 << 10) | (0x3 << 8));
@@ -572,6 +608,19 @@ static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 
 		mctl_phy_init(PIR_PLLINIT | PIR_DCAL | PIR_PHYRST |
 			      PIR_DRAMRST | PIR_DRAMINIT | PIR_QSGATE);
+	} else if (socid == SOCID_B288) {
+		/* A 24-bit zqcr value, as on the A64; the H3 quirk hangs */
+		clrsetbits_le32(&mctl_ctl->zqcr, 0xffffff, CONFIG_DRAM_ZQ);
+		mctl_set_odtmap(para);
+
+		/* DQS gating mode 1: gate training finds the ranks and lanes */
+		clrbits_le32(&mctl_ctl->pgcr[2], 0x3 << 6);
+		clrbits_le32(&mctl_ctl->dqsgmr, 0x107);
+		/* the vendor's training configuration */
+		clrsetbits_le32(&mctl_ctl->dtcr, 0xffffff, 0x3087);
+		mctl_phy_init(PIR_ZCAL | PIR_PLLINIT | PIR_PHYRST);
+		mctl_phy_init(PIR_DCAL | PIR_DRAMRST | PIR_DRAMINIT |
+			      PIR_QSGATE);
 	} else if (socid == SOCID_H3) {
 		mctl_h3_zq_calibration_quirk(para);
 
@@ -636,7 +685,7 @@ static int mctl_channel_init(uint16_t socid, struct dram_para *para)
 	udelay(10);
 
 	/* set PGCR3, CKE polarity */
-	if (socid == SOCID_H3 || socid == SOCID_V3S)
+	if (socid == SOCID_H3 || socid == SOCID_V3S || socid == SOCID_B288)
 		writel(0x00aa0060, &mctl_ctl->pgcr[3]);
 	else if (socid == SOCID_A64 || socid == SOCID_H5 || socid == SOCID_R40)
 		writel(0xc0aa0060, &mctl_ctl->pgcr[3]);
@@ -822,6 +871,23 @@ static void mctl_auto_detect_dram_size(uint16_t socid, struct dram_para *para)
 	   3,  3,  3,  3,  3,  3,  3,  3,			\
 	   3,  3,  3,  3,  2,  0,  0      }
 
+/* As programmed by the B288 boot0 */
+#define SUN8I_B288_DX_READ_DELAYS				\
+	{{ 16, 17, 18, 19, 18, 19, 19, 19, 16,  0,  0 },	\
+	 { 26, 26, 26, 25, 25, 25, 25, 25, 20,  0,  0 },	\
+	 { 20, 22, 24, 22, 26, 25, 25, 25, 20,  0,  0 },	\
+	 { 21, 21, 21, 20, 20, 19, 19, 19, 18,  0,  0 }}
+#define SUN8I_B288_DX_WRITE_DELAYS				\
+	{{  0,  1,  3,  3,  3,  3,  3,  4,  3, 11,  0 },	\
+	 {  3,  3,  4,  4,  3,  3,  3,  3,  3, 11,  0 },	\
+	 {  0,  3,  3,  1,  6,  6,  5,  6,  3,  9,  0 },	\
+	 {  5,  5,  6,  6,  4,  5,  3,  3,  3,  9,  0 }}
+#define SUN8I_B288_AC_DELAYS					\
+	{  0,  0,  8,  3,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  3,  0,  0      }
+
 unsigned long sunxi_dram_init(void)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
@@ -851,6 +917,10 @@ unsigned long sunxi_dram_init(void)
 		.dx_read_delays  = SUN8I_H3_DX_READ_DELAYS,
 		.dx_write_delays = SUN8I_H3_DX_WRITE_DELAYS,
 		.ac_delays	 = SUN8I_H3_AC_DELAYS,
+#elif defined(CONFIG_MACH_SUN8I_B288)
+		.dx_read_delays  = SUN8I_B288_DX_READ_DELAYS,
+		.dx_write_delays = SUN8I_B288_DX_WRITE_DELAYS,
+		.ac_delays	 = SUN8I_B288_AC_DELAYS,
 #elif defined(CONFIG_MACH_SUN8I_V3S)
 		.dx_read_delays  = SUN8I_V3S_DX_READ_DELAYS,
 		.dx_write_delays = SUN8I_V3S_DX_WRITE_DELAYS,
@@ -878,6 +948,8 @@ unsigned long sunxi_dram_init(void)
 	uint16_t socid = SOCID_H3;
 #elif defined(CONFIG_MACH_SUN8I_R40)
 	uint16_t socid = SOCID_R40;
+#elif defined(CONFIG_MACH_SUN8I_B288)
+	uint16_t socid = SOCID_B288;
 #elif defined(CONFIG_MACH_SUN8I_V3S)
 	uint16_t socid = SOCID_V3S;
 #elif defined(CONFIG_MACH_SUN50I)
@@ -890,12 +962,13 @@ unsigned long sunxi_dram_init(void)
 	if (mctl_channel_init(socid, &para))
 		return 0;
 
-	if (para.dual_rank)
-		writel(0x00000303, &mctl_ctl->odtmap);
-	else
-		writel(0x00000201, &mctl_ctl->odtmap);
+	mctl_set_odtmap(&para);
 	udelay(1);
 
+	/* the B288 trains with static DX clocks; dynamic from now on */
+	if (socid == SOCID_B288)
+		clrbits_le32(&mctl_ctl->pgcr[0], (0x3 << 14) | (0x3 << 12));
+
 	/* odt delay */
 	if (socid == SOCID_H3)
 		writel(0x0c000400, &mctl_ctl->odtcfg);
-- 
2.52.0

