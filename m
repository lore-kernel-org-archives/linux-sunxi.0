Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5C173
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 09:04:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id B86933201DA2;
	Wed, 12 Jan 2022 04:04:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 12 Jan 2022 04:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=68WX8X8FctVP1QEZxUsXAnNS2XK
	aGmSjmisp9e4daNI=; b=IJrSnpdpXti7YJOP7eIxqeEvX+3ZrXRt6v+je5PmZEq
	rI8RjR6lutIZMrEZxTBrMEaevokPGzSC8bN3bWimdsFyIbfe7clE3feCz2tbTMsx
	bWzAZYi7L6yqKG6QCRtYCG1YsK2yf+ap+YkPne0pW+rzjhVyfovdCY9GIoGqxRZc
	9Tteebvoo9vDc2p/t/mveweasK/HlZXhrKaXkjIq1KRWm8x1khKxIxiOplyd6HRv
	RQGQK4o4E8W6S+dcUlW3gX1LVB6zAMh05jIlTxnqphBVnLRKDaZo8rnYuh8qsWSA
	M8m3KrGvBSwMAbgWV7PwGJmdkk17Rp+FXwr4SRpU0Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=68WX8X
	8FctVP1QEZxUsXAnNS2XKaGmSjmisp9e4daNI=; b=hfsqnfX3z3yNmldaZ0Qj1G
	hXQ2Hzz5Aqi62fcDL5+EIIVyu5un2rl6FtWDI48xv/ksqcI5WyfLWA8Bkl5Kper9
	XSOvPE6VeScoig4LjGFKOpked2lU7RxKU+4vH1QjoenhOC3RyZnOhzUQRFRGgiB4
	n39Z4ADN9d43SF1Q8TPMPh+BVJGneA7m/4b/bW4v2ffGgEzRF8lQD5yznsBJYa4W
	uSej/9Igq+yDe6TXT2tXnIKf+5R4Cm6Y3tPI6QTflqT95+M/y6WqeMm9Qtf951jn
	ZzTfn3eink7yWxISwYWSdnvZ1Nu6aYHmJkFAqnt2NGtZ/obPxtErrjy+IOwb2tOw
	==
X-ME-Sender: <xms:g5neYUxB5NFPHcsox9h58TGHfWVxMVm4PXLMazOG3iCEiKrmU2abfQ>
    <xme:g5neYYQx4NId9avz3BHSIEMkjTzDCbCKUCd4WjKtAb4NfPorsy9M4ZoWwbmWBBUSn
    PoQlIvvPiWXdUMVjyc>
X-ME-Received: <xmr:g5neYWUFAku-EOD0DYCZQqmmz46Wq53H2k0_anSk1OJlwQI-FoekpIHqdTjuRVvCJYjugCPlqru6ytcI3EJrN5xlERGFaZ00A-afV4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hJneYSh2tJTd8yPC98mFGu_NcArIMAltzSG8Re0t8-EG9fuerrqKUw>
    <xmx:hJneYWADIkyZtNCrtVNwb8OyOnW3w6Wx8jMtRedrXGBuoepueVOKRQ>
    <xmx:hJneYTJM6tZne-kv3xRluqZ1fgFmrzROy9ObWrjvMgnJXcs79DdtBg>
    <xmx:hJneYZ-H3x0V582Ggc1t82UDNIfm74JyyI8iF2ZDN_uYpDULeA1FOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jan 2022 04:04:03 -0500 (EST)
Date: Wed, 12 Jan 2022 10:04:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/3] dt-bindings: net: support for Allwinner R40 EMAC
 controller
Message-ID: <20220112090401.vbwhqudqvdce7jm4@houat>
References: <20220111160600.58384-1-boger@wirenboard.com>
 <20220111160600.58384-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mwnom3ly27yoktq"
Content-Disposition: inline
In-Reply-To: <20220111160600.58384-3-boger@wirenboard.com>


--3mwnom3ly27yoktq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 11, 2022 at 07:05:59PM +0300, Evgeny Boger wrote:
> R40 and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC reset needs to be deasserted first,
> so resets property is required.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../net/allwinner,sun4i-a10-emac.yaml         | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-em=
ac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.ya=
ml
> index 8d8560a67abf..8b38b4e981fe 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> @@ -15,7 +15,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: allwinner,sun4i-a10-emac
> +    enum:
> +      - allwinner,sun4i-a10-emac
> +      - allwinner,sun8i-r40-emac
> =20
>    reg:
>      maxItems: 1
> @@ -30,6 +32,19 @@ properties:
>      description: Phandle to the device SRAM
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> =20
> +  resets:
> +    maxItems: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: allwinner,sun8i-r40-emac
> +
> +then:
> +  required:
> +    - resets
> +
>  required:
>    - compatible
>    - reg
> @@ -42,11 +57,14 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    #define RST_BUS_EMAC		14
> +
>      emac: ethernet@1c0b000 {
>          compatible =3D "allwinner,sun4i-a10-emac";
>          reg =3D <0x01c0b000 0x1000>;
>          interrupts =3D <55>;
>          clocks =3D <&ahb_gates 17>;
> +        resets =3D <&ccu RST_BUS_EMAC>;
>          phy-handle =3D <&phy0>;
>          allwinner,sram =3D <&emac_sram 1>;
>      };

The example doesn't make much sense now, since we can't have an A10
controller with the reset line.

Either leave it like it was, or create a new example

Maxime

--3mwnom3ly27yoktq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd6ZgQAKCRDj7w1vZxhR
xYNaAP9HNUbj9DUzDdqjHNgj/j90b2GqVxOLosTGoSrr4zkO2wEAqECKBamWMRw2
v0S0e8gNa+R5IOZdZ7YPSyIVHoVv9gA=
=Nu2A
-----END PGP SIGNATURE-----

--3mwnom3ly27yoktq--
