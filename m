Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D222F7AC1
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297038; cv=none; b=OwzfWbulAA6+NlkBW2VJWobYilbiHiUM1obWeSN0sGv+VfKylHEI6lo5KsELUg3FGeh8Ib41PD6RdpjocMC2Pl4ijHptdT1NWXDEKFqduoGjPz25ffbKTut1paU2EVZ/4yCmyX+Q8lMQl9bPd6Gl3Nve4UYc4UmjXxlVD5zMrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297038; c=relaxed/simple;
	bh=cQ3BDWz3+BQP/wtA4CRUpOhEhzqT72tIcXggJtG7sus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAaxZ9v6YI41jtFWlggCpScgaKq9/kl8vjUmE6IVssSo/1Xv50+i99RZKjh6BZGnuM7Mn5QJQjbYKQ2DvanPdMZqo2mzoKJSWn8FH83T/JJLMNDm51OWfZJBwSMXLUslFC+XdiajlYFXHl+EJiRLWtxSlWu02FqQqh6CwoiUxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbFFdr3u; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbFFdr3u"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b54f55a290cso469283566b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297035; x=1760901835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN9JZUnTMzqv0Kva4/oSm7+m7qLCjBjh91j5rj1nu0o=;
        b=gbFFdr3uNnOqPSVXMoK1luzgnhYLEurFbCHIXMC32TEzxOD2+atjOJ0dk1j7HdeYb4
         V9Jz9A9s08i9lExbc4nwm+ncWKpVBDL6FrfkcO4sHYWcnD4o+dvATI9TJN/1JlwmCaWW
         I+42+SaZiB25Bnm06i2cG1ZS2tbuc6FlDUjH87ohOC5I11wasnO4Ex1a4kdh27+zBZ0y
         DYusn2grC1Uvw6NYLIOMFiTQrLQzD4zgaviDOapjKwTjg+v2E8Lu4fRz3w9JpJ44K/IY
         rAPNIm+SteqmsS51kLDMWCuTHC2Z+vevF1E0UlwwSnBstCiCWMaMQew3uqRW4r7mrDlr
         SeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297035; x=1760901835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN9JZUnTMzqv0Kva4/oSm7+m7qLCjBjh91j5rj1nu0o=;
        b=feibyoZunRPUZkZ94O3bx3Ff6TMBszbLddlo5gpdYqjTynEYPUv/uChVzPDtN0Eipy
         jEDdevW7swb7SlXGDU4CvvWPXhqiMjuUOmKzqsfJEidzdFW2SlmC4Jpv07F4Z5zAKVb+
         GdjsPyxUiCbBwn63HeFXqvYsHKj//6PWrur7GaB4aXo411UnrVyd40PfiZFvWxuT1ikA
         EtX6odkKDXYHSmYdSVgt8tI2rOcTwiin3ZokmpqkM1yZ+BrawZAIGLucEAW9tkaU5PXz
         NtLwNXbcBgz/nARK6VKZc89dR6oTf0tkyOULS2lrGuHTUKcVyNejp/+XIn5rZZf/JF6w
         9QlA==
X-Forwarded-Encrypted: i=1; AJvYcCVv2uaqlsuKMhWv8MDzQsVI9EUgMPgXvcWTE6YiObeF4bqjZpVogFoEUhLFeKShFxJT8/hUK1qgLrCdDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfvOmaiWadeNxb6OIvijRsmv0JfyixkNOAWIXzGjS9xFOBkw3T
	ofD2zb4UH4GCfWuOYXTl6kJIWMkiHaZ/JkdsVGCt0/ayNMgLxRPQH9kO
X-Gm-Gg: ASbGnctpmYQnDfIPkewHaTz0H7E0v2excHtqFp1IvfUweLYBViMW9C/XUcP6LlD77UH
	A1fIbI6YAzagskBElFIyeR+tqioGvlHI7efUizmFSkVPaJBtZmQ4Ef4fsY12xBdG3ef2+/xdyVA
	73ej9t6jhaboGb9egOSx1QWCT2Td/XpvlPPRSzyF7lw7Oc9ByFxlH5aFlyE8rLYE+AGA7mKrd4y
	w6zrrFWncdwapw7V231jifq/p1ydq+/u66oWfvHuq/R1KnMHFv+Uy748JwYMhA3kc/96jIjeOlt
	E/572kNsqIKTERPLFPpMt+50r5zP0zvIlPamqpwu8Z1JUp0wSgNTJP0Vd5KHGFoYJKKunxJORJJ
	Ffi6Y3WzskSsYvIYE+eZS30jKIAVcA0dL5ZE45E1Kmj4X5uqCTfodCSSxCGtoD5W5ge4aGJHNng
	GnpekDg2HDTH9muJ3bmGvK
X-Google-Smtp-Source: AGHT+IEtEdBabmTMqnIubXcrSPakmD6rKWlEr2K1/L9cKjSZtJR06uujVWalB21YsUjTI/XrkX/8/g==
X-Received: by 2002:a17:906:dc8d:b0:b4e:b7ee:deea with SMTP id a640c23a62f3a-b50aae98206mr2123778566b.27.1760297034667;
        Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
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
Subject: [PATCH 12/30] drm/sun4i: csc: Simplify arguments with taking plane state
Date: Sun, 12 Oct 2025 21:23:12 +0200
Message-ID: <20251012192330.6903-13-jernej.skrabec@gmail.com>
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

Taking plane state directly reduces number of arguments, avoids copying
values and allows making additional decisions. For example, when plane
is disabled, CSC should be turned off.

This is also cleanup for later patches which will move call to another
place.

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
2.51.0

