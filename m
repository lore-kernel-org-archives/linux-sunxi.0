Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF83438A9
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364051; cv=none; b=KdPy66rLGuRh3ScGnZ38tqlAkyC1aS6ECwRM5PmQfsvdF7QQHlJG3m57h/+SsdnQlTSwu5v2711jLW5PqCT61p5j+/Yx5l0+hxs3kKMoV6IzPL2sZJmhGhJoXclqafHFcwlHn/8I8Y6aCOg6yVcip7YHiesNp1lIreqH1BQmuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364051; c=relaxed/simple;
	bh=+WtfWl+JNGyvdAuH4MDylZDgxWH1C2m2shsGJgJv7Rk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rmDgv9Iajf5BAJDAEscuzNiRxR20n11ONmmPBViROZ2aZpQe0ibAMdCOUPkm492SviZGxoW1rF7YXEBwzvC7c64lu8TLu873tCCIZlmGU1ReZmlNFV/dcp5gHW3nphRrvP1f+noJyd7og1KmJZSHgCOsfB/h54KmxAOIxhfuyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0f0+YQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0f0+YQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF791F00A3A;
	Wed,  2 Sep 2026 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364048;
	bh=+Ee7c1bGA37BKl6OF5BIT1vfuLOmbHh1P2kqRrmPQDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0f0+YQp1t5SyGhDzfJyc+KgaSOHMwyu15stl8ZTY5ep59Rv1m6SCkVDDHxkMViUx
	 lESYaq3qjEyLkvX7gDR8+NL4PkMGRR9Qi8PIkRhc1DovW6CTEEXcnTImutkk65GksP
	 ZsKou9HP5sxvzn6MDcbQ9kUWNtBQKg1++cvuSD+ttzVs79l/pd5b1zCKc6HouzFosU
	 J2ZVgO+1OrnbOP4bvMvnkgs22/T/BC8xHL90sgruRGgSvU5oDyKeo1+ak2bJ/SMBYS
	 UOIfUnyb5MVdCtcMrZQao0qPKglWT96heAEyrdJdGGGcaS+6I7tZrHvXBAMrVRBmYL
	 Sheamxj+tf6gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] spi: spi-sun4i: sun4i_spi_transfer_one(): fix
 setting of clock rate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260902-spi-sun4i-fixes-v1-3-19985ef75673@pengutronix.de>
References: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
 <20260902-spi-sun4i-fixes-v1-3-19985ef75673@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:47:28 +0000
Message-Id: <20260902154728.BAF791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Off-by-one in the CDR1 clock divider calculation omits a required =
'- 1', resulting in an SPI clock that runs at less than half the requested =
speed, which deterministically causes false transfer timeouts for large pay=
loads.
--

commit e08997f492b7dd1b9df03ec9d36b3a190b6b3325
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_transfer_one(): fix setting of clock rate

This commit modifies sun4i_spi_transfer_one() to use DIV_ROUND_UP() for=20
the clock rate calculation to prevent the SPI transfer clock from=20
exceeding the requested maximum speed. It also simplifies the CDR1=20
divider calculation by using order_base_2().

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 3649bcabcc9a7..ae009d5984505 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
[ ... ]
> @@ -296,14 +296,12 @@ static int sun4i_spi_transfer_one(struct spi_contro=
ller *host,
>  	 * First try CDR2, and if we can't reach the expected
>  	 * frequency, fall back to CDR1.
>  	 */
> -	div =3D mclk_rate / (2 * tfr->speed_hz);
> -	if (div <=3D (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
> -		if (div > 0)
> -			div--;
> -
> -		reg =3D SUN4I_CLK_CTL_CDR2(div) | SUN4I_CLK_CTL_DRS;
> +	div_cdr1 =3D DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
> +	div_cdr2 =3D DIV_ROUND_UP(div_cdr1, 2);
> +	if (div_cdr2 <=3D (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
> +		reg =3D SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
>  	} else {
> -		div =3D ilog2(mclk_rate) - ilog2(tfr->speed_hz);
> +		div =3D min(SUN4I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
>  		reg =3D SUN4I_CLK_CTL_CDR1(div);

[Severity: High]
Does this calculation in sun4i_spi_transfer_one() set the divider exponent
one higher than required?

The CDR1 formula is MOD_CLK / (2 ^ (div + 1)). By using order_base_2(div_cd=
r1)
without subtracting 1, the actual divider becomes 2 * 2^ceil(...), dropping
the clock speed below speed_hz / 2.

Could this break the tx_time calculation for large payloads and result in
spurious -ETIMEDOUT failures when a low speed_hz falls back to CDR1?=20
Should this subtract 1 from the order_base_2() result?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-spi-sun4i-=
fixes-v1-0-19985ef75673@pengutronix.de?part=3D3
