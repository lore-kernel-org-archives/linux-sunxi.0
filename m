Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7430CE2
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5aa7172bafdso3522772a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 00:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161973; x=1701766773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5icATiMvArGEI8Y7AopIfPdtrmtXjYdJv85ysHZJSc=;
        b=DGuQDrXmqv3jFDwzagPDsMSWntbYI6TkqGEUDWR5fh+QZ50txGjCP+dRkPzs8febk3
         9cjW3RiT+xR8NemWfEt415DOQdjDepXC3q7IJFIymPL8APCuhvGyTmEpl7O7cy291D+b
         0WU+hTQaMPf44jaTQ20v4aEw9Qla2uNVLIn+t8yVRBVJB0dywqxUvSoYP7xn8rCnv+Bo
         sg5qKj6lgLbPOvtpb/iV+KCGwsp9HYFdEFJeqev8ldvEumV0Rjn75nkHybnV6TIXDWyv
         ghOefDD9253iXIadJ+dMVZBNJq1o6acihLjywXuIcOuaCOdqdN4wbq7rkucDmt5Ii8eX
         escQ==
X-Gm-Message-State: AOJu0Yx1h7uddOwAnWaovxKTPRyJlg+hnK0wwevxkxqUbZKxR+2JcTmA
	zlQWBUKSi0RkdF/hxdsl8OP5aoPl8A3FiQ==
X-Google-Smtp-Source: AGHT+IFd+tpQPl6SQdwjIiBLU7fHThqjotK8sR+SP5wWz/i+0lO+krolfwxH7kowhH2gFnA0O1H+fA==
X-Received: by 2002:a05:6a20:a10a:b0:18a:e176:87e9 with SMTP id q10-20020a056a20a10a00b0018ae17687e9mr12060969pzk.15.1701161972630;
        Tue, 28 Nov 2023 00:59:32 -0800 (PST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a056a001b4a00b006cb6e83bf7fsm8433952pfv.192.2023.11.28.00.59.31
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:59:32 -0800 (PST)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so3546391a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 00:59:31 -0800 (PST)
X-Received: by 2002:a05:6a21:81a9:b0:18b:cd15:b832 with SMTP id
 pd41-20020a056a2181a900b0018bcd15b832mr12679124pzb.42.1701161971126; Tue, 28
 Nov 2023 00:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-1-andre.przywara@arm.com>
 <20231128005849.19044-5-andre.przywara@arm.com> <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
 <CAGb2v66YpYBS78C7H-O3zef2NTs+7=ec3A7jrZ+DxjYEyBmWxQ@mail.gmail.com> <9045f837-3370-46e9-8631-7464c796d643@linaro.org>
In-Reply-To: <9045f837-3370-46e9-8631-7464c796d643@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Nov 2023 16:59:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PFNz++d3_5smYBL_BRirYhu4SvX0j36y0JsmXHT33OQ@mail.gmail.com>
Message-ID: <CAGb2v66PFNz++d3_5smYBL_BRirYhu4SvX0j36y0JsmXHT33OQ@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 4:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2023 08:50, Chen-Yu Tsai wrote:
> > On Tue, Nov 28, 2023 at 3:43=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 28/11/2023 01:58, Andre Przywara wrote:
> >>>
> >>> +static struct regmap *sun8i_ths_get_syscon_regmap(struct device_node=
 *node)
> >>> +{
> >>> +     struct device_node *syscon_node;
> >>> +     struct platform_device *syscon_pdev;
> >>> +     struct regmap *regmap =3D NULL;
> >>> +
> >>> +     syscon_node =3D of_parse_phandle(node, "syscon", 0);
> >>
> >> Nope. For the 100th time, this cannot be generic.
> >>
> >>> +     if (!syscon_node)
> >>> +             return ERR_PTR(-ENODEV);
> >>> +
> >>> +     syscon_pdev =3D of_find_device_by_node(syscon_node);
> >>> +     if (!syscon_pdev) {
> >>> +             /* platform device might not be probed yet */
> >>> +             regmap =3D ERR_PTR(-EPROBE_DEFER);
> >>> +             goto out_put_node;
> >>> +     }
> >>> +
> >>> +     /* If no regmap is found then the other device driver is at fau=
lt */
> >>> +     regmap =3D dev_get_regmap(&syscon_pdev->dev, NULL);
> >>> +     if (!regmap)
> >>> +             regmap =3D ERR_PTR(-EINVAL);
> >>
> >> Aren't you open-coding existing API to get regmap from syscon?
> >
> > Not really. This is to get a regmap exported by the device. Syscon's re=
gmap
> > is not tied to the device at all.
>
> I am talking about open-coding existing API. Look at syscon.h.

The underlying implementation is different.

syscon maintains its own mapping of device nodes to regmaps, and creates
regmaps when none exist. The regmap is not tied to any struct device.
syscon basically exists outside of the driver model and one has no control
over what is exposed because it is meant for blocks that are a collection
of random stuff.

Here the provider device registers the (limited) regmap it wants to provide=
,
tying the new regmap to itself. The consumer gets it via the dev_get_regmap=
()
call. The provider has a main function and isn't exposing that part of its
register map to the outside; only the random bits that were stuffed in are.

> > With this scheme a device to could export just enough registers for the
> > consumer to use, instead of the whole address range.
> >
> > We do this in the R40 clock controller as well, which has some bits tha=
t
> > tweak the ethernet controllers RGMII delay...
>
> Not related.

Related as in that is possibly what this code was based on, commit
49a06cae6e7c ("net: stmmac: dwmac-sun8i: Allow getting syscon regmap
from external device").


ChenYu
