Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666A81720;
	Thu,  2 Jan 2025 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735834550; cv=none; b=vCSAVIV3nXmAZCY6IFitrsfvVkdTf/9cXA/OrCyafau578Qrz95WxJ11GjtQ4th4jeAUUcdFAtU+ooFPkCHhkErWR+CjCm6K5709gJN9KjXdlCDgpHY/Ln4p+brExb1Zjvrygau77Ex117aZSAwd3BVx/F6VbgJUmQMUDn6KUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735834550; c=relaxed/simple;
	bh=vtpyPVyNY0DOcPtGHrHjwqgeSbCkMC+oBE3qnCPhoVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkcS50/Wjmxg7N6gREcP8WzxAf24jiFYRTw1vKqLA/z6OwURgvhBC9CF3cW6GkeukzJgpk7DD5z/z5OMEuS4gZc/C8vwFseIZ1R2CMNwh68kpt2HAVdJbGspuE1z8NVZVY3JJyd1jQQfmyeD6xFNS2r3ec1FAEdp8TNvNxJQuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBnTQf7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBnTQf7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A59C4CED1;
	Thu,  2 Jan 2025 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735834549;
	bh=vtpyPVyNY0DOcPtGHrHjwqgeSbCkMC+oBE3qnCPhoVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qBnTQf7rOXNQnRpXrbxFWrusPCG965Zal16IFeOMe67Q1tF/xiicCxuiKFnGMtj1O
	 FuZuxM5tdtNmD5yITsPxny8/392nUONXQCvKE+zlFmB3q5oLiOTo3sE2gtiBPh1Zs5
	 bHByByNr6v1UqfpkLgJTCMN3L2tAdxHSr09mtJ9kwrmysfcZwECFyglboKPetp8wbF
	 NEKLTwQ5ahb6CTAVN0pLzksqKfdVPB53FbcxMJds9P+KSYI6sRl6gYrkWTPxdsg9pj
	 vj+zg/nODSKyJp7NoZlotold4ZqpIZjEa7IuWChdo9ls5xVAohq6mc3cE/G9rYPL/3
	 PsrL2mk5UMfMw==
Message-ID: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
Date: Thu, 2 Jan 2025 17:15:43 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
To: Lukas Schmid <lukas.schmid@netcube.li>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250102150508.3581-1-lukas.schmid@netcube.li>
 <20250102150508.3581-3-lukas.schmid@netcube.li>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250102150508.3581-3-lukas.schmid@netcube.li>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/01/2025 16:05, Lukas Schmid wrote:
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
> 
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 237 ++++++++++++++++++
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
>  3 files changed, 245 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc := -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
>  dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-a23-evb.dtb \
>  	sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> +	sun8i-v3s-netcube-kumquat.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..7fe83d91adee
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +	model = "NetCube Systems Kumquat";
> +	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &emac;
> +		rtc0 = &ds3232;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat_led {

Please follow DTS coding style.

> +			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		mmc0_act_led {

Ditto

> +			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +			linux,default-trigger = "mmc0";
> +			function = LED_FUNCTION_DISK;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		key-user {
> +			label = "GPIO Key User";
> +			linux,code = <KEY_PROG1>;
> +			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
> +		};
> +	};
> +
> +	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
> +	reg_vcc5v0: vcc5v0 {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

(or at least regulator prefix)

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
> +	reg_vcc3v3: vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vcc5v0>;
> +	};
> +
> +	/* XC6206-3.0 Linear Regualtor */
> +	reg_vcc3v0: vcc3v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v0";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +		vin-supply = <&reg_vcc3v3>;
> +	};
> +
> +	/* 40 MHz Crystal Oscillator on PCB */
> +	can0_osc: can0_osc {

DTS coding style.


...

> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
> +		pagesize = <16>;
> +		read-only;
> +		reg = <0x50>;
> +		vcc-supply = <&reg_vcc3v3>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		eth0_macaddress: eth0_macaddress@FA {


Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.


> +			reg = <0xFA 0x06>;

Here and in multiple other places - it is always lowercase hex.

Again: please follow DTS coding style.


> +		};
> +	};
> +
> +	tusb320: tusb320@60 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "ti,tusb320";
> +		reg = <0x60>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	ds3232: rtc@68 {
> +		compatible = "dallas,ds3232";
> +		reg = <0x68>;
> +	};
> +};
> +
> +&emac {
> +	allwinner,leds-active-low;
> +	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
> +	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;
> +	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0>;
> +		compatible = "jedec,spi-nor";

Odd ordering of properties.

> +		label = "firmware";
> +		spi-max-frequency = <40000000>;
> +	};
> +
> +	can@1 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <1>;

And here totally different. DTS coding style defines one (this is correct).

> +		clocks = <&can0_osc>;
> +		spi-max-frequency = <20000000>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
> +		vdd-supply = <&reg_vcc3v3>;
> +		xceiver-supply = <&reg_vcc3v3>;
> +	};
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pe-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>, <167 25>, <198 26>;
> +	gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PA
> +						"CAN_nCS", "CAN_nINT", "USER_SW", "PB3", "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA", "UART0_TX", "UART0_RX", "", "", "", "", "", "", "", "", "", 

Totally messed wrapping and alignment/indentation.

...

>  
> +			/omit-if-no-ref/
> +			uart1_pe_pins: uart1_pe_pins {

look here...

> +				pins = "PE21", "PE22";
> +				function = "uart1";
> +			};
> +
>  			uart2_pins: uart2-pins {

and here and the difference in style should trigger your review before
submitting it. Align your code with upstream, not downstream coding style.

Best regards,
Krzysztof
