Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DB7C
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 09:04:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 79F60C3E00
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 08:59:25 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BD1BA1BF204;
	Mon,  2 Jan 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672649957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onwm0vxTtpJ/7A/xd568TVQxILdHEoQevXcykzJqiG8=;
	b=Z//qXKKap68bm1zIwDki2VQy7UojW4glXIhi22NRwxF2GBP2wWOlV2q79Ns6y/YOPHaMMZ
	uEBpt/PV660NvzmLSutFmJpAvdsKvpDcn2Ns2QcdO3p+pPfkIx2s1SCngH2rQ41sa8m4ym
	w4uJmhemLJE8gJd3zH2Y+v1CHWCg1yNy3bSpqq0o42xcp4a243K7a+oW0F9vFx2ONK2muO
	CP2fsj+YnJZjXmDPTiQx9vgMUosfZ4B0TGmt8nuJf3t9iOdQv1lX+92zV4T0fSoRToNWks
	Dv9pJK4ngsM78ToMT+X1fcTPSFD85WV2qTkI8amBQ7SMVm9MacwpWUg5j7pmrA==
Date: Mon, 2 Jan 2023 09:59:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] mtd: rawnand: sunxi: Remove an unnecessary check
Message-ID: <20230102095911.0243d5b8@xps-13>
In-Reply-To: <20221229181526.53766-3-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-3-samuel@sholland.org>
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

samuel@sholland.org wrote on Thu, 29 Dec 2022 12:15:21 -0600:

> sunxi_nand->nsels cannot be zero, so the second check implies the first.

Actually this check comes from a time where we did check against -1 :)
But, yeah, now it's a duplicate.

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 2ee86f7b0905..8b221f9f10a7 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -421,7 +421,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *n=
and, unsigned int cs)
>  	struct sunxi_nand_chip_sel *sel;
>  	u32 ctl;
> =20
> -	if (cs > 0 && cs >=3D sunxi_nand->nsels)
> +	if (cs >=3D sunxi_nand->nsels)
>  		return;
> =20
>  	ctl =3D readl(nfc->regs + NFC_REG_CTL) &


Thanks,
Miqu=C3=A8l
