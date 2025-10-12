Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC12FC01D
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297056; cv=none; b=E2vwRdmHMSTLMtk8J0nHyCQTUMJ+1TM7ifJtufhAu8uLslKkU0ffEMXCDm/xkb4Nc0xZUSWdWOlvHGCRFzfsmxd7Hs/2oQwxfGwRypUPTB3qdPkqIp+daW78uizdGqsptOpdaz+AWhrmYWzrGNJTx8bOKJsHXjiJHL+siCcxg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297056; c=relaxed/simple;
	bh=tujLjutgBntT+dXd3d7n3u+p14RLIvtn3qv3lUiYySI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJ4CBpOxDMqd+wMNT3FaT+vqJrKlTMLv+yXXk7HcAhMcml1+//DCN2HMGsi8+e0gXSD2i+teHStSSNZemPwMLgCELbDyLlAuS0iOtLXO6A/0VK4wvNG5PykexyBE1vL2GXK5sDUBgU4bXFVcmN5RqEsNPMQ3fK2+80tFhB0Lr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SULUfLMe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SULUfLMe"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b27b50090so653305366b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297052; x=1760901852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaJPE4L65CXDkqyIuBABLqdOxJoCd3GcyPIY1yQyHic=;
        b=SULUfLMe/yv1egVGH7lk5I0HvHOsJvusI6RpM5SuSMcziQTO0LcJI3emharClxLdkj
         Ehubho2gOVcPWcs6VJzosDd98cNP4rW8RvAstUm3mx6+O+l9CZ/UsdMgWSYu+Zp8o3Rn
         Xk0r2ROkAywzSTJwzkDVHmtvJ74rFSmh8LWd4FqJRSBwzzo6uz4j7uYBRkmOwhzj/i2I
         GEL9/2fEubsdrKVlwwFfCt0yh0h9WzTaSUrWaa/c1z9XB9lz277xDgIFNOVguyN/dR9E
         wWdMSEGUH8BWJodYmsNMEqvNH0bCBuzihz1MtxB/1jGWIQTuuuJU/lfPasd/IV8ghr0z
         4wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297052; x=1760901852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaJPE4L65CXDkqyIuBABLqdOxJoCd3GcyPIY1yQyHic=;
        b=CRT10pqJnUktFiswjwwCIZV0n4+fvf2Vhkqp1FNviDInQMYqK1/kumqJCcS+0EOX4I
         sdA0wVd0cd+XTPw+BnrWibIS1Dt2NntQhrc2NKJNh4uXjqs1AGXyMutn8RugmfLR3b5q
         Fx9+E8kll7+LvBTBNAlnqsWiyyz7PEbNamTLjKVVb99jWNP8dNelcEiSfvKCLiiFOe8a
         b9qnTS7MG0Qa7uTTLCSldPsohUU7nnPP9NXaOp7A8mkJdCWZwgiI1e0PcAi4ydfbYrX2
         LB6SMIIhyCzsrk04y0oWJkdVR7qE1kvPmwHsoAVR/u+H0LbMQ98Fu/jZ5FsfS1T531dk
         5X9A==
X-Forwarded-Encrypted: i=1; AJvYcCWzr7pJURS2LUv2UTbryPwlqaRkzzNNSYcyqTNiUOlPCmfQ9vzz6Ot3QrAwuLigwC4peOUPhcLXX4TIUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2kQVunQek4yi34Xy9fLSzuGFfz7W/wEytJpB1lkrp0rcNL77W
	kJrAsKkhbu77XiGqYTJoQg+ScqIGVEOIjUZlSZs0CISpyCrOnXuEhaPA
X-Gm-Gg: ASbGncvDrYa40MUqfeG7smBqQLINVw1linPTiJd/nMyJ4t3yMRXPKiS5Ny6WBfVklN7
	RV8IXyfAEt/K+GjIrsfeDXwrl7N3JCGh4KF4rggngWn7tPKD3NBUBUCMB05dUIyUJ7FrL5U6ISq
	hK84yJSQ/ONdSrAfwo3WLpKsv7moO0dZf5bHH4Y6mIHcksClaK00bV2ZA3vtVj2p2atiisMVtLz
	YImI+6HDd42ZnyjQNeQjFyYzHATClBIYLvCybfvtX7JZH0+T1NMNcAYeSEhoGskIo/ZAYuKVogn
	z9GO1llAp0wAUJEg09BL6PbQtMad0voDTXZDfPxD3F3cFwverUfqhFHpQfTQqxodPUmX4ENTZ1t
	adSVTGW0y06505+mVPrZEEcB9JhDvtcMDhsRTnxUSs4y4Ayeznh+1+ijXdzA5nMlTYzOOBNyA3C
	M1jBCQYVCCyYo5blR0bPSFVY8+x2C6m7w=
X-Google-Smtp-Source: AGHT+IFQEmoHaQY1HSeHivRc7zOWRD2roSYeAHB1g5htc57RrShWiGIm59M++o32pnXdabZt6E9p4w==
X-Received: by 2002:a17:907:94ca:b0:b46:1db9:cb7c with SMTP id a640c23a62f3a-b50ac1c6951mr1943566866b.33.1760297051775;
        Sun, 12 Oct 2025 12:24:11 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:11 -0700 (PDT)
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
Subject: [PATCH 27/30] drm/sun4i: mixer: split out layer config
Date: Sun, 12 Oct 2025 21:23:27 +0200
Message-ID: <20251012192330.6903-28-jernej.skrabec@gmail.com>
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

Later special plane only driver for DE33 will provide separate
configuration. This change will also help layer driver migrate away from
mixer structure.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 152 +++++++++++++++---------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  32 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |   8 +-
 6 files changed, 122 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index c371e94b95bd..30779db2f9b2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -240,7 +240,7 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 		return;
 	}
 
-	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
+	base = ccsc_base[layer->mixer->cfg->lay_cfg.ccsc][layer->channel];
 
 	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f9131396f22f..a01eccfca3a9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -703,137 +703,173 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 }
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.de_type = SUN8I_MIXER_DE2,
-	.vi_num = 2,
-	.ui_num = 1,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.vi_scaler_num	= 2,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.vi_scaler_num	= 2,
+	},
+	.de_type	= SUN8I_MIXER_DE2,
+	.mod_rate	= 150000000,
+	.vi_num		= 2,
+	.ui_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
-	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x1,
+		.scanline_yuv	= 1024,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0x1,
-	.scanline_yuv	= 1024,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
-	.vi_scaler_num	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
+	.lay_cfg = {
+		.de_type	= SUN8I_MIXER_DE3,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+		.vi_scaler_num	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
-	.vi_scaler_num	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.lay_cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
 	.ui_num		= 3,
 	.vi_num		= 1,
 	.map		= {0, 6, 7, 8},
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 40b800022237..8629e21f9cf6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -164,34 +164,44 @@ enum sun8i_mixer_type {
 };
 
 /**
- * struct sun8i_mixer_cfg - mixer HW configuration
- * @vi_num: number of VI channels
- * @ui_num: number of UI channels
+ * struct sun8i_layer_cfg - layer configuration
  * @scaler_mask: bitmask which tells which channel supports scaling
  *	First, scaler supports for VI channels is defined and after that, scaler
  *	support for UI channels. For example, if mixer has 2 VI channels without
  *	scaler and 2 UI channels with scaler, bitmask would be 0xC.
  * @ccsc: select set of CCSC base addresses from the enumeration above.
- * @mod_rate: module clock rate that needs to be set in order to have
- *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
  *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
  * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
- * @map: channel map for DE variants processing YUV separately (DE33)
  */
-struct sun8i_mixer_cfg {
-	int		vi_num;
-	int		ui_num;
+struct sun8i_layer_cfg {
 	int		scaler_mask;
 	int		ccsc;
-	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
 	unsigned int	vi_scaler_num;
-	unsigned int	map[6];
+};
+
+/**
+ * struct sun8i_mixer_cfg - mixer HW configuration
+ * @lay_cfg: layer configuration
+ * @vi_num: number of VI channels
+ * @ui_num: number of UI channels
+ * @mod_rate: module clock rate that needs to be set in order to have
+ *	a functional block.
+ * @map: channel map for DE variants processing YUV separately (DE33)
+ */
+
+struct sun8i_mixer_cfg {
+	struct sun8i_layer_cfg	lay_cfg;
+	int			vi_num;
+	int			ui_num;
+	unsigned int		de_type;
+	unsigned long		mod_rate;
+	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index e65dc313c87d..f71f5a8d0427 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -190,7 +190,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
+	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_UI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 0ba1482688d7..4d06c366de7f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,7 +91,7 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int offset = mixer->cfg->vi_scaler_num;
+	int offset = mixer->cfg->lay_cfg.vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8eb3f167e664..0286e7322612 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -53,7 +53,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 
-	if (mixer->cfg->de2_fcc_alpha) {
+	if (mixer->cfg->lay_cfg.de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
@@ -152,7 +152,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		}
 
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
+		scanline = subsampled ? mixer->cfg->lay_cfg.scanline_yuv : 2048;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
@@ -278,7 +278,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
+	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_VI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
@@ -452,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->lay_cfg.de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.0

