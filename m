Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A07F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 17:02:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id be20so20556856edb.12
        for <linux-sunxi@lists.linux.dev>; Tue, 03 May 2022 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
        b=HaGnyx7pBoke+0aSLZ+0Cl9i2Z3rtc277xsE07lgnGx2lIPgKNR+/cHf1BHMJd+tWY
         xLxDVjfXM0LpLkK6W47aSnLqvt4qcngT1GxJ9qnMFGWSSL68ZSpCJur0Qp+flnz9TG9V
         8iSPz7fXNdaty2uNHB4TWoNsqJrz0v03bb5rxLo5UKkUbCeepA8IK+d4f511ABt2QcWd
         ZpC42ODRQgilCYofK3JnmcBW/XdrLxgbLavwJlZDJe38uRpGjKQRfb1xNvaHi8pmKFwS
         8RYFI+ibpzWIAh8L22MX0fUODrvS/rlJYgws3AcC0d8zDmBJEhPw91evXIyGqHtd9B1w
         9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
        b=nixOjYThsvGlHkQifism/tH8bd/10FuZbiDIvth02MQOz4Vq0a8hbq6OazBitwNGm+
         S29qHSSQz5tFqZ3H089XMQzL/Tth02R8R5quVu8exvn02FfHz9GKHedDOKFwuazd6KwJ
         ja3shb8Tx6DPKBoPWo6WfeI5RzWMJ5T4IP2X5Vuya11tLEgHRBFz+nXSj+KW5zOQLlw0
         SgMTaxlPolZ8p43lCsK/GtNqeAcZSAEqA00TrEUWXM66i96319tcE58GALDD1j6CeWcK
         e2q6va/4Te9gRvoZzFO9vYDAklDyKq+PwHIsDbdxjc6I0gIQFyoV01FbnmK39WLCblt2
         0qzw==
X-Gm-Message-State: AOAM5312ESc/eRA90cfuq8sm1YrxGd4tG+LULs5H9lgCg0KGKuj/dMIc
	y+d0GIFs0ZtcT9I+LYHwNtE=
X-Google-Smtp-Source: ABdhPJwhqGbymFuBTyPLL+yyc+nnpILMy/ni7d7XOhYbnZCBoZ0oS8dRxaoc/0h9PTlfn8SevSJmlw==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id f1-20020a056402194100b00413282209c8mr18716302edz.13.1651597377548;
        Tue, 03 May 2022 10:02:57 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id q8-20020aa7cc08000000b0042617ba637esm8000905edt.8.2022.05.03.10.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 10:02:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 2/3] drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup() parameter
Date: Tue, 03 May 2022 19:02:54 +0200
Message-ID: <2626921.mvXUDI8C0e@kista>
In-Reply-To: <20220503071540.471667-3-javierm@redhat.com>
References: <20220503071540.471667-1-javierm@redhat.com> <20220503071540.471667-3-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 03. maj 2022 ob 09:15:39 CEST je Javier Martinez Canillas 
napisal(a):
> By default the bits per pixel for the emulated framebuffer device is set
> to dev->mode_config.preferred_depth, but some devices need another value.
> 
> Since this second parameter is only used by a few drivers, and to allow
> drivers to use it for passing other configurations when registering the
> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
> 
> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
> for computing options bitfield values and getting the values respectively
> 
> For now, only the DRM_FB_BPP option exists but other options can be added.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Changes in v3:
> - Drop the preferred_bpp local variable (Laurent Pinchart).
> - Add a const qualifier to options parameter (Laurent Pinchart).
> 
> Changes in v2:
> - Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
>   the kernel-doc what this macro does (Laurent Pinchart).
> - Fix some kernel-doc issues I didn't notice in v1.
> - Add Reviewed-by tags from Thomas and Laurent.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
>  drivers/gpu/drm/drm_drv.c                     |  2 +-
>  drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++-------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>  drivers/gpu/drm/stm/drv.c                     |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-

For sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regard,
Jernej

>  drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/tiny/bochs.c                  |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
>  include/drm/drm_fb_helper.h                   | 14 +++++++++-
>  33 files changed, 64 insertions(+), 42 deletions(-)



