Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E72F39BF
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297029; cv=none; b=f3ndU/Eacz/Z7jZ+bWn4WJmwmAxtjorj6ZpT0kIW+Ypw4a4BOvQVoZNAj3OEVJV+ZAHN+yfJgl58efJltQxtGEJumkmnKnuy4FDvLpdnfyhSjbNnkbhSyjRnwlwby3RGtR/ush6Fzwn/0YlduDI7DaECyi+rVuc0va+jPSJ+sB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297029; c=relaxed/simple;
	bh=NerHgxbZbmjyVYRLnhATBgZKX10HzgN5zpQm6t10Mcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t05dBV4vXLhfs0Sqh6CJHaOddxanulXo/koAwrOVV2d+ukTViLEwaPYE64vdsUKmKPhpnOqQWtg1G4VKMm8cIrk81HfKPWkdggyjZLmD4PRMgBGyqthhjBdB/wmmisYXzOfEx2wBw5o4zMgJjXCjx4CUeG8I6Q2KLbCx4+bZG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFp+HdZ+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFp+HdZ+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4aed12cea3so575816566b.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297025; x=1760901825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
        b=CFp+HdZ+Kp+eOsYm76UMeMpuPqJFrniLDTPrlnEK8adQyutCZofZbosUawDAo35axa
         V+yBrGG14wZcNZUay72RenDtFw/E5tdznlKaGu8v/1EvZLheb70oihzVvQmR6S4ep479
         ssx8Swg159VoHbDuTu1mjd6sODZFVInbqAsNrGOFOPH8ohtwYg7y2JAa8G5rfvKK2BnQ
         dyo/E/mQz0kyJKgfW+JCxJei88ADap4TO4K8YNlzlOfJ82elJ6VLLO7aGbTTZQ5VvN89
         l592pyR/ic0wTe6QWOJmtoOaZ+KqLZs8FkftGAfocSsflA8r1/vjl0wgcESB9tw+sfJl
         zeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297025; x=1760901825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnlOJ2n+kaG3xIG2KBBQJX6KsaJhFDRkiLuLt3jD0qw=;
        b=dxkYrR9fxYrhL7WHgp0ORDTFEo3ZoVj8RCYg1PuzGakMq/kxjNgimlm75cG8Tm227J
         Zuo07FqrSkXSrf1TCcoaEx7r3NRkxra2KRe7ovC8ju6mgj+71EvjOXtoAoA6xE5slU3D
         mHg1/IRcdk2MgQLo/QglNW4CW48f+rARktWVXs9XDF6dIAUJT/cUFWFUxxR0fLv1AiCh
         1K+azntiG6znhs2Rv25j3L15tR+JrKmMWUa/BLTEvfvrsNAXoSxW5eAagtg6dIrzpxv6
         bzA7mVuRsERIbBPidEhisK4dHpHayMaPBgdrsDWKt2lBJ/p7/N43ajDHZagfdHlM9Eas
         VvYg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FMzuxyulAF82+AdzEpZjWesplY8oMBwoggEw3lCMvneinZNfmcPJ/0H+4LiSuQ3GBEdpEjj43whTWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjguv1a55/CRW/JWdHDoVHWT73CYOoApwMJNBebauYP5c7KTHz
	Ak5q257KMUxLdWWdkxxwz1vpyav9O3IN7wQahfnDhz/VFsBZ5cmAeet4
X-Gm-Gg: ASbGnct4cDvlOgxUQUvYY3WkSMNBfeXSsz6eGExwnnyXkTeNLdt4+/3XJ12eo1y+CWz
	iEBNrpKUcCiMNsXDOJA3sLmxxK5yyWSM7KW3k5YJwd5AF/5TereSS2SLbQb47cM+KoMOTyD3D3+
	xSFe8GuC/meHbIYtDR95Up/vGiF9yMi+GMY8jfrvcNZ4q33Q9HFgkE27byz9iAH69rsQI+cuv/d
	Augqu+5JR9jhwan8kvt/P7jQ3Ud4QovVTy/xhdcqdVHsq4wr2A9AHngyia/rV2t9mfYo0K07ykX
	fXcnll1uIHJlGN3NcoJpfQTAT9hJeps4S8NCu/SpvM2xZIno89uPfXn3iWtEob39udYz4P1ANxb
	D5FBhe++gnHK/o+7BFSsnOqliF1jw5nS+ZI/FhovDE11zeU2I1sz8Fd4oZPP+W6bjWJedXhaTwn
	UpY757bvV7IeKFfFbGNzKy
X-Google-Smtp-Source: AGHT+IFJXFSppj2HoIPfT0DNF82Abv4mtxDvrxkAHw6b76kGPg7cFa3ESgHvRApJqFhlZJceziWZkw==
X-Received: by 2002:a17:906:c149:b0:b45:60ad:daf1 with SMTP id a640c23a62f3a-b50aa8a92e3mr1797895266b.22.1760297025416;
        Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:45 -0700 (PDT)
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
Subject: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to check callback
Date: Sun, 12 Oct 2025 21:23:05 +0200
Message-ID: <20251012192330.6903-6-jernej.skrabec@gmail.com>
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

DRM requires that all check are done in atomic_check callback. Move
one check from atomic_commit to atomic_update callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bd6c7915bbc4..c80bdece5ffc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-	if (ret) {
-		DRM_DEBUG_DRIVER("Invalid format\n");
-		return ret;
-	}
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
 	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
@@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	int min_scale, max_scale;
+	const struct drm_format_info *fmt;
+	int min_scale, max_scale, ret;
+	u32 hw_fmt;
 
 	if (!crtc)
 		return 0;
@@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	fmt = new_plane_state->fb->format;
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
+		DRM_DEBUG_DRIVER("Invalid plane format\n");
+		return ret;
+	}
+
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-- 
2.51.0

