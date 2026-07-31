Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C991DF248
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504024; cv=none; b=pP/oig+AKm5Gmu4v8EQtA0Hc7U7W5unwYdWlUZifU2TF5lnvdD9/gaM+0qlc9ChaD9AFkt78PYN1/p5E6XAx5jGH+AjBOh8Ho2f3abtEWm7gVr7PnhpCKpF2JQgKBlDBXaUDV6stNNJZ2eWOyJSf2y2CByqhgWFB8/jroY+jRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504024; c=relaxed/simple;
	bh=fXZc1e3H5OLeGezkYIfE84IWuVtHGqDROsWo1lIXLb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdMspMJD8JmdtjS45EIh8Vf5MOX37VyYBvdQeVpQjGpFQXQYECu0oXvm/TBbq7StfZU4XHSubggR4lIQoCL0punwx7ItqlG3VNz5BPT1ljpAWLVytZLYxiSF/Ls8PieYDRNZT4dYU37DWbeOwwO/XEtjpSEW4B0rXeRCuU9efNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDTOX6ug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDTOX6ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9AD1F00AC4
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785504022;
	bh=aCl9K/obc/qaBcU2SXRis+1PiCbpcZjSV6qqaO7YKoo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=aDTOX6ug8z2gMz6azpLB55TzWkpUJSTbavBYEnANaXkUDCowmzcjvePmKbQwSbSnx
	 //M7fpAS/X1zZcgZlVuMOMq8MDogmqGPtHen2i3U6iw0QhpcDNqmxneo6/l5ZWudyj
	 zqUGkER39Xzt2n7AhUxPoDOS+IRdlw21AgpEps1fUBf7oyIRuRvfsvRV3pcwkTZ/9H
	 8pYVUncx3TN6W0aE+70nlN8jAEjb8AO1lA15wytedRXBH8QsnIqkVg59QbG26qP0u2
	 88xslNRXfyJnftHpCqQtfRKUC6al8yLgOfuaQliHOZXQjhCBXAxbIlfKWoQ6jPyuao
	 L/Q+eSr/YGxow==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39f6265a5bbso6649841fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 06:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6YTfBcsb5qqZb7AyeAeaGkmDxv/8yk/a5kVc8ed9vrM3J/+glOsQjbo1UJ/gJbWey37brejHkzRDf9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ184vOdCIn0e5DXNJvHcJv8JfqzhrdqOfVQTEC6NeTFALEd9F
	9Rj8RmtgPb726ceR6C/uTP/u/2GCNgZuMHC6zYoQI359SbuDcizDjQNO4LBfdodPueL4BFA1YZs
	lGxirJtfyD1S65UjDq4YDkbt/aOV5Ab0=
X-Received: by 2002:a2e:be20:0:b0:39b:3018:e5e8 with SMTP id
 38308e7fff4ca-39f7e399a84mr4063191fa.12.1785504021258; Fri, 31 Jul 2026
 06:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
 <20260723002319.2793cdaf@ryzen.lan> <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
 <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com>
In-Reply-To: <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 31 Jul 2026 22:20:22 +0900
X-Gmail-Original-Message-ID: <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
X-Gm-Features: AUfX_mwhrLD5Q1QX9sADUb1-mA4bFhX0ct_Zhama9EUbjG0lVP36L811sJeDsZ0
Message-ID: <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Juan Manuel <juanmanuellopezcarrillo@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:08=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Juan,
>
> On 7/30/26 19:40, Juan Manuel wrote:
> > Hi Andre,
> >
> >> There is more to enabling Ethernet on the box, though, right? The
> >> EMAC25M pin needs to be configured correctly - not even sure that
> >> works cleanly with mainline? And what are the delay values that work
> >> for you?
> >
> > Right, the withstand fix alone isn't enough. Three things were needed t=
o
> > get GMAC1 up on the OPi 4A:
>
> Sorry, there might be some confusion here: I think Chen-Yu already
> mentioned that Ethernet works on his OPi 4A, with just the withstanding f=
ix.
> I think I was mixing this up with the X96QPro+ TV box when asking, which
> also uses the second MAC, but has a different setup.
> So are you talking about the Orange Pi 4A? Because ...

I only said the patch fixes eMMC. Ethernet already worked before. Though
to be honest, ethernet on the A523 has other problems. The performance
is really bad (even RX), and there are errors or packet drops.

ChenYu

> > 1) The PJ pinmux. Mainline's rgmii1 group was missing PJ10, which left
> >     one RX signal unmapped, so I got rx_packets=3D0. The BSP muxes the =
full
> >     PJ0..PJ15 (16 pins) as function "gmac1" (mux 5); with all 16 mapped=
,
> >     RX comes alive. I don't mux any separate/dedicated 25 MHz clock-out
> >     pin beyond that gmac1 group, and the link is rock solid, so on this
> >     board the PHY's 25 MHz reference isn't provided by an extra SoC pin=
.
>
> I think there is some misunderstanding here, probably caused by
> Allwinner's naming of that pin. Pin PJ10 (and PH13, inside the GMAC0
> group) are mere clock fanouts, they connect internally to two gated
> divider clocks, with the main peripheral PLL as their parent. They
> produce a 25 MHz clock signal, which is simply routed out to those pins.
> They work independently of the MACs, and could be even used for
> something else.
>
> On boards which do not use a crystal oscillator to clock the PHY (most
> boards, including the OPi 4A, have an oscillator!), the pin is not
> needed, hence we didn't include it in the pinmux. According to the
> schematic, PJ10 is not even connected on the OPi 4A, so whether you
> include it in the pinmux or not doesn't matter.
>
> So can you please double check this? For PJ10 to have any effect, it
> also would need the associated clock enabled.
>
> And for the records: I think I found now the proper solution to enable
> Ethernet on the X96QPro+: the pinmux for PJ10 gets added, either in the
> PHY, or the MAC DT node. The associated EPHY_25M clock must then be
> referenced by the PHY node. And the respective PHY driver needs to
> enable that clock (some do, others don't).
> With those things in place, Ethernet works on the X96QPro+ board, which
> does not feature a crystal oscillator, hence relies on that 25 MHz clock
> output to step in.
>
> > 2) RGMII clock delays. The board has a Motorcomm YT8531 PHY:
> >       - phy-mode          =3D "rgmii-rxid"
> >       - PHY node          : rx-internal-delay-ps =3D 1900  (YT8531
> > RXC_DLY_EN, ~1.9ns)
> >       - MAC syscon        : tx-internal-delay-ps =3D 100
> >                             rx-internal-delay-ps =3D 0
> >     That combo gives a stable 1 Gbps / full-duplex link, 0% packet loss=
.
>
> Those settings differ from what's in mainline. What are the results with
> those delays? Does it work as well, and those are just other settings
> that happen to work, because the math works out the same?
>
> Cheers,
> Andre
>
> > 3) Your withstand encoding fix. Before it, the PJ bank was driven at 1.=
8V
> >     while the receiver sat in 3.3V mode, so RX was effectively deaf. Wi=
th
> >     your patch RX reads correctly.
> >
> > All of the above is validated on my board (2026-07-08): link up at
> > 1 Gbps/full, ping 0% loss over a sustained transfer.
> >
> > Thanks again for the withstand fix - glad the POW_MOD_SEL patch helped
> > connect the dots.
> >
> > Cheers,
> > Juan
>
