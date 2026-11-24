Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506060;
	b=Y3zTvygvwMJg0AIahmIq7mkHOa/3x/pPcXChYMrAZhptuP8xIAQfYN+zT6y2lfzMK6fQ
	 YIxOQQLT3bULztokLkwCfjdtOCDNNBxsp2Xm2mNsj+cnKaQ+wj+GzcvIRrDyWbw6VLgCK
	 3uxoi1656p7Bl09ChU0TPATTdkk58QPyXfncAgmofPoIat6uuuCTXFWL39HwUqjzjxfHX
	 Jd32VX6iMiYcwgPqBbFknqwYIwGIDvPjgxljhtILeNlRQr4DNArffaWMNHBZbYmhfO8lB
	 2pzPKDCnczZntHcwoLmsC67oJchK/xaOmjK3+cTNWI7eyl+PV2G9w4795szW3KySe2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
	b=2f5sZT1+kIBPUEdTDYRYBF9WCN8z+s1yT4z+BD849a/OGxXwN3elEguxToSn+iFQYJyG
	 C/GG0BgA8r8BzLc8SWcgqPoplk6UYuh+M05tHgedA/MoEVzMW8t4iNUYDc4+vRwoEqXyc
	 hIZsrTLdFXuF/zrI70yWw6qUpL++72WRUkxgKwNvZBHz/us0rU3S7LRXwZrcfbRv4v/le
	 CFvaR7S7EID5gb5C6jpdmtZkVxjk/BT15ol2dxPn2hAOOTAyNj0KGX3gxVbyur0RPy0mK
	 qUlA1IHVFauZoPDArpOpfhi7XiJt9udjnihENatMFsrPZ6qPcI12PGdpAIu9cpJGing==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Amq2mevB;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F9606A333
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92F9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Amq2mevB
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb9f760337so2615537a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506059; x=1796110859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=Amq2mevBZ6O7qkH55BtaSPU9fwGjz1E3/tEPR5JRBhBAiUJrYrSK3Zm/yOs9SGZ12D
         8jpp936PMsTCXDwwmz1yanAtFlEFKYuSOUxsKedruh5/IyHrQEKNpDmf+qnA/NzLR2jc
         XDmt1n3M3zTzXF9sygldj5gBsU+ZuC7Ie9TAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506059; x=1796110859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOv+lCeuytPMgK0k4vfCvQSlUO2ysKfU7YDIKLNZGwM=;
        b=wIfxM4FUZuTs++O5P6CNWg8mywBxel/5x7ReDgbaGk1NWPSLVJnX498yyjzd3kJH3d
         oJG/NUJ0Tcsam+pCR+N63C885icFrt/I7ZLK8sXshLFQXTzXDxSWDl38Pemuj5WiTdEJ
         odid2uaKD9hf9llhMKzK7DrFlUdpq9K267kxjAQCvBejjVj7ZEVLCIJvcSBB3969BV4y
         OyczQ+07GIwQwd87YajW/8zQVnWxtZXwQsK6QfH85+RPoZnTsEnKJnx3hCRHmWEudD+h
         bF+ikIz88QAE/6AoNI02u4I8eCpv9DJO/XmVoM8M+JFrpF5x1JoPIQgK1+Mr0sjBF37n
         WExw==
X-Forwarded-Encrypted: i=1; AL+hErGL8ukHjLENLSfOd71hPCSKsBmvaKdBPv5cuP6l9wJZ0OlVkPKXnRYT6fIT9ZQ7WJOyKtVYg7hMaJx86A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+70M2KikyYiDGIlTzFd38JjkafvmsotRbVFtidHCVZDUPw35FL
	vbDxIHJ7/xdg5WzdYMZ+/2plYJ8IQ/M1ziVTb6p76VC+ZTWx3j2pxrymucjdB9PnHQ==
X-Gm-Gg: AZFdTZeabae8Ss0D8HDIky+nzXRalxW/ycx141ycrg64hnQCpstdVjAUhMj5LJqFDWg
	73kgT5m8manroDK68dGcnoOrLr2eunOUEEZiHJaUK/N6/XYoJb7SQ5VFkySJht2QT6W5VeVXSi2
	w//9eMC/TIHlztaS7WIc+GGZOtjyuu2KrzzXXqn3ASKK5+I+pMAi1iM2O0UWP+JxOosQqDVAaaH
	59GXiVh+SXlXz7uWd7p/ZltPXhXrjfWkkVPqcrzDsZFEqUmNCE4vPcTLGLM6opEy1VyR7D8QHA3
	KtZN+r8wZX51EMhwKeNqJn7nT+uJNfyZvgkHwcjtLp16CUXlsADdhsOv9K6lr9nHqO+3KlSjl8u
	nriQ6cE4t6FY3YSoxa8/zASjs6yX/UiZCdUsHpmyGLvQ711qr5V0V9re2iPZZBk51Y1Z21ZkJfX
	FZDIwNxLVEPNceolSdAnzdg8VYWM5HhNKSFFzk2YVJLkiDDUO1yo4HF22DUajrwxD2c2FgNcdxf
	g3KUWMMLu+W7H+fRQyJeyS+IBrG4V//bZIbnnrO02Ix6BDpGSvolxsXM/SKe7kZe02aM1GfkT+X
	LXrfWeuJMm3L6q+jJESqmbnmyQGHxivxXrnw6pAmggIKId4nyBWR0uR/ZFEi3GZJ+NoA+q88D12
	6f34xQQ==
X-Received: by 2002:a17:90b:2247:b0:3b3:fe38:d8d4 with SMTP id 98e67ed59e1d1-3b40a5f92ddmr11465678a91.34.1795506059023;
        Mon, 23 Nov 2026 23:40:59 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6cfc8829sm6568259a12.8.2026.11.23.23.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:58 -0800 (PST)
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
Subject: [PATCH RFT v3 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Tue, 24 Nov 2026 15:39:29 +0800
Message-ID: <20261124074041.115251-2-wenst@chromium.org>
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
2.56.1.809.ga0b61035b5-goog

