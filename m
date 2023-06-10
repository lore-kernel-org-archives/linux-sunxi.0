Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C467EA
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 00:15:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34FCA2F4;
	Fri,  9 Jun 2023 17:15:51 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4AEF3F6C4;
	Fri,  9 Jun 2023 17:15:04 -0700 (PDT)
Date: Sat, 10 Jun 2023 01:14:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?6Lev6L6J?= <luhux76@gmail.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/3] phy: phy-sun4i-usb: add allwinner f1c100s
 configuration
Message-ID: <20230610011436.7e690b88@slackpad.lan>
In-Reply-To: <CAGNyveg-0j_0swM_POSv8hZP8Up9HNyE3B6gpSLTZm_v6a8AXQ@mail.gmail.com>
References: <CAGNyveg-0j_0swM_POSv8hZP8Up9HNyE3B6gpSLTZm_v6a8AXQ@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jun 2023 14:11:07 +0000
=E8=B7=AF=E8=BE=89 <luhux76@gmail.com> wrote:

Hi,

> From 09a85536f92cfd22f2a6feba8ea91fae4bc41ed8 Mon Sep 17 00:00:00 2001
> From: Lu Hui <luhux76@gmail.com>
> Date: Fri, 9 Jun 2023 22:04:56 +0800
> Subject: [PATCH 1/3] phy: phy-sun4i-usb: add allwinner f1c100s configurat=
ion

I sent a similar patch literally just a few hours ago:
https://lore.kernel.org/u-boot/20230609105621.1410483-1-andre.przywara@arm.=
com/T/

Can you please check whether this works for you as well? My series
missed the final MUSB enablement (because I wanted to test host mode
first), but at least the PHY part should work.=20

In the future, please add a commit message, describing your patch, and
also your Signed-off-by: line, otherwise the patch cannot be merged.

Cheers,
Andre


>=20
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 6428163c18..8425a83c84 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2017 Jagan Teki <jagan@amarulasolutions.com>
>   * Copyright (C) 2015 Hans de Goede <hdegoede@redhat.com>
>   * Copyright (C) 2014 Roman Byshko <rbyshko@gmail.com>
> + * Copyright (C) 2023 Lu Hui <luhux76@gmail.com>
>   *
>   * Modelled arch/arm/mach-sunxi/usb_phy.c to compatible with generic-phy.
>   *
> @@ -83,6 +84,7 @@ enum sun4i_usb_phy_type {
>      sun8i_v3s_phy,
>      sun50i_a64_phy,
>      sun50i_h6_phy,
> +    suniv_f1c100s_phy,
>  };
>=20
>  struct sun4i_usb_phy_cfg {
> @@ -372,8 +374,9 @@ static int sun4i_usb_phy_xlate(struct phy *phy,
>  {
>      struct sun4i_usb_phy_data *data =3D dev_get_priv(phy->dev);
>=20
> -    if (args->args_count >=3D data->cfg->num_phys)
> +    if (args->args_count > data->cfg->num_phys) {
>          return -EINVAL;
> +    }
>=20
>      if (data->cfg->missing_phys & BIT(args->args[0]))
>          return -ENODEV;
> @@ -531,6 +534,14 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
>      return 0;
>  }
>=20
> +static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg =3D {
> +    .num_phys =3D 1,
> +    .type =3D suniv_f1c100s_phy,
> +    .disc_thresh =3D 3,
> +    .phyctl_offset =3D REG_PHYCTL_A10,
> +    .dedicated_clocks =3D true,
> +};
> +
>  static const struct sun4i_usb_phy_cfg sun4i_a10_cfg =3D {
>      .num_phys =3D 3,
>      .type =3D sun4i_a10_phy,
> @@ -659,6 +670,7 @@ static const struct udevice_id sun4i_usb_phy_ids[] =
=3D {
>      { .compatible =3D "allwinner,sun20i-d1-usb-phy", .data =3D
> (ulong)&sun20i_d1_cfg },
>      { .compatible =3D "allwinner,sun50i-a64-usb-phy", .data =3D
> (ulong)&sun50i_a64_cfg},
>      { .compatible =3D "allwinner,sun50i-h6-usb-phy", .data =3D
> (ulong)&sun50i_h6_cfg},
> +    { .compatible =3D "allwinner,suniv-f1c100s-usb-phy", .data =3D
> (ulong)&suniv_f1c100s_cfg},
>      { }
>  };
>=20

