Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF6472771;
	Mon, 11 May 2026 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517248; cv=none; b=k1zR5nxRILWgE8J7lNML6tODFPlFyalri4vGneraslxFT8a8XidDz0eCI6jw09xTIGWm+8xJtolTW8sj3goXQwSkjRnoZJKF/rzgbcAlJNcd+W+t5JESmOYgYi9ARbi/XvGxK02HxAie1JOm6tKOK79HEw0V0g44adG3rQ8MbI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517248; c=relaxed/simple;
	bh=ylz1oiPhtoKBMsOdw8S6ulCdAQFgME1WIIPYHlvBdSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M741WsUjknAyvnrhg7D+NbOk0NCbjkPYKJ2qfY/ah4EQKue3YH9z57VC+/g+2CwaDZiFsXyhE+nHKUBE5UAegv2jXlhyvSNgqrHuC2wpdttcV1+M4BMhZveBztHeMnSNEZZ8+vquWCpZH9AZMrgmKuS/Sa0h4GeaNcdQYlghuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYG9YS7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYG9YS7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B37C2BCC9;
	Mon, 11 May 2026 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517248;
	bh=ylz1oiPhtoKBMsOdw8S6ulCdAQFgME1WIIPYHlvBdSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYG9YS7MrteGT1RlB+bEstA5kHW0D78F1ldj3UaIvplq6TQClpeMn0K2VYwKHXVHF
	 IAoPbUL0/LvPty3d7DovyKMpScfya3e91/n9wQozdm8cwho2urIakok9xyHFrIhwfr
	 r9EyuYAkCUuGvwnxhKsGNwkB/g2WWtJiUY7ImkAYptjlw9IXqT/dZ3cMv4irGDAAzi
	 VvoS+luWIZ4NPIcVF1KQ2wA/42/5lhYI/+5SPutWYuITyNhJKjbVHjbYoAn/RKgtHN
	 XgFlm9TNo6KfYRST9RSl7A8oTGDBP8rmdwv82mKmNysSZMR4frumDULvhzL3Vj8YqC
	 vuHbXaKpMRDxQ==
Date: Mon, 11 May 2026 17:34:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Message-ID: <20260511-startup-subside-343d9f8352f4@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
 <20260511-stock-elitism-f1f703bee1a3@spud>
 <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cB4Di8dSFm0cWmlk"
Content-Disposition: inline
In-Reply-To: <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>


--cB4Di8dSFm0cWmlk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 06:18:22PM +0200, Alexander Sverdlin wrote:
> Hi Conor,
>=20
> On Mon, 2026-05-11 at 17:08 +0100, Conor Dooley wrote:
> > > Baijie HelperBoard A133 is a development board around their A133 Core
> > > board. Introduce a compatible for both the Core and the development
> > > boards.
> > >=20
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > >=20
> > > Changelog:
> > > v2:
> > > - introduced baijie,helper-a133-core compatible for the Core (SoM) bo=
ard
> > >=20
> > > =A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
> > > =A0 1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Docum=
entation/devicetree/bindings/arm/sunxi.yaml
> > > index e6443c266fa1..d7b9dec81165 100644
> > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > @@ -96,6 +96,17 @@ properties:
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,ba10-tvbox
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun4i-a10
> > > =A0=20


> > > +
> > > +=A0=A0=A0=A0=A0 - description: HelperBoardA133 Core
> > > +=A0=A0=A0=A0=A0=A0=A0 items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133-core
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun50i-a100
> >=20
> > Does this make sense? Can the core board be used without a carrier?
>=20
> such operation would be impractical at least, that's why in my v1
> Core board didn't have its own compatible. Maybe I didn't understand
> you correctly.

I just wanted a comaptible for the SoM, so that there's a common
compatible for that if it ends up on another carrier. IIRC these Baijie
folks had another one on their site, but may be misremembering.

>=20
> Shall I drop the above 4 lines, the compatible property from the
> root in sun50i-a133-baije-core.dtsi and only leave
> sun50i-a133-baijie-helper.dtb with 3-strings compatible as it is
> now in v2?

> > > +=A0=A0=A0=A0=A0 - description: Baijie Helper A133
> > > +=A0=A0=A0=A0=A0=A0=A0 items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: baijie,helper-a133-core
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: allwinner,sun50i-a100

What I wanted was just this, so trim it down to that and you can add
my Acked-by: Conor Dooley <conor.dooley@microchip.com>

~heers,
Conor.


--cB4Di8dSFm0cWmlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIE+wAKCRB4tDGHoIJi
0nBNAPwK8Yq4uL0Ra+sraV5A47KnNc4KNwG1tD3MeAzxtUaewQD/RU96WmYb98VU
UBY0rtr749FM3A1Lq53tW1kpdCSISAA=
=MFgT
-----END PGP SIGNATURE-----

--cB4Di8dSFm0cWmlk--
