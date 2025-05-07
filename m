Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299228EA65
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649352; cv=none; b=c6W0xJvItsQ0cDnMTKtbGnaTFxLx0niP2BwOuI3K8EndUQ6/hQy32uLFz6EG6DOuraJKndL17cXo77zozj5gXgCSeNlOkG9T48u6VnBtOT7+9OCklLiD3p6PSCG/P+NtUBaXMoL7g45yFAoA+ShZzid4eLqqzbTeZVC/3g+NHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649352; c=relaxed/simple;
	bh=z6YGDBNE8YgbZgk9UzAsRXUoYUKPhdQT2mguQ51KJJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCojk7Q5FKdOKD8WeVcTUkIPzbIKEqpFl/sDeJjlzo9K/Rwvk+2txSyqrTSgyupbUhldstjuhcjwPcvG90MP8N/JUI+w7/5fgSFuMZAUvFInQ+hg9G3iaYlWit6ZuNa8vvsbX3s6HraKVEKHaujx+V1qLGeo8IiXeV0MeiP+YjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf2qwWOE; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf2qwWOE"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72b82c8230aso95623a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649350; x=1747254150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FChX4HbPHcFH7SwQoDWiPJgt7H0MHAmRjwqAvXfJeEI=;
        b=Qf2qwWOEeg/cNR7ysokMbHhCp0ltkq2BHNfaxvF9PpX7MO2mxw1w+Lx/4XjzuHv83N
         pQkR8qimUzfN6AsLxlZlzdI3VElvcZC/cV+gaoUSikTmb8Nmwgib4vChRHDG2NOKf8kd
         ToD33ebZ8G6CX6oz5juDB8iOvx2yQco7mGsRHN1JrxGgw4aeiU2vYXZTdkgdP0xOqd7l
         zLZIs4u+bXD172PHObCIsGQ1Hwaky7zXs3FGch9U+ActuAljdbTSUgI6iY6HZnEcLuVy
         ov9iCGKm4UyRQGZqSGh454b39OISOXxdq4HuZNXcuddQlrLuoPu2BaXNxrkaU7SGQwq6
         +Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649350; x=1747254150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FChX4HbPHcFH7SwQoDWiPJgt7H0MHAmRjwqAvXfJeEI=;
        b=gG2FP8zjrh8f8JWWAw/Ue96ZDnxE5gTY/ldO628a2dDMgRKQaYFGj1uQxAa2vhA7P0
         kI/G8Ea9t9JJpxWgqsFIPypZ+rhCm5auFUa+4Y9Q638I50cxYlh9wJ9x8y4q+2XgjU1X
         9w8mQlR5vQ+tIMz2CRm8zye/2yHT6jdzRFHBy/tYsMCfhgS+3+2zUx8azLeOi1WFV4Ui
         gkSy14WbfeDJfvFM+E+JqyteuWKX7kCHIv9YvqmuoD/Jso21T2JT8BQxB807A/wy3fdC
         zD9JzR2hd1lgZjS6SG8JXkFRk08r8gC7ECA8kDtZrjjg+vGAaNLOEGBUiSdwZ0YCQ9YQ
         zstA==
X-Gm-Message-State: AOJu0YzlLlL3OvhN9LWNUV2oY4H45V/6fmHmdCePZ17fFsqxzr4Mar/X
	BQI/zciCnbtJPDFQGQap1lyXbQBlV03SVeYKQ21NfPtjS6XXQPASJhOzvA==
X-Gm-Gg: ASbGncvjRhajRvkQvgRmtYe0a2ICLoHfV/+zCL9qPBehiAU2CO/xcMK1TfagkgQ4mVO
	PyzuJqOpalWYhMJRa/xW3Wtui1nvLZMHC05tGkb9lfhfiOGY2JqZwSkxODLjsqGDLANn5S4sLkJ
	sWSxv/h85ceSKNBH1bxbpiebvIOD9lDZa+pmlKjcaLlE6uKwXWhV86MzduEH5kTRO9cznLSIzKd
	zMk+Ygv8HDcS4Oy7MEYwM67iaiutZhiFBYNXgvu0nKv6xa5PSgy7uDAQ2wQl7pubfbNyXwzoZgR
	dfOBqor/6277Rlx43JnjIdOl4SCyArJa7nHZ5sAQV+Oavg7CcHGe+KpPoW5r
X-Google-Smtp-Source: AGHT+IFHBAXmHLkelyUfdZjf+2qzqyoKvotWVNCidxvDTgJcSnrDbNQLo/zYKfzVjmSsgQ4b1Qq5eA==
X-Received: by 2002:a05:6830:6611:b0:72c:320b:f827 with SMTP id 46e09a7af769-73210a70846mr3115892a34.6.1746649349730;
        Wed, 07 May 2025 13:22:29 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:29 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V9 03/24] drm: sun4i: de2/de3: add mixer version enum
Date: Wed,  7 May 2025 15:19:22 -0500
Message-ID: <20250507201943.330111-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner DE2 and DE3 display engine mixers are currently identified
by a simple boolean flag. This will not scale to support additional DE
variants.

Convert the boolean flag to an enum.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
Changelog v5..v6:
- Update struct comment regarding change from is_de3 flag to de_type
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 14 ++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 ++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 ++--
 6 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f70..6f4a2e9c6fca 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -212,7 +212,7 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
 						mode, encoding, range);
 		return;
@@ -228,7 +228,7 @@ void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
 		return;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..2252bef19597 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -537,7 +537,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	base = sun8i_blender_base(mixer);
 
 	/* Reset registers and disable unused sub-engines */
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -628,6 +628,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.ui_num		= 3,
@@ -636,6 +637,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.ui_num		= 1,
@@ -644,6 +646,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -653,6 +656,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -662,6 +666,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -670,6 +675,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
+	.de_type = sun8i_mixer_de2,
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
@@ -680,6 +686,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -689,6 +696,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
@@ -698,6 +706,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
@@ -707,6 +716,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -716,7 +726,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
-	.is_de3		= true,
+	.de_type	= sun8i_mixer_de3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0..7fe5ce20082a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -162,7 +162,7 @@ enum {
  * @ccsc: select set of CCSC base addresses from the enumeration above.
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
- * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -214,7 +214,7 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
 static inline u32
 sun8i_blender_base(struct sun8i_mixer *mixer)
 {
-	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
+	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index ae0806bccac7..504ffa0971a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	int vi_num = mixer->cfg->vi_num;
 
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
 		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496..a7a3a75ffd63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -25,7 +25,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
 		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
 		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
@@ -483,7 +483,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
@@ -507,7 +507,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
+	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= sun8i_mixer_de3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -524,7 +524,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type >= sun8i_mixer_de3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9..ad87ab395803 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,7 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -956,7 +956,7 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
-- 
2.43.0

