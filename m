Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EF3EBF06;
	Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075406; cv=none; b=mWlwgUGoT37IP+70CU/Vy8hhp+tNwXnL/8mJW4AskcKPmX9eycN/I8Si7gSNYkFidS2lCfEFdKEkpN2DetBzMN5M3AV18qaULHHFFIAYVuqRDoWiyF8h2YyQSAAH8kdniDaOEnloUUpG1e4tgIkmlWD3hwQCqEWpy26Yvl+p2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075406; c=relaxed/simple;
	bh=sQcxHQ4I4ZLAaDXAbllvvwrUduN3PDwYexQoUDrYufU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2E8ytYqj0wrf+EG/b4V5/cS7Nrkz1P11xmQg4pPCOrV5fgKEDmlFN3L5eKYvJxNAQvvl1aUiIS0fJsgluT1rBMrqhQCAWcx0UGtUWPZ00ytuJE8Gd8m4kkyRniU0vFVL9eBAJ/rD/48PZnMdmAYzeDTS9fs4/OC9wR+LHLjwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsuyxrF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsuyxrF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EBCC4CEF7;
	Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075406;
	bh=sQcxHQ4I4ZLAaDXAbllvvwrUduN3PDwYexQoUDrYufU=;
	h=From:To:Cc:Subject:Date:From;
	b=WsuyxrF3fepv4Rxy+E8SdmdaopavU7qN0J28/P7/9PVrbcUGvBDaIfTvB+thcM01s
	 08wOb7tHBBfA2c9HYwtQujVv2nhn5es0MlcT8Gk4FeMfFFtGiERjVHI6LoKcvCxWkZ
	 fQqmD6xfLQmukweMO5s++aRWNXF7OzROlN+d7pQktBMhZaBh+hT0bhUy8ek0/jeq6+
	 XQ2eYjoa7ZzP7TBPMBMAaVhxHOJ9HTHSZTQkOX3z8+Z7B14GwunW4eofSMEp66lSRe
	 hC1jm8UrBVJVrtpwVdqXFiBiaN9o8MWemeUUTSwxnPQq4KjnHtajOmBEMl0fps/fyf
	 YSJrEQ9WRS+Cw==
Received: by wens.tw (Postfix, from userid 1000)
	id 04B8A5FD80; Tue, 10 Mar 2026 00:56:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory
Date: Tue, 10 Mar 2026 00:56:33 +0800
Message-ID: <20260309165635.1138413-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
adds a new helper, which covers fetching a drm_framebuffer's GEM object
and calculating the buffer address for a given plane.

This patch uses this helper to replace our own open coded version of the
same function.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
 2 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f08f6da55dd0..72c92203ae63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
-	int bpp;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Get the physical address of the buffer in memory */
-	gem = drm_fb_dma_get_gem_obj(fb, 0);
-
-	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-	/* Compute the start of the displayed memory */
-	bpp = fb->format->cpp[0];
-	dma_addr = gem->dma_addr + fb->offsets[0];
-
-	/* Fixup framebuffer address for src coordinates */
-	dma_addr += (state->src.x1 >> 16) * bpp;
-	dma_addr += (state->src.y1 >> 16) * fb->pitches[0];
+	/* Get the start of the displayed memory */
+	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ca3ab59e108d..cd8d6c2da0c7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -197,38 +197,15 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *gem;
-	u32 dx, dy, src_x, src_y;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Adjust x and y to be dividable by subsampling factor */
-	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
-	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
-
 	for (i = 0; i < format->num_planes; i++) {
-		/* Get the physical address of the buffer in memory */
-		gem = drm_fb_dma_get_gem_obj(fb, i);
-
-		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-		/* Compute the start of the displayed memory */
-		dma_addr = gem->dma_addr + fb->offsets[i];
-
-		dx = src_x;
-		dy = src_y;
-
-		if (i > 0) {
-			dx /= format->hsub;
-			dy /= format->vsub;
-		}
-
-		/* Fixup framebuffer address for src coordinates */
-		dma_addr += dx * format->cpp[i];
-		dma_addr += dy * fb->pitches[i];
+		/* Get the start of the displayed memory */
+		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.47.3

