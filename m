Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB787FA
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 11:47:01 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id b2so7877734qvp.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2XJZ/Imo2dVNd0H4SfuBgLAT9QYlxOPB6r7l1kGv5p8=;
        b=5XXBuk0ZHMcnuQbUhBLhfAd5Dh1T3DXtrcY3A8y2Jg1Ts0jzMZBvxyKqLAa+dE/Sy/
         arLqNyzFkeUyPQtCVBqhXykZScUmMfx+oEqV5PHVh7tiwawC0DK1OMWoLwcS8Nr/QfrJ
         6PCai6B0Q9LC3u02pO291yPJd+YfpCM8O76NJYYMngxajlq3KsEKKdkvTaEc3HrTUfTW
         M3q0V+W0CfWpLguMUwWy5HS5QBUMPDdIcRh/AeEPlD//v14/IV9z4EAvWHRxJAZnV374
         WWDUWCJESbbFAWcwWRX81ku76HJ8i27BYA1kEnUzMGT38zgHCAf9HRj6rmMst8SbP4dc
         rffw==
X-Gm-Message-State: ACgBeo0QvjD1YauTDVV1Gl5N9nEpbMLdSdR4k/qeHQaEUl0caEiloFkh
	1O9EFtSB2QdUiL2+ruE/lmIZn61t8N31qQ==
X-Google-Smtp-Source: AA6agR5nMMK0r786uif53C8DyKodCevlwaf8XCEL+hLrY2aNRnXx9RhrQEdedRgQ/IhYvKokcZcgVw==
X-Received: by 2002:a0c:e3c7:0:b0:473:7d9a:6237 with SMTP id e7-20020a0ce3c7000000b004737d9a6237mr14902803qvl.37.1661168820716;
        Mon, 22 Aug 2022 04:47:00 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id m2-20020a05622a118200b003434f7483a1sm9404720qtk.32.2022.08.22.04.46.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 04:46:59 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33387bf0c4aso284441687b3.11
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 04:46:59 -0700 (PDT)
X-Received: by 2002:a25:1f02:0:b0:695:92f8:5a58 with SMTP id
 f2-20020a251f02000000b0069592f85a58mr6143444ybf.604.1661168819290; Mon, 22
 Aug 2022 04:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com> <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org> <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me> <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
In-Reply-To: <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 13:46:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
Message-ID: <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: uwu@icenowy.me, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor, Andre,

On Sun, Aug 21, 2022 at 12:07 PM <Conor.Dooley@microchip.com> wrote:
> On 21/08/2022 07:45, Icenowy Zheng wrote:
> > =E5=9C=A8 2022-08-20=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 17:29 +0000=EF=
=BC=8CConor.Dooley@microchip.com=E5=86=99=E9=81=93=EF=BC=9A
> >> On 20/08/2022 18:24, Samuel Holland wrote:
> >>> On 8/15/22 12:01 PM, Conor.Dooley@microchip.com wrote:
> >>>> On 15/08/2022 14:11, Andre Przywara wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless
> >>>>> you know the content is safe
> >>>>>
> >>>>> On Mon, 15 Aug 2022 00:08:09 -0500
> >>>>> Samuel Holland <samuel@sholland.org> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> thanks for all the efforts in getting those SoC peripherals
> >>>>> supported!
> >>>>>
> >>>>>> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU,
> >>>>>> as well as
> >>>>>> one HiFi 4 DSP. The SoC is based on a design that
> >>>>>> additionally contained
> >>>>>> a pair of Cortex A7's. For that reason, some peripherals are
> >>>>>> duplicated.
> >>>>>
> >>>>> So because of this, the Allwinner R528 and T113 SoCs would
> >>>>> share almost
> >>>>> everything in this file. Would it be useful to already split
> >>>>> this DT up?
> >>>>> To have a base .dtsi, basically this file without /cpus and
> >>>>> /soc/plic,
> >>>>> then have a RISC-V specific file with just those, including the
> >>>>> base?
> >>>>> There is precedence for this across-arch(-directories) sharing
> >>>>> with the
> >>>>> Raspberry Pi and Allwinner H3/H5 SoCs.
> >>>>
> >>>> For those playing along at home, one example is the arm64
> >>>> bananapi m2
> >>>> dts which looks like:
> >>>>> /dts-v1/;
> >>>>> #include "sun50i-h5.dtsi"
> >>>>> #include "sun50i-h5-cpu-opp.dtsi"
> >>>>> #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
> >>>>>
> >>>>> / {
> >>>>>         model =3D "Banana Pi BPI-M2-Plus v1.2 H5";
> >>>>>         compatible =3D "bananapi,bpi-m2-plus-v1.2",
> >>>>> "allwinner,sun50i-h5";
> >>>>> };
> >>>>
> >>>> I think this is a pretty good idea, and putting in the modularity
> >>>> up
> >>>> front seems logical to me, so when the arm one does eventually
> >>>> get
> >>>> added it can be done by only touching a single arch.
> >>>
> >>> This is not feasible, due to the different #interrupt-cells. See
> >>> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFi=
sGxHMBPUEa8nTMFpzw@mail.gmail.com/
> >>>
> >>> Even if we share some file across architectures, you still have to
> >>> update files
> >>> in both places to get the interrupts properties correct.
> >>>
> >>> I get the desire to deduplicate things, but we already deal with
> >>> updating the
> >>> same/similar nodes across several SoCs, so that is nothing new. I
> >>> think it would
> >>> be more confusing/complicated to have all of the interrupts
> >>> properties
> >>> overridden in a separate file.
> >>
> >> Yeah, should maybe have circled back after that conversation, would
> >> have been
> >> nice but if the DTC can't do it nicely then w/e.
> >
> > Well, maybe we can overuse the facility of C preprocessor?
> >
> > e.g.
> >
> > ```
> > // For ARM
> > #define SOC_PERIPHERAL_IRQ(n) GIC_SPI n
> > // For RISC-V
> > #define SOC_PERIPHERAL_IRQ(n) n
> > ```
> >
>
> Geert pointed out that this is not possible (at least on the Renesas
> stuff) because the GIC interrupt numbers are not the same as the
> PLIC's & the DTC is not able to handle the addition:
> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxH=
MBPUEa8nTMFpzw@mail.gmail.com/

Without the ability to do additions in DTC, we could e.g. list both
interrupts in the macro, like:

    // For ARM
    #define SOC_PERIPHERAL_IRQ(na, nr) GIC_SPI na
    // For RISC-V
    #define SOC_PERIPHERAL_IRQ(na, nr) nr

On Mon, Aug 22, 2022 at 12:52 PM Andre Przywara <andre.przywara@arm.com> wr=
ote:
> There are interrupt-maps for that:
> sun8i-r528.dtsi:
>         soc {
>                 #interrupt-cells =3D <1>;
>                 interrupt-map =3D <0  18 &gic GIC_SPI  2 IRQ_TYPE_LEVEL_H=
IGH>,
>                                 <0  19 &gic GIC_SPI  3 IRQ_TYPE_LEVEL_HIG=
H>,
>                                 ....
>
> sun20i-d1.dtsi:
>         soc {
>                 #interrupt-cells =3D <1>;
>                 interrupt-map =3D <0  18 &plic  18 IRQ_TYPE_LEVEL_HIGH>,
>                                 <0  19 &plic  19 IRQ_TYPE_LEVEL_HIGH>,
>
> then, in the shared .dtsi:
>                 uart0: serial@2500000 {
>                         compatible =3D "snps,dw-apb-uart";
>                         ...
>                         interrupts =3D <18>;

Nice! But it's gonna be a very large interrupt-map.

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
