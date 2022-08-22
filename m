Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A17FA
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 11:40:27 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id y4so7873050qvp.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=gD3YKhawXxvo58bUKUOlExnV1tyEwvD6NRrt00bkb+Q=;
        b=HQ7S4AZUfoAyfExzkvi4UytGICpULIwMzB9J+I4jb0FAAzAFTWYxs7V2W3jcozWMZB
         bYI4eQQF/rd/YwIE5U4atcltFU9ecl3zOhcEVVdGRT3yaxRIwTZYqjxa57Z8x2WGeKJE
         pCrFooX0xILlE6GD6Ew+BL/2bPNJHD6xpmFe5NXTyvNM5D+eTeCCYLaL26uH+fadqv32
         X3K6jOqjy506XpJJg4qf/6fytH4dw59nU7Qeb2e6xa7F+odOEnfo1zQXqoAIDgM0s2YE
         T1pjs3xH0wWeAoYmN7dczAwKJBl5e/+ZmRj3N8/1Ei4Vk3jOjoqwgGbgFk2eyHVdIr37
         rKzA==
X-Gm-Message-State: ACgBeo0KBxyfxS3vF2sKebZ4aVaRyUr0JiEk3qyMxpIGs9Ug596yu4w0
	oupVOYbJ78YQdXqH6iTv8Z8JmP1D+Wbp+A==
X-Google-Smtp-Source: AA6agR5XyPsLV/KMlG18OmyX0403ku8DXhzRfh2Oih0dM9j3kjighU8GAI8wU+O4fhEm5jOF+stKgA==
X-Received: by 2002:a05:6214:1c87:b0:46b:c547:543d with SMTP id ib7-20020a0562141c8700b0046bc547543dmr15545516qvb.52.1661168426058;
        Mon, 22 Aug 2022 04:40:26 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id i12-20020ac85c0c000000b0031eb393aa45sm9267808qti.40.2022.08.22.04.40.24
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 04:40:25 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-334dc616f86so284460077b3.8
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 04:40:24 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr18713118ybr.202.1661168424232; Mon, 22
 Aug 2022 04:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <5593349.DvuYhMxLoT@jernej-laptop>
 <3881930.ZaRXLXkqSa@diego> <2249129.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <2249129.ElGaqSPkdT@jernej-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 13:40:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEjKnkj8JKpHUajU=xnDyuWeHmtrz0Y7qML+_XuCxDRg@mail.gmail.com>
Message-ID: <CAMuHMdVEjKnkj8JKpHUajU=xnDyuWeHmtrz0Y7qML+_XuCxDRg@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Tue, Aug 16, 2022 at 11:28 AM Jernej =C5=A0krabec
<jernej.skrabec@gmail.com> wrote:
> Dne torek, 16. avgust 2022 ob 11:12:05 CEST je Heiko St=C3=BCbner napisal=
(a):
> > Am Dienstag, 16. August 2022, 09:49:58 CEST schrieb Jernej =C5=A0krabec=
:
> > > Dne torek, 16. avgust 2022 ob 09:41:45 CEST je Krzysztof Kozlowski
> napisal(a):
> > > > On 15/08/2022 08:08, Samuel Holland wrote:
> > > > > +
> > > > > +       de: display-engine {
> > > > > +               compatible =3D "allwinner,sun20i-d1-display-engin=
e";
> > > > > +               allwinner,pipelines =3D <&mixer0>, <&mixer1>;
> > > > > +               status =3D "disabled";
> > > > > +       };
> > > > > +
> > > > > +       osc24M: osc24M-clk {
> > > >
> > > > lowercase
> > > >
> > > > > +               compatible =3D "fixed-clock";
> > > > > +               clock-frequency =3D <24000000>;
> > > >
> > > > This is a property of the board, not SoC.
> > >
> > > SoC needs 24 MHz oscillator for correct operation, so each and every =
board
> > > has it. Having it here simplifies board DT files.
> >
> > I guess the oscillator is a separate component on each board, right?
>
> Correct.
>
> > And DT obvious is meant to describe the hardware - independently from
> > implementation-specific choices.
>
> There is no choice in this case. 24 MHz crystal has to be present.
>
> FWIW, including crystal node in SoC specific DTSI is already common patte=
rn in
> Allwinner ARM SoC DTSI files.

I could also be a programmable clock generator on the board, programmed
to generate a 24 MHz clock on one of its outputs? Again, on the board.

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
