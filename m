Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C6243367
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766690222; cv=none; b=BySdka/U63sc10ThpzpT+cVISX3iPM/tRDiWTDv+cdVuzDT69uYDFP6O2uYpJfqL9TKCiIFq+Ia/8lPPsUZTwLYGCrKp6SEUEh/JfIZpyn49cEWVlgAgPc/N3vVOyPKERzVUkhlPck449Mhjif0vjfqAt1GqWcuPxwJwifxjkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766690222; c=relaxed/simple;
	bh=rYrdPTvlnmWKdh84+cs7nkuv6rTHPw+q/AV/r6b6APo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwhDeMD9hY2PAvGsNn6dQrVv1ksTotvUefk7UatjhWqQ3+SZO8FXajq8QuROfZhE8Gp5EviASUWnUNnXckkj7prn1rgTLT7Ql1oLMwYgCLQ3jAJnix0f/AXQToUlibCwP37DyxNkRKBlaBQBWDF9t5vRMhQWF5rAhC/E2tBaSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAlzzuHE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAlzzuHE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso11260895a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690219; x=1767295019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuBMYgUvpujZFFxEebcmJA0Qddg42Ta0WZ5j0EnaKFA=;
        b=IAlzzuHEw8BeUz5h+X/0Q5evMAbPKkwbBdaOLlT8cGKDXyZq0401R0TMqmzkcmoBkP
         3FAIfzwBYFqQfkirww8Ze2mSFY5BKdpqIxyxKVRVgaje9I9d9sHhPhpkTx3NlCFsqTdG
         sskwmQvTbBqYj5M/AgudIbl6wxdfSvRvurYHLlZgkWSDmNERz45tHOlaFpBnfBZpn795
         oIwa3tfOsRQBqjA8TePHcJda5A0Ef1yPxUUySFhneCUA6yPgTntVHeeu0F61quw4ncGm
         rKFiEhm8iuJhDD0jTxRIZWhiAao1WLXoDQmmYfJ2qwRqFT6vZiGD48WIqOBXwL4CupxM
         YKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690219; x=1767295019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YuBMYgUvpujZFFxEebcmJA0Qddg42Ta0WZ5j0EnaKFA=;
        b=KVyxR8TSQ0hopqNuTPta4lF1dUCXOmm+slWlvzffn1HTWSOOVW7JkLfx932JTvR/No
         H8+f4mzjt8WU/cNr6hmbzqHWQKpIQ8tEZQhGr1G7X+vZbgvRz1XqIF4vxN0imZcWxKKV
         sEFY35u6n9xaGaBjWDb9WoGKAfR4Jq6+6blfQGy8Lh3whECnOPC5mATvquBr0Adxrzai
         WvUOzBWn+qOkSkcIOS62x+IpYop+OQK76BLgzBmUsgfzvTIQPmEcuK2SuU1jcWMCH/1+
         odTMmLGSLkTuj93xflBeJrxOHnB0TV4r3sv7ys9v6ByNPTeo1I2Q8VrBri5cyiXhQ2Y/
         9pjA==
X-Forwarded-Encrypted: i=1; AJvYcCXSCsjywB8LbX7n+TRlmVgf/B7kjiaZ3+9yxMGJOeijtKnNa+GUSWldRwWYxONcDqy1nJgX6v1Nlv7Ghw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9R0NTFWyleNo/iS+qWrB+LrmZz4m/n7YJJTwzxZO3gBcfJKoa
	4JymmrL6pu4vVzD6hwyWluesd72XSsGZAn4RNw7ftv66oMz8vje4g1TF
X-Gm-Gg: AY/fxX7h7f4+OZdjbKNM3yOip1hBZvnhZ1MuyXL3m6gcRzdgPey9mXf/XJ1Ey1Ce+0x
	yIG7XaJ575M9EfOPAkAazPkfC/uiVxKvZGdLlMinLZ/HaaQdbIQtVL5YwQkDsQdEFeJ/NNri73+
	WTtk+XvfrJEIaKLhHUtfZha9Fk03Xuo4XozijmAp82txA2AoAOczKCcGhI45I/V7NiRj0kxpZEY
	7mdLpA47lf8Cd8DHskkUGoy6MWmm1MRQ/DaZHwZZxn321T3lrnuDXlB3VKyUfTrys/qAROr34ae
	Mgsy1mEaDUn0Mb3Lvd3kK8CAXDkWH7tneAQzNEhkYlOiZprkLymm9HKsK9Tyz/YFnXaeBUnr4lw
	eM+VpbTHR9IrimuVmZvCBUht0RkcKPUgZw2Rc/CEOJwZ9YFhVaaa4FO0L64uNpn/6l9lhu7BJK1
	5iPmvZkgjEKh2gQK40ca2XksYfLN1E77uJ
X-Google-Smtp-Source: AGHT+IFvbDFb5iMsxvcHe5uwcc5xP1qt+TI1oeS+emR1kX9GA2B625QCLopqwLQJpyQpTnQVovm73A==
X-Received: by 2002:a17:907:97c7:b0:b79:d24b:474d with SMTP id a640c23a62f3a-b8036f56569mr2366332866b.16.1766690218514;
        Thu, 25 Dec 2025 11:16:58 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0deesm2155826266b.37.2025.12.25.11.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:16:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Thu, 25 Dec 2025 20:16:56 +0100
Message-ID: <2040104.PYKUYFuaPT@jernej-laptop>
In-Reply-To:
 <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com>
 <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > <jernej.skrabec@gmail.com> wrote:
> > >
> > > This driver serves just as planes sharing manager, needed for Display
> > > Engine 3.3 and newer.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > >  4 files changed, 257 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kc=
onfig
> > > index b56ba00aabca..946dd7606094 100644
> > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > >           TCON TOP is responsible for configuring display pipeline for
> > >           HDMI, TVE and LCD.
> > >
> > > +config DRM_SUN50I_PLANES
> > > +       tristate
> > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > +       help
> > > +         Chose this option if you have an Allwinner Soc with the
> > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > +         between multiple mixers.
> > > +
> > >  endif
> > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/M=
akefile
> > > index bad7497a0d11..03f002abef15 100644
> > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_dsi.o
> > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> >
> > I don't think you can have this as a separate module:
> >
> > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_one()
> >    from the sun8i-mixer module, and neither of them are exported symbol=
s.
> >
> > b. You export sun50i_planes_setup() for sun8i-mixer to call, which ends
> >    up becoming a circular dependency.
> >
> > The easiest solution would be to just fold this into the sun8i-mixer mo=
dule.

I mimicked tcon-top module, but yeah, it's much less of a hassle to fold it
into sun8i-mixer.

> >
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/=
sun4i/sun50i_planes.c
> > > new file mode 100644
> > > index 000000000000..a99c01122990
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > @@ -0,0 +1,205 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "sun50i_planes.h"
> > > +#include "sun8i_ui_layer.h"
> > > +#include "sun8i_vi_layer.h"
> > > +
> > > +static bool sun50i_planes_node_is_planes(struct device_node *node)
> > > +{
> > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > +}
> > > +
> > > +struct drm_plane **
> > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > +                   unsigned int mixer)
> > > +{
> > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > +       const struct sun50i_planes_quirks *quirks;
> > > +       struct drm_plane **drm_planes;
> > > +       const struct default_map *map;
> > > +       unsigned int i;
> > > +
> > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > +               dev_err(dev, "Device is not planes driver!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       if (!planes) {
> > > +               dev_err(dev, "Planes driver is not loaded yet!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       if (mixer > 1) {
> > > +               dev_err(dev, "Mixer index is too high!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       quirks =3D planes->quirks;
> > > +       map =3D &quirks->def_map[mixer];
> > > +
> > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> >
> > Just a note: it seems we are missing the sentinel in sun8i_layers_init(=
).

Why do you think so? Current mainline code has mixer->cfg->vi_num +
mixer->cfg->ui_num + 1.

> >
> > > +                                 sizeof(*drm_planes), GFP_KERNEL);
> > > +       if (!drm_planes)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       for (i =3D 0; i < map->num_ch; i++) {
> > > +               unsigned int phy_ch =3D map->map[i];
> > > +               struct sun8i_layer *layer;
> > > +               enum drm_plane_type type;
> > > +
> > > +               if ((i =3D=3D 0 && map->num_ch =3D=3D 1) || i =3D=3D =
1)
> > > +                       type =3D DRM_PLANE_TYPE_PRIMARY;
> > > +               else
> > > +                       type =3D DRM_PLANE_TYPE_OVERLAY;
> > > +
> > > +               if (phy_ch < UI_PLANE_OFFSET)
> > > +                       layer =3D sun8i_vi_layer_init_one(drm, type, =
planes->regs,
> > > +                                                       i, phy_ch, ma=
p->num_ch,
> > > +                                                       &quirks->cfg);
> > > +               else
> > > +                       layer =3D sun8i_ui_layer_init_one(drm, type, =
planes->regs,
> > > +                                                       i, phy_ch, ma=
p->num_ch,
> > > +                                                       &quirks->cfg);
> > > +
> > > +               if (IS_ERR(layer)) {
> > > +                       dev_err(drm->dev,
> > > +                               "Couldn't initialize DRM plane\n");
> > > +                       return ERR_CAST(layer);
> > > +               }
> > > +
> > > +               drm_planes[i] =3D &layer->plane;
> > > +       }
> > > +
> > > +       return drm_planes;
> > > +}
> > > +EXPORT_SYMBOL(sun50i_planes_setup);
> > > +
> > > +static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
> > > +{
> > > +       const struct sun50i_planes_quirks *quirks =3D planes->quirks;
> > > +       unsigned int i, j;
> > > +       u32 mapping;
> > > +
> > > +       mapping =3D 0;
> > > +       for (j =3D 0; j < MAX_DISP; j++)
> > > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > > +
> > > +                       if (ch < UI_PLANE_OFFSET)
> > > +                               mapping |=3D j << (ch * 2);
> > > +                       else
> > > +                               mapping |=3D j << ((ch - UI_PLANE_OFF=
SET) * 2 + 16);
> > > +               }
> > > +       regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG,=
 mapping);
> > > +
> > > +       for (j =3D 0; j < MAX_DISP; j++) {
> > > +               mapping =3D 0;
> > > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > > +
> > > +                       if (ch >=3D UI_PLANE_OFFSET)
> > > +                               ch +=3D 2;
> > > +
> > > +                       mapping |=3D ch << (i * 4);
> > > +               }
> > > +               regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN=
_MUX_REG + j * 4, mapping);
> > > +       }
> > > +}
> > > +
> > > +static const struct regmap_config sun50i_planes_regmap_config =3D {
> > > +       .name           =3D "planes",
> > > +       .reg_bits       =3D 32,
> > > +       .val_bits       =3D 32,
> > > +       .reg_stride     =3D 4,
> > > +       .max_register   =3D 0x17fffc,
> > > +};
> > > +
> > > +static int sun50i_planes_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct sun50i_planes *planes;
> > > +       void __iomem *regs;
> > > +
> > > +       planes =3D devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
> > > +       if (!planes)
> > > +               return -ENOMEM;
> > > +
> > > +       planes->quirks =3D of_device_get_match_data(&pdev->dev);
> > > +       if (!planes->quirks)
> > > +               return dev_err_probe(dev, -EINVAL, "Unable to get qui=
rks\n");
> > > +
> > > +       planes->mapping =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> > > +                                                         "allwinner,=
plane-mapping");
> > > +       if (IS_ERR(planes->mapping))
> > > +               return dev_err_probe(dev, PTR_ERR(planes->mapping),
> > > +                                    "Unable to get mapping\n");
> > > +
> > > +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(regs))
> > > +               return PTR_ERR(regs);
> > > +
> > > +       planes->regs =3D devm_regmap_init_mmio(dev, regs, &sun50i_pla=
nes_regmap_config);
> > > +       if (IS_ERR(planes->regs))
> > > +               return PTR_ERR(planes->regs);
> > > +
> > > +       dev_set_drvdata(dev, planes);
> > > +
> > > +       sun50i_planes_init_mapping(planes);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct sun50i_planes_quirks sun50i_h616_planes_quirks =
=3D {
> > > +       .def_map =3D {
> > > +               {
> > > +                       .map =3D {0, 6, 7},
> > > +                       .num_ch =3D 3,
> > > +               },
> > > +               {
> > > +                       .map =3D {1, 2, 8},
> > > +                       .num_ch =3D 3,
> > > +               },
> > > +       },
> > > +       .cfg =3D {
> > > +               .de_type        =3D SUN8I_MIXER_DE33,
> > > +               /*
> > > +                * TODO: All planes support scaling, but driver needs
> > > +                * improvements to properly support it.
> > > +                */
> > > +               .scaler_mask    =3D 0,
> > > +               .scanline_yuv   =3D 4096,
> > > +       },
> > > +};
> > > +
> > > +/* sun4i_drv uses this list to check if a device node is a plane */
>=20
> I didn't see any usage of this in patch 7. Is this part of another
> series?
>=20
> Maybe just export sun50i_planes_node_is_planes() instead?

It's not needed if driver is folder into sun8i-mixer module. Looks like this
is remnant of tcon-top concept...

>=20
> > > +const struct of_device_id sun50i_planes_of_table[] =3D {
> > > +       {
> > > +               .compatible =3D "allwinner,sun50i-h616-de33-planes",
> > > +               .data =3D &sun50i_h616_planes_quirks
> > > +       },
> > > +       { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
> > > +EXPORT_SYMBOL(sun50i_planes_of_table);
> > > +
> > > +static struct platform_driver sun50i_planes_platform_driver =3D {
> > > +       .probe          =3D sun50i_planes_probe,
> > > +       .driver         =3D {
> > > +               .name           =3D "sun50i-planes",
> > > +               .of_match_table =3D sun50i_planes_of_table,
> > > +       },
> > > +};
> > > +module_platform_driver(sun50i_planes_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
> > > +MODULE_DESCRIPTION("Allwinner DE33 planes driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/=
sun4i/sun50i_planes.h
> > > new file mode 100644
> > > index 000000000000..446feaeb03fc
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
> > > @@ -0,0 +1,43 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > > +
> > > +#ifndef _SUN50I_PLANES_H_
> > > +#define _SUN50I_PLANES_H_
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include <linux/regmap.h>
> >
> > I think you could move these two to the .c file, and just use forward
> > declarations here.

Ok.

Best regards,
Jernej

> >
> > The rest looks OK.
> >
> >
> > > +
> > > +#include "sun8i_mixer.h"
> > > +
> > > +/* mapping registers, located in clock register space */
> > > +#define SUNXI_DE33_DE_CHN2CORE_MUX_REG 0x24
> > > +#define SUNXI_DE33_DE_PORT02CHN_MUX_REG        0x28
> > > +#define SUNXI_DE33_DE_PORT12CHN_MUX_REG        0x2c
> > > +
> > > +#define MAX_DISP       2
> > > +#define MAX_CHANNELS   8
> > > +#define UI_PLANE_OFFSET        6
> > > +
> > > +struct default_map {
> > > +       unsigned int map[MAX_CHANNELS];
> > > +       unsigned int num_ch;
> > > +};
> > > +
> > > +struct sun50i_planes_quirks {
> > > +       struct default_map      def_map[MAX_DISP];
> > > +       struct sun8i_layer_cfg  cfg;
> > > +};
> > > +
> > > +struct sun50i_planes {
> > > +       struct regmap                           *regs;
> > > +       struct regmap                           *mapping;
> > > +       const struct sun50i_planes_quirks       *quirks;
> > > +};
> > > +
> > > +extern const struct of_device_id sun50i_planes_of_table[];
> > > +
> > > +struct drm_plane **
> > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > +                   unsigned int mixer);
> > > +
> > > +#endif /* _SUN50I_PLANES_H_ */
> > > --
> > > 2.51.2
> > >
> > >
>=20




