Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329507C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:45:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id vp12so1370701ejc.8
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdCzDmfj+PMHQDUvK9ErBKQf22vLpZFbnSwddzqkBTo=;
        b=p9fSY8XETv3RHePrGV3MDO2XyCRE1jd6mL34JSRpdOKhWD3WlJGQjGptXoF8VZuPEq
         dnbk9/32BH2Dj4nx6d2NcxQQKcggqztzcWAAsAx0ACYdji4tYQC3ZnU4Zvp6sKhenrNA
         bwZcYvqCt/8i3efoRfdKJVzPoks24Z/07I215moJvpGMJunrovVScmaLw9wke1o1im04
         4TldQ1LayCkorK/pKXE19/UrLm7N2kuCdy/R+iLLHbgiM1UrdASQBpAYAeLDS2/3i5vK
         K+ewL+hxFzSnTssJpYRCtjr3srglWfDi8Hnas4gLfFO883RXW5LX60VGGKMRxKcDiQaX
         1v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdCzDmfj+PMHQDUvK9ErBKQf22vLpZFbnSwddzqkBTo=;
        b=4aOrynqAn+AbFZ7pTtRC/arZlgxQAXo56TZs76y+tDm1ZFlSpU8VM4BdkTqOuBvSgP
         ZDMMwszpzu5nVQ2eLrKYyZtLbT6yf1iJXQX5l6/NlLAggMpe1PU0Hj5rXdbZ2G1FCXeY
         0aOiBsUPMvZMKiNfeYgbxmq3q9AnczPe8GCnV4GN9tgRYykJ2A9R19Mg4sXlP4flCdQm
         uwGHz+X0G34tc0xmBvgXQtW1U6DweSJapmt3SOW06k/4jOifoEx8aCzRZJdrddmm7auL
         tBBNiM5556YrhL88KvpdMRePaCFSPKIfPZm6ma1GjR7MSviqGHWXighTBjjbrLAi6sL8
         IoPQ==
X-Gm-Message-State: ANoB5pnuzAKi86vkBSq+ibDw4kg9xEzcDMzltRsNESm7d+OGgBkONUo6
	Q959yMqL8lgPQV78F8MsZMSZEPRHXicdOQ==
X-Google-Smtp-Source: AA0mqf7nxYjWF996Pj53wpbOQnisfsFuRhfTWZwFDtA1zE5lRwBI0zRJz72CdbUiwigSZSlh9Gwbhg==
X-Received: by 2002:a17:907:b014:b0:7b4:86be:f3e3 with SMTP id fu20-20020a170907b01400b007b486bef3e3mr64798905ejc.741.1670273150394;
        Mon, 05 Dec 2022 12:45:50 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906314a00b007bfc5cbaee8sm6678374eje.17.2022.12.05.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:45:50 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Mon, 05 Dec 2022 21:45:48 +0100
Message-ID: <3389289.QJadu78ljV@kista>
In-Reply-To: <20221125234656.47306-10-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-10-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Samuel,

Dne sobota, 26. november 2022 ob 00:46:53 CET je Samuel Holland napisal(a):
> The 100ask Dongshan Nezha STU is a system-on-module that can be used
> standalone or with a carrier board. The SoM provides gigabit Ethernet,
> HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.
> 
> The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
> headers, but contains no digital circuitry, so it does not have its own
> devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v1)
> 
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../sun20i-d1-dongshan-nezha-stu.dts          | 118 ++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> 
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile
> b/arch/riscv/boot/dts/allwinner/Makefile index 2ed586fafaea..87f70b1af6b4
> 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts new file
> mode 100644
> index 000000000000..c549a1c5fbf0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/dts-v1/;
> +
> +#include "sun20i-d1.dtsi"
> +#include "sun20i-common-regulators.dtsi"
> +
> +/ {
> +	model = "Dongshan Nezha STU";
> +	compatible = "100ask,dongshan-nezha-stu", "allwinner,sun20i-d1";
> +
> +	aliases {
> +		ethernet0 = &emac;
> +		mmc0 = &mmc0;

Sorry, I just noticed now, but why is there above alias? It's not sunxi 
practice to add mmc aliases.

Best regards,
Jernej

> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 
*/
> +		};
> +	};
> +
> +	reg_usbvbus: usbvbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usbvbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +		enable-active-high;
> +		vin-supply = <&reg_vcc>;
> +	};
> +
> +	/*
> +	 * This regulator is PWM-controlled, but the PWM controller is not
> +	 * yet supported, so fix the regulator to its default voltage.
> +	 */
> +	reg_vdd_cpu: vdd-cpu {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-cpu";
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&reg_vcc>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_vdd_cpu>;
> +};
> +
> +&dcxo {
> +	clock-frequency = <24000000>;
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&emac {
> +	pinctrl-0 = <&rgmii_pe_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&ext_rgmii_phy>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&reg_vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc_3v3>;
> +	vqmmc-supply = <&reg_vcc_3v3>;
> +	pinctrl-0 = <&mmc0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb8_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +	usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +	usb0_vbus-supply = <&reg_usbvbus>;
> +	status = "okay";
> +};
> --
> 2.37.4


