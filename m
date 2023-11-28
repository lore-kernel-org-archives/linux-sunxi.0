Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3A5E0D6
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso4536103b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 08:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189563; x=1701794363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZVq+tnZrzJJKqeHrCOUaRPEG7BJXhNfIpCjpEqZuC8=;
        b=f3BcZBQAhc42/Vr4pXrZwMWCldd7T2eQ3olAvXTG//viVGbD/rHSOwV6Pn3Cz0TVzk
         rHherWfV4ShM2b60gR05wkRhRmzobaZvWM0MnLRRxUaelpFfAke1RTrflwCICahmY05v
         PTr9rchiTargTQ9Z+3k2sPB2SQ+a6XJ1lH5cRmkrc30buxEMVnoTTyvbIQ1kBPr08xLz
         SqVJmXLRcHkjbD6gmHy0Tunn+3g93jo85oIDGnRpkHHSh4atdQeTj9zeL9MR9UV04+RO
         K7kn6Rj5Vsn7qRk05P/Aw3e+jsZXVtm3928nuMzFTqTCF6fwC+KgMshQkdB4KnDkyU3N
         KyoA==
X-Gm-Message-State: AOJu0Yz54P+xqdtxeMRp8wF1lxW9/A5cxjrrZFXP+Xn2Gdpbn0s4No43
	FQXjjmMGmFhCfcA4+BTVaQ6RwcrgMFWYUg==
X-Google-Smtp-Source: AGHT+IHrxjreDGqRZk4SWG9ctbQLiN+6wWyG+Yk4d4kkalKBjuHV4vq6PS2Gdgd2yrXKpSIjCPr8Tw==
X-Received: by 2002:a05:6a21:3714:b0:18b:8147:91fb with SMTP id yl20-20020a056a21371400b0018b814791fbmr11951574pzb.19.1701189563091;
        Tue, 28 Nov 2023 08:39:23 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id g3-20020a62e303000000b0068a13b0b300sm9491506pfh.11.2023.11.28.08.39.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 08:39:22 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5be30d543c4so4072904a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 08:39:22 -0800 (PST)
X-Received: by 2002:a17:90b:30cb:b0:281:3a4a:2e61 with SMTP id
 hi11-20020a17090b30cb00b002813a4a2e61mr14001629pjb.14.1701189562547; Tue, 28
 Nov 2023 08:39:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128005849.19044-1-andre.przywara@arm.com>
 <20231128005849.19044-5-andre.przywara@arm.com> <ddceb30f-1778-4312-af91-97813fe3c6fb@linaro.org>
 <20231128143309.38a4ce61@donnerap.manchester.arm.com> <4e90608e-aca5-4b57-be76-350ad54f9e7c@linaro.org>
 <20231128161010.26657e76@donnerap.manchester.arm.com>
In-Reply-To: <20231128161010.26657e76@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 Nov 2023 00:39:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v643S6vLxXghZNqyC=7SKSH3EZNd9Xriu1jBKjza7-Ex6g@mail.gmail.com>
Message-ID: <CAGb2v643S6vLxXghZNqyC=7SKSH3EZNd9Xriu1jBKjza7-Ex6g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] thermal: sun8i: add syscon register access code
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Bob McChesney <bob@electricworry.net>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 12:10=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 28 Nov 2023 15:48:18 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>
> Hi,
>
> (adding Maxime for the syscon question below)
>
> > On 28/11/2023 15:33, Andre Przywara wrote:
> > > On Tue, 28 Nov 2023 08:43:32 +0100
> > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > Hi,
> > >
> > >> On 28/11/2023 01:58, Andre Przywara wrote:
> > >>>
> > >>> +static struct regmap *sun8i_ths_get_syscon_regmap(struct device_no=
de *node)
> > >>> +{
> > >>> + struct device_node *syscon_node;
> > >>> + struct platform_device *syscon_pdev;
> > >>> + struct regmap *regmap =3D NULL;
> > >>> +
> > >>> + syscon_node =3D of_parse_phandle(node, "syscon", 0);
> > >>
> > >> Nope. For the 100th time, this cannot be generic.
> > >
> > > OK. Shall this name refer to the required functionality (temperature
> > > offset fix) or to the target syscon node (like allwinner,misc-syscon)=
.
> > > The problem is that this is really a syscon, as in: "random collectio=
n of
> > > bits that we didn't know where else to put in", so "syscon" alone act=
ually
> > > says it all.
> >
> > Every syscon is a "random collection of bits...", but not every "random
> > collection of bits..." is a syscon.
> >
> > Your target device does not implement syscon nodes. Your Linux
> > implementation does not use it as syscon. Therefore if something does
> > not look like syscon and does not behave like syscon, it is not a sysco=
n.
> >
> > I looked at the bit and this is SRAM, not syscon. I am sorry, but it is
> > something entirely different and we have a binding for it: "sram", I th=
ink.
>
> Well, it's somehow both: On the face of it it's a SRAM controller, indeed=
:
> it can switch the control of certain SRAM regions between CPU access and
> peripheral access (for the video and the display engine). But then it's
> also a syscon, because on top of that, it also controls those random bits=
,
> for instance the EMAC clock register, and this ominous THS bit.
> I guess in hindsight we should have never dropped that "syscon" string
> then, but I am not sure if adding it back has side effects?

Either way you would need to add locking around the register accesses,
or you could, however unlikely, end up with two simultaneous read-update-wr=
ite
accesses by both consumers (THS and claiming C1).

If you add the syscon string back, then you'd have to convert the SRAM
controller driver to use syscon as well, as there is no way to provide
a custom spinlock for the syscon regmap. Another reason why a driver
would want to create its own regmap.

> And as I mentioned in the cover letter: modelling this as some SRAM
> region, as you suggest, might be an alternative, but it doesn't sound rig=
ht
> either, as I don't think it really is one: I just tried in U-Boot, and I
> can write and read the whole SRAM C region just fine, with and without th=
e
> bit set. And SRAM content is preserved, even with the thermal sensor
> running and the bit cleared (or set).
>
> So adding the "syscon" to the compatible would fix most things, but then
> we need to keep the open coded lookup code in dwmac-sun8i.c (because olde=
r
> DTs would break otherwise).

dwmac-sun8i already falls back to syscon_regmap_lookup_by_phandle() because
of even older DTs. I'm the one that added the open coded stuff, mostly
because the R40 had the bits embedded in the clock controller, not the
system control, and it seemed error prone and hard to debug for some
other device to have full access.

So you'd just be reverting the driver to the old ways.

ChenYu


> What do people think about this?
> Samuel, does this affect the D1 LDO driver as well?
>
> Cheers,
> Andre
>
> >
> > >
> > >
> > > And btw: it would have been about the same effort (and more helpful!)=
 to
> > > type:
> > >
> > > "This cannot be generic, please check writing-bindings.rst."    ;-)
> > >
> > >>
> > >>> + if (!syscon_node)
> > >>> +         return ERR_PTR(-ENODEV);
> > >>> +
> > >>> + syscon_pdev =3D of_find_device_by_node(syscon_node);
> > >>> + if (!syscon_pdev) {
> > >>> +         /* platform device might not be probed yet */
> > >>> +         regmap =3D ERR_PTR(-EPROBE_DEFER);
> > >>> +         goto out_put_node;
> > >>> + }
> > >>> +
> > >>> + /* If no regmap is found then the other device driver is at fault=
 */
> > >>> + regmap =3D dev_get_regmap(&syscon_pdev->dev, NULL);
> > >>> + if (!regmap)
> > >>> +         regmap =3D ERR_PTR(-EINVAL);
> > >>
> > >> Aren't you open-coding existing API to get regmap from syscon?
> > >
> > > That's a good point, I lifted that code from sun8i-emac.c, where we h=
ave
> > > the exact same problem.
> > > Unfortunately syscon_regmap_lookup_by_phandle() requires the syscon D=
T
> > > node to have "syscon" in its compatible string list, which we
> > > don't have. We actually explicitly dropped this for the A64 (with
> > > 1f1f5183981d70bf0950), and never added this for later SoCs in the fir=
st place.
> > > I guess we could add it back, and it would work for this case here (t=
ested
> > > that), but then cannot replace the sun8i-emac.c code, because that wo=
uld
> > > break older DTs.
> > > So is there any chance we can drop the requirement for "syscon" in th=
e
> > > compatible string list, in the implementation of
> > > syscon_regmap_lookup_by_phandle()? Maybe optionally, using a differen=
t
> > > prototype? Or is there another existing API that does this already?
> >
> > I must correct myself: I was wrong. You are not open-coding, because as
> > pointed out, this is not a phandle to syscon (even if you call it like
> > "syscon").
> >
> > The code is fine, maybe except missing links (needs double checking,
> > because maybe regmap creates links?). The DT binding and DTS needs
> > fixing, because it is not a syscon.
> >
> > Best regards,
> > Krzysztof
> >
>
