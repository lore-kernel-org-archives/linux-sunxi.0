Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368341D54FA
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843763; cv=none; b=V3+Rfqqp9fn/ExGY3El8VTpkQHYoklSh8lgbz7CjpQwCTZrAmRqx2ticlcPA95Od2aJ0tqrYpvzHLsWUHzcDunk2Geqx+QCbRHrezAUQSbpJDifgL795FcFfWGeAuE3I+uCwQZw7JZ5RsXAJ3p8eamoQUXGmPWK0NiDp2/rTCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843763; c=relaxed/simple;
	bh=9Gz680K5QSslTUHGxRWjVgzzejSc0xlqkZhFGg8h0K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPvamSRRW6OEO6nUWniIAt7StAvB3S5+wYO3cWlzGAZZ3dpkbIudhYBxyLWa/slE71/A9btmTsGCun5Yo6eaxvHiV+bK7ekKmSJ6WcJCBtCiyB6WBsz8PkE+j7b5IrhYME5KjFSCYmxcmc91EMOU65uMre8L/ZAuzDrsTNlzhhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F8bRe+WO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F8bRe+WO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3758298a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788843761; x=1789448561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=F8bRe+WO4VfxTkFD7F+SLciqJAWI58Q+8fp68i95JLGJBsrScVt7+ujLz8JkrAVMpy
         eVflfDGSDssJ0GdqNUs6HxGkKyxPzFeyD6I83GbxHHGeFvEsfBzyHTTH1BP3q6gXlCAU
         BbAAjWkbL/N9HCWJw1A1/C21QNd8UHxJn1fX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843761; x=1789448561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5Plj4uGj3BvxxxoyuAGWT0KJk9RqOTiZJAPsoPxBFY=;
        b=BfDftIXVZJet27fV7KLPNDVxKuyLeGQx9WzSMkujlLJJu6e7MphL9xqPjgQnLHgmSk
         AsYwralbcez+PE/DPtRQBmSUsJCT47FUQSzXWkYKlX29VCbcmjvG1tqj0SUuWeaUfdq6
         CcJsA+pcnRVXNK++hmxNQg4VaAw5GlUuCIdQ2NzBEeJVEttDYnStNk4JELvjNuvSO1fF
         /BppxyQrK7feAHlZ+2mkHkwixrTgegHaDsKbYuAXxiykwfwyf8Le9Pelj+718jNP8H1W
         DMEHb9XfUatpzxJPtEBUug0ajsr5Y+ignNnGYal8hMQVHdX/pva0scyBxlgs0rBodtAS
         8haA==
X-Forwarded-Encrypted: i=1; AKwUvBwA8DZAf5zoOo+dsbP61rk0R376W6plZ8hbKi59caK3M6TcXl7jf+5Dl8JmhyYhH8LVdjZTfuBA2iFzrg==@lists.linux.dev
X-Gm-Message-State: AFuF++nlykZSfpKLeoEwoYgrepcCiLR2Fl1/aFa2wpjtB2MIw+MEJWbg
	nukZ/h50N8IEddujsizIDIwEh2hkmb16mUBJanlsBRsp/MVUlFBoaPcYC6oLCbqUGw==
X-Gm-Gg: AYBFou1PiuNDUH6IEnXDixpzGqlM0NRIY6t4sjiFNkPSODksfP9hsn+4Rx8lXtPbmZ8
	yAnFgSCq+bGUkTddbz7nwG8okTDdo2NxzzydwwSzBJs3vQXoecLgSllu0BKN2eTVaHD0yU6J+c2
	TJoKnMyyiEPoSVX/2ctTMrPS69sts3H0nJiEzsh8Tc9bT7oCV1DCcF8uaIIEnHAhvhyCYhjIC9b
	Zvymz4vT0PdrP2k4QzjzS6XKFUcpTDbTu1bSdnAGoTEHhDCk1NEVncDrXVgQef16QWo3pMypBcT
	kYNp31jIUVenTIPcBCPtY8y/xHY8rRP+BBu8j7JetYK+CJXKu0d7IIsi1+HiZjW9VtHoCDqpiYE
	WULbOSGYDQeYZ6veLlZIMyIHTTKce52qRyYEJX4uxKnuH4G64GOFekeB/S5nY62u9nS9z2BM4Zj
	tC5QBBF0dCRrrBbjxGikx9ewpM15l0l0abo6KsqwNDcEov+ngOGrT/HXcKIOK9S13cGjyOzof16
	Rx3QZVN+a793E/NqBd7ohJTmQzh9BxfZQpZIbGqoNZy/9tPnJ/OkiX5pw==
X-Received: by 2002:a17:90b:4fcb:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39b26100e5dmr38830828a91.4.1788843761523;
        Mon, 07 Sep 2026 22:02:41 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b813fb4ddsm6342730a91.10.2026.09.07.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:02:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue,  8 Sep 2026 13:02:28 +0800
Message-ID: <20260908050229.754977-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware can handle
pixel offsets within a sub-sampling block, but the buffer address must
start at the beginning of the subsampled block for all planes. The
hardware then does the interpolation internally. However the helper
gives the address exact pixel for luma, which messes up the result.

Instead of reverting the commit, calculate the intra-block offset and
adjust the buffer address so that it points to the start of the block.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: <stable@vger.kernel.org> # 7.1+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2e9cda45c04e..185e9e5211c1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -207,6 +207,20 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 		/* Get the start of the displayed memory */
 		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
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
+
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
 				 i + 1, fb->pitches[i]);
-- 
2.55.0.979.g7e5102b832-goog

