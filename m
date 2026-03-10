Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B656399019
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112854; cv=none; b=dFdcoh3l2NYaIDXADKzObh6J8GskG/0PtC3VFKBtTyaGUsJ4jesv91KOYisNFK/ascEIUmR3U8sbdtPZfM9gmcCbzQunZhX8TiNfySpcnziGd5HJs9hFCtEInPx06IiNucCxhOGIMkgZxOp42w7VcaiXye9/yitaTL+nbgiWKiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112854; c=relaxed/simple;
	bh=rfD7Le/WZjv74zhcuW0yU+5NJ1RZ3lo7zccKLiSyBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW6Yh6/LTjWAo5n5/hugo3sSbcj6VX3gtn0BGaeAOQ1N7UPysEAEja3Bx0O6+23X0mw8sj6hnQXsqcGIFZlm/3p9Gh5oYROPah8cH+jZoZFusicvSI5GF/MalCyrbcbZrJ61wezRXp3YwBaJ3/pgxQLsOGSSrU9/TCRkKRc5Fcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CNbBKVAv; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CNbBKVAv"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so7471032a91.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773112851; x=1773717651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=CNbBKVAvXjBs++AZUUmglohogTUkunAgoCfWpkwcw5Ezn1lVzDrZtXByRJQInAKX6N
         xDISeYh3AmxpRDsERTgqBdaTsQC6O2nZr42VHYluVznEup0lkyYU8r26D8lwCCAieNdY
         lj/AbJB7fmc4Gp91AcUNahgiv9Ne//HLSQlqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112851; x=1773717651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=PSlwEhbMcGv+YWbxlF8sB/4r1pywTffi7I5RKmgGdWpjYy7Q7xdcJn3qA7A9l5DjaZ
         8xb43d/hbXimhPMuShxpVZQOLQ1XRxT0st9PdEYGVsUrWURpp9CdgayEsQMZqBg0Jg5K
         f3mTmFpRiJ/W2WfcNpzb8c8fw4RssrBNM3FsORqalpLh+zwAk+tlaixqxSbE567NpZlw
         /6fae62dxGyelJVXpiAQhyNMYY6pY2bS2TrGZw+OzlPe1vbKy0s1GtQbOc+Nd/PyIHNG
         8CI+1FS7epnSu67ymwgFj5jgsfMijPG7qbvVAJzXFYxaQXW7oPjBU8+05QeQ/q/he3GZ
         rsQA==
X-Forwarded-Encrypted: i=1; AJvYcCWkluRBYLXaDn7XCZ3zA1MfPRWpUM/gmgwesfEcFHDUfPggYXvnwb1AP9wnA5tg+0SZdpR8J7NnPCiB5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHAVgKwAYcwe7hjAe8UstjIymncHDqMj256+GDoy6yc5V9+NzX
	OW+VJkfKiwrHQMUzFFyir+tUorM4FGm8oEM/XyYLjhwO7+7mAXuyS3K4HSkD5UX/jA==
X-Gm-Gg: ATEYQzxywahnm4+JOjWI+tXf4/tyBUEhTbrpxKG5VorpoIOqEmiQu7t4OGDr4kGa+0Q
	JmhemrnojzxhwUIPY/40LGghvYEgAz8SxPt22mQ5F2xuzczZqnRTOtn/DF86K5P+JWwdVCF+DAV
	jk3N0h5LLN9jBc/dM4V+EISUemlDi65kw60vU82CqmQNHz7O8AMGtEekTmm8Z3jVpatWXSlLUi+
	zH4meXiDTqmLfo0iuf+NodKwCa1xJJL9tu+fRpZJzO05xVmDiL2chC7+cjkR7njhaqjY1ncvJAw
	B+0cDBkc2xmqzkcPJEDHLSpjgQevUemr6FU7FNIOATzCqWtYWpxpjsFJsz/qdS+SvZO5NE8xn+E
	ljhzpPh4I9wHTCdDjG18+wZO7i8Jcrts3jY5ZCb2l69tANtVFtAEeLwk9kjsy8I8gjoDtgFanQi
	Uh5+/Z+MSAu0OqEW8w+kLq1Ey0IV0YpJz+mN2L8A40A5kut9u7FVBlhESr03eIhVHHzPiXHdYRY
	/t3QuZn
X-Received: by 2002:a17:90b:554f:b0:359:7b9a:2cec with SMTP id 98e67ed59e1d1-359be133b2fmr12308150a91.0.1773112851595;
        Mon, 09 Mar 2026 20:20:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1154608a91.6.2026.03.09.20.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:20:51 -0700 (PDT)
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
	Samuel Holland <samuel@sholland.or,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Tue, 10 Mar 2026 11:20:07 +0800
Message-ID: <20260310032012.2542334-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032012.2542334-1-wenst@chromium.org>
References: <20260310032012.2542334-1-wenst@chromium.org>
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

