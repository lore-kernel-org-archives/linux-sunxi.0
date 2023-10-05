Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E54A4A33
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Oct 2023 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROOqrXSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0661C116AE;
	Thu,  5 Oct 2023 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696495397;
	bh=218XNg/GoPgABsb7uA/Apqobt3iP8Nl0g4cKkzZXagE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROOqrXSmUkFTrQIF6h+xsidEe1fFjaTAcptBoB6is7u13GbqRZN1sWIYxqiq15I4H
	 ZVpZwZm6kuZaYCPuVJGJ5NVi+rvEuQi2IUx5AUsE4qMvY2zWGIRFKQDMoPTizMh+w4
	 JON4ps9MNemlO0HHE1flxciwRDAWpklgggtDFP70tMGnH+wq5kZuHDQuStZwtBQmVA
	 4kcTjHAmh4ZVUFBqQMJaWw1HlI1Ja3kk4i1SXTq6XkIf05xcsXsLUlWxSl2jHQYo8P
	 6vMweCA3M6eT8EhjHW3qOZ9faf2nLKZVMntzxRKmIAuGd56v0yiN6IE7cWJHbZ8voR
	 mmD2Em27h8Gvw==
Date: Thu, 5 Oct 2023 10:43:14 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: wens@csie.org, airlied@gmail.com, daniel@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <3cwcfx7fvtr75j6musdqttn6oto4wemsx7lh664gu3run6wxnz@5o5vao4wibm5>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-6-jernej.skrabec@gmail.com>
 <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
 <3441738.QJadu78ljV@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akojmyevkkccggkv"
Content-Disposition: inline
In-Reply-To: <3441738.QJadu78ljV@jernej-laptop>


--akojmyevkkccggkv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 05:07:45PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 25. september 2023 ob 09:47:15 CEST je Maxime Ripard napi=
sal(a):
> > On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> > > There is no reason to register two drivers in same place. Using macro
> > > lowers amount of boilerplate code.
> >=20
> > There's one actually: you can't have several module_init functions in
> > the some module, and both files are compiled into the same module.
>=20
> Yeah, I figured as much. However, I think code clean up is good enough re=
ason
> to add hidden option in Kconfig and extra entry in Makefile (in v2).
>=20
> Do you agree?

Yeah, I don't know. Adding more modules makes it more difficult to
handle (especially autoloading) without a clear argument why.
Module_init is simple enough as it is currently, maybe we should just
add a comment to make it clearer?

Maxime

--akojmyevkkccggkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZR53IgAKCRDj7w1vZxhR
xbUSAP9ybpgLK3mOS/+R2KPNbc5R8IB65px6R8ILedtprgVXPwD/YwX2t84ygDJ+
MKsp/whtkWxQ9rbIzIt9+fO5LH6xvww=
=W7Km
-----END PGP SIGNATURE-----

--akojmyevkkccggkv--
