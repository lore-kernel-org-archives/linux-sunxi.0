Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04443A9D8B
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 03:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112850; cv=none; b=jCVQGO4q1FYs5sw8T4RO/1TVbBWVpS1OmqA/DsiILEgpndBo8qZzjFvD3NnpJzVJ30gyzLqpJpS17PIl4qdFGwP0SpEgeI0jwW8BzoEW2fLma0zT2vXKvG2Qo3CD7u8+m72BnMG+GBhuhclVjsWAdd3ut7CcG68Ec7Tthg6vCRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112850; c=relaxed/simple;
	bh=ZUTtKhFYUcr1uwQQLp+Ulkj0oKOWmg5PTveRDJGrDZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ba2IqoWSSOm3ZEViOyV2TwL+DnuL2c3zUDnlwmnjlIpS77DcIpqpn+/9rJnQJrfUgieUVx1/jTkolXH3tGY5hpCBUsj6JSomzCvhZGDhvMt8D7QYroW78qjtk3/zLSeDhgIqEkMf9wdBfr1PvSkh65JxD7ADbHIFpJHAqvzpVrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JsvA77il; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JsvA77il"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso6734394a91.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773112848; x=1773717648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=;
        b=JsvA77iljugEW//c6zGzOOdOmfB5gVGlZ+Z0liOmsy9G07BGgmRFqnul68Xcaab/0r
         CJOqnf1BPkser7+CQVUL69D46/Zkc8J0wZONkv5nNtfyPu3S+hsMJ6wRAjlh1uYwrOPM
         9/quauQveFr12EtNlLIzJ6ug0JzrThNwJySfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112848; x=1773717648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=;
        b=IKKF9rvs90UUbPR5Mm9aGFui2PRIJp0Xz9NT4JUm6qWhhN5bZ1qUuA/gC3MFxWEa0n
         ptCKgYYA0bH6mpgHduS6A+DSOIdwgfS9rPo8HXHcXkuSm/n72JK00GI3u5ovqf5gy11P
         UD4OCiCsgasEd4LeslrxgJJlM5ToFsXjjSqNpvfmkCj0D6tx6B/Q3lo0l8DZDqSUJ/KO
         doA8gG1XRSeUOcyDPxqk4f6XrJlCX8zYEYsOEsSjrpnuT+fHlphjjTrrFiAqi/hyVgEr
         1rw4o8Q/KwtYNItXbGvMw/B0whZRkeWjw/Ie+OuhnHk9/iW9yzOyHs8CjU5bGW60p8Z+
         K/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV8IQffbD2gqk9vgpAOHKnCKcwQSYuKecCTOSER2rusmZDGBJtA+CUkBSIKCrTUdIeQl7EtxWabit8BQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfMIfIBxDEwG9UFwR+m/8eBI4+dgsi6p7VJ8YJXfnZ9zB5OTui
	eM0diUYk0u5fqJFtxdXJ96d6+c5yyaWAPyy98q+pImKrrU2xBvI2RCZgSlZF0Gc0Mg==
X-Gm-Gg: ATEYQzwEiQZGUQRUK1ff6hZx9S2lDQ6oy/FGcWoCzKy5ny/+tvKpJIgob2JlhwZsb1T
	1nExtIlhrRcz5Vq8C5SII7XXgRVP452wICYjOaCd09xOWbEHCGfr1QGLXZliX4rs0l+Lebpmwvv
	XpwRPS0dRHim+MHA0q6oK2jYf9Tif97J6deSqn885wocX2DOiEPTsgg7/5HsiWMiG/xB9MR7CLP
	bqIl+57857si9OlkFCrk0ZsoO2S7NKDkZba6ATknd2c3pA5brEq2BYlVx3GuPemS/IkVIwd0Iib
	KAIV+fxOiq5wtvchSrlNORhVsj/OIBoPWR5XMjraPmD9sdWxcec6Qf3FnjmDgiE3lPPbFym5I5U
	KdvZaD1LZ4r9w8MW/PPZSvD1CKsGc9WGQqb380tgvKbQwy3HD8SuIqUvyGnsW7j2Mg9rAn6jbx0
	A2ecDCHyDCtJk2zHDI+1Ph1XGPlsQjTEGy/bdq9urT7oZPDdNRgWrVyTndWMgKLwHA9LsDibrAz
	lil5Am7
X-Received: by 2002:a17:90b:4b4f:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-359be2822f3mr11872093a91.4.1773112848053;
        Mon, 09 Mar 2026 20:20:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1154608a91.6.2026.03.09.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:20:47 -0700 (PDT)
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
Subject: [PATCH 3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
Date: Tue, 10 Mar 2026 11:20:06 +0800
Message-ID: <20260310032012.2542334-4-wenst@chromium.org>
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

In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
drm_gem_dma_object, but custom callbacks were still needed to deal with
using the first device of the pipeline as the DMA device, instead of
the MMSYS device that the DRM driver binds to.

Turns out there is already partial support for dedicated DMA devices in
the DRM subsystem for PRIME imports. The preceding patches add support
for dedicated DMA devices to the GEM DMA helpers.

This allows us to just set the dedicated DMA device for the DRM device,
and drop all the custom GEM callbacks. Also drop the .dma_dev field
from the driver private data as it is no longer needed.

There are slight differences in the mmap helper: the VM_DONTDUMP and
VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
VM_IO probably doesn't make sense since the buffer is allocated using
dma_alloc_attrs().

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 5 files changed, 3 insertions(+), 268 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 351d58c50b84..fcb16f3f7b23 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -23,7 +23,6 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 /*
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..6f6db2e1980e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
@@ -29,7 +30,6 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 
 #define DRIVER_NAME "mediatek"
 #define DRIVER_DESC "Mediatek SoC DRM"
@@ -565,8 +565,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		goto err_component_unbind;
 	}
 
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		private->all_drm_private[i]->dma_dev = dma_dev;
+	drm_dev_set_dma_dev(drm, dma_dev);
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
@@ -600,26 +599,12 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
-/*
- * We need to override this because the device used to import the memory is
- * not dev->dev, as drm_gem_prime_import() expects.
- */
-static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
-						   struct dma_buf *dma_buf)
-{
-	struct mtk_drm_private *private = dev->dev_private;
-
-	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
-}
-
 static const struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
-	.dumb_create = mtk_gem_dumb_create,
+	DRM_GEM_DMA_DRIVER_OPS,
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
-	.gem_prime_import = mtk_gem_prime_import,
-	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 675cdc90a440..1fc3df4b5485 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,7 +54,6 @@ struct mtk_mmsys_driver_data {
 
 struct mtk_drm_private {
 	struct drm_device *drm;
-	struct device *dma_dev;
 	bool mtk_drm_bound;
 	bool drm_master;
 	struct device *dev;
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
deleted file mode 100644
index f059a1452220..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ /dev/null
@@ -1,231 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 MediaTek Inc.
- * Copyright (c) 2025 Collabora Ltd.
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
- */
-
-#include <linux/dma-buf.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm.h>
-#include <drm/drm_device.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_prime.h>
-#include <drm/drm_print.h>
-
-#include "mtk_drm_drv.h"
-#include "mtk_gem.h"
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
-
-static void mtk_gem_free_object(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-
-	if (dma_obj->sgt)
-		drm_prime_gem_destroy(obj, dma_obj->sgt);
-	else
-		dma_free_wc(priv->dma_dev, dma_obj->base.size,
-			    dma_obj->vaddr, dma_obj->dma_addr);
-
-	/* release file pointer to gem object. */
-	drm_gem_object_release(obj);
-
-	kfree(dma_obj);
-}
-
-/*
- * Allocate a sg_table for this GEM object.
- * Note: Both the table's contents, and the sg_table itself must be freed by
- *       the caller.
- * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
- */
-static struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	struct sg_table *sgt;
-	int ret;
-
-	sgt = kzalloc_obj(*sgt);
-	if (!sgt)
-		return ERR_PTR(-ENOMEM);
-
-	ret = dma_get_sgtable(priv->dma_dev, sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
-	if (ret) {
-		DRM_ERROR("failed to allocate sgt, %d\n", ret);
-		kfree(sgt);
-		return ERR_PTR(ret);
-	}
-
-	return sgt;
-}
-
-static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
-	.free = mtk_gem_free_object,
-	.print_info = drm_gem_dma_object_print_info,
-	.get_sg_table = mtk_gem_prime_get_sg_table,
-	.vmap = drm_gem_dma_object_vmap,
-	.mmap = mtk_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
-};
-
-static struct drm_gem_dma_object *mtk_gem_init(struct drm_device *dev,
-					unsigned long size, bool private)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	size = round_up(size, PAGE_SIZE);
-
-	if (size == 0)
-		return ERR_PTR(-EINVAL);
-
-	dma_obj = kzalloc_obj(*dma_obj);
-	if (!dma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	dma_obj->base.funcs = &mtk_gem_object_funcs;
-
-	if (private) {
-		ret = 0;
-		drm_gem_private_object_init(dev, &dma_obj->base, size);
-	} else {
-		ret = drm_gem_object_init(dev, &dma_obj->base, size);
-	}
-	if (ret) {
-		DRM_ERROR("failed to initialize gem object\n");
-		kfree(dma_obj);
-		return ERR_PTR(ret);
-	}
-
-	return dma_obj;
-}
-
-static struct drm_gem_dma_object *mtk_gem_create(struct drm_device *dev, size_t size)
-{
-	struct mtk_drm_private *priv = dev->dev_private;
-	struct drm_gem_dma_object *dma_obj;
-	struct drm_gem_object *obj;
-	int ret;
-
-	dma_obj = mtk_gem_init(dev, size, false);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	obj = &dma_obj->base;
-
-	dma_obj->vaddr = dma_alloc_wc(priv->dma_dev, obj->size,
-				      &dma_obj->dma_addr,
-				      GFP_KERNEL | __GFP_NOWARN);
-	if (!dma_obj->vaddr) {
-		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
-		ret = -ENOMEM;
-		goto err_gem_free;
-	}
-
-	DRM_DEBUG_DRIVER("vaddr = %p dma_addr = %pad size = %zu\n",
-			 dma_obj->vaddr, &dma_obj->dma_addr,
-			 size);
-
-	return dma_obj;
-
-err_gem_free:
-	drm_gem_object_release(obj);
-	kfree(dma_obj);
-	return ERR_PTR(ret);
-}
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/*
-	 * Multiply 2 variables of different types,
-	 * for example: args->size = args->spacing * args->height;
-	 * may cause coverity issue with unintentional overflow.
-	 */
-	args->size = args->pitch;
-	args->size *= args->height;
-
-	dma_obj = mtk_gem_create(dev, args->size);
-	if (IS_ERR(dma_obj))
-		return PTR_ERR(dma_obj);
-
-	/*
-	 * allocate a id of idr table where the obj is registered
-	 * and handle has the id what user can see.
-	 */
-	ret = drm_gem_handle_create(file_priv, &dma_obj->base, &args->handle);
-	if (ret)
-		goto err_handle_create;
-
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&dma_obj->base);
-
-	return 0;
-
-err_handle_create:
-	mtk_gem_free_object(&dma_obj->base);
-	return ret;
-}
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj,
-			       struct vm_area_struct *vma)
-
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	int ret;
-
-	/*
-	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
-	 * whole buffer from the start.
-	 */
-	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-
-	/*
-	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
-	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
-	 */
-	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
-
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	ret = dma_mmap_wc(priv->dma_dev, vma, dma_obj->vaddr,
-			  dma_obj->dma_addr, obj->size);
-	if (ret)
-		drm_gem_vm_close(vma);
-
-	return ret;
-}
-
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sgt)
-{
-	struct drm_gem_dma_object *dma_obj;
-
-	/* check if the entries in the sg_table are contiguous */
-	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
-		DRM_ERROR("sg_table is not contiguous");
-		return ERR_PTR(-EINVAL);
-	}
-
-	dma_obj = mtk_gem_init(dev, attach->dmabuf->size, true);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
-	dma_obj->sgt = sgt;
-
-	return &dma_obj->base;
-}
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
deleted file mode 100644
index afebc3a970a8..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015 MediaTek Inc.
- */
-
-#ifndef _MTK_GEM_H_
-#define _MTK_GEM_H_
-
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg);
-
-#endif
-- 
2.53.0.473.g4a7958ca14-goog

