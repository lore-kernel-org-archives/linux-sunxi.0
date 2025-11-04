Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98833FE03
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279814; cv=none; b=Ky7Vs903g0xbvfswQHs6G+7WzFbm2kO8c4y9q84MxEgdTCqwFzLvDQYh80NYPADVO8qjxpmoetEfyIObuUno/Im17YDn1+dgOGI0yk3twX6Qk7KngYfI5HWyeoLfHiAqJhGIBMURPjlQ2dkER1xi2yWmscel9uPXYmGgR6Z+Xeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279814; c=relaxed/simple;
	bh=skVQGagTyy6PyNFI+F7smYSL+wQwoaFNd4LrPRY1PcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Py3FcYYmSGTmv3OZYi/tKY6YmqmdBdtLgfpkDiItNcFIeFakkMy9VeNujVAWgtd5X7vx2XOOTY6apUx49rliCjeZgnaMx6t/HBwZ2qHWNmwCH15n2xbSjPkPGphwxRj8J2pKWFnGW49p6ZkxDON7J5w84CTdnlEzO6xdp5bi9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHIczXvI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHIczXvI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43595395e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279810; x=1762884610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDqva417xyNryg1IXFcTOy97H9FHEQaAyTZzRiGHEe8=;
        b=GHIczXvIeyRcnuq5LErPkZLulj7zmbN5PEYLKHXSJVVLkegJtkr3DteIRMtoxiT/0q
         +CQgu9D1yx/AWiElJnpXtGnm1eGRGg+71Y1ui8WZkFLMtOphK//DfUw3ydbyZHs4Db4p
         y+Mnk6SubBIp/vRLzNdGjSskrnKwcmIQgKRU25clXpTQWtWjECBZhhjybYrW2/+9l7St
         4yDt0ogy9l3xjWGuJA6miF1Fnl0i3H5QnJ5ALhsOgZM784lwFIS02mLR489lDL9EKYOf
         wVDH6rq0oRrdvAlNXgHajLjWOPoO7YL8zxqTnmRsENSPGygMW7JOQ1yFKDQfyo5vCreL
         ZIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279810; x=1762884610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDqva417xyNryg1IXFcTOy97H9FHEQaAyTZzRiGHEe8=;
        b=Bb1nibqWjRFWiR1gnSX5CeairQkHDmYEVU2OdRgsBcHn8uEqnqL8Un0JE3ggBdSuOz
         vn/R8MUkJPRoQj1aU0X4pdDKx7FMzU/MCV5uwKlNlSvTNedQCDKJCqjMuTEoAiRvZALD
         7lUHvXJX0fvH88e4unSNiau/I3lywjDN3b78ZwXlncCs3wcDJIvvt9k4jjmtOK7HjMEF
         KVjsfkOyUBbSP7eZ3b1p6bWKqft3PkFzeENdi7JfTz6+cGGDT1L/MqzV5YEXwAV3kEQR
         SYYUxi6GETAbk9e7vi4HAN0yXFhqzKOjiKk4nYzMtef5xP3153/8cMYhtYFkVHcfQo7T
         RljA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqSKCuU5A8RQ4Z847+X7iv1gQSAvZizcUhsKiM+gxrqHd64MaSdD4fZzui1X8woNKXKAwmDtRrY4WPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8KABfWCy8FCInbJLkAXWbTiTEgJ1QgPzs3reCXyqkbTTTZRpj
	peeT6f7gENKFOhczw6ppB0h6oPFTjHOiFbUG2ayUTYIDcHKKzh05LJBB
X-Gm-Gg: ASbGncsEa7/YNVRFttT027B+7AUJ4p3hb1FnuQpL1W3bHYwCIxRZ1WUWORj+cbkryKX
	gxT0BblZ4VAlEKmVAoVWYvbA+wfroViQ+dcPTMpZRz1G6RnswGud47ZDFz3iuoeMsmDMcu5Dt5R
	NnyopSl+Fsku076iVgaY79JDAb7Z65jBZd8IKViO72enh3kdThaZloWKkl/YD7yoEUYEPzrL1gT
	+etgOD5deoZVYLxNBzMCdgjsNLgDm7jjTAV/cDGahTLArQQxpH7RG+7tEaEKXxALVUoVGkhWc25
	PLGOJ8MGm1l8KB+3DjGm2UquOH5pYRnpeXB4HANm7x44zMf+K6jbrkMv95HExhdOPIoGn9iIgO9
	u1sZPMmxJMYnli7zjMHhBSyxes7xmB8wsbZFppahcGG73+OEnBve8IlwZmUdwqnzr9YRxatrLYR
	qFeck2Jfp8ZLtkdUUyxwuBeMw4KXgt
X-Google-Smtp-Source: AGHT+IHj09IPAOCbCEAg0ncAsr0LC5H9NwCy7b3YSE8GChtZbFobh2jD5PwMN9j5D94aGK3dEVmPNw==
X-Received: by 2002:a05:600c:19cf:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-4775ce19fa1mr2767805e9.31.1762279810441;
        Tue, 04 Nov 2025 10:10:10 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:10 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Tue,  4 Nov 2025 19:09:19 +0100
Message-ID: <20251104180942.61538-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With upcoming DE33 support, layer management must be decoupled from
other operations like blender configuration. There are two reasons:
- DE33 will have separate driver for planes and thus it will be harder
  to manage different register spaces
- Architecturaly it's better to split access by modules. Blender is now
  exclusively managed by mixer.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 ++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 22 +++-------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 22 +++-------------------
 3 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f7f210a925f8..a3194b71dc6d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,8 +283,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 	drm_for_each_plane(plane, state->dev) {
 		struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
+		int w, h, x, y, zpos;
 		bool enable;
-		int zpos;
 
 		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
 			continue;
@@ -295,10 +295,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 		enable = plane_state->crtc && plane_state->visible;
 		zpos = plane_state->normalized_zpos;
+		x = plane_state->dst.x1;
+		y = plane_state->dst.y1;
+		w = drm_rect_width(&plane_state->dst);
+		h = drm_rect_height(&plane_state->dst);
 
-		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d\n",
+		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
 				 plane->base.id, layer->channel, layer->overlay,
-				 enable, zpos);
+				 enable, zpos, x, y, w, h);
 
 		/*
 		 * We always update the layer enable bit, because it can clear
@@ -312,6 +316,13 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		/* Route layer to pipe based on zpos */
 		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
+
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
+			     SUN8I_MIXER_COORD(x, y));
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
+			     SUN8I_MIXER_SIZE(w, h));
 	}
 
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8baa1d0b53bd..12c83c54f9bc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -47,21 +47,17 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -113,17 +109,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		else
 			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
@@ -230,14 +215,13 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dae6f83cea6e..1f4fa63ef153 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -49,25 +49,21 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
 	u32 hn = 0, hm = 0;
 	u32 vn = 0, vm = 0;
 	bool subsampled;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -180,17 +176,6 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_VDS_UV(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(vn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -350,14 +335,13 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_vi_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_vi_layer_update_formats(mixer, layer->channel,
-- 
2.51.2

