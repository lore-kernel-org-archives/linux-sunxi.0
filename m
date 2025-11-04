Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFC3451DA
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279830; cv=none; b=p4RSVq9cGX5ZMpHKf8roo/XuBPWm73cJc62hL75/b3rN2dTrwqEZfTu3Ya7qZGGQwj9F1RqHdhciCIB+IGvxqGTWeJv7akImdWl2h0H/K5gUCkaCxlejyYtQQT47H4LuuIIVhB2V1xz9cejyXNSrFPBHekXH4edYfymh9tKi50Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279830; c=relaxed/simple;
	bh=orhvpCnZQU+YiM6vENmZY8xT+JzEBx7B3ZDTqYXr+XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1xBKrlBGVM7kcMFDghsrZO/FM4OoMu55EhJpDjrB6XN7EDH8w+aDdO4JLCjHxYNg3W3hhTx7fyBZTbzP9+nw4sMUJKa5+RjsTVZlghueQcIpP0DqDEZT8rQjW0UGxz8rxv3JvLFc3L9YPGS7mPlKVmJa2vZ8Rg4Zk/diGUzAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0CADxjv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0CADxjv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775638d819so5232415e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279826; x=1762884626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=;
        b=f0CADxjvEerlO3JQQkHLet4GeG7mPU9C8p1UpO3/OKb9xnPQQmJWuueA40HrMzdYtb
         7wdmUVJnn4yNnphKxNNXPXlrtkSABQmb81ZZ5h7iomFSairfHeHSbUyffBVQdX4ngoQB
         cunz3u0g5zC+mtCSrdv8L/gOV+9sTV3OP08jAuJ0DKJJu76l0e7i0pugUrn/zKoenfsi
         wj/PYndhDxPfcz5zM4mvS+WZIo2D1O3kdVHhpZ8MklmeH5bS5Gnf9H7F3lWrI35Rsjng
         kwOUB1j2/PDTMYhxBr9HqDS/OsZsu+LGubsoTct4Ajg/cQ2IGsFH28eZy5KmMvRBQFeu
         znZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279826; x=1762884626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=;
        b=lfrQup3iGOGW+k1e9MGZcDN146nql59yWm9pugTVFS/H7QbTiwSRZcUnlF1YJxG9LT
         Hg3R7d+xkx82lttGNbOMECt+AvQfHEDF6/KTeyRES8k3ybKkrXj4cMBXUxFFGLdosdiq
         f838pQTSBuN5C4P71Dq9bOcnod/EIrP4WJ4CdpU9hV3yN7HhyMs2rBvFts9QFgaEUpUo
         ytpL45tBHaRBcHAXSxyzmibztZmUxH7M3ZyJQe+34kSWqou+jizIz2FaLXI/MKwgXO8o
         tEufjqvEvLZGlEXbG27EuJc9tqJbuVfwANDyV7hU8j7tfi5EaMYUUUYUi29sWYcouWIa
         n9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXkRKfvN3YTuK7PDEfH6Xp0YiIDXe8amMG7bcnddk0TWGFwxfpGPuO4blMfs5KNJRZDR1EuQCuW7gblVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyuKRoaYvNI8cY/HMK+xO73ht/HnWdZ9P3+9Ugt/H7agrqtJnS
	zItTiegpZUTbzlhwshptzPwqpsfgLXlUclO6H9fsZts/kmM0GUFXI4oR
X-Gm-Gg: ASbGncuMaxipw8R+VIEd1SKeB0DTIHFlj8lR6qkavhKurEBjMAi0nVtbpZybIldhRdM
	OM82ntbtbdW4sQKWQc3qCwWV9piwu2DlNoaUqHusGqtcviORvlsmoGDet2pWCjdeATXcgfbmXeg
	nGUxL2mC3UKW7pb4wB9k2hISMHGDi655759Ud21sb1zwzMuypAtbAkN+kQe3tVUAsAzywWcQDVY
	LXe5zMQWFE18pPQdYxd32Oi/kzA9H5zQFMTcwiLeVvtfRIh5Fw9heIXXUdy2oPgIQASy99uTU7d
	AXmVGECnWYVWbf37jbdMXz6ZWYG8K4U5Y6rgIJyil7MmzjVJO5HQhwAf+ih/YcbhodOZcPYM5Zd
	OyUUPG8qutwMFnHhNZnSAQK+BjVMvZJtaldvWzPhgdL5JwPQ4ixUY+Z3YHjj0XcRs+t2wasSfY6
	/razyaSJPqbw4nfzwH0A==
X-Google-Smtp-Source: AGHT+IFE3mxZcmB3xFrOwCz13wK7MeGXCTbyLCsueT8YPunx796HFToC9lCdkfkmFYbtx1fnK13ZUA==
X-Received: by 2002:a05:600c:46ce:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4775cdcfbb5mr2723405e9.17.1762279825932;
        Tue, 04 Nov 2025 10:10:25 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:25 -0800 (PST)
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
Subject: [PATCH v2 19/30] drm/sun4i: vi_scaler: use layer instead of mixer for args
Date: Tue,  4 Nov 2025 19:09:31 +0100
Message-ID: <20251104180942.61538-20-jernej.skrabec@gmail.com>
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

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

