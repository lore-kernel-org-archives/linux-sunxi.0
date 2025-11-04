Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CA347FC4
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279840; cv=none; b=hmvhQEOmEMPwnPVCO3LeVRV/ILsix1LSdVsZIEC1xJ/h9rN7GkmGbV5tlI2HiUOFFSQgN7js01BMFl8K7X0H746rBmnzxz7Rb4JA+CDd4R6O0SW1d+pkpSLiGy93YMLLiVd4xmYsOTC/QWGP5jGQ8cZ7+BYytKySNl3NXymHoPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279840; c=relaxed/simple;
	bh=I/Hk0/PHLO8sCGFPEQw+OU4WzVurFU0CE21OKjEm/Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPSAtfoS4x0VXGkq6P0uHlQIgI5eXLNwjhifGKS1r1195jqty3TXAhm3yePPixEXIWOlZXtysikVIHh64iDqKUSRmL/3MZ51Isb8JMZkIzEZWBfInUcRM5s+FGPBps9GljCC+WEdu2L9AFmTMyUj0SaHbjTX5RcpxpY5lw+7bA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIJXIRLQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIJXIRLQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso78257995e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279836; x=1762884636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZvB8XQL4XH/MG4JrDvft0iLE7MCAIYhxytBa3l55Ko=;
        b=lIJXIRLQBTLAqccEEr9yk333DZVLpGiXvK60UOR/8opt1PBcy/Jl/fareAhW6aI03Q
         oPRAsEf1Y88+k5j+jvkwFNIqeMUah2KQHtNy54VqlilEIKR7rmNGHho78lAiKH6YOfCV
         8iJh3O4kyi7i+PsMv47rhVPJmdLH8JEi6kh+hzsfomzTNpoXS6rtmHPRxd9DSwKi4xsF
         J/WS+7anp7w4RnF3iVFZVPvU3tYExVx8A925UpRkT3So9TNdDAlQGNzTDXK+vO/bXeTr
         F1XJcHmpdasgU12vWNTpLX8Qg2kiUp0lhAIAc07zeIgy9D8DpJ2ZQ1tloZ/frrrELCgj
         iXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279836; x=1762884636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZvB8XQL4XH/MG4JrDvft0iLE7MCAIYhxytBa3l55Ko=;
        b=UYeONtPg9WDERS4z9kax6jpxWMHqYO7zJfcsKIf2NfCscWUeoopcnuCWjnVG9w971f
         1VkfRQ2q6s35lixagA7IYINA5wRC7JtobUCeVthH5Z9st0nE0qHDNF4iz86wsKxIyNKX
         A3YZY/oVtE0i2OaUzkVv5RdlXi7xsQEfIKVozD/qCx44ez20jQel1nvxmbYWpo7tni+g
         Ya5dD4EUo72v0bO+wXVf6H5aklNQvo4V9MgDNg/a3c+H/oqnNulhEKCvYZXD+SKEgFAm
         jlMEkqW6UFp9mHM8CI8XUeGDtK3zdYlBW3grfR3BCW03l4VeQwAf50ycU9szPmdI6q/Q
         W9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZZ3A8AkeV6VyzqlFKjUTXFxElexFbEnbTI4JVmu0x9EnSUo6kzHwxz9RrWCjNLYUqiGFg7E/bvc2MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJnuBhhFgz51GR0cP1IK2V6VN8OR/SpUPqElvDXBdfP25nIZiF
	Dym+UhZb107/vIAKtLC9ibvUTpsIeA42n4SGvkhpnPNCZaFPQtaiZ/vi
X-Gm-Gg: ASbGncsfv4TNTEU1t1O3Zimgi9OzFsvyPCcTLI9Rie2xJIda46b5BZ5ADrLnQa+Umja
	gC4ATR5dYPboM/9PxEaoBKA98m0m+Qo3Znxga9+2yrpN/DvIU6YRh2if0RgkcxkZJ7GnAaOkgdq
	bFCumfUtFz+h7dotJa8Q3Dbk6T5gNpxqEJW2gE6FALDKnh/pR+9JW0bxqIWv3wMhGVS49JoY4ux
	QwCT6552L8U72hmrK7hPQoUUuYakOz+kfmHJZ+VWpjOGO+9L6pVqjveXrIgJjJGFbnjMothMjaM
	YTjXAYmBHBd/J9yP5IMmoyjItgB8RrjP97x8qxfxeGM/VzpPSue1wqhakyQsrS5LfsYQC8Md17H
	oHK449P4GQ8zBX3eUmg9A+XcGVZWTdvm+TzqRCFzkK3NXCD3fWT3IIweKRlN9qDeTQ7Ob8BSfZZ
	5dp8czc/PBIeKGMx9ui8DWERsejhEj
X-Google-Smtp-Source: AGHT+IGmzxfk1x8fnehx5VWjAyq7IZc2z//0VTUwWlUQBtF4GSFWekOx3YeV0AJtLvY7p2RmMGNybQ==
X-Received: by 2002:a05:600c:3110:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-4775cdcfb32mr2222405e9.18.1762279835799;
        Tue, 04 Nov 2025 10:10:35 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:35 -0800 (PST)
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
Subject: [PATCH v2 27/30] drm/sun4i: mixer: split out layer config
Date: Tue,  4 Nov 2025 19:09:39 +0100
Message-ID: <20251104180942.61538-28-jernej.skrabec@gmail.com>
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

Later special plane only driver for DE33 will provide separate
configuration. This change will also help layer driver migrate away from
mixer structure.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- added missing .de_type kerneldoc

 drivers/gpu/drm/sun4i/sun8i_csc.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 152 +++++++++++++++---------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  33 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |   8 +-
 6 files changed, 123 insertions(+), 76 deletions(-)

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
index da3148f42646..4559e959a32d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -703,137 +703,173 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 }
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.de_type = SUN8I_MIXER_DE2,
-	.vi_num = 2,
-	.ui_num = 1,
-	.vi_scaler_num	= 2,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
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
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x1,
+		.scanline_yuv	= 1024,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x1,
-	.scanline_yuv	= 1024,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
+	.lay_cfg = {
+		.de_type	= SUN8I_MIXER_DE3,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+	},
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
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
index 8c2e8005fc5b..5b6068755ad1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -164,34 +164,45 @@ enum sun8i_mixer_type {
 };
 
 /**
- * struct sun8i_mixer_cfg - mixer HW configuration
- * @vi_num: number of VI channels
- * @ui_num: number of UI channels
+ * struct sun8i_layer_cfg - layer configuration
  * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
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
- * @map: channel map for DE variants processing YUV separately (DE33)
  */
-struct sun8i_mixer_cfg {
-	int		vi_num;
-	int		ui_num;
+struct sun8i_layer_cfg {
 	unsigned int	vi_scaler_num;
 	int		scaler_mask;
 	int		ccsc;
-	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
-	unsigned int	map[6];
+};
+
+/**
+ * struct sun8i_mixer_cfg - mixer HW configuration
+ * @lay_cfg: layer configuration
+ * @vi_num: number of VI channels
+ * @ui_num: number of UI channels
+ * @de_type: sun8i_mixer_type enum representing the display engine generation.
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
2.51.2

