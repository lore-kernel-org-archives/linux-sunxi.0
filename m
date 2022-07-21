Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FE6AB3
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 21:23:39 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id k85so4950676ybk.7
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre-computer.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Run+xMnRSY7CRlvTUtTj3TnIjp+4Tul/BZ/TohYQqa4=;
        b=Lw5xmX1a1+lGRH/0hiMtH2vY6YXZhFKNm48ye4rOEBdtfS6WNPsJbcBK3CUCrD/7qS
         q0fHhNNA0RTHiwZAOS+6pKJi8GfKY6UCkQOaqk0yh5MQDKLpcp0SbzWp4FyGLzEqnV/o
         hDHSitpdloypQNjvvGLngUKfpd9WZDbZ3Pov2RuTGKE0ugGnF4j2hYRi7vkQNc6/dUg+
         cpoaIawPwTu626diQW6r6TDZeKQ6fkHkDs/EHP3/OoiTR+0ftyd28lj3CN6vvjEoHXK1
         fT8pSM66dgN0Lh2Egs2M6c6RzupYjunYE8B+t3mrKbhez78ReM9OZatJYduk6BBPsHix
         5drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Run+xMnRSY7CRlvTUtTj3TnIjp+4Tul/BZ/TohYQqa4=;
        b=2T1t0x2R+nbi2H9I/KplTep513nE1G73t1JK+puyjVhLh+r6VZxwBq2QNgN0aTxK8e
         BMkjKozWQdw6CE1R2MC/0fCrAK2a7nWVsQ/3bu6eduJ5vSsy8gMvSiieK+Mo2eDkunnt
         MLJsj7ZWr3CLuIGcbblIOsmPqHhiLAMBs1GE3U/+uC4iI7/kdI6Ty9GcN4xUJQrIbxZa
         Bh2PibEv8pFXLIWWzrhiyvLP3xCXtyJLHDIcystT8PJpVAqp5+y57D+PUffgE1Bj+xV2
         dcB+SrzZ7MdUs4LQXOpn6TnTCt8USZgLmdtJZEPOHd1gQl8dXSKnkKIquZT9id9kP6rH
         aGPQ==
X-Gm-Message-State: AJIora/0BsOqWl7GOheG6KUHuR0uXc3MshxVywI6skqA+B8APlQUo0b1
	OzCIUKvSiYksZ7iz5IgV/GX1oFeIbf6nV8s+eafcC4ZgBimPFnQ=
X-Google-Smtp-Source: AGRyM1vVux4pIcEWSLWitw+18814KfVSW/XY6aZFFOf7R7CFQL1yLKCyxxX80nCWMIjTY/WA8V6LGBsdUMyzyNtCCBE=
X-Received: by 2002:a25:d2cc:0:b0:66e:c66f:3cc with SMTP id
 j195-20020a25d2cc000000b0066ec66f03ccmr421695ybg.265.1658438619001; Thu, 21
 Jul 2022 14:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
 <5840812.lOV4Wx5bFT@kista> <CACqvRUbDeVBmVy7PX9Gqe3Qn8WAHxbcFVSzSPZsszC1fKYcoXg@mail.gmail.com>
 <4726146.GXAFRqVoOG@kista> <CACqvRUaSkfQ2GDhzGgmT=QXA=FTzg5srStbVbjh1Cy1vZF_=7w@mail.gmail.com>
In-Reply-To: <CACqvRUaSkfQ2GDhzGgmT=QXA=FTzg5srStbVbjh1Cy1vZF_=7w@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Jul 2022 17:23:28 -0400
Message-ID: <CACqvRUYho66jydekGR4L7YwBQAuussyLWBF=Ai-wB-VtUSo0mw@mail.gmail.com>
Subject: Re: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 4:58 PM Da Xue <da@libre.computer> wrote:
>
> On Thu, Jul 21, 2022 at 4:49 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
.com> wrote:
> >
> > Dne =C4=8Detrtek, 21. julij 2022 ob 22:33:09 CEST je Da Xue napisal(a):
> > > On Thu, Jul 21, 2022 at 4:05 PM Jernej =C5=A0krabec <jernej.skrabec@g=
mail.com>
> > wrote:
> > > > Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napisal=
(a):
> > > > > On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
> > > > >
> > > > > <jernej.skrabec@gmail.com> wrote:
> > > > > > Hi!
> > > > > >
> > > > > > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przy=
wara
> > napisal(a):
> > > > > > > On 21/07/2022 12:03, Da Xue wrote:
> > > > > > >
> > > > > > > Hi Da,
> > > > > > >
> > > > > > > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H=
5).
> > > > > > > > u-boot
> > > > > > > > gets stuck in SPL with this message for SD/eMMC respectivel=
y.
> > > > > > > >
> > > > > > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > > > > > >
> > > > > > > > I tested about 20 MicroSD cards from different brands and s=
ome
> > > > > > > > were
> > > > > > > > happy and some were not. Increasing the udelay to 8-10ms in
> > > > > > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset see=
ms to
> > > > > > > > fix
> > > > > > > > the issue for the MicroSD cards.
> > > > > > >
> > > > > > > That's interesting, thanks for the report. I don't remember h=
earing
> > > > > > > of
> > > > > > > issues with MMC before, at least not in the SPL.
> > > > > >
> > > > > > I certainly experienced this issue on board in question. I vagu=
ely
> > > > > > remember
> > > > > > asking about this issue on IRC. I also tried all sorts of tweak=
s, but
> > > > > > it
> > > > > > never occured to me that mmc reset timeout would be too short.
> > > > > >
> > > > > > Da, how did you find this?
> > > > >
> > > > > Someone on the Armbian forum posted that they had the same proble=
m
> > > > > with eMMC so I got suspicious. I scoped the MicroSD clock line an=
d
> > > > > realized the frequency goes high and then drops to very low as if=
 it
> > > > > never found the card.
> > > > > I had a hunch it was a stabilization delay and got lucky.
> > > > >
> > > > > > I only test one other H5 board occasionally, namely OrangePi PC=
2, but
> > > > > > I
> > > > > > never observed such issue there. I always needed about 5 attemp=
ts to
> > > > > > boot
> > > > > > ALL-H3-CC- H5 board, but once it's cold booted, warm boots alwa=
ys
> > > > > > succeed.
> > > > >
> > > > > I had run into this too so it didn't make any sense. I tried 5ms =
and
> > > > > it helped on some cards but not others.
> > > > > I know the Orange Pis do not have the series resistor for ESD
> > > > > protection of the SD GPIOs but that shouldn't affect this.
> > > > > So...who knows?
> > > > >
> > > > > > Best regards,
> > > > > > Jernej
> > > > > >
> > > > > > > It's a bit odd that waiting after the *controller* reset shou=
ld
> > > > > > > affect
> > > > > > > SD cards, and 1ms seems plenty for just the reset.
> > > > > > > I just checked and at least the SOFT_RESET and FIFO_RESET bit=
s are
> > > > > > > self
> > > > > > > clearing. Can you try to use wait_for_bit_le32() to wait for =
those
> > > > > > > parts
> > > > > > > to finish? See sun8i_emac_eth_start() for an example.

After more extensive testing with 5 MicroSD cards, 2 of them are still
inconsistent with waiting for SOFT_RESET and FIFO_RESET vs a hard 20ms
delay. I even tried putting a delay of 1ms after they cleared to no
avail.
I'm curious how larger 1TB MicroSD cards behave now but I don't have
any samples.

> > > > >
> > > > > I tested some more and here's the data:
> > > > > sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> > > > > sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> > > > > sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> > > > > Given this, I don't think it's an issue with the bit set delays. =
Might
> > > > > need more than 10ms even. I didn't change the udelay in probe.
> > > >
> > > > Idea here is that we wouldn't need to determine the appropriate del=
ay, but
> > > > instead, wait_for_bit_le32() would monitor reset bit and continue o=
nly
> > > > after reset bit would clear itself. Hopefully that happens after
> > > > everything is stable.
> > >
> > > I changed it to 50ms delay
> > >
> > > writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > if (wait_for_bit_le32( &priv->reg->gctrl,
> > > SUNXI_MMC_GCTRL_RESET, false, 50, false)) {
> > > printf("%s: Timeout\n", __func__);
> > > return ret;
> > > }
> > >
> > > and that seems to work. Shall I send the patch?
> >
> > Certainly, that's major improvement. Just 1 small nitpick - you don't n=
eed to
> > introduce ret variable, just return error -ETIMEDOUT directly.
>
> OK
>
> >
> > Maybe timeout can be raised even to 100 ms, now that it continues as so=
on as
> > possible. Better to be on the completely safe side. But I'll leave that
> > decision to you and Andre.
>
> I'll retest everything and check about changing the probe reset as
> well. If everything works, I'll submit the patch.
>
> >
> > Best regards,
> > Jernej
> >
> > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > > > > > And since you mentioned it's card related: can you check whet=
her the
> > > > > > > delay is actually needed somewhere else, later? At some point=
 where
> > > > > > > we
> > > > > > > wait to the card to response, for instance?
> > > > > > >
> > > > > > > I am not against taking this patch, if it fixes problems for =
you,
> > > > > > > but
> > > > > > > just want to avoid that it papers over other issues.
> > > > > > >
> > > > > > > Cheers,
> > > > > > > Andre
> > > > > > >
> > > > > > > > Author: Da Xue <da@libre.computer>
> > > > > > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > > > > > >
> > > > > > > >      sunxi: raise stabilization time for mmc from 1ms to 8m=
s
> > > > > > > >
> > > > > > > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mm=
c.c
> > > > > > > > index 1bb7b6d0e9..499e057725 100644
> > > > > > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > > > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > > > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct m=
mc
> > > > > > > > *mmc)
> > > > > > > >
> > > > > > > >          /* Reset controller */
> > > > > > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > > > > >
> > > > > > > > -       udelay(1000);
> > > > > > > > +       udelay(8000);
> > > > >
> > > > > This might need to be even higher. Like 20ms.
> > > > >
> > > > > > > >          return 0;
> > > > > > > >
> > > > > > > >   }
> > > > > > > >
> > > > > > > > I don't know the implications of this change so I am seekin=
g
> > > > > > > > feedback.
> > > > > > > > Are other boards having this issue as well or is it specifi=
c to
> > > > > > > > our
> > > > > > > > hardware?
> > > > > > > >
> > > > > > > > Best,
> > > > > > > > Da
> >
> >
