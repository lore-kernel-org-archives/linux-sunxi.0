Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F82749F
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Sep 2023 20:42:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5BE205C00C1;
	Sat,  9 Sep 2023 16:42:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 09 Sep 2023 16:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1694292147; x=1694378547; bh=qyUkUjMrSyWBTwEeXGCCwy+n3GVh3Q45iIS
	xQw+nVCg=; b=nUmZ1gXy0cvvPmFPtnXYxlMC2nv32IXRsHuLTXK+RTiwvJn3obu
	hnRp27sJAfOFZg2EdaNsSMamDuZOfBjtERXgrcFVEB/8O9n94GG+msyaC2K6zh3r
	l6JFxOQ7W6Xv778o8Rofz8nwOItHvCUbTiFPL78VHnfZAXj7rjblhMr79E9HNw5R
	d48xJeKWrbkwYZ97udy2POPPE98A+yTCCyStxYUJMLHUHOPgmA7K3wF1kC21jTWn
	R3EUBYV7anGOudg3MSzOMXUyP7AzxLHJ8D6JYHDw/u6eM+ma10nogMPH6Ru1twpH
	V5VI01gopKb84mJDEXUj9erDHSUwGtjrS8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1694292147; x=1694378547; bh=qyUkUjMrSyWBTwEeXGCCwy+n3GVh3Q45iIS
	xQw+nVCg=; b=dOz2KCHuaJQ3lpSpwyLX8KxSmCVWEjdFnKk9a80aSTs25sNOtvH
	V4FFoKh8f9ffLbmsGmimNWI3QnLvh8OYArgUA/Xuuez4o+gVNYKbPeW6Sq7KduLM
	Q2h+Yl4Vyt19juDszW8D73/0MODuu/W9nY84rqie6KzHkuhxX27P8fZ8TtA6aWMU
	EJo6ytc7scRpT4w/SMebk2CLsGBJf+EDpj/DvZalLyEYCPE0FBaeg+2FM3ft4HV9
	oWv1FlylHVnvKb/UDXNjvFSFjezqnLFY7Hd/7zXg3G1BZCyIuzUXo2O0IZckMbwB
	SgpI3y/P3ey1HAm+AUaWYbFW+S/Q+OJ7pcw==
X-ME-Sender: <xms:stj8ZKgOR93F_72TGf0R-G_2B61GOqGBxtReW8efqyoPbiQKk0271A>
    <xme:stj8ZLBJQon7wZ2rZPsd76OsfmV4rGSvStZklSwOIU2oMzqGGDT9V9bz2ZfYSDXgy
    voGtjdqav-dxfn9yw>
X-ME-Received: <xmr:stj8ZCHYDYVXa2k5MfGmM8OxaJCkuHaIBkLxDBBFp-OOrWLNfA1xIGyMnFcopAaoJGiphksvfJERvWkwQgyc-zgHQbXSwrzJb2DIsRCOO2qs9F-jgxWL-CPcow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:stj8ZDQYYjjlfhlJLe4w702XqSBDjvdtOyyvpNDS5P3YAbF3stIA9g>
    <xmx:stj8ZHzKtsfloPRbRy70P0mywLgTm3Qw4OJ-2ABepVDtnnwlEkwt6Q>
    <xmx:stj8ZB479vUwRsjAlxQlBvcqe5zfNBgCRWJ6JMDtpljLveBfo-S15w>
    <xmx:s9j8ZHkxRVqlTIzxlbNQojetnum6KR-Xzf9jib3DawRVIVOnWBO4gQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:42:25 -0400 (EDT)
Message-ID: <a2f25492-b7cd-e7b1-2c67-0189a38d879f@sholland.org>
Date: Sat, 9 Sep 2023 15:42:24 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 jernej.skrabec@gmail.com
Cc: devicetree@vger.kernel.org, airlied@gmail.com, andre.przywara@arm.com,
 conor+dt@kernel.org, daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 neil.armstrong@linaro.org, noralf@tronnes.org, robh+dt@kernel.org,
 sam@ravnborg.org, uwu@icenowy.me, wens@csie.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-9-macroalpha82@gmail.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230828181941.1609894-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/23 13:19, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-Nano is a small portable game device based on the
> Allwinner V3s SoC. It has GPIO buttons on the face and side for
> input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> OTG port, an SD card slot for booting, and 64MB of RAM included in the
> SoC.
> 
> Working/Tested:
> - SDMMC
> - UART (for debugging)
> - Buttons
> - Charging/battery/PMIC
> - Speaker
> - RTC
> - USB Host and Gadget*
> - Display (at 60hz)
> 
> *There is an issue with the usb_phy where it forces the device to host
> mode. Until the phy driver is fixed this can be bypassed by either
> removing the phy references from the ohci and ehci nodes or by setting
> the usbphy on the ohci and ehci nodes to 1 (which is incorrect).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
>  2 files changed, 285 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 589a1ce1120a..2be83a1edcbb 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-t113s-mangopi-mq-r-t113.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
> +	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> new file mode 100644
> index 000000000000..bcccb0d3f9ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include "sun8i-v3s.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model = "Anbernic RG Nano";
> +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> +		default-brightness-level = <11>;
> +		power-supply = <&reg_vcc5v0>;
> +		pwms = <&pwm 0 40000 1>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-a {
> +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-A";
> +			linux,code = <BTN_EAST>;
> +		};
> +
> +		button-b {
> +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-B";
> +			linux,code = <BTN_SOUTH>;
> +		};
> +
> +		button-down {
> +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "DPAD-DOWN";
> +			linux,code = <BTN_DPAD_DOWN>;
> +		};
> +
> +		button-left {
> +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "DPAD-LEFT";
> +			linux,code = <BTN_DPAD_LEFT>;
> +		};
> +
> +		button-right {
> +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "DPAD-RIGHT";
> +			linux,code = <BTN_DPAD_RIGHT>;
> +		};
> +
> +		button-se {
> +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-SELECT";
> +			linux,code = <BTN_SELECT>;
> +		};
> +
> +		button-st {
> +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-START";
> +			linux,code = <BTN_START>;
> +		};
> +
> +		button-tl {
> +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-L";
> +			linux,code = <BTN_TL>;
> +		};
> +
> +		button-tr {
> +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-R";
> +			linux,code = <BTN_TR>;
> +		};
> +
> +		button-up {
> +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "DPAD-UP";
> +			linux,code = <BTN_DPAD_UP>;
> +		};
> +
> +		button-x {
> +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-X";
> +			linux,code = <BTN_NORTH>;
> +		};
> +
> +		button-y {
> +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label = "BTN-Y";
> +			linux,code = <BTN_WEST>;
> +		};
> +	};
> +};
> +
> +&ccu {
> +	clocks = <&osc24M>, <&osc32k>;
> +};

This is not accurate. The CCU's 32 kHz clock comes from the internal
RTC, whether you lie to the kernel about it or not. :)

If the external 32 kHz crystal represented by &osc32k really exists,
then I would expect the internal RTC to be accurate. At least the Linux
driver tries to switch to the external crystal.

If it's not using the external crystal... well, the V3s manual says
"Note: Internal 32kHz is divided from OSC24MHz". And there's no integer
factor of 24 MHz that gets you 32768 Hz, so that would explain the poor
accuracy. Even in that case, if you can't use the RTC as an RTC, it
should still be enabled in the DT, so the rest of the system can know
the actual OSC32K/LOSC clock frequency. Userspace should be able to deal
with the system having more than one RTC.

> +
> +&codec {
> +	allwinner,audio-routing = "Speaker", "HP",
> +				  "MIC1", "Mic",
> +				  "Mic", "HBIAS";
> +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PF6 */
> +	status = "okay";
> +};
> +
> +&ehci {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	gpio_expander: gpio@20 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> +		vcc-supply = <&reg_vcc3v3>;
> +	};
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
> +	};
> +
> +	pcf8563: rtc@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&battery_power_supply {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	vqmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&ohci {
> +	status = "okay";
> +};
> +
> +&pio {
> +	clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;

The same concern applies here.

Regards,
Samuel

> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	spi0_no_miso_pins: spi0-no-miso-pins {
> +		pins = "PC1", "PC2", "PC3";
> +		function = "spi0";
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-0 = <&pwm0_pin>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <1250000>;
> +	regulator-min-microvolt = <1250000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-name = "vcc-io";
> +};
> +
> +/*
> + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> + * software modified. Note that setting voltage here to 3.3v for accuracy
> + * sake causes an issue with the driver that causes it to fail to probe
> + * because of a voltage constraint in the driver.
> + */
> +&reg_ldo1 {
> +	regulator-always-on;
> +	regulator-name = "vcc-rtc";
> +};
> +
> +/* LDO2 wired into VCC-PLL and audio codec. */
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-name = "vcc-pll";
> +};
> +
> +/* LDO3, LDO4, and LDO5 unused. */
> +&reg_ldo3 {
> +	status = "disabled";
> +};
> +
> +&reg_ldo4 {
> +	status = "disabled";
> +};
> +
> +/* External RTC used instead, internal RTC runs fast. */
> +&rtc {
> +	status = "disabled";
> +};
> +
> +&spi0 {
> +	pinctrl-0 = <&spi0_no_miso_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> +		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> +		spi-max-frequency = <100000000>;
> +
> +		height-mm = <39>;
> +		width-mm = <39>;
> +
> +		/* Set hb-porch to compensate for non-visible area */
> +		panel-timing {
> +			hactive = <240>;
> +			vactive = <240>;
> +			hback-porch = <80>;
> +			vback-porch = <0>;
> +			clock-frequency = <0>;
> +			hfront-porch = <0>;
> +			hsync-len = <0>;
> +			vfront-porch = <0>;
> +			vsync-len = <0>;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usb_power_supply {
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PG5 */
> +	status = "okay";
> +};

