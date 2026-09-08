Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0069503BF9
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858482; cv=none; b=s2kj0j+9FU/bcTYUznvZtlDyBVyihC3yigesEqKw6RJ4W3x0xra3pzJcMJ12GQOa8UZNOWPROG9IX6R2WPr+Za8jezxeAh6y9+xh8WLp2KeFlUM/LEJPY6xcOytJoWcbMx81uHQlS5JAdp3MFU8dfrTu2Mb9eYeC8SuiZb0Or3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858482; c=relaxed/simple;
	bh=h38nWmHGokmgNrF8M7H1ZEOsIaWfmOwXRv9fJbwDAq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpmDx7xkpDucymjnBJL2trMuCJXQKuL+n31zu9eqZexvQS4k0x3hZ5WBsLclyU3j5otFzbdZJppHQ8zFfxTiY4C2udg/XcoNG+ZHwLpJNX/uWPuMZMAgJbUuHo+KJLrqMg09dVqb+udg/deZ+uovUwliLA4RnqswbujZJKU5vSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MY7DjU7g; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MY7DjU7g"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d5cad1a6baso37980635ad.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858479; x=1789463279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=MY7DjU7gmhOLPAHoxlYGH6XO4kyy35SpqKt90h8EibI6dKw349CSyL/0b9iCXRHOC3
         enlTu676BrZp0Vcpb8zxBW7s2/CXMyy7SkQL4N04zR8H4F6hh1xng6oeXCbmX61hmswQ
         Q2t4LJge4iTir6c/msa9lSi2yr7QFsExIL58w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858479; x=1789463279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=htcWMQzzIdN2OMq/lgGMWw6WmNo5HAqJQi0+KH0X9Sk=;
        b=KZ1Le1ql3DBfjggBZHptjY4hTMkSuCG73t5cbdhNxLIelGK8MD3NZj6xMtxYWBbVUW
         vO3YikOlno/cMOzMfy4dp4Lqy2K2NKYufq71GZeM5SMkD17UQzY2Lj1fzPmc2KYd3cyp
         yVX98IPXr6hEQluxAmImE2qO/OC13j9w+FAMWyUskXBlMFdZiI12519xlhw9wJDb8Pa9
         AYeRSH3TWiDCUNSxOR3777D3AJFaumhvwBSCiIvrzCxeu4MyEJf/aw5v5zJhNEan/l9t
         P2BC2uZCcl6stnwZ50bnV7WWzWsEvZgm0k0DIIztrU3VR1hUAZ0CjEcDhCSIAkCdEeD7
         /ppg==
X-Forwarded-Encrypted: i=1; AKwUvBzZyGwuNNm1wSncDPy/Xfxr4W4Wc/M64Vqip+DXhHkT1RM9WLRg57BX/GCGQDzx5GnMsNefJkIThaTpmw==@lists.linux.dev
X-Gm-Message-State: AFuF++kj3humbooCLuuxxfq508FgcM3Ud7O97Gu7McyLBElrorldy1eE
	hBIc7xSV1wVsUskr8XOvu+qrB5ZJ1L/O7JGpkxa9zvwV4gOK1ALK8xCJLyPi71DOuQ==
X-Gm-Gg: AYBFou1f+lPVr1g7n1PsliCsjAOyAgD+I42k22XwOBpbeo750x+I2HDNJB9PpwHlnPi
	/pnMwnK+GBAGVjVxbKqyKqibrBOTMexhr3dGV5ybiZKMCKyEC4tX+F5lbozxTsg49GfdTmOEJOa
	Zpa89dTannJS8lWfEb4pB1bBvSsQonvZE8HXG5nby8m3AiSYB8dSl7ovANRtpyJGLemC/PNMg/s
	QGyBwT4C3OW8bH6zDv9Zzh7fCETVx9TI/gMWOeoBcVKoOzbq61NB8bh85agnGCfNsQLik0gbwJU
	easjbqY2UiK7+H8y7BjePWwlZoTWSBB3xr21yeeeeGTGwRBhO36VCRHCPpZEUqN7mGZyWBgHtIy
	tGeAUfKcRIOCH+4Ukqli1fwg0Jxwdq8d03ntexam663kTBIAMaT0KAnLFsk4xxu8Yi+mv4f2Z44
	AuRcgbRc2gbsBrKomlEiCIyNaD2Ce1h+aMywNmC+H/R0a/uB9QlcDLP+GUCFWk7leOTyNCvr6nT
	8Cvp7YNS0Io5qj2Y2unYZufFMatG1bBWObGXdi5OSBUBUA=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr47233218a91.16.1788858479259;
        Tue, 08 Sep 2026 02:07:59 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:58 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:40 +0800
Message-ID: <20260908090745.1089143-2-wenst@chromium.org>
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 63 +++++++++++++++++++++--------
 include/drm/drm_fb_dma_helper.h     |  4 ++
 2 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..a260e7cd5667 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -59,20 +59,10 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
-/**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
- * @fb: The framebuffer
- * @state: Which state of drm plane
- * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
- *
- * This function will usually be called from the PLANE callback functions.
- */
-dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
-				   struct drm_plane_state *state,
-				   unsigned int plane)
+static dma_addr_t _drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+					   unsigned int plane,
+					   unsigned int x,
+					   unsigned int y)
 {
 	struct drm_gem_dma_object *obj;
 	dma_addr_t dma_addr;
@@ -96,8 +86,8 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 		v_div = fb->format->vsub;
 	}
 
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
+	sample_x = x / h_div;
+	sample_y = y / v_div;
 	block_start_y = (sample_y / block_h) * block_h;
 	num_hblocks = sample_x / block_w;
 
@@ -106,8 +96,49 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 
 	return dma_addr;
 }
+
+/**
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
+				   struct drm_plane_state *state,
+				   unsigned int plane)
+{
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src_x >> 16,
+					state->src_y >> 16);
+}
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipped
+ * framebuffer, for pixel formats where values are grouped in blocks this
+ * will get you the beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, clipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	return _drm_fb_dma_get_gem_addr(fb, plane, state->src.x1 >> 16,
+					state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.55.0.979.g7e5102b832-goog

