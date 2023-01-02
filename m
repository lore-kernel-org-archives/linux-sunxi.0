Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAA5667
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 16:47:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id CD5EEC212B
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 16:45:29 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 244F7C0009;
	Mon,  2 Jan 2023 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672677922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5O8OXS7nc8duFjds7VaePab6wVG7wkizTo7pWgR7AjU=;
	b=OBqHHGO6YyKEC+KEYE13IBtCFpLbiKK7TaqZsET9nQAswKq0CXiBI4tkhPIX67Hp3HBFDU
	c8h3kNIAuiKq2QHFEgMZXq9HfO7H8QPChWGak6Bbnhe6EIV5NjNPWwerot7QJg3hh8hKc9
	mhrdkTGlJ1LWSNQNuIA7dxShpjeE6in4YcAbFSM6jK144YqIuHMCKAlJWgHZbsM1rM9fpF
	KUv0OXAhO5NwaRoQz+91haa6YXB+SFSd0VvCDSCv2gyC5ZthwtRPSEouxslpwkyw7SCcy/
	2WjXAeHK9z8kzPMbbPTqugOS1Xi7T0InVPvYyGf34PhjA2EWB4HOwa1fhO4Uwg==
Date: Mon, 2 Jan 2023 17:45:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Message-ID: <20230102174517.1ccb3654@xps-13>
In-Reply-To: <4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-5-samuel@sholland.org>
	<20230102101132.66aa1a1d@xps-13>
	<4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
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

samuel@sholland.org wrote on Mon, 2 Jan 2023 09:59:29 -0600:

> Hi Miqu=C3=A8l,
>=20
> On 1/2/23 03:11, Miquel Raynal wrote:
> > Hi Samuel,
> >=20
> > samuel@sholland.org wrote on Thu, 29 Dec 2022 12:15:23 -0600:
> >  =20
> >> This is already accounted for in the subtraction for OOB, since the BBM
> >> overlaps the first OOB dword. With this change, the driver picks the
> >> same ECC strength as the vendor driver.
> >>
> >> Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>
> >>  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/=
sunxi_nand.c
> >> index 1bddeb1be66f..1ecf2cee343b 100644
> >> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> >> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> >> @@ -1643,8 +1643,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct na=
nd_chip *nand,
> >>  		ecc->size =3D 1024;
> >>  		nsectors =3D mtd->writesize / ecc->size;
> >> =20
> >> -		/* Reserve 2 bytes for the BBM */
> >> -		bytes =3D (mtd->oobsize - 2) / nsectors;
> >> +		bytes =3D mtd->oobsize / nsectors; =20
> >=20
> > I'm sorry but I don't think we can make this work. This change would
> > break all existing users... =20
>=20
> OK, it is not too much of an issue because I can manually specify the
> ECC parameters in the devicetree. Do you think it makes sense to fix
> this when adding new hardware variants/compatible strings?

Actually, looking at the code again, I don't get how the above diff
could be valid. The "maximize strength" logic (in which this diff is)
looks for the biggest region to store ECC bytes. These bytes cannot
be stored on the BBM, which "mtd->oobsize - 2" tries to avoid, so we
cannot get rid of this.

Thanks,
Miqu=C3=A8l
