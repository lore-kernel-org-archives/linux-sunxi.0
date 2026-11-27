Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739082;
	b=0BErQanT36le62B5otZJgQ+hs8J0uXWDKiBK9LyzSNkTZXn0C+iF+3xURIFywDDuv182
	 UVuKhazmRpSnbJ0YNfOxvyELpyUh09QTv9lnijLGjjEYxZGXjM1DcYxYNgSpCJRb9TDOp
	 7FFPgEROJ32CboAsgf2QsyUgDqR5s9iRwhQdBH1q7YjB1h8dFzwU96HKvI6XjIx5v4zk1
	 WHwJYo9/7bQd/3bJIoTlIIJB+Ya2rdZsb0IY1Y+gMkZLNJnFPRSoIDK+QlbVdja8k54Em
	 mUTvdmGZtnQTWdZq41jZQ2LqHXocQ90t6exkLrlpkpCvWPtV8mvP5TLaWMRznI/tE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739082;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0wAxUz8sl9hwTJ/Sx2KSPkykokT5Eh5V13tKXyGJI+I=;
	b=wn+cnnevg14yUSpvzTFdVLC/U8O4EmnvLbhAOKPITygS53Wgl0qVd0amE65gabrRsoP9
	 IT/N0nc4k+JRSkYXrTIRsng/ZpRg3W3+HX5Kqz7VmQOft57H/Py4b6BOb32AbDmVeCLL8
	 jJ9oaq1ixG8lna9ACu+LR/w65ZPTgIspPs1j5vct4lEFgF69xUg7nsphDeIAUQRvTzRrv
	 j2OBxmmuvsX3rPQBt5oiwdkX5bk8Z7NoGvjz+1bG7pPCUSBDoTuT0RhP0k+9rcoAgpZr3
	 4of+oHKUg8/03gJKkBvbub0UKPVGiPUq3yYr7xFxWpZxZyD8udp+ceb7sNBYs8RDZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RSaKZ4sr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31324606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 00:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RSaKZ4sr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08F11A2D;
	Thu, 26 Nov 2026 16:24:36 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83973F86F;
	Thu, 26 Nov 2026 16:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795739079; bh=eVf+6ViWBqmA/OUF4vpUXMQzwpgsn2s4QdqGHxENYko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RSaKZ4srokAl7ilw24c1NYXzAyZVXkjOK/SQxpTAFpWk/M5rMleb4zPZ5Bo4DBdbf
	 VmLT9FqaZhpUOoXPVaaHn/RnaaFdG2xJh4p/MnhstAxi8Hddx1q+9wH5UarFvhbdqv
	 UJCjo8S5rDbKmhdxNVZ1Kwde37Q4qrrmcX2dFqeM=
Message-ID: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
Date: Fri, 27 Nov 2026 00:24:32 +0000
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
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
To: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for the respin, and for unifying all those boards in one series, 
that should make it easier to handle.
This looks good overall, just some smaller things below:

On 11/26/26 21:35, Enzo Adriano wrote:
> Enable the serial console, PMIC and microSD slot for initial Cubie A7S
> bring-up with vendor firmware, using the new common A733 description.
> Describe the oscillator inputs and power tree using the Radxa A7S
> v1.10 schematic, sheets 4, 7 and 8. Keep the boot-critical supplies
> enabled. Sheet 4 shows VCC5V0_SYS feeding DCIN and the PMIC PS output
> feeding the buck inputs and UP11. Set DCDC9 to 1.240 V, the boot
> firmware selector read back on the board for the ELDO input. Keep
> ELDO1 enabled at the firmware-selected voltage while the VDD2L range
> for the fitted memory is being confirmed.
> 
> Use the Radxa 5.15 BSP CPU and GPU OPP envelopes for DCDC3/5 and
> DCDC4. Use its regulator readback for DCDC2, BLDO1, DLDO1 and ELDO6,
> consistent with sheets 4 and 8 and the VCC-MCSI entry in the A733
> datasheet.
> 
> Allow 0.50-0.60 V on DCDC6, covering the 0.50 V LPDDR5 and 0.60 V
> LPDDR4X VDDQ options on sheet 5. Allow 1.05-1.10 V on DCDC7,
> covering LPDDR5 VDD2H at 1.05 V and the 1.10 V DRAM rail shown on
> sheets 4 and 5. The BSP readback was 0.56 V and 1.08 V, respectively.
> Both fall inside the bounds, so those selector values can be kept
> after DRAM training. Set the LVDS0 supply to 1.8 V per the A733
> Datasheet v1.00, table 5-2, and leave its enable under consumer control.
> Omit the unused UFS and codec regulator nodes (schematic sheets 4 and 6).
> 
> Use SWOUT2 for the card and the Port F VCC-IO path (sheets 4, 7 and 13).
> Firmware must select the 3.3 V PF path for use with MMC0. CLDO5
> supplies the separate 1.8 V input. The controller uses fixed signalling
> with no VQMMC regulator and advertises no UHS modes. Describe the
> active-high card-detect line on PF6 and its pull-down.
> 
> Add the PM2 power and PJ26 status LEDs, and the BL24C16F on I2C0 as
> shown on sheets 7 and 16. The EEPROM is at 0x50 in Radxa's 5.15 DT.
> PC7 drives an inverter that pulls the EEPROM's write-protect pin low.
> 
> Keep ALDO1 always on for Port L, which powers the PMIC's own bus.
> Omit the Port L supply phandle, as on the Cubie A5E: requesting
> it would require the PMIC regulator before the PMIC can be reached.
> The A733 pinctrl voltage-mode fix is required for the bank supply
> connections.
> 
> Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf
> Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Changes since v5:
> - Distinguish the 5 V DCIN supply from the PMIC PS output and rename
>    the fixed LDO input regulator. Rename and move the 32 kHz clock.
> - Order the regulator nodes, set DCDC9 to 1.240 V and omit blank
>    lines before status. Keep ELDO1 without voltage bounds.
> - Remove cap-sdio-irq since sunxi-mmc already sets MMC_CAP_SDIO_IRQ.
> - Norman's v5 hardware report is linked from the cover. The revised
>    supply graph and DCDC9 constraint still need a hardware run.
> 
>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>   .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 ++++++++++++++++++
>   2 files changed, 334 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index da39f02252d4..9d1e740ff19e 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..98a878a2d739
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Radxa Cubie A7S";
> +	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	osc32k: clock-osc32k {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		power-led {
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
> +			default-state = "on";
> +		};
> +
> +		status-led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 9 26 GPIO_ACTIVE_HIGH>; /* PJ26 */
> +			linux,default-trigger = "heartbeat";

I don't think we should have an LED wasted on a heartbeat when there is 
already a controllable power LED. I think a second LED should be left up 
to the user to configure. If they want, they can always set the 
heartbeat trigger via sysfs, although I'd probably do this on the power 
LED instead.
So I believe there should be no default-trigger line.

> +		};
> +	};
> +
> +	reg_ldo_input: regulator-ldo2v5-input {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ldo2v5-input";
> +		regulator-min-microvolt = <2400000>;
> +		regulator-max-microvolt = <2400000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_ps>;
> +	};
> +
> +	/* AXP318W PS output, routed back to the PMIC and to UP11. */
> +	reg_ps: regulator-ps-output {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ps-output";
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc5v0_sys>;
> +	};
> +
> +	reg_vcc5v0_sys: regulator-vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0-sys";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};

I understand that Chen-Yu somewhat suggested that, but it still looks 
odd to have these two regulators. I don't think we have that for any 
other board, even though most use a very similar connection.
Chen-Yu, is that what you thought of? Is that the model we should go 
forward with from now on?

> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu4 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu5 {
> +	cpu-supply = <&reg_dcdc5>;
> +};
> +
> +&cpu6 {
> +	cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&cpu7 {
> +	cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&hosc {
> +	clock-frequency = <26000000>;
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pg_pins>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "belling,bl24c16f", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		vcc-supply = <&reg_aldo1>;
> +		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 via Q2 */
> +	};
> +};
> +
> +&mmc0 {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Since the Allwinner GPIO notation with bank and pin number is hard to 
read, we always add the pin name (PF6) as a comment, see other .dts files.

> +	disable-wp;
> +	no-1-8-v;
> +	vmmc-supply = <&reg_swout2>;
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;	/* via VCC-IO */
> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	/* PF uses VCC-IO at 3.3 V, with CLDO5 as the 1.8 V input. */
> +	vcc-pf-supply = <&reg_swout2>;
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_i2c0_pl_pins>;
> +	status = "okay";
> +
> +	axp318w: pmic@36 {
> +		compatible = "x-powers,axp318w";
> +		reg = <0x36>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		aldo156in-supply = <&reg_ps>;
> +		aldo234in-supply = <&reg_aldo1>;
> +		bldoin-supply = <&reg_ldo_input>;
> +		cldoin-supply = <&reg_ldo_input>;
> +		dldoin-supply = <&reg_ps>;
> +		eldoin-supply = <&reg_dcdc9>;
> +		ips-supply = <&reg_ps>;
> +		vin19-supply = <&reg_ps>;
> +		vin23-supply = <&reg_ps>;
> +		vin45-supply = <&reg_ps>;
> +		vin678-supply = <&reg_ps>;
> +
> +		regulators {
> +			reg_aldo1: aldo1 {
> +				/* Port L powers the PMIC's own I2C bus. */
> +				regulator-name = "vcc-pl";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				regulator-name = "vcc-pe-pk-mcsi";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-name = "vcc-lvds0";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_cldo1: cldo1 {
> +				regulator-name = "vdd18-lpddr";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_cldo2: cldo2 {
> +				regulator-name = "vcc18-hdmi";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_cldo3: cldo3 {
> +				regulator-name = "vcc-pll-dram";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_cldo5: cldo5 {
> +				regulator-name = "vcc18-pc-comb0";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +
> +			reg_dcdc1: dcdc1 {
> +				/* Board 3.3 V loads and the SWOUT1/2 input. */
> +				regulator-name = "vcc-3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				/* System and DRAM core/PHY supply. */
> +				regulator-name = "vdd-sys";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				/* Powers the running Cortex-A76 CPUs. */
> +				regulator-name = "vdd-cpub";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc4: dcdc4 {
> +				regulator-name = "vdd-gpu";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <960000>;
> +			};
> +
> +			reg_dcdc5: dcdc5 {
> +				/* Powers the running Cortex-A55 CPUs. */
> +				regulator-name = "vdd-cpul";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc6: dcdc6 {
> +				/* DRAM PHY and LPDDR4X/LPDDR5 VDDQ (via RP15). */
> +				regulator-name = "vcc-draml";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <600000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc7: dcdc7 {
> +				/* DRAM PHY and LPDDR5 VDD2H (VCC-DRAM). */
> +				regulator-name = "vcc-dram";
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc9: dcdc9 {
> +				regulator-name = "eldo-input";
> +				regulator-min-microvolt = <1240000>;
> +				regulator-max-microvolt = <1240000>;
> +			};
> +
> +			reg_dldo1: dldo1 {
> +				/* SoC eFuse supply has no SID regulator consumer. */
> +				regulator-name = "vcc-efuse";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_eldo1: eldo1 {
> +				regulator-name = "vdd2l-lpddr";

So I saw the same issue on the A7A, also with LPDDR5: the schematic says 
0.9V, but at boot time it was 1.075V. The kernel corrected it to 0.9V, 
without apparent problems, but I didn't stress it at all, so can't say 
whether this is stable. Various LPDDR5 datasheets suggests VDD2L should 
be 0.9V, or at least in the range between 0.87V and 0.97V, though in 
some configurations it can also be tied to VDD2H at 1.05V.
So we are none the wiser, I guess, it would be good to figure out what 
the PMIC reset value is for ELDO1, so to know whether it's the 
vendors(?) DRAM init that deliberately programs EDLO1 to 1.075V, or if 
it's just left untouched.

> +				regulator-always-on;
> +			};
> +
> +			reg_eldo6: eldo6 {
> +				/* Standby CPU and USB supply. */
> +				regulator-name = "vdd-cpus";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_rtc_ldo: rtc-ldo {
> +				regulator-name = "vcc-rtc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_swout1: swout1 {
> +				regulator-name = "vcc33-lcd";
> +			};
> +
> +			reg_swout2: swout2 {
> +				/* VCC-IO to the console and microSD. */

I guess you mean "GPIO headers" instead of console?

Cheers,
Andre

> +				regulator-name = "vcc-io-card";
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&r_pio {
> +	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
> +	vcc-pm-supply = <&reg_aldo1>;
> +};
> +
> +&rtc {
> +	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
> +		 <&osc32k>;
> +	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};

