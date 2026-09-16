Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195E3AA50A
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529635; cv=none; b=W6QuIGb2LjFrSQsPP0D8JeuvoqOH9GKFFLCZvE2YYkLHTD+ZgenyRwu9cbUZw61MitWe3W/R25sjqX1Tcv071fAz6RiVlXShbcPaNqyW2hKZOAhGQUQg44w2YR8X+nq+Keid8TOYVETe8BpI3esOVrrc9Mmyak3wWpq++uwd2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529635; c=relaxed/simple;
	bh=qbPaYJBirbvT7ihHw211bCHk6KPsVXJrTqNHUfJUxcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXXzzU4pXeJsmf4qWo5dLswq3InX9hQI1sevYPRg5wcXGs6vMEAM3mt2SJ1oSVaiylHhai67JI6mDifkffedPQu4uuQhSbrk4pkSi4BQLTbkFXyHy6yaXCshfBk8pk81m72Jk1uLtUzr1sljBdtYTTHlil0s0LXXbeOy5qOragA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J3cl+qp8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J3cl+qp8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso460385a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529633; x=1790134433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nb71HvzDE3B3FVkEVJ/TFE9xXljAPx+xdoqH1xLqTX8=;
        b=J3cl+qp8f+U+uclkemHb2Dyu2xomkO0U790/vfe2qev9McN25A1WqaG7LjGboC6tSm
         cADUqwnC1R9ZWrgohRnLkl1syQ4AMzLOENGyNYeOfr23oouyWIIBsVkMTDIT5PqXNj5K
         VtXP7352W7xC6NNuj+dDCFNXFUGiUJj/wB9+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529633; x=1790134433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nb71HvzDE3B3FVkEVJ/TFE9xXljAPx+xdoqH1xLqTX8=;
        b=BIgwX+9D7T8rOfZQOQYI89/IqQlFlCqudLk+bwo1loyDysxb/RXG7FjAlltgaAnP+t
         AgUpUQifBGkJWWdE+t9rtZVWSejOf6pSbgBmgwgtroLP5yu+PnI2ZkrPwJVcuEOFHEs0
         HJ8/2jPSMrTDTZZ4DvlxFBQHYao6+cecaNyNUWAVlC+H1NVHPFhBFur8COz/I3IE1rAD
         Z1z1HCZpWmkyi3oM8G62Jh0vx5bmiTYUBh6ri5JjL2CCWAn8MX45qt/iNE/Z0Jb+O+jF
         OoBFopsm031AhIIzklMea5Er9p/iZB484qT+abOLMnzPpCOoKYhtiHCRmyn/riYgCXr+
         8YTg==
X-Forwarded-Encrypted: i=1; AKwUvBxIdaEexroVgelzycgODDfwANqdD11Imk/2CPXJlXZbnpOl0gK+Ssh/VqWyti7YZIe1bR+1w6/zF5G86w==@lists.linux.dev
X-Gm-Message-State: AFuF++nybPs6PhB/HnlrO+dxy24SuWQt9TyEVB0G/UXJK+JDQCxaQycP
	EtG35AlJXYHWtwf63I4EIoz9xQryY+pgFMr0VVimGf60jldmR2rdAy5ww1SlZe9KxQ==
X-Gm-Gg: AYBFou1lPgzcFQWqaalYscjOtDcW5ndD4Ndwi/xcD5S62+cFiA/sqPF22OqX4uTrODR
	vzE2Wx8sF/GEbejoFJlEBkhQTx4jWoJtwt/qm9ZJms0lidSvluPR108SNKojngqOsS1qI9fklWg
	pb+pOGGKxGYA9ruEfwr3I4bIsq5ulx71S+7UceKRAvj+v1723kDYMk4DRRMKR056yySrJJ2Nd3y
	YiMeSAL42LuW8Or/WquxJrM/b7gArGQm0LUUP8fnFV4w8DseP/Ijk2maN85lSHECDje95ZWL95M
	YNOnKgKMwMiipTX5XdLpH7B/z0hjGiDsizgSXA+s02ddYjONSXe6fMXZTerAf2Gy84//8igBiRB
	mz5I15kg5SA8MpQeaGJbKpK38pyUfSLHM6MxWj1ivRjeV/WZF11P1kkNRT3ZcRb7nxMgzzt7yFV
	LtNMmDquSIlUVdG7NtgNC7+HppUfMkA37qr/i2UjGJfjJqVG9iq8xXwCUudUTV0X3O2P+FUmIB+
	Ncx3s9aEukSCzLg0jJLy0lg8729ohnjlD2C07iLm/t4s1t5TVvIF8d82w==
X-Received: by 2002:a17:90b:582b:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e1e4c54fcmr2477670a91.20.1789529633211;
        Tue, 15 Sep 2026 20:33:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:52 -0700 (PDT)
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
Subject: [PATCH RFT v2 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Wed, 16 Sep 2026 11:33:25 +0800
Message-ID: <20260916033327.3054126-5-wenst@chromium.org>
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
2.55.0.1032.g73a4cd73de-goog

