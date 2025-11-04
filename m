Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A5346E78
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279836; cv=none; b=dydJrceB0BfC689s9EZXTUZOlI/A/9RPmC9Swy++W4h9d61ghRHT5/kJDyGNtcOzkTsS+tGe7TujHIGwFzYk9Hlvn9j+m7ra01YQBVRsuNNockX0Va+bSkoo/1sIaS9lEnVN+LGVxuo6BNg6G+gAaq8dHmqWeBIsseJWtdpNwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279836; c=relaxed/simple;
	bh=kPiLeYIsEiImYjtRwjEv/BEoeWdW4RbU08GWQ9yKjcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKWKBZhh788KObldfURONsZOheP3PwFlSCbA7X2vYgG7g+WLcA80j/nWlU4UKviIu//fUMv8lh6CUulmrBFN73Q4EnQXQ1MF8QcguUuitClzEmKr7bVo88tuFYFLta655t4899N6/2JtTeUKYeN6b/EAGwLecpMf0SpjaLFvFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxeQakNQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxeQakNQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477549b3082so10396615e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279832; x=1762884632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
        b=GxeQakNQ0xY6XUiIzaVVQ5EawBduo3/oW5WM4exA5cDOISf2gA/vn6Ohtw+HND8AKv
         ULRMPRo4jhkW25YqNOU8xAKWN4Z5jCB2cpkyqatMaOIU0AKzpt0zV8h9bxkCB2p3UhsV
         4zq5q1gWdNiVCVK/WyniquUppLt08s6/+7NqTVA18ada/ouje5K+V+CCrMSKVQA2WqfX
         0b3hThaoJvF2rHjOB2y4zMfy/s/C0QNtJ0keCMJBEvQJ6dh9MgiBfAjSctKXSDMnznxr
         HZCyEX7XxCnULjPymCd5LNJ/48+LRIrOYNFJ87aQmStZ4I/EF9orLggvxoRuuzrYXrxf
         mlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279832; x=1762884632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
        b=ngX/SNMrN+tRerj4maeo+jVpCFgdMDBNQA3HpxQPcHJGc3fEsvCjnK23Lldjw/AZZV
         HO7J5x3KyNiFOCVoubV+cbJ0Ct5ReebBXBUHkGpmv/r38NVsctrwagaXtkV2aSe7KlXI
         z69Qt13iJdVZ1zTFj8WKlTbybbOuePl4O/Tq2CcJKDwmny3a3J7WE2rUq6yufsTnqOdl
         z0ZRcRjtXt8bzXHuKniI3Y9GJBrNvUxaWPS6QAGVdJSh2CwK5kK9zlosETCSzB6AKR/C
         dTyd48M1frTOwu+oOagjLolflHyNz2o9wTMSKFj+vrEGB49o787XSW3eAl7wkjyLZoBY
         /11Q==
X-Forwarded-Encrypted: i=1; AJvYcCX93+0kVcAk8sqqH51qkC0SvxBmpDyz4wiC1OpLjVczTmO8r4OEfDa2uxDwW5lGq6Wf+VoGCmLL226XVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySebfmvCAw5jaFXCbNm46j+4eLOSTbje3nLLZy8Y1zlA7GuG+q
	ph7gV5rUGT6a3Hdc9h0wfowNTVQxAfBsYeLbufzyDW/c//2gzgYW+Aq6
X-Gm-Gg: ASbGnctAF84zWxVRQvKZOgILTPxi0bd64Lh5vF1zSlSszChu4mCyeV68mTnfBOIQPsM
	olmChg23rT04+5wGl6WV6vVun7wY/MdXIIoI5zedqIBlEiO87xmrjwg/GOCHfVhVCibTRfCkV2t
	vJ3vm4PzQSr8+Fp33UwhRDDELPubS5eJqlwaxXddHStCazQyf9ToKXOB14ROh0B9TOfoGaDYp+v
	f60r2Cdy1zqVC1gnZkQTjpBT8Nq7mhIY8uVpBrG8w/ckxwd2OBcwYevFNi04U0sDmxd+BDIcHeE
	IqSlp2i3p2yquQpDkcnpUYojacfeoL+Me6AHViKvRlj/pV0kynwStmPCQHtkS5iHdZ9DTAfa2k9
	bEgdhaUxxHJmIPx2/qA/v1clsNaDeqtq9F6qy7K/kX04viZcXZfa+FbJE6GzWesklOSsYO2b/QZ
	7ytrGssm/cjxUsbzEfOQ==
X-Google-Smtp-Source: AGHT+IEWn71DBw19df7j5vHe6/KdNSpZp9M6RzMXn87h8SZBHIPpRNzHDnrglGnelBkuvtMKpO/7HQ==
X-Received: by 2002:a05:600c:a00a:b0:475:d7b7:580c with SMTP id 5b1f17b1804b1-4775cdbfademr2635395e9.12.1762279832100;
        Tue, 04 Nov 2025 10:10:32 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:31 -0800 (PST)
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
Subject: [PATCH v2 24/30] drm/sun4i: mixer: Convert heuristics to quirk
Date: Tue,  4 Nov 2025 19:09:36 +0100
Message-ID: <20251104180942.61538-25-jernej.skrabec@gmail.com>
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

Determination if FCC unit can be used for VI layer alpha depends on
number of VI channels. This info won't be available anymore in future
to VI layer driver because of DE33 way of allocating planes from same
pool to different mixers.

While order is slightly changed, it doesn't affect anything due to
double buffering of registers. New order keeps related registers
together and quirk separate.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- updated commit message

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
2.51.2

