Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2272A34402C
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279825; cv=none; b=AE8mbDqDd7l8Z7SiOpAyGSjvROsGF5HtOpWksBZklfVFCZGNz2NpEuQ1xKISbnsEbu9cgLjH7Ii4zjN5NMSHcoQNCzt+Mya6n/xlZSUk1K69jnOKOe3/Vej7rr5ytUXb1dWgXh29CYk93Yyb/gG6gcNUrV//5jT1OmcU+UQ1LFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279825; c=relaxed/simple;
	bh=fMfk5XrNq9l01XQk+tz08bGQKmauEMShCmc9xdALUaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0fASaNwZmrwMnb0D2WxeIkrzSb94uZkAcUWHVsiI7Lz5uPM0JMz+3L+rPwBRvBvc3mczUu7apyKDK02wxEG/RDiBnRV2bNj+wO2s5x9Y1wjZyEwwn1hmEogw+8UAd3s3sL812DOoA/FutL6qMvuqrXBWwoA97OsTGzlgxWwQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuprHBvl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuprHBvl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47755a7652eso8491915e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279821; x=1762884621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
        b=QuprHBvlQ1lXL0h5h5sfoFNaw8LbZm+RsCgh25kwq624acOsrTW76FRXjVFpD3cC2C
         MVdf5YqC3yCrobR6i5Q2p0bduNWhKKygs4GNrBSgSjCvjoFbwq78Zi9Xpb6W9d2HEHbi
         VQNcexKGgtKoV9qw7oyy4pWN1KVCjg+IF3msiJx05afv3spQ8LZKt+0GCycuB5k3OAp6
         SjIE+7dFXmEoP4Sdcxf095V8q0wEqOhC8bfo/wfCXcpywjwsmIdbqVWdg2S7mXG3S9K6
         2tTq+tEEgMVkJWh9jEoO2IJFxuQciDCxCcm5pZcVMgXkIGSKHR6SOAMyyYs199BMwOhD
         Llpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279821; x=1762884621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
        b=t4Q0XJmMy0TeZ0SzZI9yhwZSzybfnL39fAQ+x/oj3ZWXy8FqHn4teafOj1yf6/Z6Qy
         Z34SyadFIG7m8FuvN14ic3LGQMGAI10exJVOKLoja1ugUnULBGHjGhXAA0b/WStGj4V+
         +1v+mqH42rMhUFOjnkCfhveuW4Qcz5sBfr1rAOW9NE4NZ9dCl4uAQQdJPAmxTo/Qm66+
         2VUulAhF4wTAEYnfH4qCsJC30Cm+cCoT0US76KjMYoYD+L5JUez8RQluKJYQuNhLVeJN
         ZTvtLISeLHKoQsFEuR2yyk3sHtIAIv4uaOQbR2MV4CXgFrxIqL3qh+CwTKAyBCmRvyvu
         I+vA==
X-Forwarded-Encrypted: i=1; AJvYcCXfn+6nf0hZ3dQfrUt61Tiz9a1m8//zvTzCVW5Ods6G3wP5NEZgAc3ou96Dvsn8FxdbNDBnU3mSr8aOOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKk9LCG8RcylKErSfzTanQyXJU5ipCmDNTf3AOUXUR5lE8YSdh
	4IDHne/JAgMVfiw1u7odHNuDtGlO98EyeDu1VNdzD7I77pqV1sE7Wm7b
X-Gm-Gg: ASbGncssg6ZCySnnMcNEWodaN4QqD0zS62cQoFBjaQ/jTjRl3bA+jd+nIIp7LWGGECQ
	ke6nxKy+610eCktxTj9CD7vX9aLmnr5BKoSctXDDhUvC37I2bzReh4Y1IxTo8yW8TqUoP/2XJTT
	507gJXpBoLAxPpZ/B1mpHVnDODMCHgRhoQ4c9CeFu3UXo5kDxp1UxayPuTraTESUwUaC64skycs
	4GO74kJ8KHxuGGe3rd+o9Q2LWSR3vTTl3uDdVzY72Y2EZtORIfmMC9/lbuzO5qTiJD4z8nPGPCr
	/p/oxs0VG+npJCeTovo4uaI5ZAl4K2uZa9sJYiBJoTJPpYLKmbXRk+fZ/gPhcm37QrSYsa0I35h
	1Gw6WgeMabXSvY5LBH4bUnh7esKS9Mr+eZW9/aMMUNARgROD4QaUyOpE/S56+LN7QneFPp/7A02
	4iWbCU6jBHx2wW7ltYKQ==
X-Google-Smtp-Source: AGHT+IEpdaIz/ZPa95URReRW4HZDMqPLVxE4VqmgVrqWeDCwzW1Bh5UB6FP8v4QdEMy5HSG3J/kMpg==
X-Received: by 2002:a05:600c:1994:b0:475:dd59:d8d8 with SMTP id 5b1f17b1804b1-4775ce9ba5cmr1916885e9.8.1762279821052;
        Tue, 04 Nov 2025 10:10:21 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:20 -0800 (PST)
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
Subject: [PATCH v2 15/30] drm/sun4i: layer: move num of planes calc out of layer code
Date: Tue,  4 Nov 2025 19:09:27 +0100
Message-ID: <20251104180942.61538-16-jernej.skrabec@gmail.com>
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

With DE33, number of planes no longer depends on mixer because layers
are shared between all mixers.

Get this value via parameter, so DE specific code can fill in proper
value.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  6 ++----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  7 +++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  3 ++-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 17c0ab5860b5..18dd998364ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,12 +315,11 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
 	int i;
 
-	planes = devm_kcalloc(drm->dev,
-			      mixer->cfg->vi_num + mixer->cfg->ui_num + 1,
-			      sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
@@ -332,7 +331,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -351,7 +350,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index,
+						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4f6c8b0acba6..8f6fcdfcf52a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -268,10 +268,10 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
-	unsigned int plane_cnt;
 	int ret;
 
 	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
@@ -294,8 +294,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	ret = drm_plane_create_alpha_property(&layer->plane);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add alpha property\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 7745aec32d76..0613b34d36e0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -52,5 +52,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1192b17726d1..805db4ea714b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -413,10 +413,11 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
-	unsigned int plane_cnt, format_count;
+	unsigned int format_count;
 	struct sun8i_layer *layer;
 	const u32 *formats;
 	int ret;
@@ -449,8 +450,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index fc22b9a6bd8d..a568e1db1e19 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -57,5 +57,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2

