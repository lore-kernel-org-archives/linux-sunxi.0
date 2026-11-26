Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677217;
	b=fASJd3WiPFwlfNsiYO+D8MBnwBpmmB/XlRZBGL+HGD+4pwqq3AHTSMaRW3FfbQYTSBgl
	 tIiVCPy2atsZAtpJEo30yRIUmVSp3NCywvM0+Dy9Biswqjq185Buxn9frO3ycPDeXomw2
	 FXS3qxzYg5MfcRQtfx/zwlq6H1c0xZx7oOBkR4U4bwDpQ/SozwvALJ6swx2Xz9D9hr5AO
	 7xIfef5xjSd4/VGI62+V8XF14JMmw3d7KCPrE+KDb65KKxQnw+7Hbh9HfscRIyB9nqbfm
	 dd4Qq1YorE3/1Q5T8/vlHqwsxBxYjSToMjBQ4luGOIjeB838JQ5u/jS1FIg5bTvLwSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
	b=sjax3FG25PIw6nYOw82hNev1poJYYSB4TWNEuoUjtvDhPUhAGZ84tcI+xf4aU+JxWduN
	 veuiEC/8t4C7VLRT8sX5u6zJlrA8MLE4a/ld8ARoAHXAbjL3MZon28xovl3dEfg0Wn7CE
	 ix3Qvn0QMqohWgQ27o1/VY6a2B47GL7RoiWUFnWzkRewcx4Z4C0yMikeC55SgSS9qSHGF
	 AHczk8WHUwzopOh4Gota/IgyQFc8Lhy0NmIigQ3HFbdDiUeTJJ7jSJyw21uoPbHVUqxax
	 p+4vBHS15Dh6MuZpY4DZAx1zl+eW6Aia8RTLhEQHkhx7BVTbhfwi2Cy+3P5y5MoyOHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcqNGbxo;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248B606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3248B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcqNGbxo
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f020d0169eso33961845ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677216; x=1796282016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=lcqNGbxok3oK/VMhJWn+O4UYwinI8c0JoHVHMLa79quCA94boVHpEZlF+HbH3e2ec7
         iIHgB4x5AeFU0GW5dVDs5HGYMwltxeR21Xm6xp8iPwMg1Q9zim8Y2XdZ6HkrnFUxfhY3
         mxDvOtmCOhmUoXbUoBTsD9Px/NugJoeQvIeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677216; x=1796282016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=UgNrwOLWheaooTsJPbpkQM8L93+/I8MC0iEZXf+bXhYPSNsXMSZ/hIiVsJddXoIlK/
         zfTh3Ds5Qv69YTMPibCS6S64JKt1m6GTQPyAvmMzBCXlUget9PZ3zdIOnoSwZT/EShHf
         RN9oBTdrEoLlhiywluRNXlI3nET32eawiBC1zgkrecMuKin2m6QLW0af172VX2iw5fyf
         dp7xmPKNx5dMpC8YVinWvFtkeU3TlTPEW6/1qtauR3u+UBFH+C6kfa5HQ1zuvvFDGIDZ
         Fku84vX9VoOAhH5QurZbzJyzPxBZI4dhXbv429L8ayi/6EJn5NrF/gg6jz1dXzjvMwYR
         Vc6Q==
X-Forwarded-Encrypted: i=1; AL+hErH8et0mEKhI/bwmDcTaUd3zZMqFDRA/OfH2KUfUBFJ8GBocxuaC+F1qoyyJLvx98Go4HMm/IzTAcPOeDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9puF7HG90i4wTsZjbUBNLSC8XBuv0IgzJ1HR3vpJPX5362gRjx
	dnmenZG/tg/IqHYfHs4fU14aUjkRC4UxEk6qlM0lakq97orvxDPjZbIEqug1d7nZvw==
X-Gm-Gg: AZFdTZdOWb5LIamzoA44om5fRT1Q8h9RAEVsZYq4bUv2ZWnOkWO6yYnudOjAAibdsR6
	zQvIvxS/QvDltHXznp/y6hoxZLufHqwOSfmq8izckjY0oqj2jygUGOg6EfAUNsS4ZY3X9WLg6RW
	76Ky9Yd2sw3ETTUx7WZd7QE368ebF2lIGaG8ylxctGMtm9rDR1sR8X/7XU/HDA+VV2NaPrYPfdF
	7ja8dGQGQsdL7qiclIml5E8x+WnuFFVb9UXaeIh04A3To8GQV3mMsqVic6kYULD6e1G439IPWNg
	5MeKd3mou7JKFB0R6m5Edu+tRSEMKAnBHhh6pu5W1PZ1uZw6e8ZtROBvYM4iE0VW/F13NzUxbxn
	ylXyb5l+sNt1/nzbptUvbeiiErS7/BsMk+wtfFDdGlOcMVJhOFD7MGtgfQg6r4I34KBFFWC39zA
	dShAQSWIwYBP/tJOyXTnQw4tpjlOSC83IOS8feqfCJa9GrT1J/UaVdSmFC6eUUV/l3+eTW/SA8p
	uj+5y5vIbK3ho9CEzEdBMeVSUvq7r7bESHPDqtcSgI4+00BLqFiyADvP4toD2ncJ2eFelg8A78J
	XQSpGAotfoiN80HOvmGx5bAc9Y06wEfpD3sH2Fod+OSj0G0Qrzs8tZpaioFm
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr214081945ad.26.1795677216392;
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120769sm99461835ad.57.2026.11.25.23.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
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
Subject: [PATCH RFT v4 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:50 +0800
Message-ID: <20261126071314.253890-3-wenst@chromium.org>
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

Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Expanded kerneldoc to explain clipping
- Added comment to highlight different source coordinates used

Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 50 ++++++++++++++++++++++++++---
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..789e6ac42c17 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,47 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
+ * of the visible (CRTC-clipped) part of the framebuffer
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * A plane may be positioned partially off-screen, in which case it gets
+ * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state()
+ * (populating the clipped coordinates in &drm_plane_state.src and
+ * &drm_plane_state.dst). For example, if a plane extends past the left or
+ * top edge of the screen, only its right and/or bottom portion is visible.
+ * Drivers whose hardware cannot clip by itself (i.e. accept negative
+ * destination coordinates) should use this helper instead of
+ * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
+ * the framebuffer.
+ *
+ * For pixel formats where values are grouped in blocks, this returns the
+ * beginning of the block.
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for the visible part of the framebuffer.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	/* Use clipped source coordinates state->src.[xy]1 instead of state->src_[xy] */
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
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
2.56.1.839.g22a8290db9-goog

