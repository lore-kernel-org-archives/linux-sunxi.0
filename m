Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E12FABFF
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297047; cv=none; b=Xcy2qGcCmAs2c7+Ip+7cEDHRZmLg7Umoly2ckvQ8+AH53SiDxhNZweNVdYyOWbVCN0LC+s8jjIJw0l91dYkVBHuoKt194iE9+H06H330Do/fGeG21D/MW6qmvW8LnZjy6svvJg4H7nEJ//CGFJzvEE9gXF9pAC//4Rv+CdX88Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297047; c=relaxed/simple;
	bh=zbt5I065g6BO3drjKwx+RPXT/JavcO/tn3lo2YFsv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBBD+uWzB5UQcW0AMs7nvVeTb7xZXeC210U9iMN7eBuaa07/vWxESET00xj8rFAMTFy1CJO3Oh3leG7BgXwLuNH1fpS23JxuQCXUexGetXiBLDOhVUqRvusK/NoQRItNHMFdfaFVJbrk06le455eq5iqsRJ2SaoBIBiWOsZy+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9VqO1YD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9VqO1YD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3ee18913c0so549777066b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297043; x=1760901843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
        b=I9VqO1YD46UOECxXanggXmrlBuhVOZSa41fqoNgAdar0jsRxg4uovvwThlPWEWqw1f
         kk+8AmHmChQVD5E0SDN5RRhJKPJSENoPpk1pkcLSYBlcuPklmWqZoYxTeb92bmNnIzCT
         YfvFG3PvJBoBCMJeOVFxLR2l2++3SqEQU8ytMccKWSgNTCuEkayjhUmgIgiJMW2hd7tg
         3cBR0IhOrLpYNu0pznpQOCmLGPG/K3mmGw2ifp2fZIXZuoH+VPF6VDuhIq64RfEipKb5
         vldVRZVAmXCH0jP83cpC+FZUg7g8vd6zcNgfyM8YHysw+aOconTs/ZRmXMbzoIBKNWxB
         6Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297043; x=1760901843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
        b=rD/PsXNvqmAKwKNE53GQXHtUOWtAS0cMC6+ZZwiKst1396ESy08OyCC6RDLablW2dH
         4qTvcqAYGjM+KyaHwu+h7o2+g8iFc+RmD+LaVoWUJHkKGrSrqEQgL6nhtgVDbMBW8Mpc
         twOkl6qhBBVOac6k0EhQPccTMkIGBOLpyPh22JnbtDcY7JFIZTRbVFOcKDe6e/XUi98D
         42GyiCCEifiy2OQB7O6P1/7pBI8b1imxKmkEz7iyiTVDq/rSjHpkFd0eXnQhE30snZmv
         Q9g5zGyHyT43f45WSXT3ev4gvO7O3lWsSmoQH6UApn5OiCvbv0BJZP7EEeAth/xxIjap
         XYNA==
X-Forwarded-Encrypted: i=1; AJvYcCW7BPQjyAlFPvqvKpvjGKWJ8267WkEJ5GDx1JO9lXLVHi6aGp9XqMwL4wsX2eZfEmkLG71llAp20qSPaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAkGteHhZAT0MsBx68WleTPWLyxY/vTzxrk5Kg7SyLCkwwATnr
	/hHQ/ggdJVoYOs5vZManAkWuyiB1FrjRmqRtDX0p7aS+1MXFzdCV6Pds
X-Gm-Gg: ASbGncug6sM+lJmf8neiyYl50OmBZiI7YOZagSVNgPSwIe7CLPL0cPrjxKqvlGpSu0f
	xRSGKg3Hw+X8hwJHaA0DZkLn+DXd1MrjdVhRR+T3GhF5OzR0oTLq9PL5E44RdLIm5jsbt6aYSiF
	JjIPo0qFLTPOZKEN48iFf6xFd3HgZz4xvUpWjCSMXjOaghJjiUszD8gaUor0aSrJxJttklTBGe+
	Ln9/J5i6egkfFNnLgia6WWbJxohVLU07A691c1fw1BJkPfms2FTnlBQckcaeDHjaQ3I5tM9rbLC
	jclz25M2/FA89HNutqfEldZjHCWK8s/rRNHzDxKU6rlxCSPPd3jLlB+hsfbzv7XTquOqq0CmEAk
	HvRfmCI/k0S6gR68vGuYMr2JUkWNpxoDfzyVDRBqze24ZYq9xHT+5AGxszf/OahERB7wggNGuyt
	P/DYP8LbUFw/rfiiFWnCXzA30QhCa61pVghXGbKILBrg==
X-Google-Smtp-Source: AGHT+IFPlXF14w6080DzNThJvuRd4CnTuWjkOojD58VBx0OnrlrRgYOo8wgfu/qp0NZs9oaJy8dhYg==
X-Received: by 2002:a17:907:72cf:b0:b42:1324:7986 with SMTP id a640c23a62f3a-b50a9b61f8emr1913954466b.6.1760297042759;
        Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
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
Subject: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer for args
Date: Sun, 12 Oct 2025 21:23:19 +0200
Message-ID: <20251012192330.6903-20-jernej.skrabec@gmail.com>
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

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 10 ++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b938e3dae9c..5167c9d7b9c0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -103,11 +103,10 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		vscale = state->src_h / state->crtc_h;
 
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
-			sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase,
+			sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase,
 					      state->fb->format);
-			sun8i_vi_scaler_enable(mixer, layer->channel, true);
+			sun8i_vi_scaler_enable(layer, true);
 		} else {
 			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
 					      hscale, vscale, hphase, vphase);
@@ -116,7 +115,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			sun8i_vi_scaler_enable(mixer, layer->channel, false);
+			sun8i_vi_scaler_enable(layer, false);
 		else
 			sun8i_ui_scaler_enable(layer, false);
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ba9c03f04f03..ce71625fa06f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -162,13 +162,12 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		hscale = (src_w << 16) / dst_w;
 		vscale = (src_h << 16) / dst_h;
 
-		sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase,
-				      format);
-		sun8i_vi_scaler_enable(mixer, layer->channel, true);
+		sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+				      hscale, vscale, hphase, vphase, format);
+		sun8i_vi_scaler_enable(layer, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, layer->channel, false);
+		sun8i_vi_scaler_enable(layer, false);
 	}
 
 	regmap_write(mixer->engine.regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 82df6244af88..a76677a1649f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -909,11 +909,12 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 	}
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -925,16 +926,17 @@ void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 		     SUN8I_SCALER_VSU_CTRL(base), val);
 }
 
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 chphase, cvphase;
 	u32 insize, outsize;
 	u32 base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369a..73eecc4d1b1d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -69,8 +69,8 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format);
-- 
2.51.0

