Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D82F99A8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297042; cv=none; b=EWJuOnl2EOPZ1kNSBuFfvnFLknYBzJBXN+eY09PDX4CvNOdsutBhd9FwvJDy7+Fno6OAUdaRKp5rTOkV3o9/JCe8QntZlwzp7VPJ6JM1WRroWjfP7rai8ZjR5lQZtZ8/Qg6mCtEoHz+RXUv0GdAk0C7Ldb4CM+uQpBEyEP32Ec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297042; c=relaxed/simple;
	bh=zj1rOPUM5oZeeTycyM+Ty1Sv9Bs/6lqDALJplKv3ek4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZcqi19SV32k/HjN3Ul7GGGVZil68waOtmsgKqxqIhZTyPfLrz9oQA6IugzwEnWlL9fwXAFIbIj3dodtxbAHmRi32AEFSQY4qF+ZuGEq9/ueVhwOrLICBguqfZ8roZ4Er9ocLK+zXKioNA07tRJw2gQNzqg67uS9FT/2XId7GE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaMtr+9O; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaMtr+9O"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b40f11a1027so636779166b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297038; x=1760901838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7B5z/6FvG3I54OQ4ZNRVyTMbTdgGg3l1ZfyjU4MqtQ=;
        b=EaMtr+9OnrrAD3TpIyWnKLgKOW3CYJ/HvWyIPLPeKNdic1/liXyOfjlWR8JeQfcETd
         0PMUZ/H4QgcyQR+DmOjCxdPT3q20Pz6DVA+aX5TgjYlwEmxv1QLmeh/UBhuwMKJjv94G
         Jp32bYvI0n/PGyCMAYqS7xiQcqALWQzdILPMJ+9JBG7XYFhb1pfb5LlVvSccKjL7DZb9
         S0MqWXGfehoyiROUTdu2z2ZzF6SbohPf4FNfabIWfTNTEsHnz8yo5dvhy8R5dxJCbiWD
         zwub2U0Pc58H7vd7yO1JzgFgmHVul8tekMXQ0gIUGteQaR3T93oaSkOZxUhLNPeGG7T7
         q+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297038; x=1760901838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7B5z/6FvG3I54OQ4ZNRVyTMbTdgGg3l1ZfyjU4MqtQ=;
        b=tKshhHv+WrHhGvEBanE81OqOla2k1rFA8ptQW7eKUN2VuCQULwtFSZ6wLhunoAQ6s2
         q0B8eTv4rE58CxD41ayUJ+Xd01/a5VjcTYHlZ2KxnAeZM5RVnfRG60Nch+R4VIyFXFCc
         vilBNpR7pR10L9UanGEaZX9EgPSpi0GF9fcbH4n6fR6VIdlH5MJmhGob4ADSVrSog9Nc
         0MLIeS+qfd/DOU/EXWjBOhVp3cAmcIWGIZtcqQLXRWOiNsIu8DM6D2JnhTwTbU7llRd5
         z9GtZCyfYNPs+N3xbKfdZKhl8upZb0+dC8xPB95icqVGnkl6vUS7hmrUiRreOHFZvh1N
         /7aw==
X-Forwarded-Encrypted: i=1; AJvYcCWHWn9clsWR8KIl4QJNKlMhE3TQqrCzQ1R0GWX2E9qx5hLpwvnV1cRzPhqJottA3fjJDTvrTj3MfRqJAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy0rjvbY2weRFV3Univz7k5qHseONrruMVgEMsLFZe+YlR6Sir
	u9/RbmslOyuI9ZIy3R1JemFnt+GWRUwAzGQHDScsWVi1S7IlGZP3/mRo
X-Gm-Gg: ASbGnctNG9C1Po7vgYUGLDc1W8P1c7jymYXoqhFQgOedFQpDrf3n28xgt2AiW/FvfU9
	PB9WRRcTy8XSc7aJUjJg88jdrlJufCIEKeRCwbpVOdOIAYLszaNvbN0Ehu4j4cOS9ZP2S+dYGNe
	pu7mVyzpBnNkWF/eL5tO7u3mn+girEOQqk8+Wu+oh13cioyq1LpC3URoQLy71zlGPrDGJlgKAW+
	RA0Z8gpH3h5xHyWTeexo8/b8ZzY7B71Kpj1E6Lp8BooSSXG895bYYVLBIEKDaSxkxWiH4P23sO7
	m/QtsmHyl2eFfE065d8ayK5SmQquEJ4eXoZG9S1TRGNHndWL8YXyBoU78ajje1U+eAC3eWbxrpK
	eMx1jliZK7xr8AdXaGMM/D0LyErP+YD+D468FzzTcicAHKCBNyjHDkfTOVdLy+V/xrGswvNuCKn
	vmULiFO7JZL7j1BvnmXq0tLqaHk6EmM0s=
X-Google-Smtp-Source: AGHT+IEht1RvYv+GrJVSKlpD0bZZHYXhupsubyTU9aRKjX6qUxe0ggNfr/uDwTEge6IoB2ejpquang==
X-Received: by 2002:a17:907:da2:b0:b3c:de0e:7091 with SMTP id a640c23a62f3a-b50aa28f291mr1959386666b.8.1760297038157;
        Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
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
Subject: [PATCH 15/30] drm/sun4i: layer: move num of planes calc out of layer code
Date: Sun, 12 Oct 2025 21:23:15 +0200
Message-ID: <20251012192330.6903-16-jernej.skrabec@gmail.com>
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

With DE33, number of planes no longer depends on mixer because layers
are shared between all mixers.

Get this value via parameter, so DE specific code can fill in proper
value.

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
2.51.0

