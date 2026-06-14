Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E43A6EFC
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781443753; cv=none; b=gbEmIdfBUXaThemQAK4OtwIVu6ACg/2YhP+wpRoJURnIcqDBxi9L2OzNi91T/fv3dOEGHaakQa13VjCMmNyi1LfRdHWj3Zt4IjTGh4/Yu685z1C/jff/cgOCZYAAf3XWqXG717+asvmIn3J9i+15MX8eFrTqlOWFkzZ4ZRx9SMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781443753; c=relaxed/simple;
	bh=IOIWRugL/3SvWihH+OP2mK3CmqU8jMkGJ/HW/FOQaKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lh9bNtHbHkndrBteA+YmGBXu3eIdyCE8s5qYBdsFIiDm+xrK9ZDxlfubM+nehDzd22+Z0ciZFeZfuxG1iAWsCyTXZuG/Jz6PeZybNcemLAXTh6BTFLSQ8gIYzrzN/ZkTL9SUT17Jja1o8C7Hg5jIut0vv258pORmiJIxYdK100g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2256437002F4
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 13:29:05 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 78C80B45689; Sun, 14 Jun 2026 13:29:03 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C008CB4567C;
	Sun, 14 Jun 2026 13:29:01 +0000 (UTC)
Date: Sun, 14 Jun 2026 15:28:58 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <ai6smn4BnbAIMXCt@collins>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
 <20260613-nondescript-sociable-goat-aee13a@quoll>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NSEvN2AwITQmLA/Z"
Content-Disposition: inline
In-Reply-To: <20260613-nondescript-sociable-goat-aee13a@quoll>


--NSEvN2AwITQmLA/Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat 13 Jun 26, 20:22, Krzysztof Kozlowski a =C3=A9crit :
> On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> > The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> > controller. It is compatible with the D-PHY found on the A31.
> >=20
> > Add an entry with a new compatible and the A31 compatible as fallback.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml
> > index 6a4fd4929959..3ca1a1c47032 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > @@ -21,6 +21,9 @@ properties:
> >        - items:
> >            - const: allwinner,sun50i-a64-mipi-dphy
> >            - const: allwinner,sun6i-a31-mipi-dphy
> > +      - items:
> > +          - const: allwinner,sun8i-v3s-mipi-dphy
>=20
> So that's enum with previous first entry (50i-a64) - same fallback.

Ah sorry about that. Thanks for the review!

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--NSEvN2AwITQmLA/Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmourJoACgkQhP3B6o/u
lQwV+A/+NkOCmMfOg2YFf5bQKC5plenZLRP17/88N9UXHjsV3ImZ8OtBZjC8y/9q
MzYyACkWYH8Me6BqtOnnWsIhwWZk5dnkibEudFSYZXj6y5XumVtqQY6JuT6fTS7M
+bGYBtH511C/QCiRVSUdV+nh07htVNPouWpDiePOyQxgLRGrXFTjbvX5MAlpiR1z
wld6FnIrX4Scsjs1j2Ow4Ns8ikjQ+TlKbjiErf5PLrqlEgACxcpnpDofDfqNrbBF
wzxJE4QWD3DW5kqxvCKsaFOP8ZqMdlkU0QrH1QCPimrdFlhD8BdkJppLQDLT6+Vw
b9lKj08AwoCZDunrjGBqUPWvsKeHGkWrLGD6ReJP0Pom3t5HSQT0azoc06os6tI7
rqd/BWBSvJe4+efslxM/ptqqqBBn1dRQPqgv46FQDwDh6oIFSeRSCJHn6FcIcxd9
lSTJQLS19oYyiokAu9TBbHfvq0wvLrOytKccxv8e9Uk20ER2X5cInI17KibuAvxU
zy956vSRzj6GG68m8rswA8pwtx4qidemyM4KZMkUxcATDSDUR7KjSWpYWQK7G4bO
BYViglw8xHSVuQCLpKhNk0MghQ//Qx6o+uDmePHmOgkNEQMzXJ8W0URQ94eVkbZC
Lnfbgmtd5fIB7JQgK8fASwIAgprARTW08+bmUxRT4tP4Gt2DukQ=
=7Yam
-----END PGP SIGNATURE-----

--NSEvN2AwITQmLA/Z--
