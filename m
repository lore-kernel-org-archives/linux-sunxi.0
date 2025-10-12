Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C32F8BF4
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297040; cv=none; b=ZISjmwZuICT3MSxcg5hFx+6NUA3xJlWO/1e9h6PjQRr2DXn189fyFrdl7qlByHsHxqzkilmzRoAprucJkqYfTau885zHRCdn7HgTR7NY3vrEOyuyoH3BwrIHWD0ifW/L0eRpm7ZhtOrO9+9msDfIaOr1Dk/91i2gf8kf+kL87Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297040; c=relaxed/simple;
	bh=ZomKanEsSZDy+AK6wHEspIETpM6s5dDvAJVsDJCPg+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbRWB/AxOt1kP+JMhdb15mS9/b7JpVuHCUolUsUEnoZ8wusdk7+FF0hGUZ1kI2jSCYipTciTYkY4XVrbi1JAZm5QffbCSJiCVhWLTwVHT0Mgjt1t9tCKu/3kvuWGO+O6hHXcX6M6A2L2/HbYRBtCfjACA3g+H3R3AuT3PLT0O4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1gVlY1M; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1gVlY1M"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso592131566b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297037; x=1760901837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
        b=M1gVlY1M8ykPFejnGLW724fpuFjBi5bZ/VLxkUKIPVAecg5pjMir568Be2CgjJ8JDn
         JDU9wIH75oXyCUnlUlCFx1VzGJBKZaCqDSZf1WOkvgoSa/yoJKLMbMBpzcx4QGsVigut
         G4wEV0IrPKmzEtxMrgk4Qxcccho8CnHOF1HGwpRAek6eU2hTymIpYzv+QGWqIW3kWoac
         vJYiILOQS6dy0G4QL2+PX5+Kxdc8Y5rmWM6hJvC37G1bhC40BdbMZBamerChnf5fvqIy
         80voBJa82tIUjzqcpMFKqYN8zUsjOY+GZCu6CqW8I8S5EK1g4hlwKlZUM4RojsurNRgg
         kC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297037; x=1760901837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
        b=g2TKkubTM1oRXqC+0esoXvyJ83AiAUziW2/Fotrc7wQJ5gBFivXToYXbG31rcaS4rj
         4VGWvNjsk72e74hd9yKyYaV6xJmub8w03z1JJ1aRYncZPjfFnIjHc1YYs5J2sbRN9BuP
         2IHyd466yeI9rwcLReZqmb1PTpOhHjpnhStEWMArxtEcp01k+qfdDw2MzB+C2z0+/Jok
         FZdA0HavxSTJTCFh9wiAWv8SX34gmSI3qwJF8FMMHf+9C9KUIvkneJ0M4jBFmk+STIEC
         SfBARf5MchXlBPUqRQDCP3qxskOcimVT/2ukQHyTZmyr93BJbkEGqE7ltUdGeQDsoMMV
         Qr6g==
X-Forwarded-Encrypted: i=1; AJvYcCWWI/DS9u9lJFX/WDb/AzAbs670+fG/bKqJ7VqzwdkkKDEUXaG5dewsTn2Ij3DQiX7asqP03fc73PuhPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvbRfMQ7zR3/B+LE7WCIPvvQU6pqA81tAnSACcHQy17Xh/03Kj
	InIWEY/hNnMLl5lSI/EHXWMMUbH51q3c4KOYoF3L+jdz9wrVlc6eySCm
X-Gm-Gg: ASbGncucUM2utHgPuFEUoDZwrhTgkfOQ3W8FYs9uaB2wisTgwDfrfrIWGiP1MHd89ad
	DEj/9FJsf1b7H8bT4hZhCTEl1mIX13efzZsV2O6xV/ajQsv9dvIJx9WfCoUidm2bJZ8hn2v2qSB
	Zca49zjrFq2NtKy1iSIr2lTBTJriOBEoNwq/c0tOdl1MHZZ0gkdrstVPYZhO+eVs8BTwgIPLgIL
	m+pTAua+0j3g3PgjyJdqeWfCkqfvHwiojNBfNeodcNCXX7RgVSA5wDsFAaMXRQMTUtBmumGq0LI
	ww1VrSREyutZhwdBq/I02lRMfq6nexf10+4wxy90x71UdgkHt4VO0Vfo4qq/7xy1x4rAe1SvKRq
	GYTq5XSOeiZvkKgy1s2oIIUwoizuB3EIuk+srWDG1MbK82hT59yzaHQxH8hJfDAhjGXoPZFU/ib
	fOSScnJrrZuWfzm1QhaelG
X-Google-Smtp-Source: AGHT+IG0I+CtyMQ9AS5dyUihgRwKpeygER1fugmzO1P668vrEqp3088Kprh13QnASf90ghU3NNQmHg==
X-Received: by 2002:a17:907:2d07:b0:b04:708e:7348 with SMTP id a640c23a62f3a-b50ac2cf4cfmr2032278666b.30.1760297037018;
        Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:56 -0700 (PDT)
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
Subject: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Sun, 12 Oct 2025 21:23:14 +0200
Message-ID: <20251012192330.6903-15-jernej.skrabec@gmail.com>
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

In the pursuit of making UI/VI layer code independent of DE version,
change meaning of UI index to index of the plane within mixer. DE33 can
split amount of VI and UI planes between multiple mixer in whatever way
it deems acceptable, so simple calculation VI num + UI index won't be
meaningful anymore.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index e7a66d9b622a..17c0ab5860b5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -343,6 +343,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	}
 
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
+		unsigned int index = mixer->cfg->vi_num + i;
 		struct sun8i_layer *layer;
 
 		if (i == 0)
@@ -350,14 +351,14 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
 		}
 
-		planes[mixer->cfg->vi_num + i] = &layer->plane;
+		planes[index] = &layer->plane;
 	}
 
 	return planes;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8d74eddaa294..4f6c8b0acba6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -270,7 +270,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    int index)
 {
-	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
 	int ret;
@@ -281,7 +280,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
+	layer->channel = index;
 	layer->overlay = 0;
 
 	/* possible crtcs are set later */
@@ -303,7 +302,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_plane_create_zpos_property(&layer->plane, channel,
+	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add zpos property\n");
-- 
2.51.0

