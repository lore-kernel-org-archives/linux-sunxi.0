Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC367B
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 08:33:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id q9so2429551ejd.0
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vxGH8a2/4VvnRsaX5n8YWn6uilAERXnwc4b7LuvGg4w=;
        b=K7jZ1J147pItm13mz+/eg4niSdpae5fFK0egIKIMhpcoEr5vDsmp5IoszLWR7iIOu8
         psjextEizpiWoHD9jhVi5d/yVTahyEIdH8+FFnCciMwwQohLlU0xOSa4DFGLzENfQHq2
         3GcQMqLeN4NlbT1w5yBwq5Dh3D1rExeWYDz5JsUXCxaaava1DwW7NsKQve/vQXfov+x2
         nDv0K1qfrTAv3P+GtITpQB2EHm7j8Y3vBokSNNJPpdqvYsuDJU4DBCv7CyhzR3/NnQmc
         dPiaSvVobrjoBu3wDIgLlQ5v/u/eMJTfUOVQU/oyJfktVJrbBOw0D2W5xSEmsvxsnIIR
         sLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxGH8a2/4VvnRsaX5n8YWn6uilAERXnwc4b7LuvGg4w=;
        b=uXWJZxZ8KMwLnl8dNNmDjbe2YN+ucjvg8CeyqLr8Jod6RIx8VyxpBs2cs8FemDdpK5
         suGB56It9gMHNG+sFhwMi455MxP4AkAxp4CdegCOOO0kada3DosOJcHEiCqIuczawCwj
         aopP9pb3lKn6TozU5CCImBEHx5q5fIRxlCAlyiBbcDm1K/LMNCUXE7ABrK34KR2QFsHE
         J9xAjOMb6niSlcnro5c+FhVp+G6kd2WmJp/GCKkm5Bv28psjy5ngOh/yPH2LnGWf4gl+
         mcl2lHk+8BBFf5B9kRwFhE3YlIszgZ20F9DFhm4ZKi6hONt0j1iFoSjn5+P1rULZhjIL
         35iA==
X-Gm-Message-State: ACrzQf0knKU8NMQ5KK5lQEKqExiEd7nK2E99W00XhCbSsunvOhzNbbhd
	lYV9vOH29dmXirB+i2E0Mut4laFoY4DJbY3SHzo=
X-Google-Smtp-Source: AMsMyM7xhIIW2Ngscbgvc89OZcXvJ05uaDPWc9/9af75RGySgqsn69i+GboCz3Ee3QPpCkBJRVmfrCTO/U5SAbk7DG8=
X-Received: by 2002:a17:906:db0a:b0:781:f24:a782 with SMTP id
 xj10-20020a170906db0a00b007810f24a782mr25435646ejb.399.1665650025932; Thu, 13
 Oct 2022 01:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-7-andre.przywara@arm.com>
In-Reply-To: <20221012163458.1968900-7-andre.przywara@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 13 Oct 2022 10:33:34 +0200
Message-ID: <CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
Subject: Re: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Wed, 12 Oct 2022 at 18:35, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The CherryPi F1C200s board is a small development board, featuring the
> F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C sockets,
> of which one is connected to a USB-UART chip, that provides easy access
> to UART1.

A similar board is trying to been upstreamed by Icenowy:

see : https://lore.kernel.org/lkml/20221012055602.1544944-11-uwu@icenowy.me/
[PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1

Maybe we should take into account the remarks that Krzysztof Kozlowski
made to follow the same device-tree rules on U-boot.

Regards,
Clement

> Beside the usual micro-SD card slot, the board comes with a SPI NAND
> flash chip, which is not yet supported.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++++
>  configs/cherrypi_f1c200s_defconfig            | 11 +++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
>  create mode 100644 configs/cherrypi_f1c200s_defconfig
>
> diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
> new file mode 100644
> index 00000000000..f0ebcb6d893
> --- /dev/null
> +++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
> +/*
> + * Copyright 2022 Arm Ltd.
> + * based on another DT, which is:
> + *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +/dts-v1/;
> +#include "suniv-f1c100s.dtsi"
> +
> +/ {
> +       model = "Cherry Pi F1C200s";
> +       compatible = "lctech,cherrypi-f1c200s", "allwinner,suniv-f1c100s";
> +
> +       aliases {
> +               mmc0 = &mmc0;
> +               serial0 = &uart1;
> +               spi0 = &spi0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
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
> +       broken-cd;
> +       bus-width = <4>;
> +       disable-wp;
> +       status = "okay";
> +       vmmc-supply = <&reg_vcc3v3>;
> +};
> +
> +&uart1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart1_pa_pins>;
> +       status = "okay";
> +};
> diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1c200s_defconfig
> new file mode 100644
> index 00000000000..306d363f485
> --- /dev/null
> +++ b/configs/cherrypi_f1c200s_defconfig
> @@ -0,0 +1,11 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_DCACHE_OFF=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-cherrypi-f1c200s"
> +CONFIG_SPL=y
> +CONFIG_MACH_SUNIV=y
> +CONFIG_DRAM_CLK=156
> +CONFIG_DRAM_ZQ=0
> +CONFIG_SUNXI_MINIMUM_DRAM_MB=64
> +# CONFIG_VIDEO_SUNXI is not set
> +CONFIG_CONS_INDEX=2
> --
> 2.25.1
>
>
