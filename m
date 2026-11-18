Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025074;
	b=gm1r5zKQFvx7v9qXkHooH8ByIHOc8UYsuv1yCYYgOit9UBdi1R4nwHyVSslu8gHgbAgz
	 +ooko377+SH7paD55zcV92N478O3/862Ujfhj+8B2bd38FJw1Y2BNETfvjPtD3GHk263q
	 Shyj1Cx50WBfs/Mr+jVlcnyr8DYFcegSUz25tw/Co9fareSGC/b4pDMaxPyI/zZyN1aHl
	 nM+iOx7FkhAtU06MPUB2lRCkbT/M5bnSPNTA8dp9NV4M/f8BxFMkkyvFTRSdJofebuNEc
	 NdcmU3IR4p6v32WMwvfi7erSgC6SoJXvhy7KUYdb4HwbcQh3ZBAu/3DWzSWLwonusIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025074;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=9HNLhAXOgbRNf2ky8rheK6IxntgF9p+aCnutm+Ne68s=;
	b=uKs7zX7fe1grk846UTMFEwmuzYAj3oKootviIxPsbGyTqui3DnnE7Ar9CoG8XbW+DbjA
	 aYWnvqYX+VhfeaiFIdg3lGNI5G+ub2vVjvg9i0h12PTWmjLYCUv2r5v36CJFNSq/0EjkZ
	 Fu5fWkfRHAxGCvc8LlsJ77uyUzrRYxI+Hd2BWp9PPZd8VKjSKlV5Wf/I3m9HRjDkrwodQ
	 8Gba8kfXe4uxFJU7PcYeF3KY8rw/Kxt8MiNHb9CSQ0deBPA95ZI2qpCTVDl/fjAwA0wAs
	 uHF7i1z/w5coijsi8sCLOhh12pMNC9x28wPdt+xV6o0cMorAAbEu2i2xmL+HtpAPGdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sverdlin.org;
	spf=pass smtp.mailfrom=sverdlin.org;
	dkim=pass header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=O1Tujep7;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ZEibGolm;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142FE606A330
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 18:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 142FE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=O1Tujep7;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ZEibGolm
DKIM-Signature: a=rsa-sha256; b=O1Tujep7e/1XVyvKYvTvEuu+aRkA7UNavJ0Laxf/KlP8djM4XIeOB+IYuo0oCjhxzv/VERgrW4Rwq1dfHoiz95+sFAUvRNah1B8ZgPith9FRCTlreZdOzGmxFIJi/bpYgi9ENkPebJYvwPPifbkDGzorUw334gKlnLHWciWXqYoGvCRnFk8omXt3le4IEnBgZaAPCdDJVUOmFKGYSLSHoBPNQoLY46/GjfcFBPqy+61dAcS0gYaW39X197+uWiq/SHklcSOWJo1g2R1p2/cE9u8OIs/c5LiFPA5bcF0Ldc1whuH/vdyp2d9c6P/LN6TgZ/wweYsjpGvUScml45+74Q==; s=purelymail1; d=sverdlin.org; v=1; bh=9HNLhAXOgbRNf2ky8rheK6IxntgF9p+aCnutm+Ne68s=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=ZEibGolmRRT+fr6f7AFEfGyKtqG19THS+PjvG3QEhx8l67hnzTGs8/PX85sejIBukIfMd0qZawhR4/CB9cgp6IO6tLCpV01mwUWW3znGa08ZqAzcB09ikcOLs9gs3TqUacJPUsjvYTMEVHBEqeoIGieS/CfnGFK6pBJOcUnTWNrV84fFZGPoRpB3g7W5pDMMj7ZaPN1m/mQYxWu/OT4m6SjET5Ye6nBlYo0sClkGdkqp8b9qdcY1DkGFOKX00zVm6BGMuFzpbJIgxhMO3xz1CzviNayuXuJyBg0Sx7hh2GOYAafRUi/FuOHuRsmDv2doqhqfzpP1NvagqNo/0hjJyQ==; s=purelymail1; d=purelymail.com; v=1; bh=9HNLhAXOgbRNf2ky8rheK6IxntgF9p+aCnutm+Ne68s=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-sunxi@lists.linux.dev
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2014938321;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 18 Nov 2026 18:04:06 +0000 (UTC)
Message-ID: <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
From: Alexander Sverdlin <alex@sverdlin.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome
 Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius
 Pedrosa	 <vinicius.eduardo.pedrosa@gmail.com>, Jun Yan
 <jerrysteve1101@gmail.com>,  Lukas Schmid <lukas.schmid@netcube.li>
Date: Wed, 18 Nov 2026 19:03:59 +0100
In-Reply-To: <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
	 <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Enzo,

On Mon, 2026-11-09 at 23:45 -0500, Enzo Adriano wrote:
> Enable the Cubie A7S serial console, PMIC and microSD slot to provide
> an initial usable board configuration. Supply the 26 MHz crystal and
> 32768 Hz RTC input, enable UART0 and the AXP318W on R-I2C0, and describe
> the PMIC input/output and CPU supply connections from the Radxa Cubie
> A7S schematic v1.10. Preserve firmware settings on rails whose working
> voltage is not established. BLDO2 has no programmed voltage constraint:
> its software 3.3 V selector does not establish its physical output with
> the schematic's nominal 2.4 V input.
>=20
> Describe the card's SWOUT2 supply and PF6 active-high detect with an
> internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
> only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
> 1.8 V input and must not be raised for SD signaling. Firmware must
> select the 3.3 V PF path; dynamic voltage switching is not provided.
> Keep other storage off.
>=20
> Connect the documented bank supplies. PL's self-supply phandle is
> omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
> upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
> voltage-mode fix is required for these bank-supply connections.
>=20
> These board DTS bytes were RAM-booted on a Cubie A7S with vendor
> firmware on November 4: UART0, PMIC registration and MMC0 read-only
> transfers worked. Card writes, physical hotplug, 1.8 V signaling and
> physical BLDO2 voltage were not tested.

Should the history be moved below "---"?

> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> =C2=A0arch/arm64/boot/dts/allwinner/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../dts/allwinner/sun60i-a733-cubie-a7s.dts=C2=A0=C2=A0 | 284 +++++=
+++++++++++++
> =C2=A02 files changed, 285 insertions(+)
> =C2=A0create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-=
a7s.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d1f768dd6461..792152525b43 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
> =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
> =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-orangepi-4a.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..341c24360ce2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +=09model =3D "Radxa Cubie A7S";
> +=09compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +=09aliases {
> +=09=09mmc0 =3D &mmc0;
> +=09=09serial0 =3D &uart0;
> +=09};
> +
> +=09chosen {
> +=09=09stdout-path =3D "serial0:115200n8";
> +=09};
> +
> +=09reg_ps: regulator-system-power {
> +=09=09compatible =3D "regulator-fixed";
> +=09=09regulator-name =3D "ps";
> +=09=09regulator-min-microvolt =3D <5000000>;
> +=09=09regulator-max-microvolt =3D <5000000>;
> +=09=09regulator-always-on;
> +=09};
> +
> +=09reg_ldo_input: regulator-ldo-input {
> +=09=09compatible =3D "regulator-fixed";
> +=09=09regulator-name =3D "ldo-input";
> +=09=09/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
> +=09=09regulator-min-microvolt =3D <2400000>;
> +=09=09regulator-max-microvolt =3D <2400000>;
> +=09=09regulator-always-on;
> +=09=09vin-supply =3D <&reg_ps>;
> +=09};
> +
> +=09osc32k: osc32k-clk {

Should two regulators and the clock have been sorted in the reverse order?

> +=09=09compatible =3D "fixed-clock";
> +=09=09#clock-cells =3D <0>;
> +=09=09clock-frequency =3D <32768>;
> +=09};
> +};
> +
> +&cpu0 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu1 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu2 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu3 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu4 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu5 {
> +=09cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu6 {
> +=09cpu-supply =3D <&reg_dcdc3>;
> +};
> +
> +&cpu7 {
> +=09cpu-supply =3D <&reg_dcdc3>;
> +};
> +
> +&mmc0 {
> +=09bus-width =3D <4>;
> +=09cap-sd-highspeed;
> +=09cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> +=09disable-wp;
> +=09max-frequency =3D <50000000>;
> +=09no-1-8-v;
> +=09vmmc-supply =3D <&reg_swout2>;
> +=09/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
> +=09vqmmc-supply =3D <&reg_swout2>;
> +=09status =3D "okay";

see below...

> +};
> +
> +&osc {
> +=09clock-frequency =3D <26000000>;
> +};
> +
> +&pio {
> +=09vcc-pb-supply =3D <&reg_swout2>;
> +=09vcc-pc-supply =3D <&reg_cldo5>;
> +=09vcc-pd-supply =3D <&reg_swout1>;
> +=09vcc-pe-supply =3D <&reg_bldo1>;
> +=09vcc-pf-supply =3D <&reg_cldo5>;
> +=09vcc-pg-supply =3D <&reg_aldo1>;
> +=09vcc-ph-supply =3D <&reg_swout2>;
> +=09vcc-pj-supply =3D <&reg_swout1>;
> +=09vcc-pk-supply =3D <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +=09status =3D "okay";

Should "status" have been last (preceded by a blank line)? (dts-coding-styl=
e.rst)

> +=09pinctrl-names =3D "default";
> +=09pinctrl-0 =3D <&r_i2c0_pl_pins>;
> +
> +=09axp318w: pmic@36 {
> +=09=09compatible =3D "x-powers,axp318w";
> +=09=09reg =3D <0x36>;
> +=09=09interrupt-parent =3D <&nmi_intc>;
> +=09=09interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +=09=09interrupt-controller;
> +=09=09#interrupt-cells =3D <1>;
> +
> +=09=09aldo156in-supply =3D <&reg_ps>;
> +=09=09aldo234in-supply =3D <&reg_aldo1>;
> +=09=09bldoin-supply =3D <&reg_ldo_input>;
> +=09=09cldoin-supply =3D <&reg_ldo_input>;
> +=09=09dldoin-supply =3D <&reg_ps>;
> +=09=09eldoin-supply =3D <&reg_dcdc9>;
> +=09=09ips-supply =3D <&reg_ps>;
> +=09=09vin19-supply =3D <&reg_ps>;
> +=09=09vin23-supply =3D <&reg_ps>;
> +=09=09vin45-supply =3D <&reg_ps>;
> +=09=09vin678-supply =3D <&reg_ps>;
> +
> +=09=09regulators {
> +=09=09=09reg_dcdc1: dcdc1 {
> +=09=09=09=09regulator-name =3D "vcc-3v3";
> +=09=09=09=09regulator-min-microvolt =3D <3300000>;
> +=09=09=09=09regulator-max-microvolt =3D <3300000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc2: dcdc2 {
> +=09=09=09=09regulator-name =3D "vdd-sys";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc3: dcdc3 {
> +=09=09=09=09regulator-name =3D "vdd-cpub";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc4: dcdc4 {
> +=09=09=09=09regulator-name =3D "vdd-gpu";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc5: dcdc5 {
> +=09=09=09=09regulator-name =3D "vdd-cpul";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc6: dcdc6 {
> +=09=09=09=09regulator-name =3D "vcc-draml";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc7: dcdc7 {
> +=09=09=09=09regulator-name =3D "vcc-dram";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc8: dcdc8 {
> +=09=09=09=09regulator-name =3D "vcc-ufs-io";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dcdc9: dcdc9 {
> +=09=09=09=09regulator-name =3D "eldo-input";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_swout1: swout1 {
> +=09=09=09=09regulator-name =3D "vcc33-lcd";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_swout2: swout2 {
> +=09=09=09=09regulator-name =3D "vcc-io-card";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_aldo1: aldo1 {
> +=09=09=09=09regulator-name =3D "vcc-pl";
> +=09=09=09=09regulator-min-microvolt =3D <3300000>;
> +=09=09=09=09regulator-max-microvolt =3D <3300000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_bldo1: bldo1 {
> +=09=09=09=09regulator-name =3D "vcc-pe-pk-mcsi";
> +=09=09=09};
> +
> +=09=09=09reg_bldo2: bldo2 {
> +=09=09=09=09regulator-name =3D "vcc-lvds0";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_bldo4: bldo4 {
> +=09=09=09=09regulator-name =3D "vcc18-codec";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09};
> +
> +=09=09=09reg_cldo1: cldo1 {
> +=09=09=09=09regulator-name =3D "vcc33-18-usb";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_cldo2: cldo2 {
> +=09=09=09=09regulator-name =3D "vcc18-hdmi";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09};
> +
> +=09=09=09reg_cldo3: cldo3 {
> +=09=09=09=09regulator-name =3D "vcc-pll-dram";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_cldo5: cldo5 {
> +=09=09=09=09regulator-name =3D "vcc18-pf-pc";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dldo1: dldo1 {
> +=09=09=09=09regulator-name =3D "vcc-efuse";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_dldo6: dldo6 {
> +=09=09=09=09regulator-name =3D "vcc-ufs";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_eldo1: eldo1 {
> +=09=09=09=09regulator-name =3D "vcc09-vdd2l";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_eldo6: eldo6 {
> +=09=09=09=09regulator-name =3D "vdd-cpus";
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +
> +=09=09=09reg_rtc_ldo: rtc-ldo {
> +=09=09=09=09regulator-name =3D "vcc-rtc";
> +=09=09=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09=09=09regulator-max-microvolt =3D <1800000>;
> +=09=09=09=09regulator-always-on;
> +=09=09=09};
> +=09=09};
> +=09};
> +};
> +
> +&r_pio {
> +=09/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. *=
/
> +=09vcc-pm-supply =3D <&reg_aldo1>;
> +};
> +
> +&rtc {
> +=09clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
> +=09=09 <&osc32k>;
> +=09clock-names =3D "bus", "hosc", "ahb", "ext-osc32k";
> +};
> +
> +&uart0 {
> +=09pinctrl-names =3D "default";
> +=09pinctrl-0 =3D <&uart0_pb_pins>;
> +=09status =3D "okay";

see above...

> +};
