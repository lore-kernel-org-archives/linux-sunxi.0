Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B284344045
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279830; cv=none; b=Og3cu38YLm70N6dM5QC5EFHnEcFtzoAu67qPwGeYxLgFTi3fPK3MIPjqb+1jIQ7ztDTxobslXH7PcyFjNRnEdVd8oqpBGuI/EvH/7i9ry/wgesal8a01SUCGFSeY47rnzMBd8w23CXR8Jao7ioLXRYRhn5fBLg6eVyT65xjrpAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279830; c=relaxed/simple;
	bh=dY6ZcTDLzk7IJaQR+fODPFvXrCrNpXJ/qB5JCNXGZaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJqPbXeUWeZuFXk+mWItoAsB2V8rjw2gip3iSlkQ5Tbf9D86CsODKMZYbtN8nputIEWUSDbUJCmdkxWG9ufsTXppEcrGB7Cu8aOP15mgY9fF7TOtoxNwKMaDl53rgaWsLBiwr66Avs4os+mcvyuTkGJ2nge5a/xuJlc5cftLqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLYRRpZR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLYRRpZR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso7992915e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279825; x=1762884625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
        b=PLYRRpZRKTb8aaAhyTlcAGDf2k4VprtTEJNqfX9Nrn+rCNdLm2Wi9NSKwbUfO7xqPF
         GkiIpEG9kW4DyCyQJg82tvRPUGjfDQMYkzjBwt2ptN/oy39GyMVCq2I2Ib5r90JaQfNR
         reF7bAtKb0iVTa0QsN/f2UFARaw762nh8XL8MhlfflklgZmE6Sf9T+u7m/+Eh7hkZkmN
         NFu85LggUzac4AT38ZdHR2tFDvV6wu5R0idP/5m3KGjd5+y1GgUubt9legDPWoj+r5a6
         FYP7PXBletPZIIEljW6U5VLIFmoIbtLclsEapj4zR31rptSRZh687/tIz2dA3A7LfcVr
         9f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279825; x=1762884625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
        b=vmYJ1VGrkblDcN/kXuivPrSgXmhxW6Vrs3x2DsgcdH30fBhjN30Htu2BuZ6uiZFIy3
         LgC4GZJTUUh2PBla6+7a6jCDuVV+fnLjhrekkTGcxOGpIUXv/M5OoBs8O1gdpxX385/A
         OQ+gqSjKebPiJQ2jmu4S9GU84edc7uOKd0RhDaVG/flzhfWFtY6+p6qvSzDPa2Hr4oQC
         p/wtRq+FAmyi1MvSOWNUtL+Ghozq0UgzecZ+uk2Cu+3aRY1ek4zP3hJhAsaa8FBdFYfC
         gWaRShMkaJb5Itg0+CZ45T+OKtmkEB8bvvDf6nCnut6+PFmQ9REbg8aqEHsezpAXg9ul
         BSjw==
X-Forwarded-Encrypted: i=1; AJvYcCWZMCkHWGh0zcDCnhiMWmbzS7Ry+uvy2xdjkmATp0hVPWm/ZBCfhD0qqAAjJBSS/wAPnX/yZEP2TptXpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMDV83VpNWvfV2Y8UyBwZOpS5N8WA0ueghyZKzIgOXrvYQgm3l
	6Aqe8ltPma7b0aDh8G/Hhq8Xj9Afq+eUmQCfuQdu0Nll0Hy7BeJorLyO
X-Gm-Gg: ASbGncsIjUnYB2g/vA2/npyOXXZ4e/hjnhjX7/q+9fcdplXHI5Uf7TOHQatuuP9V2rC
	ijPE75X9+QyRLPziHaIXebHBsH9Q2fE5lyze3avg3vLd6gZbmJJKP0syeOTJc2DOb1Wd0Ioldj2
	QguE9FnURWLZPkgq927qflsfE6GCVdu1fjUhlqlkpTeW2aFVp0c35nhyjlr2hz/4Gn/ed/9+KQk
	c/dB7t2TpBIP8NtRqXlkuCnpg2EE/tEU7ptmStigGvKXqPbjfeH85+9PB91Df7gTIZptzGV86+U
	rsCFxHum3W1pqDwsaE8aJknFcl08AMnpMz00XVyNzAPlqjOQscAlStCNRnUYYqUYUFYzTCRz2LQ
	s/k0PBbHED/sVOG97OvIDE21kSQi3j705cKCxpcHLsqSDSg+BAqUEHGLmWuxDS6RIQ7zP+1OJjh
	VluIXiSNR3QPdE3yl3Pg==
X-Google-Smtp-Source: AGHT+IHm1TAQjaSzwnbLWrmSeHCsVmHtk5JoxXFn6C5ye+q9ij6rKyMSLmT96AnudZeM+B1bys7ikA==
X-Received: by 2002:a05:600c:34d5:b0:471:1306:aa0f with SMTP id 5b1f17b1804b1-4775ce8df34mr2008325e9.38.1762279824672;
        Tue, 04 Nov 2025 10:10:24 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:24 -0800 (PST)
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
Subject: [PATCH v2 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for args
Date: Tue,  4 Nov 2025 19:09:30 +0100
Message-ID: <20251104180942.61538-19-jernej.skrabec@gmail.com>
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
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 14 ++++++++------
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |  4 ++--
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index d5b7241acdea..9b938e3dae9c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -109,17 +109,16 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 					      state->fb->format);
 			sun8i_vi_scaler_enable(mixer, layer->channel, true);
 		} else {
-			sun8i_ui_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase);
-			sun8i_ui_scaler_enable(mixer, layer->channel, true);
+			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase);
+			sun8i_ui_scaler_enable(layer, true);
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			sun8i_vi_scaler_enable(mixer, layer->channel, false);
 		else
-			sun8i_ui_scaler_enable(mixer, layer->channel, false);
+			sun8i_ui_scaler_enable(layer, false);
 	}
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 8b7a58e27517..fcd72c4fd49a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -127,14 +127,15 @@ static int sun8i_ui_scaler_coef_index(unsigned int step)
 	}
 }
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_GSU_CTRL_EN |
@@ -145,18 +146,19 @@ void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 	regmap_write(mixer->engine.regs, SUN8I_SCALER_GSU_CTRL(base), val);
 }
 
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 insize, outsize;
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
index 1ef4bd6f2718..872d88a58e7e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
@@ -35,8 +35,8 @@
 #define SUN8I_SCALER_GSU_CTRL_EN		BIT(0)
 #define SUN8I_SCALER_GSU_CTRL_COEFF_RDY		BIT(4)
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase);
 
-- 
2.51.2

