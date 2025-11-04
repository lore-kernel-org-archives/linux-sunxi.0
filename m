Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D6342169
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279821; cv=none; b=IZ+7IzNwy8g6/7jheBZDuqT84lD5CqKbBnVZ35iHWnvuAlM4gQz/v5gEu+U8bTZViXGubfbp9+Y6OEHDVbaUBHWdxpiom1u4TbMaonfm9yr/Pc6xKBTtP79LBrD2UnK70xxF2L0gKqhyUx1CVrW+R0lGfnjTOAY1gzoqAw9BN0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279821; c=relaxed/simple;
	bh=sUrIHtojc8Cq5HvYFoOttAp1S2R8CQHc4BYGDanaEHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ed0efUsXIYb/tVuBaNFkm+MCQlLu7OJIKQUPOnhH2F7uSCFWWJ+ZU/rRFJ5mkc1t7u4Y0UPf2x4FWmwODU6Ar7vI0hwWpSJDKUEtmg8DF+8FjzSxvSblHwUU/A3U4/gASw8xurcsaen8nHtnAFjOYVseL8vq6zjjmOL8LmrrWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVtL8dBN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVtL8dBN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477549b3082so10394515e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279817; x=1762884617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdhmcynnandPsql64nAYpaShGCfSEifyPJ/Np9JnIqU=;
        b=MVtL8dBNeE06K3e2xpkfhzRsqKCVMMJTjrDzmU/AMBE1dROeyxEAIp9f0ppigjMRGb
         i2peprY66vYKs70gtEc9KEuaByXsc76aDfEb1hnq+1EW7FjEaiL1owFryI69+XZvoxGU
         Y/9rqdWcKciYDY8swXmfVRkBQnv4yKqsy0Kt+8LCxLX953hCU7eGKGUF+bT62oxXr/iz
         SKiEGUpUJupno0+PZtUeFNLO4ltcXusJ5QdUo0fPi/nOzWwUZ3nfmWPt0bYdc/1yshqS
         0ez6kju0XRzjEVbgmq1LYi3RQGXyqnYg5nD7cZYH9NdqLv8nWoz4t13g8X3W8d5/5wX6
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279817; x=1762884617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdhmcynnandPsql64nAYpaShGCfSEifyPJ/Np9JnIqU=;
        b=PkpQL9IRrt2j9zInl/CnEH3krLLeNt688XUqUujUUPyWuqaRslRBppctol6hYSlS5q
         Veif2gIHKt/WouKRdFGDzMlnQKdV1BZlc1yGFKPm/WsCnv9aevZOewBajZ+/NWVC1Hkv
         SH+Va2ljKMSYl0x8+zrHOqKeClVZJE26ZloPs3pDZxh2/CJpnkcRz1p7pCeGX/l7ougN
         ZGNWBivZnTCUj/O61KoyQhmrOgBRhDeXZ3MTo+8Cmhu4mpW/8nOBSsAjlqEUGe184GGb
         4rubVVEyPXBc5VN47L+nBZam0Aazf11874mmHS9Bay6CvpcVsth/umDSsx7LQi2u6snP
         IL0w==
X-Forwarded-Encrypted: i=1; AJvYcCWdcg8yEcC4K7RFWMhaeRjhH2HQw6kAhGuBKYUHMtV60/zblT09Q7Jui5TwUrJy088+mQoK7w7cXzVL7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgf4YAx6+hWH5/Xu0jpYfIC9AXZ69IvA9qLFwOZrRCCGLgPBUt
	NV6BpI/gtnmpus/LmSVNhFDDzJNQVHO4w1D16MxEmfhzNAiJYXUB/0zb
X-Gm-Gg: ASbGncsr0lYQirUNwYCzNtQq/NbXGUWX0+SrklIP/RcQEpCIgVFln5BALBZt+rtgxPm
	yenbXLsebvowDOlTxi2X2qbF3FH0lXdJ4PKYEFT+53JOHkhiTCYVKQQbGAdYMRnOnQEfjYVB1TM
	omtXfByh12mianLECtih8ScbCYumJx6VZPgL260uCQ7/NHmuUJoyofqksSJmEVK+YewkvIb4RJh
	jhrn09/W2gSU5b1xgsi9XFaXKwDjZ7sKKf3iOQXC/y48v9rmxPGKItanmSU8pkNlNVgB50p5YIq
	aE5cH2ALPky0ZAutuWDoWqWqBHIrwO6IVn/31NItBk8+XL97AWrK3GfmmLQQJ1ox4ukOFlwr28C
	/i/d/VGxtULp2b21MJSzC/k3E9b7CwkgQR4Fc6Yt/VUrf2Ihroqbz5S5+nqVZFU2lkNF3o5nlMT
	1uK8TK8/7YC9Vbcsjl/xsqM5skpdEO
X-Google-Smtp-Source: AGHT+IHAn9E17efLdK3gkIKUuQG/k5i67Pxhzd6m2tYSUMyKeGk6z7xhuvIzYFMNgqNcBWlY1dxfwQ==
X-Received: by 2002:a05:600c:524d:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-4775ce12cbcmr2349175e9.25.1762279816823;
        Tue, 04 Nov 2025 10:10:16 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:16 -0800 (PST)
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
Subject: [PATCH v2 12/30] drm/sun4i: csc: Simplify arguments with taking plane state
Date: Tue,  4 Nov 2025 19:09:24 +0100
Message-ID: <20251104180942.61538-13-jernej.skrabec@gmail.com>
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

Taking plane state directly reduces number of arguments, avoids copying
values and allows making additional decisions. For example, when plane
is disabled, CSC should be turned off.

This is also cleanup for later patches which will move call to another
place.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 42 +++++++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 11 ++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 33 +-------------------
 3 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index cf0c5121661b..ac7b62adc7df 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -3,11 +3,20 @@
  * Copyright (C) Jernej Skrabec <jernej.skrabec@siol.net>
  */
 
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 
+enum sun8i_csc_mode {
+	SUN8I_CSC_MODE_OFF,
+	SUN8I_CSC_MODE_YUV2RGB,
+	SUN8I_CSC_MODE_YVU2RGB,
+};
+
 static const u32 ccsc_base[][2] = {
 	[CCSC_MIXER0_LAYOUT]	= {CCSC00_OFFSET, CCSC01_OFFSET},
 	[CCSC_MIXER1_LAYOUT]	= {CCSC10_OFFSET, CCSC11_OFFSET},
@@ -196,21 +205,44 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
+{
+	const struct drm_format_info *format;
+
+	if (!state->crtc || !state->visible)
+		return SUN8I_CSC_MODE_OFF;
+
+	format = state->fb->format;
+	if (!format->is_yuv)
+		return SUN8I_CSC_MODE_OFF;
+
+	switch (format->format) {
+	case DRM_FORMAT_YVU411:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+		return SUN8I_CSC_MODE_YVU2RGB;
+	default:
+		return SUN8I_CSC_MODE_YUV2RGB;
+	}
+}
+
 void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
-		      enum sun8i_csc_mode mode,
-		      enum drm_color_encoding encoding,
-		      enum drm_color_range range)
+		      struct drm_plane_state *state)
 {
+	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
-				     mode, encoding, range);
+				     mode, state->color_encoding,
+				     state->color_range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_setup(mixer->engine.regs, base,
-			mode, encoding, range);
+			mode, state->color_encoding,
+			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 27b6807fc786..ce921521aaca 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_color_mgmt.h>
 
+struct drm_plane_state;
 struct sun8i_mixer;
 
 /* VI channel CSC units offsets */
@@ -22,15 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
-};
-
 void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
-		      enum sun8i_csc_mode mode,
-		      enum drm_color_encoding encoding,
-		      enum drm_color_range range);
+		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index adcd05acba1b..cf83f7ce6c78 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -188,36 +188,6 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
-{
-	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
-
-	switch (format->format) {
-	case DRM_FORMAT_YVU411:
-	case DRM_FORMAT_YVU420:
-	case DRM_FORMAT_YVU422:
-	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
-	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
-	}
-}
-
-static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 csc_mode;
-
-	fmt = state->fb->format;
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	sun8i_csc_config(mixer, channel, csc_mode,
-			 state->color_encoding,
-			 state->color_range);
-}
-
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -333,8 +303,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 					 layer->overlay, plane);
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_vi_layer_update_colors(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_csc_config(mixer, layer->channel, new_state);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2

