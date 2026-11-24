Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506065;
	b=MGIRvzN1ZjajSm7ICM6YBnijDJkH7H1mctYl9Dmb8E7jiEzACQIr9OSHFZl+6rTwzeXd
	 14BsnIaQcpUxDpJs6IhlnEttZ8TsAvAWa1+psZWYd8okuUEEUbhPzP4tajQk9Gve4oM4A
	 uHnfUPkVzFMTL8MmM1HXXOnmMQ90r6U89PEOhihbXkY5vncZrhziLsFSdkRHNnoAkUJYB
	 LvcS/FtmRDfFvQspRmTyKmEW3rT4rZ/93j8Li4p8ULfPL6eAfkN58bHZdqIs6QxlTl8Jb
	 XeY4qb1qH/skTz96NMPXFMCEqy8+0eAsXv+3/BKT8/IBPclTv7AFzXkz+z+kkvS2/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
	b=rMnH1rXHSy4Ht4/M8nnnoVtp18FzgE0pojt2uJ4LLJPIELtJJMsSjrXsS+lo1JslAFZ4
	 wau/idNbF13axhrFd21JvEUxdRXGbS6n3aoow6iYOhyvhFAkkFf6ODEyWFgz219cQJqYu
	 0x+o89E9TQJ010Pmb2E706SLLhmZ0E0pkyZDJ5EgP7JD0KG/bmn2/Co7F/W5D4tfBAJKi
	 /w75G5tpRTCL5ofurc0EjMc+Kc3G4N3JQhduWPPLr6XIxzTsGWo3q3Oi8EOuy706rq4jp
	 GhhDNf0Jp3o1r14Vx2o2Stkf6pCjmAT4ZQ18FDjxyLQeWy33CWlcHcu+B+f/JKJrFWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAkeqVsb;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73246606A321
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73246606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAkeqVsb
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2806789a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506065; x=1796110865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=SAkeqVsbIl/7H1xJmWepftNsdiymn4ArXt/ttx97/hWAbqrwOhDw5ZOIqrkwuX/NM/
         cGLQUEi8x6WATpQolGCr6Han7wgfS3d7krKpTIh5h2yzg64jTGaPHuUVIN5XDAYGO3r+
         TFuAayg6NARtMFsciaT8waP/OTQCJyiAyS5Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506065; x=1796110865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=TZYoj2oXQVQquEK2CnUQiOFoflEZzUeaPgFxSG/vjmtDmrUrVQAgBR46KzQWkmwNuz
         +aNRM4WFFYLqIum/TCwW8NVYUUe+jWdOA6gUja7w3vw2zppBtKjnXW59OGUOohwQpipv
         mRcaH7dVrMl3wJuwoat6LPNyqXSgueRjvoQJmQVn/s/i8zivs8Z/AmR1mYHYz/bG+fZd
         M2MaBrDNyCtxkeY0/lXQ3OUhQy6aH2NA6TzkaEzxUJg44e85plbI/P8WHAtoTlrf5wZH
         5r1x2WTfP7bOp9Nf4zSBPy4e57u7t9GwW3UvFnKzXC29Xjg4oORqU80uDG4jxRWbreT2
         2YaQ==
X-Forwarded-Encrypted: i=1; AL+hErF+tECxJkh0IXmKeX8NxJGC6rQNKM9oZIfXwVmml/j26FfwoeIYMZNX/aQQeCiuyjmY3LQX7pfdGfXnKw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xao7zmCaDiC+T2MOVLFIA/AA8xmjExJGWAOcNZFtEIyqq0csy
	GvmoI+cWdV8KzQjSNJLI6qbCEUvxVp4DknhgUHMUXMX1sErkb2EBGz1ZcZJ/5ziQng==
X-Gm-Gg: AZFdTZegqYs2SjuhJ+P7tVyN+4YvK17hHpZ11XEALpmx9c0AQlmka5S5JSE0Fg9FTJV
	cQU9zKobNOIvc6tYmxBRj7cwte8FHY8PWtFwnvBNFwQpYfWf1rND18f/b8W7hktrANFwTYoyz+x
	gF4U1wTLxg9iQvCYrDox3wsnQhEyS6ojQjGt7j//JEBpCZBWiz2AQvgBB5nhxUb4v3x8gcQW4Cl
	49KShduzAbdg/SPpo0axzv7UiPvZWKRHxxtwkRXG4rpp9K5vZX2fF2MBQmOVGqiVTFTm3lv/+2t
	gsejuzY4y5MHPt+67ZYxHA0S304VkRQBnYzUouPgwm9vqj5kCy+YtIj0023OBSf5jZEmfdFlKxh
	I1agltAwBK1pLaUmv/KZ4Avdjtf6AUl5kkfB3n588VcQc9jmA6FujYLP9yLwjmBA/NKa6I2AR8+
	1nbJKCkzeR1QklXD0+ynwDwL+0Uto+EoTyUlhPa9o7vDe+NJ6peIiPZU3Vjsx4oi9tgv+0oi/YP
	vmSRVFOe2WoIgDxE54MVJCrqRtU2wcl/A1e8VpfwHNDuyZN4yYzrVg1LLjVZ1PPibf3D3ykOVgx
	kXs3G8od7lTniJMTVrjAU07U/0eCEMGVoFIDXGL8Caw1Rb5jhBU89LlacE17
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr13079197a91.12.1795506064871;
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405d639fdsm24820073a91.10.2026.11.23.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
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
Subject: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:30 +0800
Message-ID: <20261124074041.115251-3-wenst@chromium.org>
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
Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++----
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..0aaf4926db4e 100644
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
@@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
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
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
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
2.56.1.809.ga0b61035b5-goog

