Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA272F5A3C
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297034; cv=none; b=AWAta9rtilNTs1PCyX9sX8vPNSS4dfoc4rUjjdmf9EGCwMCaAP4i0awlC3PHAsVooZciZxSB0YDLeMB+W8sHeTBYDOW1Dq2JGlefJZ/Jo/l4qDUiiolXBGbQoJe3juccSU2fG8qO15PGtDGLQfUX9v9M7y93BPSEW4t/JNgwS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297034; c=relaxed/simple;
	bh=aUmmA0K5M3pKV/DONNVTH0LdjYjNZicMZg+Z8mCeaio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lj+t+3rUYgDuFtMlXDMh9Wsx265vVb1ymQMOk6fYShZ3BtBANQ6gUOjBlhMlB4gO87wJVcvY6MGVW43HA7m2Y8dHjdmihvcsg77BO3NS5K0O1J06++dSOZ/khaHqahvMHbrUvfHAHFRt0JsTT1QM5qTvUnFl5udiDxsRiEA2oRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmYFuYCz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmYFuYCz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b54f55a290cso469279266b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297031; x=1760901831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j2gKZWvQ3G/p6x29ljxN7hGavAjse3Wea8WQURA1i4=;
        b=cmYFuYCz8QrX1NiFR0l+3PHbJFO2Ijs5hiI7ZTr7av1Scp8iZwpLfIiSkfTVC8jSWT
         qXOPe4NiMhpd4vEMx/fohandAYVNpEJcAtHdIibnnLVCE93U70f+B3yWdD130BYj0UhH
         qogmziHY0dAp10Mo76WmdWNs+kfrWueSyXWP3ls1ejjvvhts1kKf6DkOHqbLEvVSXfm/
         mw+Y7Owhp3XHoeU05woSFLzemtbdNBt1/iZAfTlm3rk7RmmJJI2nQFZ2mh79lZOJBJTE
         pw9qwv0CEUpSDq3lEj7x1QIlVX67PgNrULCSIV8dM9VmGAOt0ciakDWxdnv6J4cCaUEX
         WdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297031; x=1760901831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4j2gKZWvQ3G/p6x29ljxN7hGavAjse3Wea8WQURA1i4=;
        b=DpUEcBHh09sFe20Xw+Cjc82p9RPpj3IdYP2EOiNxVY56ozxML7aMJ46ajBrJEQ0Vtu
         U3lu8Gb0qayWbB0peS1fyebWo4cTog4mF+FgfBgDzOOjp2bcMS13DPutk9OxwmWwGNRX
         ryRiha6U2aW9ATCDjzfC0UCwZvsC8Xo7uGswSGbLsycNso44AZGsfR+2itNWnqJHMCJ1
         QUPAxtr3D7qtEkqu7rV5b3G8pdsoagyBaNGP2L6YAwCfZswz3kvau0zyUlAvmgaTEAWb
         fub8JknmK1WqTJ6nCqof8M41xvGc0Yw/g2rdaf9hHrLQlZioKhAnYsZSfE1zK+WD6wRC
         ppJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjJa7ljiQjtChr32x8Wb4ba9Vd82vfq6oc+45cqX8Erp+AH+yJJDPFlJjOlHGPxzNfthAZE5cdHipR0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+AFFy7hx3afYpr5elo4C844u/2HzTovn3Y7bWkK1j5KW0XLkv
	7oHOSm0uOXSfbwdWlSMKPx8mKGsk3GD6N0DuN8mH+7BzYkDEkV7cPVHC
X-Gm-Gg: ASbGnctpMA3MYuu7o6O7G1+tcbpCeqUwmACNA+Pl2pcDDLPUJt1g0WELmSXC2YNFxFP
	fiOPbPKO2w0SiYBOhhna5cUIhGrmQdqzz1WOm+4Q3GZ//xdJpgURMRyYpvduv9DWPZtP/bBV0sG
	PuvvbGYNItmPiGTu1AGAAAx+CCdXT/Zyt0E9HeXM9S9EaNMgNGhsnxcHjZGdMn4UeqbaQxkWFGm
	lIGlJQqeFd8ssG0C5nzQr3kYs7OSRwpQeziNodNcySSw9LYY4eXvwm/rt0sC0vwrTXqDCHgDFp0
	gUU+PIjm7zfS1rhlLdqng/QvCr93/VKYB2a436CVmyuaXgga5e1P10x5a4U7h1Eu/XjKdnhf5dt
	tBtgSSjcEfTx/txoswNyJRAAXzmUObmn7uMN8hOIpBRP6R3lYYS/n5f4PIRUW5t9LViYl6wzTjr
	Tuin6vGVeXWE1DRtJcaDM31AEdhAlsJ2sVP/8Gn/mugQ==
X-Google-Smtp-Source: AGHT+IEs/WFctDa89+D/WqWhY5uZ3WvAavRVXRQFM/TxuoPg9kA4sKepU26nxFXJKsHh5KgVUQFpfg==
X-Received: by 2002:a17:907:724a:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b50ac1c3f18mr2033310866b.40.1760297030814;
        Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:50 -0700 (PDT)
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
Subject: [PATCH 09/30] drm/sun4i: vi layer: Write attributes in one go
Date: Sun, 12 Oct 2025 21:23:09 +0200
Message-ID: <20251012192330.6903-10-jernej.skrabec@gmail.com>
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

It turns out that none of the VI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework VI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

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
2.51.0

