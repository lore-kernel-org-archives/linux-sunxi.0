Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F667C
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 09:22:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 3EBCACEE76
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 09:21:34 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3A05AE000E;
	Mon,  2 Jan 2023 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672651286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7iy6kRpjbShIO/YNDBtH1+IvGNDYKzJ6crYcrc+yU+s=;
	b=bBD2KATViq9V9UFZTRuVakbuRQmAKRuR+IDKsnCP+gWLdh+yPLGqT/HX6i4IHbXs43RZNe
	yVXVnsWjw91UjV7MAlz7nlm35DsxSEGo/a4ifHfJaJ0oCB4rTnsIrNKWx1KQIlSny87nIv
	KFlis88NcA1ut7c65tYKU/kc2w8RUMnAwukx5uvyRioydsU7uXdFM+2MXFijyNC6tAmmo6
	9nuLZLiIEEzmgK8TyTNCXM59jVBQ97zOnCj6lwSrTAXkJ+7n0v8kwxtl7wbeIy8S5EWWyt
	AMO3z+26t+oOVCfG6c9VTqtwJsGSPD1IsVWrI05gII4nQyocPnP+LSUS6zV+nA==
Date: Mon, 2 Jan 2023 10:21:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/7] mtd: rawnand: sunxi: Update OOB layout to match
 hardware
Message-ID: <20230102102123.511d337d@xps-13>
In-Reply-To: <20221229181526.53766-7-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-7-samuel@sholland.org>
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

Hi Samuel,

samuel@sholland.org wrote on Thu, 29 Dec 2022 12:15:25 -0600:

> When using the hardware ECC engine, the OOB data is made available in
> the NFC_REG_USER_DATA registers, one 32-bit word per ECC step. Any
> additional bytes are only accessible through raw reads and software
> descrambling. For efficiency, and to match the vendor driver, ignore
> these extra bytes.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  drivers/mtd/nand/raw/sunxi_nand.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 8e873f4fec9a..a3bc9f7f9e5a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1604,6 +1604,13 @@ static int sunxi_nand_ooblayout_free(struct mtd_in=
fo *mtd, int section,
>  		return 0;
>  	}
> =20
> +	/*
> +	 * The controller does not provide access to OOB bytes
> +	 * past the end of the ECC data.
> +	 */
> +	if (section =3D=3D ecc->steps && ecc->engine_type =3D=3D NAND_ECC_ENGIN=
E_TYPE_ON_HOST)
> +		return -ERANGE;

Again, I am sorry but I cannot take this change, it would typically
break jffs2 users (if any?) :(

>  	oobregion->offset =3D section * (ecc->bytes + 4);
> =20
>  	if (section < ecc->steps)


Thanks,
Miqu=C3=A8l
