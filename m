Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A12FA0F6
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297045; cv=none; b=Zol5xarvBdIRfIjFLF/MnPx0Tc2B8FUgEPLQWoEP7tAiGT/HTV6rO0pMjfU1nR8qnQOPAmSa7H/Xx7xRezV0S9Uz+guMx++8uORuXkSbaHeTL5MyRkIEYjNymd5fVPq5U4QAFzPVhBDJcGr0Z7lTrLy9iJz+e+Bl6EM5RPSHvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297045; c=relaxed/simple;
	bh=104h35l/DchpohDTQvOcPAlK0/ZZNw6ykSs+tKAkpg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbmr5aWGRZDGNXA1uMhurCtmR2jjdGlULiElSjRsNwNtCAsMYZ6cG0BYAKznDb/O6WK9Ot1tGafDgWzSnSaJGEjo4fey0ZgPatwSB7QAvqqNxxJKuyyPyhLLYdbvQA4jW3EE8iOnvSjC8tnO+qlrsUW8WByiSWmvu19Kc68BDm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpmA91Yk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpmA91Yk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b457d93c155so572104866b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297041; x=1760901841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
        b=hpmA91YkdjV/WTpX1EeWtbliPn2QIyKS6H4ZtOWiQXhTrhg45QzUiTlzaW3/g9hWUd
         4fLJYcqvrFnwj3b/7IquT5ec6KaSSAG9ndbNzO9xhsDA/CVg92kyFsI351N6UWjRcCYK
         kyMSEAbVc5/4HtmNQEBX2WVpsT2Z+ret8mseZXzDRRT5Huo7j3UZ+Gjah80Xt0uNiZmI
         UtUZAOrHkTF6y+zDPtjeh6aoZO3IJN5b7si3LKJTYLnhTiU9RUWqS0RLeiZJ6SijeEd0
         rutdsMNo/+ijmQZoZNqDPa/vmdkIpnz93p0Hq+dFVNZ+avdB3ThWqFnWBAkgfFlCU+dC
         6pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297041; x=1760901841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
        b=Xpxhgha2em8q7i4izz5lcVFASVx1m0je2TrXoSKbJSElTLerS7yQROaIWOQL5qD0VK
         dPkpgQEgByeENSGCv6htxhgZhU6q/uX/8A4VBvj0U5rriA4a55VnSS56++Hv4Xe/TjcL
         n1FfalFZIB+eAIqAGEcw6BqWH78IDc8XoicUSWIBU169h8ustKveYKUKHrBuKsEqpyHt
         XanX1hvYM4B1lEZQrRsubD0t377rBO04coZazkI9zzh6n7yNAAVIxR4IyLr8up/XRmrO
         xcydXvo0QGmMixh31hNvyWs33hnPRIKMdt8GMgw+5pL7/5vw6LvNwOvdsKxf1mPY1+HL
         03lA==
X-Forwarded-Encrypted: i=1; AJvYcCXQCBLJS2iSHabybdkQ+A4JbvKjhOq951cg09hTtfKBBZPHogo4JwLS8eQt66/rnleQxIALdNbM3n+KVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM0ziRZI2/XAmTNtkGkrqXAIAJgt1WocktKE0X4q/eZeZLoyAN
	ORY0y/nJQviTk6vs5f+Blfkpo9QHqaCSxuGRX+B4w3o66ZMLJz3EFOZE
X-Gm-Gg: ASbGnctTW4Ys48cUqDTV5427rnEKmNMhFhz+KcBCMe8CGRfCxvcM951vcTfWvq92BzG
	YgmhGFaW01bcYT+kUnyXrUPOMd23HYCp0BZhW9H8Pxq/3GETSCuaId0iPeqI6Iqle6xUPzK8tyZ
	FVWodkL2g7Nb6OIt7rn5El8Vp1MfbnDlt6N1WI2EaJVkPislZL7AosI3utprA3vIRDiwl9wRGAd
	EeN0lTaIsBLC9xuilwPIpF15sYwHdogF/Sj3rFSPCenmrZ59bltOiNTf8GC6KUImzB69Vgl8KV0
	HF6H+7ZSW/Dpr1MJ81dSAx/uAGCa8dqgSrTCHJpTfvCPfM4OYmSY+Xko97276CAM1hO9K+N95Vp
	qsR3CgUaKKxQxSWZud7mjdTrfCbaEBSQpXgcP6YTv+47z8EYRGqpcrZBdAnKfZUBskLBkrFukTB
	/pSC0rI0m1j/6wxFgWsh7l
X-Google-Smtp-Source: AGHT+IFB2WPpLvhhyF6jFh1SDHHRriNhPzMUznraEeE598jcJE65TAjpsOVtaGxdtE1HPt1fjYbNLA==
X-Received: by 2002:a17:906:7312:b0:b57:78fa:db40 with SMTP id a640c23a62f3a-b5778fae354mr614837566b.46.1760297041514;
        Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
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
Subject: [PATCH 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for args
Date: Sun, 12 Oct 2025 21:23:18 +0200
Message-ID: <20251012192330.6903-19-jernej.skrabec@gmail.com>
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
2.51.0

