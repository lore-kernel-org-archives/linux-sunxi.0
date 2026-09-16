Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944F3B0AC7
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529639; cv=none; b=CHesiM6i8hw7iKmA3DLaIRc3XsyakSQz65LUdlqtnyi2hNEWBJPU5fJyKVCIRzra3RD9A9RR/8RyT/UCFh0yGyO1R0RrYHW2RUjbtJ3tfbulZitnaiQG8ESuEusdzw8w1RSpb2BbN27/25ork2elLS1Uj0Wv5UlavcO/IAAKpvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529639; c=relaxed/simple;
	bh=XSW9igf1s/bJdUF9oLEzsVWFCgbqu1FOjjmLMSk9d1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdOy9AyLPEXqrgvdUr+94RAenZnI9UIRdBIKNwnCsbU0VcFhZ49oM3TjCm4NixkO3Zf7ny2yw9PtRJiIaF5yqIMrCOVVBzHrwi3henQwHTefYBkNOFG4ob0K9a+jod2TQhFqN3EPJ12Q2Fe60ebYfO+5rtI6e/0VwlYFFkByExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V9Zvvjh9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V9Zvvjh9"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so5082155ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529637; x=1790134437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=V9Zvvjh9w6oy9SX6bD7o9BKCCQAYYxQkgw4k2ElE25OiDYLFcUYJS1mu3zFfeNaV4r
         5K75q68jVIed/ynxAGBk2AL2cL5U4a9sfnkjmSIcIfOK5QFPamLwe7EvaJDrwyk7l0ZB
         WsMln0OBS6psoJ3GO+Hv487+rH4VSnJS0UmG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529637; x=1790134437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBFRPVKNIBD0KQtZ9pcxiREtmRb8PGXwbQL+UCfrWrI=;
        b=jqER/obe8WGrQ/kIb1OBSjB3IZ00U9TVGHt/8W+EQtacxZefVJeBFj+E5pjorw2CpN
         TR+xrmg8vJZwb5gDlAyM1Ki9g0TyW/e+nIYkaQH32VNZCZPhuej7pwxtPvZZpLhb1kkb
         rNTxcavSheh3hRA+onQC2Ak0JxmGRH9VXSGungYASRmKm/qPu/ivqR6lC4OS/vtlR0qF
         6aSviqPiRxWpYHZVptqFeVp9+dyzEaDe/ZUKY4wGsyLO0Wj0R2tKjETzKc2pxEi7g0Rx
         9zCSz4j2+fPnQ50fMGVEDQA3cI1+MInADeUaHGB4mpcApjDbGoEX6ElpLFUT+myTWLJJ
         aZrw==
X-Forwarded-Encrypted: i=1; AKwUvByVP1T716Z/bQpQkwfUWjE4TXaByh3RInot1bcHmCkEpIPAHskiJRAzRt0xp7xyGBcVR6l2ItkAAj/Q8g==@lists.linux.dev
X-Gm-Message-State: AFuF++n2vDb/Bn4cvA/NNX6WIeUzCvJYVBO2gBgSvzGK5K5TrNNO0c/I
	mk6N5oHEBhPkl/OfFVtTa+IzqvSPyAkPOGp7QqBuGJ6xirNYkAoF2ibFDy0cDZjcYw==
X-Gm-Gg: AYBFou3UUmMa3YSSpXVSU9MQk17IemzmUNENgKWoYI6MKnKekNv1VPas+iS4C/+rTMR
	ZcfyQpWYXr5QHd51v7oRsneS4w4cljAgLsrZKnwkNzrIqJHJOiHeVMSi0q+ysuN7EYEk7KOla17
	SvAkFepyj36NZh4fOwP9z88NDaOoo6H9KbqEAVKZ0gAsyify1PDBjBvIcDHL+qRyfvIlzUH8a/B
	i2kNny4BS5xUJa+QavKdwtO+b0ycoDhBvSoI8oucGcewOZaxdHSWomRrEmGr01i+TmE3BXuWUGW
	2AaEgpGU1tkIKQKz8DsBJgVfN6/tMB3hPqBwespIVV9nO6NkjCyQ7PmWqsY5KSxlP6KK14F3Q0e
	46zQHjh7hXr5Hzeb46OLR11rb1epkP47YDVtwD+Sphkvd0h7MtmrBK4v4pSf7apvPcfxfQWYbdZ
	aLWP+GOPZ9dWg1yf6RaZRobc8qmcA830tigHyJapQj+Fs/fEhr2ZrDQbFxsisfJCVl/R50JBSow
	j4SIspRUD0l/9q6rU3piADKCj8SnKwaeCs6ZNTDVZpElPhAk+GWLtrkYg==
X-Received: by 2002:a17:90b:4c49:b0:39d:fd60:caba with SMTP id 98e67ed59e1d1-39e1e485dddmr2368694a91.14.1789529637188;
        Tue, 15 Sep 2026 20:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:26 +0800
Message-ID: <20260916033327.3054126-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.55.0.1032.g73a4cd73de-goog

