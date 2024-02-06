Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2660DDF56
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707243233; cv=none; b=HPk2YBkQKEY7BAnmkCPSz62fcnDkgTw8cqlD0YKsPvuy4BcXmMVvx5CrjOJXSwLVshwHzGMBG9RhOJkuLWXIHPte32HCQWMe5lYU91GMKQV/e4afr54I6iCP0ffpYVnBMHl4XWn4MyikEXKqPYWTkrtPpjQwWNjEaJ75JXfpNtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707243233; c=relaxed/simple;
	bh=aQjve1987dXGWU24+q94mnwyhFdizw7wTe1tE6xHEbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QScB9D4RjIpFyFjxL+ahISJonGKhfr0w+bWdtsTLAQVvRmFOmb8WS8pr+hkTPqbFTAtEo8tWlUFblvd0xBIE2qlgfW6cGKJ6c4DCBj0KxMt/IcW/I+h2e35eTPxYX/rn4YtGF+Dvq8uFXHVUg2YWXgN9sFmfRxL5LZtjHqVXNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90E91FB;
	Tue,  6 Feb 2024 10:14:32 -0800 (PST)
Received: from [10.1.34.10] (e110479.arm.com [10.1.34.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4063F64C;
	Tue,  6 Feb 2024 10:13:48 -0800 (PST)
Message-ID: <8d9d1d7c-8066-4400-8fe4-68aa0e28023d@arm.com>
Date: Tue, 6 Feb 2024 18:13:46 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC support
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
References: <20240204094404.149776-1-andre.przywara@arm.com>
 <3788758.kQq0lBPeGt@jernej-laptop>
 <205b3828-6ec2-4670-ac68-a61e5cc0597d@arm.com>
 <4867577.GXAFRqVoOG@jernej-laptop>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <4867577.GXAFRqVoOG@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jernej,

On 06/02/2024 18:32, Jernej Škrabec wrote:
> Dne torek, 06. februar 2024 ob 01:47:05 CET je Andre Przywara napisal(a):
>> Hi Jernej,
>>
>> thanks for having a look!
>>
>> On 05/02/2024 19:20, Jernej Škrabec wrote:
>>> Dne ponedeljek, 05. februar 2024 ob 19:12:45 CET je Jernej Škrabec napisal(a):
>>>> Hi Andre!
>>>>
>>>> Dne nedelja, 04. februar 2024 ob 10:44:04 CET je Andre Przywara napisal(a):
>>>>> The Remix Mini PC is a "mini computer" using the Allwinner H64 SoC,
>>>>> which appears to be just a relabelled A64. It was launched in 2015 by
>>>>> the now defunct company Jide, and shipped with a desktop optimised
>>>>> version of Android. It features
>>>>> 	- Allwinner H64 Soc (4 * Arm Cortex-A53 cores)
>>>>> 	- 1 or 2 GB DRAM
>>>>> 	- 8 or 16 GB eMMC flash
>>>>> 	- 100 MBit Ethernet port (using an X-Powers AC200 PHY)
>>>>> 	- RTL8723BS WiFi & Bluetooth chip
>>>>> 	- HDMI port
>>>>> 	- two USB 2.0 ports
>>>>> 	- 3.5mm AV port
>>>>> 	- microSD card slot
>>>>>
>>>>> The devicetree covers most peripherals, though there is no agreed
>>>>> binding for the PHY chip yet, so this is left out.
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>>>>>    .../allwinner/sun50i-h64-remix-mini-pc.dts    | 357 ++++++++++++++++++
>>>>>    2 files changed, 358 insertions(+)
>>>>>    create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
>>>>> index 91d505b385de..2db3b15ad09f 100644
>>>>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>>>>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>>>> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>>>>> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
>>>>>    dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
>>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
>>>>> new file mode 100644
>>>>> index 000000000000..537923a541a8
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
>>>>> @@ -0,0 +1,357 @@
>>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>>> +// Copyright (c) 2018 ARM Ltd.
>>>>
>>>> Shouldn't be 2024?
>>
>> Well, that just documents that sad fact that I indeed created this file
>> 6 years ago, but just managed now to actually send this. Is there a
>> requirement for this being "recent"?
> 
> Not really, but it's strange looking. Some might incorrectly assume that it's
> present in the kernel longer than it really is.

OK, I will put in 2023, as this is when I touched this again.

>>>>
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include "sun50i-a64.dtsi"
>>>>> +#include "sun50i-a64-cpu-opp.dtsi"
>>>>> +
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +/ {
>>>>> +	model = "Remix Mini PC";
>>>>> +	compatible = "jide,remix-mini-pc", "allwinner,sun50i-h64",
>>>>> +		     "allwinner,sun50i-a64";
>>>>> +
>>>>> +	aliases {
>>>>> +		ethernet1 = &rtl8723bs;
>>>>> +		serial0 = &uart0;
>>>>> +	};
>>>>> +
>>>>> +	chosen {
>>>>> +		stdout-path = "serial0:115200n8";
>>>>> +	};
>>>>> +
>>>>> +	hdmi-connector {
>>>>> +		compatible = "hdmi-connector";
>>>>> +		type = "a";
>>>>> +
>>>>> +		port {
>>>>> +			hdmi_con_in: endpoint {
>>>>> +				remote-endpoint = <&hdmi_out_con>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	reg_vcc5v: regulator-5v {
>>>>> +		/* board wide 5V supply directly from the DC input */
>>>>> +		compatible = "regulator-fixed";
>>>>> +		regulator-name = "vcc-5v";
>>>>> +		regulator-min-microvolt = <5000000>;
>>>>> +		regulator-max-microvolt = <5000000>;
>>>>> +		regulator-always-on;
>>>>> +	};
>>>>> +
>>>>> +	wifi_pwrseq: wifi_pwrseq {
>>>>> +		compatible = "mmc-pwrseq-simple";
>>>>> +		pinctrl-names = "default";
>>>>> +		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
>>>>> +		post-power-on-delay-ms = <200>;
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> +&codec {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&codec_analog {
>>>>> +	cpvdd-supply = <&reg_eldo1>;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&cpu0 {
>>>>> +	cpu-supply = <&reg_dcdc2>;
>>>>> +};
>>>>> +
>>>>> +&cpu1 {
>>>>> +	cpu-supply = <&reg_dcdc2>;
>>>>> +};
>>>>> +
>>>>> +&cpu2 {
>>>>> +	cpu-supply = <&reg_dcdc2>;
>>>>> +};
>>>>> +
>>>>> +&cpu3 {
>>>>> +	cpu-supply = <&reg_dcdc2>;
>>>>> +};
>>>>> +
>>>>> +&dai {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&de {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&ehci0 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&ehci1 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&hdmi {
>>>>> +	hvcc-supply = <&reg_dldo1>;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&hdmi_out {
>>>>> +	hdmi_out_con: endpoint {
>>>>> +		remote-endpoint = <&hdmi_con_in>;
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> +/* Connects to the AC200 chip */
>>>>> +&i2c0 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&i2c0_pins>;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&i2c0_pins {
>>>>> +	bias-pull-up;
>>>>> +};
>>>>> +
>>>>> +&mmc0 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&mmc0_pins>;
>>>>> +	vmmc-supply = <&reg_dcdc1>;
>>>>> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>>>>> +	disable-wp;
>>>>> +	bus-width = <4>;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&mmc1 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&mmc1_pins>;
>>>>> +	vmmc-supply = <&reg_aldo1>;
>>>>> +	vqmmc-supply = <&reg_dldo4>;
>>>>> +	mmc-pwrseq = <&wifi_pwrseq>;
>>>>> +	bus-width = <4>;
>>>>> +	non-removable;
>>>>> +	status = "okay";
>>>>> +
>>>>> +	rtl8723bs: wifi@1 {
>>>>> +		reg = <1>;
>>>>> +		interrupt-parent = <&r_pio>;
>>>>> +		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
>>>>> +		interrupt-names = "host-wake";
>>>>> +	};
>>>>
>>>> Node without compatible doesn't help. Please remove it.
>>
>> Huh, but where do I put the the IRQ line then? And every other RTL8723BS
>> user seems to do the same?
> 
> It's good, sorry for the noise.

Just for the records, and for my own reference:
Since there is no "ranges" property in the MMC node, the Linux platform 
bus driver is not automatically traversing any child nodes. So we don't 
need a compatible string. Instead it's a new addressing scheme (this 
obsolete MMC "bus" address, like SPI or I2C), so it's up to the driver 
to do the child iteration. And it will match device #1 to reg <1>, and 
use that node, as Chen-Yu mentioned.

>>>>
>>>>> +};
>>>>> +
>>>>> +&mmc2 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&mmc2_pins>, <&mmc2_ds_pin>;
>>>>> +	vmmc-supply = <&reg_dcdc1>;
>>>>> +	vqmmc-supply = <&reg_eldo1>;
>>>>> +	bus-width = <8>;
>>>>> +	non-removable;
>>>>> +	mmc-ddr-1_8v;
>>>>> +	mmc-hs200-1_8v;
>>>>
>>>> Aren't these speed modes enabled by default?
>>
>> Enabled by who? Our current sunxi-mmc driver? I cannot find anything in
>> the binding that suggests that there would be some default settings.
> 
> Looking at Linux sunxi mmc driver, mmc-ddr-1_8v is enabled by default for
> "new timings" variants except for H5. Anyway...

But this is a Linux implementation detail, which we should not rely on 
in a DT? And if I remember Maxime correctly back then, the plan was to 
avoid those driver hacks and just say what we support in the DT, going 
forward. This might be needed for other OSes, which might not support 
HS-200?
>>> Sorry, mmc-hs200-1_8v is ok, but mmc-ddr-1_8v should be
>>> removed.
>>
>> Mmh, I am confused: I thought after the H5 eMMC mishap we figured that
>> all speed modes supported by the eMMC chip should be listed in the DT?
> 
> I think H5 just has (had?) driver issue. From what I can see, only highest
> supported mode by kernel and chip is specified in all Allwinner DTs.
> mmc-ddr-1_8v is only specified by two recent board addition, where I missed
> it while reviewing.
> 
>> So any driver wouldn't need to make assumptions, and if a particular
>> mode shows problems on a board, we just remove that mode from the DT.
>> Actually, thinking about that, I guess I should list HS-400 as well? The
>> BSP kernel uses that mode.
> 
> Sure, but it also calibrates timing for it. If you'll specify HS400, kernel
> will try to use it, but it won't work.

But this is also a limitation of the current Linux kernel driver. And 
since we indeed don't support HS-400, we explicitly remove it from the 
capability list, *after* the call to mmc_of_parse():

drivers/mmc/host/sunxi-mmc.c:1460
         /* TODO: This driver doesn't support HS400 mode yet */
         mmc->caps2 &= ~MMC_CAP2_HS400;

So I think this should be safe?

Cheers,
Andre

> 
>> Or do you mean to say that in particular DDR (@1.8V) is problematic? I
>> cannot test at the moment, but could try later to force that mode.
> 
> No, no need.
> 
> Best regards,
> Jernej
> 
>>
>> Cheers,
>> Andre
>>
>>
>>>>> +	cap-mmc-hw-reset;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&ohci0 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&ohci1 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&pio {
>>>>> +	vcc-pb-supply = <&reg_dcdc1>;
>>>>> +	vcc-pc-supply = <&reg_dcdc1>;
>>>>> +	vcc-pd-supply = <&reg_dcdc1>;
>>>>> +	vcc-pe-supply = <&reg_dcdc1>;
>>>>> +	vcc-pf-supply = <&reg_dcdc1>;
>>>>> +	vcc-pg-supply = <&reg_dldo4>;
>>>>> +	vcc-ph-supply = <&reg_dcdc1>;
>>>>> +};
>>>>> +
>>>>> +&r_ir {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&r_pio {
>>>>> +	/*
>>>>> +	 * We cannot add that supply for now since it would create a circular
>>>>> +	 * dependency between pinctrl, the regulator and the RSB Bus.
>>>>> +	 *
>>>>> +	 * vcc-pl-supply = <&reg_aldo2>;
>>>>> +	 */
>>>>> +};
>>>>> +
>>>>> +&r_rsb {
>>>>> +	status = "okay";
>>>>> +
>>>>> +	axp803: pmic@3a3 {
>>>>> +		compatible = "x-powers,axp803";
>>>>> +		reg = <0x3a3>;
>>>>> +		interrupt-parent = <&r_intc>;
>>>>> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
>>>>> +		x-powers,drive-vbus-en;
>>>>> +
>>>>> +		vin1-supply = <&reg_vcc5v>;
>>>>> +		vin2-supply = <&reg_vcc5v>;
>>>>> +		vin3-supply = <&reg_vcc5v>;
>>>>> +		vin5-supply = <&reg_vcc5v>;
>>>>> +		vin6-supply = <&reg_vcc5v>;
>>>>> +		aldoin-supply = <&reg_vcc5v>;
>>>>> +		dldoin-supply = <&reg_vcc5v>;
>>>>> +		eldoin-supply = <&reg_vcc5v>;
>>>>> +		fldoin-supply = <&reg_vcc5v>;
>>>>> +		drivevbus-supply = <&reg_vcc5v>;
>>>>> +		ips-supply = <&reg_vcc5v>;
>>>>> +
>>>>> +		status = "okay";
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> +#include "axp803.dtsi"
>>>>> +
>>>>> +&ac_power_supply {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&reg_dcdc1 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <3300000>;
>>>>> +	regulator-max-microvolt = <3300000>;
>>>>> +	regulator-name = "vcc-3v3";
>>>>> +};
>>>>> +
>>>>> +&reg_dcdc2 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <1040000>;
>>>>> +	regulator-max-microvolt = <1300000>;
>>>>> +	regulator-name = "vdd-cpux";
>>>>> +};
>>>>> +
>>>>> +/* DCDC3 is polyphased with DCDC2 */
>>>>> +
>>>>> +&reg_dcdc5 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <1500000>;
>>>>> +	regulator-max-microvolt = <1500000>;
>>>>> +	regulator-name = "vcc-dram";
>>>>> +};
>>>>> +
>>>>> +/* Deviates from the reset default of 1.1V. */
>>>>> +&reg_dcdc6 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <1200000>;
>>>>> +	regulator-max-microvolt = <1200000>;
>>>>> +	regulator-name = "vdd-sys";
>>>>> +};
>>>>> +
>>>>> +&reg_aldo1 {
>>>>> +	regulator-min-microvolt = <3300000>;
>>>>> +	regulator-max-microvolt = <3300000>;
>>>>> +	regulator-name = "vcc-wifi";
>>>>> +};
>>>>> +
>>>>> +&reg_aldo2 {
>>>>> +	/* Specifying R_PIO consumer would create circular dependency. */
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <3300000>;
>>>>> +	regulator-max-microvolt = <3300000>;
>>>>> +	regulator-name = "vcc-pl";
>>>>> +};
>>>>> +
>>>>> +&reg_aldo3 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <3000000>;
>>>>> +	regulator-max-microvolt = <3000000>;
>>>>> +	regulator-name = "vcc-pll-avcc";
>>>>> +};
>>>>> +
>>>>> +/* AC200 power supply */
>>>>> +&reg_dldo1 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <3300000>;
>>>>> +	regulator-max-microvolt = <3300000>;
>>>>> +	regulator-name = "vcc-ave-33";
>>>>> +};
>>>>> +
>>>>> +&reg_dldo4 {
>>>>> +	regulator-min-microvolt = <3300000>;
>>>>> +	regulator-max-microvolt = <3300000>;
>>>>> +	regulator-name = "vcc-wifi-io";
>>>>> +};
>>>>> +
>>>>> +&reg_drivevbus {
>>>>> +	regulator-name = "usb0-vbus";
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&reg_eldo1 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <1800000>;
>>>>> +	regulator-max-microvolt = <1800000>;
>>>>> +	regulator-name = "vcc-cpvdd-dram-emmc";
>>>>> +};
>>>>> +
>>>>> +/* Supplies the arisc management core, needed by TF-A to power off cores. */
>>>>> +&reg_fldo2 {
>>>>> +	regulator-always-on;
>>>>> +	regulator-min-microvolt = <1100000>;
>>>>> +	regulator-max-microvolt = <1100000>;
>>>>> +	regulator-name = "vdd-cpus";
>>>>> +};
>>>>> +
>>>>> +&reg_rtc_ldo {
>>>>> +	regulator-name = "vcc-rtc";
>>>>> +};
>>>>> +
>>>>> +&simplefb_hdmi {
>>>>> +	vcc-hdmi-supply = <&reg_dcdc1>;
>>>>> +};
>>>>> +
>>>>> +&sound {
>>>>> +	simple-audio-card,aux-devs = <&codec_analog>;
>>>>> +	simple-audio-card,widgets = "Microphone", "Microphone Jack",
>>>>> +				    "Headphone", "Headphone Jack";
>>>>> +	simple-audio-card,routing =
>>>>> +			"Left DAC", "DACL",
>>>>> +			"Right DAC", "DACR",
>>>>> +			"Headphone Jack", "HP",
>>>>> +			"ADCL", "Left ADC",
>>>>> +			"ADCR", "Right ADC",
>>>>> +			"MIC2", "Microphone Jack";
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +/* On the (unpopulated) UART pads. */
>>>>> +&uart0 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&uart0_pb_pins>;
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&uart1 {
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>>>>> +	uart-has-rtscts;
>>>>> +	status = "okay";
>>>>> +
>>>>> +	bluetooth {
>>>>> +		compatible = "realtek,rtl8723bs-bt";
>>>>> +		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
>>>>> +		max-speed = <1500000>;
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> +&usb_otg {
>>>>> +	dr_mode = "host";
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&usbphy {
>>>>> +	usb0_vbus-supply = <&reg_drivevbus>;
>>>>> +	usb1_vbus-supply = <&reg_drivevbus>;
>>>>> +	status = "okay";
>>>>> +};
>>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>>
>>
> 
> 
> 
> 
