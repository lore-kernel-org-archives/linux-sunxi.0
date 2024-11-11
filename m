Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEF61A08DF
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346063; cv=none; b=SLyyzIbSq2pt/jG7t+biYqI9TO7VEDXmdUPAgzRE1p8CrslLm1NqybJp4jJEsZUtd8Cy3NRkiBLnvjeYzsdqfsWyU+NMIdjwShpJsDSYQLoDcJq2WRDHzSQWDGs3sP0C9Fo3uDe7ezZ73nYnLvFfHbCh82fbp+aPfOob3imk614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346063; c=relaxed/simple;
	bh=EzHubOyd3Bja2pThB9rZDCjbW+OpU9ecuX+hTitWH94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z5R+CsJz5H73pJVf5pnlCEZwrCWHl8L0bo8a7GoLQRwGrU3Aqjxii2cUMxI638AOr/97JcU1EDWsHvWqoogKhLT+8+fHdDsMS1rfUN7Oucqj/s6Y+zPMs5q4aiH6cZWCrzjP8O3/RBHrYSH+cQTuDP5UziBrCG5vtqjQlcpZXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1131480;
	Mon, 11 Nov 2024 09:28:08 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6658D3F59E;
	Mon, 11 Nov 2024 09:27:35 -0800 (PST)
Date: Mon, 11 Nov 2024 17:27:31 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: codekipper@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 wens@csie.org, macromorgan@hotmail.com, jszhang@kernel.org, uwu@icenowy.me,
 ryan@testtoast.com, dsimic@manjaro.org, mripard@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Add initial support for the
 X96Q-Pro STB
Message-ID: <20241111172731.54154a3e@donnerap.manchester.arm.com>
In-Reply-To: <20241111162524.46812-3-codekipper@gmail.com>
References: <20241111162524.46812-1-codekipper@gmail.com>
	<20241111162524.46812-3-codekipper@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Nov 2024 17:25:06 +0100
codekipper@gmail.com wrote:

Hi Marcus,

many thanks for sending this!

> From: Marcus Cooper <codekipper@gmail.com>
> 
> The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
> slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
> integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
> a blue LED display, an audio video connector and an digital S/PDIF
> connector.
> 
> Add the devicetree file describing the currently supported features,
> namely IR, LEDs, SD card, PMIC, audio codec, SPDIF and USB.

This looks good on a first glance, but seems to miss the DVFS bits? So you
would need to #include "sun50i-h616-cpu-opp.dtsi" and specify the cpu0
power supply rail, otherwise you will be stuck at 1GHz.

Or is there any issue preventing you doing this?

Two more things below:

> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
>  2 files changed, 177 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 00bed412ee31c..e0bcea1840c1f 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-x96q-pro.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> new file mode 100644
> index 0000000000000..4427545ea143c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + */

Is this missing some copyright notice here?

> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "X96Q Pro";
> +	compatible = "amediatech,x96q-pro", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_vcc5v: vcc5v {
> +		/* board wide 5V supply directly from the DC input */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sound-spdif {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "sun50i-h616-spdif";
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&spdif>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&spdif_out>;
> +		};
> +	};
> +
> +	spdif_out: spdif-out {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +	};
> +};
> +
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci3 {
> +	status = "okay";
> +};
> +
> +&ir {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dldo1>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> +	bus-width = <4>;
> +	status = "okay";
> +};

Would it make sense to add the mmc1 node here, even if there is no driver
in Linux atm for the WiFi chip? Thanks to SDIO we wouldn't need a
compatible string, I think. This would also then allow us to describe the
connected GPIOs.

And does the box have Bluetooth?

Cheers,
Andre

> +
> +&mmc2 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	bus-width = <8>;
> +	non-removable;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci3 {
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pc-supply = <&reg_dldo1>;
> +	vcc-pf-supply = <&reg_dldo1>;
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_dldo1>;
> +	vcc-pi-supply = <&reg_dldo1>;
> +};
> +
> +&r_i2c {
> +	status = "okay";
> +
> +	axp313: pmic@36 {
> +		compatible = "x-powers,axp313a";
> +		reg = <0x36>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;	/* PC9 */
> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +
> +		regulators {
> +			/* Supplies VCC-PLL, so needs to be always on. */
> +			reg_aldo1: aldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc1v8";
> +			};
> +
> +			/* Supplies VCC-IO, so needs to be always on. */
> +			reg_dldo1: dldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc3v3";
> +			};
> +
> +			reg_dcdc1: dcdc1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <810000>;
> +				regulator-max-microvolt = <990000>;
> +				regulator-name = "vdd-gpu-sys";
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <810000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-name = "vdd-dram";
> +			};
> +		};
> +	};
> +};
> +
> +&spdif {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> +
> +&usbotg {
> +	dr_mode = "host";	/* USB A type receptable */
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};

d
