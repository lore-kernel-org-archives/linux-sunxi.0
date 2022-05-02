Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FDF2908
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651505946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
	b=HQL0q8OlJFvZxLhXHBOs7DesawYrqiwKzzVtH3EeWkeKNv2LPjmxWV9NA+kyf4PSU3MKI6
	y0O30ZhbnFxh0LZa2YnaebOJxKRPsUBdozO6KZINoif8NXQ9lg9anm4y3dHM42cR2Vp68/
	AtbfydBZUg7jhQbIniAMnzlKKCuksrM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-WrNXhdL6Pg2bcC_VYwTENA-1; Mon, 02 May 2022 11:39:05 -0400
X-MC-Unique: WrNXhdL6Pg2bcC_VYwTENA-1
Received: by mail-wm1-f71.google.com with SMTP id q128-20020a1c4386000000b003942fe15835so1888960wma.6
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 08:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
        b=IVOiESoZa3IqSPjGoE6GY1aeE+ku7G6LArc/FusWHffFBKK1uwTK5jTbhw9Vhmdym5
         NmI1JZSeq964xXfUBSFuzVu+wrQTAh9iIPxWFwfeZ65Wtq6akZ1mbRXcqbm2kwbxOBrP
         T+2NLbtaJi0ACyZTXBWyNTtjb0shpAyTJ+CuS4aH499DK18kRjoQDwNFAgdvV9rKZ6Ek
         fUa1u8my7wrBAkzPKKuN0KMknyG5Dw66SLJKrw+RiznT/lrrd7x91CCgIHtWfblqhoHG
         bK1F7qU9k5PBp3E5SSClb0mpHWgly+e1hlPVhWu6s+a+tEfBEIUVi4kHoqaIW3g9GZiK
         4kVQ==
X-Gm-Message-State: AOAM533cmbPMCqlu9LrIvU5zHtyhqSYNkzKexdFcqZtXcRRw12NSjBYv
	Jwr86MQ4MHRBnzCU7pRWfgfhpA1s2SaRI2aZYwXZNHx57J4S7cLu4iNqwVLSZgmUUPcyzn444CG
	9q+XC4SBa1ouDs235bqiqxUw=
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id m22-20020a05600c4f5600b003943fa397bbmr3455834wmq.83.1651505943843;
        Mon, 02 May 2022 08:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5iF7k5TDSOSlgHfyQz+pcyPcHCX6LV3RnlxGS89mLob4h+ZdMgib1ArSojImIhdyBYcuzBw==
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id m22-20020a05600c4f5600b003943fa397bbmr3455805wmq.83.1651505943296;
        Mon, 02 May 2022 08:39:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v28-20020adfa1dc000000b0020c5253d923sm7294489wrv.111.2022.05.02.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 08:39:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/3] drm: Allow simpledrm to setup its emulated FB as firmware provided
Date: Mon,  2 May 2022 17:38:57 +0200
Message-Id: <20220502153900.408522-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hello,

This series contain patches suggested by Thomas Zimmermann as a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

This is a v2 that addresses issues pointed out in v1.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the
  kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++++++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 22 ++++++++++++++++
 36 files changed, 81 insertions(+), 39 deletions(-)

-- 
2.35.1

