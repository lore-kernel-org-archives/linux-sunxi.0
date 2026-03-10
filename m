Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E23B8D59
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113151; cv=none; b=HGKTuSNrulo8Bx9X3L9i+bNtBEl94HcpbYkmS2nT9sXTDfdik6rdagBw54O8JAxkKX9rbet1C/4uzQdSYoJHWllgqb2HZyLTnU5DjQezNOausB7MxNvuKoeVgnKApJiiAe7bLuk7DFxtApNK3ZfpWREsIYQuyG7j8k9oI6jyEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113151; c=relaxed/simple;
	bh=1ifAvQ9YQ7quAs4EUywvSzDs8d3qnqjGmcOWLHUYZwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5mFo9vDVk29Un/FFwayvo6ygK3QWed8dOSwOkdrMVR0H/k/AP8uqSOZOFXvAcKy/G6poUrCvT3OUWk1bG+UN6Skc0+3a/9UAAZ0sEwm3k1XCUqR/mT1vpYC+M9zhTBMZ/vW/boEfvf8gZd4VJSWhKbq5hoXWShsiIkRIEvqwv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HrdKPqRE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HrdKPqRE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab46931cf1so84671915ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113148; x=1773717948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=HrdKPqRE+vboh06LAyXCGN/uQO8gzA3TpmM56VCPlNcvc8FAZcI46bbMTvq2fZU9of
         zK17WQDKzDeBNOBAC4pd7R3Z+4OtqBT4W2cM4E/sfr1WoBVswmtU8MsytuUWQCJXp6Tv
         YH1UGI0fJzKIDGd59IzZAx9OCdd8DB2sufytQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113148; x=1773717948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=O9ewV+IPhYmjkd3l5m7nY529mViZV5fRxowKKAZ6zyZDX/QTI0tscO5WKKc/iB+Olj
         tKFeR97fFptMAx7/4EUtPNpWeZnq44oIxxAXzJTNZZwfEP4UkWH8T1c9CDdPe73EbIso
         xKH18/j3oWWArssL2ThT4YUnQEG2QbW4lM+y4OcbabIk7yx1sY5snhNy9N0rxEjXhZBv
         LrT/2qM0y0HasFJ+W3GzaoPVEZpvSz9ed+BDTEMGsJkTea8Ym0KH2u6Ateeh96Tr8uAF
         xWhev78LNk3/S6/MtNSteB5yWYzLCnyZLiQigxOZbwRHOk50APNB1lmym+A+MMZosum1
         UPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdLvuJt0+23BP+acHJWBF8btViwv5sDwJzrorg6VNyTYSQ1sMRRbIlfF87oEsqYNJ7I5s1dkPqXUsgvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGkyfiFRXt4iFvWAhzAGevT/oP/2rVNNi5sWNJ6A+eCN8p7AN4
	83tZMk9odG3V7j5EDw6YRnmDQFxAdzHASrVNI9j6jIsun5PE+JeodwHsv6vD30t8AA==
X-Gm-Gg: ATEYQzzQnp6/No92GLIdyj//GVb1EznCgw0iYTo62ds3f6Fq5pd3kjr6VAuVZGXrA9d
	EsdvGyQmfIzXU6XRvuW+6Aqgj1vvkxVqHMdL/m8Dq+DHrE5IjYEmo75VPRqHcc75zvAwwzKAXEt
	Ubn2C0npjtVSLgsrW2SK7V8+Hr2XjoIlp8Bz9eA9nmqR6aN8RCF88pgz28/MuRyRj2OcxpLVavO
	NA5vagjcL5GwnLESgQ69wiZBSamIwsxICyNGdHcBmZCGb9i8UWMR8N6n3L41ms+pxdgoLJsp/89
	Zj479oitEhpAhxgnICFlS/KOLy/5Ec6InO15EFies8r0o1R4xjVLKB+I37FMy2I4kpHcvglcP0h
	FLTK720zcf14p4mZkhyQxg3lqKEvOI35K+qAeMCI8UGjdeoNDYYxYeO3i/0iJ5CP0ToLAvnOZ+0
	SQfngheMUYOWmCOPFHnzq5D84FhtETnCKzoFM/pGYY1N9llD0/d9WRxvMguEBqzMQHzNQWQzHJH
	MRhJC7OT6i4jUntYgk=
X-Received: by 2002:a17:902:da2d:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2aea197b887mr18842765ad.3.1773113148339;
        Mon, 09 Mar 2026 20:25:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:47 -0700 (PDT)
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
Subject: [PATCH RESEND 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Tue, 10 Mar 2026 11:25:07 +0800
Message-ID: <20260310032511.2545500-3-wenst@chromium.org>
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

