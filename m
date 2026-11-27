Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778611;
	b=1rxxu5gwTf6+O9HODGN+EYIhOrIeezgNDhB3ypXN2qTW9RuInBAwjK4vD0c+KsBJRIpE
	 r1UiZZh75JDbbxnM26G18LaMPh7BoCW4YybF+BLWiI7Njb4Kv3RhKaGW+5JlH9DFNQM+H
	 p/XOLUgmHxt8H6FIleYiAXn2Qd0WdrBsmanRfHWVoiH0AaCGtwLeAwTiaGWvPMykWuidA
	 hb+xGF70IFOlBFfAZ/ZeTepocJWfGY269USWSrT0/6nWn2cEyad1+q/ai6vsjieHzpBlk
	 /vO6rHJxH4yrrX4wCNii7z1/xB7lxx66lsnoS+XKvLN5SmaVQq4q5Yj0HQfHCnNOSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778611;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dXtl698ElVtXeTm1MZUa05jGuq6bW/aCOPcUEKmWU44=;
	b=CbLb0MFVreGra6l7Onu1JfPbn+5xonFtgXbf6X9+uYZPaNeGop63Nr8JvlwWb3CJwrFY
	 gvx95l0PyQR5fq7ouAXmj6FCbK44O/GOLGydxtX2+jlAIdRsefGc+G7JxOBU5qdYIH0m8
	 VoJGVX/+fOfIqjGhzz//k4wJvPoFIARA+AkgqlZeBMXQoXro0KPAU1DCaAEgb6d4cGZIY
	 EJTI0E+1zmeNL0lHC2WNxXzg124Hwt46lQouH4iXAJ2T4bX7vSf5Io4YmYIkdblX1Jjdo
	 eo1Ididv4SjSbDPuoDb1rNY8LxIOMlwj5pDKcSqnTQDvPrPAu5gn15a4vvwzV7+sNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NKXcEjjM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3FE606A333
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3FE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NKXcEjjM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016DE152B;
	Fri, 27 Nov 2026 03:23:27 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7743F632;
	Fri, 27 Nov 2026 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778609; bh=lSZsz6e9oawHaA0jXtD9q7dV7UGx1oy+xEJrObjTjn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NKXcEjjMUmkT3I5f613F0NVTVjnpeswgo1TeNA9WpBe26VTfz1A8VfTRS+z58+wms
	 MqJhrBpPQrtgBIARX1mPo8NvkCx6J2ZRTr8jV4JaGfyD/ZG/PeqyzYwmCMqbMqNzSK
	 C39n76b+Z6bZlIZrXQyYgaQpK2wED8+qk92ZM348=
Message-ID: <80ee7cbb-953d-4258-ac8d-ce7426607a24@arm.com>
Date: Fri, 27 Nov 2026 11:23:23 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
To: Jerome Brunet <jbrunet@baylibre.com>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <1jpkvqldyq.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1jpkvqldyq.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/27/26 12:18, Jerome Brunet wrote:
> On jeu. 26 nov. 2026 at 15:35, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:
> 
>> The Allwinner A733 combines six Cortex-A55 and two Cortex-A76 cores.
>> Add the common device tree for the first Cubie A7A, A7S and A7Z board
>> DTS files. Describe the CPUs, PSCI, architectural timers, GIC, RTC,
>> main and always-on clock/reset and pin controllers, UART, I2C and
>> MMC. The preceding revision booted on the A7S and A7Z.
>>
>> The A7S schematic, sheets 7 and 16, shows the EEPROM wired to I2C0
>> on PG8/PG9. Use mux 6 as documented in the A733 Datasheet v1.00,
>> section 4.2.6, table 4-36. The A7A schematic shows the external RTC
>> on S_TWI1. Add its R-I2C1 pin group on PL12/PL13, mux 3.
>>
>> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
>> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
>> and noncoherent attributes follow Andre Przywara's A733 reference
>> and the A523 precedent. The CPUX interconnect diagram in section
>> 5.1.2 supports the noncoherency inference. Leave the ITS disabled
>> pending clock/reset and MSI integration.
>>
>> Describe the single DynamIQ unit and shared L3 shown in section
>> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
>> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
>> core type. Defer capacity-dmips-mhz until it is measured on A733.
>>
>> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
>> Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm.com
>> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11
>> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
>> Co-developed-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>> ---
>> Changes since v5:
>> - Mark the I2C0 PG8/PG9 group /omit-if-no-ref/, as requested. This
>>    satisfies Andre's review condition.
>> - Move the RTC clock include after the A733 clock headers and cite
>>    the A733 datasheet and A7S schematic for the I2C0 pins.
>> - Fold in Andre's R-I2C1 pin group for A7A. A7S and A7Z leave
>>    it unused. A7S still references the I2C0 group.
>> - Vinicius tested the v5 DTSI with his A7Z v1.11 board DT. Norman
>>    tested the v5 series on A7S. Their tags here cover the SoC DTSI.
>>
>>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
>>   1 file changed, 671 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> new file mode 100644
>> index 000000000000..e062b08006da
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> @@ -0,0 +1,671 @@

[ ... ]

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible = "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>> +			reg = <0x04020000 0x1000>;
>> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
>> +			clock-names = "ahb", "mmc";
>> +			resets = <&ccu RST_BUS_MMC0>;
>> +			reset-names = "ahb";
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&mmc0_pins>;
> 
> Even if pins are usually the same board to board, do you really want to
> set this in the SoC dtsi ?

There are not "usually" the same, there are *always* the same, since 
there is only one set of pins connected to each MMC controller. And in 
this case we put them in the .dtsi, as done already in other SoCs before.

Cheers,
Andre

> 
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		mmc1: mmc@4021000 {
>> +			compatible = "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>> +			reg = <0x04021000 0x1000>;
>> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
>> +			clock-names = "ahb", "mmc";
>> +			resets = <&ccu RST_BUS_MMC1>;
>> +			reset-names = "ahb";
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&mmc1_pins>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		mmc2: mmc@4022000 {
>> +			compatible = "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>> +			reg = <0x04022000 0x1000>;
>> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
>> +			clock-names = "ahb", "mmc";
>> +			resets = <&ccu RST_BUS_MMC2>;
>> +			reset-names = "ahb";
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&mmc2_pins>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		r_ccu: clock-controller@7010000 {
>> +			compatible = "allwinner,sun60i-a733-r-ccu";
>> +			reg = <0x07010000 0x250>;
>> +			clocks = <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
>> +				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
>> +				 <&ccu CLK_PLL_PERIPH0_300M>,
>> +				 <&ccu CLK_PLL_PERIPH1_300M>;
>> +			clock-names = "hosc", "losc", "iosc", "sys-24m",
>> +				      "pll-periph0-200m", "pll-periph0-300m",
>> +				      "pll-periph1-300m";
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		nmi_intc: interrupt-controller@7010320 {
>> +			compatible = "allwinner,sun60i-a733-nmi",
>> +				     "allwinner,sun55i-a523-nmi";
>> +			reg = <0x07010320 0xc>;
>> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		r_pio: pinctrl@7025000 {
>> +			compatible = "allwinner,sun60i-a733-r-pinctrl";
>> +			reg = <0x07025000 0x800>;
>> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>,
>> +				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&r_ccu CLK_R_APB0>, <&hosc>, <&rtc CLK_OSC32K>;
>> +			clock-names = "apb", "hosc", "losc";
>> +			gpio-controller;
>> +			#gpio-cells = <3>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +
>> +			r_i2c0_pl_pins: r-i2c0-pl-pins {
>> +				pins = "PL0", "PL1";
>> +				function = "r_i2c0";
>> +				allwinner,pinmux = <2>;
>> +			};
>> +
>> +			/omit-if-no-ref/
>> +			r_i2c1_pl_pins: r-i2c1-pl-pins {
>> +				pins = "PL12", "PL13";
>> +				function = "r_i2c1";
>> +				allwinner,pinmux = <3>;
>> +			};
>> +		};
>> +
>> +		r_uart0: serial@7080000 {
>> +			compatible = "allwinner,sun60i-a733-uart",
>> +				     "snps,dw-apb-uart";
>> +			reg = <0x07080000 0x400>;
>> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			reg-shift = <2>;
>> +			reg-io-width = <4>;
>> +			clocks = <&r_ccu CLK_BUS_R_UART0>;
>> +			resets = <&r_ccu RST_BUS_R_UART0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		r_uart1: serial@7081000 {
>> +			compatible = "allwinner,sun60i-a733-uart",
>> +				     "snps,dw-apb-uart";
>> +			reg = <0x07081000 0x400>;
>> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			reg-shift = <2>;
>> +			reg-io-width = <4>;
>> +			clocks = <&r_ccu CLK_BUS_R_UART1>;
>> +			resets = <&r_ccu RST_BUS_R_UART1>;
>> +			status = "disabled";
>> +		};
>> +
>> +		r_i2c0: i2c@7083000 {
>> +			compatible = "allwinner,sun60i-a733-i2c",
>> +				     "allwinner,sun8i-v536-i2c",
>> +				     "allwinner,sun6i-a31-i2c";
>> +			reg = <0x07083000 0x400>;
>> +			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&r_ccu CLK_BUS_R_I2C0>;
>> +			resets = <&r_ccu RST_BUS_R_I2C0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		r_i2c1: i2c@7084000 {
>> +			compatible = "allwinner,sun60i-a733-i2c",
>> +				     "allwinner,sun8i-v536-i2c",
>> +				     "allwinner,sun6i-a31-i2c";
>> +			reg = <0x07084000 0x400>;
>> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&r_ccu CLK_BUS_R_I2C1>;
>> +			resets = <&r_ccu RST_BUS_R_I2C1>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		r_i2c2: i2c@7085000 {
>> +			compatible = "allwinner,sun60i-a733-i2c",
>> +				     "allwinner,sun8i-v536-i2c",
>> +				     "allwinner,sun6i-a31-i2c";
>> +			reg = <0x07085000 0x400>;
>> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&r_ccu CLK_BUS_R_I2C2>;
>> +			resets = <&r_ccu RST_BUS_R_I2C2>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		rtc: rtc@7090000 {
>> +			compatible = "allwinner,sun60i-a733-rtc",
>> +				     "allwinner,sun50i-r329-rtc";
>> +			reg = <0x07090000 0x400>;
>> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>;
>> +			clock-names = "bus", "hosc", "ahb";
>> +			#clock-cells = <1>;
>> +		};
>> +	};
>> +};
>>
> 

