Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839348C414;
	Tue,  5 May 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999243; cv=none; b=CzrYu90Q1TWsSpAqAHMnSeObevoxvuWVACHs/grIe6sp/lpagOlUrL3wvlfsKFOEO8vpFqYK8MaFl8zEqZW4W6jLBE/G5m9WVj/KW9p70LojInas7gw73fG5wQbgQ7XjvHM84z7BN0G/JFYcuaM1KLc4SC1DW1KYy7hX6wSnsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999243; c=relaxed/simple;
	bh=E1z3zUjASlOjMOF/OVmtvWChIoR/zl1JNjKXpF8ra/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCC71ZqeljOGXpyT2thPk9jEspw7oNTBiIxKtvnBPgUVbne4wXd+InaJfH/HfS0FA2RclycCO5KOwVMN7/Ovq4wKBMIZ8vmBZyb/GMLSTCGEc0YvOTY8gRqtexhk7c7MDcCdzAe+Zyf1Tww7EFG4//Y79ZnB6KF9n+YCT1MoVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm9v+PQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm9v+PQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9070C2BCB4;
	Tue,  5 May 2026 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999243;
	bh=E1z3zUjASlOjMOF/OVmtvWChIoR/zl1JNjKXpF8ra/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm9v+PQLtoFdeAaRFUzCvDp2QU590pe2wi5eIc3SWVnzqeYt7WqKkJlDqyU2hEOL5
	 N8fADdKNVRJG5hlWkrN5gP5/MzUOBLK6ywqgNhHi9cGrqUQLnFTLanyCrbRK7dRuHH
	 0LWhJ/cgOpPkrv2zlM7crL5qGmx0vdXzo9cMkl0h4LzITdn5InH6gprA0tUCZBQTj8
	 dy1jjK9W6VQ3ASlHtfk9nq6tAbUI/O+lQKONKD8gEsLIlsefha7xx45MUkfIXk9AhE
	 SbqEDmDaeQbTAWk4RVKHxLxgH3aMqmEOoo2fuLYqJArjtOzh3v4EEnv+fC801N4fFG
	 jn6xfi+y4jQ4g==
Date: Tue, 5 May 2026 17:40:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133
 compatible
Message-ID: <20260505-uncommon-concert-745d52cff0d5@spud>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
 <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
 <20260505-collision-evict-acc27ae41c3a@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X6nW2CY7XUeswqso"
Content-Disposition: inline
In-Reply-To: <20260505-collision-evict-acc27ae41c3a@spud>


--X6nW2CY7XUeswqso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 05:39:09PM +0100, Conor Dooley wrote:
> On Sun, May 03, 2026 at 09:18:37PM +0200, Alexander Sverdlin wrote:
> > Baijie HelperBoard A133 is a development board around their A133 Core
> > board.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index e6443c266fa1..52b42779a283 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,11 @@ properties:
> >            - const: allwinner,ba10-tvbox
> >            - const: allwinner,sun4i-a10
> > =20
> > +      - description: Baijie Helper A133
> > +        items:
> > +          - const: baijie,helper-a133
> > +          - const: allwinner,sun50i-a100
>=20
> Should there additionally be a compatible for the som here?
> Looks like there is a product called the "helperboarda133 core board"
> that is soldered on here but has a separate product page.
>=20
> The dts/dtsi probably should reflect this too?

My wording here was not clear enough, I meant that your dts/dtsi
reflect the fact that there is an independent board deserving a
compatible.

>=20
> > +
> >        - description: BananaPi
> >          items:
> >            - const: lemaker,bananapi
> > --=20
> > 2.53.0
> >=20



--X6nW2CY7XUeswqso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafodhgAKCRB4tDGHoIJi
0vlCAP9mlDenlZNZPTlAWLB5+nXsLVRY5IiD54rPW9vRrzltowEA1jLdjtEpus7C
G7z8lW6c+ZBKnpaXtMI0Gxd8xOsT2ws=
=vwdC
-----END PGP SIGNATURE-----

--X6nW2CY7XUeswqso--
