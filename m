Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD547C
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 07:01:03 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id x5so12175093qtv.9
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 00:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fqGh8aE73orRi3PD0A1JVDOgqPEzP/eUkgDD6hWkr2g=;
        b=44VP1E3Q86ihdSsXn+NAsCkaxB6vaO0kPS28wuqSXmxSM4P2a8fqNqDHeUXH8I3jCV
         nTI8DEcNfUK5J1JIA69uNo/RTvK0aTfbJzy9asMOoMQIAWe9/5+AEXxluzEVfLPTDVMY
         TFU1gynrgVtQaqCsZPqEmccYi6vL239FALtEDAhyK+sxVVVY4H1zAhuhu8fGV47lJo8o
         EzegL5EWN1CSnr8jgHoITEZq5rpfRKgBDj8ADNqV6OUxciMX37JhM1sAyEBl+1YqYfvm
         AT3UM7Hjecf4WfShS1GspbQXuYQbOhv2UnVB67qVB7hTwTfQ/adZp3UMDJAnkZ4RWvJ2
         xcDg==
X-Gm-Message-State: ACgBeo2152w0X+EcN+2K+IlyFMJmSUa418VhBzyDd9soVcKA+R7YHymt
	rEw9O51N6S2VA7OFtwbG9i0pGXcuV3llXw==
X-Google-Smtp-Source: AA6agR73GBEqCb+foH/XxtQ6rN9+UjEWJcrZ8RnVkXpvRcFiO4H9tPgUYStBpA2qAAxAYmPOCW1RGw==
X-Received: by 2002:ac8:5f86:0:b0:344:65d7:ea44 with SMTP id j6-20020ac85f86000000b0034465d7ea44mr6658666qta.42.1662620462060;
        Thu, 08 Sep 2022 00:01:02 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id u4-20020a05620a0c4400b006bc1512986esm17739685qki.97.2022.09.08.00.01.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 00:01:01 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 130so24988420ybw.8
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Sep 2022 00:01:01 -0700 (PDT)
X-Received: by 2002:a25:8247:0:b0:6a9:443a:cc0b with SMTP id
 d7-20020a258247000000b006a9443acc0bmr6067365ybn.89.1662620461133; Thu, 08 Sep
 2022 00:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
 <7423117.EvYhyI6sBW@kista> <84f28dc3-3b65-ea70-4fa4-765d0c773c28@microchip.com>
In-Reply-To: <84f28dc3-3b65-ea70-4fa4-765d0c773c28@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Sep 2022 09:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
Message-ID: <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

CC soc people

On Wed, Sep 7, 2022 at 10:43 PM <Conor.Dooley@microchip.com> wrote:
> On 06/09/2022 21:29, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 01. september 2022 ob 20:10:13 CEST je Palmer Dabbelt=
 napisal(a):
> >> On Sun, 14 Aug 2022 22:08:03 PDT (-0700), samuel@sholland.org wrote:
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts create
> >>>  mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi creat=
e
> >>>  mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dt=
s
> >>>  create mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts creat=
e
> >>>  mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> >>>  create mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> >>>  create mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi crea=
te
> >>>  mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.d=
ts
> >>>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv=
.dts
> >>>  create mode 100644
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts create mo=
de
> >>>  100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts create mode
> >>>  100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> >>
> >> I'm assuming these are aimed at the RISC-V tree?  I'm generally OK wit=
h
> >> that, though the DT folks have pointed out a handful of issues that lo=
ok
> >> pretty reasonable to me.
> >
> > DT changes for Allwinner ARM SoCs go trough sunxi tree. Should this be =
handled
> > differently for RISC-V?
>
> Microchip RISC-V DT go via a Microchip tree to Palmer. The other stuff ge=
ts
> picked directly by him as it has no clear "owner". I think it would be ni=
ce
> to be consistent for the new {renesas,sunxi} stuff and send those via ven=
dor
> trees to Palmer too. Just my 2 cents...

Wasn't the intention behind the rename s/arm-soc/soc/ to start
accepting PRs for non-arm DT, too?
Especially if we start having dependencies due to riscv DTS files
including arm64 DTS snippets through scripts/dtc/include-prefixes/arm64/.

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
