Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304397;
	b=wNWZ5z/XJguMPJt2TDzcfFnQzX7M5k83TbQCgEEf8iYfeDv69BskPdlzgiUvWC+tbF/u
	 fpJib6oWmESNA1JTNaztP37M5JsYH4CiuBkJ1/pXNKugI4qgnAvV0iK0jpd/84zHP3z62
	 iGsaHn22lUzjmsid+kq5xvdyBwyFIzOzfAAVDVWa925GJcjiXL2kaIMzuEOB0P0kUEr6J
	 BY4ZJiFnd5Get1c+uQV/NVco6+tgLLqVH/T6FjKPOBzbGpd9w+Ykin1cpoxjVeZK64pSx
	 oRZYuF0zE7EuFYN+CYTihFVT+6qsKyj3QS3Gt+6wMT3NaZzlcbw46OqfXwVFScKVmcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304397;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6G+qoyuS+XfWQYbP6gY4xhAOdcI4aLBFdUBf8L1UOt8=;
	b=aauVTEcjAqgD4KlcmoIvp/w8u0npqGSX+ASkEj+inJTvssdHsU/LXebS2kHeMlmrv+tf
	 K+mMOT5CoTiRVvMNqVxlakyV3pvyhS0Zee75F85lrP62Q7uw0pkF7nee7PkfIqMElo6dB
	 9Fcea4Apv97zcRvdXj6n5XeW9+NlTZ/gaU505bZm3Mh/gU0iyXdUJRB7oEmLO2HEXfYPi
	 StxpaYPSbJttYpdVWJKGR469Sz+cgFy9HznCQSjQ+F6D/DyGApLVgfCFM6ybKtUOBfslh
	 y5L5zTNbnJbRwoJIUJYkl14qebLN2VtrpymJCvOvj100UQRGldaIWAYuFS1mrixxy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FzyB8Xwe;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B03606A32A
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 23:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B03606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FzyB8Xwe
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDDE71575;
	Sat, 21 Nov 2026 15:39:45 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123EE3F632;
	Sat, 21 Nov 2026 15:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795304388; bh=uIGjGTNYItK1fO2IWuO0oXrmBCGSoTMgNCNIlJE47d0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FzyB8Xwe09oftNAYS2TqWMzCF6d8+cKG5wNCbM2p+cvgq62XAySRC43E5kSp0T2/z
	 cuUYkLRLSY42Wof1QN7x72KFLitCD2aDUSUt5xarAS9ktgI2YEOp/tb7oWXk1Zgx0b
	 jbw+eieLEUGiR173VOekc1YOWrP8kQZjMcDrSnww=
Date: Sun, 22 Nov 2026 00:39:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime
 Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome
 Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius
 Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <20261122003932.568c099c@ryzen.lan>
In-Reply-To: <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 13:09:26 -0500
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

Hi Enzo,

> Enable the Cubie A7S serial console, PMIC and microSD slot to provide
> an initial usable board configuration. Supply the 26 MHz crystal and
> 32768 Hz RTC input, enable UART0 and the AXP318W on R-I2C0, and describe
> the PMIC input/output and CPU supply connections from the Radxa Cubie
> A7S schematic v1.10. Preserve firmware settings on rails whose working
> voltage is not established. BLDO2 has no programmed voltage constraint:
> its software 3.3 V selector does not establish its physical output with
> the schematic's nominal 2.4 V input.
> 
> Describe the card's SWOUT2 supply and PF6 active-high detect with an
> internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
> only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
> 1.8 V input and must not be raised for SD signaling. Firmware must
> select the 3.3 V PF path; dynamic voltage switching is not provided.
> Keep other storage off.
> 
> Connect the documented bank supplies. PL's self-supply phandle is
> omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
> upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
> voltage-mode fix is required for these bank-supply connections.
> 
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> 
> The November 18 v4 RAM boot on Cubie A7S with vendor firmware exercised
> UART0, PMIC probe and MMC0 read-only transfers. PMIC/NMI interrupt
> delivery, card writes, physical hotplug, 1.8 V signaling and physical
> BLDO2 voltage were not tested.
> 
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++++++++++++
>  2 files changed, 288 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index da39f02252d4..9d1e740ff19e 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..9af9a68950d8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Radxa Cubie A7S";
> +	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		mmc0 = &mmc0;

We don't do mmc aliases. Long discussion, I understand it seems useful,
but relying on Linux device numbering is not a good idea. So please
drop this line. U-Boot will give it back to you if you use the U-Boot
devicetree ($fdtcontroladdr).


> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	osc32k: osc32k-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +

> +	reg_ldo_input: regulator-ldo-input {

I think the node name alone is slightly misleading: it's indeed
supplying some LDO input rails on the PMIC, but the chip itself is a
DC/DC step down converter. Please add a comment here like this:
	/* discrete ETA3521 DC/DC step-down regulator */
And maybe use "regulator-2v4" as the node name (to match the binding
requirement), the regulator name can then carry the usage meaning.

> +		compatible = "regulator-fixed";
> +		regulator-name = "ldo-input";
> +		/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
> +		regulator-min-microvolt = <2400000>;
> +		regulator-max-microvolt = <2400000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_ps>;
> +	};
> +
> +	reg_ps: regulator-system-power {

Please add a comment here, saying: 
	/* board wide 5V supply from the USB-C connector */
And then change the node name to "regulator-5v".
Also please move this whole node first, as this is the root of the
whole power tree.


> +		compatible = "regulator-fixed";
> +		regulator-name = "ps";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};

There are two LEDs on the last page of the schematic, controlled by
PJ26 and PM2. Please add them here. Check other (Allwinner) DTs for how
to do that.

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

The schematic shows an EEPROM on I2C0. There is a binding for that chip
already, check rk3576-rock-4d.dts.
Please add that chip.

> +&mmc0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;

I think we want the other two standard capabilities as well:
	cap-mmc-highspeed;
	cap-sdio-irq;

> +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> +	disable-wp;
> +	max-frequency = <50000000>;

Where does this limit come from? As it stands right now, at 3.3V you
won't get faster anyway, so it's moot. Please remove if you agree.

> +	no-1-8-v;
> +	vmmc-supply = <&reg_swout2>;
> +	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
> +	vqmmc-supply = <&reg_swout2>;

Just leave that out (for now), the default is to revert to vmmc-supply,
if vqmmc is not given anyway.

> +
> +	status = "okay";
> +};
> +
> +&osc {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;

Please add a comment that this comes via VCC-IO, see the A527/T527
boards.

> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	vcc-pf-supply = <&reg_cldo5>;

Same here, comment about this being VCC-IO, at least for now.

> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_i2c0_pl_pins>;
> +
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
> +			reg_dcdc1: dcdc1 {
> +				regulator-name = "vcc-3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;

Please add a comment or use a speaking regulator name to justify that
this regulator must be always on. "regulator-always-on" should be the
exception, not the rule. This applies to all the nodes below, I will
comment with some hints below again.

> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-name = "vdd-sys";
> +				regulator-always-on;

We should have a voltage or a range for every regulator. Here it should
be 0.8V.

> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-name = "vdd-cpub";

Do we have some OPPs for the cores? The range should reflect the
min/max used voltages in there. 

> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc4: dcdc4 {
> +				regulator-name = "vdd-gpu";
> +				regulator-always-on;

Why is this always on? If I see this correctly, that's just supplying
the GPU, which will have its own supply property.
Voltages should be in the same range as for the CPUs.

> +			};
> +
> +			reg_dcdc5: dcdc5 {
> +				regulator-name = "vdd-cpul";
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc6: dcdc6 {
> +				regulator-name = "vcc-draml";
> +				regulator-always-on;

0.6/0.5V I guess.

> +			};
> +
> +			reg_dcdc7: dcdc7 {
> +				regulator-name = "vcc-dram";
> +				regulator-always-on;

Probably 1.1V.

> +			};
> +
> +			reg_dcdc8: dcdc8 {
> +				regulator-name = "vcc-ufs-io";
> +				regulator-always-on;
> +			};

But there is no UFS on this board, right? All the UFS signals seem to
be not-connected, so this power supply will be going nowhere. And DCDC8
seems to be used exclusively for UFS, so I would just leave this whole
node out. 

> +
> +			reg_dcdc9: dcdc9 {
> +				regulator-name = "eldo-input";
> +				regulator-always-on;

Again, why the always-on? This is referenced by eldoin-supply, so the
kernel should keep this on.
As for the voltage, the schematic doesn't seem to give a clue, so maybe
you can look this up on a running BSP kernel.

> +			};
> +
> +			reg_swout1: swout1 {
> +				regulator-name = "vcc33-lcd";
> +				regulator-always-on;
> +			};

Why always-on? Should be referenced by the pinctrl device.

> +
> +			reg_swout2: swout2 {
> +				regulator-name = "vcc-io-card";
> +				regulator-always-on;
> +			};
> +
> +			reg_aldo1: aldo1 {
> +				regulator-name = "vcc-pl";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				regulator-name = "vcc-pe-pk-mcsi";

Does this intentionally miss the voltage setting?
The datasheets suggests that VCC-MCSI must be 1.8V. 

> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-name = "vcc-lvds0";
> +				regulator-always-on;

Should not be needed.
And again, the voltage is missing. Per the datasheet, VCC_LVDS0 must be
1.8V, and the VCC18-LCD label connected to BLDO2 supports this.

> +			};
> +
> +			reg_bldo4: bldo4 {
> +				regulator-name = "vcc18-codec";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};

Do we need this at all? I don't see this (VCC18-CODEC) connected
anywhere?

> +
> +			reg_cldo1: cldo1 {
> +				regulator-name = "vcc33-18-usb";

That's not the right name. The connection between VCC33-18-USB and CLDO1
is "NC" in the schematic, so this is a red herring.
However this also connects to VDD18-LPDDR, which would justify the
always-on.

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

This is a correct example, btw: it's always on, but the regulator name
makes it almost obvious why.

> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_cldo5: cldo5 {
> +				regulator-name = "vcc18-pf-pc";

VCC18-PF is confusing, please remove that from the name.

> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;

Should not be needed.
Voltage is missing, should be 1.8V, I think.
Please try to double check on a system running with the BSP kernel.

> +			};
> +
> +			reg_dldo1: dldo1 {
> +				regulator-name = "vcc-efuse";
> +				regulator-always-on;

Voltage is missing, should be 1.8V, I think.
Please try to double check on a system running with the BSP kernel.

> +			};
> +
> +			reg_dldo6: dldo6 {
> +				regulator-name = "vcc-ufs";
> +				regulator-always-on;

Apparently UFS is not supported on that board, so please remove that
node.

> +			};
> +
> +			reg_eldo1: eldo1 {
> +				regulator-name = "vcc09-vdd2l";
> +				regulator-always-on;

Voltage should be 0.9V.

> +			};
> +
> +			reg_eldo6: eldo6 {
> +				regulator-name = "vdd-cpus";
> +				regulator-always-on;

Schematics suggest 0.8V.

Cheers,
Andre

> +			};
> +
> +			reg_rtc_ldo: rtc-ldo {
> +				regulator-name = "vcc-rtc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
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
> +	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
> +		 <&osc32k>;
> +	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +
> +	status = "okay";
> +};
> 

