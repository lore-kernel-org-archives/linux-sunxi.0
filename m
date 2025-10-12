Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1322FB60A
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297052; cv=none; b=Ao0sR6Q43L+qYzAJnbWQ65Wp+O6x6liTR7WQwqbf2yi+/cKB29vUR01KiQDMr+0qZdZwcrYEYlSNzX3hz2mukGFNdhgwYnEZ5r3xjXHXL39wsMUM3L92+CNf9KhselgmpE+a0JTICkjOSTMg94IdYyTV1YhyThDyV6bKD+mBgx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297052; c=relaxed/simple;
	bh=Q1zvYB3flC6Y+FU4UXXFlPiLBwxnmOrVYL/JdQWlsDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8/RizNfUUgS3guEYkElN0fxjXwKTCHlaFMZ7+u+heyC/fUuzs9qRSRn09JBvHbYJynnVxYhbiEtkv8rcOomYeTrIbSadK+/KQ1OCbrP9n4hEdSIxgbsk3WHz0iTaLRlJ2V7UkR394uu8PVQgsUL5vqBUC0UcIDp1li//ESQltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JisEPZoJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JisEPZoJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3d80891c6cso703922666b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297048; x=1760901848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DrFRmdaEbeeGFVkadVtzvz8t+dwN3rT/7iEQHdomrY=;
        b=JisEPZoJmoARCg0IlFMQBhGQzPnB2Q5W6Ruc5QsCd1iCbMkZqt1cBJ07vT/CcJ5n/T
         afXohsCML/4ldiYhQKB9xCb2V9egFKkzK+dlshkKUE1sKJGG8cHiyOsk4qxREJr+hp2V
         e2NFq5J/HAWM8d8O0bsIrzsn1yimfWfVHwmVSHJ9sGi1XKhPcgDrx6cdeU4dSyvkWHXb
         mCaGrIlah1FDfi+U1rYoGfAuRT1p/aKqvvtvIAXZWQTV6p02f8aOl2BbsWqvoLTB1kaR
         4JwjYYRqwMBJwGMCWg9ol+TL8rwj/wkoHmnOi+8rABeKoQvyY3tMrFYTKZsEeZYaSZwb
         ivXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297048; x=1760901848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DrFRmdaEbeeGFVkadVtzvz8t+dwN3rT/7iEQHdomrY=;
        b=s1VCk638U8uwDUoi4nID5AH8nS7gHjLy+zx2wso8jA8PvoXHTSRgNBbEFsLLUVVl18
         odcmgdDbxLYrM6Pup0Hq7U7iZ2+NOpzX0sFssvdBpYNQSAtaQX6VMjK1H/KsvrxJknEf
         XzkbMWH8CKb0IZV0cf2ImvrF9Z/pX0PB+FfLdgC0Ijynvh5+1cV6MD36usLy/ImJQ2d5
         KGjM27cEMMOpYWt2JaXZBeAbVtp65FQMKtBlvW/YGY9VJWNz5RHR4b+f2DpDyasLfC0i
         b4dSdR4BRZ07yPZtk8ytLVOUQ/Y8XRl9xxDRxy3eo+AWdUGLS9t3aqnI3IOe07olLXE+
         z8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7cCCOZFXFob2yoF2OIKT2Ss3BoSyEbjk1QYPYMZLfDC4fPFaqk5jp7WabiJOh43pmB2Tf2nfjYolRuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqIecU8Ab7KQgm3rJ3BXkkXD8ARqusVZjRXct7nHft4QbDqL0h
	yyEETy0+runzclYIOamiiLE74ES7LulqMYFp5UBVFsRu0q3zsChTULwj
X-Gm-Gg: ASbGncubVxzuaJI1qEEsAe0bgWeIlr/lptRP2TTKhcxhQc7X7EsLxZH8sbHYquefh5H
	jxd3xUyzOtorvJEpjEe1XCspCOvg10sdxk11/mpTEr1xDG1FccnKdpJ8UGKMdT6kWvHBU/rNNoC
	lX6Xx6rr9RB8227SSO8IDREgzFCrIbuvHE6XHMHikHc2y1jVyVCIpdEgY8bsVawtKKcC/oFWPBe
	tlWKmiziAmi+P47cxnJNPGFSU441pxUTM0foDREHKYWwxoVpkv4x7CUrNPSiytglnggRjQ1VJx9
	7/c1ksHtpEKhOkqoptdOlpQ3zCQhOe57SLPZY0CxtkBy0mSj41+XWh6V4tZnfjtErrVl7f69J3g
	5uxaM++ancpBIF3JQOCmQ5oqwd+RPqD5wdX1kKBNiDXgQKTg5guVQddhS9t7P34ZHem7756WEa3
	bMSjHVSA2WWn95RxiqX5KP7D+fDE8GFiY=
X-Google-Smtp-Source: AGHT+IER01mRpg7q1Zer+a2Fi+tE48PQj5/njKDNX56YMkXj51QtTvzlx/6vPlXBx59MZeSRaZhVJA==
X-Received: by 2002:a17:906:ee87:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b50bf7eb3cfmr2100938966b.30.1760297048395;
        Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
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
Subject: [PATCH 24/30] drm/sun4i: mixer: Convert heuristics to quirk
Date: Sun, 12 Oct 2025 21:23:24 +0200
Message-ID: <20251012192330.6903-25-jernej.skrabec@gmail.com>
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

Determination if FCC unit can be used for VI layer alpha depends on
number of VI channels. This info won't be available anymore in future
to VI layer driver because of DE33 way of allocating planes from same
pool to different mixers.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 +++++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 267a6f75feb2..78bbfbe62833 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -707,6 +707,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -716,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -736,6 +739,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -746,6 +750,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -766,6 +771,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -776,6 +782,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -786,6 +793,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -796,6 +804,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d14188cdfab3..def07afd37e1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -176,6 +176,8 @@ enum sun8i_mixer_type {
  *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
+ * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
+ *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -186,6 +188,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	de2_fcc_alpha : 1;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 44e699910b70..8eb3f167e664 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,14 +48,16 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-	} else if (mixer->cfg->vi_num == 1) {
+	}
+
+	regmap_write(layer->regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
+
+	if (mixer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
-
-	regmap_write(layer->regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
@@ -450,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.0

