Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD32F7469
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297037; cv=none; b=fmZbDDxqtJMrTuyOCEtpXNzeg/c9QnRs5jc/qRPWbsbQqObuatae+G+PRLUWS1tPE27IH3u8eIoi+e0YtIz/K430lS6nMMz9YM2zsOG71d/1SXNjRMqLei+v/YWWIO1KmumECy9ww/NcJ53SZLOqC9FMnpC2Jg8DCYLWQWCd9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297037; c=relaxed/simple;
	bh=vS1oceHL9gJHejBT3+qUlJVs/cal4N3Fex9YsMuGCJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qF0mwVyKiJ1MQyAmy4HS/TW+Lj6YxjXz+7pRIcgxNvBDAu0UC0IgxDXrw15i0gy7EN/xLzZ7gskBr2zl0N35oBn1/EPd/2igWRqgn42ntagOfvwNl9BH7fBeAXopTNXvrxKdwhH8DLE0FieDh3/5p4mkeJx8lrsTev0A/LJrMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD3H8nYe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD3H8nYe"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso558558266b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297034; x=1760901834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljTiHpH/7wCq4Sb80OipRX+gpuymv7x8m1cTbrMD8nQ=;
        b=gD3H8nYeYpmwAjgeUa+3gHlBeMp3C3cNmpS4QQQeiB7c5RVid47YlGFTeFsPcJYXt7
         f/acpL4VcMy84YDocCPrLLbBWcR85ToqkDNrVTpd3RZWanvHG+czSDGQ0XlJNWKVp7FE
         iH4i+biJ4N5i2as2fjG87T7C9kNRWNLGOAOU0Q0skYA5dlXCabHv8Bo3B0kE3p1WYDhB
         ATDM5q1nEpxa1ky0aQgkw+vT7FhFK05l1s49PHOFmZ2frZPzrR5UqlVGjUj2lYdh472l
         cRS6cy+Jx+y5XeHf4ejmf2/S7o660OTsy5hxtellxiWd2yz9+L4/ARUcmlwPZoe9wlY6
         XFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297034; x=1760901834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljTiHpH/7wCq4Sb80OipRX+gpuymv7x8m1cTbrMD8nQ=;
        b=gf4RP8LYTPiEN5/M+1m236JbyYU71Fme7crPOqzHaw72UB2QzOpVedLZ5Djdt72aMc
         HyegWtdvvCzG85brQ8/mbHPwKuARvBTlwUlmKtO2nVJdvfjhUu4GQ9CO2XXzK0wi82d7
         TDtAZe7VjEvtlcMvXmwlORwV0Aicy6PpYfp9VV8xzDvvMkXarQ1FXdXv9xT6xmf0Yncl
         4Ol4NurQBiC97PcaThL6KhzuA/f0ts58BXgHPsEdnUbZVvnPX6u8hHTbx5l9NxyC7Bw3
         KijQO6uC2fUm91zuy3OsIEprXUuKXTOjDhuevJq6wsf3bCjCa5jnrhYcJ/1JhhkhqrD5
         gzlw==
X-Forwarded-Encrypted: i=1; AJvYcCX3FfFVMTa/yajTTFwMYsiEbS4Ogg9yI5t2oiplCHPmnNpST6eb+GxpMJWOibhB3IvBJW18pU+MbaMzMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWNr0jAjfMm39olQgjwNr1GnOz/vEhEBRKxX57HsbqopfU89hO
	VPKBCX4Dmc3S38eXqyNFoOWv4ORWg5qcZ0xWI3FzxJRk0eWGUsnvtM0l
X-Gm-Gg: ASbGncsc71oPApduyQTCzhTjMWea1b8OSMryNm6ntSjvyD06o4QguPpNkUMGg0t+zKs
	6YBvNCEirmLcfSkkTEchNuIXwCexUKkZrSRbIulaI5QqWUG5Rr860d7uYWkOyG0spyCZXj01u6Q
	vPERBtPlnvYyyURn10TlSVso43f9bEe/U7FAcU7y5abPsFhTwCFnXeZfQ6FlznC8AGxL9cVVCx6
	4baK+UbyUtMNw4dQsRIv4oJDUNjVYIryCbEF2tP7ChZNCiCqc0xNAieJq7yzoIHTuTHtHT4HjZi
	x2j2akwjY8YZawkwy5aTP5wv3R7qSO2Csl5R7ZfY3/LZU4r0xLNEGV1Ct89O+C2reEeO9vnmC6x
	/6WG/vkS0hpJdv3kU1J527qJRDlAW5aZo9yW18wSEzEl1fPLQjP0hOYHnsqaB4aaVF9adGBAQko
	CqRexfFFeiO6GfZ+cBs0bh
X-Google-Smtp-Source: AGHT+IH2UBZhZnnANHj8S5Ub3yMR8kafMnVt2A0h1CRlogccMK2B7fLAfojkqBw32F0r0liwzWP3zA==
X-Received: by 2002:a17:907:da1:b0:b3a:e4b3:eeb9 with SMTP id a640c23a62f3a-b50abfcd075mr2031796166b.55.1760297033577;
        Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
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
Subject: [PATCH 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
Date: Sun, 12 Oct 2025 21:23:11 +0200
Message-ID: <20251012192330.6903-12-jernej.skrabec@gmail.com>
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

Merging both function into one lets this one decide on it's own if CSC
should be enabled or not. Currently heuristics for that is pretty simple
- enable it for YUV formats and disable for RGB. DE3 and newer allows
YUV pipeline, which will be easier to implement these way.

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
2.51.0

