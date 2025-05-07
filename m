Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F828ECE2
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649360; cv=none; b=MJNokzbVlVAGnPaZ+WUDHmauhTDO7t13OPfVAC1w7uaDCY/NQKkyjcgVNS/9NUQvU1J6vnHH5iGFu00VX5AF1dGOs5TytgiOEukThA4FuCEVHfsh05V+L63is8IDIlF9E9eO9xikgZcbsaxPg6fT5D+sQyNTwwhN7kFOLDMAgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649360; c=relaxed/simple;
	bh=vguqYpM1TJU6KCu/mF7T2NJsq4W7j/9QCPw1aPrPrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/wZoatAsLXHh8kWZt328OzA7p9Ej6cvHx7hJe4SaARKLh+H97cAfBVsbEOvSeQTiu1COgo8TUXJFYyQe42dyMkJPoASYFQHCsaHCkrz5+qtBgI66HBcV2v9kld9zzuUB5SWu2hc1M8Aghd5+5hhlqHGW8aNyAq1qZU7/34VVjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIkXs88x; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIkXs88x"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72bc3987a05so188859a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649357; x=1747254157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCkxYQTZiYOyR+Z0HyhRX8imCTrNH9/mom0p6oL3w8k=;
        b=SIkXs88xDednel+SJclEKfnaw3OY3x0EXcnAgwPjzugfzssyUvScMbNC1CKJX1oryV
         KWapU7gGQqi0Fk1lXZnhlmWtTLprmB6L7n+yFIJRHgeu8CGJ5Vskpphx1KFBo4O/Mu3U
         d/OKdJJ+WF3/oilwXjGKgUceD/Od//lGhJ+oUY/mIdv0u6mcn6ozBtcPECkC2xuZPj7O
         AuiRyRQSqPb5tnRU9rJ7ic5djnkHF6ydkvj9bD/l+V70oXHBcGe4CQr3kJPyYIPNCTDH
         ygEsrYiZXcz/uuyr/f5iIz1zrJRzP+VCiLOZKsxqny176RVq4pe013x3Yl1DT6F1Ysod
         whmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649357; x=1747254157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCkxYQTZiYOyR+Z0HyhRX8imCTrNH9/mom0p6oL3w8k=;
        b=YmEDV9H28RpoTfOgyr85G0o50E56EcbDjc2rNjf/s7ZQnGAjMrcXnsalXEGRHdiBuT
         XhQ0Gku7C63OFRdJKSQ1DfWuiwKFoh1hkTN17/fh0Mcbt2BaEKlzzBuvx5ymsJ5yW60d
         fN+EEsQCr6DKp/QyZxtZtQyehGwQUlUusYocj0U9AiAFD5MPAEgSJTy5meNZww1r9exJ
         7NtTSW0Yz03aubI88tH5wSZpyqkJK5nwbGdsuiAudYyr8UA4gxa+g/sUSfl3HonYOjkt
         BUALLBo8GnK9PlrsW7TO/7tb5kNVxMeS3dHuUCNLmejByhJrChbKB9tJBNk2U54+IODE
         leSQ==
X-Gm-Message-State: AOJu0YyJvaVZX7haYfs7T0aXyzqPdNfOVP+udyAJ3/goI0kYB35WO6tn
	J2iKGi5epfYxy5+IwsOyNgD51ziNC6UuB+FX1ELQRn55XH8fZLi230okMQ==
X-Gm-Gg: ASbGncs23+Cn37HK1kfnqEOIcUoVb9GQruvJKjzCwsgch+6QuO67IIZ5pxL0cmE/WT+
	tI0m1soqgXfYGg1eFzQwRyjXzTxIL3TdGbliaiEwSMxgToJeih9FC0TWKXa5c0Uer7MtVvAS1oC
	9Sqpa/VR2V1ZnQ9rDi7WgAszUEmSvgYWdXjh/i68USWhT+py4R76BvCQPXlNi1GIsnMAvPO7ux2
	6jw6qNlocM1hkIU+3CBGt1HNFmHsTHEUowRjSqx0LKN0r0n8Yr2AyqcakusOiYfpFlGm0SFp0aD
	uYfXW96luuzHCDLlBauSFTfE2YBHMSdAUDHQhtjG9ckKp1YcXF2vcJTb+bWi
X-Google-Smtp-Source: AGHT+IElR4v949rR98S0bxVcO3Egf8iD4lcNd7WMdH1G5d8Bv2kECZyE6C7Z0k635JuRG4DtwT5IpQ==
X-Received: by 2002:a05:6830:398a:b0:727:2731:d5e5 with SMTP id 46e09a7af769-7321b4e9c70mr691398a34.12.1746649356702;
        Wed, 07 May 2025 13:22:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:36 -0700 (PDT)
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
	robh@kernel.org
Subject: [PATCH V9 12/24] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
Date: Wed,  7 May 2025 15:19:31 -0500
Message-ID: <20250507201943.330111-13-macroalpha82@gmail.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

Notable features (from the H616 datasheet and implemented):
- 4096 x 2048 (4K) output support

Other features (implemented but not in this patchset):
- AFBC ARM Frame Buffer Compression support
- YUV pipeline support

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group, and adds a top register map.

The DE33 also appears to remove the global double buffer control
register, present in the DE2 and DE3.

Extend the mixer to support the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v4..v5:
- Whitespace fixes
- Correct strict mode warnings from checkpatch.pl

Changelog v7..v8:
- Add top/disp regmaps to mixer for DE33
- Remove YUV-specific code
- Remove use of global double buffer
- Remove unneeded if/then parentheses and fix an alignment issue as
  suggested by checkpatch.pl

Changelog v8..v9:
- Change devm_platform_ioremap_resource() for the 2nd and 3rd register
  set to devm_platform_ioremap_resource_byname() since we now are
  enforcing reg-names in the device tree.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 22 ++++++--
 2 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cc4da11e2c10..0d4695132dae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -318,8 +318,9 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
-		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	if (mixer->cfg->de_type != sun8i_mixer_de33)
+		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
 static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
@@ -368,25 +369,31 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
 	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
 			 mode->hdisplay, mode->vdisplay);
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
-	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
+	else
+		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -400,12 +407,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
+	.name		= "layers",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xffffc, /* guessed */
 };
 
+static const struct regmap_config sun8i_top_regmap_config = {
+	.name		= "top",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3c,
+};
+
+static const struct regmap_config sun8i_disp_regmap_config = {
+	.name		= "display",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20000,
+};
+
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -428,33 +452,45 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
+	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
 	int plane_cnt, i;
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		top_regs = mixer->top_regs;
+		disp_regs = mixer->disp_regs;
+	} else {
+		top_regs = mixer->engine.regs;
+		disp_regs = mixer->engine.regs;
+	}
+
 	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
 		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
+
 	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
+		regmap_write(disp_regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -526,6 +562,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		return PTR_ERR(mixer->engine.regs);
 	}
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		regs = devm_platform_ioremap_resource_byname(pdev, "top");
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->top_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_top_regmap_config);
+		if (IS_ERR(mixer->top_regs)) {
+			dev_err(dev, "Couldn't create the top regmap\n");
+			return PTR_ERR(mixer->top_regs);
+		}
+
+		regs = devm_platform_ioremap_resource_byname(pdev, "display");
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
+							 &sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 43c413052a22..d87d197610e1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -21,6 +21,9 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -151,6 +154,12 @@ enum {
 	CCSC_D1_MIXER0_LAYOUT,
 };
 
+enum sun8i_mixer_type {
+	sun8i_mixer_de2,
+	sun8i_mixer_de3,
+	sun8i_mixer_de33,
+};
+
 /**
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
@@ -171,8 +180,9 @@ struct sun8i_mixer_cfg {
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
-	unsigned int	is_de3 : 1;
+	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	map[6];
 };
 
 struct sun8i_mixer {
@@ -184,6 +194,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
 };
 
 enum {
@@ -220,13 +233,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 static inline struct regmap *
 sun8i_blender_regmap(struct sun8i_mixer *mixer)
 {
-	return mixer->engine.regs;
+	return mixer->cfg->de_type == sun8i_mixer_de33 ?
+		mixer->disp_regs : mixer->engine.regs;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
-- 
2.43.0

