Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3402053BC
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 20:05:39 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c72so643179edf.8
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PaLcFu9rwzUnqMZ48r4Catlt2SttxrUmX4nBWUvfdbY=;
        b=AGwY9ZMbM8PaxM3CPdk5RE1vcbM2wnjorRsaQbgLys1Hj2yqa6ZriOdZZYMSehrAo/
         DjNhYP2kIVQ0Pn8jLePrjNaJgTprs6zQV0bYl0f9awhdVas4anpeR29oNNA5oV+CFJgT
         2+y4K2OvVX6a8GwyLKSoHDxHqt2sjParDCvmSA+TATo9jQNJP5Eyic1W9k8Nfd603uDQ
         L+rYHeng9IsRuWUk/+lHSddzG4StpxGbmO65M3ua7ZAx9/xNL6nFyJ/l1nNhN9+HC5tI
         efjJIPoU4xBp5+pryZBTjNhBbySwf2isH5BABjqk6ikHct/Qh1BqLMX35/EAreQiOtr0
         I/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaLcFu9rwzUnqMZ48r4Catlt2SttxrUmX4nBWUvfdbY=;
        b=ifA5BzdxjLlPkScB5nkXGpW4qySPEa7OqDaSrrV9i4h4a6gZqmEenPzGJtfUEWpOD5
         tXTMVAXErJg05N86afvTSJHj8OdGkPk3Fg5T8vjtr4lZHmWyRIT5+YoMV1iA0obmcvaK
         euZggwgRaYfK2NO3WHlQiePKBwJAlae1lZ8kQe61yXt6rhivKZckdpTdWSYdR5vR719A
         Ijgn9tTRaYqVAoY473bCPspbL9yszH7vIavF8Y+a480yW+4MhO/Dvj0K7+ySRKPbr8Yi
         x2yQxs8q5cUd3hgWOw1zPccIXIIUZ5z6jeWmcA3uGcAVdivNpa9yNKYQXjB8kCPWndV3
         VEUQ==
X-Gm-Message-State: AJIora8C9BOUw8MQViu3aQ2QpXmh0Qv6kb8SpII/kdYQfO3IcH0RNUOG
	Z6YKoxaDdanFNWJil5aHPrq40lYoT0jC3Q==
X-Google-Smtp-Source: AGRyM1sPwgqmR8nIftjot/qTfqGZJvHz1B9Wq3zTVeHxNCWG7hgAng7pyMmPMeiHkfdT9fnvfj0TJg==
X-Received: by 2002:aa7:c58d:0:b0:43b:96b3:af1c with SMTP id g13-20020aa7c58d000000b0043b96b3af1cmr18670237edq.141.1658433937292;
        Thu, 21 Jul 2022 13:05:37 -0700 (PDT)
Received: from kista.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id g17-20020a17090604d100b0072f441a04a6sm1186108eja.5.2022.07.21.13.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 13:05:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Da Xue <da@libre.computer>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de
Subject: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
Date: Thu, 21 Jul 2022 22:05:35 +0200
Message-ID: <5840812.lOV4Wx5bFT@kista>
In-Reply-To: <CACqvRUaJevYB=JcYDd8ee4jG6qMR4rd7mVOwb+PzqMTGr365Ow@mail.gmail.com>
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com> <1748322.TLkxdtWsSY@jernej-laptop> <CACqvRUaJevYB=JcYDd8ee4jG6qMR4rd7mVOwb+PzqMTGr365Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napisal(a):
> On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
>=20
> <jernej.skrabec@gmail.com> wrote:
> > Hi!
> >=20
> > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywara nap=
isal(a):
> > > On 21/07/2022 12:03, Da Xue wrote:
> > >=20
> > > Hi Da,
> > >=20
> > > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-bo=
ot
> > > > gets stuck in SPL with this message for SD/eMMC respectively.
> > > >=20
> > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > >=20
> > > > I tested about 20 MicroSD cards from different brands and some were
> > > > happy and some were not. Increasing the udelay to 8-10ms in
> > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to fix
> > > > the issue for the MicroSD cards.
> > >=20
> > > That's interesting, thanks for the report. I don't remember hearing of
> > > issues with MMC before, at least not in the SPL.
> >=20
> > I certainly experienced this issue on board in question. I vaguely
> > remember
> > asking about this issue on IRC. I also tried all sorts of tweaks, but it
> > never occured to me that mmc reset timeout would be too short.
> >=20
> > Da, how did you find this?
>=20
> Someone on the Armbian forum posted that they had the same problem
> with eMMC so I got suspicious. I scoped the MicroSD clock line and
> realized the frequency goes high and then drops to very low as if it
> never found the card.
> I had a hunch it was a stabilization delay and got lucky.
>=20
> > I only test one other H5 board occasionally, namely OrangePi PC2, but I
> > never observed such issue there. I always needed about 5 attempts to bo=
ot
> > ALL-H3-CC- H5 board, but once it's cold booted, warm boots always
> > succeed.
>=20
> I had run into this too so it didn't make any sense. I tried 5ms and
> it helped on some cards but not others.
> I know the Orange Pis do not have the series resistor for ESD
> protection of the SD GPIOs but that shouldn't affect this.
> So...who knows?
>=20
> > Best regards,
> > Jernej
> >=20
> > > It's a bit odd that waiting after the *controller* reset should affect
> > > SD cards, and 1ms seems plenty for just the reset.
> > > I just checked and at least the SOFT_RESET and FIFO_RESET bits are se=
lf
> > > clearing. Can you try to use wait_for_bit_le32() to wait for those pa=
rts
> > > to finish? See sun8i_emac_eth_start() for an example.
>=20
> I tested some more and here's the data:
> sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> Given this, I don't think it's an issue with the bit set delays. Might
> need more than 10ms even. I didn't change the udelay in probe.

Idea here is that we wouldn't need to determine the appropriate delay, but=
=20
instead, wait_for_bit_le32() would monitor reset bit and continue only afte=
r=20
reset bit would clear itself. Hopefully that happens after everything is=20
stable.

Best regards,
Jernej

>=20
> > > And since you mentioned it's card related: can you check whether the
> > > delay is actually needed somewhere else, later? At some point where we
> > > wait to the card to response, for instance?
> > >=20
> > > I am not against taking this patch, if it fixes problems for you, but
> > > just want to avoid that it papers over other issues.
> > >=20
> > > Cheers,
> > > Andre
> > >=20
> > > > Author: Da Xue <da@libre.computer>
> > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > >=20
> > > >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> > > >=20
> > > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > > > index 1bb7b6d0e9..499e057725 100644
> > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
> > > >=20
> > > >          /* Reset controller */
> > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > >=20
> > > > -       udelay(1000);
> > > > +       udelay(8000);
>=20
> This might need to be even higher. Like 20ms.
>=20
> > > >          return 0;
> > > >  =20
> > > >   }
> > > >=20
> > > > I don't know the implications of this change so I am seeking feedba=
ck.
> > > > Are other boards having this issue as well or is it specific to our
> > > > hardware?
> > > >=20
> > > > Best,
> > > > Da


