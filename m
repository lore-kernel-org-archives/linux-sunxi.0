Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989B6AB3
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 21:30:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w12so3710244edd.13
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 14:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eJI5Op2YHE49C4M5akAwlZ9KCB1rqIOvbmyzF870DA=;
        b=iakCBM4YHOlp5+2Y5Sieejedl2p9+b3X/15kLAQdoVsy/InugdQwfkn9ovoykNVgev
         EehAGqGBMCa2Q0zeuZZ1i2jy27OBTrSCD8dQvevXVLgdnC5AdgRoS7C6VaAGGkR5nPfp
         xn/zn/C93oG+792RKescRBSm/lPGIRQ0NortWwVfdjDauMYecVIjoBHIEnyi5guZMMU1
         UcKDc0vc1OqTr4qBQXebnlKFf7XdIMbI8Sit05lFk2F24qKNkKCujlrTZJmVDfRIVu58
         dmFrsvVoZ4FaU9/yjFue/G7Tx/UeFo1Po3aUVk9vldT3X+upqqZ7x0S71ZY42hua7qqo
         +NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eJI5Op2YHE49C4M5akAwlZ9KCB1rqIOvbmyzF870DA=;
        b=h4sY9ALRuO+KVDJw2Fjvpx1Zfj0olLMyVwSAfZ96mVFCuIbPPoHzW0XU9kydToq1ow
         8+wuCTBh0l+9nWKIvsRj9keUrXFzniAeqYrraLMiRhjX9EHvOGZJKs1aVCUzeUWcNZuV
         QRxwYzp0OjXaIjNYYhDDEZgp9Hh/O27G/rhsE6lkzvobR+iUmbCwxT4CYMFxIcJ4VgKb
         mDdjGn1OopaDEufc602XMjDsSRiaBieJ0b/tsRXY3vYDKiMzo6wI3RVMzBZSfwsKAasz
         UkpPYb34WJ5tVAmBBlLTYIQ58+wkgwQjCNNrFQhkt+fGtEY8TMcT/vvT6uaWYrwrCLyC
         3XzA==
X-Gm-Message-State: AJIora+eXEtP8zJuQgZ5LEvLQczoVCQ0LC9jYjC43ekrWLNmkGKr5kEb
	b4WdkULA2avi7zVTCftxJQC/9u8SRrPY1w==
X-Google-Smtp-Source: AGRyM1vEPp6ULRkvw3bi5MbCpxpFueuKlH0i14CeVDkI65Xk4Ejn362kjMQzhJpumVSY/RzCUjGbeg==
X-Received: by 2002:aa7:db87:0:b0:43b:a0d5:8848 with SMTP id u7-20020aa7db87000000b0043ba0d58848mr395738edt.60.1658439025730;
        Thu, 21 Jul 2022 14:30:25 -0700 (PDT)
Received: from kista.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id g20-20020a17090669d400b00727c6da69besm1268641ejs.38.2022.07.21.14.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:30:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Da Xue <da@libre.computer>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de
Subject: Re: Re: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
Date: Thu, 21 Jul 2022 23:30:24 +0200
Message-ID: <13059830.uLZWGnKmhe@kista>
In-Reply-To: <CACqvRUYho66jydekGR4L7YwBQAuussyLWBF=Ai-wB-VtUSo0mw@mail.gmail.com>
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com> <CACqvRUaSkfQ2GDhzGgmT=QXA=FTzg5srStbVbjh1Cy1vZF_=7w@mail.gmail.com> <CACqvRUYho66jydekGR4L7YwBQAuussyLWBF=Ai-wB-VtUSo0mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. julij 2022 ob 23:23:28 CEST je Da Xue napisal(a):
> On Thu, Jul 21, 2022 at 4:58 PM Da Xue <da@libre.computer> wrote:
> > On Thu, Jul 21, 2022 at 4:49 PM Jernej =C5=A0krabec <jernej.skrabec@gma=
il.com>=20
wrote:
> > > Dne =C4=8Detrtek, 21. julij 2022 ob 22:33:09 CEST je Da Xue napisal(a=
):
> > > > On Thu, Jul 21, 2022 at 4:05 PM Jernej =C5=A0krabec
> > > > <jernej.skrabec@gmail.com>
> > >=20
> > > wrote:
> > > > > Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napis=
al(a):
> > > > > > On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
> > > > > >=20
> > > > > > <jernej.skrabec@gmail.com> wrote:
> > > > > > > Hi!
> > > > > > >=20
> > > > > > > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Pr=
zywara
> > >=20
> > > napisal(a):
> > > > > > > > On 21/07/2022 12:03, Da Xue wrote:
> > > > > > > >=20
> > > > > > > > Hi Da,
> > > > > > > >=20
> > > > > > > > > Users were reporting non-boot on our H5 boards
> > > > > > > > > (ALL-H3-CC-H5).
> > > > > > > > > u-boot
> > > > > > > > > gets stuck in SPL with this message for SD/eMMC
> > > > > > > > > respectively.
> > > > > > > > >=20
> > > > > > > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > > > > > > >=20
> > > > > > > > > I tested about 20 MicroSD cards from different brands and
> > > > > > > > > some
> > > > > > > > > were
> > > > > > > > > happy and some were not. Increasing the udelay to 8-10ms =
in
> > > > > > > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset
> > > > > > > > > seems to
> > > > > > > > > fix
> > > > > > > > > the issue for the MicroSD cards.
> > > > > > > >=20
> > > > > > > > That's interesting, thanks for the report. I don't remember
> > > > > > > > hearing
> > > > > > > > of
> > > > > > > > issues with MMC before, at least not in the SPL.
> > > > > > >=20
> > > > > > > I certainly experienced this issue on board in question. I
> > > > > > > vaguely
> > > > > > > remember
> > > > > > > asking about this issue on IRC. I also tried all sorts of
> > > > > > > tweaks, but
> > > > > > > it
> > > > > > > never occured to me that mmc reset timeout would be too short.
> > > > > > >=20
> > > > > > > Da, how did you find this?
> > > > > >=20
> > > > > > Someone on the Armbian forum posted that they had the same prob=
lem
> > > > > > with eMMC so I got suspicious. I scoped the MicroSD clock line =
and
> > > > > > realized the frequency goes high and then drops to very low as =
if
> > > > > > it
> > > > > > never found the card.
> > > > > > I had a hunch it was a stabilization delay and got lucky.
> > > > > >=20
> > > > > > > I only test one other H5 board occasionally, namely OrangePi
> > > > > > > PC2, but
> > > > > > > I
> > > > > > > never observed such issue there. I always needed about 5
> > > > > > > attempts to
> > > > > > > boot
> > > > > > > ALL-H3-CC- H5 board, but once it's cold booted, warm boots
> > > > > > > always
> > > > > > > succeed.
> > > > > >=20
> > > > > > I had run into this too so it didn't make any sense. I tried 5ms
> > > > > > and
> > > > > > it helped on some cards but not others.
> > > > > > I know the Orange Pis do not have the series resistor for ESD
> > > > > > protection of the SD GPIOs but that shouldn't affect this.
> > > > > > So...who knows?
> > > > > >=20
> > > > > > > Best regards,
> > > > > > > Jernej
> > > > > > >=20
> > > > > > > > It's a bit odd that waiting after the *controller* reset
> > > > > > > > should
> > > > > > > > affect
> > > > > > > > SD cards, and 1ms seems plenty for just the reset.
> > > > > > > > I just checked and at least the SOFT_RESET and FIFO_RESET b=
its
> > > > > > > > are
> > > > > > > > self
> > > > > > > > clearing. Can you try to use wait_for_bit_le32() to wait for
> > > > > > > > those
> > > > > > > > parts
> > > > > > > > to finish? See sun8i_emac_eth_start() for an example.
>=20
> After more extensive testing with 5 MicroSD cards, 2 of them are still
> inconsistent with waiting for SOFT_RESET and FIFO_RESET vs a hard 20ms
> delay. I even tried putting a delay of 1ms after they cleared to no
> avail.

=46ixed delay it is, then. Just add a comment with explanation why. People=
=20
looking for boot time optimization might lower it.

> I'm curious how larger 1TB MicroSD cards behave now but I don't have
> any samples.
>=20
> > > > > > I tested some more and here's the data:
> > > > > > sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> > > > > > sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> > > > > > sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> > > > > > Given this, I don't think it's an issue with the bit set delays.
> > > > > > Might
> > > > > > need more than 10ms even. I didn't change the udelay in probe.
> > > > >=20
> > > > > Idea here is that we wouldn't need to determine the appropriate
> > > > > delay, but
> > > > > instead, wait_for_bit_le32() would monitor reset bit and continue
> > > > > only
> > > > > after reset bit would clear itself. Hopefully that happens after
> > > > > everything is stable.
> > > >=20
> > > > I changed it to 50ms delay
> > > >=20
> > > > writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > if (wait_for_bit_le32( &priv->reg->gctrl,
> > > > SUNXI_MMC_GCTRL_RESET, false, 50, false)) {
> > > > printf("%s: Timeout\n", __func__);
> > > > return ret;
> > > > }
> > > >=20
> > > > and that seems to work. Shall I send the patch?
> > >=20
> > > Certainly, that's major improvement. Just 1 small nitpick - you don't
> > > need to introduce ret variable, just return error -ETIMEDOUT directly.
> >=20
> > OK
> >=20
> > > Maybe timeout can be raised even to 100 ms, now that it continues as
> > > soon as possible. Better to be on the completely safe side. But I'll
> > > leave that decision to you and Andre.
> >=20
> > I'll retest everything and check about changing the probe reset as
> > well. If everything works, I'll submit the patch.
> >=20
> > > Best regards,
> > > Jernej
> > >=20
> > > > > Best regards,
> > > > > Jernej
> > > > >=20
> > > > > > > > And since you mentioned it's card related: can you check
> > > > > > > > whether the
> > > > > > > > delay is actually needed somewhere else, later? At some poi=
nt
> > > > > > > > where
> > > > > > > > we
> > > > > > > > wait to the card to response, for instance?
> > > > > > > >=20
> > > > > > > > I am not against taking this patch, if it fixes problems for
> > > > > > > > you,
> > > > > > > > but
> > > > > > > > just want to avoid that it papers over other issues.
> > > > > > > >=20
> > > > > > > > Cheers,
> > > > > > > > Andre
> > > > > > > >=20
> > > > > > > > > Author: Da Xue <da@libre.computer>
> > > > > > > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > > > > > > >=20
> > > > > > > > >      sunxi: raise stabilization time for mmc from 1ms to =
8ms
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/mmc/sunxi_mmc.c
> > > > > > > > > b/drivers/mmc/sunxi_mmc.c
> > > > > > > > > index 1bb7b6d0e9..499e057725 100644
> > > > > > > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > > > > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > > > > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct
> > > > > > > > > mmc
> > > > > > > > > *mmc)
> > > > > > > > >=20
> > > > > > > > >          /* Reset controller */
> > > > > > > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > > > > > >=20
> > > > > > > > > -       udelay(1000);
> > > > > > > > > +       udelay(8000);
> > > > > >=20
> > > > > > This might need to be even higher. Like 20ms.
> > > > > >=20
> > > > > > > > >          return 0;
> > > > > > > > >  =20
> > > > > > > > >   }
> > > > > > > > >=20
> > > > > > > > > I don't know the implications of this change so I am seek=
ing
> > > > > > > > > feedback.
> > > > > > > > > Are other boards having this issue as well or is it speci=
fic
> > > > > > > > > to
> > > > > > > > > our
> > > > > > > > > hardware?
> > > > > > > > >=20
> > > > > > > > > Best,
> > > > > > > > > Da


