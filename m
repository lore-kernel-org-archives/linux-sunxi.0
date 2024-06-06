Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F8194C95;
	Thu,  6 Jun 2024 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673448; cv=none; b=dVzMNBdwrBaboEFYm7N+xhrdeoThNjWWFRhllEVrwcbRQ1B8Zebqkc2gs+XqctjjclNbffr9FlrxkxRRpMf1Tr3fxJpb/TAF0+LduGTt+czTfFivnIEndtmZnArYxfKBNk9vrl9dQEbkRXwF5+PpamVxx1g1/Gj6Y41YPQVlGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673448; c=relaxed/simple;
	bh=dFc3hm7ov9T7IZg/C9dECSZgR320ZZL6YjDzX/9Vf5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOpJE9KCRwOcAS6cZo8KpekV8rx/SrWn3maJL1VnFm656Hk1sgHJPy27wuIUE0bq+yoONY02uPjgG9Q9XQHwjG5A9Iys4voaHwNKDzuu+lv3OeT5oJux37nN45HkSmZxL0TTHk79X71YJwzd84d0oDGQmt5u1W81t8xtvc8FsjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVnk+jyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVnk+jyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3520C4AF0C;
	Thu,  6 Jun 2024 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717673448;
	bh=dFc3hm7ov9T7IZg/C9dECSZgR320ZZL6YjDzX/9Vf5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVnk+jyGsNLx4dLHRhNkPGO279LFV2R0QhVX/bT0jJcCP6odpq7ndKArj3UcnD5Zl
	 tihzSVIFXJq1tT2WdUVzh5CEmc9GGaW5Aj+Hbapcaww1D7fcdtwWjtN/ixaBss2O9R
	 rJJTTllAqqia9rIBb1xhjXQviQvBzOJHJX9eAWy3o1DfAvliQ1g1xZb6bp5Cd7jiDI
	 ISo2vkDb9gU7ZP3HI39jK3iphhRJeayiYxHpSj7JINlwwtmpeqrEVSGX9Sj+6+ph0J
	 +GU+hYM4ZTWMyo/F3xnlki9hHKBMIHa8SYJqtXSdnaChjH+468khLqoKCyM78jLlPY
	 IDWuo7IIWjMWw==
Date: Thu, 6 Jun 2024 13:30:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, ryan@testtoast.com, samuel@sholland.org, 
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Message-ID: <20240606-ludicrous-unyielding-gerbil-e23f41@houat>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <20240605185339.266833-2-macroalpha82@gmail.com>
 <20240606112614.5380b2d1@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cv6eaalu473bwmxc"
Content-Disposition: inline
In-Reply-To: <20240606112614.5380b2d1@donnerap.manchester.arm.com>


--cv6eaalu473bwmxc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 06, 2024 at 11:26:14AM GMT, Andre Przywara wrote:
> On Wed,  5 Jun 2024 13:53:38 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >=20
> > Add the Anbernic RG35XXSP variant device and consolidate the Anbernic
> > H700 devices.
> >=20
> > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > clamshell form-factor.
> >=20
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../devicetree/bindings/arm/sunxi.yaml        | 24 +++++++------------
> >  1 file changed, 9 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index c2a158b75e49..1ae77e5edf9a 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -51,25 +51,19 @@ properties:
> >            - const: allwinner,parrot
> >            - const: allwinner,sun8i-a33
> > =20
> > -      - description: Anbernic RG-Nano
> > -        items:
> > -          - const: anbernic,rg-nano
> > -          - const: allwinner,sun8i-v3s
> > -
> > -      - description: Anbernic RG35XX (2024)
> > -        items:
> > -          - const: anbernic,rg35xx-2024
> > -          - const: allwinner,sun50i-h700
> > -
> > -      - description: Anbernic RG35XX Plus
> > +      - description: Anbernic H700 Handheld Gaming Console
>=20
> So that's certainly an interesting optimisation, but so far we were using
> one entry per device, it seems.
> I am not entirely sure what the purpose of this file is, exactly: just to
> document the compatible names

That was the initial intent, yes.

> to reserve them and avoid clashes in the future?

And I guess it helps with that too :)

> Or also to put some official names to each device? That seems to
> somewhat overlap with the root node's model property in the respective
> device .dts, though.

I guess it's a fair criticism. It would be hard to collect all the
compatibles without describing which device they belong too though. So
yeah, there's some redundancy, but removing the descriptions entirely
would be worse imo.

> It would be good to clarify this, and establish how to group those device=
s.
> I mean technically we could for instance put *all* H6 devices into one
> entry, using the same scheme as below.
> Not sure that's desired, though.

I don't really have a say there anymore, but I always tend to prefer
consistency in documentation as a user. Even more so since that kind of
categorization tends to be very subjective and thus super inconsistent.

Maxime

--cv6eaalu473bwmxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGd5AAKCRAnX84Zoj2+
dnFWAYD4SQNfsyqi4SjgiQtf9yMI/HW60ksNRGfqF01VNV5ITl6XdvSak6jyxVRD
0E6nkVsBf2ZETZavq1QtPaYT1TDh1iaTulpSyeN9PDKQlwltn3jJgaxdmsh4jFNO
qM/e5Cu63A==
=vgBB
-----END PGP SIGNATURE-----

--cv6eaalu473bwmxc--
