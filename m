Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26481C5F10
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751857688; cv=none; b=mjcwhCcmkAbS21akasRyeR8mIJunZVc9Qb8KwoeZBMeEpEdjd3PPonvgUjXAukNM48KWY76mdXCclIiKMOBTGwbfSRAASRZWGdP03wTJj5rLPNopCh7PRe+9zXuxAAUzArFA6XK7TwguauTZ8LdAy/ZRI+t6F9QOnVPfIAjixBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751857688; c=relaxed/simple;
	bh=Ca1CYyBhk01PGA3N3SBefAOzKtSvua47Ltsb0rPNAOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBxZ0TOtenTvOTIZDhEJGH38z9qYQowdFjGL442fNfsHnG9tFtSefDImIpOhyj0kgxgHan1c4JHUtmEDOUzDuhIiV5Ti8JUCIdb/HaXLKyzfbFpg50UF9Rtf9j3MvfrzoH0Qdl491G81eiBKxv75I9Sr05sFugWCrXXZ3Y9li40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b5165cf5so3275734e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 20:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751857683; x=1752462483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpwrIqvCgmRZGYtw8vPnIP+63GX8mQwr98rVO4r7ZcQ=;
        b=gADHp6L31hHaFl8XWtTOTG4f60WcOouiLEayHmTrKbCwc3l9Z0UAgGu2jM9pI6yyNL
         cug3zctX7p7vWAZiVYEM0oGjJiT1BSQnHUai1xuX5Jag8t6QHsyh93fOgTeHXo/AKXhq
         Owj6UX/pfqc2Qfr41Q5XBQtIlDKyoNvvfyMI8IY9OeSBJQNIQKv7+mdu7vZVWWwfzTgD
         ODBxju6EBbjt1FqHLDVSq0m7/B/lE2F1+eHbdXEReMLDfSCUOtBmYzPZ6bo2YYo2g2bx
         s9wqoS9DuG4jIP9Wmtjfpz3F7L+aK64NbZkT6xylUBQ4YfeoP4TjI482ralW+PGRjIm+
         AvoA==
X-Forwarded-Encrypted: i=1; AJvYcCWfxFnfZ16y/uedX1LCK50/cQbHhpQrF7rN4cDJdc5BbQzm3+dte/8f3mYC0w2xTjm+u7h1XDUAYnt1aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyERTHyAvfA2LCo2pHAWfCqolGiKf6Fz/Nl/kFW/oABirSdAfU/
	CP9dymE4Iw0OcwAV1HHKOkrzVGR32poLskJMZe5EqnSEOGqrRG7QqM9FwzETKbO4BSc=
X-Gm-Gg: ASbGncspcGWwIvWp+ZnIxmz1DDt3924mFrpMk6uu000JGeo/KvnnUD35ZqeIGuprPY/
	1QROZUEolk9EC83MYCBU3/A0E9NyDPNbkfO4jwuTsjY0K8+Dk0vnqYicXdFnsiod5FEHRQSjytc
	xM32f/zYjSqRQeu24dOmlEeGf6EGI7PcPJAqCT4PQ/6iV0iwlATrW/WAxNIOk54ugNb3YdSMiKt
	/cJ3xEAx6SFUTGgm/tsFw3tBv+IffFU9AzeklpdFXPisrdBw9+NUDtYrDloxYWAiiHcnSW6UcPX
	0T155GZQtsRHy1oJs5QQ3fRIq7yl15VEu2MZeTRSzCy8WNDj6m+HKLhcXzLb7b55dcTcVns+/YQ
	Z6T6n9HUgk0e1RkSuRJo=
X-Google-Smtp-Source: AGHT+IHv7OMrz3+Ujb1Dg7ZJ6y4tbgpA8bUMeMPCOG7TwO1awhdH38KOf2W/gz+0HqUjhH1Nh6QwwQ==
X-Received: by 2002:a05:6512:1101:b0:553:35c4:db08 with SMTP id 2adb3069b0e04-557e558bbd7mr1866638e87.30.1751857682348;
        Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c3830sm1184253e87.225.2025.07.06.20.08.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32f1df5703aso9439471fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 20:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW56fWOZTmDXBMw8cMMl2KnA7EiCRW5Oqj5mkRe9aR03WxAqz0lgt/yexLlEfq9Dh0g1Uz1dag4c8QAjA==@lists.linux.dev
X-Received: by 2002:a2e:a009:0:10b0:32c:4306:5a0f with SMTP id
 38308e7fff4ca-32f19b851d2mr10639921fa.30.1751857681789; Sun, 06 Jul 2025
 20:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 11:07:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzzu3aJMTQ8pfrhQCoLQSJDG0pZU4ID4TpVVBWoaKajpCQaMSfB2jg324k
Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
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

On Sun, Jul 6, 2025 at 11:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Andre,
> >
> > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > trailing "0" that has no reason to be.
> > > >
> > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die:=
 it's
> > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > registers (@0x5030000), and there is a second syscon register
> > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > It seem like no suitable pins are connected on the A133
> > > > package, but that should not affect the A100 .dtsi (we use a simila=
r
> > > > approach for the H616 and A523).
> > > >
> > > > So I think we should keep the emac0 name.
> > >
> > > just thinking that it's even worse: this changes the DT visible pinct=
rl
> > > function name, so it's a DT ABI change. With the "emac0" function nam=
e,
> > > Ethernet would work with stable kernels already (as everything is
> > > compatible, it's just about DT changes). But with this change, pinctr=
l
> > > drivers in older kernels would not match.
> >
> > Given that the port is still very early and experimental and has very f=
ew users
> > and no field deployment so I don't really think it would have annoyed a=
nybody in
> > practice. But yes in principle you are right, while the header renames =
keep the
> > same value, the string names are used to match the device-tree definiti=
ons and
> > this constitues ABI that needs to remain stable.
> >
> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.

FYI I dropped the dts patches for now, though I forgot to redo the -next
branch last night, so today's linux-next might not reflect it.

ChenYu

> You definitely need to send a revert for the DT binding patch that is
> already in net-next.
>
>
> ChenYu
>
>
> > Cheers,
> >
> > Paul
> >
> > > Cheers,
> > > Andre.
> > >
> > > > [1]
> > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boo=
t/dts/sunxi/sun50iw10p1.dtsi
> > > >
> > > >
> > > > >
> > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinn=
er A100 pin controller")
> > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > ---
> > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----=
------
> > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >
> > > >
> > >
> >
> > --
> > Paul Kocialkowski,
> >
> > Independent contractor - sys-base - https://www.sys-base.io/
> > Free software developer - https://www.paulk.fr/
> >
> > Expert in multimedia, graphics and embedded hardware support with Linux=
.
