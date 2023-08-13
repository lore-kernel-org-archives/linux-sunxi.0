Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481E846E
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 15:52:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so34669675e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691941933; x=1692546733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxZB8Bvxf2i6g0itAu/aZvi5st5Wi/lMv29R3fR4iKg=;
        b=RMQTlgzePEFPMO5TX98XGROuHpDl/1FjcA4TAOv10hTt1hzA04AvotCAmbl4/w8dDz
         I0FaAlDgCFzcttnF55p2a8ArKvW4YSdv8sK4UVcVg4Lk+tDqL+xWzZFsh5FM3W38RYMU
         AVRUoIjruy474fpsVmF8gr0X5Dskrgzu/s2CNKnBWd5S+ZVbodTmzS/JE4rHXOZ4mtxm
         lceXiL7zHV1gtzqxgtgVDyvURwgaCqbFgthuRY/2WMbasP9c1SwLLVu196Iw7xw3S5U1
         coWBkYV9+S8V9ENvtbW4U+kyxUivr/ladGH/UFy2bXG9pWY3cz/ISa7gORDAAv8ot4NA
         irHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691941933; x=1692546733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxZB8Bvxf2i6g0itAu/aZvi5st5Wi/lMv29R3fR4iKg=;
        b=RWnPn9SBlLF+S8imC7mSr84ahlSWfw2FRG3zuSJ69NqasTPF4cUAu+iv+NQURkt0t5
         V9H42kAk/cAD/ZQMmsOgLlVqgZ4NceMF33Yv+zPPluuZSDOaJnE8fvm536QlrL1SNaVm
         Qe3dVoI+GS70XpqXelv7rRa6HeFBeiUL9taJWDd20KqtlC516laXDUABPpe8Z7jc0H10
         3+TciP78aXUZ6wPdYuROgRQWjcFKczdHHZF8f8z6JvW3f0DbGJXeJotZFCLL4oEt0U40
         TzYhHfyFIRF7Ud2C59KPZvAZIBai/pCZeY4gFwFXsSgabW1gg2xbh2+EDzfBfBRqMlnU
         PrPw==
X-Gm-Message-State: AOJu0Yxuomf8KuwYMiRye5BUcDK7ho+fki/w8vvEmqh8sSYbdNm0bfDc
	T8xJidsM+XRPspDagsfB3RQ=
X-Google-Smtp-Source: AGHT+IFlHIyk7ybfCQ4MKzl6E0S5aFAJ3pYBcN4WJP4JPGZRc8p8QatB4G9Ti/zCmn5l9n5jLHE3yQ==
X-Received: by 2002:a7b:c389:0:b0:3fe:26bf:65ea with SMTP id s9-20020a7bc389000000b003fe26bf65eamr6047985wmj.29.1691941933466;
        Sun, 13 Aug 2023 08:52:13 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003fe2f3a89d4sm11665280wma.7.2023.08.13.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:52:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Botka <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Icenowy Zheng <uwu@icenowy.me>,
 Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 3/4] arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM &
 boards support
Date: Sun, 13 Aug 2023 17:52:10 +0200
Message-ID: <3249535.44csPzL39Z@jernej-laptop>
In-Reply-To: <3017957701F1CF4A+20230807145349.2220490-4-martin@biqu3d.com>
References:
 <20230807145349.2220490-1-martin@biqu3d.com>
 <3017957701F1CF4A+20230807145349.2220490-4-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

since this will be obviously delayed to 6.7 cycle due to mfd patch not being 
merged in time, I have few nits below.

Dne ponedeljek, 07. avgust 2023 ob 16:53:23 CEST je Martin Botka napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> CB1 is Compute Module style board that plugs into Rpi board style adapter or
> Manta 3D printer boards (M4P/M8P).
> 
> The SoM features:
>   - H616 SoC
>   - 1GiB of RAM
>   - AXP313A PMIC
>   - RTL8189FTV WiFi
> 
> Boards feature:
>   - 4x USB via USB2 hub (usb1 on SoM).
>   - SDcard slot for loading images.
>   - Ethernet port wired to the internal PHY. (100M)
>   - 2x HDMI 2.0. (Only 1 usable on CB1)
>   - Power and Status LEDs. (Only Status LED usable on CB1)
>   - 40 pin GPIO header
> 
> Currently working:
>   - Booting
>   - USB
>   - UART
>   - MMC
>   - Status LED
>   - WiFi (RTL8189FS via out of tree driver)
> 
> I didnt want to duplicate things so the manta DTS can also be used on BTT
> pi4b adapter. CB1 SoM has its own DTSI file in case other boards shows up
> that accept this SoM.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changes in V2:
>     - Fixed whitespace errors
>     - Move UART into carrier boards and BTT Pi
>     - Remove usb1-vbus regulator
>     - Fix ranges and naming of AXP313A rails
>     - Add comment specifying why broken-cd in mmc0 is needed
>     - Rename sdio_wifi to wifi
>     - Specify in commit description that USB-OTG doesnt work
> Changes in V3:
>     - Add missed semicolons
>     - Move model string from dtsi to board dts
>     - Add cb1 compatible
>     - Remove extra empty line
> Changed in V4:
>     - Extend the range of vcc-dram to 1.5V (1.35V max caused issues with
> booting up
> 
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
>  .../sun50i-h616-bigtreetech-cb1.dtsi          | 140 ++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts create
> mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> b/arch/arm64/boot/dts/allwinner/Makefile index 6a96494a2e0a..7b386428510b
> 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
> diff --git
> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts new
> file mode 100644
> index 000000000000..dbce61b355d6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616-bigtreetech-cb1.dtsi"
> +
> +/ {
> +	model = "BigTreeTech CB1";
> +	compatible = "bigtreetech,cb1-manta", "bigtreetech,cb1",
> "allwinner,sun50i-h616"; +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi new file
> mode 100644
> index 000000000000..5e756f217813
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	aliases {
> +		ethernet0 = &rtl8189ftv;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 
*/
> +		};
> +	};
> +
> +	reg_vcc5v: regulator-vcc5v {
> +		/* board wide 5V supply from carrier boards */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_vcc33_wifi: vcc33-wifi {
> +		/* Always on 3.3V regulator for WiFi */

Please drop the comment. It's pretty obvious from properties.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc33-wifi";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc5v>;
> +	};
> +
> +	reg_vcc_wifi_io: vcc-wifi-io {
> +		/* Always on 1.8V/300mA regulator for WiFi */

Ditto.

Once fixed, you can add:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-wifi-io";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc33_wifi>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc 1>;
> +		clock-names = "ext_clock";
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +		post-power-on-delay-ms = <200>;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dldo1>;
> +	/* Card detection pin is not connected */
> +	broken-cd;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	vmmc-supply = <&reg_vcc33_wifi>;
> +	vqmmc-supply = <&reg_vcc_wifi_io>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	mmc-ddr-1_8v;
> +	status = "okay";
> +
> +	rtl8189ftv: wifi@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&r_i2c {
> +	status = "okay";
> +
> +	axp313a: pmic@36 {
> +		compatible = "x-powers,axp313a";
> +		reg = <0x36>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		regulators{
> +			reg_dcdc1: dcdc1 {
> +				regulator-name = "vdd-gpu-sys";
> +				regulator-min-microvolt = 
<810000>;
> +				regulator-max-microvolt = 
<990000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-name = "vdd-cpu";
> +				regulator-min-microvolt = 
<810000>;
> +				regulator-max-microvolt = 
<1100000>;
> +				regulator-ramp-delay = <200>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-name = "vcc-dram";
> +				regulator-min-microvolt = 
<1350000>;
> +				regulator-max-microvolt = 
<1500000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_aldo1: aldo1 {
> +				regulator-name = "vcc-1v8-pll";
> +				regulator-min-microvolt = 
<1800000>;
> +				regulator-max-microvolt = 
<1800000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_dldo1: dldo1 {
> +				regulator-name = "vcc-3v3-io";
> +				regulator-min-microvolt = 
<3300000>;
> +				regulator-max-microvolt = 
<3300000>;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};




