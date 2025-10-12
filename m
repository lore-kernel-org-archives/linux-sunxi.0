Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B72F9DB2
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297045; cv=none; b=m4kk6nC/Gmsn6lpLJ8zdvDyMS5Td+uY64rykgBX0HQgVWenmJAfF9KEczFwABZutqREJXx0/JEUy7B2mUTrJjNmlucqSMljpTfjIuCKPY71sb/lRYELQ61EPpDOZxFgR9rvTx+pUQMNUe4cHHyfTh+2V2pr02r/V2GRZugJKK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297045; c=relaxed/simple;
	bh=k6sfFLRDZy5wK4Z9n6cVxPJtWPapLDCxQAuqb+LuH0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CteUwqMtr74+vBX3M9L4tP5xCfhonqAf2U+4uyQP/sPK64qB+Siuk43ay9K053yzJ9xEecFXrdILdAEPw+QiwvKfIF5RwRIB1Dr5chytPkk7mV4Eas0QVsBiFPQK9IbMBT8qD9LSkJfbtPKFsX5kt6MD6O+ZvQvrVf81ncj0MCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvrBR0K3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvrBR0K3"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b00a9989633so650774966b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297039; x=1760901839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE7z3Ym6vzsdMqeurGEJ9WmMXX0dMfNPsEVDzikE/Uo=;
        b=dvrBR0K3jycAkzs0/FMRgPk6UYmZktYY9RxJJMeEoTEVlea+fb06872ftui3FmQOac
         dKUSsz59TKy1svUPceJpieG3lkaZggoN+FVuCYkqR/3/pdvDf53/5+4s/kFNAOMEtEcd
         m5oJCzbv5ZM+/ycx0lynpVdW+5WGftPyxGmg7fgjpqSOP/1Z59tl1yimAua6UR9mExTT
         MJLjmM7WOg3tLKqR8J1DFLq5VEFTQ7CIlg1OtJ1Y6IL49tZrQPiPKZu3F5eRvi5waUW5
         MhwIPuNgEBOn/3joweIvHM8y7be5KpcxNShW1M+HGLHnsi56g4XGAADgJipAfq/N/mLK
         bQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297039; x=1760901839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE7z3Ym6vzsdMqeurGEJ9WmMXX0dMfNPsEVDzikE/Uo=;
        b=C2nBN5JgkvhlWIyDJKalrbJB/yAmMfGPxoq5FecOA+p3QUwV9a9tl8qoG5eDlXcqBr
         aF7d4RMNALSI6MAjR3XaM1LqxB9nj0e+PYPrJE2/4x1rchE9rJ+HngsQRlSIJoeT9Icx
         iipfZBK1yt81NuhdQdUp4IHt7WlucT3HaplM/V/AefiouALiqmmMynWPyk0T9lo51zhm
         5ObRi8tNCi+ZC0EIVbybUQacl4WLCS25rkSVxFL6an2h2LnH9gBtv2Z3EFVPKBUP7NuZ
         7ulZ0mMhbwJzY1ZdD29BSQxnX5xxQOCVaxOkA8642CwOTv6CbOj4Sg+njAqo1sBVpGPU
         zwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqU9ISCu6LlTXOVz8Lf3J28oqSi2q1/GaSmDiGl5bP8p6cUU+RsXWj/Z+rUJQrMF7CNOQhhpZ6+Q32EA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxogxmPN/6sz5vrN7Z+4OD16Fb8PZBl3A4lq9Enigct1xrJa8PT
	KF1D7dRMcJioVp2ivsq4MSQ53SYXtEZ7DCroRIiwZeSDFFf5I6VYRloF
X-Gm-Gg: ASbGncusnxRGOE0Ou3qA4rkF0ZGDFY+m5i7yYe8gVRWPIpuVve+hjARqXT+17RL7+We
	gK/q4VpFwEIv28LawdCsoSo1p8osE0qzKmS3y6OsanYVsg8/xJBxdogCJxTOx4TA1WF6cQ/Fqso
	ArLxbQm75kSChEXboArQnYcnEtcWSopmzg3u/7MZBteuPiBc3ui//b5R6zdpkx+0JFPFSTpg9DG
	UZbp521t3oVG2b/EoINIXHsRpzueMvqB15lFzmHYjoijU0rPV4QPt19V+Zl3M9erVZKlocw78XJ
	fasfU8/UPhuEj4HJM5m5ldO+65K9WsAiBpDlvhJbEsdIdWxMkdK6Vs3UyealFMQekO2b/pGhG7w
	Qxl76i0r3tCJbQkwRqkfNcOVshJG277cTtzkM0MU4DqGaGDW3lds4TsAVb7euiqnXbssFFzyTVa
	OKpl73qQ7XQpWLBZAn0GgO
X-Google-Smtp-Source: AGHT+IF1xOKgWuyI+oCZN9C/Rgac5TfDhPy4n+lEBLcOmhbH8TpPGj6H1LBb8Yf8EpbwReOe4/+GPA==
X-Received: by 2002:a17:907:d48d:b0:b4d:71e9:1662 with SMTP id a640c23a62f3a-b4f43730a39mr2759401266b.30.1760297039238;
        Sun, 12 Oct 2025 12:23:59 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
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
Subject: [PATCH 16/30] drm/sun4i: ui_layer: use layer struct instead of multiple args
Date: Sun, 12 Oct 2025 21:23:16 +0200
Message-ID: <20251012192330.6903-17-jernej.skrabec@gmail.com>
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

This change is equally a cleanup (less arguments) and preparation for
DE33 separate plane driver. It will introduce additional register space.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 62 +++++++++++++-------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8f6fcdfcf52a..d5b7241acdea 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,24 +25,24 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
-				   int channel, int overlay)
+static void sun8i_ui_layer_disable(struct sun8i_layer *layer)
 {
-	u32 ch_base = sun8i_channel_base(mixer, channel);
+	struct sun8i_mixer *mixer = layer->mixer;
+	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
-static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
-					     int channel, int overlay,
+static void sun8i_ui_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -54,22 +54,23 @@ static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
-static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
+					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
 	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
-			 channel, overlay);
+			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -87,7 +88,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 state->src.x1 >> 16, state->src.y1 >> 16);
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_OVL_SIZE(ch_base),
@@ -102,37 +103,38 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		vscale = state->src_h / state->crtc_h;
 
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
-			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+			sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h,
 					      dst_w, dst_h, hscale, vscale,
 					      hphase, vphase,
 					      state->fb->format);
-			sun8i_vi_scaler_enable(mixer, channel, true);
+			sun8i_vi_scaler_enable(mixer, layer->channel, true);
 		} else {
-			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+			sun8i_ui_scaler_setup(mixer, layer->channel, src_w, src_h,
 					      dst_w, dst_h, hscale, vscale,
 					      hphase, vphase);
-			sun8i_ui_scaler_enable(mixer, channel, true);
+			sun8i_ui_scaler_enable(mixer, layer->channel, true);
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			sun8i_vi_scaler_enable(mixer, channel, false);
+			sun8i_vi_scaler_enable(mixer, layer->channel, false);
 		else
-			sun8i_ui_scaler_enable(mixer, channel, false);
+			sun8i_ui_scaler_enable(mixer, layer->channel, false);
 	}
 }
 
-static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
+					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	/* Get the physical address of the buffer in memory */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
@@ -150,13 +152,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, layer->overlay),
 		     fb->pitches[0]);
 
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &dma_addr);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, layer->overlay),
 		     lower_32_bits(dma_addr));
 }
 
@@ -208,19 +210,15 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible) {
-		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
+		sun8i_ui_layer_disable(layer);
 		return;
 	}
 
-	sun8i_ui_layer_update_attributes(mixer, layer->channel,
-					 layer->overlay, plane);
-	sun8i_ui_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_ui_layer_update_attributes(layer, plane);
+	sun8i_ui_layer_update_coord(layer, plane);
+	sun8i_ui_layer_update_buffer(layer, plane);
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
-- 
2.51.0

