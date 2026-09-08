Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881950EBEE
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858485; cv=none; b=DNxD7vxmoBMpB6XTE6eSP/aq4EhBUv7h9d3joqK81A85t+FKLT68wn7TgvtanuIEmY3bmPVpaPbxk0IBBB/0Av7OuIxxNuhPRfOYKz5MQWp7TgUXbY9WpXGI/HuE0HSNwfOw4xl8wyqOl664QIQexKGmriyBa78QqmdDxITtrNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858485; c=relaxed/simple;
	bh=w0FP0wBCIa+/EHsZH1IzuHconhrkS9VP6UooovR5/Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9eka15ixEFIFBN92mwHXkvhU8NoxGlqQ3z1my/NewkrPJMRzZ9sUiyS5eTXD6YWfPym70n5RMMz0paKjgFFUJLNWWYV97VffgBmhvubTMvYpMBxaBIELsjpsiqyKWUeJgKEmDgekDIfSKg4x07+fjSJDZ6Me5vUi8Fn+MJHgRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ofZ9V/R8; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofZ9V/R8"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso313672a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858483; x=1789463283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nbiAaHsEOkyMIOSUPLzzSXJU25j/HCglaTjq/uSdS0=;
        b=ofZ9V/R8wPI6nE5U1LUNJ9PdGyyvq/pg21Hs2BleXJfr5SrhSkdyQ3BGkZjfuL90pW
         rGZgWl7ExkCSmihUL+bQDmdtHEN31eXoD2rJfqZwDSt2C8Mtgmjary6crXErBEIN2BFG
         FQcooDBbyYq5rLXp7e8MCTaHGZ4Z1n5OaILlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858483; x=1789463283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nbiAaHsEOkyMIOSUPLzzSXJU25j/HCglaTjq/uSdS0=;
        b=USbn+EbskkVKD9IamUul6wp0lPQrGQr2cXSVJcJvak5hYDOQD8WNa6SR7VNQeAnomh
         DwrmshXbrrehDv1Sgys/M6FYEXqgpy1wuVp7ROnvE/2kEd2SY1MO3KDUB+HDzoxk9ffS
         CVpodSKNNQ8ZHsZ8xVBYll0A/pv9QNctQS4BfnqK6erTgoiaMVgKL5M81T6feXVCLsk0
         r+vSAI47EvAEXQg9x0W38YINU9Ul0EcTTsjIm7DHjyHwL662JqteYvIeN98y/xTEh1/u
         gLK5vYefmvM2dfZV5+LP6/Igyl4e8E1XwwHBOxrrcfwdiFg+RdtCWgi7Asw96hsw5hYl
         C86g==
X-Forwarded-Encrypted: i=1; AKwUvByNZntxC4ZTRnyFhHpJaqKz/S7/SWslbuCqhHV/+THZGr7W174x3qFnvgYZwwmrYO5PEHyr/yNaddVklA==@lists.linux.dev
X-Gm-Message-State: AFuF++neH288jubfheq3aTyAXloSp4jTUq9pkc0DcJ11H6zWpzhYxAr5
	/6ptqVGQmsbJDXfwIrq98BBULFK2J4a/L5e5MaS12bz+7AXN9AEMiSpvWPG/rZPapQ==
X-Gm-Gg: AYBFou3jOTV8ta8RX7b+odiM7ZsOUIpSHLatQKIlhMELodm9BwvxcVZ3hx39gGbQG1D
	jXly8l3wiCk2UukKBrLqH19fRVt+NPqmNJZLWREM+FpRVSwUDZZWzkzTb1YbhVVfhPEZyHDJ421
	qDwu0LlgBr+JpPp41WWWAyfns47PNts7sMyOIjoBf2McDSnJMDRvTmYCRy2ECk+5iwKusyDqvNk
	wifmarpy4qc13kl1bC/o32Zto+TZirBMCvGQW30bOS2NP9NPstfpxMZRslvsSO7FSMe3/c/tFnS
	GIrMVIjLuH6ylnXxYgObMqAHUn5aadY9jOBT3bmreh6Y/HXrSUoPgg/DM+/eGSlugLgR4/BMnYc
	N9n5/vqoU46vk7E+z2QR/e2mfoxf0WyilDWpF3fJzgqi2fW2MNNZTAFY87s/opJk/KYzNHPy2vW
	Ab5RyQfoY7aK+Opl9ATVIOCM5iug6FwWRD/Da0pBwYEt6J7tmX0NJdP+mKSu1X8pC579LnDPKdF
	oIjYwBi6S240qkfIgTPWxzrqYLPi8Z8KIadd8jFNOZibt0=
X-Received: by 2002:a17:90a:d010:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39b8be7a13dmr4691886a91.10.1788858483369;
        Tue, 08 Sep 2026 02:08:03 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Tue,  8 Sep 2026 17:07:41 +0800
Message-ID: <20260908090745.1089143-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index bad102134726..530efae7e13c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2e9cda45c04e..7a1d5f1db037 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.55.0.979.g7e5102b832-goog

