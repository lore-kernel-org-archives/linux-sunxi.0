Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17E03BD653
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113159; cv=none; b=dISJJbTjdUTF9eDnBFdSPIpqDsec1bM6SqQdDqjTX/KtaVyAPgcFQj+c/njpppHa6xPxJ4c2H70tFNZQ+/8hnbHUsuPYHzY/I9w9bk0fW+Xxk2OP6n/reuid3i1Fc+U1euWNmT28rO0sOMnEJdySlL7gsHEJvBqqYpr0R3d8zWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113159; c=relaxed/simple;
	bh=rfD7Le/WZjv74zhcuW0yU+5NJ1RZ3lo7zccKLiSyBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0JAZGCwo/TOSR0SSar4MtlpkqKYMTbEQBFoYl9gqVImJxlUVYvsAtbSzX5uAaLHQQyuP9vQymu/qsx7ycG0T2lT0YPpakSItAm3aOHcAlUWlSq2R7EvuDzCUVMY1QC+lMIm+j+4uCdzrClQR/KAH1kabN8oF5K2su7Ha/nyEqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PkKw65oZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PkKw65oZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a8fba3f769so53812105ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113155; x=1773717955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=PkKw65oZZ+tLSuFV7rPjAJXgzkZHSPiIbNA7VLD3rTldv7BmwU4cb8fnNQpvSHJtnd
         Q6A4NF8OEyaP0xoWe6HCPh51RLmBlWWXJeasjXzWwl+fOYis/65A4jC0mxQn9s3lAdPh
         bSsNJjfS13rgUYHX+HekNp9h4bw6Q5p/RpyWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113155; x=1773717955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=Uomdb6WUhZIKeuXEvxE2aa1S7n/SFRDGUOPJ5WE1H4RpNhhrbl9jNC5k0Q5cq1eIvY
         Ugk6Ulatg4rGTlJyI22vA86tgHrcCvaOpqs54XD+8SSvoK6ri6GcMZtL/HJgKsoKC/kO
         nBxPY/gTiH5nXb3Q78Q3pvDskeAQ8VNZy53rSorjHAAX/c6S3WCV1fxTBHGysTF0FZoX
         fjrhBg1AShq3sV+mez78Y/UwpHYhPnBzr7wmHXJD8rpFOQtbsju/X51dhJEUNFwh79Jt
         gmhiJGBj7wKhGyEQnmObqSm850S6P1zjBeB+g33qhReTind8vRKrhlD29oyJ3NNDE/92
         C3iA==
X-Forwarded-Encrypted: i=1; AJvYcCUnSPNF/8WuBNYW0/R0+Wlmt2vtHz9UbTLUbtHHq5L88qTKEChqcAlb5RwLvEEeCrgNZCLW7S6qld0JLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmzOMJCMpdP+B6p1YIjJ2KbxYUqqaGl1rpCFPU/NVFYD4CD7Jr
	NDN8ae3hLBFNmk6cvRlcK0jKl8Ty9fEIwZz/I+UB8qRH7bghhjQGFugFgmvUH+K9I6w3UZiEgRz
	mdGk=
X-Gm-Gg: ATEYQzzsPimNDpN3OBoZ2ZoH+QJGISSKNT0PHuKFY9LmKclGgI1TRXuk1Fph9u2SZUj
	5kcpbcT8bTQvh9qfgwyKsmGcI/solH3bukKtZvTxMxxwMQTy2DiNE4qZXU22jaSVG4twQOAK68K
	J6TUrdUvbmxdSBN6xUYIWmJMQO3/VbMyWXwI+4PM0vy1UwG76PNHP+Mo+scobkeuTAooT/CTu37
	QTBM5DQNEHS5vfPmARtR+Pg0jmIROO4+7H/CtM+Y/Cg4ehyO6ZM3P+uc1HLEX6m9okJGes6asfD
	gQjWRRAMji2a97UoPNAkrrBvw1mFei0YyOQGeZIOdgn4pk+JRj2ozAU1nVMJTMDVE1aWOnS10Nh
	X0PB4E16cWESbje0muwK9S5JiP9gQ3P8l3Hxf5v7geKROaOVOKiRgo7EIWG83w1t7NAUUG1EN3E
	Jo9C3WCXdlXbs/6F7ZnRrsxt0l/wdNKu6VbyRJPSY5CiVok7739TdxJcIakUoxZr9zJMe+yx/kH
	B5te/kD
X-Received: by 2002:a17:902:ec88:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2ae82459ca5mr139254635ad.39.1773113155156;
        Mon, 09 Mar 2026 20:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Tue, 10 Mar 2026 11:25:09 +0800
Message-ID: <20260310032511.2545500-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i DRM driver deals with DMA constraints in a peculiar way.
Instead of using the actual DMA device in various helpers, it justs
reconfigures the DMA constraints of the virtual display device using
the DMA device's device tree node by calling of_dma_configure().

Turns out of_dma_configure() should only be called from bus code.
Lately this also triggers a big warning through of_iommu_configure()
and ultimately __iommu_probe_device():

    late IOMMU probe at driver bind, something fishy here!

Now that the GEM DMA helpers have proper support for allocating
and mapping buffers with a dedicated DMA device, switch over to
it as the proper solution.

The mixer change was tested on a Pine H64 model B. The backend change
was only compile tested. Though I don't expect any issues, help testing
on an older device would be appreciated.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 27 +++++++++++++++------------
 drivers/gpu/drm/sun4i/sun8i_mixer.c   | 27 +++++++++++++++------------
 2 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..a57fb5151def 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -798,18 +798,21 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, backend);
 	spin_lock_init(&backend->frontend_lock);
 
-	if (of_property_present(dev->of_node, "interconnects")) {
-		/*
-		 * This assume we have the same DMA constraints for all our the
-		 * devices in our pipeline (all the backends, but also the
-		 * frontends). This sounds bad, but it has always been the case
-		 * for us, and DRM doesn't do per-device allocation either, so
-		 * we would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	backend->engine.node = dev->of_node;
 	backend->engine.ops = &sun4i_backend_engine_ops;
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 02acc7cbdb97..4071ab38b4ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -536,18 +536,21 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
-	if (of_property_present(dev->of_node, "iommus")) {
-		/*
-		 * This assume we have the same DMA constraints for
-		 * all our the mixers in our pipeline. This sounds
-		 * bad, but it has always been the case for us, and
-		 * DRM doesn't do per-device allocation either, so we
-		 * would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	/*
 	 * While this function can fail, we shouldn't do anything
-- 
2.53.0.473.g4a7958ca14-goog

