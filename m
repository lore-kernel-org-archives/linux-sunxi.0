Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C12F39C6
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297030; cv=none; b=jelAOKUtXaAbzAfwA+AwHBDYJgUOEYSM2qNb2bXdBISyfAT8nR82qpPY9SQAa3CAgN7RHk31G8b5zp3vUN1jddFZch9LQgKqaXPjDBauHsZeL4Qa4NYJT/5VcF3JO1MyOKZQgCfMb6WKzEiURNpy4Pgu+OjLlmvxwpWsbIN+MZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297030; c=relaxed/simple;
	bh=fYfxHjveYeIdJwIqKXkDSJoPX/pUtAR0Msi7yyPkYBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtbXwVwDNSRkXU0n2cE44LP5erX8ikf9Yc24owAkEffrUscVA+2lbo5W9zAHUF9ye8NJmWqT5dJLZLqRKp6zreFvd1ZMddi7vXZP3OuH0Uf/TckW4NG4FSutvb7bti+J1EdUxSLdDj5YDdRZzP3a6L6uMN1VaPctTs9wrY5c4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJySS5ab; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJySS5ab"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso6536545a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297027; x=1760901827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
        b=OJySS5ab3c88RZh8Xow+W4JSEZAlY7FmAo+nBfZYGutw+cH7rGDJyuvQy6oRGEWkzX
         4itvYGjTZ5nMbf8dE/0/mRr2qMZ2n/fvQ4DKqXOD7Qndykd2tFbGF1ae6tPF/l4AEI6v
         F0skGhUIja+rKK5OKplJTbc50S17tJBVfEUuZiYPi0AqDBXEpozAeQDolNyDAnt7NL+v
         Wu6XpngWDDQjQL/3L3I4UUWFgYHU3Ac+VGWQFcEZ+ip4Eu/h+jY+bUeQYw94mk5OhHAX
         0iRaJwWAEsg7jP0ZL7I6Ytj15JWwWwGNbsbM8HodKxqB6SsLVaPK1aV2ZRSIU5MGpZjV
         1vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297027; x=1760901827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhSOMeyyVEb/JHhqKdNE9M8XBPkXN/GvjKAdeA1KvOU=;
        b=vNIKeJXorHTpyVlo+lqbpK/BcV0We4kexiP0gmEj7s3chUb5zi+vPECIGMVSDqNcdh
         r4Bhtw8W2sj2YBeith9eQmp+7b0F9UKiHoqBlbWZS3rip8xbQH20n7IR1I1FNV1jj0zw
         m/x56UvFUee4Foi6jEM1eLl7IuL5ldEHJ6m4iKqKCD9NV0GYo1bwaz5KNzriYl4Dp09q
         B6LIdzio/RtrszT8+Sy6uZ+9YVkEaTGcfrJoHqr+RGirrwphp/u6CvAHiW09Z01i8ZoJ
         zGmBDBtm2IdLVLoLAdokvwhL/cpU5sn9/XQ+cnFnkshiXuw/AYaVnkswLwa/yNRWmY2p
         jiKg==
X-Forwarded-Encrypted: i=1; AJvYcCX88t+LsK5UkaA+gEGk7GSoQoVqxyuAF6zBWDmFEXqBdZTVXt/0pMd27yNo0P3+e1PmA3x2RauQv1fkVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpmENkNT+hQqj0uFCWO1kFnpfS2rfebk7Urh/YhiTIvcA2wvq6
	Ey5kgLej9b6WSA2yv3EuHJb0YYWLe0sctRgqEzLnVw1HpG9LRm6YNaHM
X-Gm-Gg: ASbGnctMeFjKASqVryQgDB/TexXlNRJBEmKq9x2gUjvQ3RcmvnnIT9+KqH3+J0SmXVl
	SB2KdI7rLHvja5WBAWKK0m3+/XNBu6OV/+cvW67V3eWojR8JAwr2kDuqjRqFDu5FTHz7D/LpFpX
	UjcyK6P0wmrkPdgcwvzljAyOGClI/sB9B3Pv4OaJaGTTyudjYJAIYOGy1by6RmjL3BGpful0F9M
	J6ahdb+v4/pF7val8cWt5xD2RHT7uBIkBoxH41o4OGJzGiQRoGFHfzXoOzYjC7qmW/W2gLjb9Dd
	IXt6eq+r4kXwSNq7FARNIMIGXGwuLGhAItTB0bOOEAn3SCtAzZOvubnBfMhhdlb0tCRN/aCLsTC
	umSwiOfwme9FfYq/4IKFp+6Ee1Hr6fmxeslU0SR5FaN4yO4tSkIUnHU5unvAW0WkFMmK7gaI+kl
	iTaykJURYyT9+BPYiQHjuX
X-Google-Smtp-Source: AGHT+IFUbJ+FjAjKKsg6YJWZVxyDF8HU9W9iTbhFx8UICuTNacj1eC7uib49tuv2zK9lGVgNU785TQ==
X-Received: by 2002:a17:907:72cf:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b50aa69e311mr1981823466b.7.1760297026601;
        Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
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
Subject: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
Date: Sun, 12 Oct 2025 21:23:06 +0200
Message-ID: <20251012192330.6903-7-jernej.skrabec@gmail.com>
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

Functions called by atomic_commit callback should not fail. None of them
actually returns error, so make them void.

No functional change.

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
2.51.0

