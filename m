Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99C1C861D
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996175; cv=none; b=mgNku24d35qxhQzo/zOKBN8V/ZaYkG4NfCf823Qs2PCPGY/xl2gthaT+iKlVUBT/bZxXz/m2JJDod1sgs2+ETEifAW1ojMYmkPLAZPQq0TnHaFzR04WGGmJ13mTmvc5tKsQDJQiuUmYmoqP12pC2fWlhc2deYVzLRetYvf3eaHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996175; c=relaxed/simple;
	bh=WI8kcPMKepreWLOrEIywV6c45S8hONwGyzveuvAxIfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQVlqVLGUSbSH+IA+Q3DgWBVxKnZnq2SMBtysPfbi+MCOCRIW6+BM8IqycZvqzP1OG6VweLzhwJOdfLtIqe88StPlINDmSB46zECZOOkCEiPZab39RLX0jtXOljeRI8+kW272SPPrNfKvYD4MFtaqmqPRIclHTII5Z37ERwWzPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 92B701F8005D
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 15:49:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0AA2AB40579; Tue,  5 May 2026 15:49:24 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 70205B40573;
	Tue,  5 May 2026 15:49:17 +0000 (UTC)
Date: Tue, 5 May 2026 17:49:15 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <afoRe6DI4GJIVtg4@shepard>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IcCSgzqLbu8G5Ifh"
Content-Disposition: inline
In-Reply-To: <20250307002628.10684-9-andre.przywara@arm.com>


--IcCSgzqLbu8G5Ifh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> Add the clocks driving some core system related subsystems of the SoC:
> the "CE" crypto engine, the high speed timers, the DRAM and the associated
> MBUS clock, and the PCIe clock.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 17a4ffc0b7f52..c59f3f789d052 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c

[...]

> +static const struct clk_parent_data hstimer_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> +				       hstimer_parents, 0x730,
> +				       0, 0,	/* M */

I was looking at the A523 ccu code and see lots of
SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.

Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_GATE
instead? It would surely be less confusing.

One difference would be that the ops end up as ccu_div_ops instead of
ccu_mp_ops. Do you need ccu_mp_ops for some reason?

Thanks,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--IcCSgzqLbu8G5Ifh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6EXsACgkQhP3B6o/u
lQwfow/+Nmt6lPhpLN/DGQatcYI/cvk6GcczulX9uuLLoTSneynxgeZy25VIhA9r
gDmZowD4hA4UILkiAczLx0yazfTnpXjYRGqfIDchLwaRBrdflY/lPe/Kz+OkRj35
/InUMORdlfLrOKqADax33IVLZEBre+sZ5laGld+MWQnRjmsGyzb8xyfeygWMS/0E
vPEtQfeSOETnAH9JO8p6t4b+rCj34Z1s9A4kBD93M873OB/IwPrhRebCqDMb9V6y
ASujwO/X4e6FRmZIJfgGH+vL1Ghi9QIoLlEdDMM9JcQzJ9BvHU7d1n+Y4kALHW+m
R9wrg88suUU2UngfiHeF2UlxldTY/0Kj0+2YdeZsoe/v/3LEwj4+p0rdnyb2/KDR
1mkAJG+Z0ww7mAsECDGttSYLX3D7koO2LENC3ADYjO2kauZXE/3br3WjwNsQKusk
PTVwWaGCjyoETzcEGU4Yzw0QTC+jjuGfpEn6KaGRojzuV9ZWbzMquNh0OJA18Hgz
hB2GQrHAVVV6wSJPd/xGlU/1ADSANHg7s8waKT6z/kWchUlV/KtWeAtfK8agb2Hj
vfD2Vl7yBHgRd460lBffM8QhMB9ySPmiBtrh4hzbCnm5+EvvM7gNFsSYHHtu4orI
iOQSyV/2V1w7uOXnpWnHlv1NaAgSg69oN7sZc4ejz6VlinneNIc=
=rNoU
-----END PGP SIGNATURE-----

--IcCSgzqLbu8G5Ifh--
