Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E48E2566
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 16:16:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E172EED1;
	Tue, 24 May 2022 09:16:47 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 927003F66F;
	Tue, 24 May 2022 09:16:46 -0700 (PDT)
Date: Tue, 24 May 2022 17:11:13 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Yifan Gu <me@yifangu.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de
Subject: Re: [PATCH 5/7] sunxi: F1C100s: update DT files from Linux
Message-ID: <20220524171113.08596965@donnerap.cambridge.arm.com>
In-Reply-To: <20220503212040.27884-6-andre.przywara@arm.com>
References: <20220503212040.27884-1-andre.przywara@arm.com>
	<20220503212040.27884-6-andre.przywara@arm.com>
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

On Tue,  3 May 2022 22:20:38 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> The initial U-Boot F1C100s port was based on the mainline kernel DT
> files, which were quite basic and were missing the essential MMC and
> SPI peripherals. While we could work around this in the SPL by
> hardcoding the required information, this left U-Boot proper without SD
> card or SPI flash support, so actual loading would require FEL boot.
> 
> Now the missing DT bits have been submitted and accepted in the kernel
> tree, so lets sync back those files into U-Boot to enable MMC and
> SPI, plus benefit from some fixes.
> 
> This is a verbatim copy of the .dts and .dtsi file from
> linux-sunxi/dt-for-5.19[1], which have been part of linux-next for a
> while as well.

Applied to sunxi/master.

Thanks,
Andre

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/log/?h=sunxi/dt-for-5.19
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20220317162349.739636-1-andre.przywara@arm.com/
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/dts/suniv-f1c100s-licheepi-nano.dts |  31 ++++++
>  arch/arm/dts/suniv-f1c100s.dtsi              | 104 +++++++++++++++++--
>  2 files changed, 125 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> index a1154e6c7cb..04e59b8381c 100644
> --- a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> +++ b/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> @@ -11,12 +11,43 @@
>  	compatible = "licheepi,licheepi-nano", "allwinner,suniv-f1c100s";
>  
>  	aliases {
> +		mmc0 = &mmc0;
>  		serial0 = &uart0;
> +		spi0 = &spi0;
>  	};
>  
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	status = "okay";
> +	vmmc-supply = <&reg_vcc3v3>;
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pc_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "winbond,w25q128", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +	};
>  };
>  
>  &uart0 {
> diff --git a/arch/arm/dts/suniv-f1c100s.dtsi b/arch/arm/dts/suniv-f1c100s.dtsi
> index 6100d3b75f6..0edc1724407 100644
> --- a/arch/arm/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/dts/suniv-f1c100s.dtsi
> @@ -4,6 +4,9 @@
>   * Copyright 2018 Mesih Kilinc <mesihkilinc@gmail.com>
>   */
>  
> +#include <dt-bindings/clock/suniv-ccu-f1c100s.h>
> +#include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> +
>  / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
> @@ -26,9 +29,13 @@
>  	};
>  
>  	cpus {
> -		cpu {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
>  			compatible = "arm,arm926ej-s";
>  			device_type = "cpu";
> +			reg = <0x0>;
>  		};
>  	};
>  
> @@ -62,6 +69,70 @@
>  			};
>  		};
>  
> +		spi0: spi@1c05000 {
> +			compatible = "allwinner,suniv-f1c100s-spi",
> +				     "allwinner,sun8i-h3-spi";
> +			reg = <0x01c05000 0x1000>;
> +			interrupts = <10>;
> +			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_BUS_SPI0>;
> +			clock-names = "ahb", "mod";
> +			resets = <&ccu RST_BUS_SPI0>;
> +			status = "disabled";
> +			num-cs = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		spi1: spi@1c06000 {
> +			compatible = "allwinner,suniv-f1c100s-spi",
> +				     "allwinner,sun8i-h3-spi";
> +			reg = <0x01c06000 0x1000>;
> +			interrupts = <11>;
> +			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_BUS_SPI1>;
> +			clock-names = "ahb", "mod";
> +			resets = <&ccu RST_BUS_SPI1>;
> +			status = "disabled";
> +			num-cs = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc0: mmc@1c0f000 {
> +			compatible = "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg = <0x01c0f000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC0>,
> +				 <&ccu CLK_MMC0>,
> +				 <&ccu CLK_MMC0_OUTPUT>,
> +				 <&ccu CLK_MMC0_SAMPLE>;
> +			clock-names = "ahb", "mmc", "output", "sample";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			interrupts = <23>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc1: mmc@1c10000 {
> +			compatible = "allwinner,suniv-f1c100s-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg = <0x01c10000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC1>,
> +				 <&ccu CLK_MMC1>,
> +				 <&ccu CLK_MMC1_OUTPUT>,
> +				 <&ccu CLK_MMC1_SAMPLE>;
> +			clock-names = "ahb", "mmc", "output", "sample";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			interrupts = <24>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		ccu: clock@1c20000 {
>  			compatible = "allwinner,suniv-f1c100s-ccu";
>  			reg = <0x01c20000 0x400>;
> @@ -82,13 +153,24 @@
>  			compatible = "allwinner,suniv-f1c100s-pinctrl";
>  			reg = <0x01c20800 0x400>;
>  			interrupts = <38>, <39>, <40>;
> -			clocks = <&ccu 37>, <&osc24M>, <&osc32k>;
> +			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
>  			clock-names = "apb", "hosc", "losc";
>  			gpio-controller;
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  			#gpio-cells = <3>;
>  
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +				function = "mmc0";
> +				drive-strength = <30>;
> +			};
> +
> +			spi0_pc_pins: spi0-pc-pins {
> +				pins = "PC0", "PC1", "PC2", "PC3";
> +				function = "spi0";
> +			};
> +
>  			uart0_pe_pins: uart0-pe-pins {
>  				pins = "PE0", "PE1";
>  				function = "uart0";
> @@ -98,14 +180,16 @@
>  		timer@1c20c00 {
>  			compatible = "allwinner,suniv-f1c100s-timer";
>  			reg = <0x01c20c00 0x90>;
> -			interrupts = <13>;
> +			interrupts = <13>, <14>, <15>;
>  			clocks = <&osc24M>;
>  		};
>  
>  		wdt: watchdog@1c20ca0 {
>  			compatible = "allwinner,suniv-f1c100s-wdt",
> -				     "allwinner,sun4i-a10-wdt";
> +				     "allwinner,sun6i-a31-wdt";
>  			reg = <0x01c20ca0 0x20>;
> +			interrupts = <16>;
> +			clocks = <&osc32k>;
>  		};
>  
>  		uart0: serial@1c25000 {
> @@ -114,8 +198,8 @@
>  			interrupts = <1>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
> -			clocks = <&ccu 38>;
> -			resets = <&ccu 24>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
>  			status = "disabled";
>  		};
>  
> @@ -125,8 +209,8 @@
>  			interrupts = <2>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
> -			clocks = <&ccu 39>;
> -			resets = <&ccu 25>;
> +			clocks = <&ccu CLK_BUS_UART1>;
> +			resets = <&ccu RST_BUS_UART1>;
>  			status = "disabled";
>  		};
>  
> @@ -136,8 +220,8 @@
>  			interrupts = <3>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
> -			clocks = <&ccu 40>;
> -			resets = <&ccu 26>;
> +			clocks = <&ccu CLK_BUS_UART2>;
> +			resets = <&ccu RST_BUS_UART2>;
>  			status = "disabled";
>  		};
>  	};

