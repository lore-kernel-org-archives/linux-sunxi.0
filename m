Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A98293C4B
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881946; cv=none; b=FFzh/2LPGmBIa/QI+ePKQmvGzZIuuKA4UJVgam++oN8BhnZ9EE0/pbr/gmToc23QtIrvXN51h6SUN0JoKl3gYOuYEE0ORKCUj2Z/vCCGbf6pdJNftD4JF1cEHVUHKCJrskbXc0WWCyB7sSrVw5P+lLjevCusva7zU3J9LNvbRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881946; c=relaxed/simple;
	bh=rS2IvUHGDP7e41GAbVUWMoGzeRdRQt6arlmFScKX+TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTg/j2oJ4Yc+LFE+n2hbIaXyC6bNZPGkH/GE4sRUayPJw8mZSo5YEzMLdyknre5+OcXOKWBMFRkgJOgSd3KkcmUGvkErRgmpLXgKmXeJk5QETILC7hRn39wcgOHuGf+WwG9NJv9NF/aVderJd2317cB5dEqK95LSCsFuR4zqGzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-556373661aaso2622899e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jul 2025 02:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881941; x=1752486741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+G9RXNsu4/lHuRGJgb9rsOZh1/O90NgzHuMfw5EvSM=;
        b=WOTUL3d+k+LpNCZ8QERu6mG+h9r2IBB4KJ5p+QSn8d/AqrmVtKse/Wy3k5QCCqpSqI
         eC+NJ6aiHRgeKKq8T8y13s5vw6rrGp+lZ222YOLAlBYIbrK1hOXKv0mfPwuIGKy3rHVa
         4IX7w8EUok2zRHZOH5iCSgC23tfZ6flCXMzc1NnRxiQ2ljKT348zqYEKezL8Tzg/wCer
         dA0162MtRu7kK10Ft4uqpL1zwvpwJp7P3ETKtzViHvdu/Dwz6a62ToKQn5rtLs13Jg8Q
         02ONiOWS95dvd0a0c6nYQchGth6mWSbzwbFy8TKTMteLAqmdLxWD870LUGFBfpDiYNOQ
         CE3A==
X-Forwarded-Encrypted: i=1; AJvYcCX/RQG5v6Ld3tbANhB42P9IiMFO7pWZTUc3hOefbUfNqXDIvLKxqKy8MLcINnGogOyWWMk8nqqKfAA+gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq5Lv6pb+W7SrHLBob4R+AOLxK94FBfveCPmQnJe9tSc1srtzN
	Yr+C4V9cWdMaPbED8oMLcBKuOlZBiIZjBwXTypuSsUizV9zQf6BcgKCLtLqaDkTz
X-Gm-Gg: ASbGnctZgy68CuCgKg9VRHo3UFTjixBNY18JfNzgzVZiiRJOoOuqiXqq3AUZKtBJImO
	DgAO5gA0lHlOh08IuElf+v23wG93u+D4Gr0LyLJv6+5XBSosakPqQpvCkY9Ldx5UB+EYBcTMk1W
	oJN2QjKqqm71o6/3jnNvf8AaDeeYaEOFDELgiIDTRqRyftiNUS1cpK1YUTna2whUX8wkWiiEGDk
	VzorC9yA5I68+ijYXiPjA1Thj7to63mcFG10sVI+ujQbR2hl55sJgcgQpptKyxIuItfNIh8+WK8
	n/QxiPA2aVb+9wi47BbI762rHDJ8xNKpmoSxLlXNjRo/MxeJpRux/tJb77M54zpEB9qAZ6m+Q3Q
	aBS1H5zRWg3wlmPVKpTU=
X-Google-Smtp-Source: AGHT+IGRu/YAT/D9UOUX+x/3K0Z6Ji/x67YtNYnFTQPcNGbwYqGsNJyQKE1Hx+lCTGuhtrTxetDngw==
X-Received: by 2002:a05:6512:12ca:b0:553:adff:87da with SMTP id 2adb3069b0e04-557e5561ec2mr1557400e87.29.1751881940515;
        Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638497801sm1271874e87.127.2025.07.07.02.52.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b3b250621so26921331fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkZa5t4148ROTsNeJZsiVmmfqJm+fcNzUqWaKj/0+un9ZJ24y5cXgN+6UoKwvKyz0CKA8zr1IeUOeRBg==@lists.linux.dev
X-Received: by 2002:a2e:bc1c:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32f199879cbmr17915751fa.4.1751881939832; Mon, 07 Jul 2025
 02:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
In-Reply-To: <aGuV3gcKSRIyey53@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 17:52:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
X-Gm-Features: Ac12FXxL47gWjXZzuSKcW-0cl9NbdUx83T52e-2ARQaXs9NhvEcm9RfhLdsxmoU
Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Chen-Yu,
>
> Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Andre,
> > >
> > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > >
> > > > > Hi Paul,
> > > > >
> > > > > > The Allwinner A100/A133 only has a single emac instance, which =
is
> > > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > > trailing "0" that has no reason to be.
> > > > >
> > > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 di=
e: it's
> > > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > > registers (@0x5030000), and there is a second syscon register
> > > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > > It seem like no suitable pins are connected on the A133
> > > > > package, but that should not affect the A100 .dtsi (we use a simi=
lar
> > > > > approach for the H616 and A523).
> > > > >
> > > > > So I think we should keep the emac0 name.
> > > >
> > > > just thinking that it's even worse: this changes the DT visible pin=
ctrl
> > > > function name, so it's a DT ABI change. With the "emac0" function n=
ame,
> > > > Ethernet would work with stable kernels already (as everything is
> > > > compatible, it's just about DT changes). But with this change, pinc=
trl
> > > > drivers in older kernels would not match.
> > >
> > > Given that the port is still very early and experimental and has very=
 few users
> > > and no field deployment so I don't really think it would have annoyed=
 anybody in
> > > practice. But yes in principle you are right, while the header rename=
s keep the
> > > same value, the string names are used to match the device-tree defini=
tions and
> > > this constitues ABI that needs to remain stable.
> > >
> > > > So I would very much like to see this patch moved out. Is it just i=
n
> > > > LinusW's tree so far? I don't see it in -next yet.
> > >
> > > I don't think the patches were accepted for over a week so we can pro=
bably
> > > still act. I will send reverts, unless maintainers want to manually r=
emove
> > > these commits?
> >
> > I can drop the dts patches from the sunxi tree. Linus might be able to
> > drop the pinctrl patch.
> >
> > You definitely need to send a revert for the DT binding patch that is
> > already in net-next.
>
> Should this really affect the bindings though?
>
> From what Andre reported, both EMAC0 and EMAC1 should be the same block s=
o it
> doesn't seem particularly necessary to have a different compatible.
>
> Looking at Allwiner's BSP code for the A133[0], I don't see any differenc=
e
> between the two. While there's device_type property in Allwinner's dt, it=
's
> apparently not used by the driver[1].
>
> So I think we're still fine with a single compatible (without the control=
ler
> index in it).

The block is the same, but the integration is slightly different, as
the register for the RGMII clock delays and other stuff is at a different
offset in the system controller. The BSP handles this by directly
including the register in the "reg" property.

So yes, you do need a separate compatible string, if only to deal with
the slight difference in the integration layer.

ChenYu

> [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
>
> All the best,
>
> Paul
>
> >
> > ChenYu
> >
> >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > Cheers,
> > > > Andre.
> > > >
> > > > > [1]
> > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/b=
oot/dts/sunxi/sun50iw10p1.dtsi
> > > > >
> > > > >
> > > > > >
> > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwi=
nner A100 pin controller")
> > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > ---
> > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++---=
--------
> > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driv=
ers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >
> > > > >
> > > >
> > >
> > > --
> > > Paul Kocialkowski,
> > >
> > > Independent contractor - sys-base - https://www.sys-base.io/
> > > Free software developer - https://www.paulk.fr/
> > >
> > > Expert in multimedia, graphics and embedded hardware support with Lin=
ux.
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
