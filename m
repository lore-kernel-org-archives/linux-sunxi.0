Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F933FE3A
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279815; cv=none; b=qdaO01r9mIsTVauGKilMx02w+VcUkZRcBDppyiUd3fcxWbtwkDhJ6pL/wQ4bpgeClupxjilW2UWXClgN7gyJfBpgfges7Y3a/0YgD3cvDkDUcoE66k1SXFqsCnbr38uSlbx5XubFJ+83lOdZwgl92z4XmGinVPu4G5o5me8KpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279815; c=relaxed/simple;
	bh=iGnNI0++SonwGyedd4a7sun41aecxIvT8MUtouuGC4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3JqlEtcck6Ar5H3hJPmG+asYFfsXmhBO6izLpabMeul8SH/hVbA9lkjysGDNRkyVxRXVff6A1TwgF+Z1G1hYmJDE+Wb73jbktmpXTEKLxZ2fJNedbqpbPs7b6+aWLTgj8jy4BXabszj/7V1wzyaY4LzYom2Samhq4Zz0K/xR20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3pUMNXx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3pUMNXx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso5300815e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279812; x=1762884612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
        b=a3pUMNXxD/zLK4Ssno21ExDii4UTsN33tfe/tnvT/rGOWhYLZJb4GMVy1mAPUj6mpe
         gnZxO+uM2hjzqqGj+c64hwo+U8CUCA9sQdKk1Q2A/DxNhFc1qXx+R7bf73WUuMnAcsh4
         KdPFWEgqDoZQFwSY1aWv+x5TKjXorrQP8ByWLAuPEENHy6QYpAUj9RebYnTUzqJWuSOe
         1pdDO+PI5tdeKxs66phhIJoi33qYLixC5AtuxqZ433Wgss7FgDGtZ+h5eAkGIUIl5EdY
         /uqSkbVFX44vJHfLw31hm++lWzJ9KM3lX1OpgZJ4O59IJV1hSqX7l/eJs17w3buChXRF
         FPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279812; x=1762884612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
        b=RPW7M7GoQt5XQh2pkUocptAztPd2ELV7838VHk1tEo5Ib/LsL40LBjThU37r3O1uei
         5kf0KFXYpU7YyV/07/ISLK0xvhuYcvzbdFVffpnNeKq0rQsOdCAhA/eBcUHncG7BiiwK
         cRR81RPKNKdb6acxE3DWKCIbeVg+PL6i4+AsLmCmxjBdJSfNnaWymE5Z7SxyHf9bPIyE
         zqshTc3OS4xJ3Z/VZI2/lyIW8Q1HrEls1ek781gHEF4awZ5WcbxxWXMv8UNvqg8jdJLg
         oKqNZLxb+E8oobhy7hfYtrrcO6O26/sCbu1TLhLTkXwn5HAGRd0jrtZrGCRhJZXVyGpr
         5BpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx2K4EDpesHgmOIbRKQ00YULEYFOOeTPAkoQ4wdPkhscecoKdvUF8Fsrg27tgFbReBfWavhaBj+Hn4Hg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz7Yc4b/K0pstFPU8zl5Vl/+XRdX4TZYp04n8p9L0zXF10fq2a
	fUY1FYe7/89Ffg3J9+SIJzmetUMr6cnu4oNQz9elcwMHtF1FGcod2vLO
X-Gm-Gg: ASbGncsEybAfKsC1BYlFNNdOg6TclizsfxlbEiP4lJ1s/P1epnjJ5KcUMGlaM3R2D8q
	HGs7h5wKKNm49rD7Np13mjcuVZ26WTCC3ffLJBAJM6S0TiHqhrWgiHU7ClGeo8demiv3B5Yjmsl
	RopIV2EL+Pi90e0EZiGTPNGv9kvXbUblvTJoiWezfCqtEp59kG4OBo7w4RSLS2zS2uRjLt6AXD+
	wjNYGdNTIyx0bb2JixKzbN7k1BDp8V0iJ2Z7yD6OTk4FI8dnsTtpVWLenC2PfYmfIJVTZEHGGg3
	RpZrAeEiU9cndBSHHByGkxLXGrYhyiWID6H41CNT8GN8H9ojniDbQw3318zShkEA6Fu0rhS71Uv
	Qsus6owO4+y05A/MzCr0IIx0bTnfm6htEo2bOE4vuxfIySbQ9eFLlBpzkngjnEHcS2bspQf2GZu
	43szDapYAJcPqLF8C3yQ==
X-Google-Smtp-Source: AGHT+IFZg22fNOBq2/+K7yxgA1ojsJmdSdVgUH3x4JG8OH5BRdNvWipWSBISKSpBHgCgvYmvB7tQTA==
X-Received: by 2002:a05:600c:6990:b0:475:de68:3c28 with SMTP id 5b1f17b1804b1-4775cdad710mr2567035e9.8.1762279811690;
        Tue, 04 Nov 2025 10:10:11 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:11 -0800 (PST)
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
Subject: [PATCH v2 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:20 +0100
Message-ID: <20251104180942.61538-9-jernej.skrabec@gmail.com>
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

It turns out that none of the UI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework UI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 12c83c54f9bc..8634d2ee613a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,25 +25,27 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
-	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
-
-	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
-
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   mask, val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 val, ch_base, hw_fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
-
-	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-}
-
 static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_ui_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2

