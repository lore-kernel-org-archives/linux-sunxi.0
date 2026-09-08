Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9151121A
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858490; cv=none; b=c7QH2QqeVP0hsT/iUi+BCxfm88dOEHQcjLS28KEiKkYAbkA6bFlmJQtM1Vf/ofE/Y0tGyk/XVmCw+50Ro2CWA9ejJI6yWRQdy/3p4nADpTvx1Ee6cQ1lwIvLKhuC50VbAGkKVXAVqsF1JZfpj8PxG33h1SUuvj3E9tByU4olDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858490; c=relaxed/simple;
	bh=xMbO6EhJUi/RdJ3ufWkeSaYG56Ls5TGr7006uLTOZQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1XqzOMCig/1dwFzaVHpoZ2QnPbdldSs/KrPafLEyeFD09IQnU9deUR8Fx4a0ph3ioLFV67ZmWFomDMSZWhbaU/pUZzru+m+i3BTqy+Odr9+coFhUF07+Xaj9kY410KHamrwI0XeQROaxpx2p6kIyIhZtruvkCqYLtO/8obi5Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BnKwVQQo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BnKwVQQo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso3570128a91.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858488; x=1789463288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=BnKwVQQoa/HkK5OZ1uv8EjB5FNgimdO1WyF42VKY7C7QE0pMdCSTu43wtKjWZm3zPU
         lSneFuLXqsLBj5jwGXF2YBHKdilNn37irr0ISfkmX33qsU9YDSSzyE+GgYiBlTwwYb74
         byHVQrMWBFlOQW0o2gHmrdpdnKVITGOhfqqP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858488; x=1789463288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZHoy8f3OpVjs16q22My2K8o0ZC/itaQqMauUbs1Www=;
        b=bLd8U1wwJjuqOR9PAHYi/LGvOZXnjUWjGlkqO+mdBMtLmxYrWHHi1wXKdB9JOp09aR
         l0gzY1RGHSeUgXMGbUZ/pU5Zr8VbJbYy2cuITA1lS4TFgDW1EXdOSOTSEld+qd38gS9j
         3JTCw6KUeldNTESZCHsJMjNeXyrxY0DGCvTt9DWPYzbS8MI0fM065QoryIv6EoARdOoY
         RqZhs5Jd4OINYqjm74O+bmM7LCydkjzNjaj4xH9j03Txc5DuTXEb/X4XEk+sCIWdxQ8A
         jw3uvumgCtC7+F6Jx4Hq5QZPG/V97DG6oI0A5W8k7+y+3YzzgMW9d5HTdrHW/hzn7d0n
         AeIg==
X-Forwarded-Encrypted: i=1; AKwUvBzr5RzaxCiDZSaX0mLEMTljdBn+3a72l1mh3A6wnuoiUgsQ1/6y5lIH1sOL49wN4XBaTlYo5e7j1asDXw==@lists.linux.dev
X-Gm-Message-State: AFuF++lNqwyHipyMZXPDJw73XbGBiJCAFelbYRjeLrvApCzTERdXt3AS
	JlM2rQ7Yy4BIhSeb2SgrMYKh0xl9l2SbeFP7CudaTXNx4lhydL6KM9GmBY8WTQDMvQ==
X-Gm-Gg: AYBFou0mpJ1vQAaFNkpnn6PX551KLJP6Yo1zDGqbjf9S9huA1yHR+oLr75GNUVZO890
	mKZ8D0/1vcf/F+88lcq8Xp3b9XkZC7V+NjVKSb0SIoZRMcUVPvn0OoEox5vs/kOSmDRfK3lW4l9
	zxMq4msbaBhPGAwVtAqzWnCYDxf1KfzPsHFh1mOpH5QEb7CbdSbJ1BI4mjDVuDHws8HaGtpCFtX
	owMJLXLrauNgasmvNfimtyaOxetqHzZjzKjTK+381qc9KND3E+ygzVIUmf68Hw1ecKULCenx36w
	P/d7Yoc2a/US6NBv54dRBlIB7dKMUsWi6t91zZd6jjZNJTeGYKTLpx9Y+sBpBWIQCHEzAoUfJLi
	L0U3eVSogKevfTtu6VLdfeU+v5hBSVBU1l0uVbQ2+cIuErgyqwbc5ln78Inw1PjUwjkuKHcX0U5
	3gkwH6MdMt76N9piz8pTuIYj+zYjcQTWdRac+XM6a6YJYvMopL+NJ6xEuJPD2aTqwv6bVWQnIDu
	2k4TciK1/RkA+hi4XzY6CquoLAmrQf92aw094i9IavqKiKibP7hSpC77g==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr43384810a91.21.1788858488251;
        Tue, 08 Sep 2026 02:08:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:06 -0700 (PDT)
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
Subject: [PATCH 3/4] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:42 +0800
Message-ID: <20260908090745.1089143-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
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
index dea7404fe659..7bab75d5dedd 100644
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
2.55.0.979.g7e5102b832-goog

