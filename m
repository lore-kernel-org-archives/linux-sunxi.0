Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09617CB
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 09:34:16 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g27so23659568edf.11
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5hwOC37cPRVT+Lgt6Q6oTRESj5g4dMDJkms4UxcNz6o=;
        b=gOWYd7cgiPSqMjcd2my2MAjZEF7vcSQs4HKRsvLSimpo/ry33sb15M2wKdnw5mprZf
         wyCAKHyDGHBg6aRI0Z4ASWUB2qKF+CVeEAGnKxQZ/EPSwgQgDcVhXZ6ufR/DSMalG3h/
         zdC5ggB3s9GDURjFRSohw+//Bys+Chny2WD0uRMCLATGn49f8YSkd/yNgOswbV8DH2lv
         fXwOHd4Fw8Kim8LQyRAaXNuLHyNurQ+ysnFyK9xGWAosMx/iU5oGMCu6wkgzexqr1I+p
         4iNVSgeThfrUSL55uW885yBO9c6DC2BpDHdYIPW6NDd1t+3/hebys9Eif5WNCEVuyXaG
         leOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hwOC37cPRVT+Lgt6Q6oTRESj5g4dMDJkms4UxcNz6o=;
        b=TzTZm2WM0RJAn3Clrrfdg8UljymcWF/EHr9hRQs4OIcYWY1GVq5smPsy51N+ZYqobj
         brvekaCcMpWfYq8Kn94EF7ZnilByM/9zxgA+CMb1eC/U85dADoL8Ns9qeeWUfvIcnXq7
         GYavO9Navn4ZGw+Fqg+ua9WBT3xQIhI+IK++Th6WLh7mJP1cOYAjz1xYbwxADCGmCzSp
         7j/TwG00bBV967BA+S23JhA6GfAFb3beo4URon6aWrL6CjtEF9O19SZNt0BqlK6ypel9
         G0FVg14cFzc9oNilM2pL4ScIPXtSjty8XXfQjJ99+GiBHPDDJ+gQFWUo4dnQ0QYx29Yu
         k65Q==
X-Gm-Message-State: ACrzQf2hfNDJLwbUZoR+yBdXXpWKByAOT6Ox2PqEdyJ0vW5AJ8kfgpxl
	AV49yL8iS/5ajt5UbNMI+EP7bRAqG1PDQouoAxE=
X-Google-Smtp-Source: AMsMyM7np7gDeepsDAM0PBQ0jBNtCsz3pC/4X0bx7r4wpvQb4BioUS97iasxlET2qoc9ejtvGFICpqJzcRu6OHtLSE0=
X-Received: by 2002:a05:6402:46:b0:45c:bd68:6ab0 with SMTP id
 f6-20020a056402004600b0045cbd686ab0mr924498edu.16.1665567255027; Wed, 12 Oct
 2022 02:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012055602.1544944-1-uwu@icenowy.me> <20221012055602.1544944-11-uwu@icenowy.me>
In-Reply-To: <20221012055602.1544944-11-uwu@icenowy.me>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 12 Oct 2022 11:34:03 +0200
Message-ID: <CAJiuCcfSPaX_boxUjLUVdUKf7eENbOjX96aw=fTOUPEe=4cSwg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andre Przywara <andre.przywara@arm.com>, soc@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Icenowy,

On Wed, 12 Oct 2022 at 07:57, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.
>
> Add a device tree for it. As F1C200s is just F1C100s with a different
> DRAM chip co-packaged, directly use F1C100s DTSI here.
>
> This commit covers the v1.1 version of this board, which is now shipped.
> v1.0 is some internal sample that have not been shipped at all.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> New patch introduced in v2.
>
>  arch/arm/boot/dts/Makefile                    |   3 +-
>  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 101 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6aa7dc4db2fc..0249c07bd8a6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
>         sun9i-a80-optimus.dtb \
>         sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_MACH_SUNIV) += \
> -       suniv-f1c100s-licheepi-nano.dtb
> +       suniv-f1c100s-licheepi-nano.dtb \
> +       suniv-f1c200s-popstick-v1.1.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
>         tegra20-acer-a500-picasso.dtb \
>         tegra20-asus-tf101.dtb \
> diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> new file mode 100644
> index 000000000000..121dfc6f609d
> --- /dev/null
> +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "suniv-f1c100s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +       model = "Popcorn Computer PopStick v1.1";
> +       compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
> +                    "allwinner,suniv-f1c200s", "allwinner,suniv-f1c100s";
> +
> +       aliases {
> +               mmc0 = &mmc0;
> +               serial0 = &uart0;
> +               spi0 = &spi0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led {
> +                       function = LED_FUNCTION_STATUS;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +
> +       reg_vcc3v3: vcc3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +       };
> +};
> +
> +&mmc0 {
> +       cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +       bus-width = <4>;
> +       disable-wp;
> +       status = "okay";
> +       vmmc-supply = <&reg_vcc3v3>;
> +};
> +
> +&spi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spi0_pc_pins>;
> +       status = "okay";
> +
> +       flash@0 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "spi-nand";
> +               reg = <0>;
> +               spi-max-frequency = <40000000>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "u-boot-with-spl";
> +                               reg = <0x0 0x100000>;
> +                       };
> +
> +                       ubi@100000 {
> +                               label = "ubi";
> +                               reg = <0x100000 0x7f00000>;
> +                       };
> +               };
> +       };
> +};
> +
> +&otg_sram {

Nitpick, but this should be alphabetically ordered no?

> +       status = "okay";
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_pe_pins>;
> +       status = "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode = "peripheral";
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       status = "okay";
> +};
> --
> 2.37.1
>
>
