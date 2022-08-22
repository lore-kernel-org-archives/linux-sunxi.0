Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC977FA
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 12:29:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C4412FC;
	Mon, 22 Aug 2022 05:29:56 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E94B3F718;
	Mon, 22 Aug 2022 05:29:50 -0700 (PDT)
Date: Mon, 22 Aug 2022 13:29:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: <Conor.Dooley@microchip.com>
Cc: <geert@linux-m68k.org>, <devicetree@vger.kernel.org>,
 <aou@eecs.berkeley.edu>, <samuel@sholland.org>,
 <linux-kernel@vger.kernel.org>, <jernej.skrabec@gmail.com>,
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <wens@csie.org>,
 <robh+dt@kernel.org>, <palmer@dabbelt.com>,
 <krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
 <linux-riscv@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Message-ID: <20220822132948.17f5dc6c@donnerap.cambridge.arm.com>
In-Reply-To: <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-7-samuel@sholland.org>
	<20220815141159.10edeba5@donnerap.cambridge.arm.com>
	<3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
	<932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
	<ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
	<c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
	<c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
	<CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
	<538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
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

On Mon, 22 Aug 2022 12:13:42 +0000
<Conor.Dooley@microchip.com> wrote:

Hi,

> On 22/08/2022 12:46, Geert Uytterhoeven wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > Hi Conor, Andre,
> >=20
> > On Sun, Aug 21, 2022 at 12:07 PM <Conor.Dooley@microchip.com> wrote: =20
> >> On 21/08/2022 07:45, Icenowy Zheng wrote: =20
> >>> =E5=9C=A8 2022-08-20=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 17:29 +0000=
=EF=BC=8CConor.Dooley@microchip.com=E5=86=99=E9=81=93=EF=BC=9A =20
> >>>> On 20/08/2022 18:24, Samuel Holland wrote: =20
>=20
> >>>>> This is not feasible, due to the different #interrupt-cells. See
> >>>>> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMc=
FisGxHMBPUEa8nTMFpzw@mail.gmail.com/
> >>>>>
> >>>>> Even if we share some file across architectures, you still have to
> >>>>> update files
> >>>>> in both places to get the interrupts properties correct.
> >>>>>
> >>>>> I get the desire to deduplicate things, but we already deal with
> >>>>> updating the
> >>>>> same/similar nodes across several SoCs, so that is nothing new. I
> >>>>> think it would
> >>>>> be more confusing/complicated to have all of the interrupts
> >>>>> properties
> >>>>> overridden in a separate file. =20
> >>>>
> >>>> Yeah, should maybe have circled back after that conversation, would
> >>>> have been
> >>>> nice but if the DTC can't do it nicely then w/e. =20
> >>>
> >>> Well, maybe we can overuse the facility of C preprocessor?
> >>>
> >>> e.g.
> >>>
> >>> ```
> >>> // For ARM
> >>> #define SOC_PERIPHERAL_IRQ(n) GIC_SPI n
> >>> // For RISC-V
> >>> #define SOC_PERIPHERAL_IRQ(n) n
> >>> ```
> >>> =20
> >>
> >> Geert pointed out that this is not possible (at least on the Renesas
> >> stuff) because the GIC interrupt numbers are not the same as the
> >> PLIC's & the DTC is not able to handle the addition:
> >> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFis=
GxHMBPUEa8nTMFpzw@mail.gmail.com/ =20
> >=20
> > Without the ability to do additions in DTC, we could e.g. list both
> > interrupts in the macro, like:
> >=20
> >      // For ARM
> >      #define SOC_PERIPHERAL_IRQ(na, nr) GIC_SPI na
> >      // For RISC-V
> >      #define SOC_PERIPHERAL_IRQ(na, nr) nr =20
>=20
> Do you think this is worth doing? Or are you just providing an
> example of what could be done?
>=20
> Where would you envisage putting these macros? I forget the order
> of the CPP operations that are done, can they be put in the dts?
>=20
> >=20
> > On Mon, Aug 22, 2022 at 12:52 PM Andre Przywara <andre.przywara@arm.com=
> wrote: =20
> >> There are interrupt-maps for that:
> >> sun8i-r528.dtsi:
> >>          soc {
> >>                  #interrupt-cells =3D <1>;
> >>                  interrupt-map =3D <0  18 &gic GIC_SPI  2 IRQ_TYPE_LEV=
EL_HIGH>,
> >>                                  <0  19 &gic GIC_SPI  3 IRQ_TYPE_LEVEL=
_HIGH>,
> >>                                  ....
> >>
> >> sun20i-d1.dtsi:
> >>          soc {
> >>                  #interrupt-cells =3D <1>;
> >>                  interrupt-map =3D <0  18 &plic  18 IRQ_TYPE_LEVEL_HIG=
H>,
> >>                                  <0  19 &plic  19 IRQ_TYPE_LEVEL_HIGH>,
> >>
> >> then, in the shared .dtsi:
> >>                  uart0: serial@2500000 {
> >>                          compatible =3D "snps,dw-apb-uart";
> >>                          ...
> >>                          interrupts =3D <18>; =20
> >=20
> > Nice! But it's gonna be a very large interrupt-map. =20
>=20
> I quite like the idea of not duplicating files across the archs
> if it can be helped, but not at the expense of making them hard to
> understand & I feel like unfortunately the large interrupt map is
> in that territory.

Well, I don't know about the Renesas case, but as far as we know the
Allwinner D1 and R528 are using the exact same die, just fused differently.
So expressing this in a common .dtsi sounds very desirable, especially
since a devicetree is an architecture agnostic data structure.

And while it's true that a DT interrupt-map is not for the faint of heart,
I think even the casual reader gets the idea quickly by looking at
it, possibly guided by a comment.
And it doesn't need to be very large. grep counted 32 genuine interrupts
in the current .dtsi file, so I just put those ones needed in. If we need
more IRQs later (quite likely), they are easily added, using copy&paste.

Cheers,
Andre
