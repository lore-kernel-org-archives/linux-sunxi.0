Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D702F25EF
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297027; cv=none; b=JC5mk8QBqWPKtkIHoFtsOo5pNxw8zE8X/iVqubEIB21nqXUq6MMkKeLegegERNiQ5pD5SKd3n4FzXfMjHjrAUxeykXo6gzgA/1fDNqrMVKzK6DfJWB1zIbynBGQGbw/ZqYfM2MJSHXyrQera/Yq8OvuQzvIhpoH0CkAHXYFyjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297027; c=relaxed/simple;
	bh=u4zJwCXU32S2DxFOU42pX3PwMRTkMmLg20q8/nGcEqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwcUN0DIdQ32YwZap2cgxbibtv0SFF3PVfBdK9elxJbZy6Ym7MYqr+iVLKj3rLblami1G0N3HaIk+r2YBtvZ5JwkdkwVzT4QbKig1p4RWoqg9rkcjMwFsKvCX2QWN84iNfBxTR/G+ljL7qyQq6+j+2OuHbXWo95NxSuWfimhO98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAi1uCxv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAi1uCxv"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3da3b34950so600168666b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297024; x=1760901824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
        b=mAi1uCxvWt9tu3D/DnHJC5p3ttisiXKQdQKc4Jl+QmHlXyfGv/TrMixsgd1lMIgxA4
         11IE7+NzI50jk8K7q2nYAYwI6R/W7J1aMg0y3Vf5drspfXPmVJLxHRnpxhCSHwWd9VIH
         /PCnx85RtT+liy8pRWEvnK8oIXoo7KQ6X7ANbupfa1mJdF5HgU0HdG0ODPeTPKr6S+Hx
         8Z5U0inFp+uO67oKwmGhGPPuv0MzbYKJLbZ51EPfvfyb83EEGDj1yY6EUixmt2hUs83a
         zqNHT96DrPCw1VboZDi90tgaf2YEYr4cGCz1IviOg1okJjMIUmpSASk3Qs6lPuXxPAR5
         6s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297024; x=1760901824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXCSCCah2zJTGYn4GhhYKHAkgqZ3YCUPfwGM8ymVWuc=;
        b=X/5CqnC4XBapE2OUjSAPfmu63+MvsLaLV1BmI5FQrOt/dhw+WtbMgVYbIOhaYGnaX+
         Rw5LmHXFbi0vRuMDjCUy9m9LQ3w8RM0cCz2cuBQaXzgvkLQTRV/1jGDtpZ4WMakb/0Dn
         NofAfkaKGRomOXAf+iy0w0E4kd+W9rPhLJRap2c9fSMaVhSRwwukm4knGnBwA5FmCkJX
         96IYjYl19bfRofIQxqOpbj99iM8iyNlkuX37ElzdYYD4+MeFVFZA0TTdOAn2S8HaZ4I7
         eSHJZQPxpLTNde0jIBiVtCSDJiSo+yUcpJqaLYmEOQb7CVAZKfmFJZGgbPG1G+LFwiEP
         kZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVST0dpzJiLNOBffbVXRuWfWdnFfJIqe1RwaVgFkbZaeWwpr8Ev+QgkHrRbm04r2eAiaPbSXQ3UeCTaRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmSMwaHbgXOcXtNo8F9ucOjfHUp0ft09C54VIeWRetgl52i6F7
	4zF5p/zCqmz31ZXUhqtTEjBDjxXwFpzZ80qNoxh5QG30Pc83gzHLkjfR
X-Gm-Gg: ASbGnctah3zhOlPoYMsY89cMhj/4yfN/nmoUwQBe0kdw2heFhw5auKkjM2AaZ7GRZDa
	z/oyLLP70PzGGftiHpY3pOm+HNuqgE8f5PH0IEAg7tVe7wiT3Es67dHBUcj+MuX6IgRes0psSza
	VZCDHli45+R+OfV8oO8OFiHJ6xQQqHIix2Sfkxu7mmdSslCvUr+N9kIBGYr+GClbEQ7RrazMXkx
	XYo12vWSrmuSEuV3TGNrawJ7oEHoC27AwUKxqZ7PLc+GfDeNGrMxrpuzEtomnLjEFyTZHonfEbU
	Znsyn0GHhZG2vY82PYBzcxSnZ6sxV8BoBBaMwjzdA2j/MA0Pk139Kl7AngK/zsX/A2mnr8l/kas
	ZCyZACRlk017j4A86aUE2L8ap/jJ/oiUdDEnH/dkVR4B8pvWWeV+UteMOkj50qKSGHN0FNC9seY
	aS5gwAIkLWt0g7Oj2bwn0mghdhm2YA6tEs0urAwPaNvg==
X-Google-Smtp-Source: AGHT+IEiNoS/+6UzRTSzo2B8Y29/AU5s+BLBdQ9yTmKb3fJBI9Fgd7dqesLSL2/Rv8CrMfvApRR4kg==
X-Received: by 2002:a17:906:f584:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b50aa38724bmr1988751866b.24.1760297024252;
        Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
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
Subject: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to check callback
Date: Sun, 12 Oct 2025 21:23:04 +0200
Message-ID: <20251012192330.6903-5-jernej.skrabec@gmail.com>
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

DRM requires that all checks are done in atomic_check callback. Move
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b786e5c7f3c..fce7b265c5d8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret || fmt->is_yuv) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return -EINVAL;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret || fmt->is_yuv) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return -EINVAL;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.0

