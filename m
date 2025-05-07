Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352F28EA6E
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649354; cv=none; b=nQXBJbJM6fmKUChtXr5y28JldWPNVcuNEFdYknT2zClKDNI5jAmQx35VGS6M8P9h4X4gSvjpmRz+Z6VrZodieO/yR68+JKe9QgTD6UHwcfAr/rlC90NtxWv1slOtjKwAHZUfbiAJTzLYVZqe3s9MR3LYfyklkwdxDmdpIlC7kLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649354; c=relaxed/simple;
	bh=BlmSnoOY3tKTiO4SXZtvva25RFRLmIX7O7FRNzv3BXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQG/Oj0Dreb7COgDLjbx1070Ow0Q50sVbBiHoKPfdi87gbGi+saxwkPoxkVzJOnCEBsiDVecyqRhcAIweH90rh6POWaQNhSCMO+FUAYFZWXPyrak9G966j5XBBAZas8e6ZGWMGUiA2P2lJggFaajmDn5Y99sWm+tDqa6+vNNTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grs8GElj; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grs8GElj"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72ec926e828so81609a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649352; x=1747254152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsqJzhzjIRfRwRwW5KEnr0pgS3P/C94H76I0ToCRaW4=;
        b=grs8GEljOOB67ufpudRinBGRlMxkSpOI457zGlhpBaj1TCW8Cs+9RgiOUTraUeQNHC
         VmN/McuQM5vN0mXEBQuoIOOUDC4N2V1qr4oSR7ed8PSvAk9u5F4pU4ttOtYY6x/6YQR6
         sxRHiyuNb+/lROj1v2vIDGkq1Srgyo7KMzHNkitYydC+KZCRPAKHnXQFEFssLunlGkgf
         VjcHtVkR3pkRng1x9HO8GKJjLA7acqAmAiS2trvs8cIVIzCql5KiE5iFDAmBhSDRoCdc
         FIo53tgtMgQuDTTEBk6gvEKP3BuJtOCUtFT5LA0TVVKqNXCwe/0LOc7C2INVygYsUUN3
         vCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649352; x=1747254152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsqJzhzjIRfRwRwW5KEnr0pgS3P/C94H76I0ToCRaW4=;
        b=nSNYals1YseAY6VrF0eQJ/oEFhy6geLjL/dq7IS5jFkNPRm//X9/s4mmCPxxy5+YfY
         p2Mll3KxPTUXV+jAQsubNHo7MhsW5qjc4RD0/oDsNByvFlNhiGAAST/mgqz1t1s3kzlM
         aWFWAoltqXj5fNeWgZvj9I8hq2tpumoMl02EpuJJrM33wTgdiEz9+K55THAuf7hq/oSX
         X/dtW0IqIXtHnFiecaslSP4z+WWaI3/AYakxZBdxGS/aHKCrvAT78QnTH0hbeu4RqHGF
         +gcJ1ubqET60HhZmnckvHEALfN407z1WFWdULOmkw1ZCiAXbmE/N2c2GhilAFuEE79v4
         8fqQ==
X-Gm-Message-State: AOJu0YxKva/J3KeITxY47Q+DGX64I+EMvM12OqY7m4xsn/Ov6vhZyaV4
	EnRT5dgWgVwZXb5g+zjvZPpOp1wx0j5xZpV+jTABjL+jowzokH3wSo/Kxg==
X-Gm-Gg: ASbGnctyEc8TN9uNgyPPNCdG6zIpQZQlUSxKr5yVJmv7uylrrCl4oOIbdAh7+ihiuhk
	gPo3Pa0jQWXyDK8G+svhOaLhcgtOe4i3C3AE65SdwALbK7Exlt0lklqR3I5p9JscU/m/bt3YvVc
	wly/eSGqsX0cn2yOQX97rDOwl+lS3rYt/Zk+P3QoLhurWM16ELStpYPzhpuPDXmGOuVJot7EVzI
	YZd4/W1vSmNsbd55m+qCt5PbBcllItQCe1FKqFUWq7B6/gQ6CxzB0GmpcMoDN49AOWw8jR2/p3K
	AFmCjgOAm1KiEaYY7Icz2OelxwwTlctU+hD+uBw1uzfSLQQ9PyePU3n9kkx3
X-Google-Smtp-Source: AGHT+IH0b4pWiXsfnl+3ontb+86FWlxJwlvMz27qu3StKobB4XT4I8UbfNQlyyevzUiCEMXzW1/HAw==
X-Received: by 2002:a05:6830:d09:b0:72b:9d5e:941c with SMTP id 46e09a7af769-73210aab7f5mr3018363a34.13.1746649352147;
        Wed, 07 May 2025 13:22:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:31 -0700 (PDT)
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
Subject: [PATCH V9 06/24] drm: sun4i: de2/de3: use generic register reference function for layer configuration
Date: Wed,  7 May 2025 15:19:25 -0500
Message-ID: <20250507201943.330111-7-macroalpha82@gmail.com>
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

Use the new blender register lookup function where required in the layer
commit and update code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v2..v3:
- Refactor for 6.11 layer init/modesetting changes
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 41815b42d6d2..cc4da11e2c10 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -274,6 +274,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
+	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -313,8 +314,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 	}
 
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e8..7a21d32ff1e4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -23,6 +23,7 @@
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
+#include "sun8i_vi_scaler.h"
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 					int overlay, struct drm_plane *plane)
@@ -51,6 +52,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -59,6 +61,7 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -103,10 +106,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a7a3a75ffd63..3d81d23d0195 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -55,6 +55,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
+	struct regmap *bld_regs;
 	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -66,6 +67,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 channel, overlay);
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -183,10 +185,10 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
 			 state->dst.x1, state->dst.y1);
 	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(mixer->engine.regs,
+	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
 
-- 
2.43.0

