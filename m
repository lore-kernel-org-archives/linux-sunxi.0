Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2A1A288
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988957; cv=none; b=qr+4rTyNJS74XFdlqcKN6pV0OhXpMedzidc+GKEQNcedRQsPCke9yxor/B9PdUXHiCtnDv03DC43Tfcsws7XeYVo2SIqJitJzOXpjjLh6KBNVZurg+AJjvigKG0CkFGKA6+5+4UFY0M0rz5szQbP18tWamh6orYSq5Zb5h8Tf4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988957; c=relaxed/simple;
	bh=9Fb3JLUd/WRTit2fKpWyB3ot9ArOKIRITeURuDJEQRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f99N59j84tSM+WP9aGEMeKv9PcFD6oDzQ4PwWA0/3E5jkY1KdQIb9aTeRJumt3hZccdkm851gwb3Zy1y/cApPBz2D8oeXL5hnbQO3Bn7aI0/eFllXbq3LqQN1nF5xHQ3J+9uRHRI7W+kCvBoWMrNorooovrhh1BDHmXaOt71BYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4819814e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 08:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751988950; x=1752593750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cET3jObhGhC9pd3hp1ldy8l2+nMGUvt7YDcBuTcsUA0=;
        b=S17KaJ/hxfbo6+ArV4V10RrQAblHqIELioCyvus0EdE1L8Pf+jTKEpN8CdRzKzuU97
         bLqTZHB+i2SZJgMjqlt5ZFOWD1RZslIYDchgIEBW8j3JAMyXIF81z49CNVtLZW6mmPFN
         +s2SosXOj86a8hro8dKH2ZwnSZ4mBdiLKNUOzsi5VqU6xM2G17IhVNj3XCXSOC0jbvYP
         +1165tM5apyws2shJIQDOhO/B7S+aHFpbsQ4Gi6vUEnKPgiiHVUXXmHp+mC6m36+42Jw
         Snezmrr2Kg4DXYq+59Xf7RO+kf371E6P4BmoL6OQs7m8jfsIVVp2GmU8HQc1bep+vU6+
         TtSw==
X-Forwarded-Encrypted: i=1; AJvYcCXm1lSWY9A3ynNov+dSuzIWQw98G++Hy77TBq251EjtrBvkfeuKjhI7mSRduorOqWShzvauiT70jbgLbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySSf2LMePzNwa3htV/7Wxhu0Tlsnzf8PrechIKscuBZ1Pn8ghm
	S7TPCRJ/Sfm8kDDEZrMc+wzJjVI0E7pC0lgjspWyRRZ1jsVpIbIQQjf9ECNTnkZuoNA=
X-Gm-Gg: ASbGncsvjI7zagA5u42TeqkxARPcN+lgk5CRxo6tdvDkghq1zAdyG1F/uyYuMH9oKqQ
	3a6oc+CWaEF9o76+Z92iXLrD+igwvyqvs/Jr0ozuAEt37Jt0oMA+MXfAKeLLknERCq3naiqoV7N
	xaikC0DY0xcIieURM8ZV+tYMfsQkn7AoRW/fz3RZGsLWwQGnJO8PMpywHVhOIlzBJms79smvMql
	0IK+uYBY0k/tRebpZJ9BBhEk5XrTBVt5NhZi+ve5HwaDvvYeBcJh9pguyFe2H9+e9OTV27DTlqT
	PnJY3y+S/9haIIOzHQAOEw1HFA2shNXSCc53U+f4gczPU0813VuSR3wJ0h0RSRGmy6qQG8mqdJg
	i761mera4+wKzBzvKaRg=
X-Google-Smtp-Source: AGHT+IFM8uRSm/xnBIiMGJw84HIOBKo49R0C1yz9Ai/jGJ/f3XKN+SQi6Ni1MbZFY4e9mzOL3eTtrg==
X-Received: by 2002:a05:6512:224e:b0:553:37da:2bad with SMTP id 2adb3069b0e04-557f836e4ffmr1321083e87.38.1751988949971;
        Tue, 08 Jul 2025 08:35:49 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c485esm1693443e87.232.2025.07.08.08.35.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 08:35:47 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b595891d2so34769951fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 08:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmTaG8WCrLvBN/OUNwNBwiOUy8voJ4E3HKasph5hDp9GooICkcSf60CjwhX124bRq35Q3WUohO4Aocpg==@lists.linux.dev
X-Received: by 2002:a2e:8e3c:0:b0:32f:1c0f:fb74 with SMTP id
 38308e7fff4ca-32f39b2409amr12043771fa.22.1751988946848; Tue, 08 Jul 2025
 08:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-4-lukas.schmid@netcube.li> <20250708002205.70ec9097@minigeek.lan>
 <3700020.R56niFO833@lukas-hpz440workstation>
In-Reply-To: <3700020.R56niFO833@lukas-hpz440workstation>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 23:35:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66U+EOtoSGnidSj99eHRuJ5cNNvyiXZgrNHRTxA9tQ31w@mail.gmail.com>
X-Gm-Features: Ac12FXy2b3ug2Nx7hYcRFPu4coJNNKjGD_uoNgiL2GNaAFUP-Gc_JmvX8AQlazg
Message-ID: <CAGb2v66U+EOtoSGnidSj99eHRuJ5cNNvyiXZgrNHRTxA9tQ31w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 11:19=E2=80=AFPM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> On Dienstag, 8. Juli 2025 01:22:05 CEST Andre Przywara wrote:
> > On Mon,  7 Jul 2025 20:44:15 +0200
> > Lukas Schmid <lukas.schmid@netcube.li> wrote:
> >
> Hi Andre,
>
> > Hi Lukas,
> >
> > please try to refrain from sending subsequent patches too quickly, that
> > might just put off and confuse reviewers. To acknowledge a change
> > request, it is probably sufficient to just reply to the mail with a
> > confirmation.
>
> Sorry about that. I'm still trying to get the hang of this whole "submitt=
ing
> patches" thing. What is a good time/reason to send the next revision/vers=
ion
> of a patchset?
>
> >
> > > NetCube Systems Nagami SoM is a module based around the Allwinner T11=
3s
> > > SoC. It includes the following features and interfaces:
> > >
> > > - 128MB DDR3 included in SoC
> > > - 10/100 Mbps Ethernet using LAN8720A phy
> > > - One USB-OTG interface
> > > - One USB-Host interface
> > > - One I2S interface with in and output support
> > > - Two CAN interfaces
> > > - ESP32 over SDIO
> > > - One SPI interface
> > > - I2C EEPROM for MAC address
> > > - One QWIIC I2C Interface with dedicated interrupt pin shared with EE=
PROM
> > > - One external I2C interface
> > > - SD interface for external SD-Card
> > >
> > > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > > ---
> > >
> > >  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 233 ++++++++++++++++=
++
> > >  1 file changed, 233 insertions(+)
> > >  create mode 100644
> > >  arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi>
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.d=
tsi
> > > b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi new fil=
e
> > > mode 100644
> > > index 000000000..0db867b47
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> > > @@ -0,0 +1,233 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "sun8i-t113s.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +/ {
> > > +   model =3D "NetCube Systems Nagami SoM";
> > > +   compatible =3D "netcube,nagami", "allwinner,sun8i-t113s";
> > > +
> > > +   aliases {
> > > +           serial1 =3D &uart1; // ESP32 Bootloader UART
> > > +           serial3 =3D &uart3; // Console UART on Card Edge
> > > +           ethernet0 =3D &emac;
> > > +   };
> > > +
> > > +   chosen {
> > > +           stdout-path =3D "serial3:115200n8";
> > > +   };
> > > +
> > > +   /* module wide 3.3V supply directly from the card edge */
> > > +   reg_vcc3v3: regulator-3v3 {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "vcc-3v3";
> > > +           regulator-min-microvolt =3D <3300000>;
> > > +           regulator-max-microvolt =3D <3300000>;
> > > +           regulator-always-on;
> > > +   };
> > > +
> > > +   /* SY8008 DC/DC regulator on the board, also supplying VDD-SYS */
> > > +   reg_vcc_core: regulator-core {
> > > +           compatible =3D "regulator-fixed";
> > > +           regulator-name =3D "vcc-core";
> > > +           regulator-min-microvolt =3D <880000>;
> > > +           regulator-max-microvolt =3D <880000>;
> > > +           vin-supply =3D <&reg_vcc3v3>;
> > > +   };
> > > +};
> > > +
> > > +&cpu0 {
> > > +   cpu-supply =3D <&reg_vcc_core>;
> > > +};
> > > +
> > > +&cpu1 {
> > > +   cpu-supply =3D <&reg_vcc_core>;
> > > +};
> > > +
> > > +&dcxo {
> > > +   clock-frequency =3D <24000000>;
> > > +};
> > > +
> > > +&emac {
> > > +   nvmem-cells =3D <&eth0_macaddress>;
> > > +   nvmem-cell-names =3D "mac-address";
> > > +   phy-handle =3D <&lan8720a>;
> > > +   phy-mode =3D "rmii";
> > > +   pinctrl-0 =3D <&rmii_pe_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Exposed as I2C on the card edge */
> > > +&i2c2 {
> > > +   pinctrl-0 =3D <&i2c2_pins>;
> > > +   pinctrl-names =3D "default";
> >
> > I wonder if this belongs here. In general we don't describe
> > pins/devices that are on generic connectors (like pin headers), because
> > the connection is determined by the user, not by the board.
> > In this case PD20 and PD21 could be used as generic GPIOs or as PWMs.
> > IIUC, even for the basic carrier those pins end up on headers, so even
> > there I wouldn't describe it. On the keypad carrier it's of course a
> > different story, since the MCP23008 is apparently soldered there.
>
> I get that part. However the module's description (as of yet unreleased)
> specifies those pins for this exact function as they are meant to be avai=
lable
> on our modules using the same connector but other CPU/SoC. The Module's s=
tate
> that this is the default option but other function's can be reconfigured =
or
> they can be used as IO.
>
> If it's an issue I can remove those here, but I would still add them into=
 the
> basic carrier as, even though they are only pin header, they are marked w=
ith
> the dedicated function of said pin. For example the headers there are
> specifically for "SPI", "I2S", "I2C" and the SD-Card slot.

For dedicated but otherwise unpopulated pins, we have in the past have
everything described as you already have, but with an explicit

    status =3D "disabled";

along with a comment stating that it is normally unpopulated and up to the
end user to enable if they intend to use it. You can see examples of this
in the dts files of the Pine64.

I wouldn't say it's a preference, but it's been done for some development
boards.


ChenYu

> >
> > > +};
> > > +
> > > +/* Exposed as the QWIIC connector and used by the internal EEPROM */
> > > +&i2c3 {
> > > +   pinctrl-0 =3D <&i2c3_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +
> > > +   eeprom0: eeprom@50 {
> > > +           compatible =3D "atmel,24c02";             /*
> actually it's a 24AA02E48 */
> > > +           reg =3D <0x50>;
> > > +           pagesize =3D <16>;
> > > +           read-only;
> > > +           vcc-supply =3D <&reg_vcc3v3>;
> > > +
> > > +           #address-cells =3D <1>;
> > > +           #size-cells =3D <1>;
> > > +
> > > +           eth0_macaddress: macaddress@fa {
> > > +                   reg =3D <0xfa 0x06>;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +/* Exposed as I2S on the card edge */
> > > +&i2s1 {
> > > +   pinctrl-0 =3D <&i2s1_pins>, <&i2s1_din_pins>, <&i2s1_dout_pins>;
> > > +   pinctrl-names =3D "default";
> >
> > Same story here, what prevents a user from using those edge pins as
> > GPIO or PWM?
> >
> > > +};
> > > +
> > > +/* Phy is on SoM. MDI signals pre-magentics are on the card edge */
> > > +&mdio {
> > > +   lan8720a: ethernet-phy@0 {
> > > +           compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +           reg =3D <0>;
> > > +   };
> > > +};
> > > +
> > > +/* Exposed as SD on the card edge */
> > > +&mmc0 {
> > > +   pinctrl-0 =3D <&mmc0_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   broken-cd;
> > > +   disable-wp;
> > > +   bus-width =3D <4>;
> > > +};
> >
> > I think this node doesn't belong into the SoM .dtsi, as many details
> > are not set here, but on the carrier board: card detect, write protect,
> > Vmmc supply, and even bus width (could be 1 as well). So please move
> > this node to where the SD card connector sits. You might want to keep
> > the pinctrl nodes in here.
>
> Totally agree here, I will move this definition to the basic carrier, as =
it's
> currently the only one with the SD-Interface connected. However my questi=
on
> from above about the default function still applies here.
> >
> > > +
> > > +/* Connected to the on-board ESP32 */
> > > +&mmc1 {
> > > +   pinctrl-0 =3D <&mmc1_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   bus-width =3D <4>;
> > > +   non-removable;
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Connected to the on-board eMMC */
> > > +&mmc2 {
> > > +   pinctrl-0 =3D <&mmc2_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   vmmc-supply =3D <&reg_vcc3v3>;
> > > +   vqmmc-supply =3D <&reg_vcc3v3>;
> > > +   bus-width =3D <4>;
> > > +   non-removable;
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +&pio {
> > > +   vcc-pb-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pc-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pd-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pe-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pf-supply =3D <&reg_vcc3v3>;
> > > +   vcc-pg-supply =3D <&reg_vcc3v3>;
> > > +
> > > +   gpio-line-names =3D "", "", "", "", // PA
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "CAN0_TX",
> "CAN0_RX", // PB
> > > +                                     "CAN1_TX",
> "CAN1_RX", "UART3_TX", "UART3_RX",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "eMMC_CLK",
> "eMMC_CMD", // PC
> > > +                                     "eMMC_D2",
> "eMMC_D1", "eMMC_D0", "eMMC_D3",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "", //
> PD
> > > +                                     "", "", "", "",
> > > +                                     "", "", "SPI1_CS",
> "SPI1_CLK",
> > > +                                     "SPI1_MOSI",
> "SPI1_MISO", "SPI1_HOLD", "SPI1_WP",
> > > +                                     "PD16", "", "", "",
> > > +                                     "I2C2_SCL",
> "I2C2_SDA", "PD22", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "ETH_CRSDV",
> "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
> > > +                                     "ETH_TXD0",
> "ETH_TXD1", "ETH_TXEN", "",
> > > +                                     "ETH_MDC",
> "ETH_MDIO", "QWIIC_nINT", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "SD_D1", "SD_D0",
> "SD_CLK", "SD_CLK", // PF
> > > +                                     "SD_D3", "SD_D2",
> "PF6", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "ESP_CLK",
> "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> > > +                                     "ESP_D2", "ESP_D3",
> "UART1_TXD", "UART1_RXD",
> > > +                                     "ESP_nBOOT",
> "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
> > > +                                     "I2S1_WS",
> "I2S1_CLK", "I2S1_DIN0", "I2S1_DOUT0",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "",
> > > +                                     "", "", "", "";
> > > +};
> > > +
> > > +/* Remove the unused CK pin from the pinctl as it is unconnected */
> > > +&rmii_pe_pins {
> > > +   pins =3D "PE0", "PE1", "PE2", "PE3", "PE4",
> > > +              "PE5", "PE6", "PE8", "PE9";
> > > +};
> > > +
> > > +/* Exposed as SPI on the card-edge */
> > > +&spi1 {
> > > +   #address-cells =3D <1>;
> > > +   #size-cells =3D <0>;
> > > +   pinctrl-0 =3D <&spi1_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   cs-gpios =3D <0>;
> > > +};
> >
> > I wonder if this belongs here as well, since it's again just generic
> > edge pins.
>
> Same here too
> >
> > Cheers,
> > Andre
> >
> > > +
> > > +/* Connected to the Bootloader/Console of the ESP32 */
> > > +&uart1 {
> > > +   pinctrl-0 =3D <&uart1_pg6_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +/* Exposed as the Console/Debug UART on the card-edge */
> > > +&uart3 {
> > > +   pinctrl-0 =3D <&uart3_pb_pins>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
>
