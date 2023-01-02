Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC07C
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 09:11:36 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DF451BF20D;
	Mon,  2 Jan 2023 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672650694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXQ+pbiHmlKkDQiTKOKup65uhul5WhrNqTkDGnhL3Ks=;
	b=piVyYKp58Y0GOM3O5GKe8o4UOClqfub66InYZ5XpJbqjQ1CFEO2eLu8zEUECeUIELx8HEG
	Xsxrgsl/3SRu2wFFFiJGKpLlnjQ+V7yUHb51LT4XE+HMbhalqwcE+bWVFxg1IKBxxyuRl8
	UJpnmlsWyR58uiGSHpGaPIrghiAvfqyqy+YobwHk2ffW4X5us09LxVMe3aP/SBY5DAWxUd
	8A8BsQUgzQOG5v5aXjXogw7Q7TcwRChdXimH4SLEoGmuokyzwJWP3cis2YT1dw0lUU+cQl
	uNIK2caufx1Ho6doVbvpJ3zATKCR1tU0fc0ThzYEpr5FMvlx1pNrgGYRj6Q2og==
Date: Mon, 2 Jan 2023 10:11:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Message-ID: <20230102101132.66aa1a1d@xps-13>
In-Reply-To: <20221229181526.53766-5-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-5-samuel@sholland.org>
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

samuel@sholland.org wrote on Thu, 29 Dec 2022 12:15:23 -0600:

> This is already accounted for in the subtraction for OOB, since the BBM
> overlaps the first OOB dword. With this change, the driver picks the
> same ECC strength as the vendor driver.
>=20
> Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 1bddeb1be66f..1ecf2cee343b 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1643,8 +1643,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_=
chip *nand,
>  		ecc->size =3D 1024;
>  		nsectors =3D mtd->writesize / ecc->size;
> =20
> -		/* Reserve 2 bytes for the BBM */
> -		bytes =3D (mtd->oobsize - 2) / nsectors;
> +		bytes =3D mtd->oobsize / nsectors;

I'm sorry but I don't think we can make this work. This change would
break all existing users...

> =20
>  		/* 4 non-ECC bytes are added before each ECC bytes section */
>  		bytes -=3D 4;


Thanks,
Miqu=C3=A8l
