Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE3125B4
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 15:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59167C433C8;
	Thu, 24 Aug 2023 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692890454;
	bh=c2yWFE88Z38tdkA1ropKVgWFAP74msSFydP2MZLzxWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cI5ssbjVWyf1p9s7cRFtDpuB2PnKkFEMWIXtb4WLhxp4BYy9O4oFCeWIE3gAK1icS
	 yJlZRtotKGbX0yvXTUes2HReHlsuiEjn5xiJu5rr/FAbX7KD0bKqiN5Iro+FiEUkue
	 mErxIwdKMqaPwdJqqQlLFL8HcY/yvUjZZJK/nsZBY59+vIJXV4IDT34XY3YDDW8SZ7
	 7SVdP3ZLDHE60zkYYQcszT0lvAkhBjOBmrmpcGFX7dGq1uFpXRFZ3LH9qSsOhC4feJ
	 ri6K4SEBYwbLDY5klVhNFSQlNoHfYGocsbu9g1vtDXS49XCb+OZh8j0Zrl7iNJO+61
	 Shz5FY+A+GDcw==
Date: Thu, 24 Aug 2023 16:20:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	mripard@kernel.org, jagan@edgeble.ai, heiko@sntech.de,
	uwu@icenowy.me, andre.przywara@arm.com, daniel@ffwll.ch,
	airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
	noralf@tronnes.org, samuel@sholland.org, jernej.skrabec@gmail.com,
	wens@csie.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V3 1/8] dt-bindings: vendor-prefixes: document Saef
 Technology
Message-ID: <20230824-gestate-drippy-90294d7c9171@spud>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
 <20230823212554.378403-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DClmySUOZG7cMczb"
Content-Disposition: inline
In-Reply-To: <20230823212554.378403-2-macroalpha82@gmail.com>


--DClmySUOZG7cMczb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 04:25:47PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Document Saef Technology (https://www.saefdisplay.com/).
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index af60bf1a6664..dda90f9d264b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1151,6 +1151,8 @@ patternProperties:
>      description: Shenzhen Roofull Technology Co, Ltd
>    "^roseapplepi,.*":
>      description: RoseapplePi.org
> +  "^saef,.*":
> +    description: Saef Technology Limited
>    "^samsung,.*":
>      description: Samsung Semiconductor
>    "^samtec,.*":
> --=20
> 2.34.1
>=20

--DClmySUOZG7cMczb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOd1TwAKCRB4tDGHoIJi
0nOmAPwPkrtyi6bQrrWZKxNquGz7TpB7S8DlF+WpOdaQ+UDH5QEAvw9Hrf7SZfin
k1TI+ocMPPNKofJRf2ElU2FZYlZCFgY=
=Sxlt
-----END PGP SIGNATURE-----

--DClmySUOZG7cMczb--
