Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B933FE2B
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279822; cv=none; b=jzaRq1VXqoamb7DzmqW6t7VUkWBLtpvxuQKWQcbWTTjj+GXPn8QhPf8YCV1dA/JdblZPhw/ROp3UVeAxm3afbK9sdL16rOdcybso3nlxIlLh9Dia3yjEYKAEmPv/DeeQut6wgePim/ysVc8QfVZ23BN5JDhG4jUz3TwJWEJZHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279822; c=relaxed/simple;
	bh=t8mJW3Fat77+qlKNgT4jR7rPDxuiYTPXp7Gff1nhJ60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTL0+1w96Pk41LP3bZgqOuAEs+vm4+UywNW4pYfSuafVGIf27TNG5IIn8VY4vyLASPD7GuMFzqff8/bDlmKCN5Mets7OzknRKUmdG6CnwmpTmO6K7z6KADIHK0woiBdD8akFzNhUm+kQZSXz+hSw040QTEdLsex9lvCMEJWimvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/Bh8nsb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/Bh8nsb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710683a644so770255e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279818; x=1762884618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
        b=W/Bh8nsblca8TMnei5LLnX5mY3l6WQd/bWbgMjkemWduQ+fdBCT/BnYijNlHf+RkPJ
         T2rJf1NMeJv7UWHrP++AE0T8JfPvLGCpjNDedGIP6AMt5m8LQUgLhxz29HlE2jgKqtpm
         3udasQuDdsB7MCAvgG5LRrAJ3XGkIEwGyAAMYsfN0IseYYezRYmqpxIGjpYKEBs6wTKi
         VemmAeMnF/Y1z8bXQxjvrjrZ7C09lZcEAcCy3DpmMSF0NatPtBJ+mXehpew4y3qw9Afh
         KQJE/tNb8VFZ940NoqjpuwpJgaVx/FV/GQnmDL2ReaU6sVHzjNCIPIgbu4mKWvhKMOyr
         8GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279818; x=1762884618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
        b=scKNR5SMuMZa/mLb74ns15I+lKnhYucHK9hrZisms5pO7D8IMKvG00FyJKHLgCGCpq
         mydUG0xsrj/RQwZgJyJH6g0H940iA2lk21oUQwEqmxni7ntjyEAMudcpqHIeHBQ7a0TN
         NygmKpiRsIlNl+8h7oRqaxHVwgPgRY8Rswn2sMYXn7f7rYen9njbZ1Lt18+KZ+BGppue
         CxKmlhfN8ZjAk3+Q6BXa/kNK9MixuTUWqNs/Nnn2ozNrasLb/h2j10HtJ7puzqyT6+iu
         hXnPxHmQP2EQDRNX7Eo62zjUARdc46EI8k3zSLmIJC7SocKdz+mQX48PReSVUBT8Cj9B
         RIlA==
X-Forwarded-Encrypted: i=1; AJvYcCXfzV4hWgthfNyJwj9vpzDJ9TaeQgjBlqnp16gQziuuTtYF2Df0OAa03k1MSoDQP0to0//APygOaCygdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7gD9wcfYDByEU0yg7YUFSnRzjIfqqy1QBOaKx/v1iauQkB+Q/
	E6PQCxmcBVmQskHDxJ1E5EMy3xe/argRR2pdRltbc4jY+M5EhA3U4dLF
X-Gm-Gg: ASbGncsEkeMrxIv0WA4c5W/5WMD83tvTj0W0+zq/h2y+9aJvbW9rbJ7IUgxXtStzwpj
	Ib7euAFjYRaTFU8N53CCE4HmRhR0hSoQA9QE9zM9gNjxbOJZqLIBft6ypKmvLq73XOhs2MNAQ5v
	QN77z1imEzK161LMdjkeDMgRzHNTKtWdf1/q5nGQRUfClp+14N4rbpMlQJKGWkmItr6jSSz2zo1
	Avk8WRxRkrbcS8mHRMTVvYlIWYnWtUnx5dN5Admi6CiY8pNXOIrnIyF/+Ed9+5iad0FDQGZdwTt
	w6TNMGWUOsHqsNLlMOVVq7WiP0+20+jj8RVNHVdzSFw3cHL3mEtfjhQwAI3Q1jUFTylYVZ4+8LT
	stS9J6Gct6Q99ZSHjjYtw6dPK8Yv5t+BiG1+kXCBrcQta4IHrHq1GY2x9TzkN2C6+v4mnNBa5h4
	vA/KrM5ioXYpBtZsM/CA==
X-Google-Smtp-Source: AGHT+IE6+wQNQgsRWOAqTzJlZBlSMUgDJYtvMonE1RZ+OJOG9YLIca0WKWGS8Pz1WvOiR/sQSuop1A==
X-Received: by 2002:a05:600c:6dd3:b0:475:d278:1ab8 with SMTP id 5b1f17b1804b1-47754c1c553mr27491185e9.2.1762279818149;
        Tue, 04 Nov 2025 10:10:18 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:17 -0800 (PST)
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
Subject: [PATCH v2 13/30] drm/sun4i: de2/de3: Move plane type determination to mixer
Date: Tue,  4 Nov 2025 19:09:25 +0100
Message-ID: <20251104180942.61538-14-jernej.skrabec@gmail.com>
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

Plane type determination logic inside layer init functions doesn't allow
index register to be repurposed to plane sequence, which it almost is.

So move out the logic to mixer, which allows further rework for DE33
support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 +
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 1fca05a760b8..e7a66d9b622a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,6 +315,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	enum drm_plane_type type;
 	int i;
 
 	planes = devm_kcalloc(drm->dev,
@@ -326,7 +327,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->vi_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, i);
+		if (i == 0 && !mixer->cfg->ui_num)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -339,7 +345,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, i);
+		if (i == 0)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9d5d5e0b7e63..8d74eddaa294 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -267,9 +267,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
@@ -284,9 +284,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->channel = channel;
 	layer->overlay = 0;
 
-	if (index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_ui_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 83892f6ff211..7745aec32d76 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -51,5 +51,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cf83f7ce6c78..1192b17726d1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -412,9 +412,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_layer *layer;
@@ -438,9 +438,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
 	}
 
-	if (!mixer->cfg->ui_num && index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 655440cdc78f..fc22b9a6bd8d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -56,5 +56,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2

