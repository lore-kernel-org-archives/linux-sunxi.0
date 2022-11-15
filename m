Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F761841
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 00:29:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15620ED1;
	Mon, 14 Nov 2022 16:29:41 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820973F663;
	Mon, 14 Nov 2022 16:29:32 -0800 (PST)
Date: Tue, 15 Nov 2022 00:28:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/10] ARM: dts: suniv: F1C100s: add more peripherals
Message-ID: <20221115002808.5456008b@slackpad.lan>
In-Reply-To: <1920557.yKVeVyVuyW@kista>
References: <20221107005433.11079-1-andre.przywara@arm.com>
	<1920557.yKVeVyVuyW@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 07 Nov 2022 20:33:47 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

thanks for the reviews!

> Dne ponedeljek, 07. november 2022 ob 01:54:23 CET je Andre Przywara=20
> napisal(a):
> > This is a fixed version of the initial post. I dropped the two patches
> > that were already applied by the respective maintainers, and fixed the
> > smaller issues mentioned in the review.
> > This adds v2 of the series enabling the "Lctech Pi F1C200s" board on to=
p,
> > also with the comments addressed. =20
>=20
> Please don't combine series if not agreed upon before. Now whole series w=
ill=20
> be delayed until USB is sorted out.

Apologies for that. Indeed I should have added the board DT to the USB
series instead, as there is no dependency to anything in here.

If you don't mind, I will send a v3 with the last three patches
dropped, and the ACKs and R-b's added (and that one line in the commit
message fixed).

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > The whole series goes on top of v3 of Icenowy's F1C100s USB support
> > series [1]. There is no real conflict, but the lctech-pi.dts file
> > references the new USB DT nodes from the .dtsi.
> >=20
> > I put a git repo with all those patches up here:
> > https://github.com/apritzel/linux/commits/f1c100s-devices-v2
> >=20
> > For a changelog see below.
> >=20
> > [1]
> > https://lore.kernel.org/linux-arm-kernel/20221106154826.6687-1-andre.pr=
zywa
> > ra@arm.com/T/#t
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The Allwinner F1C100s series of SoCs shares many peripherals with other
> > Allwinner SoCs. Since they are compatible, we can use the existing
> > drivers, and just need to enable the devices in the DT.
> >=20
> > This series adds the I2C controllers, the PWM device, the CIR (infrared)
> > device and the LRADC (aka. KEYADC, low res ADC) to the F1C100s .dtsi, so
> > boards can just use them by setting 'status =3D "okay";'.
> >=20
> > The only thing missing driver-wise is the IR mod clock, which was not
> > modeled in our CCU driver. Patch 4/10 fixes that.
> >=20
> > For every device there is one patch that adds the new compatible string
> > to the DT binding, and another patch to add the DT node.
> >=20
> > This has been tested on the Lctech Pi F1C200s board, by:
> > - Connecting an LED to PE6, and configuring this as the PWM pin in the =
DT.
> >   Doing a sweep on /sys/class/pwm/pwm1/duty_cycle made the LED fade out.
> > - Configuring PD0/PD12 as I2C0, and letting i2c-detect find the on-board
> >   NS2009 I2C chip.
> > - Connecting two resistors to the "ADC" pin, and configuring them as two
> >   buttons in the DT. /dev/input/event0 properly reported button presses.
> > - Connecting an infrared receiver to PE11, configured as CIR.
> >   ir-keytable reported key presses on a remote control.
> >=20
> > All those (basic) tests were successful, and prove that the peripherals
> > do work and are compatible.
> >=20
> > The final three patches add the binding docs and the .dts file for the
> > Lctech Pi F1C200s development board.
> >=20
> > Please have a look and test on your hardware, if possible.
> >=20
> > Cheers,
> > Andre
> >=20
> > Changelog v1 ... v2:
> > - dropped former patch 3/9 and 8/9: already applied
> > - increase register frame size in DT for PWM and LRADC
> > - drop I2C1 pins from pinctroller DT node
> > - increase IR mod clock mux to 2 bits
> > - fix mistyped comma in vendor prefix name
> > - drop unneeded mmc0 and spi0 aliases from Lctech Pi DT
> > - add /omit-if-no-ref/ tag to UART1 pins
> > - add ACKs and Reviewed-by tags
> >=20
> >=20
> > Andre Przywara (10):
> >   dt-bindings: pwm: allwinner,sun4i-a10: Add F1C100s compatible
> >   ARM: dts: suniv: f1c100s: add PWM node
> >   ARM: dts: suniv: f1c100s: add I2C DT nodes
> >   clk: sunxi-ng: f1c100s: Add IR mod clock
> >   dt-bindings: media: IR: Add F1C100s IR compatible string
> >   ARM: dts: suniv: f1c100s: add CIR DT node
> >   ARM: dts: suniv: f1c100s: add LRADC node
> >   dt-bindings: vendor-prefixes: add Lctech name
> >   dt-bindings: arm: sunxi: add compatible strings for Lctech Pi
> >   ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
> >=20
> >  .../devicetree/bindings/arm/sunxi.yaml        |  6 ++
> >  .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
> >  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  4 +-
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  arch/arm/boot/dts/Makefile                    |  1 +
> >  arch/arm/boot/dts/suniv-f1c100s.dtsi          | 76 ++++++++++++++++++
> >  arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 78 +++++++++++++++++++
> >  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++-
> >  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
> >  include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 +
> >  10 files changed, 180 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
> >=20
> > --
> > 2.35.5 =20
>=20
>=20

