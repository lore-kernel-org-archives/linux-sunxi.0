Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360982FCC06
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297058; cv=none; b=hpbBOOdXbdeg9vLRTh5xu1u5OEZfNM+kkKeY8v40ouUmOhcN0VTOy7a/EDArB5KQ25xmQZcImqe5N3HNXs9ifMdSn46+C8H5vX0xyy9MDa1ITa2hWfPItUwRaaqQQlYU41cU+gWhaktOs5WYFjUm3kMW6yw6n28N9HXRC7gueYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297058; c=relaxed/simple;
	bh=G50jGW8Sxy81Au3k+s1LEHbuHdK1qcThLty+Vc2Rw+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pag73I87hzZdxE8B08hgpmiix5aHyJbOjSBbSo3iuvDq5/DjiPQ28vgr9122giNMhtdYQFFsedhd8mvq9sMl+CRnlL0rEIERrsa28XqrUQk6k+6UbWtkXe9Cf9diQu8/YxjJKSZy7j5mZGCNKATDnGzPsuCS5c3i/wlbbE7XAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8/oU+Ku; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8/oU+Ku"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3ee18913c0so549786266b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297053; x=1760901853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEur3eg0WxHhimUwBT77oBMDrloZhIqqu554ATZTSIU=;
        b=C8/oU+KupqHtQi0jgnn//HyG4ZyIXuKPci3mm67/z+32ocSn7/ofgbbVVkrfhLpLaE
         yme67FrIoXl1QD9qRhV94vULUBAPZCjVa0xJzBVg2ilPj47nFdIpnguQt2IDlFzuV3gO
         TVQiEm+zV+guGVCQ6CecNUGxvSj89GeCnRukl/ERx4rNwB6jgVKYgfpfJW+LXmNyKaP7
         Q9Njb2BiPUGsQ390ieMRWgQ+9lusgKRj5S0IwBBzZJn/zzZ0dQbSA1kEkR22RU1NMh0o
         05P/eOdKFZEJ1s0glMcjOtcixQpmciQWR2KA5YPEYgeDfFgN7fxXfRhGrPWtuttCrzY7
         aPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297053; x=1760901853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEur3eg0WxHhimUwBT77oBMDrloZhIqqu554ATZTSIU=;
        b=w0tqYhPpGCkNiLDqyG4N6SNuF7ZcGxvUQSw8ucXMuJI+rw9labAP5rPZe/JXausKRo
         zLS+0a/dH6BIJ73iOFiUblGAau0L7kCfX8TNoUqVwgftdl3R/vXeDP0OGZHw5yY0dWDJ
         PqafgWPo6b4c995vJwNEe116wWh3V+anj4DrvR92kfzq/yVsc+NdyvF1Z0925dqFn42T
         G5TS8e8fjNaP+LyRa2FlehKyl8Xo7HZL7Xx38KrlnDAHkuFdYGClID4jJi4Wdy/sr7o0
         Fe7nHy5M1zcpaag2GYbC7Ecpu6Kz8LnSDycKc7DqmMJ7PmHbWAMe4DO5X2S9GG5aGqFj
         iQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF5z8lmlHPD6mH5UEOHC2W7QlSxEByMlBLjWI9GDVIEKE8wp8wbqHLeKAkviYyTSrEYPe0N70HplD94g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVBQppDkslLhUrs/XmXv+E6G1oARSi5L9qQRWCla6ryfkQmJm0
	NGd3pYi2WeprVvi6N4isDBd7puaHSZkMtXFvYryT9vIwBaDYpiKToh0v
X-Gm-Gg: ASbGncvHr1qc9YAtCiqdXB8Wba/KcWSE7TebX6kQo4b86XW6oljGkh8GbGYcSkYKCVZ
	u9cGrA4RgvDfFHMM1byPrTyHqDB/I12byY+JxErvtnHBWlxaXh1YYr3ES9Hdx92lt51+KOyMS4Z
	BJ83cEIM9VRh7VE49e8kYmdQiGd406Rf9D2KHpDz3BCgJ703txcNW+YOOLKXTWytLRMMMwHwuW2
	4Chkx9MVnOAoXBJRLUCLwtFDYkJdgXhH8NJIQkzVNr7gUXI/Bb/vTgdxegeGbWNlngf7oKQLWzJ
	OgbJM0ndqHoSn4ydj1L+krFcjh9BXxXHB4hbrTQfm0n3BTixlfY1AGtkAIBdhG9nJGq6bM5PH87
	qehOvdHINAZiSpAmTm1gwA+L6/6IK2FwT4RHftY08YpAnIpqjj1qcz8vOT2u+j5Wvzs1EtMsPCz
	w8NKrFn3/kVg2v9x0Mnzow
X-Google-Smtp-Source: AGHT+IHHuFPEO5bRJtmX+wIbazQ9iUtA2JClYO8n4N9bsYlSgFBEHJB1cpM0BM4TFWJSTf5vGjjwxg==
X-Received: by 2002:a17:907:7251:b0:b3d:d6be:4ca5 with SMTP id a640c23a62f3a-b50a9a6cb5amr1846998566b.1.1760297052910;
        Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 28/30] drm/sun4i: layer: replace mixer with layer struct
Date: Sun, 12 Oct 2025 21:23:28 +0200
Message-ID: <20251012192330.6903-29-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to almost completely decouple layer code from mixer. This is
important for DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c     |  6 +++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     | 27 ++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 24 +++++++++----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 16 ++++++-------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 31 ++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 19 +++++++--------
 9 files changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 30779db2f9b2..ce81c12f511d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -233,14 +233,14 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[layer->mixer->cfg->lay_cfg.ccsc][layer->channel];
+	base = ccsc_base[layer->cfg->ccsc][layer->channel];
 
 	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a01eccfca3a9..10e40ec9a67a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -338,7 +338,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 
 		layer = sun8i_vi_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, i,
-						phy_index, plane_cnt);
+						phy_index, plane_cnt,
+						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -363,7 +364,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 
 		layer = sun8i_ui_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, index,
-						phy_index, plane_cnt);
+						phy_index, plane_cnt,
+						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8629e21f9cf6..52d1b40ab71e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -224,13 +224,14 @@ enum {
 };
 
 struct sun8i_layer {
-	struct drm_plane	plane;
-	struct sun8i_mixer	*mixer;
-	int			type;
-	int			index;
-	int			channel;
-	int			overlay;
-	struct regmap		*regs;
+	struct drm_plane		plane;
+	struct sun8i_mixer		*mixer;
+	int				type;
+	int				index;
+	int				channel;
+	int				overlay;
+	struct regmap			*regs;
+	const struct sun8i_layer_cfg	*cfg;
 };
 
 static inline struct sun8i_layer *
@@ -259,14 +260,14 @@ sun8i_blender_regmap(struct sun8i_mixer *mixer)
 }
 
 static inline u32
-sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
+sun8i_channel_base(struct sun8i_layer *layer)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return DE33_CH_BASE + channel * DE33_CH_SIZE;
-	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
-		return DE3_CH_BASE + channel * DE3_CH_SIZE;
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33)
+		return DE33_CH_BASE + layer->channel * DE33_CH_SIZE;
+	else if (layer->cfg->de_type == SUN8I_MIXER_DE3)
+		return DE3_CH_BASE + layer->channel * DE3_CH_SIZE;
 	else
-		return DE2_CH_BASE + channel * DE2_CH_SIZE;
+		return DE2_CH_BASE + layer->channel * DE2_CH_SIZE;
 }
 
 int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f71f5a8d0427..dc4298590024 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -27,10 +27,9 @@
 
 static void sun8i_ui_layer_disable(struct sun8i_layer *layer)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
-	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
+	u32 ch_base = sun8i_channel_base(layer);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
@@ -38,11 +37,10 @@ static void sun8i_ui_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -61,7 +59,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -70,7 +67,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
 			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -102,7 +99,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
 			sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
 					      hscale, vscale, hphase, vphase,
 					      state->fb->format);
@@ -114,7 +111,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		if (layer->cfg->de_type == SUN8I_MIXER_DE33)
 			sun8i_vi_scaler_enable(layer, false);
 		else
 			sun8i_ui_scaler_enable(layer, false);
@@ -125,14 +122,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	/* Get the physical address of the buffer in memory */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
@@ -190,7 +186,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
+	if (layer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_UI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
@@ -266,7 +262,8 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt)
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg)
 {
 	struct sun8i_layer *layer;
 	int ret;
@@ -281,6 +278,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
+	layer->cfg = cfg;
 
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 9383c3364df3..c357b39999ff 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -54,5 +54,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt);
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 4d06c366de7f..a178da8f532a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -89,18 +89,18 @@ static const u32 lan2coefftab16[240] = {
 	0x0b1c1603, 0x0d1c1502, 0x0e1d1401, 0x0f1d1301,
 };
 
-static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
+static u32 sun8i_ui_scaler_base(struct sun8i_layer *layer)
 {
-	int offset = mixer->cfg->lay_cfg.vi_scaler_num;
+	int offset = layer->cfg->vi_scaler_num;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+	if (layer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * offset +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
+		       DE3_UI_SCALER_UNIT_SIZE * (layer->channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
 		       DE2_VI_SCALER_UNIT_SIZE * offset +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
+		       DE2_UI_SCALER_UNIT_SIZE * (layer->channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
@@ -129,10 +129,9 @@ static int sun8i_ui_scaler_coef_index(unsigned int step)
 
 void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_ui_scaler_base(mixer, layer->channel);
+	base = sun8i_ui_scaler_base(layer);
 
 	if (enable)
 		val = SUN8I_SCALER_GSU_CTRL_EN |
@@ -147,12 +146,11 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 insize, outsize;
 	int i, offset;
 	u32 base;
 
-	base = sun8i_ui_scaler_base(mixer, layer->channel);
+	base = sun8i_ui_scaler_base(layer);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 0286e7322612..afe38ea03beb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -20,10 +20,9 @@
 
 static void sun8i_vi_layer_disable(struct sun8i_layer *layer)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
-	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
+	u32 ch_base = sun8i_channel_base(layer);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
@@ -31,11 +30,10 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -43,7 +41,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	if (!fmt->is_yuv)
 		val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
 	val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(state->alpha >> 8);
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
@@ -53,7 +51,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 
-	if (mixer->cfg->lay_cfg.de2_fcc_alpha) {
+	if (layer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
@@ -77,7 +75,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
 			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -152,7 +150,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		}
 
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->lay_cfg.scanline_yuv : 2048;
+		scanline = subsampled ? layer->cfg->scanline_yuv : 2048;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
@@ -194,7 +192,6 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
@@ -203,7 +200,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	u32 ch_base;
 	int i;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	/* Adjust x and y to be dividable by subsampling factor */
 	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
@@ -278,7 +275,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
+	if (layer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_VI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
@@ -414,7 +411,8 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt)
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg)
 {
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
@@ -432,8 +430,9 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
+	layer->cfg = cfg;
 
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
@@ -452,7 +451,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->lay_cfg.de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de2_fcc_alpha || layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -469,7 +468,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3)
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 89d0c32e63cf..6ec68baa2409 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -59,5 +59,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt);
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg);
 #endif /* _SUN8I_VI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index fe0bb1de6f08..3dec4eeb1ba2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -833,17 +833,17 @@ static const u32 bicubic4coefftab32[480] = {
 	0x1012110d, 0x1012110d, 0x1013110c, 0x1013110c,
 };
 
-static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
+static u32 sun8i_vi_scaler_base(struct sun8i_layer *layer)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33)
 		return DE33_VI_SCALER_UNIT_BASE +
-		       DE33_CH_SIZE * channel;
-	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+		       DE33_CH_SIZE * layer->channel;
+	else if (layer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * channel;
+		       DE3_VI_SCALER_UNIT_SIZE * layer->channel;
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * channel;
+		       DE2_VI_SCALER_UNIT_SIZE * layer->channel;
 }
 
 static int sun8i_vi_scaler_coef_index(unsigned int step)
@@ -914,7 +914,7 @@ void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(layer->mixer, layer->channel);
+	base = sun8i_vi_scaler_base(layer);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -931,12 +931,11 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 chphase, cvphase;
 	u32 insize, outsize;
 	u32 base;
 
-	base = sun8i_vi_scaler_base(mixer, layer->channel);
+	base = sun8i_vi_scaler_base(layer);
 
 	hphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
@@ -960,7 +959,7 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
-- 
2.51.0

