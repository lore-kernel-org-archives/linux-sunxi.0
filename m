Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049C380FEB
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773479; cv=none; b=NdjY6IVvFV8EaOwCyBC6sQ+2KUhyFFaSiSQeLzxXiczF0xFhaNtYAyMlcXYusSbsXx2vPpnKuLy5+4jTIxed6/Tu6d0jenm3stQcDhl9L87KNXC/ft9ysAGo7kle+RvcTdY3mkKwZMTchZ0dEn2ZRpDAG6eBXDir+rBg4u18NW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773479; c=relaxed/simple;
	bh=PWwlgog84rReNxIXHZ44trRlgx66npQPNSF2KxN5bIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T12uUWYEg0YtJGsazc7yvVbPLwXhVU7El2nKE/mcrGdlWaq7mJ7SWPvV+sJS+gx42CZi0xsv3crn+YBAWUN+eQ5AcDmN2f3N0Q0iaZIk0q8uv5I4O60MVn31KTG1SOI5uGFHm408ug+hZKjJrX4eZaH/Tf7CcDzgojIpmlR/52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0NxufR8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0NxufR8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso10750535e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773476; x=1786378276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7t2IG/bjYzTOtWYdkDb/FYlzP9IlRZpnBpyzw8LyRI=;
        b=s0NxufR8L5JB0aDaaNqFoJILgQ3soQDSP4FjAf7ROm0wQJHvOHum2xa5OZBiWCflH1
         1h+PzRB5pGfyf55AC7RfXQQyujTRsC6Zg8BO2XbDsT8NZW/8qpfDqL1ipS22Ff9XzXHI
         OMsp8sOv2ZKcrf43/C8vm4i8dlIY6fmDnt28IFOfX8JzUJO0VIndh6VeEW9KRybsoQrE
         bGfE7T6ZRdZqd5GQw7Di2fgslwlfPFYTPT0eWQ4AzaDgyrhtxqnkRo2nW1cV8VvDHpOw
         yf3BPAErdjhY0Vf2hxuUMeur31Eh18dYaIniW1sqqfXvfTwmgq5KJM0DjE/va5zq/Ls+
         t7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773476; x=1786378276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7t2IG/bjYzTOtWYdkDb/FYlzP9IlRZpnBpyzw8LyRI=;
        b=ACJphu82Ygvj+vStgJHhiairZa1Gskmk3i2vSsRtQWk0vM+3x+sp1yiXElyNIIyuBg
         VoyCfe2TliGbEEsowaZVxawUq2S20S53Fzg4x5U3eIdgDD+pkEMN/33/Y5Co2s6eVZ1L
         u8IMZi7BDb352nASCvU2rBiyiwIz/5za0HaUhuurMRFuiEz2Yw+S8MA7fpaAu86UyM+0
         Yg0cxAniVicrxqpC39aqpV+B2c7jNzl+TB/yv05bMDXsAN/liYEb/40+Uy0pSl9/KSGt
         PI66b8mxb8R21Nes7031w5XdlJel/65F3QnaS0Sww5DX9wYUR1zdhddtn+ua4KTWvVo+
         Dg7w==
X-Forwarded-Encrypted: i=1; AHgh+RqZV45YiQ/dV7AC4C4vFSYG4qhWBvZFF4qDOtO6bfTODrBevD54ZZKRI/PgeK5e4U91LV+KZsQDWZc8gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuLDibvv8RMhnpkaaYlJpp7o9YonvvKLeOnVjxOwupynsLEMvq
	FfoK07UsWhUixiMDwVBErlgwmQdQ+EtedCQbEdGdZsuDvwJM8IMVFHhl
X-Gm-Gg: AR+sD10r8FolG1/TIRhOuq3j2q0z7uDepWqqcyPxlcejR2bipjyLEWLN+i200EZ76HB
	NM75+hJaGl1+99JtWNh/WA0kCaHIKAbcDlUc4kITcBWTxxxQgAx2FOlNT+EcRpqtVV31Qk8fxwX
	3MPd+p8vBkABQa/pamfUa0bQw+DZIccoSY0tArY7egWv+FGFNedt5jD1WUjta25DztINk2BjNoy
	V77nZsjOG0nR+lIJU5qKwmtny782zN9Hm6xQECVUUl2oQ0QmJTxdMf+lSD8YL8t2U997z+XS6R5
	Fk/gmBh1sR3LFTJ85w7NrNsaSLXGHxs6L7Gi9AHQcdQP3Gq8h5QKnJTLZiHfGTaAjPQtqqWptAR
	L6GTPhPKjlKTjPJ82ptPV+pLsevcQCXHH80G3bcsGRHd0f7WGQtPgJzyD+6AETJ0Ugr20ukBTty
	NYQrr37Lr8ZGy46UOQfxjsL2+AfSUzSRfkRrvU6zZoA+dI7pDhW/f9hVuaQKnlIhfss1k8I59v3
	MCmhTQ9g1Uiv2CW4c3gR4aFpR8DJpmtaIlvTNBdyQHl1NLF0lkOvNdxaGgaqxydgdLN3z83sgEo
	PBFRxEd4nbhFLhFtuiyHzD+vaxjMO4I/+1zeRjEM9TYIJVmnGmSf1l7emZRvKLCLx1wUsGWS9zY
	fUC+LW3USJIqb47AA9wNHzAjrzr5ZgVrNLAyu+a+1en1Op6sRKikOska7Zpae6VJTPVakF3ng6B
	LxNw==
X-Received: by 2002:a05:600c:6d03:b0:495:7a23:1eee with SMTP id 5b1f17b1804b1-4980c674f32mr180465495e9.12.1785773475697;
        Mon, 03 Aug 2026 09:11:15 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:15 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/13] drm/sun4i: vi scaler: Fix coefficient selection
Date: Mon,  3 Aug 2026 18:10:40 +0200
Message-ID: <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, vertical coefficients are selected based on horizontal
scaling, which is wrong. Additionally, chroma coefficients should be
selected based on format subsampling.

Fix all that.

Fixes: b862a648de3b ("drm/sun4i: Add support for HW scaling to DE2")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 3dec4eeb1ba2..d4412a62c2f0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -894,20 +894,26 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 			     lan3coefftab32_left[offset + i]);
 		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
 			     lan3coefftab32_right[offset + i]);
+	}
+	offset = sun8i_vi_scaler_coef_index(vstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
+		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
+			     lan2coefftab32[offset + i]);
+
+	offset = sun8i_vi_scaler_coef_index(hstep / format->hsub) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
 		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
 			     ch_left[offset + i]);
 		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
 			     ch_right[offset + i]);
 	}
-
-	offset = sun8i_vi_scaler_coef_index(hstep) *
+	offset = sun8i_vi_scaler_coef_index(vstep / format->vsub) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
-			     lan2coefftab32[offset + i]);
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
 		regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
 			     cy[offset + i]);
-	}
 }
 
 void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
-- 
2.43.0

