Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544903C26
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 15:14:37 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id v12so2539323edc.10
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qv4IHY2fQGdzgr0WeV2uK9YpP9JmCjP2S/0ShCVUuo0=;
        b=aEMa1LGpkkXjdS1d4HProZMrdTZ8dkYxWjqQWxFpXqK9thg/mY0wg5JIPwoTvndHbh
         6g5LXgmpLWm6/bPEhydfkRSwcLOGOfyTRHXrz9qScifZNkmbSAEqYA6jpwhU/8X+KkHe
         syw8bcW+cSPaiI74CKwxa2k/zlADSc/orUQ5RvpziO5PjpYZve/egKMPuURgf56AVTU5
         TrIurvZZu751qiw6gOm7R0lpSljPpitFlmQowv07R+x3wMfmKBSbnrmV95tUdLSUJpi1
         Z9fapEH6lPtJc2Xx4sl9PQfMB+ruq4Jr5UEjqqA/rsGbVWsOqivp9CcPqTpkvYbA4CFn
         x9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qv4IHY2fQGdzgr0WeV2uK9YpP9JmCjP2S/0ShCVUuo0=;
        b=cqi6rRa+qw6bs2HW9eXD2HbB17TZl9aLjwjIiv3pZ3q+FOa+lJBrwnDUMMUa+H2saB
         9xk+5U3NU8HW0EqWi+CgAljfwf1dErsC1MTjL/fcML3t9C3WR4TVM/CzCrb4L5cyrbUE
         ctu0iHUuct3d55vYhqcjJACK8288DYIFwpoiQUGDUfNTD7viRIQ5CeHKh7hwxL3INsJn
         nW2WzvsZea04pSDSCLdFWCOa45KpLbcxtwM1RDW3p8c7JT2k82Zx5Q9WdHdia/X2cNXq
         FuIiiixbH49cOcJUgeAyjgwI8m5v3cumu4kLiSZc6AD0BaGUGFNuhD3tjIqRAcwGZN16
         6hog==
X-Gm-Message-State: AJIora/FukgAZ1btJsGaxZhj0OCi7n+CUVqBkypaO2p4gm/mLNb5O/rw
	p0/X/lTNxJ1+jo/dEkvx5Mw=
X-Google-Smtp-Source: AGRyM1sXQJFDqP1ry3wnN7BYurLU3scXacfYSYgMJohYHccv1VGtwEvG4m9xH8k/NMl+aFiORiYg9A==
X-Received: by 2002:a05:6402:2395:b0:43a:6d91:106c with SMTP id j21-20020a056402239500b0043a6d91106cmr58840932eda.299.1658416475461;
        Thu, 21 Jul 2022 08:14:35 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-13-89.dynamic.telemach.net. [86.58.13.89])
        by smtp.gmail.com with ESMTPSA id f23-20020a17090631d700b0072b55713daesm941251ejf.56.2022.07.21.08.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:14:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Da Xue <da@libre.computer>, linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de
Subject: Re: Increasing stabilization time in sunxi_mmc_core_init
Date: Thu, 21 Jul 2022 17:14:33 +0200
Message-ID: <1748322.TLkxdtWsSY@jernej-laptop>
In-Reply-To: <1d28ba1c-3fa1-a8fb-849d-b3f4d77c6054@arm.com>
References: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com> <1d28ba1c-3fa1-a8fb-849d-b3f4d77c6054@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi!

Dne =C4=8Detrtek, 21. julij 2022 ob 13:28:59 CEST je Andre Przywara napisal=
(a):
> On 21/07/2022 12:03, Da Xue wrote:
>=20
> Hi Da,
>=20
> > Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-boot
> > gets stuck in SPL with this message for SD/eMMC respectively.
> >=20
> > Trying to boot from MMC1 or Trying to boot from MMC2
> >=20
> > I tested about 20 MicroSD cards from different brands and some were
> > happy and some were not. Increasing the udelay to 8-10ms in
> > drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to fix
> > the issue for the MicroSD cards.
>=20
> That's interesting, thanks for the report. I don't remember hearing of
> issues with MMC before, at least not in the SPL.

I certainly experienced this issue on board in question. I vaguely remember=
=20
asking about this issue on IRC. I also tried all sorts of tweaks, but it ne=
ver=20
occured to me that mmc reset timeout would be too short.

Da, how did you find this?

I only test one other H5 board occasionally, namely OrangePi PC2, but I nev=
er=20
observed such issue there. I always needed about 5 attempts to boot ALL-H3-=
CC-
H5 board, but once it's cold booted, warm boots always succeed.

Best regards,
Jernej

> It's a bit odd that waiting after the *controller* reset should affect
> SD cards, and 1ms seems plenty for just the reset.
> I just checked and at least the SOFT_RESET and FIFO_RESET bits are self
> clearing. Can you try to use wait_for_bit_le32() to wait for those parts
> to finish? See sun8i_emac_eth_start() for an example.
>=20
> And since you mentioned it's card related: can you check whether the
> delay is actually needed somewhere else, later? At some point where we
> wait to the card to response, for instance?
>=20
> I am not against taking this patch, if it fixes problems for you, but
> just want to avoid that it papers over other issues.
>=20
> Cheers,
> Andre
>=20
> > Author: Da Xue <da@libre.computer>
> > Date:   Wed Jul 20 19:11:55 2022 -0400
> >=20
> >      sunxi: raise stabilization time for mmc from 1ms to 8ms
> >=20
> > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > index 1bb7b6d0e9..499e057725 100644
> > --- a/drivers/mmc/sunxi_mmc.c
> > +++ b/drivers/mmc/sunxi_mmc.c
> > @@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
> >=20
> >          /* Reset controller */
> >          writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> >=20
> > -       udelay(1000);
> > +       udelay(8000);
> >=20
> >          return 0;
> >  =20
> >   }
> >=20
> > I don't know the implications of this change so I am seeking feedback.
> > Are other boards having this issue as well or is it specific to our
> > hardware?
> >=20
> > Best,
> > Da




