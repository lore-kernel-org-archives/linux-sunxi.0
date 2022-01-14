Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F86E173
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 09:42:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4CB295C00DF;
	Fri, 14 Jan 2022 04:42:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 14 Jan 2022 04:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=7FsO9Eyh3oA4aLA9gZOLbO6/pki
	yQDIQ/yUeSjhdSsE=; b=TIYvaqNYquozRPBokoai9ymOKQhzxQRtEHJHmKqy2i6
	v6tatnnv+pzx8DEfdF1iyUKZz4bLBDQd4t/4kTg3YAkZHOHnXKapMfAeN2P7dOpS
	uNlwJjD3TIk5GBSNUexFdCM4esHP58UMoLSvmVvtz1LkKb9pb9duF8QqdOrN3Jdt
	NcXCMJ+XMmeG1vnAZHgJxZ1tiXKauZO6cpUL8QbCUOsqnh+1Y8p3UfkddNjnKCTB
	7Vt8O2zeDUu1I0Qjo0Vf+nu6WOzATd+XYKUw+ZCHLxMJRJ8mhHQ1YwmxLjr8XoSj
	VeUN8ApTks6ZnrBt/2gDfK0QjqkDxKrfJZK1PfeaBOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7FsO9E
	yh3oA4aLA9gZOLbO6/pkiyQDIQ/yUeSjhdSsE=; b=JqwDWGm+gq87iGEHFYzJpc
	9yxr2wfdyzlMprDvVYSTbSOTXqeOUbxC06vzSs+YDmPymGb4Zm+yFNQMdYwC/iRC
	Y+YJGqGoaULQMDcrKzhJwv7Popsj5fzEGkUPeuRI/dcQwspQPijh3mNcuz6MzsHX
	SREQ0cBoqpbisQy1TmbimRHpKRqTprXoZCsnwX1pYADzWaa6gXgkv8pihTsRMmOU
	skJl5QHLjoDO68D2HHxoGz4KmoBA/KcbcRe55NOXZMA8qpIjmywkLY5YWDE7R5s0
	xHLagICwKSh5Ft7mkqDiiO+rmacmXIwnUxgXRQpItQj22O7ZlA8cKNSfoFrqnKlg
	==
X-ME-Sender: <xms:oUXhYaKQWzOas506AqwaGUbmikCz9zcw0VyWjl3yP1Mexqg97v3QPA>
    <xme:oUXhYSI9PDsPT4kPe-ltQcOSAC_YoexRXdOLGxfQqPWQYNSu9gs1t9RcW36aaMT8B
    YQH6sqi-3-i-bA81ik>
X-ME-Received: <xmr:oUXhYavrSibpqCLX5j2c0I5HB3iUmBq0HxE_rCbD2O6SpXjlW2w3DYVcfcl1Zc77L5t6iZ7gObZcGznsPhsKNGBsaoxN2MCh93MWnD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oUXhYfZlKW43DHGWfQ0m2vTvxsDcJXvnCSr2znputTHHxZYLkROYHw>
    <xmx:oUXhYRYyR6hCx_OC57cfH3NlZeCuPS0KVmLDJQRk9IZkI4f_QZf2KA>
    <xmx:oUXhYbCzfl5xFt4p3ZUTo2oyyiw1jPVmwKuV5dn6t02_G4lMtz0L0w>
    <xmx:oUXhYQV7PAEwOJ3F8RrDqpWGRINSKzK6xnHwT2X0iemuo-r_Vs7Icw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 04:42:56 -0500 (EST)
Date: Fri, 14 Jan 2022 10:42:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 3/3] ARM: dts: sun8i: r40: add second ethernet support
Message-ID: <20220114094255.br6qqqgoajvhpt2x@houat>
References: <20220113053734.105813-1-boger@wirenboard.com>
 <20220113053734.105813-4-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vfbvflpajhnring3"
Content-Disposition: inline
In-Reply-To: <20220113053734.105813-4-boger@wirenboard.com>


--vfbvflpajhnring3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 13, 2022 at 08:37:34AM +0300, Evgeny Boger wrote:
> R40 (aka V40, A40i, T3) has two different Ethernet IPs
> called EMAC and GMAC. EMAC only support 10/100 Mbit in MII mode,
> while GMAC support both 10/100 (MII) and 10/100/1000 (RGMII).
>=20
> In contrast to A10/A20 where GMAC and EMAC share the same pins
> making EMAC somewhat pointless, on R40 EMAC can be routed to port H.
> Both EMAC (on port H) and GMAC (on port A) can be then enabled at
> the same time, allowing for two ethernet ports.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 49 ++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
> index 03d3e5f45a09..8770b105f86e 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -217,6 +217,19 @@ syscon: system-control@1c00000 {
>  			#size-cells =3D <1>;
>  			ranges;
> =20
> +			sram_a: sram@0 {
> +				compatible =3D "mmio-sram";
> +				reg =3D <0x00000000 0xc000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				ranges =3D <0 0x00000000 0xc000>;
> +
> +				emac_sram: sram-section@8000 {
> +					compatible =3D "allwinner,sun4i-a10-sram-a3-a4";
> +					reg =3D <0x8000 0x4000>;
> +				};
> +			};
> +
>  			sram_c: sram@1d00000 {
>  				compatible =3D "mmio-sram";
>  				reg =3D <0x01d00000 0xd0000>;
> @@ -553,6 +566,24 @@ gmac_rgmii_pins: gmac-rgmii-pins {
>  				drive-strength =3D <40>;
>  			};
> =20
> +			emac_pa_pins: emac-pa-pins {
> +				pins =3D "PA0", "PA1", "PA2",
> +				       "PA3", "PA4", "PA5", "PA6",
> +				       "PA7", "PA8", "PA9", "PA10",
> +				       "PA11", "PA12", "PA13", "PA14",
> +				       "PA15", "PA16";
> +				function =3D "emac";
> +			};
> +
> +			emac_ph_pins: emac-ph-pins {
> +				pins =3D "PH8", "PH9", "PH10", "PH11",
> +				       "PH14", "PH15", "PH16", "PH17",
> +				       "PH18","PH19", "PH20", "PH21",
> +				       "PH22", "PH23", "PH24", "PH25",
> +				       "PH26", "PH27";
> +				function =3D "emac";
> +			};

There's 17 pins on the first group, but 18 on the second, is it intentional?

Maxime

--vfbvflpajhnring3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeFFnwAKCRDj7w1vZxhR
xXkZAQCKQ7+xkW6oWByyX8qwszAt/NG8+XXQZLQ9wjrl9MK8NwD/QygXtWj+qowA
JqejHgagbZsLpZvpkK4ihDZ04v6byAI=
=NhN3
-----END PGP SIGNATURE-----

--vfbvflpajhnring3--
