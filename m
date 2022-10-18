Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82414C64
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Oct 2022 14:01:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81521113E;
	Tue, 18 Oct 2022 07:01:25 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 005E93F792;
	Tue, 18 Oct 2022 07:01:17 -0700 (PDT)
Date: Tue, 18 Oct 2022 15:01:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Icenowy Zheng <uwu@icenowy.me>, Yifan Gu
 <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland
 <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
Message-ID: <20221018150115.506e449a@donnerap.cambridge.arm.com>
In-Reply-To: <142d084b-2950-515c-85ea-0f9c82748580@gmail.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com>
	<20221012163458.1968900-7-andre.przywara@arm.com>
	<CAJiuCceW_pnDn=dhZKKUmxs1y=NOuT0m_XFea-SY7XFFA7pUGw@mail.gmail.com>
	<1377fdd9-cec6-2d2e-3b06-7750a273acca@arm.com>
	<142d084b-2950-515c-85ea-0f9c82748580@gmail.com>
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

On Fri, 14 Oct 2022 01:04:18 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

Hi Jesse, Giulio,

thanks for having a look and for the testing!

> On 10/13/22 05:53, Andre Przywara wrote:
> > On 13/10/2022 09:33, Cl=C3=A9ment P=C3=A9ron wrote:
> >=20
> > Hi Cl=C3=A9ment,
> >  =20
> >> On Wed, 12 Oct 2022 at 18:35, Andre Przywara <andre.przywara@arm.com> =
wrote: =20
> >>>
> >>> The CherryPi F1C200s board is a small development board, featuring the
> >>> F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C socket=
s,
> >>> of which one is connected to a USB-UART chip, that provides easy acce=
ss
> >>> to UART1. =20
> >>
> >> A similar board is trying to been upstreamed by Icenowy:
> >>
> >> see : https://lore.kernel.org/lkml/20221012055602.1544944-11-uwu@iceno=
wy.me/
> >> [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick v1.1
> >>
> >> Maybe we should take into account the remarks that Krzysztof Kozlowski
> >> made to follow the same device-tree rules on U-boot. =20
> >=20
> > Yeah, thanks for the heads up, I saw that. I just wanted to post this to
> > demonstrate what needs to be done. I will be sending a Linux DT patch
> > anyway, since DTs need to go via Linux anyway.
> >=20
> > Thanks,
> > Andre
> >  =20
> >>
> >> Regards,
> >> Clement
> >> =20
> >>> Beside the usual micro-SD card slot, the board comes with a SPI NAND
> >>> flash chip, which is not yet supported.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>> ---
> >>>    .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++=
++++
> >>>    configs/cherrypi_f1c200s_defconfig            | 11 +++++
> >>>    2 files changed, 56 insertions(+)
> >>>    create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
> >>>    create mode 100644 configs/cherrypi_f1c200s_defconfig
> >>>
> >>> diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/a=
rm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
> >>> new file mode 100644
> >>> index 00000000000..f0ebcb6d893
> >>> --- /dev/null
> >>> +++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
> >>> @@ -0,0 +1,45 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
> >>> +/*
> >>> + * Copyright 2022 Arm Ltd.
> >>> + * based on another DT, which is:
> >>> + *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io> =20
> Her email changed IDK if it is proper to change here.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +#include "suniv-f1c100s.dtsi"
> >>> +
> >>> +/ {
> >>> +       model =3D "Cherry Pi F1C200s";
> >>> +       compatible =3D "lctech,cherrypi-f1c200s", "allwinner,suniv-f1=
c100s";
> >>> +
> >>> +       aliases {
> >>> +               mmc0 =3D &mmc0;
> >>> +               serial0 =3D &uart1;
> >>> +               spi0 =3D &spi0; =20
> no need for spi.
> >>> +       };
> >>> +
> >>> +       chosen {
> >>> +               stdout-path =3D "serial0:115200n8";
> >>> +       };
> >>> +
> >>> +       reg_vcc3v3: vcc3v3 {
> >>> +               compatible =3D "regulator-fixed";
> >>> +               regulator-name =3D "vcc3v3";
> >>> +               regulator-min-microvolt =3D <3300000>;
> >>> +               regulator-max-microvolt =3D <3300000>;
> >>> +       };
> >>> +};
> >>> +
> >>> +&mmc0 {
> >>> +       broken-cd;
> >>> +       bus-width =3D <4>;
> >>> +       disable-wp;
> >>> +       status =3D "okay";
> >>> +       vmmc-supply =3D <&reg_vcc3v3>;
> >>> +};
> >>> +
> >>> +&uart1 {
> >>> +       pinctrl-names =3D "default";
> >>> +       pinctrl-0 =3D <&uart1_pa_pins>;
> >>> +       status =3D "okay";
> >>> +};
> >>> diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1=
c200s_defconfig
> >>> new file mode 100644
> >>> index 00000000000..306d363f485
> >>> --- /dev/null
> >>> +++ b/configs/cherrypi_f1c200s_defconfig
> >>> @@ -0,0 +1,11 @@
> >>> +CONFIG_ARM=3Dy
> >>> +CONFIG_SYS_DCACHE_OFF=3Dy
> >>> +CONFIG_ARCH_SUNXI=3Dy
> >>> +CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c100s-cherrypi-f1c200s"
> >>> +CONFIG_SPL=3Dy
> >>> +CONFIG_MACH_SUNIV=3Dy
> >>> +CONFIG_DRAM_CLK=3D156
> >>> +CONFIG_DRAM_ZQ=3D0 =20
> You need
> +CONFIG_SPL_STACK=3D0x8000

I posted "[PATCH 1/2] sunxi: Kconfig: use SoC-wide values for some symbols"
(https://lore.kernel.org/u-boot/20220913234335.24902-2-andre.przywara@arm.c=
om/)
that solves that issue.
That patch is applied before this series in the tree, so no change should
be needed.

Thanks for the report!

Cheers,
Andre


>=20
> I will test this on both 100s and 200s.
> Thanks,
> Jesse Taube
> >>> +CONFIG_SUNXI_MINIMUM_DRAM_MB=3D64
> >>> +# CONFIG_VIDEO_SUNXI is not set
> >>> +CONFIG_CONS_INDEX=3D2
> >>> --
> >>> 2.25.1
> >>>
> >>> =20
> >  =20

