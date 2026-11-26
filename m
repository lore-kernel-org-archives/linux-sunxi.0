Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677234;
	b=gW4LfSAAnRsD7ArvQF/DiEThfGeHHZJDqM5HgoWmMQahj+KXEVnMnU2fxrx8BeE8S9Ow
	 6EIB14jsqYJZug3Cqd63HBj7gNA91FO+dY1Mrnff6rjBvPIZWhSqgJYPz1wTcXyajP+RD
	 6tgdn/VO7Se8p4bvHCTn4rqAFFG7EHMCmtXU1fIa5XFcgvbRSZGfW1dNOXuNzygCaVNQr
	 fzPS2dHgCiS6upUvitcSByLQ1Tq/Ar1AppnNcwYaPBNaXLGIDTMB6uNR4nZ2OZdGs+lN+
	 EnfYk0fKbJgp3wThell8l6iSfLh4Qqig9/964D0h5tDHmF4j4VRmge6VF+HCohYFTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
	b=Ofqo+IiH0RqWb80IwA4geZDp1zgjYkZCUuPIw2YmQ5uLIxfQP6VFFuMmje909sd4/YYp
	 Ys2nli/NsHPQ0SMMYGLx+BSatDmToeVfGbbM13MtOF7vf78918EDhNxH0C2uAfV4SUEZX
	 3M2zBREk8GS0IOIGQv/yQ864xn22e5nJMhLZx6ygZrJW6XEWYssfYflIJfkqM6FhhQNDy
	 iOqCzKxbER7LVEZdKj0EYo5DPaYExWApF73ghGcxzkN4sDUWzxDDoI5gp5dBgKMqSNCvd
	 ZgMSBBx/Y6HAfZl8FZ960aN/IuwdlzuVkfM9zi74aIK4tm8mlEt6LWi43SrGybsENkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORiOu2FY;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABA606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BABA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ORiOu2FY
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f046b0adc0so38829135ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677234; x=1796282034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=ORiOu2FYE0QR/M2J5gUxb15jRVxu3xruswNbjxS8eyvcZMLTK47+BEyLALsu0or/XF
         sJkzjuM94Y6lWPlOE9h1OSHls8vSaoCUpde3r93Hhov3ujMR+by+3ZiEuVguDg8i0rTI
         Gk7kdNLj0PQPqEnwXAAE6tkZHLYs7jqptGSGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677234; x=1796282034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=fhOdp1RN4XbDHmBvVKYjzbA7FEmShOF2J4p9yxXeR9pfG9WdToFG8dbG95SDd+c/f4
         sOi/yssSOCD0V51rFnsVkrjgTF3jixBx8LpV3anpOAl1KBdkDfMV1zAqfKLXMBLrct66
         cW9gm5NkI02zRoodXlxTvP+HlQ9sRtJzxs052KQytqZbMJNKL2zAr2ht3/+dVJ3gAneB
         ZOLmqXNBBkcsZ1P29N/cTaHY/uSsK3iUI17IbQiMcJ/frSC3FKLJlLoDOuZZOp2/LMND
         Vmvdhjdgx2YBCnLczoizsRxae6ZbVeCxHaWHDrxjNCQSDDk7VedS7ck9n9VDtaHMnLvI
         vvXw==
X-Forwarded-Encrypted: i=1; AL+hErG4hMHJ9e3JVaDT+NTpumUt+A6zlMkh+bcS2zhDRJFvjcsR14D7Ki9bPby4Jlw6R3HaOIrMytcC88sN2A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8paK9iVdfWZWvAWjrJolsRu8x7cg2cbl0ehvCoGOOCUPoGTKUK
	V1CKYEhs6zgLG5NI1IdWPfL9F3YBmFouX029P3dt5buE0qaXyILM3TSa1EaoZEUcfg==
X-Gm-Gg: AZFdTZf8eip+sMoFFxpf8PR2y/u4PZxi9WimvOyC0YEXHD4dWiZAry+Iv5/FmzY9H5n
	Efzs7ubDe7TL/9tm5CWLsrPRo8/BRyLi4q9N6O5TpzCW7z6QAuDP3NlNt7hXTZKJYno+okZ3bZq
	WR8QyBh2EZ/yk8z4mqAJxlFXh64wQV4jE+Yk9CHLw/32NkFLC9aFFA1y62bWzhVDH2XpnBZs24k
	cBNc2F4mHWyXbWLbUX5+LuV/MvgI+FfJlvBha+j4THqbeAfFOpAlVwdOyBnWqnUE6e4KMuqr5Cf
	nz9owcvHJ/GmIlXWVXbXUKJvlt8u2H9/9VHGQ+KDrwzForh85n6MtABidYUGv4FsO6Su8McFaby
	Sy4hz6b8QkMuO0MGzHtxHqhIbvIRU9EJGiHK3e0dtDzxmz5qBpTiXb9wjwQ1oBEbmLPnalknk28
	w5NlP/LVdokhhi8yXdFfa1BExyWSpdEf5Fcz20Hg8uJAi1e8XJMtfl0TrBGV4OpxPE+pBiGzSWq
	YEk5xLgxtIq4KwRODdN7Rehfi6t/wgQ5hNd24S68NlqCPg1qbD/HODg9mXn8z389EJlt1ku5GbD
	sFbXxdZmKIOL525swKOSBtoFeJwlPD45IWvLcZ3TiXuHsKDvQ1YzNja9cmnf3a1nWG3Y03h/mCX
	TV3DJUg==
X-Received: by 2002:a17:902:f545:b0:2f0:585b:8d8e with SMTP id d9443c01a7336-2f0585b8e12mr169849155ad.60.1795677233916;
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f0bc695f31sm41539205ad.49.2026.11.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
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
Subject: [PATCH RFT v4 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:53 +0800
Message-ID: <20261126071314.253890-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
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
2.56.1.839.g22a8290db9-goog

