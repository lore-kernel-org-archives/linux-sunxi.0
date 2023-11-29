Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A63B2B6
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d00689f5c8so15653515ad.3
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 09:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701277767; x=1701882567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XT90raft4qh6RNwHKuCeh4qMI9GaXwyHHdgJokFFRM=;
        b=Zz7Ly1sDdv89HpwQidPtf/dLiGMppFdYcRr4i0BFMy5yjgs4//DT+WZiEoIkt3tK1T
         teJnkiZYPWuMfpzijuXiQ2BpmqDFqkXWkRb1QmjVEshIF6VRg5rCit1tPuTWSk7Qn5m/
         xIv3FsdChXczn0kUw58EY0+93mtaHF927SKMUlx3BWdahGAp+o1QXmYC3F3UgiPW5eTS
         mwGnnOCCGzJBfwSQI26Hn3e+UJ0ePsDDXQuiZXOl7Gi+k0a2867FTpbA18xRs/mgxdGY
         zPkMbpKcsdXGFiJun9yQcS4hCY6EsXrTaf4QV9ZGYvSffkVSaBpvyhqTnDFF7jauOU/b
         E84A==
X-Gm-Message-State: AOJu0YzVrxVnTnpuUmpS95wzEnKJwdkh77sCVq6YqI13kR6fTXm2PxNZ
	GZxFylPWHKOtTK3r7LUJhUixtIHssjqErQ==
X-Google-Smtp-Source: AGHT+IGTNURFG6xrQTQSX3HMDiWxsUswLnn7CVAz5gzIzoXwz2q3EZ38aRuFB5qG+XQItERCE4mVTw==
X-Received: by 2002:a17:902:d345:b0:1cf:a0e0:168d with SMTP id l5-20020a170902d34500b001cfa0e0168dmr19506390plk.62.1701277767324;
        Wed, 29 Nov 2023 09:09:27 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902989100b001cfd0ddc5d3sm5907117plp.277.2023.11.29.09.09.23
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 09:09:24 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c27ee9c36bso5116265a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 09:09:23 -0800 (PST)
X-Received: by 2002:a17:90b:3884:b0:285:d803:8945 with SMTP id
 mu4-20020a17090b388400b00285d8038945mr10586265pjb.46.1701277763468; Wed, 29
 Nov 2023 09:09:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-1-andre.przywara@arm.com>
 <20231128005849.19044-5-andre.przywara@arm.com> <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
 <20231128143309.38a4ce61@donnerap.manchester.arm.com> <4e90608e-aca5-4b57-be76-350ad54f9e7c@linaro.org>
 <20231128161010.26657e76@donnerap.manchester.arm.com> <CAL_Jsq+9J1=+gZ83QyedAWbFN=AwSB8ue+o4TM7F6yu5_62z3g@mail.gmail.com>
 <a097a613-14c1-4a53-bbe1-c44964e7ecaa@arm.com>
In-Reply-To: <a097a613-14c1-4a53-bbe1-c44964e7ecaa@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 30 Nov 2023 01:09:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mEyk_hZ=9wExzN5oF3frB7EimTHBSc_c98_pHO6inuA@mail.gmail.com>
Message-ID: <CAGb2v64mEyk_hZ=9wExzN5oF3frB7EimTHBSc_c98_pHO6inuA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] thermal: sun8i: add syscon register access code
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Bob McChesney <bob@electricworry.net>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 1:03=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 28/11/2023 16:50, Rob Herring wrote:
> > On Tue, Nov 28, 2023 at 10:10=E2=80=AFAM Andre Przywara <andre.przywara=
@arm.com> wrote:
> >>
> >> On Tue, 28 Nov 2023 15:48:18 +0100
> >> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> (adding Maxime for the syscon question below)
> >>
> >>> On 28/11/2023 15:33, Andre Przywara wrote:
> >>>> On Tue, 28 Nov 2023 08:43:32 +0100
> >>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>>> On 28/11/2023 01:58, Andre Przywara wrote:
> >>>>>>
> >>>>>> +static struct regmap *sun8i_ths_get_syscon_regmap(struct device_n=
ode *node)
> >>>>>> +{
> >>>>>> + struct device_node *syscon_node;
> >>>>>> + struct platform_device *syscon_pdev;
> >>>>>> + struct regmap *regmap =3D NULL;
> >>>>>> +
> >>>>>> + syscon_node =3D of_parse_phandle(node, "syscon", 0);
> >>>>>
> >>>>> Nope. For the 100th time, this cannot be generic.
> >
> > Unless it is the 100th time for the submitter, please just point to
> > the documentation.
> >
> > Can we simply ban "syscon" as a property name? It looks like we have
> > 65 cases in upstream dts files. Maybe that's doable. This is where we
> > need levels of warnings with okay for existing vs. don't use in new
> > designs.
> >
> >>>> OK. Shall this name refer to the required functionality (temperature
> >>>> offset fix) or to the target syscon node (like allwinner,misc-syscon=
).
> >>>> The problem is that this is really a syscon, as in: "random collecti=
on of
> >>>> bits that we didn't know where else to put in", so "syscon" alone ac=
tually
> >>>> says it all.
> >>>
> >>> Every syscon is a "random collection of bits...", but not every "rand=
om
> >>> collection of bits..." is a syscon.
> >>>
> >>> Your target device does not implement syscon nodes. Your Linux
> >>> implementation does not use it as syscon. Therefore if something does
> >>> not look like syscon and does not behave like syscon, it is not a sys=
con.
> >>>
> >>> I looked at the bit and this is SRAM, not syscon. I am sorry, but it =
is
> >>> something entirely different and we have a binding for it: "sram", I =
think.
> >>
> >> Well, it's somehow both: On the face of it it's a SRAM controller, ind=
eed:
> >> it can switch the control of certain SRAM regions between CPU access a=
nd
> >> peripheral access (for the video and the display engine). But then it'=
s
> >> also a syscon, because on top of that, it also controls those random b=
its,
> >> for instance the EMAC clock register, and this ominous THS bit.
> >> I guess in hindsight we should have never dropped that "syscon" string
> >> then, but I am not sure if adding it back has side effects?
> >>
> >> And as I mentioned in the cover letter: modelling this as some SRAM
> >> region, as you suggest, might be an alternative, but it doesn't sound =
right
> >> either, as I don't think it really is one: I just tried in U-Boot, and=
 I
> >> can write and read the whole SRAM C region just fine, with and without=
 the
> >> bit set. And SRAM content is preserved, even with the thermal sensor
> >> running and the bit cleared (or set).
> >>
> >> So adding the "syscon" to the compatible would fix most things, but th=
en
> >> we need to keep the open coded lookup code in dwmac-sun8i.c (because o=
lder
> >> DTs would break otherwise).
> >
> > Really, I'd like to get rid of the "syscon" compatible. It is nothing
> > more than a flag for Linux to create a regmap.
>
> Yeah, so thinking about it indeed feels a bit like we are changing the
> DT here to cater for some Linux implementation detail. After all we
> already access the regmap successfully in dwmac-sun8i.c, is that
> approach frowned upon (because: driver model) and just tolerated because
> it's already in the code base?
>
> > Not a fully baked idea, but perhaps what is needed is drivers that
> > request a regmap for a node simply get one regardless. That kind of > t=
hrows out the Linux driver model though. Alternatively with no
> > "syscon" compatible, we'd have to have table(s) of 100s of compatibles
> > in the kernel.
>
> So do you mean to either just remove the explicit syscon compatible
> check in syscon_node_to_regmap(), or replace it with a check against a
> list of allowed devices?

There is already device_node_to_regmap() which skips the check. It still
bypasses the driver model though.

> Wouldn't it be sufficient to leave that check to the (syscon-like)
> devices, by them exporting a regmap in the first place or not? And we
> can do filtering of accesses there, like we do in sunxi_sram.c?
>
> Cheers,
> Andre
>
>
> >
> > Rob
