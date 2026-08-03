Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6241DEF4
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773511; cv=none; b=GXU9ZM6zk4kBJKSuP0Pn/1MBETszq3jltPX3uT8TVosBBW/b2X3HX9trr0CWtKGCzb+YimbAMWiAzw0BWv7AjTATQR3HytZQpX5yIkuqIeHST1bx4DqGurMbx7N3/2p9Nef0Tc3xWFtnO/FxEC6isVXHmS08V4+ckjQLL/j/kW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773511; c=relaxed/simple;
	bh=uVZLO+rGfusiXjjseIm7VDcp7b7csm52zv3SxTvUs2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tykVj1xefMttUNnaBumJHAPPkNay3F0CD7+9gtIcFReAyMchVwO2jgFFvLNUHIUK1oe3j9luT1K8G64Lr9waayMdaB0Ae5VmLRAp++HeN7gb4dOwTu21QGjOwXYei60cADnNYbkwetd1VUeI7aj6LAMK/oeve2KK0a6UfOuE360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIsba+Dt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIsba+Dt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980dc26022so14729925e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773503; x=1786378303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3+RPMRTD2bspWZ1EZegXMowVkzRDKKmin7c2HjnpVI=;
        b=TIsba+DtTsfu1CTJc5V+19mcFfRruGJk/3s/TL7h4/RDZrYwYyesXt8+VjPHXfOZFF
         dIcAnFGYoGbTFFBfTQGBy8se2Zie8VrxSx7Ein2CV8LkWAEEk+ZVc3jbSjT64Iejcv68
         SGzUZLsGD3h3B4HYpKBdY1nTiKa+kV0Vake0WTt+y6Olo9ONZW0x+bIRCrSOfxlzWZ8L
         M2YMaSTKJhUeuwuy9bl5yN8VIo7q2pwSrBiuCyIoEleILWK2dZQxPWmpW7//ZJvyHTKb
         m9gEuQT2PGMxcwBrkPeW5l4XjlMYfPxNpsqy8HzM2k+5+skIuhmG8qwhkfc8LmNxxsDY
         zq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773503; x=1786378303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3+RPMRTD2bspWZ1EZegXMowVkzRDKKmin7c2HjnpVI=;
        b=kMkIcgqWzzXB88YhUJO4xgl0xsnFYpOI7xohKJJunNU7Lbc/l7GH6k3C4UeQae8xBJ
         eloC9xV64+TSswxC6xLqU1lzt+x56Uzl4kWR9KUYCpTPWw+ibnYs0NtycwJXCBdQOA6a
         j7hBE7hfHSsV29uwhIZ7YL2AjvO0chx4p/F5xyiLZcgqRCj18baySAIdjPTShUaFwUlq
         AzOIDG1kh286Sgv2bxE7o6AO0d6nHU3FgkDwmTRqmDtno/6HQki0oXuGG2F+x2cVXB3r
         nV+HWngxVvIibK/3r6Z1D+vKdZ4r0xPpM/uicoNSFYD3FFcEMGsv54OfDSGv0GeJLPuc
         qnGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpkc9qewx07kIrU3QbIud2Md1smrAdNDz4D4iBIOjpH2DBmnFHse/zjF4f2sehFZVMYy8Jd61ymeAoI/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsYARWNN/sRJeZ8TtYYz+brTueTGoB0sJVSsAHsT/ZMc44AhCg
	nVHa26S8m8BAymsPi/P8+4xUmzWXda7KV7vCIRebhy1E6XpjR3Sfj4vS
X-Gm-Gg: AR+sD12o6jt3oBvSZKYiEyRU0nwNX4e2+PgKKgbquyNDPQr/jlB1LH7o1Op8tPkHLIn
	xAPdXBiDdsbvmR9xHenW2B2tJ6ZOZy+jCNsYdus8rPbM+SUo6TyZFlrA8WZ4yqIB6sueKuNOqnu
	DbwDggKqnLdBH9jfIF/ZAWDuHwTL/z1AbVXxTP2TD+BFYL498oEBlB573prHEt0IyqOflwvzrvM
	roPf+puRot+39tgYRmnNJocbTgZzjSs0WeJNodNpCkCgcW4T+MM+QiBzuZCsTLRgg7fHBxofio5
	fY+8fDEs5r23aw5l4j7GmBlwfudWVbRwzqn0LWd3Gc3A4l4FZGhLaB4cZZwluxl4tKC2riC93je
	0nJmIyTNY+EldxhAZIiZ1QxEKmVSEn0PT5LmiMC3PHnswHRPOiodLLLS27DBKn2Euwtg3Y2RPFC
	vtEaZhgN4iu4w/T3pL0HLoU1Wnedix97LNraOjha5+L7FuNuD9IGEtvoKgC0WohuQClew5p2Wt6
	8w80BoaaEh0L9VdX/hWTQCEDDC5WL+eHEQOy0Yo0Jj5PwF+OZVTZ2WZuph6boJVY+KV6XjOWVs6
	spb7vHWFRJ9ArMQMSp2Ho1I62U9CmRfzXhkM+zRROpMG1OzVDZAfRYMW451emRPM4t//shcyVNe
	25OTqogwqvwJmeEzVpb0iKoeFQk5PdD28YyECjBdonn6RPAFa5bHpf4+dVbrrojNEIPGwa6nUpV
	CJRg==
X-Received: by 2002:a05:600c:c4ac:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-4980dda1993mr193930475e9.10.1785773503133;
        Mon, 03 Aug 2026 09:11:43 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:42 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Mon,  3 Aug 2026 18:10:51 +0200
Message-ID: <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
Use drm_fb_dma_get_gem_addr() to get display memory").

Chroma must start at the beginning of a subsampling block, for example
chroma start address for NV12 must be aligned to 2 pixels.
drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
and chroma by the coordinates divided by the subsampling factor, so for
odd offsets both planes no longer describe the same pixel, which the
Display Engine scaler can't handle.

Align source coordinates down for all planes instead. Remaining shift
of one pixel is already compensated with scaler phase shift in
sun8i_vi_layer_update_coord().

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09f668c8af24..ad036cb9d88e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
+	struct drm_gem_dma_object *gem;
+	u32 dx, dy, src_x, src_y;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
 	ch_base = sun8i_channel_base(layer);
 
+	/* Adjust x and y to be divisible by subsampling factor */
+	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
+	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
+
 	for (i = 0; i < format->num_planes; i++) {
-		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		gem = drm_fb_dma_get_gem_obj(fb, i);
+		dma_addr = gem->dma_addr + fb->offsets[i];
+
+		dx = src_x;
+		dy = src_y;
+		if (i > 0) {
+			dx /= format->hsub;
+			dy /= format->vsub;
+		}
+
+		dma_addr += dx * format->cpp[i];
+		dma_addr += dy * fb->pitches[i];
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.43.0

