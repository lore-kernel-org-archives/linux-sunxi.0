Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A2859910
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA1F2F4;
	Thu, 21 Dec 2023 09:15:10 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24F153F5A1;
	Thu, 21 Dec 2023 09:14:25 -0800 (PST)
Date: Thu, 21 Dec 2023 17:14:22 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?0KHQtdGA0LPQtdC5INCc0L7RgdC+0LvQvtCy?=
 <mosolovs1987@gmail.com>
Cc: linux-sunxi@googlegroups.com, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>
Subject: Re: [linux-sunxi] Allwinner A40i USB-OTG host GPIO pin ID interrupt
 doesn't run handler
Message-ID: <20231221171422.0efaa8af@donnerap.manchester.arm.com>
In-Reply-To: <CAKoaSuT7Juvff7Rt8TDmAof9sOZ-C_okTY34s4rkLZ+7Jt=X8Q@mail.gmail.com>
References: <CAKoaSuT7Juvff7Rt8TDmAof9sOZ-C_okTY34s4rkLZ+7Jt=X8Q@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Dec 2023 11:24:57 +0400
=D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =D0=9C=D0=BE=D1=81=D0=BE=D0=BB=D0=BE=
=D0=B2 <mosolovs1987@gmail.com> wrote:

(adding the proper sunxi mailing list for a wider audience)

Hi Sergej,

> I kindly ask for an advice about interrupt working with USB-OTG usb0 on
> Allwinner A40i.
> I need to make work usb0 as USB-OTG.
>=20
> Looks like it's possible somehow:
> https://lore.kernel.org/linux-arm-kernel/daf5c543-a1d1-04d2-6486-6cc9cd72=
d8e5@sholland.org/T/#md5e9ce01feb201041467c136f09e80628f414557
>=20
> I've used usb-phy driver with support of muxing ohci0(host) and
> usb0(client) on usb0 pins, mentioned in the link above:
> https://github.com/wirenboard/linux/blob/dev/v5.10.y/drivers/phy/allwinne=
r/phy-sun4i-usb.c

some good checking and detective work!

I am afraid the problem is somewhere deeper, though, in the way our sunxi
PHY interacts with the OTG framework. I actually believe it's broken
for every Allwinner system at the moment. Some months ago I spent some
time in the code, and it looks like there is some race between the
OHCI/EHCI controllers and the MUSB controller for the PHY. Both the MUSB
and the HCI drivers claim the PHY and set their preferred mode (OTG and
host, respectively), but if I remember correctly, the HCI driver always
wins, regardless of the order. I can't remember exactly, but I think the
problem was in sun4i_usb_phy_set_mode. You can try to insert debug
messages there to see what's going on.
The short summary at the moment seems to be: forcing the mode (peripheral
or host) works, but the dynamic switching does not.

You might want to try disabling the ehci0/ohci0 nodes, as a quick check, to
see if that improves thing. I haven't tried that, though, as doing so is
not correct and breaks U-Boot.
Also keep an eye on the interrupt counter in /proc/interrupts, you should
see some non-zero number if you connect and disconnect the cable a few
times. But if the PHY is in host mode, then it won't activate the IRQ, I
believe.

=D0=9F=D0=BE=D0=BA=D0=B0,
Andre

> In my case I have pin ID USB OTG =3D PI11.
>=20
> Some excerpts from my dts file:
> [quote]
> / {
> ...
>    /* ohci0 and ehci0 need to be included to work with USB OTG */
>    ohci0: usb@1c14400 {
>       compatible =3D "allwinner,sun8i-r40-ohci", "generic-ohci";
>       reg =3D <0x01c14400 0x100>;
>       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>       clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
>           <&ccu CLK_USB_OHCI0>;
>       resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
>       status =3D "okay";
>    };
>=20
>    ehci0: usb@1c14000 {
>       compatible =3D "allwinner,sun8i-r40-ehci", "generic-ehci";
>       reg =3D <0x01c14000 0x100>;
>       interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>       clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
>       resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
>       status =3D "okay";
>    };
> ...
> }
> ...
> &usb_otg {
> /* =D0=B2 dtsi defines of usb_otg as dr_mode =3D "peripheral"; */
>    status =3D "okay";
> };
>=20
> &usbphy {
>    dr_mode =3D "otg";
>    usb0_id_det-gpios =3D <PIN_PI 11 GPIO_ACTIVE_HIGH>;
>    usb0_vbus-supply =3D <&reg_vcc5v0>;
>    status =3D "okay";
> };
> [/quote]
>=20
> USB-OTG works, but the problem is USB-OTG reads pin ID and choose client =
or
> host only on OS startup once.
>=20
> After adding many printk and -DDEBUG for several subsystems it seems to me
> that the problem is PI11 GPIO irq just doesn't run it's handler requested
> here:
> https://github.com/wirenboard/linux/blob/dev/v5.10.y/drivers/phy/allwinne=
r/phy-sun4i-usb.c#L951
>=20
> I observed EINT23 registration in pinctrl sunxi driver:
> [quote]
> [   11.578919] sun4i-pinctrl 1c20800.pinctrl: 1c20800.pinctrl: request IRQ
> for GPIO 267, return 23
> [   11.587657] devm_request_irq data->id_det_irq: 74, ret: 0
>=20
>  74:          0          0          0          0  sunxi_pio_edge  23 Edge
>    usb0-id-det
>=20
> # cat /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3
>  26:          0          0          0          0     GICv2  54 Level
> timer@1c20c00
>  27:          0          0          0          0     GICv2  29 Level
> arch_timer
>  28:     198416      45783      21540      10341     GICv2  30 Level
> arch_timer
>  31:          0          0          0          0     GICv2 152 Level
> arm-pmu
>  32:          0          0          0          0     GICv2 153 Level
> arm-pmu
>  33:          0          0          0          0     GICv2 154 Level
> arm-pmu
>  34:          0          0          0          0     GICv2 155 Level
> arm-pmu
>  35:          0          0          0          0     GICv2  59 Level
> 1c02000.dma-controller
>  37:          0          0          0          0     GICv2 102 Level
> gpmmu
>  38:          0          0          0          0     GICv2 104 Level
> ppmmu0
>  39:          0          0          0          0     GICv2 107 Level
> ppmmu1
>  40:        175          0          0          0     GICv2 101 Level     =
gp
>  41:        128          0          0          0     GICv2 103 Level     =
pp0
>  42:        128          0          0          0     GICv2 106 Level     =
pp1
>  43:          0          0          0          0     GICv2  71 Level
> ehci_hcd:usb1
>  44:          0          0          0          0     GICv2  72 Level
> ohci_hcd:usb2
>  45:       1289          0          0          0     GICv2  61 Level
> sun4i-ts
>  46:          0          0          0          0     GICv2  56 Level
> 1c20400.rtc
>  47:          0          0          0          0     GICv2 125 Level
> 1400000.deinterlace
>  48:          0          0          0          0     GICv2 126 Level
> sun8i-ce-ns
>  49:          0          0          0          0     GICv2  85 Level
> 1c0e000.video-codec
>  74:          0          0          0          0  sunxi_pio_edge  23 Edge
>    usb0-id-det
>  83:         28          0          0          0     GICv2  33 Level
> ttyS0
>  84:          0          0          0          0     GICv2  44 Level
> sun6i-spi
>  85:      80306          0          0          0     GICv2  39 Level
> mv64xxx_i2c
>  86:          0          0          0          0  sunxi-nmi   0 Level
> axp22x_irq_chip
> 109:          0          0          0          0  axp22x_irq_chip  22 Edge
>      axp20x-pek-dbr
> 110:          0          0          0          0  axp22x_irq_chip  23 Edge
>      axp20x-pek-dbf
> 113:          0          0          0          0     GICv2  40 Level
> mv64xxx_i2c
> 114:          0          0          0          0     GICv2  41 Level
> mv64xxx_i2c
> 115:          0          0          0          0     GICv2 120 Level
> mv64xxx_i2c
> 116:          0          0          0          0     GICv2 121 Level
> mv64xxx_i2c
> 117:          0          0          0          0     GICv2 129 Level
> tvd0
> 118:          0          0          0          0     GICv2 130 Level
> tvd1
> 119:          0          0          0          0     GICv2 131 Level
> tvd2
> 120:          0          0          0          0     GICv2 132 Level
> tvd3
> 121:      10281          0          0          0     GICv2  68 Level     =
ths
> 122:        245          0          0          0     GICv2  66 Level
> sunxi-mmc
> 123:       5690          0          0          0     GICv2  64 Level
> sunxi-mmc
> 129:          0          0          0          0     GICv2  88 Level
> ahci-sunxi[1c18000.sata]
> 130:     168336          0          0          0     GICv2  87 Level
> eth0
> 131:      81204          0          0          0     GICv2 117 Level
> eth1
> 132:        401          0          0          0     GICv2  70 Level
> musb-hdrc.2.auto
> 133:          0          0          0          0     GICv2  96 Level
> ohci_hcd:usb3
> 134:          0          0          0          0     GICv2  97 Level
> ohci_hcd:usb4
> 135:       9114          0          0          0     GICv2  76 Level
> 1c71000.lcd-controller
> 136:      13939          0          0          0     GICv2  83 Level
> 1c73000.lcd-controller
> 137:        515          0          0          0     GICv2  90 Level
> 1ee0000.hdmi
> 138:          0          0          0          0     GICv2 110 Level
> ehci_hcd:usb5
> 139:          0          0          0          0     GICv2 108 Level
> ehci_hcd:usb6
> IPI0:          0          0          0          0  CPU wakeup interrupts
> IPI1:          0          0          0          0  Timer broadcast
> interrupts
> IPI2:         71         81        134        106  Rescheduling interrupts
> IPI3:       5850      17893       6323       6836  Function call interrup=
ts
> IPI4:          0          0          0          0  CPU stop interrupts
> IPI5:      16353       2205       1054        417  IRQ work interrupts
> IPI6:          0          0          0          0  completion interrupts
> Err:          0
> [/quote]
>=20
> I've reconfigured PI11 as GPIO and I've observed change of input state on
> USB-OTG cable.
> External interrupt is possible on PI11 - PI11/SPI0_CLK/UART5_RX/EINT23 -
> everything else is turned of like spi0 or routed to different pins as uar=
t5.
>=20
> Link to syslog excerpts and dts with dtsi:
> https://disk.yandex.ru/d/0H5tnCl1qQIE2g
>=20
> I really appreciate an advice with links to how debug that.
>=20
> Please, notify my if I can provide some additional info.
>=20

