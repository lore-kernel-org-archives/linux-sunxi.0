Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FC4F30D3
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858496; cv=none; b=Pm/Gwkf3DXd9k45plmYtXzgk+eXqvEPsEZqn6Sz6KPv+thCJQc/t4pyu+XUnJ9jBclZgkrfKw7cdpAwFq0tgi14D4vuydNv4i1YmAJqk9Z3Kwl6sZJkXp/ObImSqJ/CTXF9lZmyo8+/Pe2l5dIVgxi7lBFT9WrKm1c1BzXY/ljM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858496; c=relaxed/simple;
	bh=qJDTSQf3mOWj1wTBmShDO4bnN0jyzbEKQlcjgoU7YP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+5IMaiUxYaFn0voD9ofKpms6KNE2rzC0rtH+ZeVjozbQwL8wH/bBfVGimxqvK/NDpelp9qwFHNO/PJTBPa1gwk3lbdNsdf7FM7jZip1QAJ2+wzJpLrxBv02OTH2Y3S4XSM27/aq2dHb2CKJ4PlBaWFXHZVrVDKxDZE/7NeyoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S678CECK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S678CECK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5015005a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858494; x=1789463294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=S678CECKn6ux/Wupl9Kj9K4SaCTjSzZPC/8GM3oiUxlfonoj9oBwTPleb5vMzhEj3o
         qrrnwWOu9cuxnSZQofbbB+5BDyDoZPzP/DGfzUoB39QUTc2KRifvYE45afJ6FYoXrMrE
         gunFPQU34LPljz+0wGCvDjofl6r+XzTuObWOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858494; x=1789463294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=F5Ind4WuRKjWNPDUU2rIDGqxkq2UZb5iG++khGk1li4qs+9B5q5IzPCFS13whB88aO
         PnIFzcX4RNXMSvWfBVNn5+FPTybCE7QLi532sA5Ae+NMvenZkr8seLAoJYpeHYSc4U9a
         +1Pn1rswMUZYM/Qwi2rOZr8SGrseqqyBXeAhH3XtVmmCRf5Y6HWZkZTUKPvGSM+PytXz
         Q5Oi/40cl6LdzUBggHpmiCCCG69tOUThO/XJnXnqOz/pFliitdDf5f2UOI6k0KhM5kX0
         WCq0/tUmDGWHgrOXUWkMS8tYw8yhJkKozLjJoWSdiNAXiQLprbh0whzen1XLAyukHfRj
         zYBA==
X-Forwarded-Encrypted: i=1; AKwUvBwvry1v72yktUMh1LSXR+xuuEoQx/q+5zzri3W8l0iGbj/ydzSxDOxZQ7UcTzpQVfALzyaPJqPSGcN6AA==@lists.linux.dev
X-Gm-Message-State: AFuF++nMdlSh7NaerW5eLgvVnxeikLrxVyF1H9xF1tu9f25zPEvHTtD1
	g9ebMFzOxGXfcyk7jYNJKICF436WPNcYpcoLWnPfOnIvCG3+C1+6nACNhuaRHt3eeA==
X-Gm-Gg: AYBFou3wmTNApI2FxjvWklqH5fBhT/ClwWC7wavnn+LJVVE6Bwrfh1GhVN0jSdATMG+
	oX+bzRvPsHoYWEhVjfGLM9HFTQbMqAx6z1qs4gRhCGoCtmcWvmXr3j2a23DjRFdxTZjmz+wKDr1
	0ruYzoSKh9IXC5+LoOOoXksFqzaCE41X/kUCl4Er95QgOBJ2Z4TY0xtLyeHa6vLxzM1upE3vWc+
	98AbO1gkJeY3gbAgdARJG9yPntFB4MBJLunqFjMIZOFoQg6Ui70a3AucA65ExSMfZRef2SoCRhT
	gD9YHYH2Ru7KC3CH4/KUtLlJ3PdhLBYHPn78ZZAElY5cpzf14eJJZzGgT2EXFqBtIWNKntyT7MS
	DhQAvuP/ZARYtwPRaN7BPR4L3tqSU+D70JF+uR0Jqe/+LgVSNwVbIP3sU0iJ3pLn+2P/BDx0cM0
	MdoLCgD5F9OrxwyDGQ5VQaOYa37cGIRRhIGhwOixV0HXiXq+rvfAQ3AvXrT5Djjo5BEHIazQyen
	FQimZJMnVx2oNSIUMdf0Plc1nz9kFI26fF0g8SI6FhpME0=
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr47890193a91.24.1788858493952;
        Tue, 08 Sep 2026 02:08:13 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:11 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:43 +0800
Message-ID: <20260908090745.1089143-5-wenst@chromium.org>
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
2.55.0.979.g7e5102b832-goog

