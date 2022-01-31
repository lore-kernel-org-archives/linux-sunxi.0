Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F72C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 09:46:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 2B2FF5C00C8;
	Mon, 31 Jan 2022 04:46:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 31 Jan 2022 04:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=kJrZSMP0wlCXGIqrU/SqOXl0mSyeNm4/Gs7Suq
	zAMAI=; b=Zn8DfAvHlWdiQFcPynhkz/8qgJZWEoDWEQJjLtmujacAwrE39eUV6a
	QrfTdUb3R5db/an7u3X+7UJbGL7nCahiys7qw/LkwMx72znFOHcYDKoKMclllALJ
	6louS/ZFrH63XXiRWzJ8WKd7AB8E5303B6aW0UU8UiWKn0Ge9+ekutvXasS1Y9fG
	90qN3ldy4dlkSoL0cKecWpg9GhjVp64IPHWuWsnFLP2GHWm2iln2rRZICtegf9cu
	rckBVrWRJOaLvekyiddAs7B+ZA9D4zuoBVGgOcIJ07pOBjPZVR2US7ZLRIXz3r0n
	7axctUz8HW2vsHw/IAE8Lyp/bw/vjTVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kJrZSMP0wlCXGIqrU
	/SqOXl0mSyeNm4/Gs7SuqzAMAI=; b=KOmm4LZADVp162xIAHs4YFAqwE4BbHAa/
	qDfPDL6IOUJdcjhzTDwIB12/XDkEkH7OxWee49t8p2yxekmLzJE57UXbw9ZeYQE3
	SasYStUnGuhCEi/DUVE0XAuPh52o6uw8Kqs47c1z+QsN6mSqdN0X7aGJUa0CEKG2
	xQC0TvyOVMcqM3+3JW9mdmr3pCGYZKCDi5ETZCKOQpLU5OeKmBi3zqoVZs0httO8
	Y6E3KYKaJmeb2wPOusenfcSwVFh/WHCU43+b9zZokuFgLjsfxyJYstQzT1mzd/Ln
	WYeQsiaQ6LNvu68r8z8Jz33spV/IkmKYgjonaXswal48tTC9hglkg==
X-ME-Sender: <xms:ALD3YVH-zTJZxo3JOYmLYUic44flBD7-EM0-Gq0dZlzgeVC-Ytmu6A>
    <xme:ALD3YaUq1KyTRnRKbrnhPYjwr7yoFgRB_BHY9Hn86gLLGVJT9Yg3Ienk0bg5Tgweo
    ruj2L8wDOa0_TmVKHE>
X-ME-Received: <xmr:ALD3YXK-IpIXgR0h3uKCIda-fq80bp5f7g6SkszFIfDnJaAXhGSpSDJI-ktHhtqr1hSBVZEBcGXDYBm1xq7wt7QWhuNQvc37Y-QyRA4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
    nhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhfdutdeljefgleejffehff
    fgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ALD3YbHu4CE0NIM53QT9ihGQCxwzrn2rpiR9XNNVyOiisKfuvC2QgA>
    <xmx:ALD3YbVrqEhYLKir8XUnGFeCHD3PcZ8H6skyVGfdvcPp8bvKOgBX9g>
    <xmx:ALD3YWMWPQLRBKWikgEKiIC_xy9NZAemgX8oMp4a0uxI_I_tDho2ew>
    <xmx:AbD3YRyDVaSY4Sw0015ePztbrIVkKgbD1w183FPFm1ErHS3-0_UsOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 04:46:40 -0500 (EST)
Date: Mon, 31 Jan 2022 10:46:38 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] ARM: dtsi: suniv: Add mmc to f1c100s dtsi.
Message-ID: <20220131094638.igjkg7xm534v75do@houat>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
 <20220130220325.1983918-3-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tu2actmbgimiygqc"
Content-Disposition: inline
In-Reply-To: <20220130220325.1983918-3-Mr.Bossman075@gmail.com>


--tu2actmbgimiygqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 30, 2022 at 05:03:24PM -0500, Jesse Taube wrote:
> Add mmc0 and 1 for f1c100s dtsi.
>=20
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
> * Split patch
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 41 ++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/sun=
iv-f1c100s.dtsi
> index 953228cc8d52..60fa56c278a8 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -96,6 +96,11 @@ uart0_pe_pins: uart0-pe-pins {
>  				pins =3D "PE0", "PE1";
>  				function =3D "uart0";
>  			};
> +
> +			mmc0_pins: mmc0-pins {
> +				pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function =3D "mmc0";
> +			};

Pinctrl nodes are ordered alphabetically

Also, you need to have a drive-strength of 30mA

>  		};
> =20
>  		timer@1c20c00 {
> @@ -111,6 +116,42 @@ wdt: watchdog@1c20ca0 {
>  			reg =3D <0x01c20ca0 0x20>;
>  		};
> =20
> +		mmc0: mmc@1c0f000 {
> +			compatible =3D "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg =3D <0x01c0f000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC0>,
> +				 <&ccu CLK_MMC0>,
> +				 <&ccu CLK_MMC0_OUTPUT>,
> +				 <&ccu CLK_MMC0_SAMPLE>;
> +			clock-names =3D "ahb", "mmc", "output", "sample";
> +			resets =3D <&ccu RST_BUS_MMC0>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <23>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc1: mmc@1c10000 {
> +			compatible =3D "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg =3D <0x01c10000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC1>,
> +				 <&ccu CLK_MMC1>,
> +				 <&ccu CLK_MMC1_OUTPUT>,
> +				 <&ccu CLK_MMC1_SAMPLE>;
> +			clock-names =3D "ahb", "mmc", "output", "sample";
> +			resets =3D <&ccu RST_BUS_MMC1>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <24>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};

And here, the nodes are ordered by register base address

Maxime

--tu2actmbgimiygqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfev/gAKCRDj7w1vZxhR
xb4xAP0cMaOl4kgpz5d1KXS2aNneoOBWOuAX+av94/dO0guYqQD9H1OhVCaD0fYP
AlY9d8cR5k9srAw20RjjtjKTCuHg/gQ=
=z08t
-----END PGP SIGNATURE-----

--tu2actmbgimiygqc--
