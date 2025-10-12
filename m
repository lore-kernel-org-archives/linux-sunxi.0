Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D82F49EC
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297031; cv=none; b=Y2iqD6XqsrOYJaMz/8HF2DBPEtlDRHgjQcl/6D0ccqPZQ2/Aw1pJ4e4+cU7Daseb73e2AXATlOwkmq0oIg764UakuYjOoTjvaAn8kuqDTKPspjpuNAGYnS+E4o2jgp+9+zR+hFIvqObCu/1oEMl25yXHM86nzbXHxj11FtGc6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297031; c=relaxed/simple;
	bh=MnVQaYVRpCuxuwcIoP09CCaM1HauxqazhwD06u6VpFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7iunlhlsO7IDECKROPXKSpoBO7dxsyVje3iw2uWDC8PBUtAb26Bq0RHwLhaSgo2JB46PYYpYG+mCTBQoC0BxYwRVjyTSCaA5IguaVSZqoqfJJWpc88wARvJ6qpP4TZL/erEq2m7V5H56oKnyygQHklzm77IkOiaJ+271EyyGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkHjQ45I; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkHjQ45I"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b41870fef44so36669266b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297028; x=1760901828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG8bmd+ZBK/ghOVMNjmCpTsnMqAGeyE2Wx03CRuhE1M=;
        b=OkHjQ45IwhrW5b8hd7QeuijngO6QcKeUY/asTIwzY90WnSsAO/SkBbWOF57RxIq0Ql
         ccJj692/7QDUaP6Sk2piI54e/diiPcsPvtiR1ddqkaQNXTTPVpNzlVWq/C87aN+FMGzg
         SeDCzzB/UCBXCvH8+7JHu/smIu3UxdEfDJQpN2MdO7tnKFPQAdxo33/5DXBIwQZ+RP/K
         Xuu7wHW+FiVq01zC3882JbyYr22CzDePqeykAbk8hqYXbQnQw/yfA2j7bzt6MpCh9B+f
         u362+50aD0+wabLFNJXAMjpmXTIske319voFGIAZEp92BLwh5vKKzdGM9MjjX3UN6zlf
         Ll6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297028; x=1760901828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG8bmd+ZBK/ghOVMNjmCpTsnMqAGeyE2Wx03CRuhE1M=;
        b=Nd5tqzL4HkcF15vhZZBuTqxfMkDkVTTfdKk6FbmsmnkwloLU5deQCiovuEad7gVu1G
         RVL52uc5AEGfZ6D2y3OZ0sFRVCGnsETA4UmfLau0DbrKDYWC0IolX8Ifv4QM6+Sc8KYY
         11BGMY8QwjhgSorYudkXDHcKViKAEraqYSdk+OSohY8hrxaKb8Qnxgs5zazfdppXW9fE
         LgVuRvCohhpvUuYE/KztRaFb5frnIxaaC3vtdzncVl5Z6KCsgzhWRDkMh4fpVyEFOsrT
         Evirkzo2i6CQ/nKqteBNV64MJwjiQl84PgjKhjITgD778qEXs0aUsHDoQCvTOdPJzXdj
         Jrvg==
X-Forwarded-Encrypted: i=1; AJvYcCUtWFZ2+58VO8NkHwWAdsGaivgDu5lZK9pZc6a2vJ9yIpdyyca1rzA/dB/zE1y+P9w+3LjmtO6ipLubkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8ItXqcY52YCZrc85QppreJWvA+2UYyCb1a38WVjkcEkQIbHgp
	+Q/UEm5Fg7yPEhRO1dcnVdeYx61fidiAfmt8lwEY+BqY0sVlbK8NChwc
X-Gm-Gg: ASbGncsaD/C3w/6Zbp59xTRi75PD4YPR0H5oi4higlzodIEeFQiOSZuq7k06M2riaUS
	2gTAMt1qO0sdWDOSmYrMzi63f3QxuoDUCOP22gytsBKebLSMDGm7Vs8g+KcFhRQpkUq/F/5Pd28
	s/K4A1ym0bJ3GhzU9OwbqIx1NtkOtUkPWOkl+6/Qq9/WoU71HpvugzOoo+BBPQ0Mdb5yik9tadF
	HDxilOos5w03UGMm3piKfpX2YbbmNKJqw6wXKtL6eu2eGoSkgmExnqcO8+5zcbyGknwTNNYuKE1
	SEPfrSSW6Zy/JGKT9B4TWO1gQpqjMLB02avWDCMJbikMScX8gnqsnxoYcIe/Pd3extD/w6qPUmp
	f4KBbn9C2wukEBs3hVytJNnOdMvmJUfwu5R59sabVRUJKhPxPxvQLdNr3W0IY/I7JtXb47CKO5+
	4r8V+xQgNt/ytFMpmmDw6J1QEZFKdxCxQ=
X-Google-Smtp-Source: AGHT+IEDIL5NJwC44TfJ1I5nI96VrWmynMGreSQjJO21/d5ma6GdYAfY8ReIx6RrzS2f3OpOdrWl4g==
X-Received: by 2002:a17:906:ef04:b0:b3c:8b25:ab74 with SMTP id a640c23a62f3a-b50aa393c32mr2123217066b.10.1760297027731;
        Sun, 12 Oct 2025 12:23:47 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:47 -0700 (PDT)
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
Subject: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Sun, 12 Oct 2025 21:23:07 +0200
Message-ID: <20251012192330.6903-8-jernej.skrabec@gmail.com>
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

With upcoming DE33 support, layer management must be decoupled from
other operations like blender configuration. There are two reasons:
- DE33 will have separate driver for planes and thus it will be harder
  to manage different register spaces
- Architecturaly it's better to split access by modules. Blender is now
  exclusively managed by mixer.

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
2.51.0

