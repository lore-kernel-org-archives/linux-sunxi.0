Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677223;
	b=T/R9PMCGHRw0rR0tfliKGhJ7kNTWnJZUd/+gqPuiNZb9CS9FeU/CzMNjpZmsbLZTIvD1
	 QJ2XTu2c6p4VdnPVbh2adj3vYAXhCFcOuuJhDShOBSDsfgI1mXtqzrzLHKiGkiwDK+wgQ
	 +VlH7yyJVyEqd8K9KRtV26lb+xPKExplRjprVgzRMJg+NR4wqFv7dOJu+QTW6qm2WkUKI
	 zyyzbsAA5sYVJrmXLPRpH8N2N8yodfjTMJb70wDGHzEGzN4dsNkdGPhosiJdrNhvEyEE3
	 mr1QfLeOWCyG92nVCpGbCBQcixmhRXMva9ytX+ON9A/vVqg4uys+Ripudkj5ql16joA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
	b=dUp9gdtrLyCrdm9XIv0J5Zan9TOud5bt13BDLmSZPRUQ00gHg4khSTJt+yj4gi8cak1w
	 /XWImMBejlC9/18lExiPTfay4fjmgoFKhDGc7G6UVwRI0OQyy+usZkFKGu6TbV/TOaE2F
	 MRwK6DzEsbNHNK1MXDfr/JnqXayu574MrSKUVjUmCoOrZVKZBjkNfF4PKB0m5NcLhP3xI
	 jLQiJxqBnzB8etB4okqS/wMEVq39j3s4OGLuxNhY/2fg0oZHUhrb8F9/Zph9VY5+IkQXX
	 cx88HNpnEa2TFdknctizErq/bQWbVmm1iWiWsaRkwhe+0vCCy+X8HRcLGUkSX3O/26A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cmMh9OXF;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C524606A321
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C524606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cmMh9OXF
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3591403a91.3
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677222; x=1796282022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=cmMh9OXFMXvJF333soS+LT4A49X3NbmtXHv6eVccZYNuP27l4w+Ty3HaP9MJQaWY8H
         6DThb48yfTpdfTKMHVK2uMNuOPHGxKCa39S26+ln/LRGoWBpYyHokjW29ieRmCkemvAg
         AAqJnj2R6xeOuYKf4W+PclXtT4Nf87BPwNtRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677222; x=1796282022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=mdV8ZGK6+FxXeRrSser6WzDy47Ea4K7saOs1wSo9+hR+GLl9jEkC3mRAuyPuz6nBLZ
         VMC82BWPygckXdBHHy7pWhVONGe066BGarXoFeD64SEpWS5qq6BzFYtReqQypJr1Wdjd
         xIIdWan75yFheq+ZAsI7TNtJ/TBmtdKUwrxhmitlwOVukp7dNr9PgNYVNAnRQRc2MRo6
         0HbtiG3YzfJ8U1nQvda+zMHWAje6B79EycLFSvplp/6BwDwaQ6LvF8SbFLDIkLzjl5jk
         v42AJNO2KeVD+nK3lLFsXFmB6v3cMOxiIWM8kLRVr5oJvVAGWUzY/9u5FwUtJWOMQEm8
         0x6g==
X-Forwarded-Encrypted: i=1; AL+hErF89c4Q0lZ8H5Bswm8UYi+yDZEvzBj1H/8du4x7bwnxrSCZFIIHZpg1FcdSokxw0TdGLQqKzeQOv1mBWw==@lists.linux.dev
X-Gm-Message-State: APuU4Z86htjvvv0gTWBrKrUkzCo4jOqCXEVwhXiql7KBaUd3UK8pwlvR
	OWo1b0zOfnk3EUSO9jjzfZ1TazH37lteCfq+OWEoBORzv70Vlj80US8aOdVHLE3N/g==
X-Gm-Gg: AZFdTZcagoRHhlDWkEh263PrYq5KJmhm8DSP0QtPy0gg9PL9ieM9NbTnqxcgry/nF0J
	Ie+cPd+qXI1tQ0eu+XYRRCVmleLxyok9qxMWXludDjx42aTxAY0Nt8UC3faalW+6fNLbCgHme97
	cWouYO2qC6zHRML4XukZvbExiPt+C+MTc2MVKsPpBZLJZdme4Jr93q1BFfTiiNqBPORIzRHHZDi
	oN33CHpjL/mfTCpDLRwYNwx7NA+8Q4IbAV86PmXnFqXF7q0C+FYs1WMqFj71FrenDKYkzu9vSrl
	QurGfbdi6qYaWMQo9uI4nDYuqMHqUU2ixSkB9wnGBYs1bPbQSIYUYW4TC/JDxI7emE3ND/5V62W
	tYQzhrPN/QzyiPFaFXGhNqwCLoq4IhotMKy71oxqSZoSXwbaG4WjL9FtqlXSGMY51a2MRNh7wEZ
	4Jqyojq5XpikbKeUehqLWXpV3BXGaKFco9kV4df9dPEmIGAdUVzgGFRz8ZHmdzUk6CmkbPKLJOH
	ure7FFekvTmB45Y2M7ebF4i76hm8uQDx4iKIfvFaMod+5sr44U6G+rRAQCz7PcGApAyVlOPqgNy
	bIgOdgqVXJiyLi/oazOeaFOF0oCVj+hra5em+XIR3xUf05Wl6ZSHXZ25RiUvfOV/O957rkPVrCI
	lQT08jA==
X-Received: by 2002:a17:90b:4b0e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b41c95c18dmr20709401a91.46.1795677221915;
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad0b52dsm33777492a91.5.2026.11.25.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
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
	stable@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RFT v4 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Thu, 26 Nov 2026 15:12:51 +0800
Message-ID: <20261126071314.253890-4-wenst@chromium.org>
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: stable@vger.kernel.org # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f9c7f28f9fa2..67cce1b0e70f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4d3fc03f9877..b6796416d550 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.56.1.839.g22a8290db9-goog

