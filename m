Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A9403AF0
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868204; cv=pass; b=t1CNXI/waK9m4UzKPIfyyQh+CbtwNTtTOwsPgMtqTnAjenISfSfJvZ7aN9pIxPiaqVrOW33EH/OkdMZIq55447PgA7wjoU+cxcZeBkFCHpj6L3IHuGSPOf2JuuiX+MZogo5t/zWvnwA7zYS0Y3SYd8tgveRlwFS1zcBRXyAvQlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868204; c=relaxed/simple;
	bh=cC0/SUwgh/iM/U989GK5z2lIE7AM6Rp75gg0MnZRECY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eysZroxWpOuFr37Db0230DTuCX+AMZXlVpsJ3XVOUlQq7GFzhMauITN4qGhRLH6YdQpaFImiOmNnGs1+mco0TXBwzU6tqhvaaVE/f8a3pkB5JsVYAisNqOWiAJXHQeTSl6cCInsgDAzwwumZufxx5v29bD4io4nQgoSUln4WNC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liaEIPa/; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liaEIPa/"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74d55dac06dso20922137.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 11:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785868201; cv=none;
        d=google.com; s=arc-20260327;
        b=NOJgOV6/mxbLvrk6bFGYLWe/+lNBYtiB4aj+CzLU34p7l1UfWOnIwiczpt3k79gifM
         67o1ox7o+92F+Tlj6pAfWGZCkiJ9d0DxQ8Aqo2iY8qTTWfqbOGzXvIf0UEd1URsNny7x
         ibzW6DM2tvNsrF19PqKcDDgoth4pnR+tN14NWUMc3p8R6+fBY1ftP3DbFWx87l4KQnr7
         LNm3xISUTWczuv9Vk6kos/SoMdi09a7YJv84fK2sMu/1AHrv6/24yhKoyJ+piDhTvv6z
         1zXot0jcBh2nE3AWrEgWX0krlQ7xZscnh/ctGprRwzJ50RiF57X2R2ewvKZbg/p4ud1T
         f0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        fh=cXfPJHmrsEi0T3m+4BadYt8odeU3RkBuNwC34OI7ct8=;
        b=ljisMeRu4HXCt28T24kS4nrvASuIHfld73lpZiciP6YqBESC2DtB+RrSQ0xshzvpnQ
         enio93Y7pMPvwGxhgn8Dnb8wS+Ga0T0u9KCNhhWWWkv6QLjZb4EyxKbLCYuOHMxIyfl3
         4w5tK6td3DjR4IPM3a0AnCeEYJNCUHLmxfeUs6DqT9PVmpKMoA2SrrRDN00Dawbo83JM
         qwfZA08U4HW2FwzeoB7abvoYxRquKimVQc8x+UYiSm6YhS5QnQreBPMNC/8kSTktovKJ
         VNxQHyVhOBIY7/sxZkKBSbQejb2aEAHkpL4pwpbHWFkzIjvXd0y5KnJYkUVfMJeNJmxE
         pJHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868201; x=1786473001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        b=liaEIPa/1fkofAj4+CZFQYrjgcWfL9EinO3u4h1rbt+YHc/Xc26gAb/OEszSH3i5hO
         diwluuL+jyEWe81QHfybVu9WFLsFkoKs+kyK4Io6ANKrnwfiHNe41ADDExRJMLrEk2mu
         UqCk7F2fdZguTjJhbX8GDVVY5kWr1CqzA4HHPIIx4C9UyCBujiAgDcbROIXsK6P7iZlE
         HvVAhilQ45yoYI/RcEND6CK5e/mcYokm0ofc9/lMXxWfzc6AXVRzB3MiQ6b2xT14IKTV
         iF2Km5aKI7VqHsl1e7uFcPW8DcD+UQYqXGbvPVQylZeZUEX4TU9zMrFWifgYg7PKB7rX
         ioHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868201; x=1786473001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Eo5XMI33rsANiXMc677tWslAYQ4Uqg6+HGv1+1GEcY=;
        b=SEvVE0WwTUondXkrOokeUY9YRjHD4cxvhxr/fQGC8GaoHA6RPOzGs49ZQnK1ss7VpK
         f8LSxp68PhC0bhk3UI9/+NCgvMXxYBM+I1ZCyIoDzoFSfkSKH6OdZ7ensnYBHqujsHsi
         XKG261zvdyWTvJhx3DQjUmNfGVXIxdyjB8M4LLVtgrtAMtEInXJSbul/VUgHHcBwNa7L
         tGFlpiD4FFJS16beUKSTaNZi9HfyFZiHX7DuFFMtucfvtCn0GpKKzp9k7O+4jJ1pOTcF
         dI+NEf/PRfJzmjyUzFDITgX2Ttdzq59cCqbUY8ogeMUyNge1GawxZFOO76Tu+qKzgMdI
         cLdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpftZusHCUHirTgf9mOswML4MQ5Xsb59EoosSnZ3KRmPBBD8tfxd6MqVjg+fjUUhNoo7E9ABrbvqVgB6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT1FFMLaZHIPOee4d7hIZrj/NckfRchbBEV2he2yZsvqidXzVV
	ZL9hMWu5V2qviizxHYQL251dlmuT/2O8wHenhz2rYUGj8t9t56exsraOU/v+C+Ibh6mgHFnXHWK
	Ik2FHdK2t/GK7ZvhsMJXNd5JGUz2gCjY=
X-Gm-Gg: AR+sD11FMjSCYxB18yTtNZxA2Kca6BNSMZ08nX0eA1DVpW4rvttEWq93H7P6+rMkG5W
	hpzdw714R+V8Y58/t3RGpCRIW61T1F7hz+ETAF2PfxMIUUBdC0sP5Oexs4YMxXzfuy5Wxvd4Tpg
	XYBXBt6D68OHZ/72sHN2+kSpsHz++OLvGU7Cc+kuglkq7HDYjkJTCgrnADezdoyBnO6ykjyNA0Z
	vRb9YV4waByR5nVL+3BdoC7wqVFH7f8jMgrO9PrT2O8pEsz5SRo/LP8V6wxFhOPPL+AcfS+TrtZ
	UWsnYXsvDnGpUsnBZD3Ve978iQVRs27WiqOzbBW9lWlhHO87BatMfquHI8foeD2JUpWkI2BOwuv
	gJrAqNTXruJ2xiNKSauPkMmaowg3cAy5DYKp41cbskw88IbsAmref0+PTfm7cC+/iVHO02HkO+F
	iOLYfIlqiDNIHp3rMtk0IEkRf4RKn64bIHKQQj
X-Received: by 2002:a05:6102:6892:b0:740:2974:1b19 with SMTP id
 ada2fe7eead31-760e81ffa54mr232158137.4.1785868200546; Tue, 04 Aug 2026
 11:30:00 -0700 (PDT)
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
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch> <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
 <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch> <CADvTj4qmXWbDsc-vigcSrF1N=zpxmZWGp3YaZ9PFcWK551h3mg@mail.gmail.com>
 <fb6f8065-a655-4d53-acfb-8171b2e003dc@lunn.ch>
In-Reply-To: <fb6f8065-a655-4d53-acfb-8171b2e003dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 12:29:48 -0600
X-Gm-Features: AUfX_myhAv4fr3OX-v7_1toN9rBz9cnAh8mnRXYrH0R-kOg3uw2jZVSUuGWjruc
Message-ID: <CADvTj4pdZN4Jmx0D4Yh0KDPkh_-zJ5iXCM=vUybGn0aFAAqAgg@mail.gmail.com>
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

On Tue, Aug 4, 2026 at 12:04=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > No they don't. There are extra registers in different address domains=
.
> >
> > The block diagrams make the distinction clearer. Both diagrams depict
> > an EPHY block with the same internal organization: MII/RMII, auto
> > negotiation, auto-MDIX, 10/100 TX and RX PCS/PMA blocks, LED logic,
> > clock/reset, PLL and EPHY AFE.
>
> The block diagram is a vendor diagram, the vendor can draw whatever
> diagram they want. What does the Mainline Linux networking block
> diagram look like?

I agree that a vendor block diagram is not normative for the Linux
device model. I cited it as corroborating evidence, not as the sole
basis for the design.

The stronger evidence is the observable interface: after the required
control sequence, both link endpoints report PHY ID 0x00441400 and
provide the same link-side paged registers and behavior. The additional
registers are not extra registers at that Clause 22 endpoint. AC200
exposes the corresponding package controls through its MFD regmap,
whereas AC300 exposes them through a separately addressed non-PHY MDIO
device.

The Linux device model follows those addressable devices and their
dependencies rather than treating a physical package as one indivisible
driver. I think the relevant Linux diagram is:

                         MAC / phylink
                               |
                               | MDIO
                               v
                    +-----------------------+
                    | link phy_device       |
                    | common ACx00 PHY      |
                    | driver                |
                    +-----------+-----------+
                                |
                                | required control provider
                                |
                         one of:
                    +-----------+-----------+
                    |                       |
          +---------v----------+  +---------v----------+
          | AC200 MFD child    |  | AC300 mdio_device |
          | TWI/RSB regmap     |  | control address   |
          +--------------------+  +--------------------+

For AC200, the surrounding MFD topology is additionally:

                    +----------------------+
          TWI/RSB ->| AC200 MFD core       |
                    +----------+-----------+
                               |
                 +-------------+-------------+----------+
                 |             |             |          |
              EPHY ctl       audio          RTC        TVE

Only the selected EPHY control provider is connected to the link
phy_device. With a fixed AC200 or AC300 description, that topology is
entirely static and does not require CONFIG_OF_DYNAMIC.

The common PHY driver already drives the PHY in the phylib sense: it
owns the link-side reset and initialization, auto-negotiation, link
status, MDI/MDI-X, analog tuning, interrupts, statistics, EEE, LEDs,
Wake-on-LAN and suspend/resume behavior. The provider owns only the
package-specific operation needed to make that MDIO endpoint usable
through the bus which actually exposes the relevant registers.

This is similar to other places in mainline where EPHY clocks, resets,
power and address selection are outside the link-PHY driver, including
dwmac-sun8i and dwmac-rk. It is also consistent with the general MFD
model, where a function driver accesses its portion of a parent regmap
without taking ownership of the entire multifunction device.

CONFIG_OF_DYNAMIC is not what motivates this split. It is only an
optional way to select which of the two provider devices exists on a
dual-source system. If runtime selection were removed and the
bootloader always selected the package, the Linux diagram above would
remain the same.

> O.K. I've somewhat had enough of this discussion.
>
> For the Networking parts: NACK
>
> To get that revoked, make the PHY driver drive the PHY.

I am not clear which concrete ownership problem in the diagram above
is resolved by moving the provider implementations into the link-PHY
driver.

The link-PHY driver already drives all common link-PHY functionality.
Making it directly access the other control devices would instead make
one driver bound to one MDIO address also operate:

- an AC200 MFD child and its parent regmap on fixed AC200 systems; or
- another mdio_device at a different address on fixed AC300 systems.

That does not remove either device. It bypasses their normal bus
ownership and combines different device lifetimes inside the driver
bound to the link endpoint.

It is especially problematic for AC200 because the AC200 is an MFD, not
an Ethernet PHY. Its parent clock, supplies, interrupt controller,
regmap and global state can be shared by audio, RTC and TVE children.
The link-PHY driver should not assume ownership of that parent or
perform operations which may affect its sibling functions.

If the objection is specifically to the private provider interface, I
am open to discussing whether some operations can instead use existing
clock, reset, power-sequencing or generic-PHY abstractions. That would
still leave the AC200 MFD child and AC300 MDIO control device as
separately owned devices, however.

Likewise, if the objection is specifically to the MDIO OF_DYNAMIC
changes, those can be reviewed or narrowed independently. Rejecting
runtime DT selection would mean that firmware must resolve dual-source
systems. It would not remove the justification for separate AC200 and
AC300 control drivers on fixed systems or justify duplicating their
common link-PHY implementation.

> Hide away as much of this bad networking design in the bootloader.

The bootloader can identify the package, perform the initial power-up
sequence and enable the selected provider node. That is fully compatible
with this model, but it cannot replace the Linux control path.

Linux still needs to reapply the package configuration after PHY reset,
system suspend, provider power loss or driver reprobe. It also needs to
coordinate Wake-on-LAN, interrupts, LEDs and power management with the
selected control device. Relying on undocumented bootloader state for
those operations would make the driver less self-contained and more
fragile.

Even when the bootloader resolves the variant, Linux still sees either
an AC200 MFD control function or an AC300 MDIO control endpoint plus the
common link PHY. The bootloader can select the left or right branch in
the diagram; it cannot make those devices become registers of the link
phy_device.

Again, this remains true with CONFIG_OF_DYNAMIC disabled. Dynamic OF
handling only allows Linux to make the same deterministic selection
from SID when firmware has not already done so.

> You are free to continue working on the MFD and other parts which are
> not networking, because i'm not a Maintainer there.

I can separate the MFD, fixed AC200 networking, fixed AC300 networking
and optional runtime-selection work so that each part can be reviewed
on its own merits.

However, the MFD and networking portions necessarily meet at the AC200
EPHY function. I do not think the correct way to avoid that
cross-subsystem dependency is to make a driver bound to an MDIO
phy_device take ownership of registers and resources belonging to an
MFD device.

I would therefore like clarification on whether the NACK is against:

- the common link-PHY implementation;
- the existence of separately bound control devices;
- the private interface between the PHY and those devices; or
- only the optional CONFIG_OF_DYNAMIC selection mechanism.

Those are independent design choices. In particular, removing
CONFIG_OF_DYNAMIC does not collapse the fixed AC200 MFD child or fixed
AC300 MDIO control endpoint into the link phy_device.

>     Andrew
