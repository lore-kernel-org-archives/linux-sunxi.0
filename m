Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECFF5C910
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Jan 2024 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+lkhS0I"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dc83674972so3596672a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Jan 2024 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705044136; x=1705648936; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcARCTRgIQ3guI0dOLOiWrabrdOmuRQDbQ+BlvFSM8g=;
        b=I+lkhS0I+agZwf6rEGxF33dJPe3En7Jz+IrfPeSU5arwa0+l4fXHZixaeRfKnX6UYw
         yGgUNMeRB8pL248wp2QGiygndqWDtQeVtk/w6HN/gB5d5mNJGUiBgxDp8zUEWjlenW04
         y/+2nlZNvP1QU3HFf6DjLmMJ9MYIekBIqXeXNMRDQ83UbDDmyvd7wwEeVo5WNdEyJvlx
         HV83BWOJGxO5GkGaIRBWOP06YWek9xYF6ybZwCrPuRBBVU3SnoWEZ387GcRDlkU/7SOD
         geSvieJPywNgOuge3+O2ASQmkVZONs8riE2KsZganQAC3alEUUL7Eo5DvTqJHT1nyfAI
         8y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705044136; x=1705648936;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcARCTRgIQ3guI0dOLOiWrabrdOmuRQDbQ+BlvFSM8g=;
        b=bPmw4U1EHmRjBJw+RPnvXE+7XibEno7C7Pi3tyYdWdcYvxJ09k0Y+50fBwv+2UQlFS
         xATTSnAnNAKAw8N7koanUWz7KIC4QBS6NozbpAONmtmmvEL7ER4WNfHGc6UtA9X7Yi3u
         l71feqk/2IqwphCrLBDWs1/SfuKZzS+grOXdzYEaMmuW7nTz+fBdNCkBWA/p6kf7cPQj
         tT3wW/zbiuWK7Qrt9pqnw1jPlxZPazJievOugOSVYFpY2EO2xSMRuvnMW4XCTFpjQBCc
         ztMtAej8IfI6OpBRWc4swcTblD+ibGssTUgjez55Iu8SYxoi+pSEimqjyn+l+Omv4jHG
         HmLg==
X-Gm-Message-State: AOJu0YwVLUOmX6TEAC7TW7m35VJ5i7sVJPHAVTvYCg5WDvKMRNBZG2Af
	qxOdgQJ5FmHeVu5kZOWN8wPaQarDfgEhvWyXddODSCTxYrY=
X-Google-Smtp-Source: AGHT+IEwmuQrcQuRl2IXAFCpIOvkStW0HhTdXJU0jl9kA1g7ndr4RiZKmYCsVnnK9w99YWun0rhreZgvTrHWYU0QN6I=
X-Received: by 2002:a05:6830:1b67:b0:6dd:e778:881a with SMTP id
 d7-20020a0568301b6700b006dde778881amr1058929ote.70.1705044136274; Thu, 11 Jan
 2024 23:22:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKoaSuT7Juvff7Rt8TDmAof9sOZ-C_okTY34s4rkLZ+7Jt=X8Q@mail.gmail.com>
 <20231221171422.0efaa8af@donnerap.manchester.arm.com>
In-Reply-To: <20231221171422.0efaa8af@donnerap.manchester.arm.com>
From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCc0L7RgdC+0LvQvtCy?= <mosolovs1987@gmail.com>
Date: Fri, 12 Jan 2024 11:22:04 +0400
Message-ID: <CAKoaSuQOsfQOQf-aw=_Rn-hEeJ41aHFhQ4VM4qcs934KCpp+Wg@mail.gmail.com>
Subject: Re: [linux-sunxi] Allwinner A40i USB-OTG host GPIO pin ID interrupt
 doesn't run handler
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(just mentioned that another mailing list was added, I'm not sure what
I'm doing but I've resend the message to <linux-sunxi@lists.linux.dev>
in case that it can help anyone else, excuse me please for duplicate
email, googlegroups ui too complicated for me but it looks like
response from googlegroups from webui was sended only to
linux-sunxi@googlegroups.com ignoring <linux-sunxi@lists.linux.dev>
email)

Hi Andre!

Thanks for sharing that info.

Actually the problem was that the GPIO interrupts not working, there
just no irq 60 (PIO) generated for some reason at all, at any EXTI
PIN.

After conforming to recommendation in A40i datasheet:
"(24).A 10MOhm resister is connected in parallel between X32KOUT and
X32KIN, the resistor can create negative feedback in an inverter to
ensure amplifier in linear amplifier region."
GPIO interrupts start working and, in particular, USB OTG PIN
correctly detects Host or Client connected. I've used mentioned above:
https://github.com/wirenboard/linux/blob/dev/v5.10.y/drivers/phy/allwinner/=
phy-sun4i-usb.c
and during quick test it looks to me that USB OTG is fully worked now.

Bye, wish you all the best! Thanks again!


On Thu, Dec 21, 2023 at 9:14=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 21 Dec 2023 11:24:57 +0400
> =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=9C=D0=BE=D1=81=D0=BE=D0=BB=D0=BE=
=D0=B2 <mosolovs1987@gmail.com> wrote:
>
> (adding the proper sunxi mailing list for a wider audience)
>
> Hi Sergej,
>
> > I kindly ask for an advice about interrupt working with USB-OTG usb0 on
> > Allwinner A40i.
> > I need to make work usb0 as USB-OTG.
> >
> > Looks like it's possible somehow:
> > https://lore.kernel.org/linux-arm-kernel/daf5c543-a1d1-04d2-6486-6cc9cd=
72d8e5@sholland.org/T/#md5e9ce01feb201041467c136f09e80628f414557
> >
> > I've used usb-phy driver with support of muxing ohci0(host) and
> > usb0(client) on usb0 pins, mentioned in the link above:
> > https://github.com/wirenboard/linux/blob/dev/v5.10.y/drivers/phy/allwin=
ner/phy-sun4i-usb.c
>
> some good checking and detective work!
>
> I am afraid the problem is somewhere deeper, though, in the way our sunxi
> PHY interacts with the OTG framework. I actually believe it's broken
> for every Allwinner system at the moment. Some months ago I spent some
> time in the code, and it looks like there is some race between the
> OHCI/EHCI controllers and the MUSB controller for the PHY. Both the MUSB
> and the HCI drivers claim the PHY and set their preferred mode (OTG and
> host, respectively), but if I remember correctly, the HCI driver always
> wins, regardless of the order. I can't remember exactly, but I think the
> problem was in sun4i_usb_phy_set_mode. You can try to insert debug
> messages there to see what's going on.
> The short summary at the moment seems to be: forcing the mode (peripheral
> or host) works, but the dynamic switching does not.
>
> You might want to try disabling the ehci0/ohci0 nodes, as a quick check, =
to
> see if that improves thing. I haven't tried that, though, as doing so is
> not correct and breaks U-Boot.
> Also keep an eye on the interrupt counter in /proc/interrupts, you should
> see some non-zero number if you connect and disconnect the cable a few
> times. But if the PHY is in host mode, then it won't activate the IRQ, I
> believe.
>
> =D0=9F=D0=BE=D0=BA=D0=B0,
> Andre
>
> > In my case I have pin ID USB OTG =3D PI11.
> >
> > Some excerpts from my dts file:
> > [quote]
> > / {
> > ...
> >    /* ohci0 and ehci0 need to be included to work with USB OTG */
> >    ohci0: usb@1c14400 {
> >       compatible =3D "allwinner,sun8i-r40-ohci", "generic-ohci";
> >       reg =3D <0x01c14400 0x100>;
> >       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> >       clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> >           <&ccu CLK_USB_OHCI0>;
> >       resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> >       status =3D "okay";
> >    };
> >
> >    ehci0: usb@1c14000 {
> >       compatible =3D "allwinner,sun8i-r40-ehci", "generic-ehci";
> >       reg =3D <0x01c14000 0x100>;
> >       interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> >       clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> >       resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
> >       status =3D "okay";
> >    };
> > ...
> > }
> > ...
> > &usb_otg {
> > /* =D0=B2 dtsi defines of usb_otg as dr_mode =3D "peripheral"; */
> >    status =3D "okay";
> > };
> >
> > &usbphy {
> >    dr_mode =3D "otg";
> >    usb0_id_det-gpios =3D <PIN_PI 11 GPIO_ACTIVE_HIGH>;
> >    usb0_vbus-supply =3D <&reg_vcc5v0>;
> >    status =3D "okay";
> > };
> > [/quote]
> >
> > USB-OTG works, but the problem is USB-OTG reads pin ID and choose clien=
t or
> > host only on OS startup once.
> >
> > After adding many printk and -DDEBUG for several subsystems it seems to=
 me
> > that the problem is PI11 GPIO irq just doesn't run it's handler request=
ed
> > here:
> > https://github.com/wirenboard/linux/blob/dev/v5.10.y/drivers/phy/allwin=
ner/phy-sun4i-usb.c#L951
> >
> > I observed EINT23 registration in pinctrl sunxi driver:
> > [quote]
> > [   11.578919] sun4i-pinctrl 1c20800.pinctrl: 1c20800.pinctrl: request =
IRQ
> > for GPIO 267, return 23
> > [   11.587657] devm_request_irq data->id_det_irq: 74, ret: 0
> >
> >  74:          0          0          0          0  sunxi_pio_edge  23 Ed=
ge
> >    usb0-id-det
> >
> > # cat /proc/interrupts
> >            CPU0       CPU1       CPU2       CPU3
> >  26:          0          0          0          0     GICv2  54 Level
> > timer@1c20c00
> >  27:          0          0          0          0     GICv2  29 Level
> > arch_timer
> >  28:     198416      45783      21540      10341     GICv2  30 Level
> > arch_timer
> >  31:          0          0          0          0     GICv2 152 Level
> > arm-pmu
> >  32:          0          0          0          0     GICv2 153 Level
> > arm-pmu
> >  33:          0          0          0          0     GICv2 154 Level
> > arm-pmu
> >  34:          0          0          0          0     GICv2 155 Level
> > arm-pmu
> >  35:          0          0          0          0     GICv2  59 Level
> > 1c02000.dma-controller
> >  37:          0          0          0          0     GICv2 102 Level
> > gpmmu
> >  38:          0          0          0          0     GICv2 104 Level
> > ppmmu0
> >  39:          0          0          0          0     GICv2 107 Level
> > ppmmu1
> >  40:        175          0          0          0     GICv2 101 Level   =
  gp
> >  41:        128          0          0          0     GICv2 103 Level   =
  pp0
> >  42:        128          0          0          0     GICv2 106 Level   =
  pp1
> >  43:          0          0          0          0     GICv2  71 Level
> > ehci_hcd:usb1
> >  44:          0          0          0          0     GICv2  72 Level
> > ohci_hcd:usb2
> >  45:       1289          0          0          0     GICv2  61 Level
> > sun4i-ts
> >  46:          0          0          0          0     GICv2  56 Level
> > 1c20400.rtc
> >  47:          0          0          0          0     GICv2 125 Level
> > 1400000.deinterlace
> >  48:          0          0          0          0     GICv2 126 Level
> > sun8i-ce-ns
> >  49:          0          0          0          0     GICv2  85 Level
> > 1c0e000.video-codec
> >  74:          0          0          0          0  sunxi_pio_edge  23 Ed=
ge
> >    usb0-id-det
> >  83:         28          0          0          0     GICv2  33 Level
> > ttyS0
> >  84:          0          0          0          0     GICv2  44 Level
> > sun6i-spi
> >  85:      80306          0          0          0     GICv2  39 Level
> > mv64xxx_i2c
> >  86:          0          0          0          0  sunxi-nmi   0 Level
> > axp22x_irq_chip
> > 109:          0          0          0          0  axp22x_irq_chip  22 E=
dge
> >      axp20x-pek-dbr
> > 110:          0          0          0          0  axp22x_irq_chip  23 E=
dge
> >      axp20x-pek-dbf
> > 113:          0          0          0          0     GICv2  40 Level
> > mv64xxx_i2c
> > 114:          0          0          0          0     GICv2  41 Level
> > mv64xxx_i2c
> > 115:          0          0          0          0     GICv2 120 Level
> > mv64xxx_i2c
> > 116:          0          0          0          0     GICv2 121 Level
> > mv64xxx_i2c
> > 117:          0          0          0          0     GICv2 129 Level
> > tvd0
> > 118:          0          0          0          0     GICv2 130 Level
> > tvd1
> > 119:          0          0          0          0     GICv2 131 Level
> > tvd2
> > 120:          0          0          0          0     GICv2 132 Level
> > tvd3
> > 121:      10281          0          0          0     GICv2  68 Level   =
  ths
> > 122:        245          0          0          0     GICv2  66 Level
> > sunxi-mmc
> > 123:       5690          0          0          0     GICv2  64 Level
> > sunxi-mmc
> > 129:          0          0          0          0     GICv2  88 Level
> > ahci-sunxi[1c18000.sata]
> > 130:     168336          0          0          0     GICv2  87 Level
> > eth0
> > 131:      81204          0          0          0     GICv2 117 Level
> > eth1
> > 132:        401          0          0          0     GICv2  70 Level
> > musb-hdrc.2.auto
> > 133:          0          0          0          0     GICv2  96 Level
> > ohci_hcd:usb3
> > 134:          0          0          0          0     GICv2  97 Level
> > ohci_hcd:usb4
> > 135:       9114          0          0          0     GICv2  76 Level
> > 1c71000.lcd-controller
> > 136:      13939          0          0          0     GICv2  83 Level
> > 1c73000.lcd-controller
> > 137:        515          0          0          0     GICv2  90 Level
> > 1ee0000.hdmi
> > 138:          0          0          0          0     GICv2 110 Level
> > ehci_hcd:usb5
> > 139:          0          0          0          0     GICv2 108 Level
> > ehci_hcd:usb6
> > IPI0:          0          0          0          0  CPU wakeup interrupt=
s
> > IPI1:          0          0          0          0  Timer broadcast
> > interrupts
> > IPI2:         71         81        134        106  Rescheduling interru=
pts
> > IPI3:       5850      17893       6323       6836  Function call interr=
upts
> > IPI4:          0          0          0          0  CPU stop interrupts
> > IPI5:      16353       2205       1054        417  IRQ work interrupts
> > IPI6:          0          0          0          0  completion interrupt=
s
> > Err:          0
> > [/quote]
> >
> > I've reconfigured PI11 as GPIO and I've observed change of input state =
on
> > USB-OTG cable.
> > External interrupt is possible on PI11 - PI11/SPI0_CLK/UART5_RX/EINT23 =
-
> > everything else is turned of like spi0 or routed to different pins as u=
art5.
> >
> > Link to syslog excerpts and dts with dtsi:
> > https://disk.yandex.ru/d/0H5tnCl1qQIE2g
> >
> > I really appreciate an advice with links to how debug that.
> >
> > Please, notify my if I can provide some additional info.
> >
>
