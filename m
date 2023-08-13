Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C4515BF
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 06:14:59 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bddac1b7bfso812475ad.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 23:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691907298; x=1692512098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PquNnrwc6lc8WzSRLbxFenC5bqhWO9QOMiyMhVomEDw=;
        b=VtUXKk+by9/x63EJMd0mtDzK6UVDQ71uw2SWX+cTmvXoNamat46plfQzG7kiWDOUZR
         F1uFu9BKjSVp6FhORM3nzwXkGkbyol9CnvEHRGENoYdR9tiW0hQh4nlIsy/PEbwPmrWp
         xDVDMw9BwyH3s+UBMB+myBVArfGtLsm/iaw6aEQaQyaO0ciNriLSZDVpP33Pl7tWCvpI
         moWZuH19eAiLzNV3i75ryyaKGgE/15RDQSv4fZZ5JKc7yr9+g+45XcR4wDK0vm8GVn3T
         E5VqWMe7/H6W90I9iphgMqCepQV78XrqQP/QMLQ5ORnPyqsoH1AiYsHS4OhJqf3UCPCF
         Mz7w==
X-Gm-Message-State: AOJu0Yx4dRnXAs/+ajlMFR1ACdmRT/dwEo7yqp0j3Z/VwY1SxrwirhZW
	rOfoCMygE0uNvt031mmIsG5HF1IzZGbDsQ==
X-Google-Smtp-Source: AGHT+IGb4wE/KFxko+zGC1nj9vd2KnwPlDzQMxaqoOvIXYVKRQAiSRK3URGYpHWpoFnM0g11WefYZA==
X-Received: by 2002:a17:902:d483:b0:1bd:1b9a:fe61 with SMTP id c3-20020a170902d48300b001bd1b9afe61mr8218944plg.6.1691907298569;
        Sat, 12 Aug 2023 23:14:58 -0700 (PDT)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com. [209.85.210.182])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170903048300b001bc65360526sm6814279plb.125.2023.08.12.23.14.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 23:14:56 -0700 (PDT)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68730bafa6bso2959967b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Aug 2023 23:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e0f:b0:267:f8f4:73ab with SMTP id
 v15-20020a17090a0e0f00b00267f8f473abmr12065548pje.16.1691907294402; Sat, 12
 Aug 2023 23:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807191952.2019208-1-contact@jookia.org> <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
 <ZNhau0j_tV3EXGxl@titan>
In-Reply-To: <ZNhau0j_tV3EXGxl@titan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 14:14:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
Message-ID: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maksim Kiselev <bigunclemax@gmail.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 13, 2023 at 12:23=E2=80=AFPM John Watts <contact@jookia.org> wr=
ote:
>
> On Sun, Aug 13, 2023 at 12:17:27PM +0800, Chen-Yu Tsai wrote:
> > > Signed-off-by: John Watts <contact@jookia.org>
> > > ---
> > > Changes in v3:
> > > - Set default pinctrl for can controller
> > > - Moved can nodes to proper location
> > > - Moved can pins to proper location
> > >
> > >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 34 +++++++++++++++++=
++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch=
/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > > index d59b4acf183a..24f2e70d5886 100644
> > > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > > @@ -52,6 +52,18 @@ pio: pinctrl@2000000 {
> > >                         #gpio-cells =3D <3>;
> > >                         #interrupt-cells =3D <3>;
> > >
> > > +                       /omit-if-no-ref/
> >
> > Just FYI this likely ends up doing nothing if you also have them
> > referenced through a default pinctrl setting. They end up always
> > referenced and always included. For the D1 series it looks like no
> > peripheral has default pinctrl setting given.
> >
> > We can still keep it though. It would help when future chip variants
> > specify different pinmuxes.
>
> Oops, thanks for pointing that out. I'll try to avoid that mistake in fut=
ure.
>
> > The compatible string should be the first property. In other sunxi SoC =
dtsi
> > files, we put the pinctrl just before the "status" property if it's pre=
sent
> > to specify a default pin muxing.
>
> Oh that makes sense.
>
> >
> > I can fix it up while applying.
>
> Please do!

Applied. Please check here:

https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=
=3Dsunxi/dt-for-6.6&id=3Df05af44f691351bfd954f39ec376666dc5e1b869
