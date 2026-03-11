Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A393B8959
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222604; cv=none; b=dxZvju3irZPFKhyU+WEbj52WfoVpGEjNl43uK3fGJgPldjvJnXg3/CvB0d/kolhH7/v1JT6bKhqpCuwaGd17aDyl3UDzG3Agqha1liLTvv1rMl75Tilkq4N+KwzHQguhkYyBx7pXxESo3+OtPNq7XVZqZYS8i/+e0J5eoPlomao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222604; c=relaxed/simple;
	bh=4pQgi2Z3oYVv09c19L/ahzU+DTz3ubvyJPz6+N7R/tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsdOyBDYCteB/qkoV8HzNY26Paj22rU4dO0KhCFbLrWPlarklr5fGzQRIxhdg4+kFZrK7gq5cLRJKE0kNuluTY7pPdcSEPYMQBj82CYqXDOXAYR00nvsV7Ze93zZXHNo3cMGL15JVjIsLZgpDtYEVCGfFlYViMrXqonosofdiis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MwcLhDsv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MwcLhDsv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829b2019b39so2474982b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 02:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222603; x=1773827403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=MwcLhDsvdsrPy20aYFeMQLSW4iSE4kABAfv6d/FydqVyUDFVyia1WUQwyXIj5t9C4u
         8rlYTpsL80Dq/BOpEJZz04XduJEHyXj45ZxgkGrJNRQQPG7NLWGlOjeVmMeHS5qix5fD
         yOBNahyM+INRKzNLKWtBMFDQ7XAXRzUNqd0UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222603; x=1773827403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=c7tJcpWx+5Gd4gtTU2KS9UysCw3BOoeEIP3o+1PmZQK30OqWkZAdhHGHHASDgHOG4t
         sXUclFlJ58F66Mii1RT6DmWqmpWDCrkJqn7wBJG1WHf1kekHf0JGrnCWP4ZhHKzEB1CW
         zS4ayoMdv9eY8XpiEthVolrIpUZIfeDBgnkQW6w11BQwTogK8LC46CSLGBiF0UeV0YzM
         FRDJHTHbyzFgVgQ5c+XpX8o7QpWNrMgSKYJa7ffQsjZbuGh0UraVAE7wgyPYVGcd24GH
         9/mxyrnqXTmRpXd3JIE5VDNFAu9E8sFvNsqHW+HckcjOD7N09GaQwAstgnk31X0Fai3c
         4K6g==
X-Forwarded-Encrypted: i=1; AJvYcCXm4pF0UHY9IkvL7i61ESxnlcF3nwoQD4+taTe1mEUCeFFEC5COdLC9fg6tcOaGAH7Rvxzv9NaxkGiAPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd7SpTU9w4agvgAoDMYONG4vy7AOp1mTnjTv75o3hUyUIYLBDL
	Ikgnqaydc7bABeg+eVhBNrup3hGYn8BRJQcCvs1s1hZX8ncTh8roiiGAVXfffiIQyQ==
X-Gm-Gg: ATEYQzwomdfSRE2zIHKkK647YQgSPOSfKyAWDPZHKrnvrCcxbNMgNQxIrZWOix4tpD/
	txIeTD01azXxlIFm4WWR2aDTosAEh7zhbWgHdmIPgAM7RVmoP4bb2CTb1P/jZaQi/lg0+aTpSxR
	C1EYrJ5y+ESVE8wOP3Tx3I4DX5Qt03FL8VSYCJbmJToUiR1yyDfsHJfT9D/HaYRXvnYLxNamlkM
	gEHBzMT66iys+wyyxanstBTzUg5lP2OVO9klrHah+mWr2P0KoNb4Bo9PXhrmawr++KCakfSujTK
	TfU4v7WW++oG9pXQ1o3Q0yKOSSP5xT3usfknGcVVYS2p5fLy+bLusuoQS3rla/EPQdvq/rzxp0O
	+jZUswPGx8IPnrZ2/+OrI7aRNZEVCvadyv4viMcE9EOOwdTvNsVpSScd+Q2nqF7VTGWOwN0usu4
	GUrKU2V6VSs3DUzP+TYWlFpS+rdm+uDMFhn5cM3xyY/KMQ45YHQCMVBx+0M+wNckQLIW2+EKy6T
	DwNCRSH
X-Received: by 2002:a05:6a00:3006:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-829f70af1ebmr1872729b3a.14.1773222602308;
        Wed, 11 Mar 2026 02:50:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Wed, 11 Mar 2026 17:49:26 +0800
Message-ID: <20260311094929.3393338-3-wenst@chromium.org>
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

Support for a dedicated DMA device for prime imports was added in commit
143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
This allowed the DRM driver to provide a dedicated DMA device when its
own underlying device was not capable of DMA, for example when it is a
USB device (the original target) or a virtual device. The latter case is
common on embedded SoCs, on which the display pipeline is composed of
various fixed function blocks, and the DRM device is simply a made-up
device, an address space managing the routing between the blocks, or
whichever block the implementor thought made sense at the time. The
point is that the chosen device is often not the actual device doing
the DMA. Various drivers have used workarounds or reimplemented the
GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.

Add support for the dedicated DMA device to the GEM DMA helpers.

No existing driver currently uses the GEM DMA helpers and calls
drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
users should be affected.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..70f83e464476 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -146,12 +146,13 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 		return dma_obj;
 
 	if (dma_obj->map_noncoherent) {
-		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
+						       size,
 						       &dma_obj->dma_addr,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
 					      &dma_obj->dma_addr,
 					      GFP_KERNEL | __GFP_NOWARN);
 	}
@@ -236,12 +237,14 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
-			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
+			dma_free_noncoherent(drm_dev_dma_dev(gem_obj->dev),
+					     dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
-				    dma_obj->vaddr, dma_obj->dma_addr);
+			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
+				    dma_obj->base.size, dma_obj->vaddr,
+				    dma_obj->dma_addr);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -432,7 +435,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
+	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
 			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
@@ -539,12 +542,12 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
-		ret = dma_mmap_pages(dma_obj->base.dev->dev,
+		ret = dma_mmap_pages(drm_dev_dma_dev(dma_obj->base.dev),
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
-				  dma_obj->dma_addr,
+		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				  dma_obj->vaddr, dma_obj->dma_addr,
 				  vma->vm_end - vma->vm_start);
 	}
 	if (ret)
-- 
2.53.0.473.g4a7958ca14-goog

