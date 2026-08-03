Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2044334B5
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782723; cv=pass; b=XYbaJiclGIPaqInHC/tbScemqoPY2Mml69wSDaR2MrJw9HiaPZVvFV8AJTkZEf0KCKHJnVyLzKtNGbWbHnUJJL3YNE6d+sCSwVY/nTKMWCpIfB1AVeejkxFr9O/pgoSQdoZVaE2hVC6FoQIEWb8vFWZtwks5I555t5nLhBpkO5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782723; c=relaxed/simple;
	bh=m2f7hLEA6HUqRGyrwkI9sBkGWy9QLT2mm+A3bdgIjyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/O2Uj36rsSVdrPINoFVTHe+pfooYkb8J4t1jGa8QikU9iOk1K+RY2upMMzoCCvClL76m6niC1ehFL6KEAhUo1tvaS97oqYoRLGiUXteXhnN/iFB3WWUFIOyJLeqYKzdt4ZAu2CG0sPXmFF1TtnQ8s6FFmIEySDjZPBoNZLiokk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyIkfyx5; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyIkfyx5"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so2142198e0c.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 11:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785782720; cv=none;
        d=google.com; s=arc-20260327;
        b=G+/yxuMX/IEhE4PfvyFyS7fv2G67jKdguO8+g/siNA5hjKGvzKhqgJLriNe9lU7MtC
         55QCPQsrm+o/G7i/xpr3obYE6l9O+nrrw/60s3OI9/IBwnNDXIE82WXlaw1HomVFR97H
         PsJ2j2lMd8UjiIKmRnZ22onvtj/q8JAXEyJVCIwqRT3stI1xiq4W3a3MaScNimsVCBYH
         WIyyavE+r/dDCdoE07FOYqc1q1Grke8XWZRwFE1Q5Rps+1xIxlcMzcPk0IGA3jzmkjIn
         5zvh+rcBnzNOBaZDZSLufgZWgfGfU8Xp9LNbeeGDFQFO/RRevNIYZQWJ2bTTEkc7Iaq1
         T76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        fh=r73FPp+eFXE1PTFFZYA6onsIZfj21AA0GEDk6h39fTY=;
        b=mDfAGkS7K3e/dVCbho1qsqvdw2iCOr1XbTpp3gm6rGFgEYOPXRCaZbRpzz+6QdUCF7
         yzrZOUEsEPUYJu2+lRCNUt7DcuBMNoK5l69BVNM+NSD6rHbYKNSd2YoXgHSJbKczpVbK
         yrfSW2ki/IPrLt1Sxl/R2Ut1jsJyvnCg9B41eBysp50toooS5/+wCK+5Y32YBbICIZp9
         jZNI/7L4pQbckG5NzneoXG2bbCjlRXwj1gwkRecS5Su4biz9aXBMF61gxFNHl4YHiibB
         RFSigi1ywSdcwErJeCvNAFZqJmpLMZrHQdqd/ueKk9hjBm9wOT9WERaRazgayK3Qi0Kx
         /qMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782720; x=1786387520; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        b=DyIkfyx55kJsKKFt7rsLN6kZYRmOQTLrYfCpaDFK4Tll1yvh0eQAs8OCZDBBFnuyu/
         O9uPAMJPpFeR7MgU0vlQHWIJRdfoPJxBKT0unfPEBafxDAGfIuKIEvdrNf0v7rOTafdT
         KSVJ5gD69fZpykfHJ68kJA8pMfg43crBYasDaRp0YAxEzTYmJ/d8WY4ltEwthE7vYrBE
         /bLQ6WD+njmIUuuXYMnxnQnd4thmdcp7asU6Vpw9DJdySm1+OOdhrWCd/0KwLFmUjxC+
         LmgCozuZaYzLGYZaeQQ/jOZzMDpvPFLVUM2pMj8lLIg2Dtsaj3YrwG3Ht22nJ5aHsG71
         kInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782720; x=1786387520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhCHZs/g7TB5oMS7PG09o+GsecOnKpnv54KT75DfOGo=;
        b=CGjLZAhCGbtLikckfwY2bCpBv+iCTQWj25jzQxYzlEyXjv7qbtUPQTa65BAhTDsxvp
         cP+UiEMA2F3ulWNFnquvxSQjlaMXgsABQDW2w/j5HnQ2fhIAZF74IfhYJ18gDOril/Hb
         8QKZBEfkV0fORroqNJ9PeIzqi9koLbdL0F0g0HF4zh/V+VCgABuUOcynGZRkPxstdyHi
         xSlQG6i+xi8IAJD2c2POOmqhJp2IGbJnFun5M2RsMxx3lwLBJRvkaBQ6yGgfHMMEtS+p
         FVUg/XG9mWgCSHQrkrcitm3/DCz7yfMobNCU+wFMEuegFEIqdtXx9+pdGbLX/t3MQ+be
         CnWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVQJtoXK1Wz7Vi3AG1SIv/5fxf5kqiPLG5KgtBna4ryG/AoXdfiZ0scCwQEs2B4uH9n7TySM9oGtX0yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVYBQnr4focnLm8Of0mEGKtMNlxvkhUEP1AgicXz81SRDUjHIi
	9nyGKuz7fWrNjin6zpiquMQeiIIBnKwGZfzeHmi07XZYbdJ4DXzAblo1Q33k6JjoiZGjIJ3pH1Q
	3o2Aerj1h+o6lrwKOGw/fxJOmxgWcDNU=
X-Gm-Gg: AR+sD13GEB9eVuTuc2PgI0udZn2zRgpwB1KK4d8cebuyNeM7NgLANFVdS+/iq/TLmep
	wO6l3cVX0uOELFjfXpIonKfmUU9wOLM7a8A9iDfvoUgWzNnHunEFM9DO5XiOdnrXYqzD/qULQ5S
	GecP67wtIo+gAJXnBPIVm3ZU+vumf7iL6fO+4wE3WBnfAoyLL/jR6YYFkYIkGHfWbwiSJ7Dgqty
	o8TYQIqiJvQzHkTRmqdmyCG2Sp/00MrfEFGCJsKdF7r/iIDOWfoqnGkyYIOSng0ZZhCW82sU1eK
	QEvRDqyLuILvYYWQUJ20sfPh/4oL+NnebNOQ5v3zV8yWNtsM6fzehfWFj/0t+GspfhuEclcKjAr
	uuejXVrcRr/EP8u+XC0YQsh+t5B2NbQ3Nf1Bgmg0hHJVlfuH+gujTAjvSHZfjI1OxiezQLHLZdE
	6S+a0XqkWQJU1GXtUD+FhLUBX80xY0Px96mzEa
X-Received: by 2002:a05:6102:fa5:b0:74a:b492:3a62 with SMTP id
 ada2fe7eead31-75b21e6b74emr8853495137.4.1785782720194; Mon, 03 Aug 2026
 11:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch>
In-Reply-To: <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:45:07 -0600
X-Gm-Features: AUfX_mxrC1O9cxNBLhvxxOGulQcP38PJEIX9XeOzWBEdBf_aYCt8UZQ5evY-RxY
Message-ID: <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
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

On Mon, Aug 3, 2026 at 11:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 03, 2026 at 10:09:01AM -0600, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > > +static int
> > > > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > > > +                            unsigned long outputs)
> > > > +{
> > > > +}
> > >
> > > > +static int
> > > > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control=
,
> > > > +                             bool active_low)
> > > > +{
> > > > +}
> > >
> > > I've not looked into the details, but these look like pinmux. Does
> > > this I2C device have a GPIO controller? Can these pins be used for
> > > other things than LEDs? Maybe you should be implementing a GPIO and
> > > pinmux driver. The Ethernet PHY driver can then just select the
> > > correct pinmux configuration.
> >
> > These do not appear to be GPIO or muxable pins. The AC200
> > documentation describes them as three dedicated EPHY LED
> > outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
> > enable those output pads, while EPHY_CTL provides their shared
> > polarity setting. I have not found any documented GPIO data
> > registers or alternative functions for these pins.
>
> So what i'm trying to do with both of these is make it look more like
> standard Linux building blocks.
>
> If that is not possible, i would actually put all this code into the
> PHY driver. You then have a regmap property to gain access to the I2C
> registers.

I understand the goal of using standard Linux building blocks where they
fit, but I do not think folding these control paths into the common PHY
driver gives the right device model here.

The AC200 and AC300 expose the same Clause 22 PHY interface, but their
control functions are separate devices with different transports and
lifetimes. The AC200 control function is an MFD child accessed through
the parent I2C regmap. The AC300 control function is a separately
addressed non-PHY MDIO device. A regmap reference only describes the
AC200 transport; it does not represent the AC300 control device.

Folding both implementations into the common PHY driver would make that
driver manage AC200 MFD registers and resources as well as an AC300 MDIO
control endpoint. That would mix the package-specific control transports
with the otherwise common Clause 22 implementation.

The current split uses standard subsystems wherever they provide a
matching abstraction: MFD, regmap, MDIO devices, clocks, regulators,
NVMEM, device links, and the PHY LED framework. The narrow private
interface covers only the compound operation which those frameworks
cannot express: calibrating, addressing, configuring, and sequencing the
package control block before the Clause 22 interface becomes usable.

The link address is an important example. It is defined once by
phydev->mdio.addr. AC200 must program that value through its I2C control
interface, while AC300 must validate it against the address of its MDIO
control endpoint. Generic PHY operations do not carry a consumer MDIO
address. Encoding it in a phys specifier or control-node property would
duplicate the PHY node's reg value. Giving the common PHY driver a raw
regmap avoids passing the address only by moving the provider-specific
implementation across the driver boundary.

The LED pad-enable and polarity bits are similarly part of the package
control function. They control dedicated EPHY outputs rather than GPIOs
or muxable pins. The common PHY driver still owns the PHY LED semantics,
while the selected control driver performs the package-specific register
access.

For those reasons, I think keeping the transport-specific control drivers
and the common Clause 22 PHY driver separate is the cleaner division.

>
>        Andrew
>
