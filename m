Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C56343D69
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Nov 2025 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279823; cv=none; b=pnpJSnRRcsg/ZZhR9ezqM1Qh47fH++XIRGwHxN9dcpi+lZwXuDRmwMJahZEFSB/KQFkmsRpg/wX7RHw3qaCoh0ZTSQsAfSL2Cj+LSheX4vVbTbBec6JNZqPXz/dF6rh33OJxAmG1s04OoXkbO/wrEOkxtZ1pW+8yLQXhq0/0nf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279823; c=relaxed/simple;
	bh=aukqhPkb3SXDec5/cqcnl9bh4tAlZZ6WtRNZI9Bwr+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+IzF4Enup65krN5GRhw0y2n+zLyOGH5AreQYiemGdpn2srS81DemI0exTNfUemU1mVZv95k5dB+5CdWEOUt1dwzWIHSczYdyo+K/UY+a1KEqoXuYXM+TrcT7S1eYtFXB6dX5miW2/OdcPy5G/RQ7YN9t6TFjodqufaQwHIICU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiLg4g2p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiLg4g2p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47117f92e32so47878875e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Nov 2025 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279820; x=1762884620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
        b=DiLg4g2pI2XwJeqYbTmm4KmUcBJBiSydNp+uJWNLetra743Hj7ffaK4V9AnOd1FzGo
         hySCitrseiRDLOQzt/vw0eqeXDIM6jJvPhQXtfg2trhccK93E3GxC8xxCnJAju+40YzY
         McuMQfGTvZSap+D7CZKi/eL1E5TA5bp7b7gBaIz6/a4wRwEpiSwvST/uWygAsSjEHZVu
         hfqiXr7IQXNK71a2PCgWNQCDCLfABYluii9QWGsZyfBh5ZZOZh9+aONFX+U9SaEs0RSx
         tVkL/jVvLlDXt2R3xKs5rbNKxSlEqw4TJRjoiqqETWu7QTYCJ9r34YmJKdg3J9mOVRW1
         U3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279820; x=1762884620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
        b=IY9j8impDRiWowcm8xjw0iebEEb5rz9FUfQccLdtdfQXj9mbMFzEXMPFzCn4QHXd5o
         A7cSHp8hNja+nqaXn8ZZ1wZt4XLv+bj+xbVd/25jeO6XaU2bwdS08INopGOp80ODrqkL
         bNdCobgGRbLBFZLR5HDIOKvz1//q2K4gIHyWI12xtDQtGRnRW3PYnBE1Srw5McY9es0h
         d5ksiQip1mqBsMKv+hYn5vA7HmE6ObI2u9r9EM+vZh/gt30LV/zVITks6vhzqhyFqj4b
         uwoqkMkh60kiNryIt6YdeWYU1w+NuPbZQXw8aGgAIZ0WyRQ4Zmlr2ZSR+V6w4H+LgcTe
         uEHw==
X-Forwarded-Encrypted: i=1; AJvYcCW73QL0hDKFUBums+nJvi+zUeLZuo4eG/O/gJEm9/LIltD/3dEDCE7AebSXNghiLUhk4wZIjz556VMq4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIKvs/ZaUFI8ETvl+u4RkjfQUm2E64TnlRR2ixdEt0WRy5G1Yp
	oEnO7Xu7/ecPQbD9rzI19Z7bXSkc0vCgLJTl80jPFNrWo5VZgrQSMXRR
X-Gm-Gg: ASbGncs7aFTwfLq1KtmNm0dM9LbK6RP6HbiQoRsNaxlYOgRRQESjis3JVfH6XARrYMr
	0wzcmISm96LcoIES3Zi7GLZMxdkTzJ5a6NWo7aQNRc8jm5w4tIEuPtXpkBUicbi5wvWFODSZlXs
	ZxpAhzqG0dxVLnY3yo9VSpvst6eNo9LUf7mPkFAwW5GWOCpzRqIGE3EGOb4eF7kJ/5lEvazHS2v
	n2JXq3PObmQ6LGKaS00ayWQUiuj8KeVIPvkoIdgJfJzCkmqooKFWCVVkygEASLiTa98Ykb79Xzv
	FRBtR4C/kOMuoITMrZOAM9mPIL0mAPnM5b/SXNM4qps45c8Q1o+gqUXKrHwXqRgtHgrCoffLzyv
	FQjRHSFGxTnRzBdTJfj+dMkNyf8XfcGzMwSMmVdmtNoojMawjU5/jdEqUJLWMHhd9va2GR/muL4
	z0xfPtVZy9vSNbjDiRBg==
X-Google-Smtp-Source: AGHT+IE0VNeGup3E339ZS9R9hdH9raL7VWlmheMAS7dvWwXActLDGmTaSE0UPI06AOF5H0yvEXihPQ==
X-Received: by 2002:a05:600c:a0d:b0:477:1622:7f78 with SMTP id 5b1f17b1804b1-4775ce24859mr2137695e9.40.1762279819619;
        Tue, 04 Nov 2025 10:10:19 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:19 -0800 (PST)
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
Subject: [PATCH v2 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Tue,  4 Nov 2025 19:09:26 +0100
Message-ID: <20251104180942.61538-15-jernej.skrabec@gmail.com>
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

In the pursuit of making UI/VI layer code independent of DE version,
change meaning of UI index to index of the plane within mixer. DE33 can
split amount of VI and UI planes between multiple mixer in whatever way
it deems acceptable, so simple calculation VI num + UI index won't be
meaningful anymore.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index e7a66d9b622a..17c0ab5860b5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -343,6 +343,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	}
 
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
+		unsigned int index = mixer->cfg->vi_num + i;
 		struct sun8i_layer *layer;
 
 		if (i == 0)
@@ -350,14 +351,14 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
 		}
 
-		planes[mixer->cfg->vi_num + i] = &layer->plane;
+		planes[index] = &layer->plane;
 	}
 
 	return planes;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8d74eddaa294..4f6c8b0acba6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -270,7 +270,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    int index)
 {
-	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
 	int ret;
@@ -281,7 +280,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
+	layer->channel = index;
 	layer->overlay = 0;
 
 	/* possible crtcs are set later */
@@ -303,7 +302,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_plane_create_zpos_property(&layer->plane, channel,
+	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add zpos property\n");
-- 
2.51.2

