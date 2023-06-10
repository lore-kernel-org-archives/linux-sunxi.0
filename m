Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD7A49
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 00:50:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D35AC2F4;
	Fri,  9 Jun 2023 17:51:40 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C08A3F587;
	Fri,  9 Jun 2023 17:50:54 -0700 (PDT)
Date: Sat, 10 Jun 2023 01:50:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?6Lev6L6J?= <luhux76@gmail.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 2/3] drivers: musb-new: add allwinner f1c100s
Message-ID: <20230610015026.48da6c88@slackpad.lan>
In-Reply-To: <CAGNyvejdcNPL_m03g4w4cHZRXUQfPGzmJA7Ve+3-_tYbw=nawQ@mail.gmail.com>
References: <CAGNyvejdcNPL_m03g4w4cHZRXUQfPGzmJA7Ve+3-_tYbw=nawQ@mail.gmail.com>
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

On Fri, 9 Jun 2023 14:11:53 +0000
=E8=B7=AF=E8=BE=89 <luhux76@gmail.com> wrote:

Hi,

> From fe7d48e84bb3c72d219f37eed51ea766f83b4bec Mon Sep 17 00:00:00 2001
> From: Lu Hui <luhux76@gmail.com>
> Date: Fri, 9 Jun 2023 22:05:23 +0800
> Subject: [PATCH 2/3] drivers: musb-new: add allwinner f1c100s configurati=
on

thanks for sending this. If this patch should be considered for
merging, you need a few lines of commit message, and more importantly
your Signed-off-by: line.

> ---
>  drivers/usb/musb-new/sunxi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/usb/musb-new/sunxi.c b/drivers/usb/musb-new/sunxi.c
> index dc4cfc2194..1c90739cea 100644
> --- a/drivers/usb/musb-new/sunxi.c
> +++ b/drivers/usb/musb-new/sunxi.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright =C2=A9 2015 Hans de Goede <hdegoede@redhat.com>
>   * Copyright =C2=A9 2013 Jussi Kivilinna <jussi.kivilinna@iki.fi>
> + * Copyright =C2=A9 2023 Lu Hui <luhux76@gmail.com>

This is not needed, only significant contributions require
adding a copyright line. The license is much more important.

>   *
>   * Based on the sw_usb "Allwinner OTG Dual Role Controller" code.
>   *  Copyright 2007-2012 (C) Allwinner Technology Co., Ltd.
> @@ -519,6 +520,10 @@ static const struct sunxi_musb_config sun8i_h3_cfg =
=3D {
>      .config =3D &musb_config_h3,
>  };
>=20
> +static const struct sunxi_musb_config suniv_f1c100s_cfg =3D {
> +    .config =3D &musb_config,
> +};

Since is not needed, as it's identical to the A10 structure ...

> +
>  static const struct udevice_id sunxi_musb_ids[] =3D {
>      { .compatible =3D "allwinner,sun4i-a10-musb",
>              .data =3D (ulong)&sun4i_a10_cfg },
> @@ -528,6 +533,8 @@ static const struct udevice_id sunxi_musb_ids[] =3D {
>              .data =3D (ulong)&sun6i_a31_cfg },
>      { .compatible =3D "allwinner,sun8i-h3-musb",
>              .data =3D (ulong)&sun8i_h3_cfg },
> +    { .compatible =3D "allwinner,suniv-f1c100s-musb",
> +            .data =3D (ulong)&suniv_f1c100s_cfg },

... which you can just reference here directly.

Otherwise this matches the patch I have prepared here as well, I just
wanted to test host mode before sending.

If you resend this one patch with your Signed-off-by: (instead of
Copyright), and using sun4i_a10_cfg, I am happy to take it.

Thanks,
Andre
