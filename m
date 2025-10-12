Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF72F83C2
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297039; cv=none; b=Fl4+lhaP+7zAOZYq3LCx/2tphCFSQarMGG0Hi/xT4GMznmzm8n8A/kAYCMGBoc2qqyk82Bwm4Pnb8TOQ7mYDk1QmRiLofKSY2lztAX5utbtkele3mBDMEzSHVMFcgcRaUKbOdHom/NUj5tn24SNMOjbtKqVsKtySl0S3fcnLg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297039; c=relaxed/simple;
	bh=pQyLYLt8MK5Nc3WPWpve6V5LNVyLoCfjLR7JWOrVrEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnqAlUBmkeoVxkM5TjGLzUKaJEfiQS3hbXskGU8AgOKhgWEUhkB9RKB/MgvbvFUvnO/AFU0KHazDMZua9+Hh1bs84uK/cqP0V0pQCdSQNbsaUNLWAWlej1yxyt93mas9xeIap4ZDmcWkHPxwocdI4+l21fuvh4VbyE0S0fKQhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVze4+cW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVze4+cW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b463f986f80so805956566b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297036; x=1760901836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
        b=LVze4+cW/+YveoXL2qjPN3/m7fS0ho3IE6dSqVDHDbBG7yV0M5qUE8hYazc8EH/waa
         tx3jGWocNNnX+oBYZMR2iwwXw2TWY0EoxAx26EudA/wgrRISf5qny8nykeZB66Ix7UYL
         RTbuFpi1XqqlJy2oWeU8MXzxC0mMzoNFgotA0bzClM2GU4C19EEuiRylVgZRrvAD4e1V
         yUYRNppQDoH/vCPR0ALtK9Rmns2FcP3d1Y31Df+MXHIJdSwKwsUo5Ckt4mtbhjWLKhCM
         aqmNSPVsYtLXOf3588nBJEMjw9QpwrqsWY7hUllm8/7894rMDujBbbGlGU6TlcOZDu4B
         uYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297036; x=1760901836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
        b=gjvq5YqKeM8qZJFo5Q94S2J6RoAzqZYpe8UaroBk9IxcrH2t5Yk4Hq99dZBD8Ukbap
         uk3aZ2CU5CJyMihZy3q2BZaDUS15Qge8n0hFC56uycLgrtBnpfsro2j1FHPjRUkvSQ8r
         isXKdJAMbf1QYgPP+kjaYzSU0M8/+rdhNc1JeoNj5kpCWOG+JZBg01l18pRT2CCkCT0H
         twIqV0dK6HoAu0+xnUJHtU0SHjYE6P+XoQ8tZuYVHMYhuJTxBswzFO3Lxt6WYRuflgVF
         JMxfq/m80+ljq9H5pkLPg0+8RV+SE0+7g/jdR0Oc5IU7hwpVWPXSPjOjrdXoBbf7kBmb
         54YA==
X-Forwarded-Encrypted: i=1; AJvYcCWcY5ja9aAeqBdGwaR2yoPsR6ULA84swQkyxXnoeD7VVHcVGbRi68w5l9x6Yl+fD+zHkzb6NJ8IPo/leQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzovGV8eLTgQwT2lObcGW/Kcam8rz7YO0ugCsCwOJ5X0jQkkMS1
	f37jij0XbmPlVO8DQIrKuzaqHOHXp1VqofZPk66D6LkIlOPqzsvPRMhd
X-Gm-Gg: ASbGncunEzgYECCfOwwDXPRmqgXtfg2M8yOL2j2tivvnHS1d6yIAorXA7ebajBGMHZz
	T/SP7sGro+pY+BGV3aN9dy2ZosPoA492nZZaC08eNPlIXZZlp8qWlc5LsK7Cram8plBqEkO0mhI
	9EsV3fjtvvB9sSxkbj63HUvMxnfII9CPUgebGsSHYBTEVmzBO/aavARLlF7uJS1avu4N00pufAy
	/rG9oEBx3bGVgJNJwCSgHW8TKgYrMYwaGxobT7TeFNg2bGC1EY46zZA2+wwzDYpcqHYS3m1ZktX
	zZk1umBqNFmvJ9Kr0pVt7l86UJgRLfytH3TWcZgFyq/q75d6jpbc7SRvFW7Vlm1oSXsEYGeWBGg
	qN09UNUd5wBq1h00nKLg++Y83B0H8LQrfaUBy+UQDhsnLFt8eh82075FuE0q/n2eDMoy7IzWlRp
	cvGpzPZ+aw9ptt/ifUOMT+hzRXBMP/xL4=
X-Google-Smtp-Source: AGHT+IEo0mmA5QLs7FFLs9zM7BuOIhHX0fkAtfXbVZQzrSvZ8WwfBQOC4GT4ec3HCn2JTDhgwgWT7g==
X-Received: by 2002:a17:906:f589:b0:b41:abc9:6154 with SMTP id a640c23a62f3a-b50abaa45a1mr2062111266b.30.1760297035817;
        Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
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
Subject: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination to mixer
Date: Sun, 12 Oct 2025 21:23:13 +0200
Message-ID: <20251012192330.6903-14-jernej.skrabec@gmail.com>
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

Plane type determination logic inside layer init functions doesn't allow
index register to be repurposed to plane sequence, which it almost is.

So move out the logic to mixer, which allows furter rework for DE33
support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.0

