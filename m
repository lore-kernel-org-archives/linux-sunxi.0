Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880CD321D
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Mar 2023 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Cc:To:Message-ID:From:Content-Transfer-Encoding:
	Content-Type:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5DMLJzQKqdF6oeNoZF8t9+eClq9ynzLjSSrN4tmUXPA=; b=BXjkskeT2aCDjWBkFBi1gJSE0o
	KxttfCw6RT9DA1gOSi4J8shGJu4zeme59ibiNNsvkb2rcdRzl+RzXgjtRJUQHlpW9ES6pOJXlcMkQ
	1YUunvfpuepMFk47fKFBEH+mHsl/MVkWXlkZMKwvtMZzfk5wOgCVTk5Dy+lPayv9jc9+Cq1I4kveh
	sRcaJZ6kguPGCQxRbtimP/mOXWCLp6qzl6IBCYsIw0WnrMvQuWcqIHof8zj4Mvy/2HNbKpmJr3vt2
	GfvjpvMMFUnBZZSI07Rxijc/DJ7u8UP3CCDrVyYwjMBmB67yAbqwP2ef5iI8eloeedS7kNS9dDn/k
	F60VybOw==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sarha@kapsi.fi>)
	id 1pZXxt-005UaU-Pn; Tue, 07 Mar 2023 16:06:54 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 14:06:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <25a439e6a6d58701e5a73b33ed0d7a4a0d9a68e2@kapsi.fi>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)

March 1, 2023 at 5:30 PM, "Thomas Zimmermann" <tzimmermann@suse.de mailto=
:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%40su=
se.de%3E > wrote:

>=20
>=20Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>=20
>=20Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20

Acked-by:=20Jyri Sarha <jyri.s

>=20
>=20---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index 4ca426007dc8..fe56beea3e93 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -16,7 +16,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/drm_debugfs.h>
> #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
> #include <drm/drm_fourcc.h>
> #include <drm/drm_gem_dma_helper.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> @@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddr=
v, struct device *dev)
> goto init_failed;
> priv->is_registered =3D true;
>=20
>=20- drm_fbdev_generic_setup(ddev, bpp);
> + drm_fbdev_dma_setup(ddev, bpp);
> return 0;
>=20
>=20init_failed:
> --=20
>=202.39.2
>
