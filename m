Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD372C08AC
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779644972; cv=none; b=AhPmzUh49SSefMCtRZywYh33v5ycMCVFv2kOwKKYHFbbmcA07UnnHXx7JnYIBW9Y1SUnupT+sNpWvaEMNF08cKoWzerLDOMOCs8tjA9fZONOG/YVp+KGafu/ERTkKg/PqavB6aKcbzqzMvt1xblr5AwkDNeOb1CZ7f1SReozOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779644972; c=relaxed/simple;
	bh=GgLqjq5uyJ6JdznXMeX3loFgq4JSiUpZCEz+KxNckMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDs51FiY0QdkjLSSygdXMOLpfC3QAvU/nNzyn7QE6bP+50J6s4MJp6vJ5oa3028JimniVG9MKqtyLvQ41lIr325RFdQ6yVlg6z+w/W6CIfkRF4kIX6X6vCB1pQPfznca2aLSOj2F9XVsH+0YAflg2OVkLr36THpGveJnK7cEIns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrAwh2rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrAwh2rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488031F00A3F
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 17:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779644969;
	bh=lhGzJQmR6uNVwUmY+v4cPRTlTkpIcDMQ2Qkuuz17AAE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VrAwh2rwRps/J88pF/cS157e08lApVV+wufWf1ufFhvNEN4izhlmEygFZZF167/wZ
	 ijENvczQTwOUOaykHhpdxZQG4AfZgvnR5Cs/ecEuorjhrXGcww7QYW1583cEIAs7ML
	 +MUEclFbeYl/NlVM2icb/DspD0jM2Pd20btYrChCmCZUJijWAPu9jCGipL6Lr/Kmtk
	 ncK1igr8WsKKpvpUg8veqwTpXPjchPHtM5hDA1UgiOu3ZyXujC1/Zhp/c/ZttC9uvC
	 GKOe5rGt42fHk/+cvxOR79i5IYwMzOLtz+3p0/+LtgxIe0ZhkTldmHkHykgT8fXz/L
	 VWaqbKXgA0f0w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393d07e8938so74394551fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 10:49:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTXotQIFrJq/VKjUeGdzRqliL4L5cVvBPH0h9KotPjAK8FMDJC
	j/+oD/JniotNP+HjJ17urwdZJyW90aa7SeEqt1tabzAQsb7VVPTCJ+0zalB0xV57KeT3tnzN1Up
	jfxWA+LLV2lcttoDwX22yTLO2eppPNzQ=
X-Received: by 2002:a05:651c:888:b0:395:b670:71ce with SMTP id
 38308e7fff4ca-395d8c35bd9mr36823261fa.2.1779644967660; Sun, 24 May 2026
 10:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518153339.619947-6-paulk@sys-base.io> <20260518161130.F0A4CC2BCB7@smtp.kernel.org>
In-Reply-To: <20260518161130.F0A4CC2BCB7@smtp.kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 20:49:13 +0300
X-Gmail-Original-Message-ID: <CAGb2v65+JwwU2p5TQ6hrqonYNUgVgZQMPY6D=ROqWJu=xy=drQ@mail.gmail.com>
X-Gm-Features: AVHnY4LvDPQc5oZnnG8mo8yYec158_H8XNlRXKMcaKU8ihVkc70ZfNJAsAQoHnQ
Message-ID: <CAGb2v65+JwwU2p5TQ6hrqonYNUgVgZQMPY6D=ROqWJu=xy=drQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 6:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `dphy` node is missing the required `interrupts` property =
and a SoC-specific compatible string.
> --
>
> commit ceae1b5da24380c4a30d9a8b480a23eaee3c0814
> Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
>
> This commit adds MIPI CSI-2 support to the Allwinner V3s SoC. It introduc=
es
> the device tree nodes for the CSI0 controller, the MIPI CSI-2 bridge, and
> the D-PHY block.
>
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-v3s.dtsi
> > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> [ ... ]
> > +             dphy: d-phy@1cb2000 {
> > +                     compatible =3D "allwinner,sun6i-a31-mipi-dphy";
>
> Should a SoC-specific compatible string like "allwinner,sun8i-v3s-mipi-dp=
hy"
> be included here alongside the generic a31 fallback?

Following our general guideline, I believe it should.

> > +                     reg =3D <0x01cb2000 0x1000>;
> > +                     clocks =3D <&ccu CLK_BUS_CSI>,
> > +                              <&ccu CLK_MIPI_CSI>;
> > +                     clock-names =3D "bus", "mod";
> > +                     resets =3D <&ccu RST_BUS_CSI>;
>
> Will this node fail dtbs_check schema validation? The existing device tre=
e
> binding schema for "allwinner,sun6i-a31-mipi-dphy" requires an interrupts
> property, which appears to be missing here.

Yeah, this is definitely going to fail validation.

> If the V3s hardware physically lacks a D-PHY interrupt, would it be bette=
r
> to add the V3s-specific compatible string and update the binding schema
> to make the interrupts property conditionally optional for the V3s?

FWIW the vendor kernel has some code for the D-PHY's interrupt bits [1].
Could you add the interrupt (I'm guessing the MIPI-CSI interrupt?) and
give it a quick test?


Thanks
ChenYu

[1] https://github.com/gediz/v3s-linux-sdk/blob/master/linux-3.4/drivers/me=
dia/video/sunxi-vfe/mipi_csi/dphy/dphy_reg.c


> > +                     allwinner,direction =3D "rx";
> > +                     status =3D "disabled";
> > +                     #phy-cells =3D <0>;
> > +             };
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518153339.61=
9947-1-paulk@sys-base.io?part=3D5
>
