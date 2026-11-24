Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506083;
	b=GM5NnApfyXOA8EelWnyreYb+N5RjyUc1Eglp9DWNL4bqky+NgAuCyhx4LAFueh2TT6e1
	 nx3+jNZmU1jeHfcK0+aQ4Z34MCWl9mUkipieFjHUV+v4MXlXJPVhQ1drdXs14HdPMjeUX
	 Ebtq7ahcEufvV+otSgYGZYO+pULNx4rGzLUuibr2ncD41RGV5FgpF4upqvstpgeixeILs
	 nwFdaY8hvPGKTtSWF/5Us7FMCZyJ5TlDXoi9T2Rmr2gcrU7ifmCD4+Ywct0JpdOuQ6DBw
	 iEwIvqZ0Zp5awjjK1icqf0oCsDfHi6WG1Ttl5L6mnxDLOu3WW5/DR9M3febgOx0lcZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
	b=GH733PLdGHjWGQWL260nVNIgJUQug+oIKcq4YZbedv89nc3bnLJTNqKuqxwPBbz4PUNG
	 +Me4jq/LHES6waXn3Uz05yY4RO8b5pI0kfJgMbxMgNw5KMM7mAq+880rp5kJjEp6/jdDH
	 euIe/7ELd+leHX50DC0xMD1qZuznNgyfwx9BpFmQ+jJxjDhB+hOaIvlknRv7EdbUazLbx
	 +XlDIsyqTROifK1G1kj81cWGs4V1SXriYPEBJy7sQSsJfyq7eE8Dtfcp3nJrZtawMsIaw
	 aaABIKXItfNZkwtMxsiRkffD2KyZksd9ih8RBBHb7UzcnA0WcFi53XzqgfKdkbJ1EqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jnktmeSg;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFA606A31E
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AFA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jnktmeSg
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efe591a1f6so13908935ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506082; x=1796110882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=jnktmeSgP8Lepkc25/UXTZtHvBVCSuOYrinf7LBLYQXwyKa/h7vO6O7iINcoOVA/pT
         6lwtCneshaaR1a+jm1NQrtXHgzJtPbOm6Mb7mQi/XuyNJnHoIs9/wy/pUWaZqDS0Q6vD
         RTUW3K3GdM1U3h53x1dtxUopfJEA6JUZNh33M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506082; x=1796110882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=B+i0DBpawewz2odQHAb9xsWFr80UOyW7W3Svb0fzVinR4ora/13ifhvEPrYNcjfoIT
         DmFpWIjfI0r2csVvsPWhxDyvNsAv+T7Teg0p0KAvtyvQ5jIAaTJsjjZkeaRyA5FSFDkS
         jNglbYqTWwLr17WTDdcpOq7FkHud1IRBwWrzcAbFFABshgolVH8d5imrIVzIyXXC82bV
         L06OXSltGWHyd6FU2uJ9eT14DzGpkkDYh7Wf7FyRtFbIXdZSUJBhU09laI2LTy+9Udal
         Vq+otM39zSrJWWbMOci0r+w0nQk4fS6KLVpWpG1pifM4Su2rw3yAyIlTQH7XvUTnps0d
         u4Jw==
X-Forwarded-Encrypted: i=1; AL+hErE60lmsMGSKGTV7sQVuizmKeMDtmcaTNOUYo9NQyOBYQyrcEifXrLHJHbQeemkWQiPgCaXw3bmQOn0KaA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Wc2Z0AvxbXniYJ+n6m8heB4b+zazS4FRctjIlUeolGJyACddc
	V5J3PoVbjH9YyKaQOMVsyBoHGSA8meIAzz/6lMWBFVeur0jJJDuQD6ElSsGWgLEt7Q==
X-Gm-Gg: AZFdTZdRHdQLIM1Dp03JFDMT1if1/Kb9EYagp3FGeppXiPBchgtCn7HYHjepqlj1AcU
	ftWZ/I5UbPFfpddUYKtv6Ms0bzWBv8pMJ+lgJnZRxxSIfVmHZvZqojxfGC/UzT6aKbpiFypRbZd
	xAqRWvNP7izUodIn8qxHB0kw97zIQT/nAorn07Zql5Mkt+OW+XxqztNaVrblNr0akLg+dPFRPM2
	WonVDbmONFzugIoREt8sAUhtdYQL+kFE9pxCAW6m057yMPXkoi2w3xP2/Q4Q3Ln+wWKjtIgKskS
	jtfaxVfyZ/WR96lFQpuUF8sQiONDgPXqgVdOKaau4BaHwDjHOVQwFBlq20e05i+FvpmhDS888Lt
	Rd8cD3a0ufHOFJRwTcCLRHBAEtuMd75QGm/LgmCo67W8zKpjJ7+EbgroXomhrGZ83tKYf+o6/s/
	sCqPYiKmpjL0WCWxkOYXlkLVRzH44DWTInXCPs36IqOTKbvT+qHLQjIKqqzP30rBg6CM8ppGox6
	2Y858dgBJk25nJov/RlA9jn9XYba/z6ivv4NKtM+V/w9TvXGbl/znx3PmXtmiikRQbfeImwA4AY
	NBhIbOBo8w9LC7UZRIdyWz2hYxUkfGuyjsNnL9/6ghPXG/FIxOn4wDfTbK+G
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr127037815ad.40.1795506082519;
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120830sm64742695ad.61.2026.11.23.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
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
Subject: [PATCH RFT v3 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:33 +0800
Message-ID: <20261124074041.115251-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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
2.56.1.809.ga0b61035b5-goog

