Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F623F6C43
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105191; cv=none; b=I6b9aeBoZv322ME6tm15Pe9PS3jgt7PdYzzVr/AGDb4JRJI7QIV73Z3gqeAXYakD19pUhxwBunZ2UrJQzCo8PfqEpTYp2dB5XEIVgxvp/h7X4Vt0ymRaQfy+EWiEAfPm+Uj85G+L6bymb4Z6buMvfPcwQgF3bE7oO4c45ajDeFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105191; c=relaxed/simple;
	bh=Teyt01h9pySaHZzzKais+2r0E+togszGBC4c2AStHe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eANTon1px+IaRYsQnTiIr+3iGAceLjfKCCTRJGKmam+ZDU9UBgkiIAgVP3Nelu773Ewtn4wofAjD6clqzDzuueQZO7X1I8SpLDtpX0zt3nXDDXD5P0zkhofRkJFoTf3i3enj0OhT+DfDTDWmXgd2imwA4B3cEP0KpYfPRvirtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AD08C1F8004F
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:53:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 29AA8B407F4; Mon, 18 May 2026 11:53:03 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 972C9B407E7;
	Mon, 18 May 2026 11:53:01 +0000 (UTC)
Date: Mon, 18 May 2026 13:52:59 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aVDxZ04DcuTPu75"
Content-Disposition: inline
In-Reply-To: <20260510201644.4143710-4-alexander.sverdlin@gmail.com>


--6aVDxZ04DcuTPu75
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Le Sun 10 May 26, 22:16, Alexander Sverdlin a =C3=A9crit :
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:

Just in case you missed it, there was a previous submission for this
board which wasn't followed up on.

I also have one of this board and wanted to respin support, but it looks
like you beat me to it :)

Thanks for working on this!

Please change the naming to "Baijie HelperBoard A133" and "Baijie A133
HelperBoard Core" to align with the vendor terminology and rename the
files as:
- sun50i-a133-helperboard.dts
- sun50i-a133-helperboard-core.dtsi

> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
>=20
> Add initial support for both the Helper and Core boards, including UART,
> PMU, eMMC, USB, Ethernet.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>=20
> Changelog:
> v2:
> - introduced baijie,helper-a133-core compatible for the Core (SoM) board
>=20
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
>  .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.=
dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-help=
er.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d116864b6c2b..926dfa851100 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboa=
rd.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h64-remix-mini-pc.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a100-allwinner-perf1.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a133-baijie-helper.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a133-liontron-h-a133l.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus-v1.2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/=
arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> new file mode 100644
> index 000000000000..65b094f30bf5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a100.dtsi"
> +#include "sun50i-a100-cpu-opp.dtsi"
> +
> +/{

You could add a model here while at it, even though it would generally
be overwritten.

> +	compatible =3D "baijie,helper-a133-core",
> +		     "allwinner,sun50i-a100";
> +
> +	aliases {
> +		serial1 =3D &uart1;	/* BT module */

Not sure this is reallyt useful.

> +	};

You should add:

	chosen {
		stdout-path =3D "serial0:115200n8";
	};

As well as the incoming 5v regulator:

	reg_vcc5v: vcc5v {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vcc-5v";
		regulator-min-microvolt =3D <5000000>;
		regulator-max-microvolt =3D <5000000>;
		regulator-always-on;
	};

> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&pio {
> +	vcc-pb-supply =3D <&reg_dcdc1>;
> +	vcc-pc-supply =3D <&reg_eldo1>;
> +	vcc-pd-supply =3D <&reg_dcdc1>;
> +	vcc-pe-supply =3D <&reg_dldo2>;
> +	vcc-pf-supply =3D <&reg_dcdc1>;
> +	vcc-pg-supply =3D <&reg_dldo1>;
> +	vcc-ph-supply =3D <&reg_dcdc1>;
> +};
> +
> +&mmc2 {

mmc2 goes before pio (alphanum sorting).

> +	vmmc-supply =3D <&reg_dcdc1>;
> +	vqmmc-supply =3D <&reg_eldo1>;
> +	cap-mmc-hw-reset;
> +	non-removable;
> +	bus-width =3D <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	status =3D "okay";

You can add:
	max-frequency =3D <100000000>;
	cap-mmc-highspeed;

> +};
> +
> +&r_i2c0 {
> +	status =3D "okay";
> +
> +	axp803: pmic@34 {
> +		compatible =3D "x-powers,axp803";
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&r_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;

You can also add:
		x-powers,drive-vbus-en; /* set N_VBUSEN as output pin */

		aldoin-supply =3D <&reg_vcc5v>;
		dldoin-supply =3D <&reg_vcc5v>;
		eldoin-supply =3D <&reg_vcc5v>;
		fldoin-supply =3D <&reg_dcdc5>;
		vin1-supply =3D <&reg_vcc5v>;
		vin2-supply =3D <&reg_vcc5v>;
		vin3-supply =3D <&reg_vcc5v>;
		vin4-supply =3D <&reg_vcc5v>;
		vin5-supply =3D <&reg_vcc5v>;
		vin6-supply =3D <&reg_vcc5v>;


> +	};
> +};
> +
> +#include "axp803.dtsi"
> +
> +&ac_power_supply {
> +	status =3D "okay";
> +};
> +
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-pll-avcc";

> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-dram-lpddr";

> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-enable-ramp-delay =3D <1000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-pl";

> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1600000>;
> +	regulator-max-microvolt =3D <3400000>;
> +	regulator-name =3D "vcc-3v3";

Should be:
	regulator-min-microvolt =3D <3300000>;
	regulator-max-microvolt =3D <3300000>;
	regulator-name =3D "vcc-io-usb-pd-nand-3v3";

> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <500000>;
> +	regulator-max-microvolt =3D <1300000>;

Should be:
	regulator-min-microvolt =3D <900000>;
	regulator-max-microvolt =3D <1300000>;


> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <500000>;
> +	regulator-max-microvolt =3D <1300000>;
> +};

DCDC3 is polyphased with DCDC2, so remove this one and add:
/* DCDC3 is polyphased with DCDC2 */

> +
> +&reg_dcdc4 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <500000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-sys";

Should be:
	regulator-min-microvolt =3D <810000>;
	regulator-max-microvolt =3D <990000>;
	regulator-name =3D "vcc-usb-sys";

> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <800000>;
> +	regulator-max-microvolt =3D <1840000>;
> +	regulator-name =3D "vcc-dram";

Should be:
	regulator-min-microvolt =3D <1100000>;
	regulator-max-microvolt =3D <1100000>;
	regulator-name =3D "vcc-dram-2";

ALDO2 is the main DRAM supply, this is the second one.

> +};
> +
> +/* DCDC6 unused */
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-enable-ramp-delay =3D <1000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-pg";

> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3400000>;
> +	regulator-enable-ramp-delay =3D <1000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-csi-pe";

> +};
> +
> +&reg_dldo3 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-enable-ramp-delay =3D <1000>;
> +	regulator-name =3D "avdd-csi";

Should be:
	regulator-min-microvolt =3D <2800000>;
	regulator-max-microvolt =3D <2800000>;
	regulator-name =3D "ldo-avdd-csi";

> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-enable-ramp-delay =3D <1000>;

Should be:
	regulator-min-microvolt =3D <2800000>;
	regulator-max-microvolt =3D <2800000>;
	regulator-name =3D "ldo-avdd-csi";

> +};

You can add:

&reg_drivevbus {
	regulator-name =3D "usb0-vbus";
	status =3D "okay";
};

> +
> +&reg_eldo1 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <1900000>;
> +	regulator-enable-ramp-delay =3D <1000>;

Should be:
	regulator-min-microvolt =3D <1800000>;
	regulator-max-microvolt =3D <1800000>;
	regulator-name =3D "vcc-pc-efuse-lvds-cpvin-mcsi";


> +};
> +
> +&reg_eldo2 {
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <1900000>;

Should be:
	regulator-min-microvolt =3D <1200000>;
	regulator-max-microvolt =3D <1200000>;

> +	regulator-enable-ramp-delay =3D <1000>;
> +	regulator-name =3D "dvdd-csi";
> +};
> +
> +/* ELDO3 unused */
> +
> +&reg_fldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <700000>;
> +	regulator-max-microvolt =3D <1450000>;
> +	regulator-name =3D "vdd-cpus-usb";
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts =
b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> new file mode 100644
> index 000000000000..ccbca5d0a40c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a133-baije-core.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/{
> +	model =3D "HelperBoard A133";
> +	compatible =3D "baijie,helper-a133",
> +		     "baijie,helper-a133-core",
> +		     "allwinner,sun50i-a100";
> +
> +	aliases {
> +		serial0 =3D &uart0;

The is best added to the core dtsi.

> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";

Ditto.

> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led {
> +			function =3D LED_FUNCTION_INDICATOR;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
> +		};
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> +	bus-width =3D <4>;
> +	status =3D "okay";

You can add:
	disable-wp;

> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +	status =3D "okay";
> +};
> +
> +&rgmii0_pins {
> +	drive-strength =3D <30>;
> +};

Sorting is also incorrect throughout the file, please use alphanum
sorting for phandle-based overwrites.

> +
> +&emac0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rgmii0_pins>;
> +	phy-handle =3D <&eth_phy>;
> +	phy-mode =3D "rgmii-id";
> +	allwinner,rx-delay-ps =3D <200>;
> +	allwinner,tx-delay-ps =3D <200>;
> +	status =3D "okay";
> +};
> +
> +&mdio0 {
> +	reset-gpios =3D <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
> +	reset-delay-us =3D <10000>;
> +	reset-post-delay-us =3D <150000>;
> +
> +	eth_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +	};
> +};
> +
> +&usbphy {
> +	status =3D "okay";

You can add:
	usb0_vbus-supply =3D <&reg_dcdc1>;
	usb1_vbus-supply =3D <&reg_dcdc4>;

> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};

AFAIK there is no ID pin so ehci0/ohci0 will not be used.
It seems that version 1.7 of the board used PH0 as USB0 ID pin but
version 2.5 has reassigned PH8 to LCD reset.

> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> --=20
> 2.54.0
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--6aVDxZ04DcuTPu75
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK/ZsACgkQhP3B6o/u
lQz+3w//cAo+iNDV/jqZNetOLGFjNEcruEdST3BE4CTtKHMfI/9ahJzqxp7HdoKD
agNB8iflMZmN5yfiBDz8luiFqebf68rEYWAVPnl7Bc3IeSNy3WeyxjQl2vZW/je1
/F5z36wPKEEZdm+9IKp5ga+A8rxPqN71xYpElNeB2+nRy47kvIQ9NBxNbpftmCpG
IehZEDIl68439Bc5X/o/9T9lkjw+QkwRpZKCCyi1qKT1TXGqPIe3pQphAWl/NvL9
/CJU8BzGumvNUSLG0J98Vq+pIC8yyZAKi1XFqlF1QgILN9DJQ4ixIxClKd4Dj1N+
hN9Td3wTSqzWvVbnnl66oQVCACr17ouNG5G+lfbzWewiHKoCj5hYods1J6N5U3fU
SoV/Hj23LVtY96ruivP5pu/UfN2AIuosgdqLcoh1s12pYeRsyA2BgX+wf23L67dH
VCU51vVy516q2rumS+Hgu08yafbCQtHjYI5LWmpT1NQ1bP8k7kyh4GGGJ+qgiVai
Vg2RaTPRLh8PDJSQ4z6BbzFbwotUu33oy6X+1fmXuxaNhDUYKK2ZSztjlbXPvxbg
aHrZZOtQXAhS7h2Br5Q436tkf9JwW5IsAF4oLBsgIKYkwZrlK/JYIDqsX0oZUhQ+
Nw/er1GoAZpHXMpiRlatJ3WRM7JlgZO+SIw2DxSm+Zq5Hf5SNTE=
=rK3C
-----END PGP SIGNATURE-----

--6aVDxZ04DcuTPu75--
