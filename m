Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26215A4
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 04:13:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-687ca37628eso3149046b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 21:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691900013; x=1692504813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI593M9zMN8epqOMj2ahalMMsfEOiEZNyKM6XMUdoUI=;
        b=lGVRaoVsMECCBjYPG+pQ8+jN0I8mzMPiJ11/TU1sqDI03gKn053jifdT09SUw+NIPJ
         VB3HWBilWS5/mhd4KQIJ9kEIZi/RLl1y2RjQLUuaE18l5HzTlDRuzZ1MT5iDhfghljjA
         +0Pkp7Nn/25bNp5QL+8mM96iOgggvdWJoNqT4r5/sR+6prvf6fFTg+xui8+8GGbaCjz0
         pGqv9yGpC8KlonJC6j8mOUb8RHg0/JkF2PxHnYD/3j4v4h/G3k/3G8c1vpTEKl0gD8zV
         q7JxUnLDDhC+KDjkcs5Auz9iuq3SSB1A/f274fvzdQv2eQMdc3y7D5S/QfV61QEWS88q
         eJLg==
X-Gm-Message-State: AOJu0YwKhukgP2RW0BqzpRfoZle3L1DTDatZN6ED2o69ejBDhIDJ1q0o
	ytlFrKhQX3Gt3jwAtl7vUarRkYYIA8pSUg==
X-Google-Smtp-Source: AGHT+IHn/SxbpWHQiOJ8g2adQZ0b4h52Qcus2LnH4C9AHqVuiKgksGv98DnxHmdUuPw07RGMTu7FKg==
X-Received: by 2002:a05:6a20:1606:b0:13f:cd07:2b40 with SMTP id l6-20020a056a20160600b0013fcd072b40mr8927770pzj.3.1691900013471;
        Sat, 12 Aug 2023 21:13:33 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id b18-20020aa78112000000b00659b8313d08sm5607405pfi.78.2023.08.12.21.13.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 21:13:22 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdba48eccdso15877035ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 21:13:21 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:1bb:8e13:deba with SMTP id
 p1-20020a170902e74100b001bb8e13debamr7297585plf.11.1691900000803; Sat, 12 Aug
 2023 21:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731023701.2581713-1-contact@jookia.org> <3248110.44csPzL39Z@jernej-laptop>
In-Reply-To: <3248110.44csPzL39Z@jernej-laptop>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 12:13:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66g1On2uy0_15ZA5-uXcrLSg7V-tsw8zLo=tUY_HUW00g@mail.gmail.com>
Message-ID: <CAGb2v66g1On2uy0_15ZA5-uXcrLSg7V-tsw8zLo=tUY_HUW00g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maksim Kiselev <bigunclemax@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkl@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 4:59=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> /cc Marc
>
> Dne ponedeljek, 31. julij 2023 ob 04:36:59 CEST je John Watts napisal(a):
> > There are only one set of CAN pins available on these chips.
> > Specify these as the default to avoid redundancy in board device trees.
> >
> > Signed-off-by: John Watts <contact@jookia.org>
> > ---
> >  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> > 4086c0cc0f9d..b27c3fc13b0d 100644
> > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > @@ -898,6 +898,8 @@ can0: can@2504000 {
> >                       interrupts =3D <SOC_PERIPHERAL_IRQ(21)
> IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&ccu CLK_BUS_CAN0>;
> >                       resets =3D <&ccu RST_BUS_CAN0>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&can0_pins>;
> >                       status =3D "disabled";
> >               };
>
> pinctrl-names and pinctrl-0 are usually at the top. However, since there =
is no
> hard rule (I've seen it mixed), I'm fine with it.

AFAIK this only applies to board files where there are mostly none of the
resource (clocks, reg, resets, interrupts) properties. OOTH the compatible
property is always the first property. I would normally put the pinctrl
stuff after the internal resources, since it is an external property.
In the SoC dtsi files, they would end up after the resource properties
I mentioned above, and before the "status" property.

ChenYu

> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Since original DT node entry goes through netdev tree, this should be pic=
ked
> there or it can be dropped there and I pick both patches or I can pick pa=
tch
> for later kernel version.
>
> Best regards,
> Jernej
>
> >
> > @@ -907,6 +909,8 @@ can1: can@2504400 {
> >                       interrupts =3D <SOC_PERIPHERAL_IRQ(22)
> IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&ccu CLK_BUS_CAN1>;
> >                       resets =3D <&ccu RST_BUS_CAN1>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&can1_pins>;
> >                       status =3D "disabled";
> >               };
> >       };
>
>
>
>
