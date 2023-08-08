Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF837C
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Aug 2023 14:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5741BC433C7;
	Tue,  8 Aug 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691505134;
	bh=MH6d9daFOxOoUw3EqmWMlFDO8lTspBrOmvGmg5d/GCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kicd1tuwLvqYGEBRTc+2ND/MElHfgmvgUIKu3m+om1pjy3kY6ZqlebNr8qgKCgVn8
	 DmlCKah98VHQjUuZdrBp7T5pXTRmw3Ourhp5kWvmKcBYMVo7VajksjhevF2ZTwvu4n
	 m57apNrM2w50viLchtbUFC0gl/yhib9TqJfr2SxOlit2SA1460rgCNo2UXh1UvMHBK
	 mf5XCu7uyuLXmg/IxQ3//algUxmj8dCVUvtp986iEq/nDYUp+ULtryf6c8/txD4oGq
	 RLkKGL4+3fo/0Keos+ZgbMOHt1ZjAoTebXafCiKrDwa1wQjLh1N33R0URvrPlZ8HyA
	 9hmBgKpTIpfcA==
Date: Tue, 8 Aug 2023 15:32:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <20230808-swerve-tartly-07140c59539e@spud>
References: <20230807191952.2019208-1-contact@jookia.org>
 <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xR/RJpD/V1xuh2KJ"
Content-Disposition: inline
In-Reply-To: <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>


--xR/RJpD/V1xuh2KJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 04:26:17PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > Both of these fully support both CAN controllers.
>=20
> Please choose a corresponding imperative change suggestion.
>=20
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.5-rc5#n94
>=20
>=20
> > Signed-off-by: John Watts <contact@jookia.org>
>=20
> I find the local-part of this email address suspicious according to the D=
eveloper's Certificate of Origin.
> Should it usually indicate an unique person instead of the shown key word?

Markus, please stop bothering developers with nuisance comments.

--xR/RJpD/V1xuh2KJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNJR5wAKCRB4tDGHoIJi
0tSMAQDUmixeOBSRBjyu3meJePjabfeS/tTiPYOosilEuZo+6gD/f+9hlaAzN9Mi
MaLnFLcKtF/WoYl6X7YRywa0eX7w2Ac=
=+rRS
-----END PGP SIGNATURE-----

--xR/RJpD/V1xuh2KJ--
