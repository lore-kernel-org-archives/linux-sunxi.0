Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506071;
	b=qM6kgL3zjt+hs003TEkUQJ6OGa8nHoqpj6w/X5RYxeFHRUC/2VCi+oogybPlUYRXqx7V
	 A0RiQGG/5OtzXDtrYpT+0Bk1LYyhFt65vHmipYUdp2yojgfyws+ZOl8XhQgrgtGqDZ2mC
	 J4e/A587RZjYjyDHe+nmuJKhRFPx/++TA/BprOmLQhhVxMHYeggv+aaUglDk4xnZppVZI
	 7psDCf2ivaSHc7wg6mHkVF5WbD+oZk/u1MVjaRxW/wVuDiebqcVo3O4oTxvdyewJ9Qq0D
	 aiRAL4f6WYL6ARH1hMDnOcO4rM+jIiXqxN15FBEYbqdxZV0e79edSl/US6G5UH/tJiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
	b=0lS8tzyyvSBMklKeqrYsE4X3HzNG651iPrUnmkREAYs4RPB05QZso+Yg44LeqdXu7+Zk
	 RMekbK4zWwlyK03HvW7JQrbbn9cA3pJYjGjOR7856F64kUZl3bMg3SRCo5d52QsufFClP
	 CT++D8Dt9JGIsNTZDcemnEysj9zTJxSMEq4ogMK52WHCnKXAOcnC+hhtn7kuad2bCW/af
	 QRBSJSg3JVxjzsX70yFrMUGG5LC71pGz2q37d8TmH0RoPCCI6iT4oDN/TUP72dsPnjxJ1
	 ++s1kzQm9gNusGRCUqlQN0ST9ZDjBiGBQ4sCajJVBxTSFGDQyjZ/S0akXd3i3UkLq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8x46XrY;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D0606A326
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8x46XrY
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05b465cd1so19754195ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506070; x=1796110870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=b8x46XrY1/atSUSyLUoM/2eaaylMsYFMHPpmYI3q1FkVxHVK4rktiHUkcC+zRxQsMy
         In8/kF9J5ED8bNcCubm678wsq7mB7Xl+pd+Q09zpYNQkHhPJTquDEBDY8pw6rQionpIq
         VM/A0AtrrPBY8HXo9rvTjELAxyl3DEAdU2qKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506070; x=1796110870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnUOXR4q7AEOdZeeEt7YaH+i+q8V7R+T5wpH12+fNyk=;
        b=jg1C7aw/nmVauSa+76lIlw2mbAOi5Q5Kp3bPr4iFpDYc9USrYHHFsjzq6xPm4iOHma
         U5udZcd3442MPAkmKo30h7Efe6e/W139uAb9UiXZvgvbBaWjcmiHiIrGtnhfBMVkC+R6
         jAyirNvOtiNAT+RAh8HcWJr8YO6sb6vQSw6n2m+Rec7AkSVe65LXJllCLDJCJZO5xnP1
         rvV9jgO9PsVaaNWyzn0DRgw5euNBi/M7TXoCmrubxXLstKdJc0OvjLB/5xrM52nj9yjY
         aUi3PyMBwALxBGs8BQXomRJCuzp3fJxf3yXa09+0cho21SY43atjlPgQwN22rgkJlOFh
         ++Nw==
X-Forwarded-Encrypted: i=1; AL+hErFzoS1MFbdgld/JlMDhr0DytIaTz1YadZ6oxPe1K2ILsBqdTtltqYC6VgkRutoxC8R6PaGY5OFgb7E2jA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+M9+XTF36mmWcgOlNRBvSxtG8Al7TtwHQPm9oc53ofwKWVlJ+p
	0ZYXspVlC5wEyZhrHVkpOlMVhnRLOAIH2wNUjzRc5TupTx5rFPyrVXLHgaslSufEfg==
X-Gm-Gg: AZFdTZcKaSeuxxChcT+OcAqyWj4QFEBipV+wRFxi/aiUBeYfMjirJ9bUnPtz0SlK30U
	Sm+Vzj5j/3HPwxr4OYXVgfXFw8joX4W/mCEBtuUXiQmwvF5vKzwScwLueImHsIFgyQfy5La7azv
	S0RqFfA/mB6ktCTXPKi2hQuQRtHsn7LTe/yHdpPTWEj2zO0FkbQXHSote8I9St3Qbyic7cSrQAr
	r5qAoRftiGWjhfjP2aR3Y7xxHh9lkBUgS71zNkD62jT4gGo8IFGrAoItYOlQIfQ6pXbwDcq+3D+
	kxbXW1U/AFlKmZhE2dmj654d7sMBpbZFLbL3IUe3oP8wKfxp81LcAeJXo3uy8oDhBEEjWBJN1ks
	GSGbNR2TQt5jLRxjZqnlCbLYXEGz1/JBMIZD7rPQ/fLB71s5Eh+2/BrWv206Z/a+/yBZZ/PJYD0
	HdhOvEuPqY76kjjDMe5gm2tzPaPmKx//2W4ALSH4FtpyKFTUGmhzhF50ccAwMSBXBZO7LKFW2vY
	bYsBBVwLYIb5T5ZtJtZt0BgbTU2fkpWq/uAjCtHEKxkl+sMwVmF+L5gwmNNmJH4NA1g13RNVAQc
	ERwjitaTZJAvmpJIdCXecvb8WxM9VgcjddXpi3GGfUIvecL5kx9+lugjhhFw
X-Received: by 2002:a17:903:298c:b0:2e9:5714:6075 with SMTP id d9443c01a7336-2f03f117c82mr126158455ad.17.1795506070067;
        Mon, 23 Nov 2026 23:41:10 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f04f6049dfsm55300615ad.19.2026.11.23.23.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:09 -0800 (PST)
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
Subject: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Tue, 24 Nov 2026 15:39:31 +0800
Message-ID: <20261124074041.115251-4-wenst@chromium.org>
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
Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
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
2.56.1.809.ga0b61035b5-goog

