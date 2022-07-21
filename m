Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1693C0B
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 20:33:21 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-31e0d4ad6caso29253937b3.10
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre-computer.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oLZQd7Jced7C8IO8KOskIN2ezhqolVyuLyqMbkB5QS8=;
        b=cYIECeuiVSQQ753FaUTmyD7kYb3X7xJtq8AuVu9VPbNIDglJozYKg2Kb6TWvkH4TU9
         LtQjz6N20zS4ij1s2AD2JJQMOqHsctoUYTPwIuyEIn4cOF+xfxi+gDeX2uWdM7ZsSdUJ
         3S94m7OnadK7bcz2bc2Aa3v+AAdXZW5WnVVcIdmxo8tw6WVlC9QSrzV5F8+kdAkqfi++
         78ZQoQ0ZcO5Nwx3GXdn0PemC3tGwJ1E313J2MjP8cHEVjtGT1GTMU9B9+Rjd5ztl9iR6
         Hvq81O2yQ0Q9DFxO+3QeVY6/yvc+ddgyTbhCULqS7VuIpAiNfvjpIKfImkv5zqfp3yzs
         ABtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oLZQd7Jced7C8IO8KOskIN2ezhqolVyuLyqMbkB5QS8=;
        b=cO4oW+euAU81AehEj/YJEJinjSxLSVfqbyYjlv6QKSzreew60DF7Cw0LGSlZhNXexK
         Cj956r5SJTwyZphJWJ8zMduQSEyngbopUqk6KxxZ92wCUeiTFYlD2CPirvmn64huo6XR
         OTMZ/c94SnJ+19Fk1fZwlsuYPdKHyRuasIWrHU+ZQSTCJKtegnqjxAmne4qXW9YYOKhQ
         juAYylr3xEiSO03WBuTolpMIDqyVWK54Zw7DOHYcjvWFw49iyKLkUroyrIXIy0E4HKRd
         v+4sFD6xFnVPyhAXE1syXlE8VIN+3LaLPDi75+4mqwhUBd64uVhmYVaxG7XvotKqzPML
         GnwA==
X-Gm-Message-State: AJIora+bBAPvcOiEcKByxAWByvCr6378AIxMacbzD5XM0Z9aXb1zTwfP
	RTZ/byiIPKbMwlMS5UFiwnGLXb0K/KudHgSp20FF8Z4+KMY0yig=
X-Google-Smtp-Source: AGRyM1s+qC+3jqNbIX1QVuFOrpwrOfmL/lo+zdciScn1o7N5vPyyeyh6UAYEQr5g6+Qvl2YwDMvVtX74lMBYISPeciE=
X-Received: by 2002:a81:84c:0:b0:31e:66b7:2ae5 with SMTP id
 73-20020a81084c000000b0031e66b72ae5mr302089ywi.147.1658435600133; Thu, 21 Jul
 2022 13:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
 <1748322.TLkxdtWsSY@jernej-laptop> <CACqvRUaJevYB=JcYDd8ee4jG6qMR4rd7mVOwb+PzqMTGr365Ow@mail.gmail.com>
 <5840812.lOV4Wx5bFT@kista>
In-Reply-To: <5840812.lOV4Wx5bFT@kista>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Jul 2022 16:33:09 -0400
Message-ID: <CACqvRUbDeVBmVy7PX9Gqe3Qn8WAHxbcFVSzSPZsszC1fKYcoXg@mail.gmail.com>
Subject: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 4:05 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napisal(a):
> > On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
> >
> > <jernej.skrabec@gmail.com> wrote:
> > > Hi!
> > >
> > > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywara n=
apisal(a):
> > > > On 21/07/2022 12:03, Da Xue wrote:
> > > >
> > > > Hi Da,
> > > >
> > > > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-=
boot
> > > > > gets stuck in SPL with this message for SD/eMMC respectively.
> > > > >
> > > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > > >
> > > > > I tested about 20 MicroSD cards from different brands and some we=
re
> > > > > happy and some were not. Increasing the udelay to 8-10ms in
> > > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to =
fix
> > > > > the issue for the MicroSD cards.
> > > >
> > > > That's interesting, thanks for the report. I don't remember hearing=
 of
> > > > issues with MMC before, at least not in the SPL.
> > >
> > > I certainly experienced this issue on board in question. I vaguely
> > > remember
> > > asking about this issue on IRC. I also tried all sorts of tweaks, but=
 it
> > > never occured to me that mmc reset timeout would be too short.
> > >
> > > Da, how did you find this?
> >
> > Someone on the Armbian forum posted that they had the same problem
> > with eMMC so I got suspicious. I scoped the MicroSD clock line and
> > realized the frequency goes high and then drops to very low as if it
> > never found the card.
> > I had a hunch it was a stabilization delay and got lucky.
> >
> > > I only test one other H5 board occasionally, namely OrangePi PC2, but=
 I
> > > never observed such issue there. I always needed about 5 attempts to =
boot
> > > ALL-H3-CC- H5 board, but once it's cold booted, warm boots always
> > > succeed.
> >
> > I had run into this too so it didn't make any sense. I tried 5ms and
> > it helped on some cards but not others.
> > I know the Orange Pis do not have the series resistor for ESD
> > protection of the SD GPIOs but that shouldn't affect this.
> > So...who knows?
> >
> > > Best regards,
> > > Jernej
> > >
> > > > It's a bit odd that waiting after the *controller* reset should aff=
ect
> > > > SD cards, and 1ms seems plenty for just the reset.
> > > > I just checked and at least the SOFT_RESET and FIFO_RESET bits are =
self
> > > > clearing. Can you try to use wait_for_bit_le32() to wait for those =
parts
> > > > to finish? See sun8i_emac_eth_start() for an example.
> >
> > I tested some more and here's the data:
> > sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> > sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> > sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> > Given this, I don't think it's an issue with the bit set delays. Might
> > need more than 10ms even. I didn't change the udelay in probe.
>
> Idea here is that we wouldn't need to determine the appropriate delay, bu=
t
> instead, wait_for_bit_le32() would monitor reset bit and continue only af=
ter
> reset bit would clear itself. Hopefully that happens after everything is
> stable.

I changed it to 50ms delay

writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
if (wait_for_bit_le32( &priv->reg->gctrl,
SUNXI_MMC_GCTRL_RESET, false, 50, false)) {
printf("%s: Timeout\n", __func__);
return ret;
}

and that seems to work. Shall I send the patch?

>
> Best regards,
> Jernej
>
> >
> > > > And since you mentioned it's card related: can you check whether th=
e
> > > > delay is actually needed somewhere else, later? At some point where=
 we
> > > > wait to the card to response, for instance?
> > > >
> > > > I am not against taking this patch, if it fixes problems for you, b=
ut
> > > > just want to avoid that it papers over other issues.
> > > >
> > > > Cheers,
> > > > Andre
> > > >
> > > > > Author: Da Xue <da@libre.computer>
> > > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > > >
> > > > >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> > > > >
> > > > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > > > > index 1bb7b6d0e9..499e057725 100644
> > > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mm=
c)
> > > > >
> > > > >          /* Reset controller */
> > > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > >
> > > > > -       udelay(1000);
> > > > > +       udelay(8000);
> >
> > This might need to be even higher. Like 20ms.
> >
> > > > >          return 0;
> > > > >
> > > > >   }
> > > > >
> > > > > I don't know the implications of this change so I am seeking feed=
back.
> > > > > Are other boards having this issue as well or is it specific to o=
ur
> > > > > hardware?
> > > > >
> > > > > Best,
> > > > > Da
>
>
