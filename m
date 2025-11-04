Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B26334C3D
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279814; cv=none; b=UwYXpAKbIFKT3g5K3LPAzvykQK1TwQ7YpP9HwJ2zgB6eyKB0yqIIs3W9APEEiET4gI10eUL5AIRK8pPkhboRjqbARMX7TPx/MD6r+rL4nU8fTIrRJmPySM360RHeC9esfefK579EJp4qOqWDu5guVPGiGVUbJD7Z5HzM9uoTXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279814; c=relaxed/simple;
	bh=UMLQniINjUdHSGOyeKlaW/QFkXzdQJ8JOe+PvNsMFsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JolA4QB03MD5NGJvHBxQd5ARG7WU7WoU3mepuHIpuWaFbfj2FDjLki3YxUns4U217jHhgGKix05+7Bfn5TsGDMCAlIwxrvAHpPBSgZwzyBqaKVAEcEzsiGWJJXapC7l8TvAEPNKjOwBIeDVts0iMn+424ZTHZ9oFBRjxcxw+aSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8TTadjF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8TTadjF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso2513045e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279809; x=1762884609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
        b=E8TTadjF+iZOERx5YlqbByG5s6kRRctFxfBGAM/dvlRdgCtTmqRZfB0XPutlN0qdLx
         yUOumfMz53ec0DbxXtWy1bRPL0eCB6FGFaRU+qBdfiQG9dbYtKAZiompJuQNcaOC6pSE
         DdW/I8ThXZgS7ithdFF3IrSbdNfy/S0mIvSmHCzpvgwFNHSWBwGgMdFjNomSRfyMX0jA
         sCm7hdEtEGB1s9ZSgtCUnSfEES4KXkJ2O4S/PWKv52jAmjaYVlE3dr8JJB0M4a5sdjAy
         72ioX9x7+VOyVrLwavx4PbLZhYf+vS0m1rDJoGDo9UGECuzPaOurzwWRsLn5AUcQ5awM
         4PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279809; x=1762884609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UxxEnvD5E7Y1WhJtD+AnEMx6VMSP1mmylf6BBTY00A=;
        b=HooYF3tTgDHpviQLsNq82H72xtg+pgKwzvGoWPljj/o9MJI8ojz4kyOSAgZOBxIoKz
         IKh9F5I7UuzpqqtrEHaXRmrnri0htl5RYvSPLvnyln59ym6at8ron6OqmDtXN4TnWtV+
         s1Rzhlq3zgV6C8Jt/fn/gQsc/RO/WhUFDLvO+3k/7e7Fy+MjcfN2bk9a2z8UIbj9eTtd
         p5pp0ActhFKG+WvPT7RZoAnRi4c/T2428+oYlB0J54zD7JW9UZDrNsa1FWxtIbzMJhX9
         LjyxNV/JXRccbb7RxOTdFKFjQog9TPexW92nrowH8XRx+3jp3/5feugpB58BCS+c7pI+
         fxkA==
X-Forwarded-Encrypted: i=1; AJvYcCWSiGI2qxJYmrMzF/+eEyjavxyVAit3oxVhDj6u0sLh+81+4nkVE4khs8YDQ9UsYdnXEW+mggLUBd4JjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+UpYLqdb/LZoX+lEuj4kcaasXSXpLGECLMgfrZ4ZuD+g07X2i
	u901ZV4tTlUzIhygob/oVR6nlcV4sH9FO+G+OomxVk2+onhp67Uw7Dk0
X-Gm-Gg: ASbGncsXN0k0baaxT7ek9PnLizH0jHfBAYwZMUoyKFxdAR7wH5DVHm1qvGLujyuZ//+
	9/VbHsRmTUI68x8Yvb3XhTI5Z5vWX0c8Gcmk2r8afPbn3ghreUXaOw61Wce1Qf70nwqVMw7HhHc
	2Wk7rEsq0grwuCXZL7VMhXcQggw9hLtEE3wLW3fo5+TYjVLMqL07XdoWbeRZkGAGgazNXe+bHfp
	XnHUA0lwHPpX1bOlHtMWUKLRSAwt4PMejROmRZg60ZCOeegFISGRTz9fYOBAtBkFltKwlwShftg
	u1xKFcIwiaJBX1OCAcWk9zIYKuCLVkcErADfrN0Voowb/K0fKz6O0MGl3KbpYJSmLhFyqS32fmF
	hNfNHmsYvv4V+kElHbT9u/avqA9X3FPfgzKYEEqOf15daDmhoDDaf38mVEOFwOap2RmFRFDtD3h
	O8jGI+OsGOtBsNnBD7cQ==
X-Google-Smtp-Source: AGHT+IEJHAiuBYWEtNzJWv6C7uhRnDsBy6FovSk1I1qNjU8+nmp3MeD3eeYgDnF9LcKCHm1OTcNSBg==
X-Received: by 2002:a05:600c:530d:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-4775cdc5874mr2504965e9.14.1762279809223;
        Tue, 04 Nov 2025 10:10:09 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:08 -0800 (PST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Tue,  4 Nov 2025 19:09:18 +0100
Message-ID: <20251104180942.61538-7-jernej.skrabec@gmail.com>
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

Functions called by atomic_commit callback should not fail. None of them
actually returns error, so make them void.

No functional change.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 20 +++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 +++++++-------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index fce7b265c5d8..8baa1d0b53bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -46,9 +46,9 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 			   mask, val);
 }
 
-static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
@@ -124,12 +124,10 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
@@ -144,12 +142,10 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-
-	return 0;
 }
 
-static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -184,8 +180,6 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
 		     lower_32_bits(dma_addr));
-
-	return 0;
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index c80bdece5ffc..dae6f83cea6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,9 +48,9 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-				       int overlay, struct drm_plane *plane,
-				       unsigned int zpos)
+static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane,
+					unsigned int zpos)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
@@ -191,8 +191,6 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	regmap_write(bld_regs,
 		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 		     outsize);
-
-	return 0;
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -211,8 +209,8 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
+					  int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
@@ -246,12 +244,10 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
-
-	return 0;
 }
 
-static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
@@ -305,8 +301,6 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 								 overlay, i),
 			     lower_32_bits(dma_addr));
 	}
-
-	return 0;
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-- 
2.51.2

