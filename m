Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8C2FD1DA
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297059; cv=none; b=NQFpj2VWp9ptg3xEpF8eZl5IYUvD5SdaiQ0kNWL1kz4Bj+0skn9FDoliAkliTvPrlzcTYJWPcxvrdV7rSVPpXC/C23h2iLtwVCTdF5o2JZZmH47ko4Qu+RJgmGPbqfNBN7gc6Rh0z+UIaJ0n+VemmhYlPpG9rfPTkCKRY4m3psI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297059; c=relaxed/simple;
	bh=ErqsMLJpxzUTMtTz2Dz7Gq5FTD1dwcKP3WwZLtDrtzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMK7hkbNFb2hUMdIBza35q2WjKrbZO4bRanChK4u5gTpzub0qaTkWJ3D6B6Ea2iqnhFp28Vi4LTLVXKqPW7sjat7rIWU+ugXSMX6OGYpImTIAmnqj2L95fz4n0Bz4hMmxNrdm9TgUMLzSNbVWvJyq2jqrSB2i+pVDxyEXDf2Lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rd6iavuX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rd6iavuX"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e44f22f15so514488166b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297055; x=1760901855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
        b=Rd6iavuXwov95tlVhGVpXhSldENT/Y7uabEPfnk1+QqaNXN8Lb3kF9m8p5fY4meMm+
         hGYXpHdNbCxv7FQhk7dNEaD8csHL/oAo2v8SqSHebfA9vmKoTrlovgnmQ76lrRGfIIJ0
         zza5WeKST5Nu7pdUNSt4Cm6JNUpq8sUsFvadcL/b7yg7kZ3kF0wThNmcbnqPbh8hm1K6
         5S1avJA/RhuWc8MfGz+6GS4PVSF9fP0WhvKp8lRn3oS8FHxdyUmkUjOH/q227xeBXnPB
         0rZlvFOjbhyRwcwjA1d0CVVufu1M6NPXvmYqiDqqOGHbQhIkpYQw6n+7HRrHo0CpgHpl
         nU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297055; x=1760901855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
        b=q/fQBgebimUvIuJ9f93RZpS3Fdv/xbBHP7TngVgQNlb9TqwipSjRxI+yO1/MYGlplC
         78QwOFvexf6TSk05BVXB/b991oX+GLSoT5VdTe24QZ/NnH2bBCTYS03qTvs6whIdx0zu
         MjESR9zb4RELteoIePLx63Qx+9lNjIehbzn5H/xM99idcMo61XHLCoHRxsgKlSxA/CkE
         0Et56q/TQlquWNuuWRGjr0/PU9XHwbr/am+eiMpt4G/citgymvfmabX4kQCLs9NAc/3D
         P2sIoADFJPmMezAIIp5xAwCft7eb0SQApCECi140+k/CeDf2n4jXEByilFWZSydQcgDZ
         jSKg==
X-Forwarded-Encrypted: i=1; AJvYcCVAbPWDwvYLqPhhLZIozfftsUw+rbeeoCRgt8Acv9poHouh/henE/IPDTPbJkR2qna3Ev3y3PiNSl+BCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSewhRU4zn7YwVpxurFM+tzzz6rLhqBHwLsnTV5mb3m2KlPtIE
	aCmVsC6ffVAo2Xuob2odgVyYMOsIdVm+88W80R984XCtIc6UMMgzOH+N
X-Gm-Gg: ASbGncsbSNno989JnZVWFx2Cfbr+tTT1a3py4xAHHnPYxt3L0C9+9rRverLrz7NPVOK
	YDmXi2fpByKeEpUUiDdE+rPgLJhUuKC1F7h/9Vn/Y87af8AK3LwuFQRBGuWLIMQ9OQzevlcsTkB
	cyqTVkik968wFy0SeXOfdr4m7ev0/lxbMyJQaWvtqQUKgeOpfP9s2/nSxsbZ3jw0/s5hp0s3+mV
	VOC3UX30WoMH+XAsxHj7X8tGMs7+E09Q4G+Cz3fRO0tfzHE8gkTDbxZHv2Hv6DczBB3SqP4FV59
	fWRIrjzv+cksncKFpZ6CleOWAVWeEEJSadcRBGrdGoWtYnKsTksONLHSCQR/JSxpxFSUusFKODQ
	WAG0CauwLoyDS3DvuYjw0JBZnLL3v4kAtXlOJhGXUQPOt574qf8HaTqi04G0UNz7LUycvUyMkAv
	Nb5cn/rK7Gfvpwe+MTBxhV
X-Google-Smtp-Source: AGHT+IHJQrrQMxeS8oZx8uyeW6QR9xFsch3rBeFPh8aSvtGAg80UGkiRC2h+N6V1nwsHDzVkAOCO0g==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id a640c23a62f3a-b50ac4d3497mr2029519966b.59.1760297055250;
        Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
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
Subject: [PATCH 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Sun, 12 Oct 2025 21:23:30 +0200
Message-ID: <20251012192330.6903-31-jernej.skrabec@gmail.com>
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

It's not used anymore, so remove it. This allows trully independent
layer state from mixer.

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
index 10e40ec9a67a..5de68cbb6060 100644
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
index 52d1b40ab71e..6b59c52ba4d5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -225,7 +225,6 @@ enum {
 
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
2.51.0

