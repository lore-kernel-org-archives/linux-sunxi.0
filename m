Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8946F9F4
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 13:35:33 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso30370865ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439333; x=1695044133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFSzuCGy52KzjM99XInUlC5S7QkdlRbmWeLPzdzNuao=;
        b=gseZPj/Yn+LdIPQ8DZQtTu2pwG8yODp/28t2bzfbTT5JAs57ffePts31csBuNRpHKM
         1EIazVIMweKVoGRzAC9eygQBvn8ehLk+p1LsJP+w1EEIgnCQQVLZAETm8PFH1A5X0wtv
         l51ei4qr5GiHVeo4DVIOTFvRZKjWEtUOhXGvjgpZXmWbgqMHoMBMFc1eG/24PTyYqKxw
         VWHY2pn1Mj0Dl0XhUB7409aq4r3jz2cVgw18wS+LGYRgzopI1DcC9N2OwBzNifK84GuX
         DmLAhaM11Cz0tlhVLbvjGlVusnh+9OUhXpfXicM7Q7UBv9gyvx8fecs+sK/3H5N0tnxI
         i9Pg==
X-Gm-Message-State: AOJu0YyFstIjNo7eLHyLtfOW4XBx64kyvw0queIZyMZTZYYpWDOFOKSf
	xLqdZevNztB0VN25FK2MDtAcK1Ekw59/wA==
X-Google-Smtp-Source: AGHT+IFPEuKvCD3l0FOgTfy+yXj6Br/KRaqOeR34Lx2s5pBcsVrSPFtFZmBMqWXQQ8mGhTf+ZgMWiA==
X-Received: by 2002:a17:902:ab15:b0:1c1:de3a:d3d7 with SMTP id ik21-20020a170902ab1500b001c1de3ad3d7mr7262210plb.68.1694439332582;
        Mon, 11 Sep 2023 06:35:32 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902cec700b001c0a4146961sm6496491plg.19.2023.09.11.06.35.31
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:35:31 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68fb70fca9fso944247b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 06:35:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:f39d:b0:152:be08:b013 with SMTP id
 qr29-20020a056a20f39d00b00152be08b013mr6911988pzb.42.1694439330890; Mon, 11
 Sep 2023 06:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-9-macroalpha82@gmail.com> <20230911004909.6a40e1c0@slackpad.lan>
In-Reply-To: <20230911004909.6a40e1c0@slackpad.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 11 Sep 2023 21:35:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v66qXS1Yn8fCd9kbgf9mrbpa8A4q=px+0jAX5Z567oYAsg@mail.gmail.com>
Message-ID: <CAGb2v66qXS1Yn8fCd9kbgf9mrbpa8A4q=px+0jAX5Z567oYAsg@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, airlied@gmail.com, conor+dt@kernel.org, 
	daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai, jernej.skrabec@gmail.com, 
	krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, 
	neil.armstrong@linaro.org, noralf@tronnes.org, robh+dt@kernel.org, 
	sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 8:07=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Mon, 28 Aug 2023 13:19:41 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
>
> Hi Chris,
>
> thanks for the changes. As Samuel already pointed out, there is now a
> problem with the RTC...
>
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > The Anbernic RG-Nano is a small portable game device based on the
> > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > SoC.
> >
> > Working/Tested:
> > - SDMMC
> > - UART (for debugging)
> > - Buttons
> > - Charging/battery/PMIC
> > - Speaker
> > - RTC
> > - USB Host and Gadget*
> > - Display (at 60hz)
> >
> > *There is an issue with the usb_phy where it forces the device to host
> > mode. Until the phy driver is fixed this can be bypassed by either
> > removing the phy references from the ohci and ehci nodes or by setting
> > the usbphy on the ohci and ehci nodes to 1 (which is incorrect).
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
> >  2 files changed, 285 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-n=
ano.dts
> >
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/a=
llwinner/Makefile
> > index 589a1ce1120a..2be83a1edcbb 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >       sun8i-t113s-mangopi-mq-r-t113.dtb \
> >       sun8i-t3-cqa3t-bv3.dtb \
> >       sun8i-v3-sl631-imx179.dtb \
> > +     sun8i-v3s-anbernic-rg-nano.dtb \
> >       sun8i-v3s-licheepi-zero.dtb \
> >       sun8i-v3s-licheepi-zero-dock.dtb \
> >       sun8i-v40-bananapi-m2-berry.dtb
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts=
 b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > new file mode 100644
> > index 000000000000..bcccb0d3f9ce
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > @@ -0,0 +1,284 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include "sun8i-v3s.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +/ {
> > +     model =3D "Anbernic RG Nano";
> > +     compatible =3D "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     backlight: backlight {
> > +             compatible =3D "pwm-backlight";
> > +             brightness-levels =3D <0 1 2 3 8 14 21 32 46 60 80 100>;
> > +             default-brightness-level =3D <11>;
> > +             power-supply =3D <&reg_vcc5v0>;
> > +             pwms =3D <&pwm 0 40000 1>;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     gpio_keys: gpio-keys {
> > +             compatible =3D "gpio-keys";
> > +
> > +             button-a {
> > +                     gpios =3D <&gpio_expander 12 (GPIO_ACTIVE_LOW | G=
PIO_PULL_UP)>;
> > +                     label =3D "BTN-A";
> > +                     linux,code =3D <BTN_EAST>;
> > +             };
> > +
> > +             button-b {
> > +                     gpios =3D <&gpio_expander 14 (GPIO_ACTIVE_LOW | G=
PIO_PULL_UP)>;
> > +                     label =3D "BTN-B";
> > +                     linux,code =3D <BTN_SOUTH>;
> > +             };
> > +
> > +             button-down {
> > +                     gpios =3D <&gpio_expander 1 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "DPAD-DOWN";
> > +                     linux,code =3D <BTN_DPAD_DOWN>;
> > +             };
> > +
> > +             button-left {
> > +                     gpios =3D <&gpio_expander 4 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "DPAD-LEFT";
> > +                     linux,code =3D <BTN_DPAD_LEFT>;
> > +             };
> > +
> > +             button-right {
> > +                     gpios =3D <&gpio_expander 0 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "DPAD-RIGHT";
> > +                     linux,code =3D <BTN_DPAD_RIGHT>;
> > +             };
> > +
> > +             button-se {
> > +                     gpios =3D <&gpio_expander 7 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "BTN-SELECT";
> > +                     linux,code =3D <BTN_SELECT>;
> > +             };
> > +
> > +             button-st {
> > +                     gpios =3D <&gpio_expander 6 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "BTN-START";
> > +                     linux,code =3D <BTN_START>;
> > +             };
> > +
> > +             button-tl {
> > +                     gpios =3D <&gpio_expander 2 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "BTN-L";
> > +                     linux,code =3D <BTN_TL>;
> > +             };
> > +
> > +             button-tr {
> > +                     gpios =3D <&gpio_expander 15 (GPIO_ACTIVE_LOW | G=
PIO_PULL_UP)>;
> > +                     label =3D "BTN-R";
> > +                     linux,code =3D <BTN_TR>;
> > +             };
> > +
> > +             button-up {
> > +                     gpios =3D <&gpio_expander 3 (GPIO_ACTIVE_LOW | GP=
IO_PULL_UP)>;
> > +                     label =3D "DPAD-UP";
> > +                     linux,code =3D <BTN_DPAD_UP>;
> > +             };
> > +
> > +             button-x {
> > +                     gpios =3D <&gpio_expander 11 (GPIO_ACTIVE_LOW | G=
PIO_PULL_UP)>;
> > +                     label =3D "BTN-X";
> > +                     linux,code =3D <BTN_NORTH>;
> > +             };
> > +
> > +             button-y {
> > +                     gpios =3D <&gpio_expander 13 (GPIO_ACTIVE_LOW | G=
PIO_PULL_UP)>;
> > +                     label =3D "BTN-Y";
> > +                     linux,code =3D <BTN_WEST>;
> > +             };
> > +     };
> > +};
> > +
> > +&ccu {
> > +     clocks =3D <&osc24M>, <&osc32k>;
>
> Samuel already pointed that out: please don't change that.
>
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing =3D "Speaker", "HP",
> > +                               "MIC1", "Mic",
> > +                               "Mic", "HBIAS";
> > +     allwinner,pa-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP=
)>; /* PF6 */
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     gpio_expander: gpio@20 {
> > +             compatible =3D "nxp,pcal6416";
> > +             reg =3D <0x20>;
> > +             gpio-controller;
> > +             #gpio-cells =3D <2>;
> > +             #interrupt-cells =3D <2>;
> > +             interrupt-controller;
> > +             interrupt-parent =3D <&pio>;
> > +             interrupts =3D <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> > +             vcc-supply =3D <&reg_vcc3v3>;
> > +     };
> > +
> > +     axp209: pmic@34 {
> > +             reg =3D <0x34>;
> > +             interrupt-parent =3D <&pio>;
> > +             interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 =
*/
> > +     };
> > +
> > +     pcf8563: rtc@51 {
> > +             compatible =3D "nxp,pcf8563";
> > +             reg =3D <0x51>;
> > +     };
> > +};
> > +
> > +#include "axp209.dtsi"
> > +
> > +&battery_power_supply {
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     broken-cd;
> > +     bus-width =3D <4>;
> > +     disable-wp;
> > +     vmmc-supply =3D <&reg_vcc3v3>;
> > +     vqmmc-supply =3D <&reg_vcc3v3>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci {
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +     vcc-pb-supply =3D <&reg_vcc3v3>;
> > +     vcc-pc-supply =3D <&reg_vcc3v3>;
> > +     vcc-pf-supply =3D <&reg_vcc3v3>;
> > +     vcc-pg-supply =3D <&reg_vcc3v3>;
> > +
> > +     spi0_no_miso_pins: spi0-no-miso-pins {
> > +             pins =3D "PC1", "PC2", "PC3";
> > +             function =3D "spi0";
> > +     };
> > +};
> > +
> > +&pwm {
> > +     pinctrl-0 =3D <&pwm0_pin>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +};
> > +
> > +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> > +&reg_dcdc2 {
> > +     regulator-always-on;
> > +     regulator-max-microvolt =3D <1250000>;
> > +     regulator-min-microvolt =3D <1250000>;
> > +     regulator-name =3D "vdd-cpu";
> > +};
> > +
> > +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> > +&reg_dcdc3 {
> > +     regulator-always-on;
> > +     regulator-max-microvolt =3D <3300000>;
> > +     regulator-min-microvolt =3D <3300000>;
> > +     regulator-name =3D "vcc-io";
> > +};
> > +
> > +/*
> > + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> > + * software modified. Note that setting voltage here to 3.3v for accur=
acy
> > + * sake causes an issue with the driver that causes it to fail to prob=
e
> > + * because of a voltage constraint in the driver.
> > + */
> > +&reg_ldo1 {
> > +     regulator-always-on;
> > +     regulator-name =3D "vcc-rtc";
> > +};
> > +
> > +/* LDO2 wired into VCC-PLL and audio codec. */
> > +&reg_ldo2 {
> > +     regulator-always-on;
> > +     regulator-max-microvolt =3D <3000000>;
> > +     regulator-min-microvolt =3D <3000000>;
> > +     regulator-name =3D "vcc-pll";
> > +};
> > +
> > +/* LDO3, LDO4, and LDO5 unused. */
> > +&reg_ldo3 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&reg_ldo4 {
> > +     status =3D "disabled";
> > +};
> > +
> > +/* External RTC used instead, internal RTC runs fast. */
> > +&rtc {
> > +     status =3D "disabled";
>
> So as Samuel mentioned, I don't think you should disable the RTC, even
> if you have another RTC which provides more accurate time reading.
> On most Allwinner chips the RTC provides more than just the actual
> timekeeping functionality, as it also provides various derived clocks.
>
> So when you say the "internal RTC runs fast", that sounds like the
> board does not actually connect an external 32K crystal to the
> X32KIN/X32KOUT pins?
> So what happens if you remove the clocks property from the RTC node?
> If I read the code correctly, that should make the driver aware of the
> lack of a crystal, which might improve things?
> The manual seems to somewhat suggest that an external oscillator is
> mandatory - and we modelled the sun8i-v3s.dtsi base after that. Though
> I believe the RTC supports using the internal RC oscillator, and
> omitting the "clocks" property should make the driver switch the RTC
> over.
>
> This is at least my naive and quick interpretation of the code. I am
> not an Allwinner RTC expert though, so happy to hear Samuel's opinion.
>
> Regarding multiple RTCs: I didn't find anything which assigns a
> priority level to multiple RTCs in the system. What you can do on the
> userland side is to have a udev rule that links the PCF device to
> /dev/rtc, so that most tools would use that as a time source.

You can add DT aliases to override the numbering, thus making an external
one rtc0 and the internal one rtc1. See
arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts for such an example.

ChenYu

> Cheers,
> Andre
>
> > +};
> > +
> > +&spi0 {
> > +     pinctrl-0 =3D <&spi0_no_miso_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +
> > +     display@0 {
> > +             compatible =3D "saef,sftc154b", "panel-mipi-dbi-spi";
> > +             reg =3D <0>;
> > +             backlight =3D <&backlight>;
> > +             dc-gpios =3D <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> > +             reset-gpios =3D <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> > +             spi-max-frequency =3D <100000000>;
> > +
> > +             height-mm =3D <39>;
> > +             width-mm =3D <39>;
> > +
> > +             /* Set hb-porch to compensate for non-visible area */
> > +             panel-timing {
> > +                     hactive =3D <240>;
> > +                     vactive =3D <240>;
> > +                     hback-porch =3D <80>;
> > +                     vback-porch =3D <0>;
> > +                     clock-frequency =3D <0>;
> > +                     hfront-porch =3D <0>;
> > +                     hsync-len =3D <0>;
> > +                     vfront-porch =3D <0>;
> > +                     vsync-len =3D <0>;
> > +             };
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-0 =3D <&uart0_pb_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +     dr_mode =3D "otg";
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_power_supply {
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +     usb0_id_det-gpios =3D <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>=
; /* PG5 */
> > +     status =3D "okay";
> > +};
>
