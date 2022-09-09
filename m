Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0B622
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Sep 2022 07:10:52 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 3so163156qka.5
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Sep 2022 00:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GbISm7ahSLrwT2Au2tPllsLxCWm8oBE76/YUTIUdxx0=;
        b=QgOZ94yQKc2ixl11yGnGeZTARgUUbjqqe67AmOp7GUPn+04a2NfkPBWPC8gLcs/GrZ
         bmHC1aDFgZhVcER0u59Z8IfcIB/Wb4lznkEOgCxJhTiE+a4XeuESZo0sZMIa3lcyOJ96
         tVmG/otnYzuNCasxx/fRVVYydO771JPHpb1qI4rtMw8vtnlQ/YlBzTEwPHgdxnWJ0pEk
         PuSvH/Nerw4/DqPgQb53UA9RRMDxYrcKOwuDaSergWHNMbmXgaFY1vSGQBti9MvRC58Q
         d7Yl/93bbcV66erbph5BKD9gMDIzEeqMZ6fivdKZiwQdNW8iDc3iwsAi1V3InkMLsY+d
         aDeg==
X-Gm-Message-State: ACgBeo07ot/op9atYhyt7nwiQ9HtH5Sst9x4Bzwg0eoDPA9HFeLQaJ8v
	I3RIXu3pvSmnJz0lsFTxCyxFiNf7QnZ1pw==
X-Google-Smtp-Source: AA6agR7Ozk1Jw5opFlq+AGefjnLqqz2KyB29kuqDC6JaZrwc5xibJa7h+7qEUR0kShPyDBQoZL1FmA==
X-Received: by 2002:a05:620a:448b:b0:6bb:d0c1:b113 with SMTP id x11-20020a05620a448b00b006bbd0c1b113mr9246554qkp.719.1662707450946;
        Fri, 09 Sep 2022 00:10:50 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id o25-20020a05620a0d5900b006bc1512986esm767639qkl.97.2022.09.09.00.10.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:10:50 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id b136so1395662yba.2
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Sep 2022 00:10:49 -0700 (PDT)
X-Received: by 2002:a25:3851:0:b0:6ad:9cba:9708 with SMTP id
 f78-20020a253851000000b006ad9cba9708mr8823957yba.36.1662707449504; Fri, 09
 Sep 2022 00:10:49 -0700 (PDT)
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
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com> <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com> <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
 <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org>
In-Reply-To: <b3fdb3cc-a8fc-b980-c8f4-f96d4733ce56@sholland.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Sep 2022 09:10:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
Message-ID: <CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: Samuel Holland <samuel@sholland.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andre Przywara <andre.przywara@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, devicetree <devicetree@vger.kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Fri, Sep 9, 2022 at 5:42 AM Samuel Holland <samuel@sholland.org> wrote:
> On 8/22/22 10:29 AM, Jessica Clarke wrote:
> > On 22 Aug 2022, at 14:56, conor.dooley@microchip.com wrote:
> >> On 22/08/2022 13:31, Geert Uytterhoeven wrote:
> >>>> Do you think this is worth doing? Or are you just providing an
> >>>> example of what could be done?
> >>>
> >>> Just some brainstorming...
> >>>
> >>>> Where would you envisage putting these macros? I forget the order
> >>>> of the CPP operations that are done, can they be put in the dts?
> >>>
> >>> The SOC_PERIPHERAL_IRQ() macro should be defined in the
> >>> ARM-based SoC.dtsi file and the RISC-V-based SoC.dtsi file.
> >>
> >> Right, one level up but ~the same result.
> >>
> >>>>> Nice! But it's gonna be a very large interrupt-map.
> >>>>
> >>>> I quite like the idea of not duplicating files across the archs
> >>>> if it can be helped, but not at the expense of making them hard to
> >>>> understand & I feel like unfortunately the large interrupt map is
> >>>> in that territory.
> >>>
> >>> I feel the same.
> >>> Even listing both interrupt numbers in SOC_PERIPHERAL_IRQ(na, nr)
> >>> is a risk for making mistakes.
> >>>
> >>> So personally, I'm in favor of teaching dtc arithmetic, so we can
> >>> handle the offset in SOC_PERIPHERAL_IRQ().
> >>
> >> Yup, in the same boat here. mayb I'll get bored enough to bite..
> >
> > Note that GPL=E2=80=99ed dtc isn=E2=80=99t the only implementation. Fre=
eBSD uses a
> > BSD-licensed implementation[1] and so adding new features like this to
> > GPL dtc that actually get used would require us to reimplement it too.
> > I don=E2=80=99t know how much effort it would be but please keep this i=
n mind.
>
> I plan to go with the "SOC_PERIPHERAL_IRQ(na, nr)" implementation for v2.=
 I like
> that it only affects the DT source, and does not leak into the DTB. We st=
ill
> have the freedom to switch to using arithmetic later when all of the tool=
s
> support it.

May I suggest an alternative solution, which would be more generic,
and can be extended to other/more CPU cores easily:

Specify both interrupts in the .dtsi, but wrapped inside e.g. ARM()
resp. RISCV() macros:

    ARM(interrupts =3D <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)
    RISCV(interrupts =3D <412 IRQ_TYPE_LEVEL_HIGH>;)

The same construct can be used for e.g. interrupt-parent.
The ARM .dts would define:

    #define ARM(x...)    x
    #define RISCV(x....)

before including the .dtsi.
The RISC-V DTS would define instead:

    #define ARM(x...)
    #define RISCV(x...)    x

Cfr. the AR_CLASS(), M_CLASS(), ARM(), and THUMB() macros in
arch/arm/include/asm/unified.h.

Note that this is not exactly a new issue.  It's fairly common for
SoCs to have separate application and real-time cores, and on-SoC
devices may be wired to multiple interrupt controllers serving
the AP resp. RT cores. If both core sets are ARM, both interrupt
controllers may be GIC, and the problem may be less severe and just
need a different #interrupt-parent.
But in case of ARM vs. RISC-V, or different wirings from devices
to interrupt controllers, you do need completely different interrupts
properties.

> My other concern is that the big interrupt-map property would make DT ove=
rlays
> even more painful to deal with. I don't think overlays can append to a pr=
operty,
> only replace it.

Indeed, overlays can only add/replace/delete properties.
Same for plain DTS files, BTW.
But I agree having /append-property/ would be useful in general.


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
