Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D24BEE37
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529627; cv=none; b=W3OelAm94sqFHgSVQobbhI2LfDiA87LFDHa9YfH0DndvaQIedZ0eJfxVarU2FrCz/MmV1FJbLsB/3mFLQXzA82iQbJGTS9Hrix2sFm6lmKsWxdZne4YufJfrQ4UYKXXzHl4foKwPEqmtP8Oiracy+2dbvTKYBtBxx0ItrXg83a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529627; c=relaxed/simple;
	bh=4OYvQ72/SKMSJjpx0h+y2ofjW3s/V32EvXQ/gsEJdiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKhqu9uRc87JUA5VuinRSJMDblLzeK3hnrYx97wHFS0ZD3JxbOD5ZJfBxGw4uRNCysAhJEteEoyAw95cnMgqU+CHLESFk+MwgI4/Q7Kvmm5lOKuqJK8ZHtMJrq/HyQ+DcXdDjNu3l59GJ7Tmrx+65jyw31UEn19gaxM+dznIeSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=My+4johJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="My+4johJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso387760a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529625; x=1790134425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=My+4johJ2Los9Oc7ONqfw5GLhK8VL6k+racfCspYrSha4KnM8yQBzgNjc5/qIbraX/
         vK7Qj+mq9n+D43vP/K56S1WaH2LBSWPQTcy3aYFul9aGEUTRVJwIPEkrnn3bomB621MG
         VL39k6jLPF2CV5uGsk7AnVaugXvPgzfpGy8RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529625; x=1790134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuWaqYdx3lVj9cpjPj9FHjq5qpjsbWLYsj0P75i5UJE=;
        b=sTsK2GD0zpuVVpch9pGoct5dtbje5naxjEkfYYB51NVrqFOF7a1RNwmHkdVoF8M/2o
         6E4jmNsVG0vWjXKf5diX8Fmw/pLMCKFPiCk6Ww6vDn0g7SABBeUKvzOyjSDhib/S5Ycz
         3piUSPFqPo5d/AY8LFA2UjL49Ky7H6saymwbk1XvILcX2C8EgoRd4QliT38ICh4kEAWh
         ZVgVgRRYQ24GJ5E2KaEAjh6ALoAE2MaKxZTUOIUUidpXIkJJXGr3MAgeZ6vopi6MfPBJ
         qXkUp03FswXVkTl66jkFSYm1620OsJMCn+ismJen2/9pQ7j3Mu3QGQApUnfJg82mFmuZ
         xEgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhftMX0kvj75k4i+xDhba9WMHRpE34sYFjAkkK57/88aEfInha1zGBNQYlKZUOsMnL4jta7acaHccaIw==@lists.linux.dev
X-Gm-Message-State: AFuF++kxYqcinqqUBgO+d5a3JiKP9tB+JamG71WVC4Vu85oMSBsvbYFW
	rUYd5ZI9OEuyjovDxUbHZgApsA0WZSsulG6JR4RgmjD8yIMA9LeM/VbKrlL63glxmA==
X-Gm-Gg: AYBFou1HmdLFLN/88GkaIaYcR/wldAUXKtqsBjt5IEQW+BsEflnJ9KF82kNNJM4uP2n
	+I0AJAC48+6aoyvxUiKBxFjbgx6bmgQ1w9j4j60rAdpW8wwMz3PPHIwb6urb9cDn1N9arLuzwCt
	U2eUVeHeCD5FacULqTn6Q6mlcWyJUqNIHm+Y/UlZ3bY+W8/Tbvjbh4Q49DXrxxmdguoheIOk+Pe
	xiGkqvFJz6nOG2t9BSHrzdBS0OxeFIctLOd2T7nkvMV6Etfn2R3MSFaM+Y4dDWmk2oQp4aYYm0E
	Nj8AwejGrEMZn2jGmh5MZfd34U9hRgB8gE0BW5zDvp6kT/I+BQIghQ2pt8EwKgjmtPukXdvfytL
	HQGbcFIczzvzP4YkAQotw9Ee40pvYr7VMovMonlSRO2kbaXKQBOpOrYV/FwoIjZa7YWJc05Glc5
	rXZSmmnjw6CV9NRKM6dtt0DTIrstxXnuFiI4UIjQXiLn9hkPW0g1Q/QhHZtLkMckkyF0X4caKKw
	LzJ40Dow7FNvcitmvw6340Sx3NwrfmdFiJ8BzYQbHXXR+GJsNRHZOff8A==
X-Received: by 2002:a17:90b:2604:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39e1e27ad34mr2355684a91.3.1789529625104;
        Tue, 15 Sep 2026 20:33:45 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:44 -0700 (PDT)
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
Subject: [PATCH RFT v2 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:23 +0800
Message-ID: <20260916033327.3054126-3-wenst@chromium.org>
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
2.55.0.1032.g73a4cd73de-goog

