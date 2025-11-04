Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959634166A
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279819; cv=none; b=E0RXJj8YBk3xyYsKhR1owDE3wmbPLp6iBknihh7dDZTpSm55vuQggLQqvxeYlTD7OFIf5TXXP0eGGKvJDw9ItvRGKghYgsxWRfPWbOro/w/sbhLmSM8YsntlN9d4iZfLJd0d1TA8otbfR/MSdG4U4urlTpPAGaVJF9roO+sm/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279819; c=relaxed/simple;
	bh=vsQRDrwjNb3dB2XQvKOWy7fWTFXCX/LOwxxjT9gCKe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzexTv2r0zue6DMA2AVwMZDvogdwGUTzHyRyi3yz68XmzQKw4XAdmduVyo76tZjI8HbZST8Yt3AkRiqe2NpbujvmXSYdVr5fH/KChUswSCoTFYdfWK0St8Bc20pGzpZ3lsB19udOe6iDMJoqoJcIu+FxDS48ITl7gIc6N5pC1NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAjxn6Lh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAjxn6Lh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso7991935e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279816; x=1762884616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd2rGfbR52BnpdSsNRlsO1gNn2vRHDyP0CX62x34+dg=;
        b=dAjxn6LhvnBsvh18fLoUS3t1I5drDaCURQLHBZ5Tcz5B8z3nPgYt7dA6Z98E3sTf1B
         /G2wbO+ldEwqrxVgx/Ec/ckTXQSU7zJ86EyquFbFTh+L5glfiJa3has9h4Y6m1AAAOgm
         LnhPtgyy7Z5kfRZaXQ7Z5PfkZm9CjU4uN+aaBxgVCiFVBDQZaMPB5Jglii99KOjD+OVs
         N/2SAbPDgZucuOyD7/fXRL5YR+Sg/DWB2oO3ZWzOfwYRlAu+txJd3h1EXeZ976u2019D
         NtLBGaaeR4tCRzAASL/nnpP/XmOaD62vzrZmKj3TZfyUJnYqduoq+9xtJJibWwRdx//8
         QyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279816; x=1762884616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd2rGfbR52BnpdSsNRlsO1gNn2vRHDyP0CX62x34+dg=;
        b=kUjggMMHHz4Snc2q5nJnlIrgtD5mXufObKD7l4NoZSzm1sWuL/z6Q+iWsd0aG0QYTH
         fSIL0QTio93QM95QFNbfXmltF3cZlm/P8p5JAEseIs4rTsEbbAeDsDNOZRwQjLhSy5j1
         zMjvyq+6lgLbIdeYMHl+PfPWkW9gXIrUu2kqm8QPQ+NLBj74QVlKy26xRMmJnqwJjHr4
         dlDq3PElJ3A21NF6F/vU3XovrAxlz3stbNluJ+sGkqAwpM9YTvAOovPznqgKn7wn2/Tl
         +Le6wBI9b3alz0NhLii+xX6b/x4WtXQUWNCb+d2JJmiDwjKWYOxrJhwk5CUvLomgaLLK
         ddSw==
X-Forwarded-Encrypted: i=1; AJvYcCUcGIGa0GGATPoZbcDsH0/obgW6wKXgKvKAniIwh1KNi53JRMnmoIALgdEmBh0ZL8PoQYF60Q3lTjrGNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9raLAtX+vOI/Q0SvhQSGYnd14TLbjA+BJmJQLH5Osd+61XhSz
	1sFitUYDlDliIpOFSe3XtZ1qmUGaFy3VlnvDG5GeNbk/KHNDhKDIt4bu
X-Gm-Gg: ASbGnct1aIJYOqGLmS9ULDrMjwazP6t2rEVbnJtxNJ+6lxpWupMx1GBYM40BAyEo8Dg
	DBLcs12WYqfxCMSwB5Spw9cc+i7rhoKnniSC5LW/PpSy6Fi0U8fBucenyPPGW1rZofuwdoXSewc
	smnQ8P2kWyupQs8xBvbkj+vSKAkKUNy/r91gyeK3fXfi+OrZ2bVXvj3dcQRz7umlMqTOiE6StNP
	+k7ZoNWKtMDv1b8AHODbLit9suIOCvVnjli/IV/Z9KkQx55d7bcsKZtE29ybOrcfhXqW/syDl6a
	AdTK/U/N7rHKp7cGcmmzLfMm439unQG8GvM3OfQf3IOgQyKLzn43+rRF0Rud8NJZ2m37kjO9f6k
	01TuOes2yJBnXlW6NjIvwVdHk0KBqN3C04hibUF1z76EQ3refVxpVFAtd4JKjSTftZw+kIH4Mf+
	sNEOike16jwuFyK7GMWe6Z9+r6xkLy
X-Google-Smtp-Source: AGHT+IG2sBblS49qAXjvkf0vtV34n/K/LEVc1O2UQPjWyBa6gyH0Uf01mtvCoKB5v5EtjbqR1NJhbg==
X-Received: by 2002:a05:600c:1994:b0:475:dd59:d8d8 with SMTP id 5b1f17b1804b1-4775ce9ba5cmr1913685e9.8.1762279815509;
        Tue, 04 Nov 2025 10:10:15 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:15 -0800 (PST)
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
Subject: [PATCH v2 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
Date: Tue,  4 Nov 2025 19:09:23 +0100
Message-ID: <20251104180942.61538-12-jernej.skrabec@gmail.com>
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

Merging both function into one lets this one decide on it's own if CSC
should be enabled or not. Currently heuristics for that is pretty simple
- enable it for YUV formats and disable for RGB. DE3 and newer allows
YUV pipeline, which will be easier to implement these way.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
 3 files changed, 40 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index c100d29b1a89..cf0c5121661b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
-static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
-				       enum drm_color_encoding encoding,
-				       enum drm_color_range range)
+static void sun8i_csc_setup(struct regmap *map, u32 base,
+			    enum sun8i_csc_mode mode,
+			    enum drm_color_encoding encoding,
+			    enum drm_color_range range)
 {
+	u32 base_reg, val;
 	const u32 *table;
-	u32 base_reg;
 	int i;
 
 	table = yuv2rgb[range][encoding];
 
 	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
 	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
 	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
-					    enum drm_color_encoding encoding,
-					    enum drm_color_range range)
+static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+				 enum sun8i_csc_mode mode,
+				 enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
+	u32 addr, val, mask;
 	const u32 *table;
-	u32 addr;
 	int i;
 
+	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
 
 	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
 	case SUN8I_CSC_MODE_YUV2RGB:
+		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case SUN8I_CSC_MODE_YVU2RGB:
+		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
-}
-
-static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
-{
-	u32 val;
-
-	if (enable)
-		val = SUN8I_CSC_CTRL_EN;
-	else
-		val = 0;
-
-	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
-}
-
-static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
-{
-	u32 val, mask;
-
-	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
-
-	if (enable)
-		val = mask;
-	else
-		val = 0;
 
 	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
 			   mask, val);
 }
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range)
+void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+		      enum sun8i_csc_mode mode,
+		      enum drm_color_encoding encoding,
+		      enum drm_color_range range)
 {
 	u32 base;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+				     mode, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
-}
-
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
-{
-	u32 base;
-
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
-		return;
-	}
-
-	base = ccsc_base[mixer->cfg->ccsc][layer];
-
-	sun8i_csc_enable(mixer->engine.regs, base, enable);
+	sun8i_csc_setup(mixer->engine.regs, base,
+			mode, encoding, range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cab..27b6807fc786 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -28,10 +28,9 @@ enum sun8i_csc_mode {
 	SUN8I_CSC_MODE_YVU2RGB,
 };
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range);
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+		      enum sun8i_csc_mode mode,
+		      enum drm_color_encoding encoding,
+		      enum drm_color_range range);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 727117658c6c..adcd05acba1b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -213,14 +213,9 @@ static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
 
 	fmt = state->fb->format;
 	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
-						state->color_encoding,
-						state->color_range);
-		sun8i_csc_enable_ccsc(mixer, channel, true);
-	} else {
-		sun8i_csc_enable_ccsc(mixer, channel, false);
-	}
+	sun8i_csc_config(mixer, channel, csc_mode,
+			 state->color_encoding,
+			 state->color_range);
 }
 
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-- 
2.51.2

