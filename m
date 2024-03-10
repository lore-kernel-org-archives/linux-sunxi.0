Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2DE3B28F
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Mar 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710108023; cv=none; b=l9ba57HBzQoEFFZFV2Nk8foNLxMw7yopRpPQ/HXK99Mqx5Ul9VK4VeqwPK6J+au7MQS04OmiZ5feAOPUdNYW411mjlAnvkb5OMoIeMC2iP+b2Z9iE17c1pRw8CwsyLyKDo136nkat4SxrAZatmarabTt89oxfJEtgd03r4uxjwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710108023; c=relaxed/simple;
	bh=amBiTF03XVCwub77QmB+Y+L7rJp/g7PZ7HZw4tUm5oc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCr091vNH6HFQQq3UdB0AQz1KpTDPi/aXGm7+AWmkPy+FWtDQqUO3NOd/AdJoBvTl85lEU1yuZeFnyK/TkU5oJ+G6wYecSpOIMvCnZBvzJPh9OXp26bszIdW8KUkmRoFl3NC7EKuLdt9t9wh7buOFPKGRs4LOWVC4Go8rfB22dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B89C9DA7;
	Sun, 10 Mar 2024 15:00:54 -0700 (PDT)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B35B63F73F;
	Sun, 10 Mar 2024 15:00:17 -0700 (PDT)
Date: Sun, 10 Mar 2024 22:00:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Kamil Kasperski <ressetkk@gmail.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] sunxi: h616: add initial support for T95 AXP313 TV Box
Message-ID: <20240310220004.0965e2ca@minigeek.lan>
In-Reply-To: <20240309192425.40282-1-ressetkk@gmail.com>
References: <20240309192425.40282-1-ressetkk@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  9 Mar 2024 19:24:26 +0000
Kamil Kasperski <ressetkk@gmail.com> wrote:

Hi Kamil,

many thanks for sending a patch, that looks mostly good from the
technical point of view, only some smaller comments.

But please note that the devicetree needs to go through the Linux
mailing lists and repo first, and we automatically copy it from the
Linux tree once it has been merged there. This is to ensure proper
review and checks with the Linux tooling.

So can you please send just the .dts file to the DT and sunxi
maintainers the respective lists, as reported by get_maintainer.pl?
Then we can take it from there.

> T95 is a most commonly known for being a box with a pre-installed malware.
> It uses Allwinner H616 and comes with eMMC and DDR3 memory.
> This device comes with two versions - one with AXP305 PMIC and another with AXP313 PMIC.
> The AXP313 version comes with Secure Boot enabled and locked bootloader, so the u-boot has to be built with TOC0.
> DRAM settings are taken from Allwinner's boot0 for this box.

Ah, thanks for figuring those out, that's very helpful.

> 
> Cc: Andre Przywara <andre.przywara@arm.com>
> 
> Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
> ---
>  arch/arm/dts/Makefile                   |   3 +-
>  arch/arm/dts/sun50i-h616-t95-axp313.dts | 148 ++++++++++++++++++++++++
>  configs/t95_axp313_defconfig            |  27 +++++
>  3 files changed, 177 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/sun50i-h616-t95-axp313.dts
>  create mode 100644 configs/t95_axp313_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index b102ffb5f6..144daf6c48 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -842,7 +842,8 @@ dtb-$(CONFIG_MACH_SUN50I_H616) += \
>  	sun50i-h618-orangepi-zero2w.dtb \
>  	sun50i-h618-orangepi-zero3.dtb \
>  	sun50i-h618-transpeed-8k618-t.dtb \
> -	sun50i-h616-x96-mate.dtb
> +	sun50i-h616-x96-mate.dtb \
> +	sun50i-h616-t95-axp313.dtb
>  dtb-$(CONFIG_MACH_SUN50I) += \
>  	sun50i-a64-amarula-relic.dtb \
>  	sun50i-a64-bananapi-m64.dtb \
> diff --git a/arch/arm/dts/sun50i-h616-t95-axp313.dts b/arch/arm/dts/sun50i-h616-t95-axp313.dts
> new file mode 100644
> index 0000000000..b006f363d5
> --- /dev/null
> +++ b/arch/arm/dts/sun50i-h616-t95-axp313.dts
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2021 Arm Ltd.

Please change this copyright you and this year.

> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model = "T95 (AXP313)";
> +	compatible = "mbox,t95-axp313", "allwinner,sun50i-h616";

What is "mbox"? Do you have any more information about this vendor?
In any case a new vendor would need to be added to
Documentation/devicetree/bindings/vendor-prefixes.yaml, in a separate
patch. Also you need a patch to add this compatible combination to
Documentation/devicetree/bindings/arm/sunxi.yaml.

Cheers,
Andre

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
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci2 {
> +	status = "okay";
> +};
> +
> +&ir {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
> +	vmmc-supply = <&reg_dldo1>;
> +	status = "okay";
> +};
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
> +&ohci2 {
> +	status = "okay";
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
> +				regulator-min-microvolt = <1360000>;
> +				regulator-max-microvolt = <1360000>;
> +				regulator-name = "vdd-dram";
> +			};
> +		};
> +	};
> +};
> +
> +&pio {
> +	vcc-pc-supply = <&reg_aldo1>;
> +	vcc-pg-supply = <&reg_dldo1>;
> +	vcc-ph-supply = <&reg_dldo1>;
> +	vcc-pi-supply = <&reg_dldo1>;
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
> diff --git a/configs/t95_axp313_defconfig b/configs/t95_axp313_defconfig
> new file mode 100644
> index 0000000000..6542b5bc88
> --- /dev/null
> +++ b/configs/t95_axp313_defconfig
> @@ -0,0 +1,27 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h616-t95-axp313"
> +CONFIG_SPL=y
> +CONFIG_MACH_SUN50I_H616=y
> +CONFIG_DRAM_CLK=648
> +CONFIG_DRAM_SUN50I_H616_ODT_EN=0x1
> +CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
> +CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
> +CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c1c
> +CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0006
> +CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
> +CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7657
> +CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
> +CONFIG_R_I2C_ENABLE=y
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_AXP313_POWER=y
> +CONFIG_AXP_DCDC3_VOLT=1360
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_SUN8I_EMAC=y
> +CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0=y

