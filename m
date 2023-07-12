Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6C2AB20
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 12:20:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2519CC69B8
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 12:07:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BAFC40007;
	Wed, 12 Jul 2023 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689163620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7ByKZ6oXF6klWgs2IJLwIobDTVTZio3/GXOfUphAec=;
	b=o4PPeJa6zgRt3UiGPCief6r+PAxy2XWT8DlOmuoUwwpF8ch48sJUaMbjT/suvREM7Hcq37
	8z+/KLv7GUBt6TZtsK79jHsq826uZHC9U7z+/HbNlVpZ+PFFaENxM7b5luXr1XWo2PCgnx
	HsnUVGr7rk9iUmsK0aeibehjZXFeOw/yXIgEt5a9NVFNM+M23L0P3ZV3Ie3XsbsiyMxvpP
	siKtD56rxyksEnM7A8EQBLHK7TDOiyJkkfIbzWJ/vXVwKj7owExNXALh3xU25ZqiOfe7Tn
	mDGkOuKqGvp7Qw7ZGLgfxB+Z9RVBCkygIap408+nQNilsXfZbowSbThkpQ4jgQ==
Date: Wed, 12 Jul 2023 14:06:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712140655.72fc2a3d@xps-13>
In-Reply-To: <20230712135455.71fbeb5f@xps-13>
References: <20230707040622.78174-1-frank.li@vivo.com>
	<20230712135455.71fbeb5f@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com


miquel.raynal@bootlin.com wrote on Wed, 12 Jul 2023 13:54:55 +0200:

> Hi Yangtao,
>=20
> frank.li@vivo.com wrote on Fri,  7 Jul 2023 12:06:05 +0800:
>=20
> > Convert platform_get_resource(), devm_ioremap_resource() to a single
> > call to devm_platform_get_and_ioremap_resource(), as this is exactly
> > what this function does.
> >=20
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/s=
unxi_nand.c
> > index 9884304634f6..db36bd755b8d 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -2087,8 +2087,7 @@ static int sunxi_nfc_probe(struct platform_device=
 *pdev)
> >  	nand_controller_init(&nfc->controller);
> >  	INIT_LIST_HEAD(&nfc->chips);
> > =20
> > -	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	nfc->regs =3D devm_ioremap_resource(dev, r);
> > +	nfc->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &r);
>=20
> Why do you keep a reference over the resource? Why not just
> devm_platform_ioremap_resource(pdev, 0) ?
>=20
> This comment is valid for almost all the cases in this series.

Actually 'r' is used at the bottom, so the patch is good. I reviewed
all the patches, 17 look right, I have a minor comment on one of them.
In order to avoid resending all the patches, I'll first apply the 17
good ones and ask you to resend just the last one.

> When the resource is only needed in an error printk, I am also in favor
> of modifying the error message to avoid having to grab the resource.
>=20
> >  	if (IS_ERR(nfc->regs))
> >  		return PTR_ERR(nfc->regs);
> > =20
>=20
> These comments apply to the 18 patches.
>=20
> Thanks,
> Miqu=C3=A8l


Thanks,
Miqu=C3=A8l
