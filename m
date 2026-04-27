Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD63559EC;
	Mon, 27 Apr 2026 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317390; cv=none; b=SLUoNA80Rxm4kA8JZTyy+J3FTBZk7tX8HKMbs1oVYaREc3PJFexOwvhzJj6xTOoAkFyqK7ry0rXFWaU4qEEWToZoNOSPqm4VgleOVGxBGxziX6+rzinK7CWQ7vIaCwzuacDwKAz6z6SXVOtPJaV4UUe0W+ZfLfdg5jHz4t4hJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317390; c=relaxed/simple;
	bh=ixckm2P4vuXIw7DV3No6tQyUzz3TqNd6xEhgFTEaVpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfqVGhmz6K4vBMkI0fySKMXq5TSr3+AdjU+2b5Q+d75yPMXZawU6QIwtodMBEQOFGX63v/McoazXGp9q1I12Se7kQU2yL8uWOmWse8M8EX1O3ChIHQK3KoL2CWit7mldyB8vHYf7X0LbVaZy98bD4zybaS3yIS0n3cz/YzoOyiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nheMo4pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nheMo4pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94AAC19425;
	Mon, 27 Apr 2026 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317389;
	bh=ixckm2P4vuXIw7DV3No6tQyUzz3TqNd6xEhgFTEaVpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nheMo4pnun3AlAxdrXBXdrTdhbFj7DbwfjQ9v17CQFZiUGrfmP/8RVGiSHHzXF5O9
	 xOGMHybsUViXE8W6LuvKguTjlEwy3Ek0m1WbZidjCkivf/V/nKbMufcBlVuKoloWLE
	 31zFEItHru0ZV4XyqwIP71uYEqxzDA5l/KOwpHonsp3F0FKZHmD2ujDP24qEQ5EHpr
	 3JdEJCDezFWzmp1i7K2CosqsvVJ7SAY9CXZQ95xoXfoedgTWtBbIAySaUX4UhvOdme
	 biVvIpA15xp3EF90HoZ7xON2d+EBnRJ6D2CIpYa8jgwLtNT+DcS/4nKXpc515In90P
	 AR8XC//rg0Ylw==
Date: Mon, 27 Apr 2026 20:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and D1
Message-ID: <20260427-glider-cause-f6e015c6595a@spud>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
 <20260426-h616-t113s-hstimer-v2-1-e65e9dc0c9da@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pNK/41k60Ogg+RgS"
Content-Disposition: inline
In-Reply-To: <20260426-h616-t113s-hstimer-v2-1-e65e9dc0c9da@mmpsystems.pl>


--pNK/41k60Ogg+RgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 12:15:26PM +0200, Michal Piekos wrote:
> D1 is similar to existing sun5i, but with different register offsets.
> H616 uses same offsets as D1.
>=20
> Add allwinner,sun20i-d1-hstimer
> Add allwinner,sun50i-h616-hstimer with fallback to
> allwinner,sun20i-d1-hstimer
> Extend schema condition for interrupts to cover D1 compatible variant.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml   | 9 +++=
+++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-=
hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-=
hstimer.yaml
> index f1853daec2f9..3e2725c56995 100644
> --- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer=
=2Eyaml
> @@ -15,9 +15,13 @@ properties:
>      oneOf:
>        - const: allwinner,sun5i-a13-hstimer
>        - const: allwinner,sun7i-a20-hstimer
> +      - const: allwinner,sun20i-d1-hstimer
>        - items:
>            - const: allwinner,sun6i-a31-hstimer
>            - const: allwinner,sun7i-a20-hstimer
> +      - items:
> +          - const: allwinner,sun50i-h616-hstimer
> +          - const: allwinner,sun20i-d1-hstimer
> =20
>    reg:
>      maxItems: 1
> @@ -45,7 +49,10 @@ required:
>  if:
>    properties:
>      compatible:
> -      const: allwinner,sun5i-a13-hstimer
> +      anyOf:
> +        - const: allwinner,sun5i-a13-hstimer
> +        - contains:
> +            const: allwinner,sun20i-d1-hstimer
> =20
>  then:
>    properties:
>=20
> --=20
> 2.43.0
>=20

--pNK/41k60Ogg+RgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+2CAAKCRB4tDGHoIJi
0nS7AP4/CDhqa4Ux2Wj5qHy3wSqDPSDnHczo2iuNR62MTBa6EAEAiZz+CQNqwujG
BD7yUhD4X39xYTXU1o1JE7Ek1rLTqws=
=YqUz
-----END PGP SIGNATURE-----

--pNK/41k60Ogg+RgS--
