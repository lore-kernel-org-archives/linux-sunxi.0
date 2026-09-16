Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC9EEC0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535551; cv=pass; b=oviZtaH7N4rLJySFK0IAbWj35QM1uEjovbpJ4PRAk2A/oQYK/aQ+Wiw2vQsnC0VgkOogTCCsVIxFMM5XvBIWzhsM0yFqlLCmCfwLn9zOgG6NDKHI+2ryyTii36JseEKI8tLBWDSYSPpa65vlC5iJA5RrBOFxC1BeW8Hgguxqbhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535551; c=relaxed/simple;
	bh=xfMfjILt2qYVQAqWVFpTkowhP2xgf3MvNiTst1AwzOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epWVaK/0rgJido0UgWIx7Nwq39GkT+LJTkAKkcFn+xm8jl9CmqpiUU36crKr5aaGaOpBeqAkuneVTv63+SOA/QT6bhUTmsnfg1HNlwUlqaIYU7nHLtCWwpA2SYnjk6Hwvo8OpMtcRtwFcDoMk8YagGPwDT0kF216c3J8xpjt8ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8RcH0f+; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8RcH0f+"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so247238241.1
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 22:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535548; cv=none;
        d=google.com; s=arc-20260327;
        b=LRlJFHvffzlLvurNtaFWJEIcRA7nlzWvO3GHyiWhR6Cwervw9gKR74TVCF2zTxOoD6
         1P/5UD1sv8OhdQikKAa1Ri/5tK0utrvI7k0LSx4lTEqrKhz93MV6MfHJQvbZm5FRSx0S
         hGon9bsg7+JT9JO1DhY1sGdOxu6lEX7EiOJd0aGad5jpcz0885+Mm1VB9MM6imer6jub
         bogMX2cSmqfpznRIX6b0J1GRCFEmXqihIwFn9aYc9nWIVbC0Eq4RTJYsPAPR8q4Vu+kw
         I31qnYDW0bPjNOhDXNS923WB+koMJNex8QCV2IzXJ6325ZCQmWrA/jkMhPKU1iAvLa3M
         pKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        fh=8gz59/MISEgIeD6oLBEZK9vMR5u8kToSfIuXMnOVueA=;
        b=f8A3jeyZZZnPb6Qhsbi312bbO5L4p/PJs0/oTGARLtB56qwIjkHZ1RV8MfioQlm06h
         ljNB1mko9rM/2FBiBQZxphy8lfgqVG4TR9Tmv875vEKF2+totdLNswgBoAdLNGFmvJ0N
         2zm4q3BG4PpXItnvRYPi5mlBY1rfsIZR6/WscAmbO5YQpaGNmYToFtNjyPSm4Uh0Comu
         8bT5sUtBJfqroEqt+VeMALK28o/gm9Z4yzDDyhEdgH4Igl7epY9N1eHzLHio+8hsbEDI
         sFqscEp/D3DgShJYO3olJ7xSeVXhWKkHi8dnVuXU1y5G0rMYIcmWGl33pT6rd4RPE2/D
         7VVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535548; x=1790140348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=P8RcH0f+EYxy/Gzdr/+3l6dkdQxs5nkhngMsO2WZ90QJbjXRnpNCRE3Wz1Zy290xiz
         D4goWYGhSCxp5bEwVnEjpQxzrkKQqw94DfzmmbxKomj5WLi7ajss9EvtLWmqRYZCPcr6
         7YSVM738niI2ZROVHGgRb7B/B7nmYfDoHqT1FRv58i3wHFPw2MV5/HgD5p1gzyjgJrre
         EoNHmEy2WvqdG+5X7ToXmNAlK/e4wi5uHQ19IbxKy9paJZeLWAnPjROaveOEf9y+pqsB
         wToNm0pFVMK75Vlfq1u0FsOcCKcoEJicOMHyIQBOXPkQc8XVwwmiAxB+8U7OavlRTgbN
         UsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535548; x=1790140348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=dspRMm4KidzxOx22P6khsAbnKyCHo8kmLPDnVhwZZa+5EQjr1jqTMih3ufXAJK2+6H
         rIpual+D8Udx0Zp0083zjxy+TmyLwsGI+WkuQaT+xO9LAn92s3EH6TGajo39nSgkdyUX
         nNtMw4g9c0Cj3rV7qO4BeseUmVyOxTKl3Am6znfGHwsQSedZizu0wu3cn4wE0jtZsVZu
         O8j9NG4xRQGhiNvGeFrCUD+4Bile/LrNA6oZDF1AeEscvfMRHA/C7OicieuIXNWKqqbE
         zJERGFc/0ttKpAsyhnlj+KmHXKGq4USkt2qFHOT4VyZJJnxGfhxbz5s2JBwVeyZS76XJ
         sLEw==
X-Forwarded-Encrypted: i=1; AKwUvBxjmCKGyT71k17aoDhYpuz/Jm57T+nq6z26ZkMxGtU4QYdKiRG/8TpCKeYzm0gQu+W1EVjPWdklWB+Ocw==@lists.linux.dev
X-Gm-Message-State: AFuF++koH+ZTzl+xftJpgwaCR02F+wAue8yoog6JrW7oKsxLbr3NZhPB
	c0yMyzYcBkJC1Ev9JJ3GN0dSwcd4h9cx1Jl9LERMmbLjYp1aznnxbGe5KakjbfdC7vFjfymTWO7
	QVXqnfIPWlP9nGVCxfYNql11HhkfEcKnHsCkn1TE=
X-Gm-Gg: AYBFou0TT7dtortIFBjtJExMtjXSs0KTIUwrFBdiBzIINq/z476uLf4fbGeSuUxR74n
	fAnT4iMFnqhw9WTmvdU1ecGSYY2GtKzfUxKsUNTlxwMw4Auye9ZWul3i6HfCJJT34fDJGVqrid7
	liQPmThmqACiCjNHGkZreRQkPGQCrda6Cr6TT1zXuZFMbBxVjNgsb0lm70X85G8HTVI255/l9VE
	BmOuLUU+6A9ouC8MKh23AwE2+m0qNtEMQzSI7ARTbpZMFF3k3sMs9mnkMfNlfCLbuFO8fl7UN5O
	Pt/5YjeaboCTtv3/UgYGEgIspdLUCb270FQWGFkdvw5xO8laWiMSNn6pjz6thDhIv/BtqfdnLWH
	dpI2kruM6DwJ4xwEOo2UTRbqkiliam/ejqI3oedGClbeAITMsHXxVvo25UEGLLhs50SjhEf0L3O
	xp6YWdGpec6ynItzCCbhKHMzvI4h2FABobaJ7rYY0UXuyz
X-Received: by 2002:a05:6102:38ca:b0:79e:caaf:de9 with SMTP id
 ada2fe7eead31-7a02acc855amr1205112137.6.1789535548385; Tue, 15 Sep 2026
 22:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
In-Reply-To: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 23:12:17 -0600
X-Gm-Features: AcwNN1UNecxTndtUibx9ggVDgut-WAi8ElAvEyyyzRhfanBmsu20NosAEZK33OI
Message-ID: <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: wens@kernel.org
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:56=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-sil=
va.org> wrote:
> >
> > This series adds support for the secondary Ethernet MAC controller (EMA=
C1)
> > and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> > Allwinner H616 and H618 SoCs.
> >
> > The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typical=
ly
> > used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> > connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> > dedicated clock control register in the syscon register space, which is
> > accessed via an offset index in the DT syscon property.
> >
> > The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Etherne=
t
> > PHY communicating over MDIO at address 16 + phy_addr. It requires
> > retrieving factory bandgap calibration data from the SID nvmem controll=
er,
> > managing internal power rails and clocks, and optimizing transceiver si=
gnal
> > parameters.
>
> There is already a series from James covering the same thing. Please chec=
k
> the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplica=
te
> work and subjecting the maintainers to the same discussions again.

See:
https://git.kernel.org/netdev/net-next/c/783f6f1fdcd5
https://git.kernel.org/netdev/net-next/c/6cc2fbceb49b
https://lore.kernel.org/all/20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9=
@gmail.com/

>
>
> ChenYu
>
> > To ensure reliable link establishment and MAC software reset with the
> > internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> > sun8i_dwmac_init() after the internal PHY has powered on and begun
> > clock generation.
> >
> > The series is structured as follows:
> > - Patch 1: DT binding for Allwinner AC300 EPHY.
> > - Patch 2: PHY driver for Allwinner AC300 EPHY.
> > - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> > - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
> >            internal PHY deferred reset.
> >
> > Testing:
> > - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
> >   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
> >   iperf3, NFS rootfs).
> > - Device tree bindings validated with dt_binding_check.
> > - Separate SoC and board DTS additions will be submitted via the
> >   linux-sunxi tree.
> >
> > Alastair D'Silva (4):
> >   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
> >   net: phy: Add Allwinner AC300 EPHY driver
> >   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
> >     and syscon index
> >   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
> >     internal PHY support
> >
> >  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
> >  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
> >  drivers/net/phy/Kconfig                       |   9 +
> >  drivers/net/phy/Makefile                      |   1 +
> >  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
> >  6 files changed, 486 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun=
50i-h618-ac300-ephy.yaml
> >  create mode 100644 drivers/net/phy/ac300-phy.c
> >
> > --
> > 2.53.0
> >
