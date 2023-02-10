Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3A629
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Feb 2023 20:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275F4C433EF;
	Fri, 10 Feb 2023 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676061459;
	bh=kQcgBSgO4Pqd5pDJgSZbOuSbBKNIGIndQLymWgAO8R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHjTKPxAdg1gmrYBi4vhRVNACilMQYwGyPPMLgVNF9QeXdfp4VOIUZaZZrXsqkh5q
	 YKzI3XvYrdiWDuCB49ASSxVcvcenNUDPwACZ5fjgsiAI3qUXc2LTvmbUszU7b/5nf9
	 /I72vAB2w5WOrvOWEddhvDlBydvYelP4/KeOS+HmfEC0xb9UXdb7EUrLmGSgV1Xelw
	 LjGIxuJQDUZkmNGoaTj56V8Mv2B0dYaNTUYiEwNSb96XKoUojzwgQky60l8aiIUFYP
	 WMhYtzdgF+6Q21nLPxlDE8YsL2Xeu7TgbEEiF63wPtPaR3qIpCgrjuCKHZg+wQd2qP
	 3jqVLhF34VIhA==
Date: Fri, 10 Feb 2023 20:37:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] riscv: dts: nezha-d1: add gpio-line-names
Message-ID: <Y+arDr+XTp85CDRc@spud>
References: <20230210025132.36605-1-twoerner@gmail.com>
 <20230210025132.36605-2-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hZ8ik5mZsnIy+h/o"
Content-Disposition: inline
In-Reply-To: <20230210025132.36605-2-twoerner@gmail.com>


--hZ8ik5mZsnIy+h/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Trevor,

Just one thing about process sorta stuff, ordinarily a new version is
not posted as a reply to the last one.
If you look on lore, you'll see it looks a bit odd:
https://lore.kernel.org/all/20230210025132.36605-2-twoerner@gmail.com/
(scroll to "thread overview")

Tooling may/may not do the right thing w.r.t. testing/application of
the patches as a result.

On Thu, Feb 09, 2023 at 09:51:32PM -0500, Trevor Woerner wrote:
> Add descriptive names so users can associate specific lines with their
> respective pins on the 40-pin header according to the schematics.
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Comment looks nice & there are no more warnings from dtbs_check :)
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Link: http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_d=
iagram_20210224.pdf
> ---
> changes since v2:
> - (no changes, skip to a v3 to align with the other patch in this group)
>=20
> changes since v1:
> - this patch needs to be placed in order, and come second, after a patch =
to
>   update the schema for the nxp,pcf8575, put this patch in a group where =
it
>   wasn't previously
> - use a Link: to point to the schematic
> - add a comment section describing the rational behind the naming that was
>   used
> - make the spacing of each line name uniform, don't try to "line them up"
>   vertically
> ---
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/ris=
cv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index a0769185be97..4ed33c1e7c9c 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -1,6 +1,25 @@
>  // SPDX-License-Identifier: (GPL-2.0+ or MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> =20
> +/*
> + * gpio line names
> + *
> + * The Nezha-D1 has a 40-pin IO header. Some of these pins are routed
> + * directly to pads on the SoC, others come from an 8-bit pcf857x IO
> + * expander. Therefore, these line names are specified in two places:
> + * one set for the pcf857x, and one set for the pio controller.
> + *
> + * Lines which are routed to the 40-pin header are named as follows:
> + *	<pin#> [<pin name>]
> + * where:
> + *	<pin#>		is the actual pin number of the 40-pin header
> + *	<pin name>	is the name of the pin by function/gpio#
> + *
> + * For details regarding pin numbers and names see the schematics (under
> + * "IO EXPAND"):
> + * http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_dia=
gram_20210224.pdf
> + */
> +
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> =20
> @@ -90,6 +109,15 @@ pcf8574a: gpio@38 {
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		#interrupt-cells =3D <2>;
> +		gpio-line-names =3D
> +			"pin13 [gpio8]",
> +			"pin16 [gpio10]",
> +			"pin18 [gpio11]",
> +			"pin26 [gpio17]",
> +			"pin22 [gpio14]",
> +			"pin28 [gpio19]",
> +			"pin37 [gpio23]",
> +			"pin11 [gpio6]";
>  	};
>  };
> =20
> @@ -164,3 +192,47 @@ &usbphy {
>  	usb1_vbus-supply =3D <&reg_vcc>;
>  	status =3D "okay";
>  };
> +
> +&pio {
> +	gpio-line-names =3D
> +		/* Port A */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port B */
> +		"pin5 [gpio2/twi2-sck]",
> +		"pin3 [gpio1/twi2-sda]",
> +		"",
> +		"pin38 [gpio24/i2s2-din]",
> +		"pin40 [gpio25/i2s2-dout]",
> +		"pin12 [gpio7/i2s-clk]",
> +		"pin35 [gpio22/i2s2-lrck]",
> +		"",
> +		"pin8 [gpio4/uart0-txd]",
> +		"pin10 [gpio5/uart0-rxd]",
> +		"",
> +		"",
> +		"pin15 [gpio9]",
> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port C */
> +		"",
> +		"pin31 [gpio21]",
> +		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port D */
> +		"", "", "", "", "", "", "", "",
> +		"", "",
> +		"pin24 [gpio16/spi1-ce0]",
> +		"pin23 [gpio15/spi1-clk]",
> +		"pin19 [gpio12/spi1-mosi]",
> +		"pin21 [gpio13/spi1-miso]",
> +		"pin27 [gpio18/spi1-hold]",
> +		"pin29 [gpio20/spi1-wp]",
> +		"", "", "", "", "", "",
> +		"pin7 [gpio3/pwm]";
> +};
> --=20
> 2.36.0.rc2.17.g4027e30c53
>=20

--hZ8ik5mZsnIy+h/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+arDgAKCRB4tDGHoIJi
0vNzAP9wY996zdS8j0ZJ6vVTM/3fQQST8EkENXy1piEExyrn9gD+KQrB1AMu5qII
DUtpxzPnxhq5rv8Iib6vl7gDq1pkLwc=
=PAXW
-----END PGP SIGNATURE-----

--hZ8ik5mZsnIy+h/o--
