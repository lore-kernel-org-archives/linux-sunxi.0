Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B152381D4
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cf856663a4so36141145ad.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 01:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162575; x=1701767375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1bBKfqAHcjtu3PVaC+NxvAALk+R4fESRpmVw3GnKYA=;
        b=kn43CMwrX35FT66v69PSYbfxLxAPlY/BOeAZiBHeHNfd3+6Ye5fjLfEq/4TUGfG+e9
         PjdHF2VTeXwNY+2c9AAFt9iaPSaP9vnB1xJrGKUbPy6Xf3zUQgG0T+/gzYyIkuFD6ZFt
         ILcmJ/unbbkJLGa86hpiCO2ylF4NBWKtZozMD07IBlHnQD9agLONfdqL+ER3yuA+yVPC
         vVd9ngRWg+1s4gUf4IQBFpNM+mqa1he8ARFX2ILo+WmLLTlnpCs5dcl4s7osLpkyN1DD
         kz9mYHn9LZvCnZoRuw8gdK6C9F19aV1Mf2uggLSmekw0kDO8xvrca246eRX1XkhtiimL
         RwWg==
X-Gm-Message-State: AOJu0YzeziBiNmZ/HoAqxcxNf6paoswTENVPenkVixls2Mqxol3F4PcD
	svty64wJDPWokkSrFbAiTGknFdzMwt14gw==
X-Google-Smtp-Source: AGHT+IEqQhL6ZuzROS7UCUSPFijW5DXalWqBPC3A7U+s+/QwaXc7SytYZueEBwACAf8YEGd+VULx8g==
X-Received: by 2002:a17:902:e752:b0:1cf:b5ae:2817 with SMTP id p18-20020a170902e75200b001cfb5ae2817mr11140667plf.54.1701162575401;
        Tue, 28 Nov 2023 01:09:35 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id iy7-20020a170903130700b001cfa70f3a53sm7674694plb.271.2023.11.28.01.09.32
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:09:33 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2857670af8cso3968539a91.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 01:09:32 -0800 (PST)
X-Received: by 2002:a17:90a:e7c8:b0:285:b6cb:6ab1 with SMTP id
 kb8-20020a17090ae7c800b00285b6cb6ab1mr8458811pjb.28.1701162572407; Tue, 28
 Nov 2023 01:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-1-andre.przywara@arm.com>
 <20231128005849.19044-5-andre.przywara@arm.com> <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
 <CAGb2v66YpYBS78C7H-O3zef2NTs+7=ec3A7jrZ+DxjYEyBmWxQ@mail.gmail.com>
 <9045f837-3370-46e9-8631-7464c796d643@linaro.org> <CAGb2v66PFNz++d3_5smYBL_BRirYhu4SvX0j36y0JsmXHT33OQ@mail.gmail.com>
 <CAGb2v66L+sW-GQ4HvR-rXsG=JTi6vKt-9P-y1=vPqh0e5gKiOg@mail.gmail.com>
In-Reply-To: <CAGb2v66L+sW-GQ4HvR-rXsG=JTi6vKt-9P-y1=vPqh0e5gKiOg@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Nov 2023 17:09:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Om8xqpgacbXV9Qf0tbV5qDcSOs7gW-uqSh2HD3Hhu3A@mail.gmail.com>
Message-ID: <CAGb2v64Om8xqpgacbXV9Qf0tbV5qDcSOs7gW-uqSh2HD3Hhu3A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] thermal: sun8i: add syscon register access code
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Bob McChesney <bob@electricworry.net>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 5:02=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Tue, Nov 28, 2023 at 4:59=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:
> >
> > On Tue, Nov 28, 2023 at 4:30=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 28/11/2023 08:50, Chen-Yu Tsai wrote:
> > > > On Tue, Nov 28, 2023 at 3:43=E2=80=AFPM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >>
> > > >> On 28/11/2023 01:58, Andre Przywara wrote:
> > > >>>
> > > >>> +static struct regmap *sun8i_ths_get_syscon_regmap(struct device_=
node *node)
> > > >>> +{
> > > >>> +     struct device_node *syscon_node;
> > > >>> +     struct platform_device *syscon_pdev;
> > > >>> +     struct regmap *regmap =3D NULL;
> > > >>> +
> > > >>> +     syscon_node =3D of_parse_phandle(node, "syscon", 0);
> > > >>
> > > >> Nope. For the 100th time, this cannot be generic.
> > > >>
> > > >>> +     if (!syscon_node)
> > > >>> +             return ERR_PTR(-ENODEV);
> > > >>> +
> > > >>> +     syscon_pdev =3D of_find_device_by_node(syscon_node);
> > > >>> +     if (!syscon_pdev) {
> > > >>> +             /* platform device might not be probed yet */
> > > >>> +             regmap =3D ERR_PTR(-EPROBE_DEFER);
> > > >>> +             goto out_put_node;
> > > >>> +     }
> > > >>> +
> > > >>> +     /* If no regmap is found then the other device driver is at=
 fault */
> > > >>> +     regmap =3D dev_get_regmap(&syscon_pdev->dev, NULL);
> > > >>> +     if (!regmap)
> > > >>> +             regmap =3D ERR_PTR(-EINVAL);
> > > >>
> > > >> Aren't you open-coding existing API to get regmap from syscon?
> > > >
> > > > Not really. This is to get a regmap exported by the device. Syscon'=
s regmap
> > > > is not tied to the device at all.
> > >
> > > I am talking about open-coding existing API. Look at syscon.h.
> >
> > The underlying implementation is different.
> >
> > syscon maintains its own mapping of device nodes to regmaps, and create=
s
> > regmaps when none exist. The regmap is not tied to any struct device.
> > syscon basically exists outside of the driver model and one has no cont=
rol
> > over what is exposed because it is meant for blocks that are a collecti=
on
> > of random stuff.
>
> My bad. I failed to realize there is a platform device driver for syscon,
> in addition to the existing "no struct device" implementation.

Actually that doesn't do anything on DT platforms as of commit bdb0066df96e
("mfd: syscon: Decouple syscon interface from platform devices"). All the
regmaps are, as I previously stated, not tied to any struct device.

> > Here the provider device registers the (limited) regmap it wants to pro=
vide,
> > tying the new regmap to itself. The consumer gets it via the dev_get_re=
gmap()
> > call. The provider has a main function and isn't exposing that part of =
its
> > register map to the outside; only the random bits that were stuffed in =
are.
> >
> > > > With this scheme a device to could export just enough registers for=
 the
> > > > consumer to use, instead of the whole address range.
> > > >
> > > > We do this in the R40 clock controller as well, which has some bits=
 that
> > > > tweak the ethernet controllers RGMII delay...
> > >
> > > Not related.
> >
> > Related as in that is possibly what this code was based on, commit
> > 49a06cae6e7c ("net: stmmac: dwmac-sun8i: Allow getting syscon regmap
> > from external device").
> >
> >
> > ChenYu
