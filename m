Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9D2F9DBD
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297044; cv=none; b=rHeCcdH7Dqt2Ys/KPp4hC9aQ2bAFsgP5zMGmkeIOZomlC/UZ8r9dXfsFUDthhfSvnIrHkT6JVHcM9J7cWzsmf7ClD7k4W5zyMLh9Pbvt4q06ospactA1whsh3bDSJ4xDzrp5bV6CzZMIvpaE+dh3Qk/9shHd/K2sT6mQARggLpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297044; c=relaxed/simple;
	bh=VMGFXyUFgbi3kCmM6PTUqzyMycpO6B+C8ZN7eSBLhS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NL5WCHRQ3pWmyMe2acBQ7OjcgnwvbX2fnmHR2dMieRl+tJ1hXLXGkSZxPBkyRpsdAB8Jex4bvE39YP3dJqLfdgTTSkb+P2yQYXPfcsUm8g7Mb/xZLDcrFm3lg/4hcFEg6TYicxmj9xwPCyvpSsHTL3JiaO+g9aNnSb4JlxinjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNGz0T1P; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNGz0T1P"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-634a3327ff7so7299664a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297041; x=1760901841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL2EBWUDT3u08ZkUVEOOStqc7WgxRVhnqkwZQdEEL5M=;
        b=UNGz0T1PxLLa9Ck6yPGX458Rcdy+WYjTy3nDKvf05R+Y87oR26/wrdoPgzYHaScvFp
         RVcikgt54+xzfvaCL90iP8J82dezhh+x82Q1c/Uk/ZxhuDqZtk/1Dq9OeDUqTTE42lSZ
         w5tCIBYNIfgkZQVPRtrAqDX8iGBIJN16sIQARmEWu9AhD9L/97zDfpSDIdI4X5ddBp4T
         DiZDwDKFWd2oNLR4Os0wRNYVreiZwp/g2E1wKER4sv73GQ6WnLFCEe7FOU/vqSJNDjKe
         jV5kcBEFRMSbG/UR2RMzM10hK8GZnklLZ5WLJE7ikKXg3/cBvzsc0x9xX4HE7gdQL20v
         pZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297041; x=1760901841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL2EBWUDT3u08ZkUVEOOStqc7WgxRVhnqkwZQdEEL5M=;
        b=Ncaq3YilnkvLTmR5NE6XolFyGZy2irxpHZmRfMDUtLKIy4rX4ItCXZGF+JzTPUeXoq
         M+1wdNCu/6OoL4h/pvEtdTtm9Hnin9BZuJHyfzcn+rXEF67e/hI3/Dvkfe1cmsb2xpru
         J+VeS63ur9Sd8e40sthWlNgbBVsCp37rYO2Jvq/6vM0mwUZ4B8WP3z48G9uevQPdLXUU
         v/GYXxP/0Ok6AERrNLT9p+/MURpBYYARze9Jskbd4GmV484C/lXt5s6oS66WYUztQ2P/
         /uBFTVElOeAMI9EOdNgEgUGPp0V5Zcp0/FtFlXnbm1jrnlznBwxuzRLpB02EFqzO2Kzt
         HlJg==
X-Forwarded-Encrypted: i=1; AJvYcCVCUIo2VDfuTc78218vguNoYQJl8O4bs8+r6/8zpF2X7UXnlCqtu0gmHFORqMJS+PCSlgjEiWniM3EDww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7MTldsnta5bHO+jVA6+B4xdu6yq+Nbf19V8NbOoWA87ay2MrQ
	qlQSJfyIbFSk9GUIGp0j/jHBVp3JYEE74vdo7lesRtSZVPYL3hHqb5Z8
X-Gm-Gg: ASbGncuMAmKLikpOaDNPwdN4UKD936PJ0rlB+ko+Zo2gKWF4tifv56f7j5ebe2r5ekT
	TD1QDfHVqb4JJhH0fR69RXjUP94pDghOmzvluA4eMq7PzNsQuQsNx1BMvabTT6G8OhMxRIXcK5u
	XZZsXscRktTHqNM0krVBt8w6H0o6ib2QsHKvoMCIxmIDjakVXY7FqxAvNPZHNEZzM2vbFuCxm88
	LQoMZM3Uytcsh18cmpPZ6cOeuig8n6eeoJejk96xxcFXx8t/HU2Zk3KYVUcstaBLzh9A+jvG1CY
	JRp8T9q47D6KefoWxxtwXbyEQBINpadl7MIfkG1tKmLiTC0CzSZciU786Q9h8Suw9vXB1RU3zhR
	u6rEJOhSxQh8xJQmWAcI80qqQM4vW4fFvkOPcxDp8sZ71DFWu1/gOfLOdtNQr9YRuwQrzsev3d/
	mnbUv75labKzON2wpidf2WuWfW6jiAswDNoJ46YGOgmQ==
X-Google-Smtp-Source: AGHT+IGPkp7VdpjnXUyPQLeT83O0qdM4azwPi4L4aE39Db/9aQTPTuI9Yl565PGYAFHx9WevGbF8Hg==
X-Received: by 2002:a17:907:3e21:b0:b41:e675:95e5 with SMTP id a640c23a62f3a-b50aaa98160mr1845501866b.23.1760297040342;
        Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
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
Subject: [PATCH 17/30] drm/sun4i: vi_layer: use layer struct instead of multiple args
Date: Sun, 12 Oct 2025 21:23:17 +0200
Message-ID: <20251012192330.6903-18-jernej.skrabec@gmail.com>
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

No functional changes.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 58 +++++++++++++-------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 805db4ea714b..ba9c03f04f03 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,24 +18,24 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
-				   int channel, int overlay)
+static void sun8i_vi_layer_disable(struct sun8i_layer *layer)
 {
-	u32 ch_base = sun8i_channel_base(mixer, channel);
+	struct sun8i_mixer *mixer = layer->mixer;
+	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
-static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
-					     int channel, int overlay,
+static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
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
 
@@ -55,14 +55,15 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 	}
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), val);
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
-static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
+					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -72,9 +73,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
-			 channel, overlay);
+			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -112,7 +113,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 (state->src.y1 >> 16) & ~(format->vsub - 1));
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_SIZE(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_VI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_VI_OVL_SIZE(ch_base),
@@ -161,13 +162,13 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = (src_w << 16) / dst_w;
 		vscale = (src_h << 16) / dst_h;
 
-		sun8i_vi_scaler_setup(mixer, channel, src_w, src_h, dst_w,
+		sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h, dst_w,
 				      dst_h, hscale, vscale, hphase, vphase,
 				      format);
-		sun8i_vi_scaler_enable(mixer, channel, true);
+		sun8i_vi_scaler_enable(mixer, layer->channel, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, channel, false);
+		sun8i_vi_scaler_enable(mixer, layer->channel, false);
 	}
 
 	regmap_write(mixer->engine.regs,
@@ -188,10 +189,11 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
 }
 
-static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
+					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
@@ -200,7 +202,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	u32 ch_base;
 	int i;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	/* Adjust x and y to be dividable by subsampling factor */
 	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
@@ -232,7 +234,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 				 i + 1, fb->pitches[i]);
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_PITCH(ch_base,
-							     overlay, i),
+							     layer->overlay, i),
 			     fb->pitches[i]);
 
 		DRM_DEBUG_DRIVER("Setting %d. buffer address to %pad\n",
@@ -240,7 +242,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_TOP_LADDR(ch_base,
-								 overlay, i),
+								 layer->overlay, i),
 			     lower_32_bits(dma_addr));
 	}
 }
@@ -292,20 +294,16 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible) {
-		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
+		sun8i_vi_layer_disable(layer);
 		return;
 	}
 
-	sun8i_vi_layer_update_attributes(mixer, layer->channel,
-					 layer->overlay, plane);
-	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_csc_config(mixer, layer->channel, new_state);
-	sun8i_vi_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_vi_layer_update_attributes(layer, plane);
+	sun8i_vi_layer_update_coord(layer, plane);
+	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
-- 
2.51.0

