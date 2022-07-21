Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B053BC
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 19:56:47 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id e69so4610273ybh.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre-computer.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=61mQ1pRUGpphXxoUnzlnov98dEsrb+sm5jjbQx69dx0=;
        b=I0ojlazQ7KIXL4WMuEC/ZA8/ARKdcmQcOS0QuVhOuIvryK92powPD5y94dLNsBvjrw
         +6m80p+BD+qf80V+q4lZdzqV4SteZUnKentmodRAQdzuFvaMV856cpMKwVIeQWUaJ2iZ
         0Gaw07oRUwjSlpmhZK8b5nZy2WQvW6Cpwth0L2wph8h5GHIGJhBWT3hs09q/WlJM2Kw6
         GVJ4fXt6bgsQB/xQVdJ0YEW+GoVRSjhwNVa7Ov2DqIM7h9fJiaPXtHll7aSdJ3xilt09
         R0Xf/Anzteb5VhxTtGS12BmS6O0jUHksvWKVdwayMdstT+PXKORBSFLupSctyKqilhp/
         agew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=61mQ1pRUGpphXxoUnzlnov98dEsrb+sm5jjbQx69dx0=;
        b=WkeNPezpemayEyMuICCi0qnhxQlfRdTg8hp3nvPQ5k7+u8nKy5q/eZC/cB6MAHoXMN
         f/PAZdwjgFOFeRQtAZzjm/IZP+Ua/1ZHEUhqJR5fRwsxrvB8b3TcY7/Q1sDZRRU6eyxR
         ZkdbclPqi6ysd78NNolTEHEQ20Q5cbSuVcIecMqZIiY+mrkRrBt5QHZLCnRt0sGZb9T1
         Sp+kqABMCn9WmAncCwKRAfFfuFI0B6f46vjAhYqwTBLPhjZby8YuqvamyYdkvmhdid4U
         qyyPPiFBMnyme6L7+2VqumQaJWa1XKvyMnp4HbWBnxRCmQoH/iDeTaGHJfaKVLdcm32v
         vDtA==
X-Gm-Message-State: AJIora/EqK85mB9fQqhwX4uFyE2QTuZdewya6PE3h06en9i4PJJeIEMf
	+HzSM+G8bPsXjkGmHFhhjkCFAfvb6FqrUl1GKXoq
X-Google-Smtp-Source: AGRyM1u07jn3wKQVuPjN7gF7vZoXg4vhtB6Nuncuk+ki1Ttds4MPfHRObRLbKXCgbCLdiy/G6od4O5zdFTxoYxfjv4g=
X-Received: by 2002:a5b:a46:0:b0:66d:f778:94cf with SMTP id
 z6-20020a5b0a46000000b0066df77894cfmr174176ybq.578.1658433406460; Thu, 21 Jul
 2022 12:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
 <1d28ba1c-3fa1-a8fb-849d-b3f4d77c6054@arm.com> <1748322.TLkxdtWsSY@jernej-laptop>
In-Reply-To: <1748322.TLkxdtWsSY@jernej-laptop>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Jul 2022 15:56:35 -0400
Message-ID: <CACqvRUaJevYB=JcYDd8ee4jG6qMR4rd7mVOwb+PzqMTGr365Ow@mail.gmail.com>
Subject: Re: Increasing stabilization time in sunxi_mmc_core_init
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
<jernej.skrabec@gmail.com> wrote:
>
> Hi!
>
> Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywara napis=
al(a):
> > On 21/07/2022 12:03, Da Xue wrote:
> >
> > Hi Da,
> >
> > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-boot
> > > gets stuck in SPL with this message for SD/eMMC respectively.
> > >
> > > Trying to boot from MMC1 or Trying to boot from MMC2
> > >
> > > I tested about 20 MicroSD cards from different brands and some were
> > > happy and some were not. Increasing the udelay to 8-10ms in
> > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to fix
> > > the issue for the MicroSD cards.
> >
> > That's interesting, thanks for the report. I don't remember hearing of
> > issues with MMC before, at least not in the SPL.
>
> I certainly experienced this issue on board in question. I vaguely rememb=
er
> asking about this issue on IRC. I also tried all sorts of tweaks, but it =
never
> occured to me that mmc reset timeout would be too short.
>
> Da, how did you find this?

Someone on the Armbian forum posted that they had the same problem
with eMMC so I got suspicious. I scoped the MicroSD clock line and
realized the frequency goes high and then drops to very low as if it
never found the card.
I had a hunch it was a stabilization delay and got lucky.

>
> I only test one other H5 board occasionally, namely OrangePi PC2, but I n=
ever
> observed such issue there. I always needed about 5 attempts to boot ALL-H=
3-CC-
> H5 board, but once it's cold booted, warm boots always succeed.

I had run into this too so it didn't make any sense. I tried 5ms and
it helped on some cards but not others.
I know the Orange Pis do not have the series resistor for ESD
protection of the SD GPIOs but that shouldn't affect this.
So...who knows?

>
> Best regards,
> Jernej
>
> > It's a bit odd that waiting after the *controller* reset should affect
> > SD cards, and 1ms seems plenty for just the reset.
> > I just checked and at least the SOFT_RESET and FIFO_RESET bits are self
> > clearing. Can you try to use wait_for_bit_le32() to wait for those part=
s
> > to finish? See sun8i_emac_eth_start() for an example.

I tested some more and here's the data:
sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
Given this, I don't think it's an issue with the bit set delays. Might
need more than 10ms even. I didn't change the udelay in probe.

> >
> > And since you mentioned it's card related: can you check whether the
> > delay is actually needed somewhere else, later? At some point where we
> > wait to the card to response, for instance?
> >
> > I am not against taking this patch, if it fixes problems for you, but
> > just want to avoid that it papers over other issues.
> >
> > Cheers,
> > Andre
> >
> > > Author: Da Xue <da@libre.computer>
> > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > >
> > >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> > >
> > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > > index 1bb7b6d0e9..499e057725 100644
> > > --- a/drivers/mmc/sunxi_mmc.c
> > > +++ b/drivers/mmc/sunxi_mmc.c
> > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
> > >
> > >          /* Reset controller */
> > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > >
> > > -       udelay(1000);
> > > +       udelay(8000);

This might need to be even higher. Like 20ms.

> > >
> > >          return 0;
> > >
> > >   }
> > >
> > > I don't know the implications of this change so I am seeking feedback=
.
> > > Are other boards having this issue as well or is it specific to our
> > > hardware?
> > >
> > > Best,
> > > Da
>
