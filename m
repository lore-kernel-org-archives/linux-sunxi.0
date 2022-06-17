Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF077F
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 04:13:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id fd6so1867306edb.5
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkcre2VBtMzxrZPMCfkOrbliJifXwznY6q+h4wI7Wog=;
        b=ks4gT/sjz/WSG+M5zgBy04ySeXYNutXYYTK+m3oKvm+UTsWFHoZV8YN+/uk7OnvEtx
         cWE8AppXxMsByuappwZWKZ1/yzO5k4172qqWeNux1iwTxPBLFVcXB432LsD88WrCOZWa
         UJoWq936BeiriVTzTt2Kfj2qdZRECUzGyDuqbDMte/Pwm+2hs+zb78HDqLztmlX9LwGB
         paddvZRoiD/fQBG5dyW3TFK6cmufzLK71Wpdjc1/ZnXoOWIDh9RmzuCS/wuOppl7IZ+Y
         qTlQ8rBbEQmJyhdz/Y7tgs7+GddN58IZifVaMKUzvH234WJThH5eOleuQHWWy/oZQ/Rs
         sAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jkcre2VBtMzxrZPMCfkOrbliJifXwznY6q+h4wI7Wog=;
        b=jb8OPgaGkiDte7X8b5eHJe9QTXcpvCyxUiE4/Ew1B3xIllwQWL/CAri3/1EO8YUil+
         9OP+CwoxVlaOeRaBiUfG7OEqQ2ghHoxmogtpaHU7gT9WWuf1ox2zMWNBfExoU1YI3cHm
         N6HYn/rkalDsFrE/YHD3pqWhqoK0Z0NIZBGZNPftKeFaKJ0caj1AOxuYpyp/JfZGil1Q
         jtldPRqsi+MqikH24ny9ZebE+PD3GWOU7CV7BX9ewnPvjUvfSWtqF2UnJs6lmi2hL2s7
         3qmJam5rHS1qNh15dGlWerz+Rs+xF8tObw0n8LRGSzlbPfMtrCFy3A5kBlnfI6EqiUy4
         z1og==
X-Gm-Message-State: AJIora+4KpCFHu/rQuP1WrFQjnhTKRpSA+2gKwiU7wZS6EKb7iYEQVwp
	UsgCF1rvRLJ1EXWauMXSzg0=
X-Google-Smtp-Source: AGRyM1vDq6JtWJzZZ4jWmMy/sOS/uWzEGjgdqQ8zfDxc/FoUMgzm2o+2uai90JO5XUJAJJlsQ9RbCw==
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id s9-20020a056402014900b004317dde9b59mr10021996edu.339.1655439188935;
        Thu, 16 Jun 2022 21:13:08 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id i24-20020a05640200d800b0042dcac2afc6sm2874051edu.72.2022.06.16.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 21:13:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, wens@csie.org, Samuel Holland <samuel@sholland.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Add DMA mask and segment size
Date: Fri, 17 Jun 2022 06:13:06 +0200
Message-ID: <10094862.nUPlyArG6x@jernej-laptop>
In-Reply-To: <e4a73a0f-c725-fad2-021b-5b5ee5ead1b3@sholland.org>
References: <20220616213240.392041-1-jernej.skrabec@gmail.com> <e4a73a0f-c725-fad2-021b-5b5ee5ead1b3@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 17. junij 2022 ob 05:03:11 CEST je Samuel Holland napisal(a):
> Hi Jernej,
> 
> On 6/16/22 4:32 PM, Jernej Skrabec wrote:
> > Kernel occasionally complains that there is mismatch in segment size
> > when trying to render HW decoded videos and rendering them directly with
> > sun4i DRM driver.
> > 
> > Fix that by setting DMA mask and segment size.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > b/drivers/gpu/drm/sun4i/sun4i_drv.c index 275f7e4a03ae..83f4e87f77f6
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > @@ -7,6 +7,7 @@
> > 
> >   */
> >  
> >  #include <linux/component.h>
> > 
> > +#include <linux/dma-mapping.h>
> > 
> >  #include <linux/kfifo.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > 
> > @@ -367,6 +368,9 @@ static int sun4i_drv_probe(struct platform_device
> > *pdev)> 
> >  	INIT_KFIFO(list.fifo);
> > 
> > +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> 
> Isn't this already the default, from of_dma_configure_id or
> setup_pdev_dma_masks?

Not sure, I need to check.

> > +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> 
> This looks like a good change. In fact, I think we need a similar change in
> some other drivers.

Should be DMA_BIT_MASK(25) as in your other patch?

Best regards,
Jernej

> 
> Regards,
> Samuel




