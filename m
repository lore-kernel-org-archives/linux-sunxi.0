Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D523CD
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 20:49:57 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id va17so5253808ejb.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8okHVSCeVk+ZnwF2dT/hlxc8KUySI/TZc0fA2phC6yQ=;
        b=AezqRDki1GVKbPbPMlNTzxMV/HrmoAWpJtoOeYJoyHUhq1BYzrFKK3JWAJPQdmkEoF
         ezQJ3U2R0Ftl7E3YpRcMABmRuF+VsEW6vTUYwA2sE6aad/EOOzz15MaPJlX7eDcXO1u7
         +omH05qKG75+adkNZtmYa7wQCNTqKzDgGMQsgIXBCN0xhYY3ASj/aETxEmNbtorMxZS4
         JGfo85g3XdaKHh/45rWq1rPDbQxsFPfqAXjGBiJJvAfJxd1rxuUyU3UF++qJFgU8XWNG
         2uipoeO/iMeJ8Bb70XGeZxW2SoofPzb9XOkTm9F9iKb/8vVEHtuov0CwUd8JUI6kpnmd
         LUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8okHVSCeVk+ZnwF2dT/hlxc8KUySI/TZc0fA2phC6yQ=;
        b=T+VqkIvENMw/sW7TIuL91hlM8NLDvn4F0Cwi/CH9kvyMyHlmuKp4y4z+NuUZ7dDAqM
         tXW1p9QzxIZ4MnAvdJ8l/gRCfjITcpmeltcrsOgyHjRorFpTA+qW1ehZ6Fc2iFmUTW61
         39bkxKtqruSREBWbPel9Hr/UM8twa6D6ZXoiOrntgbHa2bE8hlcTDm/O1JdfAaJquvM3
         Hoxmw5EOgaXcOqlrE81RqZ5Axo7xws1wXXRfGcoJLRimKPa3lnzWGFlQWV3RvNodosgs
         /48JMEwj7Zg7Tfu5q8VCkoPMLiJtPS7IBAeXPzuWST4Q1sOyrLwFHsRQ5X+jXMMb8Hys
         BCHg==
X-Gm-Message-State: AJIora9xu9FmHkmd28lxuHYVXVKeQo/XTBoLdB1Drh4ofUoDhTisT++3
	zmh2xeMYITTAxdgyS+fj4o4=
X-Google-Smtp-Source: AGRyM1vw2zO9KKCzkQlCxWGtogxwOFqIqw3Bk6XR492cgd/yLpy6KL+KV7uUSqYC5I9TKrSSp/a4ag==
X-Received: by 2002:a17:907:6d8f:b0:72b:6b87:81f1 with SMTP id sb15-20020a1709076d8f00b0072b6b8781f1mr346784ejc.674.1658436595233;
        Thu, 21 Jul 2022 13:49:55 -0700 (PDT)
Received: from kista.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906329b00b007081282cbd8sm1209136ejw.76.2022.07.21.13.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 13:49:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Da Xue <da@libre.computer>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de
Subject: Re: Re: Re: Increasing stabilization time in sunxi_mmc_core_init
Date: Thu, 21 Jul 2022 22:49:53 +0200
Message-ID: <4726146.GXAFRqVoOG@kista>
In-Reply-To: <CACqvRUbDeVBmVy7PX9Gqe3Qn8WAHxbcFVSzSPZsszC1fKYcoXg@mail.gmail.com>
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com> <5840812.lOV4Wx5bFT@kista> <CACqvRUbDeVBmVy7PX9Gqe3Qn8WAHxbcFVSzSPZsszC1fKYcoXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. julij 2022 ob 22:33:09 CEST je Da Xue napisal(a):
> On Thu, Jul 21, 2022 at 4:05 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom>=20
wrote:
> > Dne =C4=8Detrtek, 21. julij 2022 ob 21:56:35 CEST je Da Xue napisal(a):
> > > On Thu, Jul 21, 2022 at 11:14 AM Jernej =C5=A0krabec
> > >=20
> > > <jernej.skrabec@gmail.com> wrote:
> > > > Hi!
> > > >=20
> > > > Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywara=
=20
napisal(a):
> > > > > On 21/07/2022 12:03, Da Xue wrote:
> > > > >=20
> > > > > Hi Da,
> > > > >=20
> > > > > > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5).
> > > > > > u-boot
> > > > > > gets stuck in SPL with this message for SD/eMMC respectively.
> > > > > >=20
> > > > > > Trying to boot from MMC1 or Trying to boot from MMC2
> > > > > >=20
> > > > > > I tested about 20 MicroSD cards from different brands and some
> > > > > > were
> > > > > > happy and some were not. Increasing the udelay to 8-10ms in
> > > > > > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to
> > > > > > fix
> > > > > > the issue for the MicroSD cards.
> > > > >=20
> > > > > That's interesting, thanks for the report. I don't remember heari=
ng
> > > > > of
> > > > > issues with MMC before, at least not in the SPL.
> > > >=20
> > > > I certainly experienced this issue on board in question. I vaguely
> > > > remember
> > > > asking about this issue on IRC. I also tried all sorts of tweaks, b=
ut
> > > > it
> > > > never occured to me that mmc reset timeout would be too short.
> > > >=20
> > > > Da, how did you find this?
> > >=20
> > > Someone on the Armbian forum posted that they had the same problem
> > > with eMMC so I got suspicious. I scoped the MicroSD clock line and
> > > realized the frequency goes high and then drops to very low as if it
> > > never found the card.
> > > I had a hunch it was a stabilization delay and got lucky.
> > >=20
> > > > I only test one other H5 board occasionally, namely OrangePi PC2, b=
ut
> > > > I
> > > > never observed such issue there. I always needed about 5 attempts to
> > > > boot
> > > > ALL-H3-CC- H5 board, but once it's cold booted, warm boots always
> > > > succeed.
> > >=20
> > > I had run into this too so it didn't make any sense. I tried 5ms and
> > > it helped on some cards but not others.
> > > I know the Orange Pis do not have the series resistor for ESD
> > > protection of the SD GPIOs but that shouldn't affect this.
> > > So...who knows?
> > >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > It's a bit odd that waiting after the *controller* reset should
> > > > > affect
> > > > > SD cards, and 1ms seems plenty for just the reset.
> > > > > I just checked and at least the SOFT_RESET and FIFO_RESET bits are
> > > > > self
> > > > > clearing. Can you try to use wait_for_bit_le32() to wait for those
> > > > > parts
> > > > > to finish? See sun8i_emac_eth_start() for an example.
> > >=20
> > > I tested some more and here's the data:
> > > sandisk ultra 64gb       9/20 with 1ms,   20/20 with 10ms
> > > sandisk ultra 16gb       2/20 with 1ms,   20/20 with 10ms
> > > sandisk extreme 16gb 6/20 with 10ms, 20/20 with 20ms
> > > Given this, I don't think it's an issue with the bit set delays. Might
> > > need more than 10ms even. I didn't change the udelay in probe.
> >=20
> > Idea here is that we wouldn't need to determine the appropriate delay, =
but
> > instead, wait_for_bit_le32() would monitor reset bit and continue only
> > after reset bit would clear itself. Hopefully that happens after
> > everything is stable.
>=20
> I changed it to 50ms delay
>=20
> writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> if (wait_for_bit_le32( &priv->reg->gctrl,
> SUNXI_MMC_GCTRL_RESET, false, 50, false)) {
> printf("%s: Timeout\n", __func__);
> return ret;
> }
>=20
> and that seems to work. Shall I send the patch?

Certainly, that's major improvement. Just 1 small nitpick - you don't need =
to=20
introduce ret variable, just return error -ETIMEDOUT directly.

Maybe timeout can be raised even to 100 ms, now that it continues as soon a=
s=20
possible. Better to be on the completely safe side. But I'll leave that=20
decision to you and Andre.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej
> >=20
> > > > > And since you mentioned it's card related: can you check whether =
the
> > > > > delay is actually needed somewhere else, later? At some point whe=
re
> > > > > we
> > > > > wait to the card to response, for instance?
> > > > >=20
> > > > > I am not against taking this patch, if it fixes problems for you,
> > > > > but
> > > > > just want to avoid that it papers over other issues.
> > > > >=20
> > > > > Cheers,
> > > > > Andre
> > > > >=20
> > > > > > Author: Da Xue <da@libre.computer>
> > > > > > Date:   Wed Jul 20 19:11:55 2022 -0400
> > > > > >=20
> > > > > >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> > > > > >=20
> > > > > > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > > > > > index 1bb7b6d0e9..499e057725 100644
> > > > > > --- a/drivers/mmc/sunxi_mmc.c
> > > > > > +++ b/drivers/mmc/sunxi_mmc.c
> > > > > > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc
> > > > > > *mmc)
> > > > > >=20
> > > > > >          /* Reset controller */
> > > > > >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > > > > >=20
> > > > > > -       udelay(1000);
> > > > > > +       udelay(8000);
> > >=20
> > > This might need to be even higher. Like 20ms.
> > >=20
> > > > > >          return 0;
> > > > > >  =20
> > > > > >   }
> > > > > >=20
> > > > > > I don't know the implications of this change so I am seeking
> > > > > > feedback.
> > > > > > Are other boards having this issue as well or is it specific to
> > > > > > our
> > > > > > hardware?
> > > > > >=20
> > > > > > Best,
> > > > > > Da


