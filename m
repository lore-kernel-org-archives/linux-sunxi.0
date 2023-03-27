Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FDD81E
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Mar 2023 09:21:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B9704B3;
	Mon, 27 Mar 2023 02:22:08 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10CE3F6C4;
	Mon, 27 Mar 2023 02:21:21 -0700 (PDT)
Date: Mon, 27 Mar 2023 10:21:18 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel
 Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?=
 <szemzo.andras@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, Fabien Poussin
 <fabien.poussin@gmail.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: add MangoPi MQ-R-T113 board
Message-ID: <20230327102118.2ef356e3@donnerap.cambridge.arm.com>
In-Reply-To: <CAAfyv34PerH2XEFUv5G9_V2x5xaM6Dz2+vz8Rt_UbCEv4OGg7Q@mail.gmail.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
	<20230320005249.13403-5-andre.przywara@arm.com>
	<CAAfyv34PerH2XEFUv5G9_V2x5xaM6Dz2+vz8Rt_UbCEv4OGg7Q@mail.gmail.com>
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

On Mon, 27 Mar 2023 10:30:33 +0200
Belisko Marek <marek.belisko@gmail.com> wrote:

Hi Marek,

thanks for testing!

> On Mon, Mar 20, 2023 at 1:53=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The MangoPi MQ-R-T113 is a small SBC with the Allwinner T113-s3 SoC.
> > The SoC features two Arm Cortex-A7 cores and 128 MB of co-packaged DDR3
> > DRAM. The board adds mostly connectors and the required regulators, plus
> > a Realtek RTL8189FTV WiFi chip.
> > Power comes in via a USB-C connector wired as a peripheral, and there is
> > a second USB-C connector usable as a host port.
> >
> > Add a .dtsi file describing most of the board's peripherals, and include
> > that from the actual board .dts file. This allows to re-use the .dtsi
> > for the MQ-R-F113 RISC-V variant of that board.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../dts/sun8i-t113s-mangopi-mq-r-t113.dts     |  35 +++++
> >  .../boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi | 126 ++++++++++++++++++
> >  3 files changed, 162 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
> >  create mode 100644 arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index efe4152e5846d..3367e24146da8 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1397,6 +1397,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >         sun8i-s3-elimo-initium.dtb \
> >         sun8i-s3-lichee-zero-plus.dtb \
> >         sun8i-s3-pinecube.dtb \
> > +       sun8i-t113s-mangopi-mq-r-t113.dtb \
> >         sun8i-t3-cqa3t-bv3.dtb \
> >         sun8i-v3-sl631-imx179.dtb \
> >         sun8i-v3s-licheepi-zero.dtb \
> > diff --git a/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts b/arch=
/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
> > new file mode 100644
> > index 0000000000000..94e24b5926dd7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +// Copyright (C) 2022 Arm Ltd.
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun8i-t113s.dtsi"
> > +#include "sunxi-d1s-t113-mangopi-mq-r.dtsi"
> > +
> > +/ {
> > +       model =3D "MangoPi MQ-R-T113";
> > +       compatible =3D "widora,mangopi-mq-r-t113", "allwinner,sun8i-t11=
3s";
> > +
> > +       aliases {
> > +               ethernet0 =3D &rtl8189ftv;
> > +       };
> > +};
> > +
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_vcc_core>;
> > +};
> > +
> > +&cpu1 {
> > +       cpu-supply =3D <&reg_vcc_core>;
> > +}; =20
> Tested on MQ-R-T113 Mangopi on top of 6.3-rc3 and on booted system I
> have only one CPU available:

Right, thanks for the heads up. The reason is that the current U-Boot
branch does not enable PSCI services, so the kernel does not know how to
enable and online the second core. As with the other 32-bit parts, the
PSCI nodes and properties get inserted into the DT by U-Boot, at runtime:
arch/arm/lib/psci-dt.c:fdt_psci().

It should be fairly straight-forward to enable that in U-Boot, I will try
to look into this later this week.

Cheers,
Andre

> root@t113:~# cat /proc/cpuinfo
> processor       : 0
> model name      : ARMv7 Processor rev 5 (v7l)
> BogoMIPS        : 48.00
> Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4
> idiva idivt vfpd32 lpae evtstrm
> CPU implementer : 0x41
> CPU architecture: 7
> CPU variant     : 0x0
> CPU part        : 0xc07
> CPU revision    : 5
>=20
> Hardware        : Generic DT based system
> Revision        : 0000
> Serial          : 9340600081169098
>=20
> bootlog shows:
> [    0.003515] /cpus/cpu@0 missing clock-frequency property
> [    0.003601] /cpus/cpu@1 missing clock-frequency property
> [    0.003640] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
>=20
> > +
> > +&mmc1 {
> > +       rtl8189ftv: wifi@1 {
> > +               reg =3D <1>;
> > +               interrupt-parent =3D <&pio>;
> > +               interrupts =3D <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 =3D W=
L_WAKE_AP */
> > +               interrupt-names =3D "host-wake";
> > +       };
> > +};
> > diff --git a/arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi b/arch/=
arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
> > new file mode 100644
> > index 0000000000000..e9bc749488bb2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +// Copyright (C) 2022 Arm Ltd.
> > +/*
> > + * Common peripherals and configurations for MangoPi MQ-R boards.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +       aliases {
> > +               serial3 =3D &uart3;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D "serial3:115200n8";
> > +       };
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               led-0 {
> > +                       color =3D <LED_COLOR_ID_BLUE>;
> > +                       function =3D LED_FUNCTION_STATUS;
> > +                       gpios =3D <&pio 3 22 GPIO_ACTIVE_LOW>; /* PD22 =
*/
> > +               };
> > +       };
> > +
> > +       /* board wide 5V supply directly from the USB-C socket */
> > +       reg_vcc5v: regulator-5v {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-5v";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       /* SY8008 DC/DC regulator on the board */
> > +       reg_3v3: regulator-3v3 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-3v3";
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               vin-supply =3D <&reg_vcc5v>;
> > +       };
> > +
> > +       /* SY8008 DC/DC regulator on the board, also supplying VDD-SYS =
*/
> > +       reg_vcc_core: regulator-core {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-core";
> > +               regulator-min-microvolt =3D <880000>;
> > +               regulator-max-microvolt =3D <880000>;
> > +               vin-supply =3D <&reg_vcc5v>;
> > +       };
> > +
> > +       /* XC6206 LDO on the board */
> > +       reg_avdd2v8: regulator-avdd {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "avdd2v8";
> > +               regulator-min-microvolt =3D <2800000>;
> > +               regulator-max-microvolt =3D <2800000>;
> > +               vin-supply =3D <&reg_3v3>;
> > +       };
> > +
> > +       wifi_pwrseq: wifi-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               reset-gpios =3D <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> > +       };
> > +};
> > +
> > +&dcxo {
> > +       clock-frequency =3D <24000000>;
> > +};
> > +
> > +&ehci1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +       pinctrl-0 =3D <&mmc0_pins>;
> > +       pinctrl-names =3D "default";
> > +       vmmc-supply =3D <&reg_3v3>;
> > +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
> > +       disable-wp;
> > +       bus-width =3D <4>;
> > +       status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +       pinctrl-0 =3D <&mmc1_pins>;
> > +       pinctrl-names =3D "default";
> > +       vmmc-supply =3D <&reg_3v3>;
> > +       non-removable;
> > +       bus-width =3D <4>;
> > +       mmc-pwrseq =3D <&wifi_pwrseq>;
> > +       status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&pio {
> > +       vcc-pb-supply =3D <&reg_3v3>;
> > +       vcc-pd-supply =3D <&reg_3v3>;
> > +       vcc-pe-supply =3D <&reg_avdd2v8>;
> > +       vcc-pf-supply =3D <&reg_3v3>;
> > +       vcc-pg-supply =3D <&reg_3v3>;
> > +};
> > +
> > +&uart3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart3_pb_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +/* The USB-C socket has its CC pins pulled to GND, so is hardwired as =
a UFP. */
> > +&usb_otg {
> > +       dr_mode =3D "peripheral";
> > +       status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +       usb1_vbus-supply =3D <&reg_vcc5v>;
> > +       status =3D "okay";
> > +};
> > --
> > 2.35.7
> > =20
>=20
> BR,
>=20
> marek
>=20

