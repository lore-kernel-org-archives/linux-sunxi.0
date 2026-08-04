Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAEE27F017
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818284; cv=pass; b=SV/xMpUt2CNMOChYzFJIo4fQdWpxu0q/RqO1hUHqVl9tpVrENMLt2zCChVlCFxlHxwQvX1j4dSkjrwB3ELYFhVonGStMI8wvLpJ0S6fg2Vzx3NDoqIeekeHoGer7A5VDWTsqIU+YODKJ/TkD+F5VjFRdQoZpb4Q5s5Dg5+x1bg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818284; c=relaxed/simple;
	bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6v19ZryoZnqJdbO0S+Mx+dXO7FskSo5RXJzVVNldt/gPXgRp8zj6HUL1Z36btJPErkSe0uAJ7FPBG40c/35P5O40WzZz7AkXq+7cKeF24OBu2QIi684AIryGZAHA9TMI7KtYDs1g/SxBHhH/lsX/Z7B+ZT+IU8GM4nMxqNrjHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp3SYlrk; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp3SYlrk"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9673385b1efso1434950241.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 21:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785818282; cv=none;
        d=google.com; s=arc-20260327;
        b=B2QUU8uhtOcS2yAy4HB9nmaZQvoh7Q8zRYFQyHIOJg6xdPD2Y1JWPii7EWAdZk2nxH
         N2qnAnbrX70pgV2nHVHD517Yd+J0AGJJojRVCUMYWH8dr3RoU1kF3wugRo3cnNFjapti
         eWg+Bs0GEDqNevL12fayE5rNS64tafWsXPMoTINSZWKRbGytbNVirYvT+4Cq7HwG2nCI
         R6A/a80NRtTcAK1xQv1Eafv5SGhAx32HL3ie0XH5hcW0QrIYi429V3blXZhmERnoZnL5
         6xrrT/yFvM9sYfPo+ZOfQooABiBvW2F2JqGVRZKphSMkKlDUvUuJr/fi6CUUHir/CmqJ
         w2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        fh=WtXS+wInQ/QSVS/Z/xRfvSFZQa+jHeQh/rHXCgC9qa8=;
        b=MfHSszPQpc/XCuERyetIgk4y0mUtjOw38G1koVN1CMT0S3zcNVGkumevw1srROIjaJ
         7yTPAzj7er0Uf8bqqv3s4dqGYznYE4/US6Epexwu7f08eOzfg5FuH3/6YhDEaJCJZmMh
         JmjmXgHgym+S1SaJ16diXO5SgjrU6r3BRWLpYYj7ZDW1zmASnE54+7G0lOfcIv8SfjHx
         MtSbEaT0FZQE0SOt9AAmuq2RgVGbG01ed+E6NO1rWD25MEyJO4b8F2rg0Y77g9xoRVns
         a+XZpHsrtUH0TilMBsAAX8onI2E4TslEazWrzeVzZTh697kkjvrw61pQHWdmhvAubXp6
         Uc8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785818282; x=1786423082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=Zp3SYlrkLg6iX4rFr4rjNZ92sRjxketuMKPE57wOOCgpRb2uaSspU9Dol2BvoSyvy9
         FUlv2Ln/Gy7Hy+MgFwiGjxFoAvReu934U7juUJQeo5ZRCChYhu8edyAhY5Jb5B2uhmKk
         zejHop8P/ITyZZHMdqSdncvZtyyNxsu66lUmQYkVxDbJRpRop4VGKeEzkD4XyfOYR2hP
         amo0aGNq9xOVDnMfRjO5xozT8Kt4CqERzxNLe3XQhuwWKd4OR1rHwW0ow3wWziEpchcN
         0CbD3LVf1uiU9gQe7UY/VjbFBHJlRJ6KWfHstI25J6rFjbcwxnZu8Y9Tu8zmdxj3ibLF
         9bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785818282; x=1786423082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=IrKMLSYxIsnsjdrkcTv6YCSssv2p0AA5p7mov1YM8XnMSsyvF5xwhIUzow1j/SHs0u
         9ypmUkqg+ikxsTMVBhmCyzX2xWPz2N0jAAxwXq3R+zdd0+8GWHXCGAtfapNfm5VR7hog
         0RoiIZOMG7JdQh2eHkl45ElTrznfLoYyTAjc9kShSCF6RPYadRNVsOykYGM2Aed/50+r
         4T91BNbwt5r3Rham9SIQcpUwP0QIJsXEs0DJ6TZ7sIcXSJhQUqzCnKMPQDV4XJm3qBPD
         7vkc2Vwnt51ODkN0FIQjVioIndfcwHGppOSarVXWNIAJOaaZ9DFmslCKHiWsoco64aWP
         8NuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLPx/oyM/COLnVvGS6eiN/zJxG34QhR4dA4j4sR34unJP7b5XdoR6muSOit2O/26xpR+wUuyPX9/BHgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRkXuxOD6GQHEEXjq9+Bi8kfi1wopxj5So3kpWlHNvzuhc0SA0
	azH7+/aZ3xeQjmtnyxzlFZaVhxwMBZa2j19OIJBNy6tg0WzbtTJJ4Q+42OeV0o6+WXKlpsNXkaL
	7C3jyRluqpCmjCxbCogY5OCCQ0t5GREw=
X-Gm-Gg: AR+sD129myAT/xMEZ437wzomHPPx355sm9BvT8dCJrqwFFi0UI7WvXMTDfKwpBMncvv
	WeKCRgpBMdonDs5O4kCQoemLBkvbDYx8foBvZ6E0tU35C244O9e5kspGgbeYhAbzreGX5MXGdCD
	/+v7GukhXU0WovX9eROD7dIuq7xvf8nkFs/HUe83UUBMhlJaAHAHHtfsAfjmus2/9gwks0QfkoI
	b+lmZLBA59gaKt9g1F1JNpfN7NSxcpeExh3zGLBfbl4yqCob41KlSGSy2nyWvQnlGKTOi1Iq1oA
	XXoK0gd9TfgXQeLhDEZyXRAsGMQo7bgVCHKW94XrHPSz7f5XmIMuayBjRTl5c8eAd+sWfShugTh
	0pmNL5MvGZikW2J8GBTmNWLrbf5DSZOXpbPNmwhMnMLLpwFIYAaFh/3X2PwYzWzswzOHaydsbLl
	c1rM0tvP8jHRWLuIYTw6v3IYT6d8cC/CbllJ0GmE1+kt0y9BDY
X-Received: by 2002:a05:6102:1492:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-75b2226b36dmr8916982137.7.1785818282020; Mon, 03 Aug 2026
 21:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
In-Reply-To: <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:37:51 -0600
X-Gm-Features: AUfX_my4YsBDZd6K0e5M7YLW68aLI1B4Ub2Wc8OS8k7km2q52f4ciX_OEuUghsE
Message-ID: <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > So what i'm trying to do with both of these is make it look more like
> > > standard Linux building blocks.
> > >
> > > If that is not possible, i would actually put all this code into the
> > > PHY driver. You then have a regmap property to gain access to the I2C
> > > registers.
> >
> > I understand the goal of using standard Linux building blocks where the=
y
> > fit, but I do not think folding these control paths into the common PHY
> > driver gives the right device model here.
> >
> > The AC200 and AC300 expose the same Clause 22 PHY interface, but their
> > control functions are separate devices with different transports and
> > lifetimes. The AC200 control function is an MFD child accessed through
> > the parent I2C regmap. The AC300 control function is a separately
> > addressed non-PHY MDIO device. A regmap reference only describes the
> > AC200 transport; it does not represent the AC300 control device.
> >
> > Folding both implementations into the common PHY driver would make that
> > driver manage AC200 MFD registers and resources as well as an AC300 MDI=
O
> > control endpoint. That would mix the package-specific control transport=
s
> > with the otherwise common Clause 22 implementation.
>
> Given how messy this hardware is, i doubt it is discoverable. We have
> been pushing back on hacks to enable various things before probe in
> order to make it discoverable. So you are going to end up putting IDs
> in DT so that the driver probes without it being discovered. That
> means you can put any ID you want in DT, and the driver. So you have
> two different phy driver structs, two different probe functions, etc.

I agree that the link PHY cannot be identified by reading its
registers before the package control sequence has run. I do not agree
that this means an arbitrary ID should be placed in DT, though.

The Ethernet PHY binding explicitly defines
ethernet-phy-idAAAA.BBBB as the correct contents of the PHY identifier
registers. It also documents using that compatible when clocks,
resets, supplies, or another initialization sequence must be applied
before those registers can be read. That is exactly our situation, so
ethernet-phy-id0044.1400 lets phylib create the phy_device without an
initial MDIO read. Once the selected control provider has powered the
hardware, the driver can read MII_PHYSID1 and MII_PHYSID2 and validate
that ID.

Both AC200 and AC300 expose the same link-side PHY ID and register
layout. The package choice changes how that PHY is initialized, not
the identity of the link PHY itself. Inventing separate IDs would turn
the compatible into a Linux driver selector and would describe values
which the hardware never reports.

The package variant is discoverable independently through the SID
configuration field. Fixed boards can reference one control provider,
while boards shipped with either package can use SID to select between
the AC200 I2C control provider and the AC300 MDIO control provider.

For that reason, I do not think two phy_driver structures and two PHY
probe functions model the hardware correctly. There is one common
link PHY, so its Clause 22 implementation should remain in one PHY
driver. The two different implementations belong at the control
endpoints, where AC200 and AC300 genuinely differ in transport,
resources, and lifetime.
