Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66815A5
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651481342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g1EGMUSX4uhdpumN1AqArSCJZUMcx2qk+SIJN7jkMXI=;
	b=P0h/w4e8bqfdcfuw0MzVuqo30xCR92VaVbU/cZWVK81Y/aYl1Hulb/zDJv3U8VC527kV4m
	U3pcdK/902HbQJMV5WWF5w9oFoD/ZwFVMpxmPmcoChf4Hyn5g1NkQU2mmlN8tjAgL6rYg4
	MfeBdRSBapuQll01D5v+FmDRUTMF3OU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-sAVfTTasOoyWCdFaP2VwTQ-1; Mon, 02 May 2022 04:49:01 -0400
X-MC-Unique: sAVfTTasOoyWCdFaP2VwTQ-1
Received: by mail-wm1-f70.google.com with SMTP id v191-20020a1cacc8000000b0038ce818d2efso4844055wme.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 01:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g1EGMUSX4uhdpumN1AqArSCJZUMcx2qk+SIJN7jkMXI=;
        b=PnP2gmeKDA6z2Is7G/E6P+P19eyLQYZT1gGGN842ZMEEHTrnkGbwbQTfUKkSB6fglD
         ACdLbSjHfAzFDo3gUGQXJAu5gMBMsKd+ew8AcYJ8BhtLsjgvu8vlc4sfNxNuyjbE5lkw
         YF9Vk0ZehlMxlf6GK0TWWYjEMtMm/5v2ewVhdFUgv2JYfLDxe2trjo/AHzzFgk65gXcM
         och+xFNwzvw7s9/F7dU1WI7TRt8/GhIGNxLR7XlpFgOxPEc4/onreiP6VzwF07Pjcj27
         y2BUXOtp/U29e5ixlEvPiRgssP+tbR9mU9+hdQ23E8TUea7886qfN5EEa4AkMYPHBwfy
         BemQ==
X-Gm-Message-State: AOAM531aPAWryo3KOLYSkYit/zl3FchJnJnjvUEjgR5Sm0GAf2IIw0OF
	Qf8cLeM11U1RgvakloqqaaDfBRgPYlcwTTZFmlPRDY2zSHKOxQSq49h1HsFIVwzsjHAhDFDBOFD
	Z9gEezfjL336wY2NyMQrpnNM=
X-Received: by 2002:a1c:7512:0:b0:394:16ee:ab9b with SMTP id o18-20020a1c7512000000b0039416eeab9bmr9917250wmc.176.1651481339936;
        Mon, 02 May 2022 01:48:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1HDOH0L0J59jWzQqe8OCc8OrGCpxEDekTc2b0ViBR9lVxUT3tRNZw5Yfr7Gkyc9Gu0hnOLg==
X-Received: by 2002:a1c:7512:0:b0:394:16ee:ab9b with SMTP id o18-20020a1c7512000000b0039416eeab9bmr9917168wmc.176.1651481339590;
        Mon, 02 May 2022 01:48:59 -0700 (PDT)
Received: from minerva.. ([90.167.94.74])
        by smtp.gmail.com with ESMTPSA id i14-20020adfa50e000000b0020c5253d8c6sm8032307wrb.18.2022.05.02.01.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 01:48:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Alison Wang <alison.wang@nxp.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Starkey <brian.starkey@arm.com>,
	Chen Feng <puck.chen@hisilicon.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	David Airlie <airlied@linux.ie>,
	Emma Anholt <emma@anholt.net>,
	Evan Quan <evan.quan@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hao Fang <fanghao11@huawei.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Joel Stanley <joel@jms.id.au>,
	John Stultz <john.stultz@linaro.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nirmoy Das <nirmoy.das@amd.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Solomon Chiu <solomon.chiu@amd.com>,
	Stefan Agner <stefan@agner.ch>,
	Tian Tao <tiantao6@hisilicon.com>,
	Tomi Valkeinen <tomba@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Yong Wu <yong.wu@mediatek.com>,
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
Subject: [PATCH 0/3] drm: Allow simpledrm to setup its emulated FB as firmware provided
Date: Mon,  2 May 2022 10:48:27 +0200
Message-Id: <20220502084830.285639-1-javierm@redhat.com>
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

This series contain patches suggested by Thomas Zimmermannas a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/


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
 drivers/gpu/drm/drm_fb_helper.c               | 25 ++++++++++++++++---
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
 36 files changed, 80 insertions(+), 39 deletions(-)

-- 
2.35.1

