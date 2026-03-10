Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E2359A79
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130892; cv=none; b=FB9VJQK+JXyqMk3/D0oJB0DKsGCBsFD09mQbpNPNTMyCiyPPU3O1dEplEM5TlILW/HCHWVWLg7Nn+O/ArG2lOYvwZOkYdKL3bVTGxJaNAchNMsMTLZDyZnFNEahEnlX/5aDD7DUGmmOsQqTvijG0Y+ntkIUaHcveB9BxNB2WfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130892; c=relaxed/simple;
	bh=/IasdzKF+QHXQaAqtqYrNWihKbcLk9ObqtjumeagLQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b80OeNnHQPifSOjIPforfzDkBVGS2kLwJukwxPt/aDr8J26Yqx18g4IWLnvL4cdSZh2vmAC7PDfEhkcNlLkhnb9/sEqz0NoYuO3IGNGO53GniVpK6otZNzZ2jHBHOR4pZjHybUtO12JhGbaEAgv7gOMVGA2yvGKeZAzv4X5SRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fuRAwTJ1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eE6+nWQN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fuRAwTJ1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eE6+nWQN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuRAwTJ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eE6+nWQN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuRAwTJ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eE6+nWQN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DB204D2DF;
	Tue, 10 Mar 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773130888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9MnK8258wQHQB1iDU8FfPmKfR9GYkR3psD4htu6ItZs=;
	b=fuRAwTJ1ba8FDodmt6OT+9BhjUpakvW0fS7MpqQz48DBEccMNi9mJB3h1SfqT2iwt/u/1X
	7fLaabso6+j7kB6zpIkbv+hZ79SezfOQ0s4s3mVnnYMgYG3aG5UAnnPAr8as0hGmdnnTek
	ok5OZz09BSoLEEMbqwwREaPlNf86M2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773130888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9MnK8258wQHQB1iDU8FfPmKfR9GYkR3psD4htu6ItZs=;
	b=eE6+nWQNZY4Ie5iDeL57Wqd11NTJfIkefZmxBwFKfmI1C03tSJVfwa5vYU+FCs9DWea8qc
	DpglCviLZQ+SICDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773130888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9MnK8258wQHQB1iDU8FfPmKfR9GYkR3psD4htu6ItZs=;
	b=fuRAwTJ1ba8FDodmt6OT+9BhjUpakvW0fS7MpqQz48DBEccMNi9mJB3h1SfqT2iwt/u/1X
	7fLaabso6+j7kB6zpIkbv+hZ79SezfOQ0s4s3mVnnYMgYG3aG5UAnnPAr8as0hGmdnnTek
	ok5OZz09BSoLEEMbqwwREaPlNf86M2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773130888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9MnK8258wQHQB1iDU8FfPmKfR9GYkR3psD4htu6ItZs=;
	b=eE6+nWQNZY4Ie5iDeL57Wqd11NTJfIkefZmxBwFKfmI1C03tSJVfwa5vYU+FCs9DWea8qc
	DpglCviLZQ+SICDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 067A53F365;
	Tue, 10 Mar 2026 08:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2u37OofUr2mfCwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Mar 2026 08:21:27 +0000
Message-ID: <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
Date: Tue, 10 Mar 2026 09:21:27 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and
 drop custom GEM callbacks
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260310032511.2545500-1-wenst@chromium.org>
 <20260310032511.2545500-4-wenst@chromium.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260310032511.2545500-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com,collabora.com,kernel.org,pengutronix.de,linux.intel.com,sholland.org,ffwll.ch];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,chromium.org:email,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Hi

Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
>
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
>
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.

My impression is that this patch should be split up: first replace 
dma_dev with the dma device; then replace the now-duplicate code with 
shared helpers.

>
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().

We can add VM_DONTDUMP to gem-dma's mmap helper. [1] It's most likely 
the right thing to not dump graphics buffers and standard practice in 
most other GEM memory managers.

[1] 
https://elixir.bootlin.com/linux/v6.19.6/source/drivers/gpu/drm/drm_gem_dma_helper.c#L537

>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

The changes look correct, so I'm here's the

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

But this patch requires a review from the driver maintainer as well.

Best regards
Thomas

> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
>   drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
>   drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
>   5 files changed, 3 insertions(+), 268 deletions(-)
>   delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
>   delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index 351d58c50b84..fcb16f3f7b23 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -23,7 +23,6 @@
>   #include "mtk_crtc.h"
>   #include "mtk_ddp_comp.h"
>   #include "mtk_drm_drv.h"
> -#include "mtk_gem.h"
>   #include "mtk_plane.h"
>   
>   /*
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a94c51a83261..6f6db2e1980e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_fbdev_dma.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem.h>
> +#include <drm/drm_gem_dma_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_of.h>
> @@ -29,7 +30,6 @@
>   #include "mtk_ddp_comp.h"
>   #include "mtk_disp_drv.h"
>   #include "mtk_drm_drv.h"
> -#include "mtk_gem.h"
>   
>   #define DRIVER_NAME "mediatek"
>   #define DRIVER_DESC "Mediatek SoC DRM"
> @@ -565,8 +565,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   		goto err_component_unbind;
>   	}
>   
> -	for (i = 0; i < private->data->mmsys_dev_num; i++)
> -		private->all_drm_private[i]->dma_dev = dma_dev;
> +	drm_dev_set_dma_dev(drm, dma_dev);
>   
>   	/*
>   	 * Configure the DMA segment size to make sure we get contiguous IOVA
> @@ -600,26 +599,12 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
>   
>   DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
>   
> -/*
> - * We need to override this because the device used to import the memory is
> - * not dev->dev, as drm_gem_prime_import() expects.
> - */
> -static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
> -						   struct dma_buf *dma_buf)
> -{
> -	struct mtk_drm_private *private = dev->dev_private;
> -
> -	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
> -}
> -
>   static const struct drm_driver mtk_drm_driver = {
>   	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>   
> -	.dumb_create = mtk_gem_dumb_create,
> +	DRM_GEM_DMA_DRIVER_OPS,
>   	DRM_FBDEV_DMA_DRIVER_OPS,
>   
> -	.gem_prime_import = mtk_gem_prime_import,
> -	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
>   	.fops = &mtk_drm_fops,
>   
>   	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 675cdc90a440..1fc3df4b5485 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -54,7 +54,6 @@ struct mtk_mmsys_driver_data {
>   
>   struct mtk_drm_private {
>   	struct drm_device *drm;
> -	struct device *dma_dev;
>   	bool mtk_drm_bound;
>   	bool drm_master;
>   	struct device *dev;
> diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
> deleted file mode 100644
> index f059a1452220..000000000000
> --- a/drivers/gpu/drm/mediatek/mtk_gem.c
> +++ /dev/null
> @@ -1,231 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2015 MediaTek Inc.
> - * Copyright (c) 2025 Collabora Ltd.
> - *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> - */
> -
> -#include <linux/dma-buf.h>
> -#include <linux/vmalloc.h>
> -
> -#include <drm/drm.h>
> -#include <drm/drm_device.h>
> -#include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
> -#include <drm/drm_prime.h>
> -#include <drm/drm_print.h>
> -
> -#include "mtk_drm_drv.h"
> -#include "mtk_gem.h"
> -
> -static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> -
> -static void mtk_gem_free_object(struct drm_gem_object *obj)
> -{
> -	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
> -	struct mtk_drm_private *priv = obj->dev->dev_private;
> -
> -	if (dma_obj->sgt)
> -		drm_prime_gem_destroy(obj, dma_obj->sgt);
> -	else
> -		dma_free_wc(priv->dma_dev, dma_obj->base.size,
> -			    dma_obj->vaddr, dma_obj->dma_addr);
> -
> -	/* release file pointer to gem object. */
> -	drm_gem_object_release(obj);
> -
> -	kfree(dma_obj);
> -}
> -
> -/*
> - * Allocate a sg_table for this GEM object.
> - * Note: Both the table's contents, and the sg_table itself must be freed by
> - *       the caller.
> - * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
> - */
> -static struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
> -{
> -	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
> -	struct mtk_drm_private *priv = obj->dev->dev_private;
> -	struct sg_table *sgt;
> -	int ret;
> -
> -	sgt = kzalloc_obj(*sgt);
> -	if (!sgt)
> -		return ERR_PTR(-ENOMEM);
> -
> -	ret = dma_get_sgtable(priv->dma_dev, sgt, dma_obj->vaddr,
> -			      dma_obj->dma_addr, obj->size);
> -	if (ret) {
> -		DRM_ERROR("failed to allocate sgt, %d\n", ret);
> -		kfree(sgt);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return sgt;
> -}
> -
> -static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
> -	.free = mtk_gem_free_object,
> -	.print_info = drm_gem_dma_object_print_info,
> -	.get_sg_table = mtk_gem_prime_get_sg_table,
> -	.vmap = drm_gem_dma_object_vmap,
> -	.mmap = mtk_gem_object_mmap,
> -	.vm_ops = &drm_gem_dma_vm_ops,
> -};
> -
> -static struct drm_gem_dma_object *mtk_gem_init(struct drm_device *dev,
> -					unsigned long size, bool private)
> -{
> -	struct drm_gem_dma_object *dma_obj;
> -	int ret;
> -
> -	size = round_up(size, PAGE_SIZE);
> -
> -	if (size == 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	dma_obj = kzalloc_obj(*dma_obj);
> -	if (!dma_obj)
> -		return ERR_PTR(-ENOMEM);
> -
> -	dma_obj->base.funcs = &mtk_gem_object_funcs;
> -
> -	if (private) {
> -		ret = 0;
> -		drm_gem_private_object_init(dev, &dma_obj->base, size);
> -	} else {
> -		ret = drm_gem_object_init(dev, &dma_obj->base, size);
> -	}
> -	if (ret) {
> -		DRM_ERROR("failed to initialize gem object\n");
> -		kfree(dma_obj);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return dma_obj;
> -}
> -
> -static struct drm_gem_dma_object *mtk_gem_create(struct drm_device *dev, size_t size)
> -{
> -	struct mtk_drm_private *priv = dev->dev_private;
> -	struct drm_gem_dma_object *dma_obj;
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	dma_obj = mtk_gem_init(dev, size, false);
> -	if (IS_ERR(dma_obj))
> -		return ERR_CAST(dma_obj);
> -
> -	obj = &dma_obj->base;
> -
> -	dma_obj->vaddr = dma_alloc_wc(priv->dma_dev, obj->size,
> -				      &dma_obj->dma_addr,
> -				      GFP_KERNEL | __GFP_NOWARN);
> -	if (!dma_obj->vaddr) {
> -		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
> -		ret = -ENOMEM;
> -		goto err_gem_free;
> -	}
> -
> -	DRM_DEBUG_DRIVER("vaddr = %p dma_addr = %pad size = %zu\n",
> -			 dma_obj->vaddr, &dma_obj->dma_addr,
> -			 size);
> -
> -	return dma_obj;
> -
> -err_gem_free:
> -	drm_gem_object_release(obj);
> -	kfree(dma_obj);
> -	return ERR_PTR(ret);
> -}
> -
> -int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
> -			struct drm_mode_create_dumb *args)
> -{
> -	struct drm_gem_dma_object *dma_obj;
> -	int ret;
> -
> -	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> -
> -	/*
> -	 * Multiply 2 variables of different types,
> -	 * for example: args->size = args->spacing * args->height;
> -	 * may cause coverity issue with unintentional overflow.
> -	 */
> -	args->size = args->pitch;
> -	args->size *= args->height;
> -
> -	dma_obj = mtk_gem_create(dev, args->size);
> -	if (IS_ERR(dma_obj))
> -		return PTR_ERR(dma_obj);
> -
> -	/*
> -	 * allocate a id of idr table where the obj is registered
> -	 * and handle has the id what user can see.
> -	 */
> -	ret = drm_gem_handle_create(file_priv, &dma_obj->base, &args->handle);
> -	if (ret)
> -		goto err_handle_create;
> -
> -	/* drop reference from allocate - handle holds it now. */
> -	drm_gem_object_put(&dma_obj->base);
> -
> -	return 0;
> -
> -err_handle_create:
> -	mtk_gem_free_object(&dma_obj->base);
> -	return ret;
> -}
> -
> -static int mtk_gem_object_mmap(struct drm_gem_object *obj,
> -			       struct vm_area_struct *vma)
> -
> -{
> -	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
> -	struct mtk_drm_private *priv = obj->dev->dev_private;
> -	int ret;
> -
> -	/*
> -	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> -	 * whole buffer from the start.
> -	 */
> -	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> -
> -	/*
> -	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
> -	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
> -	 */
> -	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
> -
> -	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> -	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> -
> -	ret = dma_mmap_wc(priv->dma_dev, vma, dma_obj->vaddr,
> -			  dma_obj->dma_addr, obj->size);
> -	if (ret)
> -		drm_gem_vm_close(vma);
> -
> -	return ret;
> -}
> -
> -struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
> -			struct dma_buf_attachment *attach, struct sg_table *sgt)
> -{
> -	struct drm_gem_dma_object *dma_obj;
> -
> -	/* check if the entries in the sg_table are contiguous */
> -	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
> -		DRM_ERROR("sg_table is not contiguous");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	dma_obj = mtk_gem_init(dev, attach->dmabuf->size, true);
> -	if (IS_ERR(dma_obj))
> -		return ERR_CAST(dma_obj);
> -
> -	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
> -	dma_obj->sgt = sgt;
> -
> -	return &dma_obj->base;
> -}
> diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
> deleted file mode 100644
> index afebc3a970a8..000000000000
> --- a/drivers/gpu/drm/mediatek/mtk_gem.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2015 MediaTek Inc.
> - */
> -
> -#ifndef _MTK_GEM_H_
> -#define _MTK_GEM_H_
> -
> -#include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
> -
> -int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
> -			struct drm_mode_create_dumb *args);
> -struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
> -			struct dma_buf_attachment *attach, struct sg_table *sg);
> -
> -#endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


