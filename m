Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE05B2562E;
	Fri, 13 Sep 2024 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726248344; cv=none; b=CAq3HnJfBenetT7oJjs23FzqVEwrqDSXiy/jglzAKVzyCvfR3DAR+PPtosxqSEPEpLCVdVBd8qGaxKqbQZ4x2ltCwgwjwA0HQUYsWFiQpeMPAGkaJvKeaIevq4BGkeMhsvUOFpTI+o6II0cmd3MILE64ty9z9z+K8vw2OH6bldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726248344; c=relaxed/simple;
	bh=2oJu5gnYXFlqvyj7LMUho0tUx9dwavN3a2NzpR93BWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nam1D236PGyeIU1LccBVHUKoTjeq99RnBCbaYRCLV4FZiMtU1dc8bezXJkQVgRmmogVgCAEGdw+ak8PnglQYznncdYZPV2ALnfM254qNy9UuoQXdEre4wJEk759IzWC3u76s2i2I5rqQPO0vdCpmCkBp3uCMfd89XQH1c7PSpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qn8CVC1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qn8CVC1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD2C4CEC0;
	Fri, 13 Sep 2024 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726248344;
	bh=2oJu5gnYXFlqvyj7LMUho0tUx9dwavN3a2NzpR93BWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn8CVC1c0sXcmbgBhartxN2G0DABLvODrqju+/HuNwwkl8t13iONIxtXQHyKQmF48
	 2PW1GD0t/KaQiKlRKx3glHGpPzib+98kuyTqen5W3Pw1VhGhb2sAAiNaq6/YubO6Wy
	 omah2UfsUm5e4VS+Gq9HUDkYqv/9fQ9+tYp1CvSbXmnfwU0sD1nWmOFLvdhI72hVBp
	 rRkJHI33j+sVlasTnEXsx+0xDVfQxZ5x3G/D5wUW5akXpqr0yPb0Z2FuK2eCvkbmtf
	 HCMbSi8QCVX8teV5Pfc8nVGqUFiSnJcuMVhR1FYiiSeVEP1+yhuak+/2BXIYuFlON0
	 c4ZX05DIvheAw==
Date: Fri, 13 Sep 2024 18:25:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: document RerVision
 A33-Vstar board
Message-ID: <20240913-thong-endowment-cb760617f7c5@spud>
References: <20240913104845.4112986-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oMRq14sTUO9x8LTg"
Content-Disposition: inline
In-Reply-To: <20240913104845.4112986-1-uwu@icenowy.me>


--oMRq14sTUO9x8LTg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 06:48:44PM +0800, Icenowy Zheng wrote:
> RerVision A33-Vstar is an evaluation board of their A33-Core1 SoM.
>=20
> Add its compatible (with the SoM compatible) to the sunxi board DT
> binding file.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oMRq14sTUO9x8LTg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuR1kwAKCRB4tDGHoIJi
0gOcAQCuUkpqUP9QEdlqxxHGGyvwYebhAMnJoIctTDLBrvMUkgEAkRTkmcuvEIfC
KeZXgMjtPWP4wXx3KAyefwErq5gHxQ0=
=2G1a
-----END PGP SIGNATURE-----

--oMRq14sTUO9x8LTg--
