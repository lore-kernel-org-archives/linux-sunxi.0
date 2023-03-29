Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A22582
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:02:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1C0DE581EFB;
	Wed, 29 Mar 2023 11:02:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 29 Mar 2023 11:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1680102124; x=1680109324; bh=/Y
	218loL9rTciCdoOcIMwKEOOwnVKRUBebOGIuZ9xt4=; b=tBJ4CDmDSbxdrPVKah
	lp6DN22GmhcQHJg8xp+OiH6FHmt9kVWabqYEX9feEGha01HGmCTPyt0VfocSp+64
	WflOgvznuNWgxeJrPaUtBkieThN2TC2nNb6uvLpbJZJL3UiYeThsljT1hXhdqQWp
	eSn25nmDTpd2AkkLt6Z0J70tOto9zFuz22g33UX0/V6YffKMK8sIshdvMLolp8vI
	kNS1vgWY5f6TmwWjuzTQEGBh3q1p8aczT6urUaaExvY7Ci50LqTtLkINy4juvnpd
	ikdQUYz3NmaLzd269Nbm0ND0KisXrthxyU0fjILlxqQXcjqLsRlyNoAEj3dS2hNJ
	5XeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680102124; x=1680109324; bh=/Y218loL9rTci
	CdoOcIMwKEOOwnVKRUBebOGIuZ9xt4=; b=mMgxc8onBGX0TyQFk7WHWatkAzd94
	SP1ueoFGzDK3DLBSX3rGJRkM5lCUwY9I2l2/zHK+q5TehuiSFtXL1fWBPXm+VKHq
	rkVKn1CCJd3SHpSA6EeFku8GCIUPhU9eyL+Zm90pF6PiA7r2nKx29WMkry3PuUj/
	l+enr3VVq4Web10K2Z++gE+XMOUH7dCeH/+5a9EXmWqENl2JZrppd7k+RPqhOiuZ
	EjYTkOffKd/X/+fQjgp5Ga3gFUQenhJuJSMSKnDjas8OsTyvhbFvSIzjAMJ3a/ze
	qNvu4VlOK6CrSAWDj/Db1ra+z0RqT+vlunLZBCW8VnWhRo9qBbs69w0eQ==
X-ME-Sender: <xms:61IkZPecacDQC9LlDCwzmcomqdXpez1i4RKoC48jf8ylxEEZ6xfUOA>
    <xme:61IkZFPbp_2ZBiv8XMlpkvS9I0Juf9K_IcDY8S8ZZ88GD9kp1Dy8RMsyc6wY15dtC
    JzTuCYYSIOkY0cGFTM>
X-ME-Received: <xmr:61IkZIhMafG-vdLXXFKNubYF6id_9-8yUBzI5vgLqMnrzst3n1UHfvfGNho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:61IkZA8y2ya_wy6D9dpwG6a-qZpOsi5mYFMeVaZaTF5MU439v1AM7g>
    <xmx:61IkZLuOZd4XPXgRBfnG1WXFTI3nId5vmETkdiAsb4aLDNZs_0_11A>
    <xmx:61IkZPFjxC5tGIUJ7nQKRUyl3vfr31VLFi3fDCnGyfljKSig1gRo6w>
    <xmx:7FIkZHRzSYnOfVGu3r6j4HoXXjOymvbgQ4Mrqw20OI1U1OVSUx_1Kw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 11:02:03 -0400 (EDT)
Date: Wed, 29 Mar 2023 17:02:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH v7 09/12] arm64: dts: rockchip: a64: Add endpoint@0 to
 dsi_in_tcon0
Message-ID: <20230329150202.3rbjrq6iqum5ybjh@penduick>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-10-jagan@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3h7nieqs6fwrjf5j"
Content-Disposition: inline
In-Reply-To: <20230329131615.1328366-10-jagan@amarulasolutions.com>


--3h7nieqs6fwrjf5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The commit title is wrong, it's not a rockchip device.

On Wed, Mar 29, 2023 at 06:46:15PM +0530, Jagan Teki wrote:
> The DSI downstream devices are likely to be Panel, Bridge and
> I2C-Configured Bridge.
>=20
> It is possible to connect all three devices using upstream OF-graph port
> or ports node however only Panel and Bridge are possible to connect via
> child node but not possible to connect I2C-Configured Bridge via child
> node since I2C-Configure bridges are child of I2C not upstream DSI hosts
> and it must represent them via port or ports with endpoint linking.
>=20
> Allwinner A64 DSI node already has a port so add endpoint 0 for input
> tcon so that the downstream DSI devices can use endpoint 1 to connect
> Panel or Bridge or I2C-Configured Bridge.
>=20
> An example of the I2C-Configured downstream bridge representation is,
>=20
> i2c1 {
>        bridge@1b {
> 	     compatible =3D "ti,dlpc3433";
>=20
>              ports {
>                   port@0 {
>                          reg =3D <0>;
>=20
>                          bridge_in_dsi: endpoint {
>                                 remote-endpoint =3D <&dsi_out_bridge>;
>                                 data-lanes =3D <1 2 3 4>;
>                          };
>                   };
>=20
> 	          port@2 {
> 	                 reg =3D <2>;
>=20
>                          bridge_out_dmd: endpoint {
>                                 remote-endpoint =3D <&dmd_out_bridge>;
>                          };
>                   };
>              };
>        };
> };
>=20
> dsi {
>        compatible =3D "allwinner,sun50i-a64-mipi-dsi";
>=20
>        port {
>              dsi_in_tcon0: endpoint@0 {
> 	          reg =3D <0>;
> 		  remote-endpoint =3D <tcon0_out_dsi>;
> 	     };
>=20
> 	     dsi_out_bridge: endpoint@1 {
> 	   	  reg =3D <1>;
> 		  remote-endpoint =3D <&bridge_in_dsi>;
> 	     };
> 	};
> };
>=20
> Note that existing device bindings are untouched and still represent
> the downstream devices via child nodes since the sun6i-mipi-dsi host
> will migrate to a standardized single helper to lookup for a
> downstream device via child or OF-graph port or port node.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v7:
> - new patch
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 77b5349f6087..3ed566dc2172 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -1189,7 +1189,11 @@ dsi: dsi@1ca0000 {
>  			#size-cells =3D <0>;
> =20
>  			port {
> -				dsi_in_tcon0: endpoint {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				dsi_in_tcon0: endpoint@0 {
> +					reg =3D <0>;
>  					remote-endpoint =3D <&tcon0_out_dsi>;
>  				};

That doesn't match the DT binding anymore, and why can't we add endpoint@1 =
there too?

Maxime

--3h7nieqs6fwrjf5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRS6gAKCRDj7w1vZxhR
xfeDAQDlAWUHIWBEqVVfbKyuzv3LvRy7mCvQLA/qLEmO6xlakwD+PEQ2R1b8AdD2
K2ZGcuJbocxE8K200bVLCeqylRE99Qk=
=kojk
-----END PGP SIGNATURE-----

--3h7nieqs6fwrjf5j--
