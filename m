Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3AF344045
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279826; cv=none; b=XR7NeWfTV5IrhJ4qcc9Tuq/iq4NCBCdHun9S/UoZNjz9kSOIX/M/z7jyQyqkaEzIcbzAQNAiy3eCwCpnZCOkqeWQELqEzdKzkMkI4VJNPY81B6hDlKg9OcQjzJpP3/9DXWAOIhpTuWvrUW6MD5Wb3E6Eh1U9LPMH7BkHkdVhP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279826; c=relaxed/simple;
	bh=EUxwqvnihoEVCgnylqZr5GEYPPFaWHBMxkmn3kEO75k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrlMnX+q8SQbM43OLHIQhhlzEzdhPaKixTTd00HgDN4/ZTwpJ6mOp0uo8Dqpye97x5ih+s3Ut0v9C5sjOhmuuvjFcg8r0bWd2A9YUXu/GIsNkLMXKDpAcHb3Q+zs6+E903hfSYm90ahj/QsFXFWsbCEN4PHcuOrDmd9B8GxgKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShbhFVa6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShbhFVa6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471b80b994bso75235545e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279822; x=1762884622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDehL28Q27cYBAOVsoKs4qDMfKKiwU8P48oybsPCNMI=;
        b=ShbhFVa6qZaUwurUFVzAwmDTXGmUX+Vn+Re/dVZeI8HPJkvACfK5rPprQVx7rXlfvH
         p/9OC6kEiMoZqUGWzOvpyA0yhMGQcKzGtdrEeinoSL0F2cTlcLa1xN12n7+jXjbirsKM
         3tX9O364x5eewElW8j8/7/PTMHLZ6kwDDGvE4BDFnnnkwvETlrSoKEkO2JPyD8QRx5KC
         qCQlKTBlAHlAc1qsLoi+RpnoKtAO4OsmgK0081xpNpIBptejq09HhJw1F0i9FWN9vUi8
         7H3mLdaXW+7ljka+2FX+rSC5J0N+vhwIvQX1RgrNakhPkTd5sPJ1uZdp9780BCPJ4Rlw
         V5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279822; x=1762884622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDehL28Q27cYBAOVsoKs4qDMfKKiwU8P48oybsPCNMI=;
        b=BTA+tlClXjm032XnmEVzuv6FhTmWicSgaxZxjXVesxNY9684OV6iken9G3aV3PLJrn
         ZHmtNPH6jms17nyv2d+Xqfav15dszaKmjMX+TecMhPZRjHmu+NZmslg22TgAcO1Ur1/B
         rmJr5LSQvd8cgT+VqXla1dqkqFnqkVt6V2Y8c58Hc9wP7WRoE7mFICvqmo7Yzvlo43yc
         knC4dSK8p8/t2JbixQTT//1UcjjnINN0g5kJq3WWpPzM8RWFj6Snc4m1m5xFt6CL/1B7
         ZFui00Ry8tdRusY3tBW6H4TXp8EEspYPIalF/qvFpPfH4BF1PUEVjys5XtY76cPXJOlv
         nkiw==
X-Forwarded-Encrypted: i=1; AJvYcCXFzqgOMG54hgDKGyEKUKtC1JGL8YmS0dL/PhouoxsqzP+R305sEOc0iA3RfecZ2ouCqigbeZsac7+cqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt9QhGbhsNUYlAolfZyQdNGqutvi3F0QNlk7LJZpoR4it/u2bl
	2eV2HbM7IRBRJcckkXdUYUHTHj8covoMcQmj0JlAFxcV5fwuagqpY6Pp
X-Gm-Gg: ASbGnct9o18WssP3dx+iGJWA0ebpZMMpSTPcJySWdssgWt3Opfb+25vGgOhrmSjDolT
	IJ9cYfOu+2fv7cnR1aPqiH49I+t52yIJZdA4Hp2M9NOIaz1E/eprDBeOMtcslDB6dc5jmOS6kVE
	PfDzUFfNEMM5oUSsqzDXLkoTeLvs4a84QHY20bfFaGZQWAHxkhrEVddOEG6fYCXTLRKg7LwICB+
	8LBAdrV9PGYJ5mZ+QhEohCSt6exsoAWDLhcrDKCtnomq3Kd4jKRr4xkiJFNNDd36JOVbTFSHrQa
	hh44G3VnviHIK5zFzHJiEqAFMxy71dUJi7tdaeEEgraHAQhH5hOReLg+PhIC/nhasRhbnmvqDt7
	fNjCL0jJTSpanPzMeT5Gtug+akmlaU5Ok/K/jV4Vgf4c4dPmpL8MIWSeO6mjtE6lMd0RJmcjUSF
	p9aW9FPJG5p0x11CXG3ku/1bra46qE
X-Google-Smtp-Source: AGHT+IH/l6jplGcrJTw+MVPwop24SPu0Xraro0pVDB1OrwY3EC8U4W4qSO/6idS4O2pFVK6xDaJeuQ==
X-Received: by 2002:a05:600c:a00c:b0:477:55ce:f3c8 with SMTP id 5b1f17b1804b1-4775ce13215mr2324825e9.25.1762279822265;
        Tue, 04 Nov 2025 10:10:22 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:21 -0800 (PST)
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
Subject: [PATCH v2 16/30] drm/sun4i: ui_layer: use layer struct instead of multiple args
Date: Tue,  4 Nov 2025 19:09:28 +0100
Message-ID: <20251104180942.61538-17-jernej.skrabec@gmail.com>
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

This change is equally a cleanup (less arguments) and preparation for
DE33 separate plane driver. It will introduce additional register space.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

