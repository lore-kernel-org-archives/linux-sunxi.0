Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730B1110
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 20:48:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id f27so31353111eje.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miZ9ZnZEOqiXC323cOeXS5aiCSdlq9Sda4XPTPPCDpQ=;
        b=a9cIi/usothtvtXKJ57HZOX3JFcSNV6++R8Y9TBEBZFtkfo7VOvxKRT6oMCTtPD7cy
         G8nST9a6IY1GTvtIjv92diwpI1WIuwKMmK8x828WVAZTfX/G1RGcrUfFZdnKsvbV5hAH
         I3EYU0VlHW9H/LekekJyDfFA+QhRG4XRx5ytE0rg6dLPlSiZmq8DDSSbKS4/Q/k5sv+j
         3v+o8w72s5v70Ma9GlmV+sI16L1qfemY1muyZAyDalfMHvh20lHitQoPVKglN8rAhjE5
         Jhh0VTguKi4KmEtD0ZvnTakCgH+3un5GoyTsKkfQKIS+tYwewbbg7Ps8I+m4YYngV/UM
         PcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miZ9ZnZEOqiXC323cOeXS5aiCSdlq9Sda4XPTPPCDpQ=;
        b=iNFOnXihq5LYiaiiDWSQvLY5vO0Wz658ncdK7JefbPuP8/BsbYVf6P6JDqBaMzufjm
         j5YyLUPK/p9alu+c1S5/KyAjpiOBC/X/3lWlAdIJ3ZPcGb8TuaENhyfSd06pStkoECjG
         77AW+lgkgz8pm+qvOQetKwVepf7dFT/9UwIVyDTsi/NuOaWGkjbyOCWjs6E/zRjmypZH
         CXVQhJx3yZbv9r/iakmPV96YYp/x1ND2d+ghfzXtMohoQNvUYzp4uOjdtjMkxFMvCjSX
         wpBLEMGH4MHmo6Z7ng72JxrIR8zGlZaA3u6zT1K4fFCzSjg855MMp/CmdNTIJ1cyc20c
         JteQ==
X-Gm-Message-State: ANoB5pl6s6/sCiCtEcs0qNB7wzSNO4gqIIFMEaypwD7d6n8o2hAfg1lv
	1KPPk4rrPWb3aiIHqbnXWu6TQF+I7Wk+cw==
X-Google-Smtp-Source: AA0mqf5pv97xR3FtEyefEbB4/YDfc/TfoxtphlsMApAv6nDfGzd718a5cNgq7CF0naMd5wtMNIRJDA==
X-Received: by 2002:a17:906:fb81:b0:7ae:9187:eb70 with SMTP id lr1-20020a170906fb8100b007ae9187eb70mr10859698ejb.533.1668458881300;
        Mon, 14 Nov 2022 12:48:01 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709064ac100b007081282cbd8sm4600979ejt.76.2022.11.14.12.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 12:48:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Botka <martin.botka@somainline.org>
Cc: martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht, Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Marijn Suijten <marijn.suijten@somainline.org>, Jami Kettunen <jamipkettunen@somainline.org>, Paul Bouchara <paul.bouchara@somainline.org>, Yenda <jtrmal@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>, Andrew Lunn <andrew@lunn.ch>, Conley Lee <conleylee@foxmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arm64: dts: Add basic support for BIQU CB1
Date: Mon, 14 Nov 2022 21:47:58 +0100
Message-ID: <37920504.10thIPus4b@jernej-laptop>
In-Reply-To: <KNUCLR.WTN1W6BOHHHQ@somainline.org>
References: <20221114172018.1876608-1-martin.botka@somainline.org> <3191151.oiGErgHkdL@jernej-laptop> <KNUCLR.WTN1W6BOHHHQ@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 14. november 2022 ob 21:38:08 CET je Martin Botka napisal(a=
):
> On Mon, Nov 14 2022 at 09:16:29 PM +01:00:00, Jernej =C5=A0krabec
>=20
> <jernej.skrabec@gmail.com> wrote:
> > Hi Martin,
> >=20
> > Dne ponedeljek, 14. november 2022 ob 18:20:16 CET je Martin Botka
> >=20
> > napisal(a):
> >>  CB1 is Compute Module style board that plugs into Rpi board style
> >>=20
> >> adapter or
> >>=20
> >>  Manta 3D printer boards (M4P/M8P).
> >> =20
> >>  The board has:
> >>  	H616 SoC
> >>  	1GB of RAM
> >>  	AXP313A PMIC
> >> =20
> >>  And the actual boards that CB1 plugs in are just extension to it
> >>=20
> >> with ports
> >>=20
> >>  and thus are not split in DT.
> >> =20
> >>  Boards have:
> >>  	4x (3x for Manta boards) USB and 1 USB OTG.
> >>  	SDcard slot for loading images.
> >>  	Ethernet port wired to the internal PHY.
> >>  	2x HDMI 2.0.
> >>  	Power and Status LEDs.
> >> =20
> >>  Currently working:
> >>  	Booting
> >>  	USB
> >>  	UART
> >> =20
> >>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
> >>  ---
> >>  Changes in V2:
> >>  Add proper board compatible
> >>  Add regulator prefix for vcc5v
> >>  Drop okay status from PMIC
> >>  Drop standby_param
> >> =20
> >>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >>   .../dts/allwinner/sun50i-h616-biqu-cb1.dts    | 186
> >>=20
> >> ++++++++++++++++++
> >>=20
> >>   2 files changed, 187 insertions(+)
> >>   create mode 100644
> >>=20
> >> arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> >>=20
> >>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> >>  b/arch/arm64/boot/dts/allwinner/Makefile index
> >>=20
> >> 6a96494a2e0a..223f1be73541
> >>=20
> >>  100644
> >>  --- a/arch/arm64/boot/dts/allwinner/Makefile
> >>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
> >>  @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> >> =20
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >> =20
> >>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-biqu-cb1.dtb
> >> =20
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> >> =20
> >>  diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> >>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts new file
> >>=20
> >> mode
> >>=20
> >>  100644
> >>  index 000000000000..297536d7629a
> >>  --- /dev/null
> >>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> >>  @@ -0,0 +1,186 @@
> >>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> >>  +/*
> >>  + * Copyright (C) 2022 Arm Ltd.
> >=20
> > I suppose Arm Ltd. has nothing to do with this board? Put yours
> > copyrights
> > there.
>=20
> Correct. Was a left over from Opi Zero 2 with just changed year. Will
> correct in V3 with the rest of the changes
>=20
> >>  + */
> >>  +
> >>  +/dts-v1/;
> >>  +
> >>  +#include "sun50i-h616.dtsi"
> >>  +
> >>  +#include <dt-bindings/gpio/gpio.h>
> >>  +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  +#include <dt-bindings/leds/common.h>
> >>  +
> >>  +/ {
> >>  +	model =3D "BIQU CB1";
> >>  +	compatible =3D "biqu,cb1", "allwinner,sun50i-h616";
> >>  +
> >>  +	aliases {
> >>  +		serial0 =3D &uart0;
> >>  +	};
> >>  +
> >>  +	chosen {
> >>  +		stdout-path =3D "serial0:115200n8";
> >>  +	};
> >>  +
> >>  +	leds {
> >>  +		compatible =3D "gpio-leds";
> >>  +
> >>  +		led-0 {
> >>  +			function =3D LED_FUNCTION_POWER;
> >>  +			color =3D <LED_COLOR_ID_RED>;
> >>  +			gpios =3D <&pio 2 12 GPIO_ACTIVE_HIGH>; /*
> >=20
> > PC12 */
> >=20
> >>  +			default-state =3D "on";
> >>  +		};
> >>  +
> >>  +		led-1 {
> >>  +			function =3D LED_FUNCTION_STATUS;
> >>  +			color =3D <LED_COLOR_ID_GREEN>;
> >>  +			gpios =3D <&pio 2 13 GPIO_ACTIVE_HIGH>; /*
> >=20
> > PC13 */
> >=20
> >>  +		};
> >>  +	};
> >>  +
> >>  +	reg_vcc5v: regulator_vcc5v {
> >>  +		/* board wide 5V supply directly from the USB-C socket
> >=20
> > */
> >=20
> >>  +		compatible =3D "regulator-fixed";
> >>  +		regulator-name =3D "vcc-5v";
> >>  +		regulator-min-microvolt =3D <5000000>;
> >>  +		regulator-max-microvolt =3D <5000000>;
> >>  +		regulator-always-on;
> >>  +	};
> >>  +
> >>  +	reg_usb1_vbus: regulator-usb1-vbus {
> >>  +		compatible =3D "regulator-fixed";
> >>  +		regulator-name =3D "usb1-vbus";
> >>  +		regulator-min-microvolt =3D <5000000>;
> >>  +		regulator-max-microvolt =3D <5000000>;
> >>  +		vin-supply =3D <&reg_vcc5v>;
> >>  +		enable-active-high;
> >>  +		gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
> >>  +	};
> >>  +};
> >>  +
> >>  +&ehci0 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ehci1 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ehci2 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ehci3 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&mmc0 {
> >>  +	vmmc-supply =3D <&reg_dldo1>;
> >>  +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> >>  +	no-1-8-v;
> >>  +	bus-width =3D <4>;
> >>  +	status =3D "disabled";
> >>  +};
> >>  +
> >>  +&ohci0 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ohci1 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ohci2 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&ohci3 {
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&r_i2c {
> >>  +	status =3D "okay";
> >>  +
> >>  +	axp1530: pmic@36 {
> >>  +		compatible =3D "x-powers,axp1530";
> >=20
> > I see that you send driver for this PMIC separately. Next time please
> > mention
> > that this series depends on another, otherwise checks will fail. Ping
> > us here
> > once PMIC driver is merged to unblock this.
> >=20
> > Anyway, RSB is prefered. Can you switch to it?
>=20
> RSB does initialize but as soon as I try to give it the PMIC via RSB it
> doesnt really wanna work so thats a no sadly.

It's possible that you have to update this table:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
drivers/bus/sunxi-rsb.c?h=3Dv6.1-rc5#n528

If still doesn't work, you have to remove RSB support in PMIC driver.

Is there datasheet for this PMIC?

Best regards,
Jernej

>=20
> >>  +		reg =3D <0x36>;
> >>  +		wakeup-source;
> >>  +
> >>  +		regulators{
> >>  +			reg_dcdc1: dcdc1 {
> >>  +				regulator-name =3D "axp1530-
dcdc1";
> >>  +				regulator-min-microvolt =3D
> >=20
> > <500000>;
> >=20
> >>  +				regulator-max-microvolt =3D
> >=20
> > <3400000>;
> >=20
> >>  +				regulator-step-delay-us =3D <25>;
> >>  +				regulator-final-delay-us =3D <50>;
> >>  +				regulator-always-on;
> >>  +			};
> >>  +
> >>  +			reg_dcdc2: dcdc2 {
> >>  +				regulator-name =3D "axp1530-
dcdc2";
> >>  +				regulator-min-microvolt =3D
> >=20
> > <500000>;
> >=20
> >>  +				regulator-max-microvolt =3D
> >=20
> > <1540000>;
> >=20
> >>  +				regulator-step-delay-us =3D <25>;
> >>  +				regulator-final-delay-us =3D <50>;
> >>  +				regulator-ramp-delay =3D <200>;
> >>  +				regulator-always-on;
> >>  +			};
> >>  +
> >>  +			reg_dcdc3: dcdc3 {
> >>  +				regulator-name =3D "axp1530-
dcdc3";
> >>  +				regulator-min-microvolt =3D
> >=20
> > <500000>;
> >=20
> >>  +				regulator-max-microvolt =3D
> >=20
> > <1840000>;
> >=20
> >>  +				regulator-step-delay-us =3D <25>;
> >>  +				regulator-final-delay-us =3D <50>;
> >>  +				regulator-always-on;
> >>  +			};
> >>  +
> >>  +			reg_aldo1: ldo1 {
> >>  +				regulator-name =3D "axp1530-
aldo1";
> >>  +				regulator-min-microvolt =3D
> >=20
> > <1800000>;
> >=20
> >>  +				regulator-max-microvolt =3D
> >=20
> > <1800000>;
> >=20
> >>  +				regulator-step-delay-us =3D <25>;
> >>  +				regulator-final-delay-us =3D <50>;
> >>  +				regulator-always-on;
> >>  +			};
> >>  +
> >>  +			reg_dldo1: ldo2 {
> >>  +				regulator-name =3D "axp1530-
dldo1";
> >>  +				regulator-min-microvolt =3D
> >=20
> > <3300000>;
> >=20
> >>  +				regulator-max-microvolt =3D
> >=20
> > <3300000>;
> >=20
> >>  +				regulator-step-delay-us =3D <25>;
> >>  +				regulator-final-delay-us =3D <50>;
> >>  +				regulator-always-on;
> >>  +			};
> >>  +		};
> >>  +	};
> >>  +};
> >>  +
> >>  +&uart0 {
> >>  +	pinctrl-names =3D "default";
> >>  +	pinctrl-0 =3D <&uart0_ph_pins>;
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&usbotg {
> >>  +	/*
> >>  +	 * PHY0 pins are connected to a USB-C socket, but a role switch
> >>  +	 * is not implemented: both CC pins are pulled to GND.
> >>  +	 * The VBUS pins power the device, so a fixed peripheral mode
> >>  +	 * is the best choice.
> >>  +	 * The board can be powered via GPIOs, in this case port0 *can*
> >>  +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
> >>  +	 * then provided by the GPIOs. Any user of this setup would
> >>  +	 * need to adjust the DT accordingly: dr_mode set to "host",
> >>  +	 * enabling OHCI0 and EHCI0.
> >>  +	 */
> >=20
> > Above text is verbatim copy from OrangePi Zero2 and I'm not sure if
> > it is
> > fully accurate for this board too. Looking at board photo, it surely
> > looks
> > like this board has same USB design as Zero2. But if that's true, you
> > shouldn't enable OHCI0 and EHCI0 nodes.
>=20
> Correct. But M8P has a dip switch that enables or disables usbotg.
> As for if it does anything its hard to say.
>=20
> > Is there any board schematic publicly available for this board?
>=20
> This is one of the issues. Im in contact with BIQU and asking for the
> schematics.
> I hope we can get them released ASAP as it would help me as well.
>=20
> > Best regards,
> > Jernej
> >=20
> >>  +	dr_mode =3D "peripheral";
> >>  +	status =3D "okay";
> >>  +};
> >>  +
> >>  +&usbphy {
> >>  +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
> >>  +	status =3D "okay";
> >>  +};
>=20
> Best Regards,
> Martin




