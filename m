Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E56C346762
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279833; cv=none; b=M3sAsq1+z80Kq0/oHkTncoSy+qCOkzKVQo/jlH7V+J4j4e2wAkcvydcdEn9tXy256YWo8UARZIwsK5l4z8O/12Bwkfb9oVt+iXkDJG0B6mBcPNIq9ABujiEYIkRS8QAHgGSCMVuT7XMvet77YoojOu6BBKBbqshzwaWPCPhhvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279833; c=relaxed/simple;
	bh=tLfdvt3kCCBnNflbYWB2jKViQDk0gZMYjhuWhiETf/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GddLyYWrtJF8WGAi43KZrU8VDyCXEY+40Vg8g1VO/xlCbwqjbzYdnVQ3s83+nE3dtpUr1GOs1aY5usgIMqrHPnxp8F5w0yC2bUIGwSpY1o8v17CyNBZylO3WhzgYIdV3ZBhXu9bDdNGsELiCMw8KW7CSEk2rhjlS7hymir/OV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULiTG58T; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULiTG58T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47728f914a4so30672375e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279830; x=1762884630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
        b=ULiTG58TBnLYUj5UJcfSg57YTTcs8JmHb2m/igV7kvHJdz4R2uMR7EvOnov2oI3rgg
         AKE+DSNypkiyxGT3lKzdMICu9C9wgvE2YbVltJP3+Q5z+N9nbpe6Z+RJ3GVin3Cf4VU2
         xcS8iQem4je+VmcRWUCmL+gr066R9WLCTBed/EccwFa0ILsP9Xp7+icyFhuvWdPg2dxm
         mB7icKc+6DVk3HEfpwlZrM2S4ihyhm0NXPrlqD7l8ryfgS6/wy17UIBDXpAe5PcFzNie
         mki7gWYbHuClfV2XEB6dUpBLhtz+qHQaYDvwKp9DUZxIUnja1crgDOvYSkMDp4ZTtJoz
         rhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279830; x=1762884630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
        b=pTOHtaX/D5SSngq8R9jdwWVPicEAAZaq672dAlN8ZbQNrj7wA9QLI955fRdIaJeiW8
         VnYNc7iCdy0Z/G18mbeYlCv38oE3lmkUMAXagQY0jxXrWS+EAxQn0STeek+ODhNAJsDT
         Fc0ZL3cc1dCUdMn+kWcbyTeA4SdsxVjiewWmbLBKkzisKQEE9IkLfpLyBTCcMzHgIAp9
         LLRFjO0/w9An45Rn9lIlgXJoLLRzq4CYipTCP7+Ke+0LAAnU7uo7uP523GZHHpWirkwT
         K9D9sqVfISqd8nQtPaD3frMd7M5/AoOgl3KvMxwcknEDmcSZroiS8yU9gpgbVaUCFu5t
         My6A==
X-Forwarded-Encrypted: i=1; AJvYcCU0DPlcDcZWfIUezK71hzsNXuU25pb1MFo0Y/vCYiC/q7cQk0977vtu7a+HKk7fnzpx11U0u2ipoAeYGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzci4xOad0J6vBwAx/hONt/n9N6EXpE9Y44IRvtvCSl6cy5xVGT
	RqXVpc+1HeJNPlWADjMxWsbjHw4ubXSLenfu9iyPiYuG0+NXgu2FtL4C
X-Gm-Gg: ASbGncuT+wW/kxnpNPtBTbNxfVZdKcPTByP+7fUGh+Ab7+/hbREjKkbN7Vy1QcExVkM
	28PHE/Asi09M9MscqaNmWY/gO2h0hhTrUiN24YPNQqu9uC/GV/b024bo94FMDsj2Lsg974CScGW
	xl3NTHjlA61vVZOpsyNchfNo2Ww65LjLqx8K6LMJGEqcphluh1o1mlB4fW4zpfhLYoImZWP/w6r
	a+0RpwJ//9ylCLnDUqC+O4UbfO56saUucEeA3rda/4Gp5H/cpaRDp6TbJWKQ6iy6kLvbnlxdfNM
	bv/KRNUnYxz0zqgqx5qvd6f8PozET58q7eYM1O6cTkuvrgI07Sgovidd/L6DCcq4tPV6jqsMvYb
	vpAmK3yx2NiFEHGeNRIh1E4EMonCPgU2mZVXPkmIgD3L3pzKQW//Zy/Hel01cVtX+FTF1VwuhkP
	W8kexfiGuieyEZtPKGqQ==
X-Google-Smtp-Source: AGHT+IE8pg2fqunzszYJMCpOfAsCZLtKqT6X6xX+b+FBqXNTS7M6/iDgmxVd2/hVTJsg7USbpjI7+w==
X-Received: by 2002:a05:600c:5403:b0:477:54cd:201c with SMTP id 5b1f17b1804b1-4775cd9c25amr2654245e9.6.1762279829609;
        Tue, 04 Nov 2025 10:10:29 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:29 -0800 (PST)
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
Subject: [PATCH v2 22/30] drm/sun4i: layers: add physical index arg
Date: Tue,  4 Nov 2025 19:09:34 +0100
Message-ID: <20251104180942.61538-23-jernej.skrabec@gmail.com>
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

This avoids plane mapping in layers code, which allows future
refactoring, when layer code will move away from accessing mixer
structure.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 +++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  2 +-
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index d2b7fc552a76..267a6f75feb2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,14 +283,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		h = drm_rect_height(&plane_state->dst);
 
 		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
-				 plane->base.id, layer->channel, layer->overlay,
+				 plane->base.id, layer->index, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
 		if (!enable)
 			continue;
 
 		/* Route layer to pipe based on zpos */
-		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
+		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
 		regmap_write(bld_regs,
@@ -317,6 +317,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
+	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
@@ -331,9 +332,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = i;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[i];
+
 		layer = sun8i_vi_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, i,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -352,9 +357,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = index;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[index];
+
 		layer = sun8i_ui_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, index,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 2e3689008b50..d14188cdfab3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -212,6 +212,7 @@ struct sun8i_layer {
 	struct drm_plane	plane;
 	struct sun8i_mixer	*mixer;
 	int			type;
+	int			index;
 	int			channel;
 	int			overlay;
 	struct regmap		*regs;
@@ -246,7 +247,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
+		return DE33_CH_BASE + channel * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dd6cb09c2c01..e65dc313c87d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -265,7 +265,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
@@ -277,7 +277,8 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index e0b2cfa02749..9383c3364df3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -53,6 +53,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4f0c929faf36..44e699910b70 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -411,7 +411,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
@@ -426,7 +426,8 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 70766d752fa6..89d0c32e63cf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -58,6 +58,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2

