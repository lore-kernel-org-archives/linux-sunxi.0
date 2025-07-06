Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0F3207A16
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814295; cv=none; b=OmzSlATx3gONtgsjPc7JOdtreUyBskO00PdSRJSi/e15thq6KpiDOpfTEaWyaWfLOMe3egNkdSx5/pcw8eJQgnuukFuevmukbdOq4Xva+v1PGAMj6wQ3xMq6wOWGiD/1rf8OI8hYf86brIKXso9DlXxljxvIRjbPTeerGXaKeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814295; c=relaxed/simple;
	bh=R9C5i1aZz7KYzDHakfqVgxe0xLe+cYtqlwq5WzP8zvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAeIMWppZ14NzupIDAK9PDLo6tf2fPGp7ET8xGR6z38AytEHF/73VSgQNx8hgCm0SR187de9obWGKA2p34WxmZmxue8OcOYoSSLG45IEpxlw+2X9CNqJuHSi8s+FQPGYgUijRi2RXyrU4FO3Mb2Ucvf0Jg6iCKsBN46acTmmCJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b165c80cso2264948e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 08:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751814289; x=1752419089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMlbKX+K6Yi3ZmsuHL3jCao7JCUHreI4o1rb+0N/8yw=;
        b=KGZ5/7eT+eCgEDcEyZ5SHLXBK1v95dRQa8cv5OA1ziaosn83zja5OT6b6PGpZcTsH7
         fje3QxEnYw9/elymfgOhV8zUGLwgZnQfScuGPP7GxIQ1U69c6k/cRgo37vxA+x71HmsF
         KNmVDcACEVImlwrFeuevA5O+TZlki+owoi0VfVTfBPdunK6MXz/idv5DPzOZgH6ZCJ8N
         vvHuYHHUyaGAN9M1BszD56ZXYeoA7iS1kI7OV/Dnq1wh5Qhkw2L3ZzQy0og0AlZSjBvd
         CDrtT/Njx8XM1epyyhTw/u2DO1BIhrWToDE2WjOYL5S5O+79zcw+m0po5S+k9q9YLogj
         ir0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUveJlOGFLVLQD9HQmKIxTadpLnVNvEAPe6L3Ur3jO2ogh5c0++Pa4Alid1Na1Z5n4xT1dZUvaAi6PvSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcxoi2xdwY6cYqFbAFNHrRM9sdcCu5oNTzl/bAt1tP1MvwkUcI
	AzDVktieI13DGahmT9Y1F5xAQbYOh287yNZYpzTiTJhzE5nQimI4z6wTitN7K9LF4+4=
X-Gm-Gg: ASbGncuEM0U/BXVVBkgJi+59omY7eOxpSVi1iCS6lYiUV9+Mh+7I1TZ8StssXyKZEvZ
	eqX5kfjlGGQaO2NPgp+S4/sCEkikmioXvo2TSFmNx3qRrryZjco9BZJLXK2xhZqbF4wraMl+m79
	BpgkvtHdmUyAhKQuf/pxYlWdZUI0h50uMSCd6AyQGAv+iXAGuNmT4ukHKFKtV9a3U5gWGPTre+o
	1Zj08c2uZJbRyx9DTfTCUNy8EVDnJ5XFdNgrEt1hqZyyKJ5/rywliykOd/Um+31FIqJHJJaXrOg
	ZVvwXbpyj2QjBA4MwMvUGUNgaYV+RCQFY/dOQAnbFQ2/vlcM2NY/EqKrs3pMzuUR/mIpVDNF2Za
	Xif+Iz9E/qzX3xyw=
X-Google-Smtp-Source: AGHT+IGfSYrekSrTqkqUl+UGJK/+dzIIabIanxbIqsSKE4mZlt7ZmHY8ISvYfphkWRlzZWVaSQDC4w==
X-Received: by 2002:a05:6512:3f26:b0:553:ab9a:c94 with SMTP id 2adb3069b0e04-557e553a3c5mr1362269e87.6.1751814288245;
        Sun, 06 Jul 2025 08:04:48 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d33f3sm991374e87.68.2025.07.06.08.04.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b165c80cso2264916e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYQanU0b4EsDDU/CF55ISwMQeqpeH369N8H+gWTP9MhDUTO27h3A7dspwqjdKqNsOmAvviocPM5GtK5g==@lists.linux.dev
X-Received: by 2002:a05:6512:1101:b0:553:35c4:db08 with SMTP id
 2adb3069b0e04-557e558bbd7mr1533619e87.30.1751814287250; Sun, 06 Jul 2025
 08:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan> <aGm8n_wJPiGk85E4@collins>
In-Reply-To: <aGm8n_wJPiGk85E4@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 23:04:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
X-Gm-Features: Ac12FXzlhh-z7i6IZD8r5Xo-cn0NQ2gJKv7hIIuXOkIRtOdxBVrM3nhyYAYGLrQ
Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
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

On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Andre,
>
> Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > On Fri, 4 Jul 2025 23:35:35 +0100
> > Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Hi,
> >
> > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > trailing "0" that has no reason to be.
> > >
> > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die: i=
t's
> > > indeed not mentioned in the manual, but you can probe its MMIO
> > > registers (@0x5030000), and there is a second syscon register
> > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > It seem like no suitable pins are connected on the A133
> > > package, but that should not affect the A100 .dtsi (we use a similar
> > > approach for the H616 and A523).
> > >
> > > So I think we should keep the emac0 name.
> >
> > just thinking that it's even worse: this changes the DT visible pinctrl
> > function name, so it's a DT ABI change. With the "emac0" function name,
> > Ethernet would work with stable kernels already (as everything is
> > compatible, it's just about DT changes). But with this change, pinctrl
> > drivers in older kernels would not match.
>
> Given that the port is still very early and experimental and has very few=
 users
> and no field deployment so I don't really think it would have annoyed any=
body in
> practice. But yes in principle you are right, while the header renames ke=
ep the
> same value, the string names are used to match the device-tree definition=
s and
> this constitues ABI that needs to remain stable.
>
> > So I would very much like to see this patch moved out. Is it just in
> > LinusW's tree so far? I don't see it in -next yet.
>
> I don't think the patches were accepted for over a week so we can probabl=
y
> still act. I will send reverts, unless maintainers want to manually remov=
e
> these commits?

I can drop the dts patches from the sunxi tree. Linus might be able to
drop the pinctrl patch.

You definitely need to send a revert for the DT binding patch that is
already in net-next.


ChenYu


> Cheers,
>
> Paul
>
> > Cheers,
> > Andre.
> >
> > > [1]
> > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/=
dts/sunxi/sun50iw10p1.dtsi
> > >
> > >
> > > >
> > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner=
 A100 pin controller")
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > ---
> > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-------=
----
> > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/=
pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > >
> > >
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.
