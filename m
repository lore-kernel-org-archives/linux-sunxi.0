Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB9140E30
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731237298; cv=none; b=LOFUv35+LPoQn32mUAQNvQhAfCUCyU/DG7rTtJL4vp1dt1zDpcb3phEV5foQuQeJwLYJpwSarL7FvphyY3IxgRuWzqCNbJ9BhT+AE312XTxUgXxKCYyv4sQCkCSpLPKdvI2b8Sp0bMSi5BboA61CYxN6lHbJZ1M4RA3L9JyjYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731237298; c=relaxed/simple;
	bh=CzCi9Otcx7wBj+IOqPBCkkgOcTbk4IzILMus9tvE5KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpWmUN/JwP62RYgRDHrPZuE/OnXZ5zcuLTIeBde96qYasLIwx2TxQrXYlltmvpRqEvfx8M+Qv7IlYR+GCZcR8Bv1L8adjrRAF/YUFf9KFbIcIaZxZQc4Tu18+tUujkZs9roDOYOb0DpijZWnMu00WTeD9NYrBY4KPhoUHo06H8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e3f35268so4020184e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 03:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731237294; x=1731842094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGpnRGebtces+H0p57KZ/VOg+pG46erIWNYz0tqupxk=;
        b=QCNrKLfbvhnRxAJa0o7Rjw42PjM1LGAGG9aUKfJ65+Lc3qIxSH1BusginvewJShx9T
         +8Yohmq93E2MehJHRNbOT4QomTwnPhBSkfKQ4cMTFU0TnX+hRMivxZMyQ09agsrHI/9W
         h1/Tcv0943zIMILxlcPz/D7GauorN+38qe6eDfJMTJ8CIsHhvcmuiSo70Y/Pqp/op6zl
         +Inwy2KzRJX4o9KBqLgQvP3/i3XPqJ6wPuMxlnXbjtT9kd2KQuLpXhgpvPqIGXuchWuz
         rVtOmd38yLV2WXveCBHqXVl1e8sd10zBbqbAVKE1WozbjS1XttABOX3l3GwEav5eIn/I
         o2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU/YblUEyx4/Sjr9uVV4pO5UTJ2jJkR79kraWssCpAEFRGrObbJaRBYxIti/g4ln4aOfCI8bvl3UBfrDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5w39gkqy7Q0Iu1i5luaiOOlwM8RISGqqmEUJGXp/DYAK43c5W
	K/MNGg/BbNKHyGfPPZGWymOghNrqat7/oK1zQa86wO7k/9lsL6JAglX3HgZ4
X-Google-Smtp-Source: AGHT+IGojsh2XdBkNjyC08EoVRq1HrsLhxUwjcLl68ZM0IE1GNhSZqR4+OhP7CM88wzeeDzOSIVaHA==
X-Received: by 2002:a05:6512:3053:b0:53c:7474:8cc7 with SMTP id 2adb3069b0e04-53d862bbd6amr3784153e87.22.1731237293357;
        Sun, 10 Nov 2024 03:14:53 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9d65sm1204275e87.216.2024.11.10.03.14.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 03:14:52 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e3f35268so4020172e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 03:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/URYBO5Nuiu3L88lr7qjq6EmvfgtB0T9ClqLKUKBwbcLrf18ahN7QRu+D07LAUVDox+XSpvx6tiIhVQ==@lists.linux.dev
X-Received: by 2002:a05:6512:238b:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-53d862b35a5mr3583802e87.3.1731237292733; Sun, 10 Nov 2024
 03:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107014240.24669-1-andre.przywara@arm.com>
 <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com> <20241110102157.2703463e@minigeek.lan>
In-Reply-To: <20241110102157.2703463e@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 19:14:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65J=1xpNJtC0tba6yQKpE3ZYiHDppdWcoXN5EnaHdnGPw@mail.gmail.com>
Message-ID: <CAGb2v65J=1xpNJtC0tba6yQKpE3ZYiHDppdWcoXN5EnaHdnGPw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Parthiban <parthiban@linumiz.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 6:22=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun, 10 Nov 2024 17:04:08 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> > On Thu, Nov 7, 2024 at 9:43=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> > > blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> > > And while this alone would make a trivial fix, the H616 falls back to
> > > the A100 compatible string, so we have to now match the H616 compatib=
le
> > > string explicitly against the description advertising 64K DMA blocks.
> >
> > Would be nice to know how this was discovered, and how the correct size
> > was determined. As far as I could find, the A133 user manual says its
> > 64K.
>
> Mmh, my copy (Revision 1.1, Jul.14, 2020) only mentions bits[12:0] in
> the DES1 DMA descriptor details, unconditional of SMHC0/1/2. And yes,

I see. I was looking at SMHC_BLKSIZ, which had 16 bits.

> this is in contradiction to the prose section in "5.3.1. Overview",
> which mentions a "Block size of 1 to 65535 bytes".
> Also that matches the observation: eMMC was working fine (as it was
> already limited to 8K), and the SD card was *somewhat* working: I could
> mount a FAT filesystem, and even list the (rather short) root
> directory, but any further action (reading file, benchmarking) would
> hang. Which would make sense given that the first actions probably
> don't ask for a block larger than 8K.

Thanks for explaining it.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> Cheers,
> Andre
>
>
>
> >
> > ChenYu
> >
> > > As the A100 is now compatible with the D1 description, let the A100
> > > compatible string point to that block instead, and introduce an expli=
cit
> > > match against the H616 string, pointing to the old description.
> > > Also remove the redundant setting of clk_delays to NULL on the way.
> > >
> > > Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller=
")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/mmc/host/sunxi-mmc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mm=
c.c
> > > index d3bd0ac99ec46..e0ab5fd635e6c 100644
> > > --- a/drivers/mmc/host/sunxi-mmc.c
> > > +++ b/drivers/mmc/host/sunxi-mmc.c
> > > @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_e=
mmc_cfg =3D {
> > >         .needs_new_timings =3D true,
> > >  };
> > >
> > > -static const struct sunxi_mmc_cfg sun50i_a100_cfg =3D {
> > > +static const struct sunxi_mmc_cfg sun50i_h616_cfg =3D {
> > >         .idma_des_size_bits =3D 16,
> > >         .idma_des_shift =3D 2,
> > > -       .clk_delays =3D NULL,
> > >         .can_calibrate =3D true,
> > >         .mask_data0 =3D true,
> > >         .needs_new_timings =3D true,
> > > @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_m=
atch[] =3D {
> > >         { .compatible =3D "allwinner,sun20i-d1-mmc", .data =3D &sun20=
i_d1_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a64-mmc", .data =3D &sun5=
0i_a64_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a64-emmc", .data =3D &sun=
50i_a64_emmc_cfg },
> > > -       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun=
50i_a100_cfg },
> > > +       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun=
20i_d1_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a100-emmc", .data =3D &su=
n50i_a100_emmc_cfg },
> > > +       { .compatible =3D "allwinner,sun50i-h616-mmc", .data =3D &sun=
50i_h616_cfg },
> > >         { /* sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> > > --
> > > 2.46.2
> > >
> >
>
