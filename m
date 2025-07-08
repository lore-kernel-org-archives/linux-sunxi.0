Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C152E540C
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992807; cv=none; b=qVGVxdMwoeiY0uobsWPjdMAU7TQyQtottTm24f6m33KGT/1OU/+BTodXx9gqv7qY6qUSgw6VuNXxPwmnjd8DNAPiMke2ZPS09g48g9HRSpBKFrVp41xGy7AZ+XkgNIEI0rVgZhsIh49w9IpX3HUMwcpEC8CQW7fqIpimJIF34j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992807; c=relaxed/simple;
	bh=yGUXc3q8hxw9BufjiPqbhhE8IrllD96mlf0Me4zXl5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DUWb4m8UZAdLtfSPEGtci0bBQVSPl+mbq7x8zXlR5+PkYIosR5zwBean1CJfMPzhuCTLM8xMIRatwpLJxbShT/O/ubXcToe3gHDvmw+qKT2fa0IfEE717tHDEZxGTGcHWaVagomIo6ki9TpM9iKKr4Ke7E9WJbiIK/gPsIiQK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=dksLHObk; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="dksLHObk"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=sb3Ia46GvHWQG/m6KFesc++Cm7iF3bdWTLNCqcNKb+I=;
	b=dksLHObk0QrRNQZmlmL/+dJtNO+pEIS0BjbKjBO4wVwFEL6YF6UOFbfSgNLv6odRG2HoVD+Jku4BAu8HuNmCKlHAzOVEgohL/X3aCL8tDlxlev9/Xup8ohr/rClTZd4PmNHOGyTeD+Zdb46ZsObIcMw/dKHhpRuFS6shPbW4MzQ=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 8 Jul 2025 18:39:49 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v3 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's required by
 NetCube Systems Nagami SoM
Date: Tue, 08 Jul 2025 18:39:48 +0200
Message-ID: <2513861.jE0xQCEvom@lukas-hpz440workstation>
In-Reply-To:
 <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
References:
 <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-3-lukas.schmid@netcube.li>
 <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2440550.NG923GbCHz";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2440550.NG923GbCHz
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: wens@csie.org
Date: Tue, 08 Jul 2025 18:39:48 +0200
Message-ID: <2513861.jE0xQCEvom@lukas-hpz440workstation>
MIME-Version: 1.0

On Dienstag, 8. Juli 2025 18:36:03 CEST Chen-Yu Tsai wrote:
> On Tue, Jul 8, 2025 at 8:35=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube=
=2Eli> wrote:
> > Added the following pinctrl's used by the NetCube Systems Nagami SoM
> >=20
> >   * i2c2_pins
> >   * i2c3_pins
> >   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
> >   * spi1_pins
> >=20
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> >=20
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> > e4175adb0..8dc3deccb 100644
> > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > @@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
> >=20
> >                                 function =3D "dsi";
> >                        =20
> >                         };
> >=20
> > +                       /omit-if-no-ref/
> > +                       i2c2_pins: i2c2-pins {
> > +                               pins =3D "PD20", "PD21";
> > +                               function =3D "i2c2";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2c3_pins: i2c3-pins {
> > +                               pins =3D "PG10", "PG11";
> > +                               function =3D "i2c3";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_pins: i2s1-pins {
> > +                               pins =3D "PG12", "PG13";
> > +                               function =3D "i2s1";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_din_pins: i2s1-din-pins {
> > +                               pins =3D "PG14";
> > +                               function =3D "i2s1_din";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_dout_pins: i2s1-dout-pins {
> > +                               pins =3D "PG15";
> > +                               function =3D "i2s1_dout";
> > +                       };
> > +
> >=20
> >                         /omit-if-no-ref/
> >                         lcd_rgb666_pins: lcd-rgb666-pins {
> >                        =20
> >                                 pins =3D "PD0", "PD1", "PD2", "PD3", "P=
D4",
> >                                 "PD5",
> >=20
> > @@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
> >=20
> >                                 function =3D "spi0";
> >                        =20
> >                         };
> >=20
> > +                       /omit-if-no-ref/
> > +                       spi1_pins: spi1-pins {
> > +                               pins =3D "PD10", "PD11", "PD12", "PD13",
> > "PD14", "PD15";
> Could you split out the WP and HOLD pins as separate nodes. They aren't
> strictly needed for SPI, and folks might have designs that use the two
> pins for other purposes.
>=20
Sure. Do you want them as seperate ones, or is "spi1_hold_wp_pins" fine?
>=20
> Thanks
> ChenYu
>=20
> > +                               function =3D "spi1";
> > +                       };
> > +
> >=20
> >                         /omit-if-no-ref/
> >                         uart1_pg6_pins: uart1-pg6-pins {
> >                        =20
> >                                 pins =3D "PG6", "PG7";
> >=20
> > --
> > 2.39.5


--nextPart2440550.NG923GbCHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhtSdQACgkQJnN+drMV
Rtg4KAf9EVLKK7Fj2AIGp+nnuZ4ruR8JzYCN3oLuyUWUifIWvCkBMjPZpW/H0A88
cxYL5e2fNcxc8qNDCEZWuqMLXDMqlfmwnUluIbSNCERK8lhdHu8X+5WE9/3S+FVi
pnfm/gzL6aL07i1NdY/qTbJRa8zp5rFUmKUD+yWYAJBG+rHbnX0znNSvmy7Cwkqh
1cEXCgee3dOHgznWHSNecnGBd1ICGzIo/IlBFQimeBaCwPJN1BJfUoAnU39RQDd1
6PeaoU00Sx8LfCkXeGExjkJmjxNs+cdTVnV8YnR4Gi6rLyVx0QshZMC+Bsd3i/1f
OVNr7M98Z7d1krM+RFY5oqry49Gsrg==
=XHV/
-----END PGP SIGNATURE-----

--nextPart2440550.NG923GbCHz--




