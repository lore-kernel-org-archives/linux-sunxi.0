Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F067B
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 12:31:56 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id e4so7957422qvr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 05:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=JCvE0tIGIUKI4T1pwdPJfxx9bq80QkcidAq/OURkvig=;
        b=DiUT4ov0s9wANtiLl3/9W/dscbIuOPbEsr7Q9ka/gUJe3p4D3S2P+5+R/JdBT4cQd3
         wFY+rUn9rOJld9cmarvQO/DjxJfGNtSIToVnu6O3vAFCG7PvGa8h3rlpEImrAPm8EnxK
         yxES6izPLrhyR1e6TASfGpzwiR45J8GekxMLED54AXKBOM78AeiIkxJOnxUPxg7tCGSs
         oFkqm1ZOpmKDnUK45eE0oB5Ji4g9anUTmB98F8ZL6TmYM/Yq+0yTkpDk3s/I93JRu6jF
         lseyQdn4xjNHCU7ldPg9BkEmL2fWBGxIXLly69PzJz3O4LQRq9HBQ9QAKxfCQ1gk3nu6
         TjnQ==
X-Gm-Message-State: ACgBeo3OnhVyPh1NDJNk2oqhE4cyQvitqjijcDq3FLGyE0SX8PN6yA0a
	HJCTSmbdEgZ0FqGZeuJeYT4Di7mmUoFOtg==
X-Google-Smtp-Source: AA6agR5/1Zfljy70Mgw0iqkOiFZf8QxRrVlDZFltdKOjRFT+kM97DTh10HmoZdora7ns1FLipZOufQ==
X-Received: by 2002:a05:6214:2268:b0:476:c04e:65f6 with SMTP id gs8-20020a056214226800b00476c04e65f6mr15532496qvb.21.1661171515343;
        Mon, 22 Aug 2022 05:31:55 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id x26-20020a05620a0b5a00b006b5e1aeb777sm10555950qkg.43.2022.08.22.05.31.53
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 05:31:54 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-334dc616f86so288294517b3.8
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 05:31:53 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr18348478ybq.543.1661171513514; Mon, 22
 Aug 2022 05:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com> <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
In-Reply-To: <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 14:31:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
Message-ID: <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, Aug 22, 2022 at 2:13 PM <Conor.Dooley@microchip.com> wrote:
> On 22/08/2022 12:46, Geert Uytterhoeven wrote:
> > On Sun, Aug 21, 2022 at 12:07 PM <Conor.Dooley@microchip.com> wrote:
> >> On 21/08/2022 07:45, Icenowy Zheng wrote:
> >>> =E5=9C=A8 2022-08-20=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 17:29 +0000=
=EF=BC=8CConor.Dooley@microchip.com=E5=86=99=E9=81=93=EF=BC=9A
> >>>> On 20/08/2022 18:24, Samuel Holland wrote:
>
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
> >>>>> overridden in a separate file.
> >>>>
> >>>> Yeah, should maybe have circled back after that conversation, would
> >>>> have been
> >>>> nice but if the DTC can't do it nicely then w/e.
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
> >>>
> >>
> >> Geert pointed out that this is not possible (at least on the Renesas
> >> stuff) because the GIC interrupt numbers are not the same as the
> >> PLIC's & the DTC is not able to handle the addition:
> >> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFis=
GxHMBPUEa8nTMFpzw@mail.gmail.com/
> >
> > Without the ability to do additions in DTC, we could e.g. list both
> > interrupts in the macro, like:
> >
> >      // For ARM
> >      #define SOC_PERIPHERAL_IRQ(na, nr) GIC_SPI na
> >      // For RISC-V
> >      #define SOC_PERIPHERAL_IRQ(na, nr) nr
>
> Do you think this is worth doing? Or are you just providing an
> example of what could be done?

Just some brainstorming...

> Where would you envisage putting these macros? I forget the order
> of the CPP operations that are done, can they be put in the dts?

The SOC_PERIPHERAL_IRQ() macro should be defined in the
ARM-based SoC.dtsi file and the RISC-V-based SoC.dtsi file.

> > On Mon, Aug 22, 2022 at 12:52 PM Andre Przywara <andre.przywara@arm.com=
> wrote:
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
> >>                                  <0  19 &plic  19 IRQ_TYPE_LEVEL_HIGH>=
,
> >>
> >> then, in the shared .dtsi:
> >>                  uart0: serial@2500000 {
> >>                          compatible =3D "snps,dw-apb-uart";
> >>                          ...
> >>                          interrupts =3D <18>;
> >
> > Nice! But it's gonna be a very large interrupt-map.
>
> I quite like the idea of not duplicating files across the archs
> if it can be helped, but not at the expense of making them hard to
> understand & I feel like unfortunately the large interrupt map is
> in that territory.

I feel the same.
Even listing both interrupt numbers in SOC_PERIPHERAL_IRQ(na, nr)
is a risk for making mistakes.

So personally, I'm in favor of teaching dtc arithmetic, so we can
handle the offset in SOC_PERIPHERAL_IRQ().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
