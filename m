Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27CA72
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 11:50:53 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g22so4784087pgk.1
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sKn9UvDVlydbDfhyjcKiR8IQebdYWuPzRo3dE9qFvzU=;
        b=HTT19X0V095oJRTCzBuNJaVN4HZknbDw48KwzexgYxUe8fSxFHwWmx5qCuxOySbqY8
         oIhrj+O7sEtFlIQnJUWc8B3UDDiWZ7L1eX+0I1whFlp2IFctgF1Yqe1T6dpLJVdywUwi
         PnSOnmgj0c1OGJ0xVWQh8sAzW5NzMZoXHcglUWLoaCW+5qtIOnvVlJcA2IUv9VijrNbJ
         +w0wJnCaVH4AG3cNaf10KKxvykGRkz4rzk461fN+Y+f3xL4ZsAqVxFlqDmQ9byYf3XlY
         a3nzvcDFou6GLpDPGfHO9wQEClE2m9vU5ZIbj2FddMNRAanPHC78pShAINAcd0YZzSyG
         BitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sKn9UvDVlydbDfhyjcKiR8IQebdYWuPzRo3dE9qFvzU=;
        b=k2tR/ZGfLf5m0ki9SnH0Ap8tl2wMB+OjoxhdoRP9zVB97wRwj1UjiUrA7kX9u7UG2x
         6lTDp8juoULenGy7IyOK5iqheDX75BY5finLt+gIokMKheLxyN9Z75zuHdNiZsBhk8om
         tijzYu1K8APY74yerdbPtrBVW1bhDIhxmH+BVGJipXcUDimc9gEukLB/AvcmQ3pVfQg0
         DyKaIthvdQG1tVi0ZyMeiVUYrQtgK9zzrwMgd20QHZxxggrbrmynu5PruEMGuMDa0D1D
         KTamh96FT538a6X1ISo686UVuEsWSMNiXFC4vm+l2ZioKGRDohema5/Hwk1gIQRC5AqU
         C5qg==
X-Gm-Message-State: AOAM532qSPtjYsTaU1hZ92yWX7h10dukQJ71FDpzN7+R1RXf2LqoJpvp
	ZMLpeMacwmcD6jEzb67qMZCHqHU6JjL0AoBwqg==
X-Google-Smtp-Source: ABdhPJzLsfs3op+S3slb9TqsEE9rDKBjbpT/kYfZDNwghaNqG6qtKFP/8gazWOPOPVAsKMwERdZcGU0aiuCW4mmYCy4=
X-Received: by 2002:a63:f344:: with SMTP id t4mr4676265pgj.314.1623930653336;
 Thu, 17 Jun 2021 04:50:53 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210615130326.2044-1-fengzheng923@gmail.com> <20210615132207.GG5149@sirena.org.uk>
 <CAE=m61-kHPeKNvEEc08w8DeUwssGPWNf5UaYojRPNZRJ0v=arw@mail.gmail.com> <20210617104828.GA5067@sirena.org.uk>
In-Reply-To: <20210617104828.GA5067@sirena.org.uk>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Thu, 17 Jun 2021 19:50:42 +0800
Message-ID: <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
	wens@csie.org, jernej.skrabec@gmail.com, p.zabel@pengutronix.de, 
	Samuel Holland <samuel@sholland.org>, krzk@kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C

Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 17, 2021 at 03:42:43PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:22=E5=86=99=E9=81=93=EF=BC=9A
>
> > > > @@ -0,0 +1,408 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * ALSA SoC DMIC Audio Layer
> > > > + *
> > > > + * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> > > > + *
>
> > > Please make the entire comment a C++ one so things look more
> > > intentional.
>
> > For example;
> > // SPDX-License-Identifier: GPL-2.0-or-later
> > /*
> >  * This driver supports the DMIC in Allwinner's H6 SoCs.
> >  *
> >  * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> >  *
> >  */
> > is this OK?
>
> No, that's what you have already make the entire thing a C++ comment
> with //s.

I don=E2=80=99t understand. For example, sun4i-codec.c sun4i-i2s.c
sun8i-codec.c and sun4i-spdif.c files are the same as mine.
Which file can I refer to? what should I do......
>
> > > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     base =3D devm_ioremap_resource(&pdev->dev, res);
> > >
> > > devm_platform_ioremap_resource()
> >
> > But I need to get the register base address of DMIC. E.g res->start.
> > host->dma_params_rx.addr =3D res->start + SUN50I_DMIC_DATA;
>
> OK.
