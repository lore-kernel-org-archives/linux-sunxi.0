Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC06E1F4E57
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Aug 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136492; cv=none; b=LGksUlm00CxkI5TnfdtMW9u/TKxRkKRW2r+7hO7sUIIh147CVWaV1sR7Fj9kr0f/F0j9fCeUz4u1eAFchJSdCBVNvCgT2nNmh+0BVILAJ6rfu3mxK+g7EwgNvijZBl8rBhBk6Rh44nnoAfwe4eV8MlWhRZT7RygGDkdCQB0LXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136492; c=relaxed/simple;
	bh=iVJ9I3QV2otLbWWjQsCxDOsmCPvi3IMzSx/d+b1GE/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCT2epgcnHqoAOuoQfb6CmL/R5ufIJMffZts+1FmjECaqhrQPoePx2ljp5IsvDwy2hUkKUvC/UgYwkhv3yknvEuW7jOpAgaG75mTjng5yWmyK4BYusxoDM8NBWOjhqhRzZ6lFYZ+Jey7gF1j4gWsppGUjuQB0NvCIz28YmkHFZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-33670e8c975so9675041fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Aug 2025 08:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136487; x=1756741287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lf0SerB/BddtiPRZt6oTCzK0uyEGO4TRGC1HhfQpBU4=;
        b=luUAbmkF5X2vTtTxTcNQxHj58EzKP0Os45CKFAmrzk1y1q/0lDEfEGSVyGPWOKfriv
         oXRGJSIH7y+5DcmvJaU/lde9RUszYwZV8LsIlGgQLCZhRUG+BBn5qY+WLOcNV7GquAuR
         6Vv8vfnn6zZhrKpWUz3LqJTkjY5tBdZ0dkbqK1USiAAtOsRoqligVxe+UYPZodcr2zv7
         EB0mCoR6aG4RU4Mcf3KAksWB2q59Uu0jor8zmpdWNeJM0njle7IJEIISBrnJoGMjD2Jw
         hbl3Pfna4rZWuPGAgJlLeODCqM+tCJA7lNJMLNlHnJlxciOWv6Q1eL9sjviKEaWmMOjQ
         V7eg==
X-Forwarded-Encrypted: i=1; AJvYcCW9rL5PaDNTYdH7UI2KcoPStC5Tmhzuz7LsZiHRTwPWlMGNVsaijTFTpgCQuvB2GFOI4OFal8WXQ3REFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzktFDD6uOGZDwb5ijSHJ+YUKbAmEcsvPlb+83MvdsD4ACyNaht
	kcykjtQSfWNv+o/nPLRCbh+Duft+pZxvGMHN+8Nkp8KOSnjEV31VCi52UuByfNx23Xc=
X-Gm-Gg: ASbGnct8ipjWEC09iWksf78JmI3md3t1lvyX2UYRkuktqkJ2UfFwwlRZel9payJdAvk
	DdnN7L47ztOF9o1pOUMTLhpB+GGDcG+pU3efyVuoXKdYljiKpzrIsKfpen9nnEFYdxIuSA4xwke
	PKZCI18ZToREOs1mF3/fBP8pJQ5czKR+NGWzQBeh7w2dC6r4wpt8gW+/JaLCX1yADjq4ilqepPL
	3yAX/1tjcOS1PnDGHcZGjiq5hc8dKCfm4b1ubWBCyDonlVj/IaNONmhT0hr1Kkrq4M9e3O7yfms
	9B9a8C4fgX7UGHZBmIjCKJm0npSFsIZREzzqCvGg5eKJqoMQRcMbgmptHznCRmQfwXv2Uqv1YZr
	eDdgIQqYYPACg1pK3LN6K59pMk2SW+9xRgenkh1U8NdbRp+DXLI9yW7trptZJN2mQhQ==
X-Google-Smtp-Source: AGHT+IHhJgq7JjBIa5VB6T8/dwA9f+N7bjOZOvoP+3kmj4Upv7gEuxp+BT2gXyWzFdd5OMQ0NyFfXw==
X-Received: by 2002:a05:651c:31c5:b0:333:b656:a685 with SMTP id 38308e7fff4ca-33650e3812dmr36900161fa.1.1756136486692;
        Mon, 25 Aug 2025 08:41:26 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e263928sm15981891fa.31.2025.08.25.08.41.24
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 08:41:24 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-33670e8c975so9674491fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Aug 2025 08:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOOBEZIpVeUkB2RAogRdCT4BykK3D78SLZt4RCzdfp6EA1UXSGoHF5BavWOS7eG3XC2Yzrb2S7fWnGkg==@lists.linux.dev
X-Received: by 2002:a05:651c:31c5:b0:333:b656:a685 with SMTP id
 38308e7fff4ca-33650e3812dmr36899791fa.1.1756136484611; Mon, 25 Aug 2025
 08:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250816084700.569524-1-iuncuim@gmail.com> <20250816084700.569524-6-iuncuim@gmail.com>
 <20250816144936.3f2738cc@minigeek.lan>
In-Reply-To: <20250816144936.3f2738cc@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 Aug 2025 17:41:12 +0200
X-Gmail-Original-Message-ID: <CAGb2v64vMvs+UN4AJWZAGnU+ZQRBQBheqnRKzbMmd10UMdOxCw@mail.gmail.com>
X-Gm-Features: Ac12FXyXTRSXu5z7cM1Z4ILcGzs0omRgBCqYp8gycWr1OzOdi7Cz8MsXeBWG_GU
Message-ID: <CAGb2v64vMvs+UN4AJWZAGnU+ZQRBQBheqnRKzbMmd10UMdOxCw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
To: Andre Przywara <andre.przywara@arm.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 3:52=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sat, 16 Aug 2025 16:46:58 +0800
> iuncuim <iuncuim@gmail.com> wrote:
>
> Hi,
>
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >
> > After adding the phy driver, we can also add phy node. In addition to t=
he
> > clk and reset lines, the power domain PD_PCIE is declared in this node
> > according to the bsp dtb. So let's mention it.
> > Currently, phy driver does not support role selection and only works in
> > USB3.0 mode.
>
> That's the current limitation of the proposed Linux driver, but should
> not affect the binding or DT:
>
> >
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index e4ed4fa82..233365496 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -606,6 +606,16 @@ mdio0: mdio {
> >                       };
> >               };
> >
> > +             combophy: phy@4f00000 {
> > +                     compatible =3D "allwinner,sun55i-a523-usb3-pcie-p=
hy";
> > +                     reg =3D <0x04f00000 0x100000>;
> > +                     clocks =3D <&ccu CLK_USB3>;
>
> Will we need more clocks (or resets) when supporting PCIe later? If
> yes, we should add them already now, even if they are not used by the
> current driver.
>
> > +                     resets =3D <&ccu RST_BUS_PCIE_USB3>;
> > +                     #phy-cells =3D <0>;
>
> I think we should use one PHY cell here, to allow users to select the
> PHY path they need. A USB3.0-only driver implementation could choose to
> ignore it, or require the number to be 0 only, rejecting anything else.
> But this way we keep compatibility with newer DTs.

Agreed. It seems this is the common case for combined PHYs. The last
cell tells which type of PHY is to be used.

ChenYu

> Cheers,
> Andre
>
> > +                     power-domains =3D <&pck600 PD_PCIE>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               ppu: power-controller@7001400 {
> >                       compatible =3D "allwinner,sun55i-a523-ppu";
> >                       reg =3D <0x07001400 0x400>;
>
