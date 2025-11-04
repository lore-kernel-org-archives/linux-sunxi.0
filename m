Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89886348885
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279845; cv=none; b=Nd80W4Llqi8yF692wnG9NOuSaV8m1vcysbG+C1ToHrDSNDgWsF1WoUgwYN4dvTo4ss+qYCk9p1G5RmrJ9mjZFzFeYtOG0H8/7neIRoIsBbZbj6tIH5ornTwgunYsWmYgn2ZnK525qaFOn5WlZb8i2Jm144NVP1uAaTtKDI6M7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279845; c=relaxed/simple;
	bh=pwHyPYs+uvcIMdyUOYcnWKkfT8r4lZYUtB/lROjfyFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEaBjpHoZiDLwxleS1rtKnxUNezR+g1qjULmimWqWANRo1P4xJBKvgK5WFUIxpPzM5sZxu2vEVB0KHYhsHG0JdDVgnMSYFlYSkYpK2cf+h5pxIQsz+2FW8sW632VLe5FVVH7dFtXcid7lfbgvr7X+I87+OQgCcjJokD6LoFz97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S54GsgUZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S54GsgUZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43598695e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279840; x=1762884640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
        b=S54GsgUZ752VWh6Fa1kn6lCz00BT9UBqzcdKcg/l5O9GgTqanmcPhf46qVH+gQYUvY
         srht7xBhFXKeqAQSt5EjA07VN7SeqrTP/Q091DWsCW1DVw+a8kfcxkF/FC4b7jOiVfK8
         zVNU4UqRLsnxY03AkyKF1SFLBQI/VZt2m8AgfQWBCymAbldN073Vn/IgASY9Fe/W90vW
         vTQjod5AGY1RhXS9aKyI9qNJ4GuVWxVkDb8l+Xga9WxartxQf05xl+jONRUJULBI7y9s
         1pXQppoDRAPwtxmLZAUfoNgYa/h3AJyLHnwCMXK+f5/Njpxbvq2WdQo8uIrG9gDj7A2i
         eABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279840; x=1762884640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
        b=X1/9cCQ7ngPepe2Che7kiVTpGkOQ3dRP2WduNEzMHCjrn5uDaGa6Xl5y13pO5IEOOd
         GIZwtf2PMtUnKNJvlNLl656aOjHOTRgtnfynWRcRNAUtDgBwl9ghJQDjo4uA0DQK/Og1
         2fg9yxgd97HrT1k3t6hd8l4IDEftZedDolt0wkIVdGHHBp2Ajz1FjYXe+V5WamD/8Pdi
         xLAFixZ8CmXVUNYkAH2IJmaJ+7sZDFh7mLll1LJ87yPasxkT/YJrrA+69BSYz1lqvpRw
         X5Wcx7LPc/mQH9wqxSFlq5qcFfCYPSE6gsc6AxnT6fab3G0oz+1WcK5smusDJ2t75XSy
         tQSw==
X-Forwarded-Encrypted: i=1; AJvYcCXzIfXItrwGrfMsFZUVSsHN8LV+1SWb9Z3OB/4aSPdFWczG4HFLqqz2v/e90+KaoDIqRTLBFfL3u89Adw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq1xnlq4g08MZ6iLTEC1AUqX9fnmaHMzKYy2obTwOx2jki7U1E
	mHTlKd/0QPtDOU/mkJ7hW+POUWF8VBm3iDIUKL9tU3MJES5dOoLEHPdW
X-Gm-Gg: ASbGncssbs0D+JtWS98wrA6kAf3MrJo2i/+26meUM0v+NEICOL5/Q7NU2VjqwbPTI5m
	pgwmqi2eEJgr7U7poXLewG9QZe5yZfihMvtxA0IcCa415YvXI99wpbryIFJw+DDulNeDjRR77oK
	Q2PH28c2WPR/3fsEzWqUwlC34e1ZDH9qhNmjcx9Z1E5w/hQnPND3AyTjluUEoQcdo0cWlzUTjI9
	mvDZZQLm+78bSW4rPnJsoA8FX45uURc9a0XC1D7ImiSnvmmJo81zhjUYD/34jv2pr8Za+8PjE8S
	4knRl8n7EOfgTBt0NPlfthjA7M9FxvZVq2IbQZwIqoMFjoLmA9dRK32wndrZafcQFvRAzinpkM+
	QAcP/oPYbKABYl73orIXRMx2jF+/fgMm7sus3qcOTzn1LhpasCJbwVmrOoXMl1j04jrOurj4lGJ
	CTCF0vsDzhhnOALOcuOw==
X-Google-Smtp-Source: AGHT+IGiymh/TsRqhwN6N3A97NvG3Bqul+I8b68ZoyUR344zIADNYxpVaPkfS3GzPbVwVEx24Kp+Fg==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4775ce1874bmr2424725e9.29.1762279839699;
        Tue, 04 Nov 2025 10:10:39 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:39 -0800 (PST)
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
Subject: [PATCH v2 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Tue,  4 Nov 2025 19:09:42 +0100
Message-ID: <20251104180942.61538-31-jernej.skrabec@gmail.com>
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

It's not used anymore, so remove it. This allows trully independent
layer state from mixer.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 +++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 -
 6 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 50fc20100c90..fde3b677e925 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -268,7 +268,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		int w, h, x, y, zpos;
 		bool enable;
 
-		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
+		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)))
 			continue;
 
 		plane_state = drm_atomic_get_new_plane_state(state, plane);
@@ -336,9 +336,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[i];
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, i,
-						phy_index, plane_cnt,
+		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
+						i, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -362,9 +361,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[index];
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, index,
-						phy_index, plane_cnt,
+		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
+						index, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 3948023e095b..e2f83301aae8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -226,7 +226,6 @@ enum {
 
 struct sun8i_layer {
 	struct drm_plane		plane;
-	struct sun8i_mixer		*mixer;
 	int				type;
 	int				index;
 	int				channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dc4298590024..185e4ae8a11a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -258,7 +258,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -272,7 +271,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index c357b39999ff..1581ffc6d4e5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -50,7 +50,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4534998af825..40008c38003d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -409,7 +409,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -426,7 +425,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 6ec68baa2409..29cc5573691f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -55,7 +55,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-- 
2.51.2

