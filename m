Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677211;
	b=KbClPpr0Gn1GLZakYXjgm5V9fnXefOLJe1sRRBFDc8PNAYZfJcJUgj/1tK67HSH918VC
	 FVh9YC6fYFRISR+dhaBlI+fYce+2LhyAFcGKZ1QwRCf4pWEA3FAiahw3slKCXYK8T/c2R
	 9jjXb53trw2DI32Gmkd9+VVqhB6wdXltWNBEs4xrBrAfT+WTvrA6MLC/+IsP9AacHlfSh
	 Cy1R66+yrz4H/SyHJoXmsXdc9eo6fiESLIjPq1KGcfJG8ZZJm4nVp1b1L31PPd0LGtm+V
	 afbqztUSWnGMVkgYOuZtJztV5eZENKuLT5vMPFsKo8inMY8EueeUkcvlx9Z08PH/QRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
	b=4xw/b8KPmeJb32kQydkfUrrXal+ZLktp9LCl2YnHTMvHS1Y1/YctXkELq/zdASUH1vu3
	 hAoiFooS9PUvHrsSKx1MJZ+KHs2XruTK367SrEESViPB7nMnKK1toHmEMKmAWHY14ghoZ
	 4Ft7MqF2AVoiIozOn46T5tnPBkHCu1mGYMwgtEL6aDyYQpqFDoJftQsy4/9aLqYucr71Y
	 J/b2FwiZm3gNS/HrefwdeGxqGgiwqxW5PW3LaC0tsYCL4BF6CLAbecD/JPpexn5GWkq/V
	 xHVzuwNxNqgqucqovfGXffrK909z8gKkzB4RIEDw/oIZs0ATIYCFYjbAp4pF08dxEPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hMGObVyQ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABF606A31E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBABF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hMGObVyQ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so2671355b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677210; x=1796282010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=hMGObVyQoONUT6TV+jmjmq6OyK9IfHg4OUEGwqQ/tduHPbz0kdV2htyLclKoX9shbf
         oyzUmdy3NhKMiB/LVMaf8l0+GQg2Oti4fUAUGzLy3SQXvKCPXoLQWq/umdni1uXOWvnx
         kHS8vrBPjJQ8DX1RpKccyhkBhary/6mcTbb9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677210; x=1796282010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=bHJ68atrKDFuxzkXGk6qq3NqyP6d61MITI2IcUbDHW+tCBgaDL522A/HWibd/0Pj6w
         W7s8RewpzPg+SVPu3MbP4CC/yIRTV5YEdJU+hmUDHMSewDjPiNDPPiDX2IcSH/SktxFp
         FpmDDmwSghuZcErHraximCo9uHDJumJt77B31o5nG3VfRDAR/5BbuD/PMeC9MpevhC/t
         yQIIha/L3u3N8Ppu/yH9qhzcuk4ciyyl1IvzEbRjIBrni3lQj0lprZ/O71WPS87pqJmL
         QZGuS0zZJG4V10sbtTZCamI+RckSjYG1yUCjSD3BEdVoUSFkAIpz0m2Klb12p9yRRKSp
         byyQ==
X-Forwarded-Encrypted: i=1; AL+hErFWo2dfGztuJ0u2BDxl/UL/PYimlZus6Beok9aoE2syoI8WSeUB1m+QQkvTunmvtl6ms4f6tj4ZnHUUbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+gdbloj235AA/hm17E2zdkatVo1PeKK00F/Gocxbu7tQiWcY4e
	rdcj7w0hJsLriOyuyjipFhJWxiD9w8HTZp1kNktFqKc774YIEiPlmGWvIBYricGdOA==
X-Gm-Gg: AZFdTZfMXKK6H3RJK7xxLw9VM5UXogTLEocck1j4C68CzSTU7l4CJR6O9WvbAB2M8HW
	drMobUAQpCl4Ua+eXH+lhFEVIjYRTLdOep6JFDBhSKQChOE61vjwlQcqYOkV7P6elEny8BxuAC0
	dDR7aJymOuVFgAVNfbbypmYcuAo7eR/vqCwiLqZgIlU9evCuQa3gZdACoVA1dx17KYvvn+QfafL
	oAi+Sh3qRKN2MQ85nE0H/tgZ6prdCeGvUoluURNK6w0b9lK8uiKdOaMPWoKGjVJ/kNgcN4PbR1w
	lF7jkKud3D2DFBoYI5/8B6Ut7GP37YJXc3wjJQfUtlyswwL/+JSdwJdLOvlB7KZWVMdy09nbFNd
	oV2T/OjYJHzt/UtN1VmpEwuLpfh6uNOBi7Y1ZqAVbmolvyVEnOa76g/sqpPdrNC7CrSdzTPK0Vc
	983G9CHspzItRLAyN3xSu/LYpyutnnTmw3s8dNeTEi/WJGVBEkry8Btti8MvOoDISKBFihrrAX7
	R9f/EfU7aF3WQZkcI79IjJcW2lMyv3pv6RvyS9GKaAwKYp9RjrIgB+8CeS+P/w4zRzOehde+U99
	Sc9z8a7NIxD6RPMmupvWh2SEhUyIdsTwUPVqftljoiA4tAkxn595tgrW5fLn
X-Received: by 2002:a05:6a00:238b:b0:89f:521:8089 with SMTP id d2e1a72fcca58-8c87bcbcfebmr18588681b3a.19.1795677210131;
        Wed, 25 Nov 2026 23:13:30 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c87285b60csm10397352b3a.9.2026.11.25.23.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:29 -0800 (PST)
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
Subject: [PATCH RFT v4 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Thu, 26 Nov 2026 15:12:49 +0800
Message-ID: <20261126071314.253890-2-wenst@chromium.org>
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
Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
fb->offsets and fb->pitches are (or should have been) checked by the
driver's .fb_create callback, either in drm_gem_fb_init_with_funcs()
or reimplementing the checks directly.

Changes since v2:
- Change offset local variable and return type to u64, and use
  mul_u32_u32() to avoid 32-bit overflow before widening
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 46 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 52 insertions(+), 25 deletions(-)

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
index d32aceb6ca9b..589619bd8f0b 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -21,6 +21,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/math64.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
@@ -1208,6 +1209,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
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
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
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
+	u64 offset;
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
+	offset += mul_u32_u32(fb->pitches[plane], block_start_y);
+	offset += mul_u32_u32(block_size, num_hblocks);
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..6f838b485730 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.56.1.839.g22a8290db9-goog

