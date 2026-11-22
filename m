Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372687;
	b=rtlGXBbUPnC3FsbFor/pW9FaQTVgNGnJbahkW8lSQ/cTvuuh3lhIEf6NyRtrilcb1kRm
	 OjsMozr4U2uCvf2Y5ksu9033ffFmEp5nMlgDnFlUe4myMKXR6PW3J7iNpkjN13M3Bixdy
	 lKZ+QXDUVd/y5oFIMs6gs5D8FE7eJODdoedCz2zzwtNj5tvTAMTdtPPepIpqovRNBOSKo
	 LLaQr0aBl46unS578RcZu4+J1V/ZO3TCg93evS3egAUO7i7wL6eltaqypm1E9OOw4AiM7
	 /2qG2qjtLk3bpuaF7WtRsEdBz8UOxTRKCIZMcEv7o8rX7g6sT6rVUqU12vl471qL65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372687;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YTOa+gL7yOyzcm1jBXp+ydfq8961ZdK25RmBINDhpCY=;
	b=e5iIWRwMP1MMn8l5UxdnyKWDTnlpcWUSwYkAD6YkBM2gY9SSZSuNzLvo7f2WXqSrS8qF
	 Z4q6h84yFjxMNwFcmRVEIRyKdVtJ6QDXGt8zwBVI6Dt+O0bAu5s9WsT6VP12wFhx51T+E
	 PTYSeJkp2nxJ4zR71FhF2PSie1CnjeM6X6fy/LS0TORP7nkk+oPU4MEoDYxQD2vpOpbLP
	 6VD45/8DZHN9XBDkJwEtTgeX540YTWzQwoOxWin5qp0MP8xCvoTXgjYpeFdMYQODaLMja
	 /CWoiBsT82/XIDHN+jl8K2ZyIZUv4J2rXrEwNfqWUKRJeyDlts++FG9SmD1DkTk2xWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWPzreyz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF4606A331
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWPzreyz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C851F000C4
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795372686;
	bh=YTOa+gL7yOyzcm1jBXp+ydfq8961ZdK25RmBINDhpCY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lWPzreyzEpRLuX9uH4dizztpKSsv9S2x90lnQJtrlDNGtCbmTVGZCeRhuoJqNec+K
	 2hr/E/9PGKOITUwJjNKXTIfYpxRei45F61Ye2dQx2rTTNfsxiHy8pzx/jywWiypyv/
	 WEP8yaK2sWK2NZHUw8PLCB5ZJuuL+BgsbtJqrSX/H2gk/IZGv5dmouFqpCq9OdjVaQ
	 eCxNChibYBC0fxXU7p11nz1QQ1Od43ZHfOPaoNvci3p533wruzr8vseFmCJAkJUsDv
	 jPdJQac67bIissHzc1BnmGozCYIFMF+0fqiMklyTAq7yhC5+68oNntwfSf2qhWrpkE
	 zHcTjG3jytjZg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae417eb235so21358881fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 10:38:06 -0800 (PST)
X-Gm-Message-State: APuU4Z+bmP1b7PMSM7Ccfz/XJj+M6tNxA2gmnlG61oNP3ELTxVr3gSAS
	xROFQBco93xDI/AsXLeVEOpAWWajFNLDTqN7CcbLuDism4pfVaxmOvmFOKLc/YBs+ju2PuzU9B9
	sRH9XKyNI6ElCh3LnQLkirkRIjRSS+AY=
X-Received: by 2002:a05:651c:a1a3:b0:3ae:25c8:dc9a with SMTP id
 38308e7fff4ca-3ae7f9b2228mr29279941fa.5.1795372684952; Sun, 22 Nov 2026
 10:38:04 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
 <20261115-sunxi-orangepi-3-lts-v4-2-7749b448a4dd@gmail.com> <CAGb2v67uMTqVNQDab=R1emtapiYK=AT-5sdJqr8Goc0b-1sTWA@mail.gmail.com>
In-Reply-To: <CAGb2v67uMTqVNQDab=R1emtapiYK=AT-5sdJqr8Goc0b-1sTWA@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 02:37:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v6460dVmizgg1vjH+bLAUvYg7ct7GEQE88uBCGikwU_KNA@mail.gmail.com>
X-Gm-Features: Aa3M54pVJ71YM_TrHyMHQA9Nxn9MV0xNpIRqtGxca4cMu10QpKzLP93yCptqHTw
Message-ID: <CAGb2v6460dVmizgg1vjH+bLAUvYg7ct7GEQE88uBCGikwU_KNA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: filipescu.cristian@gmail.com
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Blah, I don't know why I was looking at an old version. Please ignore.

On Mon, Nov 23, 2026 at 2:34=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> Minor issues,
>
> On Mon, Nov 16, 2026 at 7:50=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
> > using the common Orange Pi H6 description for shared hardware.
> > Describe the LTS regulators, storage, Motorcomm YT8531C Ethernet PHY,
> > wireless module supplies, LEDs and USB ports.
> >
> > Reset the sole Ethernet PHY at MDIO bus registration and keep reset
> > outside interface detach so its configured 125 MHz output is retained.
> > Use generic Clause 22 discovery and PHY-internal RGMII delays.
> >
> > Inherit the schematic LED roles and defaults: red power on and green
> > status off. Select the weakest GPIO drive level for both LEDs, describe
> > the shared CPU supply on all four cores, and enable 1.8 V eMMC DDR52 an=
d
> > HS200 modes while retaining the H6 maximum frequency of 150 MHz.
> > Remove inherited USB ID detection for fixed host mode.
> >
> > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej=
.skrabec@gmail.com/
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 188 +++++++++++++=
++++++++
> >  2 files changed, 189 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index aa21f58a4..7ea136380 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero=
-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > new file mode 100644
> > index 000000000..d3ea73e1d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > +
> > +#include "sun50i-h6-orangepi.dtsi"
>
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
>
> These two are redundant.
>
> > +
> > +/ {
> > +       model =3D "OrangePi 3 LTS";
> > +       compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> > +
> > +       aliases {
> > +               ethernet0 =3D &emac;
> > +               ethernet1 =3D &aw859a;
> > +       };
>
>
> > +
> > +       leds {
> > +               led-0 {
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&led_red_pin>;
> > +               };
> > +
> > +               led-1 {
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&led_green_pin>;
> > +               };
> > +       };
>
> I think the LED drive strength could be moved to the .dtsi file?
>
> > +
> > +       reg_gmac_3v3: gmac-3v3 {
>
> Node name should be regulator-gmac-3v3. Node names should be generic
> in most cases, or carry a generic type prefix for nodes that don't have
> addresses.
>
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "gmac-3v3";
> > +               vin-supply =3D <&reg_vcc5v>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               startup-delay-us =3D <150000>;
> > +               enable-active-high;
> > +               gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> > +       };
> > +
> > +       reg_wifi_3v3: wifi-3v3 {
>
> Should be regulator-wifi-3v3.
>
> > +               /* 3.3V regulator for WiFi and BT */
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "wifi-3v3";
> > +               vin-supply =3D <&reg_vcc5v>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               enable-active-high;
> > +               gpio =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> > +       };
> > +
> > +       wifi_pwrseq: wifi-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +               clock-names =3D "ext_clock";
> > +               reset-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> > +               post-power-on-delay-ms =3D <200>;
> > +       };
> > +};
> > +
> > +&axp805 {
> > +       /* ALDO3 is shorted to CLDO1; both inherit regulator-always-on.=
 */
> > +       regulators {
> > +               cldo2 {
> > +                       /* unused */
> > +                       /delete-property/ regulator-min-microvolt;
> > +                       /delete-property/ regulator-max-microvolt;
>
> You should reference them by label, not by partial path. And perhaps
> also delete the name, so it goes back to the default.
>
> > +               };
> > +
> > +               cldo3 {
> > +                       /* unused */
> > +                       /delete-property/ regulator-min-microvolt;
> > +                       /delete-property/ regulator-max-microvolt;
>
> Same for this one.
>
> > +               };
> > +
> > +               /* DCDCB is polyphased with DCDCA. */
> > +               dcdca {
> > +                       regulator-min-microvolt =3D <800000>;
> > +                       regulator-max-microvolt =3D <1160000>;
> > +                       regulator-ramp-delay =3D <2500>;
> > +               };
>
> Setting is almost identical to orangepi.dtsi. Lower min voltage probably
> doesn't do anything since the lowest OPP is at 0.81V?
>
> > +
> > +               dcdcc {
> > +                       regulator-ramp-delay =3D <2500>;
>
> Same here. I think you can drop both of them.
>
> > +               };
> > +       };
> > +};
> > +
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&cpu1 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&cpu2 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&cpu3 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
>
> These are redundant. The cpu0 supply is already inherited from the common
> .dtsi file.
>
> If anything we should add cpu-supply properties to the other cores in the
> .dtsi file. But that is another task, and one we should probably do for
> all boards together.
>
>
> Thanks
> ChenYu
>
> > +
> > +&dwc3 {
> > +       status =3D "okay";
> > +};
> > +
> > +&emac {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&ext_rgmii_pins>;
> > +       phy-mode =3D "rgmii-id";
> > +       phy-handle =3D <&ext_rgmii_phy>;
> > +       phy-supply =3D <&reg_gmac_3v3>;
> > +       allwinner,rx-delay-ps =3D <0>;
> > +       allwinner,tx-delay-ps =3D <0>;
> > +       status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +       hvcc-supply =3D <&reg_bldo2>;
> > +};
> > +
> > +&mdio {
> > +       reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +       reset-delay-us =3D <15000>;
> > +       reset-post-delay-us =3D <100000>;
> > +
> > +       ext_rgmii_phy: ethernet-phy@1 {
> > +               compatible =3D "ethernet-phy-ieee802.3-c22";
> > +               reg =3D <1>;
> > +
> > +               motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +               rx-internal-delay-ps =3D <1950>;
> > +               tx-internal-delay-ps =3D <1950>;
> > +       };
> > +};
> > +
> > +&mmc1 {
> > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > +       vqmmc-supply =3D <&reg_bldo3>;
> > +       mmc-pwrseq =3D <&wifi_pwrseq>;
> > +       bus-width =3D <4>;
> > +       non-removable;
> > +       status =3D "okay";
> > +
> > +       aw859a: wifi@1 {
> > +               reg =3D <1>;
> > +       };
> > +};
> > +
> > +&mmc2 {
> > +       vmmc-supply =3D <&reg_cldo1>;
> > +       vqmmc-supply =3D <&reg_bldo2>;
> > +       mmc-ddr-1_8v;
> > +       mmc-hs200-1_8v;
> > +       cap-mmc-hw-reset;
> > +       non-removable;
> > +       bus-width =3D <8>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pio {
> > +       vcc-pg-supply =3D <&reg_bldo3>;
> > +};
> > +
> > +&r_pio {
> > +       led_green_pin: led-green-pin {
> > +               pins =3D "PL7";
> > +               function =3D "gpio_out";
> > +               drive-strength =3D <10>;
> > +       };
> > +
> > +       led_red_pin: led-red-pin {
> > +               pins =3D "PL4";
> > +               function =3D "gpio_out";
> > +               drive-strength =3D <10>;
> > +       };
> > +};
> > +
> > +&usb2phy {
> > +       /delete-property/ usb0_id_det-gpios;
> > +};
> > +
> > +&usb3phy {
> > +       status =3D "okay";
> > +};
> >
> > --
> > 2.47.3
> >
> >
