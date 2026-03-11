Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1D3C3458
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222613; cv=none; b=mR/6zjr57eLdqgIhMxcrjvhaNVKtuOoKl/fLsJXDG1Lh2Izc4zpXdblt6yzxJrvM+ATTtrvXIa07RAfc/tVivCc7VPm8hEQXfViE2lTm7RC504BOziowFURO9IJodTJb7/SsLnEcbRrD8rsvB0fGylI6vKT5Zkv9+if4Jgltwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222613; c=relaxed/simple;
	bh=rfD7Le/WZjv74zhcuW0yU+5NJ1RZ3lo7zccKLiSyBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khWSdiypJ5Aa4h7D76Uip9uV9CWMiGe0LuaQwvs7z+8XlvyZjchoZv/mlGkurjJ8J0pU6bO2UcJvYe1o+Ixm4Otdf8lONY0Z2sIsV8npd2uD6S2O/muENavM5jZwr2gh284WvEOUZmEgMisUrfE7rtHgfzsb81cElcn11pTy78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MkKXvbTd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MkKXvbTd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82984c077b2so3213984b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222610; x=1773827410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=MkKXvbTdd8REnlm92cf9Uf17y6aXXeO1PUAnRA0FxVAygLDOuC42AbHcM33Ws29XI3
         64ZjMoIGyHVOXRi0V91dX4t6aDXbBsbs44ubGptSBV7fKnQQ55E5B51cMCXbkdzfemOM
         Y9B/v0EucBJicaVy1yLDJouls+2WlfWdie7do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222610; x=1773827410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=REpvyVuUQPkaMkpGTY9wJD4Vzw4Bc+bWyUQNSqMBEycCUCA49HZyJpRhDWA3GMKd7K
         3AmOTwGT7SZo45W37zoskwZGbmBlBbyhRnGD3O3QL385QPajC6WntU3x3duUsKJ3dOXq
         kl0kCjFOV2B4GL2iVBIOPO3p55vNcG22/qaLkCsf9SBeDW/CAk6F+973fuvsGb7lCiLL
         VBakKsUwz9k1krJKYNbHY3FkYkFkXMrg7sYTLziO3U/zEo6NhRaazClbogSv5JRm+XMQ
         wSu8QqXUq4yW+p3nONdKt9lSXKq7VinYY0cWQRALNrY++THgcd2VXmHWWeyEIrJ+sKNj
         tupw==
X-Forwarded-Encrypted: i=1; AJvYcCXRjSLn42xSOn1nX+bm+3V1PzCSGBsaYDCNQLAMwuVXWYpRqlkVzAvfskkInnLFfOsaxWp6vglO+uXDtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxuS/eBnyuWceilW/rABB+cgUaeQpg+Ogkap2yvmxWxhZ2agNw
	2AGy0/37yCREG+S49Hy3g7rTZXTrXEfBdRB7v4GqFrdqBPFQMQfksGltHGY3kcJ1+A==
X-Gm-Gg: ATEYQzwE/zSpsQ6Iy10dc53+cgnpb9cP41yHl/+5lEnEQsk6KXShnqi2PRjk5yiUqt1
	3vgJcUfOPAnvTVsda/ID57/TlZbCTjl5cuZgOYn4F8Wtq0LzgIOzfzt5zds7YxIlSoknmx13KT9
	1VUC4fOg9v2ZV3HHz1ndkxFwnrnTG/INAcgw3dGOm+ZH+pjccygOFqLpuH8yTBIg6VJTQPLwXw+
	YcLN7zFfbwOnXHMm+2OhV5USWwtSlVsq6vajeJudGr7bh/wRdQTbxCjeg+B5tN88ZCnC3+jd84m
	t9i5ixJzsxavnNf0Jf9+ASNveUc2eCKU852ROlzJspGCAJ/Tk32n9gUMEPLboksNJlDzG3Dzdk5
	gIgQqM4PeYwDjQbBqFGpKJLaHg5V0ePjVi16BdZ66pXFbLxQb4OLG4SmkJHveHzgPIAWy2XQoY8
	iAz6j52EcD0Xfce0gaLK5YP7rpM5nUqqWqUHureEv/1pJls2XYSR013GCj20hhGPSxcXhaKo5xT
	iAeynzy
X-Received: by 2002:a05:6a00:950c:b0:829:6f28:1d6 with SMTP id d2e1a72fcca58-829f6e7b408mr1826676b3a.13.1773222610050;
        Wed, 11 Mar 2026 02:50:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:09 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Wed, 11 Mar 2026 17:49:28 +0800
Message-ID: <20260311094929.3393338-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
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

