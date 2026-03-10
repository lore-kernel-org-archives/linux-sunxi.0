Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C27385501
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112846; cv=none; b=oqkODNQPJUfwCXolO60xLjV9iAPIFyNkQLg/seusBmMOvlGcCNr29t+M/4BVDLZTpv7v5Q7CURxGEaIF1Ko9dgh7u5XAtwGnf0BbyHwpF0Fbv1kQfeouiR1q302m680NoS3Tndqf7UlHm6tP4wQ8oABAduID63aK39HrqXETL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112846; c=relaxed/simple;
	bh=1ifAvQ9YQ7quAs4EUywvSzDs8d3qnqjGmcOWLHUYZwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXT0bGyqXHI2XlvqpDBkUwydeQh/ZE4PGhMgUeUJVFX9KjWYKEwqILZTRZJBLLfYQia/yHt9IObRP64QqjAEfTJYkb0Zv5OxuyX1mNDHeqeY+xNH8s7vn1btT0QtHBpbHJLIVvsOB/1PHQJmfWFRhTByrZJil3+crKaFKJHT75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N45Bakew; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N45Bakew"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso3678926a91.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773112844; x=1773717644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=N45Bakew6kBVQXcpuSNvvJo6GWi6tdtMMGkk7I3uNkUBIexmdV8xyFbfU7v+j/N3Ft
         30oUybCKlh8mCQkHvK8nDHkOqVLcf4bjIT0S0xS/B6Cvs41m9K2aeUUq+gLO5/M2FdbI
         2qO+T+BK36eQWTqvL6NJ/8H3tvKDIsM0ijQvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112844; x=1773717644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=VyKUizHUkEWOj9rnqReEXnHsAwmOR3YkFIt3PptRYoJyOnn++/yBnoql4/w+ZDkTdW
         I5orDWqvih3/IhpyUb/Yma1iUTzOl5Y2BDAkvgK+aK16NyagXuz/zpRVWdhVCCpU+uSw
         6HmkJLJhnsc4QnCmzWL/nY4lD1C1cfQew+tlyT4C8iZ7snKPov+gkTWpqZqIzT1MJsDg
         sd/HpAhqpaM7Vx1C+JsccVh7jaYKeMLD8Kh94qiu22E/VTjprRCAbmr7eHBiPC4iy0ti
         1K2+l9PGlYn+ArYFY5/WOu7rnmaT5fbgAp14iKn9IUQN8yJRFHjOfjXGWHeKVvhGWCDE
         zx6g==
X-Forwarded-Encrypted: i=1; AJvYcCWv422FjYuYjZqYs9H9ekdqB+oPDTBxHiYnzjY9MvIw+eKwZ2XlqqEJtlRlKvdtCAqIGWhC6yBSaDnMPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvK2sEUq8hIV4M+yhphKSnsrfqVE6VRUWw5akggTjELC0IIhzB
	HChUo7GfpCt6aTKfhd82rZVP6FLx0rVaTNAmCs4U/24haqzDMfLsgAANZjKZ9nV0YQ==
X-Gm-Gg: ATEYQzx/tzusiG+h3Blj2V9/RnCV6XGbnFeOwdOO1EtbAoBzGPhqBbXdnZb+nBR8jm5
	GWi8IFubsQeuXwMm6raytksxD8xsXBOF41JtvXj4K9lyH+37Pg/YgpoS+2N75VAJ5rV5b94Ucd6
	amnxinNwMB8JYKvtGMLH7giQm0XmA4ZEv2sCZ83vh+idDP83wdjXnRRMShUegeqnQuFzc/UhiDs
	5QXIVYwxDq4b/c45iNTHK3v1SaL3vw0FVI+RM/Gk9MuSI102V0jbT8wlca/9s2AjuO1+gsE5DCj
	AGE+tRInv4DdKrxBzlUo0EFa28rFWjy/se16ZOoYvze/uYs3IwhUpqjsbthiJr5ToS+B9LgQWuQ
	ODrtgts1RhFAOmU3xTlOb3RHkAuh0SX0B46En0dpBdjqlYqo57IR7CVxxnVVTWu1FAxTbrL7Fw4
	uGsSnFb5dbpjik2Lo6b8zc9HSeWpoo6V2OaemNQ6CG1vK2NytTTBxlOQtyHXcFZgRQZ4m3NWmS8
	QhjURIM
X-Received: by 2002:a17:90b:5252:b0:359:9bad:13d9 with SMTP id 98e67ed59e1d1-359be29eea6mr12192211a91.15.1773112844479;
        Mon, 09 Mar 2026 20:20:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1154608a91.6.2026.03.09.20.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:20:44 -0700 (PDT)
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
Subject: [PATCH 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Tue, 10 Mar 2026 11:20:05 +0800
Message-ID: <20260310032012.2542334-3-wenst@chromium.org>
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

