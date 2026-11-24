Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531999;
	b=StEatYqa60vaXK+mn5TZc9OtgF+msjYxwckv7xk/CpIP0mO35W/isZAAM7NwcKjH9SEB
	 Pgu60uzjav0IocGPyzQPgLgx8L2dUl+xSjPB2Q3F0toeoHUellQnzkVCAG+q1VZ2j5JxK
	 W3xLsp/+lljmxkZccXsu0DRhMCP5vvdxxEOvwrRxbgSB9AhMUpfRv2hSj3HJZpmhwFeKI
	 MRI3W/jwMFOSMfbcUvAslVDGw9IyHbdYbkw0Q2VvLkJpaJCbo5EG2KiRsPK6/WxSj+hNY
	 IXdkPDiT+d0YqXcg4qrR3sJ9IzXtOdryykJnQgHFZTsx7QqgG1T2d0f+oXsZUA3SScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6d1LVpa1kGdd+SQruobRkejzL7SfSLQQuTbpKW/Ww6Q=;
	b=H3MhdkPZfRsHdi1vszxtL0BdblPhyyFmA+lt44OaGIijY4RQaAlg8yys1vIg/0+jNIur
	 QwIAh/y8vqPqgpECFwuNUCi0hnUrsHa64KCty/OveYMavZCt+oc4KDocWGiKF3i1rfw46
	 STPhA9cCJDJQ7R/Y8TzWz3SCAD6sYB5K0w1+Im5CgcqaubrvAcJmPkezP5XBMtDmHa3ku
	 M+rLYkm8qU6h2mt1D2xqlQ2Mi6oNuqBc5SvQa+qdLD06UG1jHmy5qJBx4JXUUNMEKYLU6
	 T7W67Ro0i7l8Z2DhKuq8eBz8vuI4/DmYQjNyA/UU5hibysZ61BZ2Qt9DZQYOMmr3gjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pukyDBv5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BAA606A32A
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 14:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6BAA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pukyDBv5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9282339;
	Tue, 24 Nov 2026 06:53:14 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC4C83F86C;
	Tue, 24 Nov 2026 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795531997; bh=rSt/0OW9GhXGohgvpYyjNUm11i058+noHgna8JL30DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pukyDBv5IpB/EVkl0Qz5+7aVQYx7GkvtlTG1YVhPLwAaPNmpOhBcSmJiRhbnj2onD
	 fGSacQ945R+QPRE39c7IYmuQE+W8q8L1IX8nyGCQpxvA7fwOqIoQtciuofurp+iNa8
	 0xFa3IN4EmO7Wa3B/xxEgzGwYxjf3Kt9bvmMHmiQ=
Message-ID: <634c979b-65fc-4510-91e6-20bcb066542a@arm.com>
Date: Tue, 24 Nov 2026 15:53:13 +0100
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
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
 <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
> Provide the SoC description needed by the initial Cubie A7S DTS for its
> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
> Include the main and R-domain UART/I2C instances and MMC0-2 with their
> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
> driver and its Cubie A7S device tree.
> 
> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's public A733
> reference and the A523 precedent. The CPUX interconnect diagram in
> section 5.1.2 supports noncoherency as an integration inference. The
> ITS stays disabled pending its clock/reset and MSI integration.
> 
> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
> (figure 5-1). The big and little DVFS groups can be described by their
> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
> 
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> 
> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
> one-cluster CPU map and the two PMU partitions.
> 
> Untested on v5: physical CPU/cache topology, PMU counting, EL2
> interrupt delivery and ITS/MSI.
> 
>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>   1 file changed, 663 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..8a258f16751e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,663 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu = <&cpu5>;
> +				};
> +
> +				core6 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core7 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@400 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@500 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@600 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@700 {
> +			compatible = "arm,cortex-a76";
> +			device_type = "cpu";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	hosc: clock-hosc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a55>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_a76>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		pio: pinctrl@2000000 {
> +			compatible = "allwinner,sun60i-a733-pinctrl";
> +			reg = <0x02000000 0x800>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_APB1>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			i2c0_pg_pins: i2c0-pg-pins {

Since those pins are not universally used, can you please add an
/omit-if-no-ref/ tag above this line?


The rest looks good to me, the comments from my previous review have 
been addressed, and the rest is unchanged, so with that "omit" line 
added above:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +				pins = "PG8", "PG9";
> +				function = "i2c0";
> +				allwinner,pinmux = <6>;
> +			};
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc1_pins: mmc1-pins {
> +				pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
> +				function = "mmc1";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc2_pins: mmc2-pins {
> +				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
> +				       "PC13", "PC14", "PC15", "PC16";
> +				function = "mmc2";
> +				allwinner,pinmux = <3>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			uart0_pb_pins: uart0-pb-pins {
> +				pins = "PB9", "PB10";
> +				function = "uart0";
> +				allwinner,pinmux = <2>;
> +			};
> +		};
> +
> +		ccu: clock-controller@2002000 {
> +			compatible = "allwinner,sun60i-a733-ccu";
> +			reg = <0x02002000 0x2000>;
> +			clocks = <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&rtc CLK_OSC32K_FANOUT>;
> +			clock-names = "hosc", "losc", "iosc", "losc-fanout";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		uart0: serial@2500000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02500000 0x400>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@2501000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02501000 0x400>;
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART1>;
> +			resets = <&ccu RST_BUS_UART1>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@2502000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02502000 0x400>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART2>;
> +			resets = <&ccu RST_BUS_UART2>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@2503000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02503000 0x400>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART3>;
> +			resets = <&ccu RST_BUS_UART3>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@2504000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02504000 0x400>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART4>;
> +			resets = <&ccu RST_BUS_UART4>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@2505000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02505000 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART5>;
> +			resets = <&ccu RST_BUS_UART5>;
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@2506000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x02506000 0x400>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART6>;
> +			resets = <&ccu RST_BUS_UART6>;
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c@2510000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02510000 0x400>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C0>;
> +			resets = <&ccu RST_BUS_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@2511000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02511000 0x400>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C1>;
> +			resets = <&ccu RST_BUS_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@2512000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02512000 0x400>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C2>;
> +			resets = <&ccu RST_BUS_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@2513000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02513000 0x400>;
> +			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C3>;
> +			resets = <&ccu RST_BUS_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@2514000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02514000 0x400>;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C4>;
> +			resets = <&ccu RST_BUS_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@2515000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02515000 0x400>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C5>;
> +			resets = <&ccu RST_BUS_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@2516000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02516000 0x400>;
> +			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C6>;
> +			resets = <&ccu RST_BUS_I2C6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@2517000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02517000 0x400>;
> +			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C7>;
> +			resets = <&ccu RST_BUS_I2C7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@2518000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02518000 0x400>;
> +			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C8>;
> +			resets = <&ccu RST_BUS_I2C8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c9: i2c@2519000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x02519000 0x400>;
> +			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C9>;
> +			resets = <&ccu RST_BUS_I2C9>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c10: i2c@251a000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251a000 0x400>;
> +			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C10>;
> +			resets = <&ccu RST_BUS_I2C10>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c11: i2c@251b000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251b000 0x400>;
> +			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C11>;
> +			resets = <&ccu RST_BUS_I2C11>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c12: i2c@251c000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x0251c000 0x400>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_I2C12>;
> +			resets = <&ccu RST_BUS_I2C12>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@3400000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x03400000 0x10000>, <0x03460000 0x100000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +			dma-noncoherent;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			its: msi-controller@3440000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x03440000 0x20000>;
> +				msi-controller;
> +				#msi-cells = <1>;
> +				dma-noncoherent;
> +				status = "disabled";
> +			};
> +
> +			ppi-partitions {
> +				ppi_a55: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +
> +				ppi_a76: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04021000 0x1000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc1_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible = "allwinner,sun60i-a733-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04022000 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC2>;
> +			reset-names = "ahb";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc2_pins>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_ccu: clock-controller@7010000 {
> +			compatible = "allwinner,sun60i-a733-r-ccu";
> +			reg = <0x07010000 0x250>;
> +			clocks = <&hosc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
> +				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
> +				 <&ccu CLK_PLL_PERIPH0_300M>,
> +				 <&ccu CLK_PLL_PERIPH1_300M>;
> +			clock-names = "hosc", "losc", "iosc", "sys-24m",
> +				      "pll-periph0-200m", "pll-periph0-300m",
> +				      "pll-periph1-300m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible = "allwinner,sun60i-a733-nmi",
> +				     "allwinner,sun55i-a523-nmi";
> +			reg = <0x07010320 0xc>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		r_pio: pinctrl@7025000 {
> +			compatible = "allwinner,sun60i-a733-r-pinctrl";
> +			reg = <0x07025000 0x800>;
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_R_APB0>, <&hosc>, <&rtc CLK_OSC32K>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			r_i2c0_pl_pins: r-i2c0-pl-pins {
> +				pins = "PL0", "PL1";
> +				function = "r_i2c0";
> +				allwinner,pinmux = <2>;
> +			};
> +		};
> +
> +		r_uart0: serial@7080000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x07080000 0x400>;
> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&r_ccu CLK_BUS_R_UART0>;
> +			resets = <&r_ccu RST_BUS_R_UART0>;
> +			status = "disabled";
> +		};
> +
> +		r_uart1: serial@7081000 {
> +			compatible = "allwinner,sun60i-a733-uart",
> +				     "snps,dw-apb-uart";
> +			reg = <0x07081000 0x400>;
> +			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&r_ccu CLK_BUS_R_UART1>;
> +			resets = <&r_ccu RST_BUS_R_UART1>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c0: i2c@7083000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07083000 0x400>;
> +			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C0>;
> +			resets = <&r_ccu RST_BUS_R_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c1: i2c@7084000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07084000 0x400>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C1>;
> +			resets = <&r_ccu RST_BUS_R_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		r_i2c2: i2c@7085000 {
> +			compatible = "allwinner,sun60i-a733-i2c",
> +				     "allwinner,sun8i-v536-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x07085000 0x400>;
> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_I2C2>;
> +			resets = <&r_ccu RST_BUS_R_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		rtc: rtc@7090000 {
> +			compatible = "allwinner,sun60i-a733-rtc",
> +				     "allwinner,sun50i-r329-rtc";
> +			reg = <0x07090000 0x400>;
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>;
> +			clock-names = "bus", "hosc", "ahb";
> +			#clock-cells = <1>;
> +		};
> +	};
> +};

