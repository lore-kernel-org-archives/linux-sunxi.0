Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A60340A5D
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279817; cv=none; b=OhblubM9m7hOr0bAmO7aT3wuLzgVUPaKjxinV/m9HOPg1vi+s7y9fNCBOyi0AUeyKl4iArEQ20a6ZRJEZt7tf5T29kgpHWXR89bCuBGyU5L27TzVBtCE9CVqz5afBqPVmRi45TvnGEuYEf2TuOGwt05E8LR6vA3XccyhVv6sjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279817; c=relaxed/simple;
	bh=eyy7EC4ErwCa3WckkA1iMdTKsrVPw89x2GAqOyAqd+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIdR0cke/g5vMhC9FY542QI/OWwbob8fSBqFwkfcCxQIgqMeFb3witKpRh+KVs7k0QcWY6cXydwtX8hT5Ochtq7JN/UA3WWGcpQo1ObvuCah0/+CYluWNbIDJ2OScldLLMSXSm5zMKM6mYwtw+oAOWI/FYoNwPuR2Dlke1vuXpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loLyCbp4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loLyCbp4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso48083045e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279813; x=1762884613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
        b=loLyCbp4cQBcsMW42DcaXhqmDwrpvR+eYEhO+i/p1xkl35Kkp6saR/XmRstY1MnjQ6
         BExSATLvYRxcAgqETXQalQDx4u25ENlWmsM3/lST9bmwR2SR4D+kQe4VB0Q91nl+fiW1
         WNIxNeAR3/zl6ozf7Cl4N5n6rqXhOf9aUNE69z2xBJoypeApR7Gcq/2dAYcQhJoptL4I
         2MKzhcYPfmKjOhhu6miXl4XH2/4zealG0Hz9geuxL0b+5ax6nC5txt4K+IHOwkzoBZob
         NxkLBJQIrISHNvxyOCivoLo1qPXG3xf381nkEub/oXpZkL4mKaGWVa3QYwNULlCV4MuR
         /mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279813; x=1762884613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjm6bAyoMllMD1Q/IvNTNZhpUzj787YRLXUAz9HfQNA=;
        b=sdE1xVY9Z1uCyxBVb0RdAmzP+cJd4HKFa1RG6WjJztv55kAMuZYOfNnbinZ9bFw0C9
         eIdonm2vTZFtzgLpH5wkQJVm83K14Qekf22u2STQAfi21g4PvNzqdehMgyhhSQG/2xrP
         Z8utXwNkNraXIvJJu2JRYT9mv7ALDbEJw45/ONg/JK7mgxmHMglJpIrKpT4IbDaziCTB
         3nylOFV4HfPWlpBu5acuBmK4+8zbrI27SmCmiP/ZTFlzU1edGd/L9DXW1tQv2jBT0geo
         udT/r8dfyIsFTXV9mVQa/DCt/yqT0CiftWv53hEQMh68YwYD/rPRyrLICZ1x/34U4DFs
         m3IA==
X-Forwarded-Encrypted: i=1; AJvYcCVgd9UmbLZ8WykRMz7hNP+380Yolr9F+hRywgmFUgQVZpdHxEnBMEepw8M5+QlOoS6rXMr5vw1/Vzeozw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSczXoZwTLwh/KcVwXJsR9ldzpIjTkNwrzTN/lcfL6sHcH02wM
	d5Cxi5Ul8URPGjtPxyGS+Nzyxh44G0v0M3KmAujuJkVmenTNU7SnxqBs
X-Gm-Gg: ASbGnctdh2gyTTwaRvV6JVThumuSe64Uke+EF20L20/YRbchOCyjPhrOBBC9ibmBN9v
	ttMICfvEj6GENNOIOg/vCyILIUeTbxMbK3QhoQZEsDMUCJqAIeMsueM84BvoHf9+aeTDWH6tBT8
	TAEz+L52OhrOMNCAYA3zj/wpn1eAdw2q7djOLCHFDxozArAG4OMyQzoU5Z+7FVnmsWUDHrV5nl1
	3GfC5ijiNscdD8yZpYitU+lbE9n6eeB/3jy8dnZTErZvPPJldrercpkKUCDQQ3D635G3OujWwWJ
	Dc5DDqATr6yAZuz836hBCLNaYZVAzAvTDOtH/z2TUKNES0YoKNiANVuLMqTmDsdrJUTZpAV4J97
	SNV51xRRZqqfAFJjEOYcV8TRQecSgYTVT/692dXNBx9rVNnTsD1O22UTqPyFdvC70tcHxh7MUkN
	hxTaAGp4hqwFAxI14hsiG7RB/v6E8o
X-Google-Smtp-Source: AGHT+IHUjkvK3LuEYexNwytgkWNuB+3vDFUmi2M1K/MsCvY3IVkIm6wl0qrMfqC1Lyu5Q0aWPSh04g==
X-Received: by 2002:a05:600c:a05:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4775cdbd551mr2245645e9.1.1762279812965;
        Tue, 04 Nov 2025 10:10:12 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:12 -0800 (PST)
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
Subject: [PATCH v2 09/30] drm/sun4i: vi layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:21 +0100
Message-ID: <20251104180942.61538-10-jernej.skrabec@gmail.com>
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

It turns out that none of the VI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework VI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 71 ++++++++++----------------
 1 file changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1f4fa63ef153..dcc4429368d6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,34 +18,35 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
+	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
+	if (!fmt->is_yuv)
+		val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
+	val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
-		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
-		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
-			(plane->state->alpha >> 8);
-
-		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
-								  overlay),
-				   mask, val);
 	} else if (mixer->cfg->vi_num == 1) {
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA_MASK,
-				   SUN8I_MIXER_FCC_GLOBAL_ALPHA
-					(plane->state->alpha >> 8));
+		regmap_write(mixer->engine.regs,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
+			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -194,23 +195,14 @@ static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 	}
 }
 
-static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
+					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
+	u32 csc_mode;
 
 	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
-
 	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
 	if (csc_mode != SUN8I_CSC_MODE_OFF) {
 		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
@@ -220,15 +212,6 @@ static void sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel
 	} else {
 		sun8i_csc_enable_ccsc(mixer, channel, false);
 	}
-
-	if (!fmt->is_yuv)
-		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
-	else
-		val = 0;
-
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE, val);
 }
 
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
@@ -340,12 +323,12 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_vi_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_vi_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_vi_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
+	sun8i_vi_layer_update_colors(mixer, layer->channel,
+				     layer->overlay, plane);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2

