Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786457;
	b=02oEl2sfkt8vZSB5a6L9q9LkNveScc14yi+EmuIhlKQPDNGMk6n26kv9U+xGd4SI3bO5
	 uvNpIdPJQdjIGfKd4vUJtX4OJoLrXhppn/mzFHvDT3/9mgoEiTsYfqbFjtfWrc7oGa3mK
	 Op2U69nu9CJr8Tw57p9D5HflZdXwHgm9i6zSckWAEMXbu/JuEN8lwrrXY8wOEyVfBr/ld
	 u7NC2t/WCOIf7prpKBWAM0nvrNXPcKwIxG/nsfXhC9RUNZOXcGkjSU96xTuzhzzLcokl9
	 K09cch+WlZrwln5IOkX0++FL2kxRRHZBYrmPPKcLGq2itjBMfG6hCiMmALE2WooGzlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IpGkUdlcLy3swrJPGP30Co4bi1+OWXaYXd/HrZ4FCb4=;
	b=4OCb3R+dG/G1xM+WkjTzNHepcfuZO8NDoxFdUXlLu0TsXWxVAeQ7pxf5O+BPJocuS+hX
	 tW4Rk/KJ1/NemwQVR7CKVmjf1MB3eljBUgCYC7EnM6EEaPZMDxWjYyrCtSjukn863Kqjj
	 i/ruvsapiBmcXMrxKtgkg2456rQY6e1AjnJacjz7fAKHvvfy+HwECDqjcWedvavoHdTWv
	 p7YLLItJ/acCRcTTySq8Sfy/MQ5hCSTZRA4yyuWM8iQ1g7tfoy8ujzv62Er8u6lNeKlgI
	 RLtTSCjpxsw104oXY5uN3uHxqi0wVlwXFMto+4jbg8Km04NLxaD6Tl0aeNtOez5iHMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZYtZIsp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F6606A32C
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 23:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZYtZIsp
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so989809e0c.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794786456; cv=none;
        d=google.com; s=arc-20260327;
        b=MlymPNgT1CkIHNvDi3/4glKFVI0XknbzzUrtwK5GrYWorY0E0sqzDVATC84qqQRhV5
         HdCawWCd1aJPCIw6ODeeMyZIsuY3fgkishgp/vJxTo80W7pDUcbp3QVrMuqlzuRo3rJL
         ZwbVE3BBZ3gYpcHJUjAmhiCHhX535WUiEXpTAuS50xFf0c6qBqXA7/wIqYuQHylrVBJ7
         sm71u5JGUFJGFAzddkasCD90tFSicybPcwPOkaVS1vGGeXdLpIUT5iFHRREnRg/u+MFA
         HYnDdnrtIOqmfHKCfUNEujHEuuT9Kpp2TyiaH/2p3IpdvgQzQva1Uky5WOOEIZQZWd4e
         yt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IpGkUdlcLy3swrJPGP30Co4bi1+OWXaYXd/HrZ4FCb4=;
        fh=8mKbxt61qqMgZwMBZaNEjI/MZvXs4lWogfmeiutgWbM=;
        b=JLsvb6SXvw2tRFxHv8Boacy2FzZfDAe60GsufERArv+9wNGa9mHeDt6w2BnH8Me91D
         vahNXtJfel5fGGyAs+v5YJX6ayCjOvA9n6lkNWibkF4ysfuySOgyuoM3/MOcUgs+Uzne
         BxO4XkyI82S9RD1tMpy7deCBe+ZF+69S8ubayFopowHcoRNBbcz8vU+j6L1VQZeOg1OH
         lHFFKeRua4YbmmQ1n7/D699ttQ9hLncj/jhVRI0o5Wb5PjYoZN9vEe/qw3typWNZfmbv
         fT+2LvAUj4ZoaU6nwZsR6pwgYHhxTdTKCG4jihs7H8IILWjm3qVbwgIMVt6OwmsEjBru
         +SAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786456; x=1795391256; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpGkUdlcLy3swrJPGP30Co4bi1+OWXaYXd/HrZ4FCb4=;
        b=FZYtZIspcenP6ih161maWNFw2/eicoiMOIjUk3sXrzGZKvlx5tHiFnhBCUYn9oSe5Y
         sucvHBmHYKEyEZUrLwAddbDg7sBYfgLwlDZS8uWHZXGXXgWLX8oe2H2jszdrSq5kMcsU
         uy0haM2ZF2FhLDibPXdMBDD3QIih/eQuWZ6cK/nhORh2QYmQm6q0G1S6m9pS7fw9351F
         oqxkpMRVKihYXPIMcCbOEL70JmM9Ed3TQjLQXOyD4+EyH8eBFV2wPkIxDuF77RPDSqbf
         5XbT8fQjKU76/iUAlqlHnxIPR6guIc/ArR9ADefTgkU/6x62emveSMi+5JCXSx+wXeAr
         Sw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786456; x=1795391256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpGkUdlcLy3swrJPGP30Co4bi1+OWXaYXd/HrZ4FCb4=;
        b=CP61aiTEPK//VmvUOWscCvnsr3l+tKf2hQZ+hlsMB0faya7MhyRPktxFj9iW720zsC
         P8W2e8ukoDARwbxnuinbOQ05HnnfsMDt3MPmB4RNHB3YE/9gfrDlZD58kbgnFm2x3qfe
         jQCoPwAk9vWIRtaM+9vA9CzkkcOt++KexFmLpEdQhYwOONm2QP7kjZRpt5SpidMVd527
         8FUwDuW4s+LU0JScz9L2HF20Lx8vy/TGAq0tmrOkO7bc5wtmCFmz6cjWC5mSrK6JX16E
         uzw1V5HnS6l/dueBRGinHWO5DI/FDS65GZ1q6aVnRJo5fXdeLkv6pSdvl82GEqxTtGSB
         K5Pg==
X-Gm-Message-State: APuU4Z8x2TXAnCliaBeYLaej5aTofyLSYj2FxBNvNV9nT7d1Fbn3vtlj
	HP3hgIQPTwrIQLuUIMVNza3g2zf1ZvfNE8Jg8haH6a3ky+ZVSD412a3VepRAObTJlPmHo4u9B4o
	fAqm/TbMazpJCdp2iUal6dcU/OvC/N/8EVPFJqcQ=
X-Gm-Gg: AYBFou1J4kiJTHFxAn5FfsC7PwRLOWvs0KMoYVbdfehYSGsZnR2kWDg9a1YW+eEW8/N
	z+YXKyBv/bG2O8LHc8C8fxmjkMMIejKN8UEl7MSSDbzw7wsz8/QYLylZRTWDqjsSvBbn2tNwaj8
	y8/cxuqIUCdwPV5K5L3PWTzIn+A9WAuJnjSPMNwmnAwyhe1400TvNNXA2CNsW8mcPYEGYE2xpyq
	vk7K+BcqCPrg/ePm5XTnpo1taM+0aJu4Sb9QTURmCo+u+0XuqZQOO/idIaV3+s/01g3ZbluAp6d
	f21CrVlG8JIUGJaZPhJY8/NpdlCZ7RoHLLbPPhQvpYNn710Z6iWSTevWy7miFhYm76//2J8MpF8
	NtNtCiMfPL26pludyAEO3wJYrOZmeEtUFQXnnp05qnXswr9e1HzWEvKqbLAcYKzMllMWwGw==
X-Received: by 2002:a05:6122:e252:b0:5ea:b04a:cefd with SMTP id
 71dfb90a1353d-5ee3492592bmr2763172e0c.7.1794786455702; Sun, 15 Nov 2026
 15:47:35 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com> <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
In-Reply-To: <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 15 Nov 2026 16:47:24 -0700
X-Gm-Features: AclHuK9GwipEKQmV68VRLfJX3c26HaUYWWpWxUZtxdSSAauzw99s1YYplzkCPcA
Message-ID: <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
> > including its regulators, storage, Ethernet PHY, LEDs and USB ports.
> >
> > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetection,
> > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > registration and keep reset outside interface detach so its configured
> > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> >
> > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMMC
> > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> >
> > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej=
.skrabec@gmail.com/
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++=
++++++++
> >  2 files changed, 380 insertions(+)
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
> > index 000000000..e2ca41b94
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > @@ -0,0 +1,379 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
>
> We now have a common sun50i-h6-orangepi.dtsi file. You really should
> rewrite this patch to just use that as a base.  It is mostly the same
> across all the OrangePi H6 boards.

v4 now uses that include and keeps the LTS-specific additions
and overrides. I compared the resolved DTBs to check the inherited
properties and preserved the LTS electrical settings, except for the
review changes described below. Common naming cleanups are deferred.

>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +       model =3D "OrangePi 3 LTS";
> > +       compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> > +
> > +       aliases {
> > +               ethernet0 =3D &emac;
> > +               ethernet1 =3D &aw859a;
> > +               serial0 =3D &uart0;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D "serial0:115200n8";
> > +       };
> > +
> > +       connector {
> > +               compatible =3D "hdmi-connector";
> > +               ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> > +               type =3D "a";
> > +
> > +               port {
> > +                       hdmi_con_in: endpoint {
> > +                               remote-endpoint =3D <&hdmi_out_con>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       ext_osc32k: ext-osc32k-clk {
> > +               #clock-cells =3D <0>;
> > +               compatible =3D "fixed-clock";
> > +               clock-frequency =3D <32768>;
> > +               clock-output-names =3D "ext-osc32k";
> > +       };
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               led-0 {
> > +                       function =3D LED_FUNCTION_STATUS;
>
> The schematic (v1.4) calls this the "PWR" LED.

Corrected: red PL4 is power/on and green PL7 is status/off. These roles,
defaults and existing H6 labels are inherited from the common include;
the LTS only adds the per-LED pinctrl states for drive strength 10.
The running board reports the expected names/defaults and drive settings.

>
> > +                       color =3D <LED_COLOR_ID_RED>;
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&led_red_pin>;
> > +                       gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4=
 */
> > +               };
> > +
> > +               led-1 {
> > +                       function =3D LED_FUNCTION_POWER;
>
> And this one the "STATUS" LED. So you have the two functions swapped.
>
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&led_green_pin>;
> > +                       gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7=
 */
> > +                       default-state =3D "on";
>
> And this should go to the power LED.
>
> > +               };
> > +       };
> > +
> > +       reg_gmac_3v3: gmac-3v3 {
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
> > +       reg_vcc5v: vcc5v {
> > +               /* board wide 5V supply directly from the DC jack */
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-5v";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       reg_wifi_3v3: wifi-3v3 {
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
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
>
> Set the supply on all cores.

Done. All four running CPU nodes reference DCDCA, and all four CPUs are
online with the shared cpufreq policy.

>
> > +
> > +&de {
> > +       status =3D "okay";
> > +};
> > +
> > +&dwc3 {
> > +       status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&ehci3 {
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
> > +&gpu {
> > +       mali-supply =3D <&reg_dcdcc>;
> > +       status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +       hvcc-supply =3D <&reg_bldo2>;
> > +       status =3D "okay";
> > +};
> > +
> > +&hdmi_out {
> > +       hdmi_out_con: endpoint {
> > +               remote-endpoint =3D <&hdmi_con_in>;
> > +       };
> > +};
> > +
> > +&mdio {
> > +       reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +       reset-delay-us =3D <15000>;
> > +       reset-post-delay-us =3D <100000>;
> > +
> > +       ext_rgmii_phy: ethernet-phy@1 {
> > +               compatible =3D "ethernet-phy-id4f51.e91b";
> > +               reg =3D <1>;
> > +
> > +               motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +               rx-internal-delay-ps =3D <1950>;
> > +               tx-internal-delay-ps =3D <1950>;
> > +       };
> > +};
> > +
> > +&mmc0 {
> > +       vmmc-supply =3D <&reg_cldo1>;
> > +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > +       disable-wp;
> > +       bus-width =3D <4>;
> > +       status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > +       vqmmc-supply =3D <&reg_bldo3>;
>
> Something is fishy here. The schematic also shows vcc-wifi-io (on the aw8=
59
> side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at least
> checking with a multimeter to confirm what the voltage is on the VDDIO
> pin of the module.
>

Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
1.8 V at an RW1 pad relative to board ground. This supports keeping the
existing BLDO3 vqmmc assignment; I have left it unchanged.

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
> > +&ohci0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&ohci3 {
> > +       status =3D "okay";
> > +};
> > +
> > +&pio {
> > +       vcc-pc-supply =3D <&reg_bldo2>;
> > +       vcc-pd-supply =3D <&reg_cldo1>;
> > +       vcc-pg-supply =3D <&reg_bldo3>;
> > +};
> > +
> > +&r_ir {
> > +       status =3D "okay";
> > +};
> > +
> > +&r_pio {
> > +       vcc-pm-supply =3D <&reg_bldo3>;
> > +
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
> > +&r_i2c {
> > +       status =3D "okay";
> > +
> > +       axp805: pmic@36 {
> > +               compatible =3D "x-powers,axp805", "x-powers,axp806";
> > +               reg =3D <0x36>;
> > +               interrupt-parent =3D <&r_intc>;
> > +               interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-controller;
> > +               #interrupt-cells =3D <1>;
> > +               x-powers,self-working-mode;
> > +               vina-supply =3D <&reg_vcc5v>;
> > +               vinb-supply =3D <&reg_vcc5v>;
> > +               vinc-supply =3D <&reg_vcc5v>;
> > +               vind-supply =3D <&reg_vcc5v>;
> > +               vine-supply =3D <&reg_vcc5v>;
> > +               aldoin-supply =3D <&reg_vcc5v>;
> > +               bldoin-supply =3D <&reg_vcc5v>;
> > +               cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +               regulators {
> > +                       reg_aldo1: aldo1 {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <3300000>;
> > +                               regulator-max-microvolt =3D <3300000>;
> > +                               regulator-name =3D "vcc-pl-led-ir";
> > +                       };
> > +
> > +                       reg_aldo2: aldo2 {
> > +                               regulator-min-microvolt =3D <3300000>;
> > +                               regulator-max-microvolt =3D <3300000>;
> > +                               regulator-name =3D "vcc33-audio-tv-ephy=
-mac";
> > +                       };
> > +
> > +                       /* ALDO3 is shorted to CLDO1 */
> > +                       reg_aldo3: aldo3 {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <3300000>;
> > +                               regulator-max-microvolt =3D <3300000>;
> > +                               regulator-name =3D "vcc33-io-pd-emmc-sd=
-usb-uart-1";
> > +                       };
> > +
> > +                       reg_bldo1: bldo1 {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <1800000>;
> > +                               regulator-max-microvolt =3D <1800000>;
> > +                               regulator-name =3D "vcc18-dram-bias-pll=
";
> > +                       };
> > +
> > +                       reg_bldo2: bldo2 {
> > +                               regulator-min-microvolt =3D <1800000>;
> > +                               regulator-max-microvolt =3D <1800000>;
> > +                               regulator-name =3D "vcc-efuse-pcie-hdmi=
-pc";
> > +                       };
> > +
> > +                       reg_bldo3: bldo3 {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <1800000>;
> > +                               regulator-max-microvolt =3D <1800000>;
> > +                               regulator-name =3D "vcc-pm-pg-dcxoio-wi=
fi";
> > +                       };
> > +
> > +                       bldo4 {
> > +                               /* unused */
> > +                       };
> > +
> > +                       reg_cldo1: cldo1 {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <3300000>;
> > +                               regulator-max-microvolt =3D <3300000>;
> > +                               regulator-name =3D "vcc33-io-pd-emmc-sd=
-usb-uart-2";
> > +                       };
> > +
> > +                       cldo2 {
> > +                               /* unused */
> > +                       };
> > +
> > +                       cldo3 {
> > +                               /* unused */
> > +                       };
> > +
> > +                       /* DCDCB is polyphased with DCDCA. */
> > +                       reg_dcdca: dcdca {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <800000>;
> > +                               regulator-max-microvolt =3D <1160000>;
> > +                               regulator-ramp-delay =3D <2500>;
> > +                               regulator-name =3D "vdd-cpu";
> > +                       };
> > +
> > +                       reg_dcdcc: dcdcc {
> > +                               regulator-enable-ramp-delay =3D <32000>=
;
> > +                               regulator-min-microvolt =3D <810000>;
> > +                               regulator-max-microvolt =3D <1080000>;
> > +                               regulator-ramp-delay =3D <2500>;
> > +                               regulator-name =3D "vdd-gpu";
> > +                       };
> > +
> > +                       reg_dcdcd: dcdcd {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <960000>;
> > +                               regulator-max-microvolt =3D <960000>;
> > +                               regulator-name =3D "vdd-sys";
> > +                       };
> > +
> > +                       reg_dcdce: dcdce {
> > +                               regulator-always-on;
> > +                               regulator-min-microvolt =3D <1200000>;
> > +                               regulator-max-microvolt =3D <1200000>;
> > +                               regulator-name =3D "vcc-dram";
> > +                       };
> > +
> > +                       sw {
> > +                               /* unused */
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&rtc {
> > +       clocks =3D <&ext_osc32k>;
> > +};
> > +
> > +&uart0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart0_ph_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&usb2otg {
> > +       dr_mode =3D "host";
> > +       status =3D "okay";
> > +};
> > +
> > +&usb2phy {
> > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
>
> This isn't connected to anything but a pull-up. And you already specified
> host mode only above.

Removed usb0_id_det-gpios with /delete-property/ so the common include's
PC6 setting is removed too. USB0 remains fixed to host mode. The running
DT confirms the ID GPIO property is absent and dr_mode is host.

>
>
> ChenYu
>
> > +       usb0_vbus-supply =3D <&reg_vcc5v>;
> > +       usb3_vbus-supply =3D <&reg_vcc5v>;
> > +       status =3D "okay";
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


Regards,
Cristian Filipescu
------------------------------------
