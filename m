Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71E567E
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jun 2023 20:53:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-97000a039b2so659685666b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jun 2023 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685912023; x=1688504023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMdRlD3RmAquqJCxpsCbMeN6ju6zKj6JUFR8/2WFs3c=;
        b=SiYLabF9JME+54M7MIop3FXo02GsPPG737XXA75vfgXysx6JEEVveTtcYnD4M351P1
         /s/rKCh7h1fZ+wwaITQAKu5C94jPce1i5zUiPFL4LGx5VgSldI62tkTy6V1D3AOmASrR
         B0QssVgniWHFxAKQBO2a+zn1Cm1fvjfSDjYNnpuRK3B4alME2Cd0LkjNY+gFdcsSBa2v
         4CTiIqGSsDWOK9Nih35PvQ0p0HvA6cOr8fZYSVRZOkeHsXGTyXUZs2KVHaOHFayUuL2z
         3e/iAwBBcI6aS3YdhO6SnLp8YcfiBCpMu2Zd0SM+3/6f/V4Ne8nI98FNeahGUEatZj+W
         W+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685912023; x=1688504023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMdRlD3RmAquqJCxpsCbMeN6ju6zKj6JUFR8/2WFs3c=;
        b=ZlI7P2wdCkpkA2Ms9C2r9QUX8VDpZEP8mod+siboGw3tBJbWH4Fdj/+BVsJ9ewrSMC
         3951yBqDU96ORzojmhMgae74ZfQKdTvGzCghmu4I28Dxa2QKuj8cmjPw5GFj7O4QHIBs
         AMYwGH4Ppmp3B0J8dKDwsZ7Iz8gXJ5XWXVcnnxxVQyEiPY/PO1dv4x6kQqEzAMIZHKq5
         mxyth2rk3fpa1WZVbcdJnIjmKy0EBQBXaLjtmGtUHsNTvcGWZ3c7tCh5AYiGGLsY0O4g
         bZDNNUIbVh106KG8LBT4a2VDtrJn4swfSZ8RBJMF6lzCYJXeoU46jt/aJzFijCVufaXc
         lnhA==
X-Gm-Message-State: AC+VfDxxwmxOqZVz/mcDiDKnzdy/SqTAWbQPWEcTYGh2bzuj9WhaZPQB
	/lCC3yg+9SjFYKhzQBDqvLrHcV+HfvkX+anlxOU=
X-Google-Smtp-Source: ACHHUZ7GR+ovbrMerE3jxZsLZ74is1r45C4hfWtsepG9CDX8PQO48qsjVKDBY5/BCpbiDVBGRDX1z+EO138N2+BqZ7g=
X-Received: by 2002:a17:907:d29:b0:969:e7da:fcb1 with SMTP id
 gn41-20020a1709070d2900b00969e7dafcb1mr6049931ejc.13.1685912022545; Sun, 04
 Jun 2023 13:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-2-bigunclemax@gmail.com> <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
In-Reply-To: <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 4 Jun 2023 23:53:30 +0300
Message-ID: <CALHCpMjc5+rsNvTHyy3V-+0bJ3yez+ewnGwyk+k-hvmNaF6TsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, William Breathitt Gray <william.gray@linaro.org>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Haibo Chen <haibo.chen@nxp.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 2 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 17:49, Andy=
 Shevchenko <andriy.shevchenko@linux.intel.com>:

...

> The locks should be explained (what are they for? what do they protect?).
I added the explanation comment in the next version.

...

> > +static const struct regmap_config sun20i_gpadc_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .fast_io =3D true,
>
> I forgot if I asked about regmap lock do you need it?

I think we could drop the regmap altogether. As Andy suggested in
previous series.

...

> > +     if (num_channels > SUN20I_GPADC_MAX_CHANNELS) {
> > +             dev_err(dev, "num of channel children out of range");
> > +             return -EINVAL;
> > +     }
>
> Is it really critical error?

Yes, as Jonathan already noted, this may lead to out of range error.

=D0=B2=D1=81, 4 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 13:46, Jona=
than Cameron <jic23@kernel.org>:

...

> We try to make this name identify the chip in question.
> If the driver name is sufficient for these platforms then fair enough.
> It should certainly be enough to distinguish this from other ADCs on the
> platform.

I believe the driver name should be enough. All listed SoCs have the
same GPADC register
layout and differ only in the number of channels.
