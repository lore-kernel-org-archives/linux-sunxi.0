Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BA1111
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 10:41:04 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 510FC20000D;
	Thu, 25 Aug 2022 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661424062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUD02sVmbLJE2+6sVaN3pLzxdMGTdYLqIRnLS0WJnRI=;
	b=nHn+mAjxrOh0cxofo5b1LCgvuIQeHEE61oHF+f7T2b7K7sGJ3y5U6ZMbzD4vkDv9Yj2nAM
	jj0aP8e+7FohVNevoe8+Hws3EcC29Qxqzi6TycGRujaypPBSxcMMtGRkeLnPvwyjqDTlR9
	G2vCJIjbN+HEduetWXSxEGi9GfzxsQLPzfLl5VmGm0inqyIkW6FOdtlsgF0pxYbz1BC/CM
	GoMkgmyCyexMXT/AlQSPQ2BDmJg6yNDDx1fVQrPd5BP7ZnuFCzcclVAK2LDeronYjeOxSg
	pM7vHEl6cZa3aF36MBvtYETDoKR1cxG1KXDl4VT/kMjVawra13+8NRMQfcy9+A==
Date: Thu, 25 Aug 2022 12:41:00 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/8] dt-bindings: sun6i-a31-mipi-dphy: Add the A100 DPHY
 variant
Message-ID: <YwdRvBSGDNIUOMnH@aptenodytes>
References: <20220812075603.59375-1-samuel@sholland.org>
 <20220812075603.59375-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zRrg/vp27ssDoOSm"
Content-Disposition: inline
In-Reply-To: <20220812075603.59375-5-samuel@sholland.org>


--zRrg/vp27ssDoOSm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Fri 12 Aug 22, 02:55, Samuel Holland wrote:
> A100 features an updated DPHY, which moves PLL control inside the DPHY
> register space. (Previously PLL-MIPI was controlled from the CCU. This
> does not affect the "clocks" property because the link between PLL-MIPI
> and the DPHY was never represented in the devicetree.) It also requires
> a modified analog power-on sequence. Finally, the new DPHY adds support
> for operating as an LVDS PHY. D1 uses this same variant.

Do you have some pointers about that? I'd be surprised that this PHY is now
used for "traditional" LVDS display output, which is usually done with a si=
mpler
LVDS phy attached to the display controller.

However I've seen that some new Allwinner SoCs come with sub-LVDS camera in=
put,
which typically requires a more complex PHY due to the high number of lanes.

Anyway for now this is:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml           | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml
> index cf49bd99b3e2..b88c4b52af7d 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
=2Eyaml
> @@ -17,9 +17,13 @@ properties:
>    compatible:
>      oneOf:
>        - const: allwinner,sun6i-a31-mipi-dphy
> +      - const: allwinner,sun50i-a100-mipi-dphy
>        - items:
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy
> +      - items:
> +          - const: allwinner,sun20i-d1-mipi-dphy
> +          - const: allwinner,sun50i-a100-mipi-dphy
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.35.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--zRrg/vp27ssDoOSm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmMHUbwACgkQ3cLmz3+f
v9EsaQf/bBXRX7dkItKf753uxFAwb2gmuOBMHvYFGbeRA9QvZTcqNV98aQUlGM4w
isH8tUkRSXwpC5WIKuUDyGeZ6BCZo/870HZsUmeKIRkKRGnatZsW1sD8/tYn0Wmm
br/ublpR94o2SDtV2gaK9gblfjg+KlABewz5sBN0UTuZPLFTJvDrkid1+4VpuNxk
g/cwpn+BwyP6ljjMP93qfQQ7zc9JelE8z0USlYemXZ6+kn4rBRgBslga2GyYlkSa
86dcFRqqU0zhkmFaZ2rb+qFR3cc4IAC3xRtuMw/zeEJ3quQ7GvBa14mq3EZOi1QS
IyCir6uT1GrpdpBKEHMxEGT40U9F0A==
=Qxrk
-----END PGP SIGNATURE-----

--zRrg/vp27ssDoOSm--
