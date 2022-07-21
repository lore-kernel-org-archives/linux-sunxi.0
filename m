Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413123CD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 20:58:19 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-31e67c46ba2so30206387b3.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre-computer.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JblhATwOe6jvpUOq+VY1YWu2IUmRnSwgsXZMtF5FzHA=;
        b=tDcs9DPDfCf5XJ00y4IzvO4MtAPF0OGcDOipbflyLzUNi+FPNWnl4IIc6mwmXyod6A
         ke2ckKIZ/+2SplPRBjJUPIdfhWF8FAkuXJMoaz/CTzGnycm1TG51PjKUuVixpfkATWJT
         qz62l3VK3tWaPXKM/s77H+zHOtxd71zAWvhK7COG6wZxRdt6MovfWUq02/zUKbS4mndY
         on8Z8wdXc7E73WpY13Xy+nsS7kROcvRy037MysoqnpIeGiMC6b5uc+FAg5x6qJtq1Ptp
         +owXHs+gwhiKZji7aIFKNm4hc/Cg4adMRnzft09qpxsFjuHW8AZCCBAKNiGvCK3VT0a1
         b9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JblhATwOe6jvpUOq+VY1YWu2IUmRnSwgsXZMtF5FzHA=;
        b=f1vcrS6fYGOZlh+eb7lI8zIzqtIn6MLnFyOzWo4RpVTUSSTshsNgAW1k/TwvckdDbV
         bijNFPUsW10NJNDUtCKnKqTrfbTyWMKxRCzeCj4GW91sI6Utvs7PTLGTEjHPpnPeexzV
         P9VOQJbpQWWVxWzifhRlmhov/F4ic6x/0q0BvWGD+VXPLVUTzW+gl97xROxV7ct93N43
         xv1nb99t2/u8VaRNZRzS9J2HkSt6jmhO3ToxPCpmUUqroTWLebTrbhCXLMqaQuhUvhps
         En4+qKmIV3c2aDFaC4wwN5JjZudV1xOpXnM1cAjcza/DHHKYXOljERdnd07COVhUkAsx
         9K5g==
X-Gm-Message-State: AJIora+K5sw1yivyY6bLTyaxoUNrZ0M2mTlgWkwJjECd9n0ntlkNmJO4
	san4u+c7/PNghuE1iDM+Bz+KQuceHtSzY2HE25of
X-Google-Smtp-Source: AGRyM1s2WOJEd5hwqzD+vvQ9weDUoXQcDUcGcU6XfecGV7aYdUmlSjAiYCoTBnnwhVYec+qn4OXsR4kzdL1MXD6q5y8=
X-Received: by 2002:a81:15c2:0:b0:31d:e923:81f2 with SMTP id
 185-20020a8115c2000000b0031de92381f2mr427507ywv.386.1658437098768; Thu, 21
 Jul 2022 13:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
 <5840812.lOV4Wx5bFT@kista> <CACqvRUbDeVBmVy7PX9Gqe3Qn8WAHxbcFVSzSPZsszC1fKYcoXg@mail.gmail.com>
 <4726146.GXAFRqVoOG@kista>
In-Reply-To: <4726146.GXAFRqVoOG@kista>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Jul 2022 16:58:08 -0400
Message-ID: <CACqvRUaSkfQ2GDhzGgmT=QXA=FTzg5srStbVbjh1Cy1vZF_=7w@mail.gmail.com>
Subject: Re: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 4:49 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
>
> Dne =C4=8Detrtek, 21. julij 2022 ob 22:33:09 CEST je Da Xue napisal(a):
> > On Thu, Jul 21, 2022 at 4:05 PM Jernej =C5=A0krabec <jernej.skrabec@gma=
il.com>
> wrote:
> > > Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napisal(a=
):
> > > > On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
> > > >
> > > > <jernej.skrabec@gmail.com> wrote:
> > > > > Hi!
> > > > >
> > > > > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywa=
ra
> napisal(a):
> > > > > > On 21/07/2022 12:03, Da Xue wrote:
> > > > > >
> > > > > > Hi Da,
> > > > > >
> > > > > > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5)=
.
> > > > > > > u-boot
> > > > > > > gets stuck in SPL with this message for SD/eMMC respectively.
> > > > > > >
> > > > > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > > > > >
> > > > > > > I tested about 20 MicroSD cards from different brands and som=
e
> > > > > > > were
> > > > > > > happy and some were not. Increasing the udelay to 8-10ms in
> > > > > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems=
 to
> > > > > > > fix
> > > > > > > the issue for the MicroSD cards.
> > > > > >
> > > > > > That's interesting, thanks for the report. I don't remember hea=
ring
> > > > > > of
> > > > > > issues with MMC before, at least not in the SPL.
> > > > >
> > > > > I certainly experienced this issue on board in question. I vaguel=
y
> > > > > remember
> > > > > asking about this issue on IRC. I also tried all sorts of tweaks,=
 but
> > > > > it
> > > > > never occured to me that mmc reset timeout would be too short.
> > > > >
> > > > > Da, how did you find this?
> > > >
> > > > Someone on the Armbian forum posted that they had the same problem
> > > > with eMMC so I got suspicious. I scoped the MicroSD clock line and
> > > > realized the frequency goes high and then drops to very low as if i=
t
> > > > never found the card.
> > > > I had a hunch it was a stabilization delay and got lucky.
> > > >
> > > > > I only test one other H5 board occasionally, namely OrangePi PC2,=
 but
> > > > > I
> > > > > never observed such issue there. I always needed about 5 attempts=
 to
> > > > > boot
> > > > > ALL-H3-CC- H5 board, but once it's cold booted, warm boots always
> > > > > succeed.
> > > >
> > > > I had run into this too so it didn't make any sense. I tried 5ms an=
d
> > > > it helped on some cards but not others.
> > > > I know the Orange Pis do not have the series resistor for ESD
> > > > protection of the SD GPIOs but that shouldn't affect this.
> > > > So...who knows?
> > > >
> > > > > Best regards,
> > > > > Jernej
> > > > >
> > > > > > It's a bit odd that waiting after the *controller* reset should
> > > > > > affect
> > > > > > SD cards, and 1ms seems plenty for just the reset.
> > > > > > I just checked and at least the SOFT_RESET and FIFO_RESET bits =
are
> > > > > > self
> > > > > > clearing. Can you try to use wait_for_bit_le32() to wait for th=
ose
> > > > > > parts
> > > > > > to finish? See sun8i_emac_eth_start() for an example.
> > > >
> > > > I tested some more and here's the data:
> > > > sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> > > > sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> > > > sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> > > > Given this, I don't think it's an issue with the bit set delays. Mi=
ght
> > > > need more than 10ms even. I didn't change the udelay in probe.
> > >
> > > Idea here is that we wouldn't need to determine the appropriate delay=
, but
> > > instead, wait_for_bit_le32() would monitor reset bit and continue onl=
y
> > > after reset bit would clear itself. Hopefully that happens after
> > > everything is stable.
> >
> > I changed it to 50ms delay
> >
> > writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > if (wait_for_bit_le32( &priv->reg->gctrl,
> > SUNXI_MMC_GCTRL_RESET, false, 50, false)) {
> > printf("%s: Timeout\n", __func__);
> > return ret;
> > }
> >
> > and that seems to work. Shall I send the patch?
>
> Certainly, that's major improvement. Just 1 small nitpick - you don't nee=
d to
> introduce ret variable, just return error -ETIMEDOUT directly.

OK

>
> Maybe timeout can be raised even to 100 ms, now that it continues as soon=
 as
> possible. Better to be on the completely safe side. But I'll leave that
> decision to you and Andre.

I'll retest everything and check about changing the probe reset as
well. If everything works, I'll submit the patch.

>
> Best regards,
> Jernej
>
> >
> > > Best regards,
> > > Jernej
> > >
> > > > > > And since you mentioned it's card related: can you check whethe=
r the
> > > > > > delay is actually needed somewhere else, later? At some point w=
here
> > > > > > we
> > > > > > wait to the card to response, for instance?
> > > > > >
> > > > > > I am not against taking this patch, if it fixes problems for yo=
u,
> > > > > > but
> > > > > > just want to avoid that it papers over other issues.
> > > > > >
> > > > > > Cheers,
> > > > > > Andre
> > > > > >
> > > > > > > Author: Da Xue <da@libre.computer>
> > > > > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > > > > >
> > > > > > >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> > > > > > >
> > > > > > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.=
c
> > > > > > > index 1bb7b6d0e9..499e057725 100644
> > > > > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc
> > > > > > > *mmc)
> > > > > > >
> > > > > > >          /* Reset controller */
> > > > > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > > > >
> > > > > > > -       udelay(1000);
> > > > > > > +       udelay(8000);
> > > >
> > > > This might need to be even higher. Like 20ms.
> > > >
> > > > > > >          return 0;
> > > > > > >
> > > > > > >   }
> > > > > > >
> > > > > > > I don't know the implications of this change so I am seeking
> > > > > > > feedback.
> > > > > > > Are other boards having this issue as well or is it specific =
to
> > > > > > > our
> > > > > > > hardware?
> > > > > > >
> > > > > > > Best,
> > > > > > > Da
>
>
