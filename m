Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFFD3C2F
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 08:57:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD829C14;
	Thu, 20 Apr 2023 01:58:22 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 999A53F5A1;
	Thu, 20 Apr 2023 01:57:37 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:57:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ludwig Kormann <ludwig.kormann@in-circuit.de>
Cc: samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
Message-ID: <20230420095735.00cbf365@donnerap.cambridge.arm.com>
In-Reply-To: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
References: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Apr 2023 14:12:29 +0200
Ludwig Kormann <ludwig.kormann@in-circuit.de> wrote:

Hi Ludwig,

thanks for posting this!

> Add board support for ICnova A20 SomPi compute module on
> ICnova ADB4006 development board.
>=20
> Specification:
> SoM
> - Processor: Allwinner A20 Cortex-A7 Dual Core at 1GHz
> - 512MB DDR3 RAM
> - Fast Ethernet (Phy: Realtek RTL8201CP)
> ADB4006
> - I2C
> - 2x USB 2.0
> - 1x Fast Ethernet port
> - 1x SATA
> - 2x buttons (PWRON, Boot)
> - 2x LEDS
> - serial console
> - HDMI
> - =C2=B5SD-Card slot
> - Audio Line-In / Line-Out
> - GPIO pinheaders
>=20
> https://wiki.in-circuit.de/index.php5?title=3DICnova_ADB4006
> https://wiki.in-circuit.de/index.php5?title=3DICnova_A20_SODIMM
>=20
> ---
>=20
> changes in v2:
> - use short licensing header
> - remove deprecated elements from led nodes
> - disable csi power supply
> - add missing pins in usbphy node
> - split dts into SoM dtsi and carrier board dts
>=20
> v1 of this patch was sent to the uboot mailing list [1].
>=20
> [1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html
>=20
> Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>

So apart from what Krzysztof already mentioned (separate binding patch and
stray line), this looks good to me, and passed dt-validate. Also you
addressed all the comments I had on the U-Boot post (thanks for that), so
with those nits above fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  63 ++++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index 013821f4a7b8..12f0c236f17b 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -305,6 +305,12 @@ properties:
>            - const: allwinner,i12-tvbox
>            - const: allwinner,sun7i-a20
> =20
> +      - description: ICNova A20 ADB4006
> +        items:
> +          - const: incircuit,icnova-a20-adb4006
> +          - const: incircuit,icnova-a20
> +          - const: allwinner,sun7i-a20
> +
>        - description: ICNova A20 SWAC
>          items:
>            - const: incircuit,icnova-a20-swac
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3cc32722c394..b6b408417261 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1321,6 +1321,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-hummingbird.dtb \
>  	sun7i-a20-itead-ibox.dtb \
>  	sun7i-a20-i12-tvbox.dtb \
> +	sun7i-a20-icnova-a20-adb4006.dtb \
>  	sun7i-a20-icnova-swac.dtb \
>  	sun7i-a20-lamobo-r1.dtb \
>  	sun7i-a20-linutronix-testbox-v2.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts b/arch/ar=
m/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> new file mode 100644
> index 000000000000..c1606c085e4e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2023 In-Circuit GmbH
> +
> +/dts-v1/;
> +
> +#include "sun7i-a20-icnova-a20.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model =3D "In-Circuit ICnova A20 ADB4006";
> +	compatible =3D "incircuit,icnova-a20-adb4006", "incircuit,icnova-a20",
> +		     "allwinner,sun7i-a20";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_YELLOW>;
> +			gpios =3D <&pio 7 21 GPIO_ACTIVE_HIGH>; /* PH21 */
> +			default-state =3D "on";
> +		};
> +
> +		led-1 {
> +			function =3D LED_FUNCTION_HEARTBEAT;
> +			color =3D <LED_COLOR_ID_RED>;
> +			gpios =3D <&pio 7 20 GPIO_ACTIVE_HIGH>; /* PH20 */
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
> +
> +&ahci {
> +	target-supply =3D <&reg_ahci_5v>;
> +	status =3D "okay";
> +};
> +
> +&codec {
> +	status =3D "okay";
> +};
> +
> +&de {
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&hdmi {
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&otg_sram {
> +	status =3D "okay";
> +};
> +
> +&reg_ahci_5v {
> +	status =3D "okay";
> +};
> +
> +&ac_power_supply {
> +	status =3D "okay";
> +};
> +
> +&reg_usb1_vbus {
> +	status =3D "okay";
> +};
> +
> +&reg_usb2_vbus {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	usb0_vbus_det-gpios =3D <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +	usb2_vbus-supply =3D <&reg_usb2_vbus>;
> +	status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi b/arch/arm/boot/=
dts/sun7i-a20-icnova-a20.dtsi
> new file mode 100644
> index 000000000000..f1142bda5cd7
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2023 In-Circuit GmbH
> +
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&gmac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac_mii_pins>;
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "mii";
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	axp209: pmic@34 {
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&gmac_mdio {
> +	phy1: ethernet-phy@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-int-dll";
> +};
> +
> +&reg_ldo1 {
> +	regulator-name =3D "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "avcc";
> +};
> +

