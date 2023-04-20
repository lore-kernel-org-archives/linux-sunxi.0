Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2DC3D62
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 08:53:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80F3106F;
	Thu, 20 Apr 2023 01:54:02 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A73643F5A1;
	Thu, 20 Apr 2023 01:53:17 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:53:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ludwig Kormann <ludwig.kormann@in-circuit.de>, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
Message-ID: <20230420095315.5aaab9eb@donnerap.cambridge.arm.com>
In-Reply-To: <b84537c0-cb58-621a-2b6d-3bbaac5091de@linaro.org>
References: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
	<b84537c0-cb58-621a-2b6d-3bbaac5091de@linaro.org>
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

On Wed, 19 Apr 2023 15:05:17 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 19/04/2023 14:12, Ludwig Kormann wrote:
> > Add board support for ICnova A20 SomPi compute module on
> > ICnova ADB4006 development board.
> >=20
> > Specification:
> > SoM
> > - Processor: Allwinner A20 Cortex-A7 Dual Core at 1GHz
> > - 512MB DDR3 RAM
> > - Fast Ethernet (Phy: Realtek RTL8201CP)
> > ADB4006
> > - I2C
> > - 2x USB 2.0
> > - 1x Fast Ethernet port
> > - 1x SATA
> > - 2x buttons (PWRON, Boot)
> > - 2x LEDS
> > - serial console
> > - HDMI
> > - =C2=B5SD-Card slot
> > - Audio Line-In / Line-Out
> > - GPIO pinheaders
> >=20
> > https://wiki.in-circuit.de/index.php5?title=3DICnova_ADB4006
> > https://wiki.in-circuit.de/index.php5?title=3DICnova_A20_SODIMM
> >=20
> > ---
> >=20
> > changes in v2:
> > - use short licensing header
> > - remove deprecated elements from led nodes
> > - disable csi power supply
> > - add missing pins in usbphy node
> > - split dts into SoM dtsi and carrier board dts
> >=20
> > v1 of this patch was sent to the uboot mailing list [1].
> >=20
> > [1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html
> >=20
> > Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>
> > ---
> >  .../devicetree/bindings/arm/sunxi.yaml        |   6 + =20
>=20
> Bindings are always separate patches. checkpatch did not complain?
>=20
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
> >  arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  63 ++++++++
> >  4 files changed, 207 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index 013821f4a7b8..12f0c236f17b 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -305,6 +305,12 @@ properties:
> >            - const: allwinner,i12-tvbox
> >            - const: allwinner,sun7i-a20
> > =20
> > +      - description: ICNova A20 ADB4006
> > +        items:
> > +          - const: incircuit,icnova-a20-adb4006
> > +          - const: incircuit,icnova-a20
> > +          - const: allwinner,sun7i-a20
> > +
> >        - description: ICNova A20 SWAC
> >          items:
> >            - const: incircuit,icnova-a20-swac
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 3cc32722c394..b6b408417261 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1321,6 +1321,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
> >  	sun7i-a20-hummingbird.dtb \
> >  	sun7i-a20-itead-ibox.dtb \
> >  	sun7i-a20-i12-tvbox.dtb \
> > +	sun7i-a20-icnova-a20-adb4006.dtb \
> >  	sun7i-a20-icnova-swac.dtb \
> >  	sun7i-a20-lamobo-r1.dtb \
> >  	sun7i-a20-linutronix-testbox-v2.dtb \
> > diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts b/arch/=
arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> > new file mode 100644
> > index 000000000000..c1606c085e4e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> > @@ -0,0 +1,137 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT) =20
>=20
> Unusual license. Are you sure you are ok with GPLv5.0?

Is it really unusual? This is literally the most commonly used dual license
for DTs, grep counts 252 users in arm and 573 users in arm64.

Or is it that it's deprecated and we recommend (GPL-2.0 OR MIT) for new
files?

Cheers,
Andre


>=20
> Also, at the end of your files - drop stray blank lines.
>=20
> Best regards,
> Krzysztof
>=20

