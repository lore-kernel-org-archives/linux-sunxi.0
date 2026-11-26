Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677229;
	b=eDUiLYnQRmSlVasirsXarcTYTercXHtevdhmDzH65oIHa/PQYkoBeOp6FKz4R9XfXyLr
	 248dozMpHD8WJF1fzka6wqQjHhPOHYBKhUkvi0kThNSg0b0RUFFrBsr2Ynrfcx88wRNxW
	 wbL0LmIOlXdyg9w2zefEsxYXTrqDbYjyX4bozAh7MUmhMaGP/yULmLIrjTz+DMXvc6qqD
	 YEH7jzeEjQY7bXnyFdoCBCNOI2futuePXfT3VSFK94Si6lsQSQj/2Ply7pmn06M0UZSVk
	 RFYai+CJ2CUIGqRvRTDxly1ETupQA1IQmF3x3b0ZyDs9M0M5+q62oIdbmEKKA3hQEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
	b=165NmXc6mA5Wa5/Ervt8rcCv2Z7r1uiBCrJTxQubtxl18Yih0DJgxed6CvmZC3BaNuP0
	 mPpWY0dRG4PI3yiUz0Csz0lDIEQt1R9tznQb59MiPb6PKQRvS9p5R56LPV2E1F0vCLds4
	 3jyyIEbuqPrE91Ci5YyfkQNarc9TsqO9KvqWguZQUwoZYjsqFZC6iaGRMXAb5ycyHLuVr
	 oQ004IzPqwHUqYKt3+YeVUPu9yxIlZprzLHlT/6qEW9ryz91KSFr26cUc3JJNEeuFzKnA
	 29N7hwHKKQXyVKfb2+hol9qTJ35sa3K6KClK0rc+qJqdjDJhl7wYvEjSrpZJzaxw9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j0Yfg70j;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886C606A331
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 07:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B886C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j0Yfg70j
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5104719b3a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677228; x=1796282028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=j0Yfg70j3D7YoZlp5dH+DP+HhG1lGBqwxySxdioM3B9oueaBKBaBPf/O3NkdCrL/Qt
         GyFta90zVRAnn83as52GRg7n9zeT6mbl7lTnaQXxwJ4HenewtJ6LzAmIPHmcW3OQtApo
         7UEJ/UvtySEBPICtoRlLZkLxG4v8IhLT7zAxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677228; x=1796282028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=ciGA4C/CUH+wb51+btyNNwx+qq2xEC7+Y5iELU2VZtSkDchi7A3VT1bRn4fS+PuA22
         F2ESPK5RRaf4hmDWiTOOcjKIGVFGaMyHTp2vln/fG0RXOgZe2rdbpyTW2ohvk5uXGNTQ
         h1eHnwSXI1Vp9fesjY9PjvfGEBY0eYLlE4D82q1ZBEUp/Ggi1Y/Pn4mGW6Sh4dyo+36r
         KWAoZ5L9X3yIToC9kvFDMXPZiUgcvuID+cjGbZt2XVOXa9iJiZ/h78EeIirE6UqFssPc
         UFcb99TNlOTiEvmuHbyrVMasg1kAKNdPVWYCESlUjZbNrYEpH6vTDuA4Fv9ba1eXag4W
         RZjQ==
X-Forwarded-Encrypted: i=1; AL+hErEvFxk2CO3JSGvn8/kynwbZDxoDMF6i7fBNV94CViw029hJ6n9Ld3eR2mRK7mxoffubfSGQOAiH8dmHEA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/umDArYJDOvEyIXtUlUy1loZj7PRDMSXD5ZbbYuZjSF07UOed4
	BUqnf5q9a1na/kcpEB611mxI3bFIuovSFRrSY6WE6xOOX46Jq2ZxvOpFpd3ItMYv3g==
X-Gm-Gg: AZFdTZcFRIk6pXR1ywTYa91I/hVRO7txbWBLbFSBSP3QOWluEeEJSRBjJZz7OoppHjA
	Vl8LwG1w0xVdSF9DDVahGX9CVE5Ze0V0lN9CfquNpvf2NI4x4JYTyH2gbsnBGdCQHw6hIaXY42Y
	lKnBQR9Lp59rEO+ZDKk/ZiN0KWox+BD9B/WO7TcbA0eHMCSP0DpzRIl022Kx7IE32rn+8dUJhnf
	e83XvTDAd85YPlGTdInEbQRgmtzU9s2dksiOk5YlSyCoctNN9Yg4mm+aGwbfSqXNyEAgHGfrhBp
	rXOZhkM86hEaYjfS3cVgH5j11X3GJ67jGv7YavHN1zT8TgN8vjQXKklBapnU2FcFe2d3v3eTw8N
	k2riuQWyjfDnLh4B8ya6RAkwQqUkR4t1Tuiyi68gCpu4YyJSPBaVCC4KXJ1sDdDx0uc7/okDdrF
	vCC2oxSJU0IsEN1n+A77AtiPRuwROqBuSIqmI0pvbcEJsfsQyCj8U85A+pf8/kGLD7nQsxMkaeY
	Z5r3gj0mm4H6F1zPOxGmB/qCWfu3z6FdWBrln7EG1jVbNhucq7LLDEv+eZKyML/hF9SrGbSS8Y7
	piTKEYW58DDBtrCHLoIh4WtePzrcAiNB88bjYIsqN9XGZA0tnxZQ622aLueuKZNSNUwhyfzRn+H
	mQsBflg==
X-Received: by 2002:a05:6a21:3f94:b0:40a:56b8:2551 with SMTP id adf61e73a8af0-40a56b82debmr793737637.17.1795677227780;
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm4664437b3a.49.2026.11.25.23.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
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
Subject: [PATCH RFT v4 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:52 +0800
Message-ID: <20261126071314.253890-5-wenst@chromium.org>
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.839.g22a8290db9-goog

