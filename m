Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2C1F959
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 12:06:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D684FD30E0
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 11:55:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A21881C000B;
	Wed, 12 Jul 2023 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689162898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UII/wsuuzjNZbpiAVeF6yDZcHsS9cuVB0V5RDHl93hA=;
	b=jwaWI0SF7ZVsRx+L0joo3eYJtnmAqCUL2W8brhepKTSZTXHTvzeDDGoWe9ZiQsiMDUwf7t
	hkFkCd5CO0qV7DbICAuhmh0+Uf08FN7I5YFKiEvtvnquH7CtW2B2KnKOBeP1Hq7jzhvmzA
	316H3iefNRuN+nCWQY2l2T5BtUVu7Z6Smpt69xG9Z/yN2irBcGatyWeBzXLo1bqrlALgH6
	s4tOCgd8K3mDSeojM7Ja/l/IcnCbxb39aVAxn366LEqokJ0Uea6mvUXij+l/n4uKeuFHM4
	kyqMGliKSaKvuYYq2U+w16qkX7QNyEMYFsLBaK8GNLvj3QelxNM5d/FJGPwMOg==
Date: Wed, 12 Jul 2023 13:54:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712135455.71fbeb5f@xps-13>
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
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

Hi Yangtao,

frank.li@vivo.com wrote on Fri,  7 Jul 2023 12:06:05 +0800:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9884304634f6..db36bd755b8d 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2087,8 +2087,7 @@ static int sunxi_nfc_probe(struct platform_device *=
pdev)
>  	nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
> =20
> -	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->regs =3D devm_ioremap_resource(dev, r);
> +	nfc->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &r);

Why do you keep a reference over the resource? Why not just
devm_platform_ioremap_resource(pdev, 0) ?

This comment is valid for almost all the cases in this series.

When the resource is only needed in an error printk, I am also in favor
of modifying the error message to avoid having to grab the resource.

>  	if (IS_ERR(nfc->regs))
>  		return PTR_ERR(nfc->regs);
> =20

These comments apply to the 18 patches.

Thanks,
Miqu=C3=A8l
