Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCA8389E1A
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529623; cv=none; b=QKfWt6eAYX2ro8PuK2w9qugYzh4LGNgKHQkcpp5G6iWn0PQhj7XHzQ3iv6R+fx+MIydfUc2VNPHRpGIvfVJWYzJNf6+/qvqQSQSxExPeby4A5AicdFHA/AjU1MIsSyAwqsLYCwofQ2MM7X0JvF/UIPAB4tD3kdvDQ0epm8DbfIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529623; c=relaxed/simple;
	bh=es80KIPm6d34RQhtEPnuboKLoKRoUcyHS9QbOTgsSi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biUYWbaCUEikznJWRl4yX2/2c1DIMNgaZ0AQlNSkENjOg+w0fWk5/CGyrAbjkuC36Rik1LShp0Hb5YO8FDIhTJHcU0Idlz3/l+Xn6MZBcavjy/ZrK0AKZN6n6/2KUgVthhuEjiMZMHD7H6TlZU/ivnJG7hhC8+521vG8FSp/P+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KgqWrZpw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KgqWrZpw"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso346935a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529621; x=1790134421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=KgqWrZpw/MzjdNzJk8uKHXWRzRYVkE8Xjm6mT4e/BZzzJoH97P3F0EA+26vlox7EM9
         5v40UUpF2p6Uh1WeSJROb64t71jp9Q8xd/zWuNOpqy8Njf1PLtnmqpGTRRAfviOxYg/2
         2ftDT6Dz/iAYOAuY9ylGTfh9ZDm+zkI0q+U60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529621; x=1790134421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JETOMAWav2dfMHsWYPyuoNMSTDJN0FsRCfFHE94te6U=;
        b=T+Uc5bFFm8yj+lWWNuuND879IYCj2iFxb9bA+T6qZT+D9oLoVAL/V9mQ0YWmxa+T+Y
         q8y+fLNK+0FGQASoFPp3boi7YaED1qMQXrlLKIwEDG/2cK5KoRzj1+crEbWyGXXNbAde
         qRwVIUv/M98W6XPFkamqNuk3V1nr8pY+GNgRV+3fnfpIK+UZQUgLrkcnv/mddxg0IXnJ
         aqAGinJDRC0rcj54tVJ/hH3urFl6TmqoJmbFuYghZD3jfY2xn6TMIm/K0KeaAQWsaOfR
         RPhzlae1UmapRk4uyGn89BwNTYt9yGWQqM8ZXkVovk282CQYjxf8vIspvjTfc00C9mza
         5vyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy31RK/9O8tNXgQiCqQE4o/O709XYPJI69C6Y5+diLvof9PHUXybdiiNahi8c4oepKH2922oddWyyd7og==@lists.linux.dev
X-Gm-Message-State: AFuF++m3I2OxkJbXKAg07F9S/khaQuuYI878SlsbmlJiKbeya126vaE9
	P33+Mfp1P4q8kDWTYGDmHi5QZOL/UbO2Ara8tkcYhhlzMEQG4xjEVVXBTX6ee/YFmw==
X-Gm-Gg: AYBFou2BlVSu4FcXf76bw8/xqWKwXQmE8IPNSd+D1uS5YELxzaH4Qqp9eSxjNu2n1oN
	CmvK9BgL9pFYEFMquX1JRyyObMTZVSWf52tJP/NAPiwISKKbYlSv3+6tBAl3srm5WGgiZh9UGFm
	GoA+xqoX2Pxsb3zivV+y8fHLkcaSO60IIhtpJQ6v5c5ByXIuW6wp+vpftZ0ARRVg7JG4irs4T56
	2uPCa+jdGOvfUyLgp5w64GYe33NhZvkYy9yLwdk1p+g+GcLcemkwRyVRZIiUXtEOOIGexmU64Vz
	6J9GWpvsLTmK+pDx/M45WThQkH4nAgGNOn1fiC102qFNYH8I5DScstCPsRilMaieogdofJu1dDq
	7cY64s06gQ/LyfUpRwwli3NCr5i+YxII/6sBqjMYuWGU2J6UPIVxBWH6Gt3M/0USIvsmKMGIDOn
	rcgw+C9sFdi7dGBl+L0NJZ6XJfr012JPZwU1BuXC2RcN78C+X7KNqm2/qHISFnxctj9kcmhvOLu
	zLuJEBmgxLJBmJyzjl0TN5KBCHmXl9X0O839suUeBGVIMxDLY0LdqME1Q==
X-Received: by 2002:a17:90b:2604:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39e1df6c05dmr2364892a91.0.1789529621075;
        Tue, 15 Sep 2026 20:33:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:40 -0700 (PDT)
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
Subject: [PATCH RFT v2 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Wed, 16 Sep 2026 11:33:22 +0800
Message-ID: <20260916033327.3054126-2-wenst@chromium.org>
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 45 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..9e1231162047 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1208,6 +1208,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u32 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += fb->pitches[plane] * block_start_y;
+	offset += block_size * num_hblocks;
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..c07aea1cc59f 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u32 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.55.0.1032.g73a4cd73de-goog

