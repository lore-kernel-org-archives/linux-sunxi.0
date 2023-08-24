Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48152125B1
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 15:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99A8C433CB;
	Thu, 24 Aug 2023 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692890374;
	bh=5QlRIHu/KD76VYfJ/1Gkn/0Wo+QBC50NlE/N9lm3e4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmeWuhkA+5P6gD9mLTbo4hIpc7bie4GXMbt6UszFOUI2r4c7p31Rm2ka7umDCCE2M
	 7yB9KlTuGKKSbvA35z+rtrK6bZyDQ2H82lHsLIXw0oJLqWHEZZPGQlQidxVglomZ4O
	 ULoAJI9A5pvtw2oTUNPl99Q7rZdshELiSwg8gGFlHMqb3v+N64okSbUKf7PQNBrNsz
	 4tbb9mLOG27z1FdJR2l0wMeW5lcjgQOzsEYFFKa0/t0wm/E1wg7crvmgEmVL6Wh96y
	 kGSwcNbf6WIAmUY2nZLBCG0JVi3lFBRqaRqIupBaKZoOE9uE7XCj3H8T+UaqOlYZoq
	 Z7XdMne96fxmQ==
Date: Thu, 24 Aug 2023 16:19:28 +0100
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
Subject: Re: [PATCH V3 5/8] dt-bindings: usb: Add V3s compatible string for
 OHCI
Message-ID: <20230824-scabbed-crummiest-7c62323c7868@spud>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
 <20230823212554.378403-6-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XhJpo0EWY/Yy94LD"
Content-Disposition: inline
In-Reply-To: <20230823212554.378403-6-macroalpha82@gmail.com>


--XhJpo0EWY/Yy94LD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 04:25:51PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The Allwinner V3s uses a generic EHCI and OHCI for USB host
> communication and the MUSB controller for OTG mode. Add compatible
> strings for the EHCI node.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ohci.yaml
> index be268e23ca79..b9576015736b 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -25,6 +25,7 @@ properties:
>                - allwinner,sun8i-a83t-ohci
>                - allwinner,sun8i-h3-ohci
>                - allwinner,sun8i-r40-ohci
> +              - allwinner,sun8i-v3s-ohci
>                - allwinner,sun9i-a80-ohci
>                - allwinner,sun20i-d1-ohci
>                - brcm,bcm3384-ohci

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--XhJpo0EWY/Yy94LD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOd1AAAKCRB4tDGHoIJi
0jIkAP9t5+hm0AiYMiqATcDo1DyB2lYfLZHVJIYDKYWhScFF7gEAtMSA/NskBQLA
VMAPfK4Nlf9NOpzV2ZMKcz7sXr2ZHgU=
=zVSS
-----END PGP SIGNATURE-----

--XhJpo0EWY/Yy94LD--
