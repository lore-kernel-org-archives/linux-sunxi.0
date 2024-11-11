Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18719F104
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731348923; cv=none; b=e87qPi1JfiGkhZGd0RmU1zXKwzG0rUVsT8YH/qsCYoKaCtqs9WYkGHKjrKYsh1pAoen+nMsi+9tBxgDXAYQp1CPp7dZctWaoWRvi6hnvNyyU2G2ci2l91X2FIGOEL/TAX2G4e30hs7oUUFxaYouw4uhPjbp/V0LCkUw9dPD4tIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731348923; c=relaxed/simple;
	bh=5ZOgiPjN/7gIldURSlEkeUEQqegj5xpuRGYkFO4tnf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eftiOo/3JyM/g0syE9YS/EmQb2eEOTdZohxZuR8w/ljgqD6xkbco31+6gsPbZ2wgdoMsnFOxRpimFyVQB4OAFUCiipH3YzpTgcMxkPHI+Latdk6beA/M/oBiLFnqbla8M7EKWbJSfQzH1kD+r97KQZWbVHHlQj4/b90TbALliBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7v/YlO0; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7v/YlO0"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6eacc99a063so45672467b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 10:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731348920; x=1731953720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=B7v/YlO0e1M45xpsXgetBJ/T/47Gl+v3EvbF0anVHLRkYs5Tm+wUK53Tyf8dpMpxR6
         arM1khMmgD7kA3mSItpcQ8O0Ouy+B1M9GRI/C2cTG53zbAik4qBekj7lHVwJmIGtpOrA
         hvLYpHK2de4DQVOV/oBdHoUz74ST84UElIBb8tjqmsa4qHwme80NI6lygZVM8+9d66oF
         GfguRjQh0RiEcI+MNPUYIZkimwl3qF6jZrMEczFAPpU7NBErkU6q0WvbfOIVnZOF/wEb
         1y98O/AVypAhndQg02xny4wsixepIaq4hGQGngO2cQTCj27JGRMCF6R5k5kwzW6vioKk
         sdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731348920; x=1731953720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=TbOmRsS6abRYLpTIL+h9XaNgDZ8P3kwVEfcBA9mHU+HMola/gXXL50IOXV3alwcCbd
         4ux9Ur4BQ9/qZeQIsuvj6jKwFbr7wO1N+/hKP5gAPGbWSlxwGa+ud7CtTA6FIPtOTKSg
         oWTnqHpVR0/rj2S00V7PGHaCxTRab++vFhy8VCJTG+S3RG6Uxh8zhcwYH9vHuTODAYOR
         XbXn68le0bDOpZ189glH1eYX98Yd1a1K5xHzxLKodDLTtqp9HQfqCdj3TOk5X+tt0iPA
         C1M4giRtkbEBgl1LX8gw5+5i/DAy+OK390UdVEbJyt1XbmbTfI2mmoxOwRB84ud8Gb47
         vaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQWN5ajIWOzA8KhdEwtFyh69ezjddHUFMpC338q1oLChKx8fxdePW0HEfrmbi89DUWuXvRjwenH02iPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiE96CSxWhd735HYLIHr/8c45EXokRVvI3fdl1ONZjh3zaXOEU
	0Nix5jEJSvuP/JEWGyrAGDpY8NPZQgsb90fm4CbDax+FVqZ9vtbGiWpoq2NyRJ8RlLfz/tuvof7
	4kyq0IQ99Uzr4893fbIQD7PNsfm4=
X-Google-Smtp-Source: AGHT+IGLBSwTKT95wxrHMnOt9Q5Li6BlHC6K+1FHrKgyvNGBGBapWvVwMHYCacWx2xVp0o642B7HukZWBmszb38LcHY=
X-Received: by 2002:a05:690c:b8e:b0:6dd:d119:58dd with SMTP id
 00721157ae682-6eaddda4d5fmr140329177b3.16.1731348920311; Mon, 11 Nov 2024
 10:15:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241109233821.8619-1-rosenp@gmail.com> <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
In-Reply-To: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 10:15:09 -0800
Message-ID: <CAKxU2N-yy7tptcQL7GCFDCGq7mHSp34cDLg6vYuU7UB2669TDg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>, 
	Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, 
	Michal Simek <michal.simek@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 8:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Nov 9, 2024 at 5:40=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > np here is ofdev->dev.of_node. Better to use the proper functions as
> > there's no use of children or anything else.
>
> Your commit message needs some work.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/can/grcan.c                       |  2 +-
> >  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
> >  drivers/net/dsa/bcm_sf2.c                     |  4 ++--
> >  drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
> >  drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
> >  .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
> >  .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
> >  drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
> >  drivers/net/ethernet/marvell/mvneta.c         |  2 +-
> >  drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
> >  .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
> >  drivers/net/ethernet/via/via-rhine.c          |  2 +-
> >  drivers/net/ethernet/via/via-velocity.c       |  2 +-
> >  drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
> >  drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
> >  drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
> >  19 files changed, 66 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> > index cdf0ec9fa7f3..0a2cc0ba219f 100644
> > --- a/drivers/net/can/grcan.c
> > +++ b/drivers/net/can/grcan.c
> > @@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *of=
dev)
> >                 goto exit_error;
> >         }
> >
> > -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> > +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/msca=
n/mpc5xxx_can.c
> > index 0080c39ee182..252ad40bdb97 100644
> > --- a/drivers/net/can/mscan/mpc5xxx_can.c
> > +++ b/drivers/net/can/mscan/mpc5xxx_can.c
> > @@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device=
 *ofdev)
> >         if (!base)
> >                 return dev_err_probe(&ofdev->dev, err, "couldn't iorema=
p\n");
> >
> > -       irq =3D irq_of_parse_and_map(np, 0);
> > +       irq =3D platform_get_irq(ofdev, 0);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> > index 43bde1f583ff..9229582efd05 100644
> > --- a/drivers/net/dsa/bcm_sf2.c
> > +++ b/drivers/net/dsa/bcm_sf2.c
> > @@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_devic=
e *pdev)
> >                 of_node_put(ports);
> >         }
> >
> > -       priv->irq0 =3D irq_of_parse_and_map(dn, 0);
> > -       priv->irq1 =3D irq_of_parse_and_map(dn, 1);
> > +       priv->irq0 =3D platform_get_irq(pdev, 0);
> > +       priv->irq1 =3D platform_get_irq(pdev, 1);
> >
> >         base =3D &priv->core;
> >         for (i =3D 0; i < BCM_SF2_REGS_NUM; i++) {
> > diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/=
ethernet/allwinner/sun4i-emac.c
> > index 2f516b950f4e..18df8d1d93fd 100644
> > --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> > +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> > @@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
> >
> >         /* fill in parameters for net-dev structure */
> >         ndev->base_addr =3D (unsigned long)db->membase;
> > -       ndev->irq =3D irq_of_parse_and_map(np, 0);
> > +       ndev->irq =3D platform_get_irq(pdev, 0);
> >         if (ndev->irq =3D=3D -ENXIO) {
> >                 netdev_err(ndev, "No irq resource\n");
> >                 ret =3D ndev->irq;
> > diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net=
/ethernet/freescale/fec_mpc52xx.c
> > index 2bfaf14f65c8..553d33a98c99 100644
> > --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > @@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
> >         int rv;
> >         struct net_device *ndev;
> >         struct mpc52xx_fec_priv *priv =3D NULL;
> > -       struct resource mem;
> > +       struct resource *mem;
> >         const u32 *prop;
> >         int prop_size;
> >         struct device_node *np =3D op->dev.of_node;
> > @@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         priv->ndev =3D ndev;
> >
> >         /* Reserve FEC control zone */
> > -       rv =3D of_address_to_resource(np, 0, &mem);
> > -       if (rv) {
> > +       mem =3D platform_get_resource(op, 0, IORESOURCE_MEM);
> > +       if (!mem) {
> >                 pr_err("Error while parsing device node resource\n");
> > +               rv =3D -ENODEV;
> >                 goto err_netdev;
> >         }
> > -       if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> > +       if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
> >                 pr_err("invalid resource size (%lx < %x), check mpc52xx=
_devices.c\n",
> > -                      (unsigned long)resource_size(&mem),
> > +                      (unsigned long)resource_size(mem),
> >                        sizeof(struct mpc52xx_fec));
> >                 rv =3D -EINVAL;
> >                 goto err_netdev;
> >         }
> >
> > -       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> > +       if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
> >                                 DRIVER_NAME)) {
> >                 rv =3D -EBUSY;
> >                 goto err_netdev;
> > @@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         ndev->netdev_ops        =3D &mpc52xx_fec_netdev_ops;
> >         ndev->ethtool_ops       =3D &mpc52xx_fec_ethtool_ops;
> >         ndev->watchdog_timeo    =3D FEC_WATCHDOG_TIMEOUT;
> > -       ndev->base_addr         =3D mem.start;
> > +       ndev->base_addr         =3D mem->start;
> >         SET_NETDEV_DEV(ndev, &op->dev);
> >
> >         spin_lock_init(&priv->lock);
> >
> >         /* ioremap the zones */
> > -       priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
> > +       priv->fec =3D ioremap(mem->start, sizeof(struct mpc52xx_fec));
>
> Generally, devm_platform_ioremap_resource(),
> devm_platform_get_and_ioremap_resource(), etc. are preferred. So if
> we're going to rework things, rework them to use those.
I'm going to avoid that as I've been constantly getting requests to
test my changes on real hardware. I don't own anything that uses
fec_mpc52xx.c.

Plus, documentation states that netdev isn't too big of a fan of devm.

Oh and this file uses no devm of any kind.
>
> Rob
