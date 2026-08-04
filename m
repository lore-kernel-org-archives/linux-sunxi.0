Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379B33C192
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817938; cv=pass; b=iDf/Eklnoz/sqoZVjBR19dTGSzAcIgvlW5/LCGMBvZ3c9WK8W5eLA9Uk4CgskpA07maKdkCI3o7+ixqCvuS734EydSEIwaYkvrsIOK7tS0N1YDHx96+eaI5NbhznZFCzNNX7S0IJKyK5fqB61GQbNjWFXrwhIKsGo/osbINphgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817938; c=relaxed/simple;
	bh=GiIFhUl7eFI3+MXUktDiqoIE9NJ1C/ZSCqWdRAOmTaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ct0fjaTTm8JVjW8d/cQbPxJi0CUYBSyimyqLg3+k4OLnT1tRWSAReMvLks8KZ74mp9a6VVJhWJOuBsN1Uk1tdq8T25gIFkxqBBB4n8gYwNkhD80xBxHsGdGXg+L3nznTQgaAdio9VSp34fYr8HdD6wgbQkkW+kh24S/s7qASrbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yy3v2cJ4; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yy3v2cJ4"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf9466867cso1241699e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 21:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785817935; cv=none;
        d=google.com; s=arc-20260327;
        b=eK75PBNdbKkzru/NJYwo8hxYZt8cTiX/v/9TXzCk3WKMfj2kwQs3I5aduJpW5TTbi5
         tQHeKxAbttVkmTZgUoLJ3BoEoU2Syd9iCyvGdHWXqW1jQHiqpA3EqR6XOrAYeqE0LwNK
         4AtcbKWT6tRDS5sxUq3Qu4GjE5VbfyZ+Qk3iGRuYr1xXCHlTYIKkZiHxhEUzYVjvlAxz
         OPIjXb5y5DN8NUSKrLY176j0DMTLRG2mP7AG0Auq4/jGwy6yEYBJ1M/m4KrpvbEgS3z0
         8gMwaZrstUU29OjbAdH8rJap6GYVEhvsVSuWq7nt/ce+ftxyvOvzyVjkjrbgAppfp4ZD
         3+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        fh=f6jv17N5QMBO+BVUWPG94ndXfGOrBoBokTcg5zrd8VQ=;
        b=NLnm2i1i8DoPgcKxgWK1ocyg6nKNB1/vmx/U0MaLP6uw501c8CgJsH8ykqC5iJ3Hm1
         M4P/x/GRy8NBxHpV1+/0WnzHot3HxkX07hCV/aluNt6xVb8q9b0XAqjeLNwn4QMdi5HT
         AdNFQPOjC3m1LFiBYpnsMmdp0OU2TzHCSTAlmJH7PwrLp8Dsu60sgBsU9fpu3eNIpshi
         piEVN5jJT9d2Btz33kKeuWPldwmAcYGoEOMcOK6z+mlaW1nip1lT8Ft+ZdUNlFANvf8I
         F9AwdF+pF0wwjjDrkR1mb3rMQTIJM1m9TtZKkvNzQIHXrhZF/tQ17iIZx9xpXNp9yZ8D
         YWuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817935; x=1786422735; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=Yy3v2cJ4ndutbQsyUR5geLP0nbnWE2Mna/PeCbH4QVMdr66rnjtk0AJEqknkD0yGl9
         WFwMOcS4Myi/TpnVtJfhA00Uzn2AhaYExDPc3apUcO1tcVHheUYWHQOvCHN+zr1fHmQs
         HaXlczIeWvvJBOPgcbzp/jKoo3w+NWkXZP09hVJTGHQ/5qVSzLhw5Uu/EOGimOA5hfzR
         Yh5SqAsPPoGqbiPUWfXO6UarXjym1H8BSuFA+IvYYa+EDRCe7qYXv3cBDsbxgXLcf3KD
         FMQyQMAUPpgsKGKJssdGiCa4LSegBKvMP3IcolAAd5JwY+6ijaNezFIs8VDv0U3GWuAr
         4c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817935; x=1786422735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUfG70xuwTFgcp+8i3Kan+grkhw/1qDG9gV+zT/fD6Q=;
        b=RgmaGEc9KeKQAy//ERZUk1C9lMH/HO7wUgoVB+10dyw+Z3NW66S3gV5JSmwdJV2HrL
         jYshJm4DG8qq6/hO5T89lKNnc+1FcUR1vYpu5i82NLDiLdDhhuP6grKY60MuWjjLkNDz
         3Waeiyu3wsJQ7YzhvGvq7SdmA6OHoFD3j+T1E5EVkUWw45RrRwbe2Hy1PV2tD22KOy+e
         vxSpecJRiu/S3pPF7JJKD5/UHcFytmaTDsqC9XsP4hty6T7btAqk1QWdrllvtk1ZOw6G
         cNxBobKVuKJ5dfRc7/CeNFeGfLSnJnkbFLtYq5NWzu77NpbG2pOjbUCdwUi+PxJnNf/k
         Ad5g==
X-Forwarded-Encrypted: i=1; AHgh+RrI1RELuE5OkDrTAjLfA+ydyuqFmZj7YgyGPbzywg2F6FFkVp75Bex7Lj6Bd4wcmBjz/+j+VSjHL4O66g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmKkMdSTDiZsyx/SN0bs1gcSeACy3yLKNuA+toBO8JM0OgBk+R
	zLdKqz8/x1OyhGn1et5MxKh4HiqpsvOkdD21g4pN9kh4vByJ5ZokB2MA2MFDk/YtFCiyQ+lqC9U
	CbEw/KApU6SB21dbRp5PSqdsVEVkFxLM=
X-Gm-Gg: AR+sD10hkrZECGY5je1715Dt+A+JWyf37tT/CnlfSVU+LE2eSYDssWdDVH/QKlltPW/
	lVWB5QXfste+yDKJ9+8pvU1HUsEMlU34PwIWAgp0B3agZQ1J9nLwd8FQZNVOLGjCYUOj0Cd1naN
	DRl9HT9la1Y8MnFhsZtJn49PZjey03FwmGFRqNQtX453VOVTLTvIbS8R8gzvG9xxdR4R1lE/B8Y
	4iVzp8lIagWjAEN0PmfiZ/LkVS5wZcbORpQIk16xyYmShFcH8QJNTlXnMWOV54m2t9VXBigUjYH
	NHu9U2ScV3+PgG11+QruAxBnkurOS5Ff0PwKt6ItUIhZGUCjerfzVylNJiidMxdf1HmR67UAevo
	2uQ9VFGMc0UuZB7rJBjPE2lI/SXuOQftJ5Ff09FUN8ZwE//oi+k0nzUyqPM80p57+nM+RbfwEkT
	rgIV+Ka9ORqw/2qVGSn8criKaFcKw3w9h7tS0Z
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr8262959137.12.1785817935136; Mon, 03 Aug 2026
 21:32:15 -0700 (PDT)
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
 <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
In-Reply-To: <CAGb2v64U9ZQxfb7M3VfoGH60iMHL01XDy6tjs8VbFPLfyaJWgw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:32:04 -0600
X-Gm-Features: AUfX_mzUkHY4di871Z-oeEmg1mv3oYLeo3scVGxNss1cbpF1OmuFzb1N7ZoUB_U
Message-ID: <CADvTj4rCaL+Kf5C_Sd8-p5nJHxF8GR2i8oHFJd1Nz=egx9RcYg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: wens@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:07=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Aug 4, 2026 at 2:45=E2=80=AFAM James Hilliard <james.hilliard1@gm=
ail.com> wrote:
> >
> > On Mon, Aug 3, 2026 at 11:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, Aug 03, 2026 at 10:09:01AM -0600, James Hilliard wrote:
> > > > On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *cont=
rol,
> > > > > > +                            unsigned long outputs)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > > +static int
> > > > > > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *con=
trol,
> > > > > > +                             bool active_low)
> > > > > > +{
> > > > > > +}
> > > > >
> > > > > I've not looked into the details, but these look like pinmux. Doe=
s
> > > > > this I2C device have a GPIO controller? Can these pins be used fo=
r
> > > > > other things than LEDs? Maybe you should be implementing a GPIO a=
nd
> > > > > pinmux driver. The Ethernet PHY driver can then just select the
> > > > > correct pinmux configuration.
> > > >
> > > > These do not appear to be GPIO or muxable pins. The AC200
> > > > documentation describes them as three dedicated EPHY LED
> > > > outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL=
1
> > > > enable those output pads, while EPHY_CTL provides their shared
> > > > polarity setting. I have not found any documented GPIO data
> > > > registers or alternative functions for these pins.
> > >
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
> >
> > The current split uses standard subsystems wherever they provide a
> > matching abstraction: MFD, regmap, MDIO devices, clocks, regulators,
> > NVMEM, device links, and the PHY LED framework. The narrow private
> > interface covers only the compound operation which those frameworks
> > cannot express: calibrating, addressing, configuring, and sequencing th=
e
> > package control block before the Clause 22 interface becomes usable.
> >
> > The link address is an important example. It is defined once by
> > phydev->mdio.addr. AC200 must program that value through its I2C contro=
l
> > interface, while AC300 must validate it against the address of its MDIO
> > control endpoint. Generic PHY operations do not carry a consumer MDIO
> > address. Encoding it in a phys specifier or control-node property would
> > duplicate the PHY node's reg value. Giving the common PHY driver a raw
> > regmap avoids passing the address only by moving the provider-specific
> > implementation across the driver boundary.
> >
> > The LED pad-enable and polarity bits are similarly part of the package
> > control function. They control dedicated EPHY outputs rather than GPIOs
> > or muxable pins. The common PHY driver still owns the PHY LED semantics=
,
> > while the selected control driver performs the package-specific registe=
r
> > access.
> >
> > For those reasons, I think keeping the transport-specific control drive=
rs
> > and the common Clause 22 PHY driver separate is the cleaner division.
>
> I think what Andrew is saying is that you can expose the regmap from the
> MFD node, which you then reference from the PHY node with a custom phandl=
e.
>
> In the PHY driver, the first thing to do is retrieve the syscon, and if i=
t
> is not available yet, return -EPROBE_DEFER. Then you program all the bits
> you currently do, just without going through a layer of redirection.
> You can fetch the PHY address to program from the device tree. The downsi=
de
> to doing all the setup in the PHY driver is that the PHY node has to have
> the PHY ID in the compatible, as it is no longer generic. But you already
> have that.

I agree that direct regmap access would be reasonable for an
AC200-only driver, but I do not think it is a good fit for the
combined AC200/AC300 case.

The proposed phandle only models AC200. AC300 has no corresponding
MFD regmap: its control block is a separate non-PHY Clause 22
endpoint, with its own clock, regulator and sequencing requirements.
Folding everything into the link-PHY driver would therefore still
require two transport-specific implementations -- raw AC200 I2C
regmap access and raw AC300 MDIO access -- plus conditional resource
acquisition and cleanup. It would remove the function-pointer calls,
but merely replace them with AC200/AC300 branches throughout the
common driver.

This also matters for boards sharing one board identity but
containing either package, as selected by SID. Fixed boards can
reference one control provider, while variant boards can reference
both and let the common link-PHY driver select exactly one. The
selected provider then owns its transport-specific resources and
lifetime. That avoids making an MDIO PHY driver directly manage an
I2C MFD function on one system and a second MDIO device on another.

The control interface is also used for more than initial probe. It
participates in suspend/resume and reset sequencing, interface-mode
changes once the MAC attaches, and package LED-pad configuration.
Consequently, exposing a raw regmap would not reduce this to a
one-time register setup; the common driver would still need
package-specific implementations of all those operations.

The PHY address should not be read from firmware again. The MDIO core
has already parsed reg, and the authoritative address is
phydev->mdio.addr. Passing that address to the selected provider
avoids duplicating or independently interpreting the firmware
description. Similarly, the forced ethernet-phy-id0044.1400
compatible is required in either design because the identification
registers are inaccessible until the package control block has been
initialized; it is not a consequence of using a separate control
driver.

Also, AC200 is an I2C MFD rather than a syscon. Exposing its regmap as
a syscon solely so another bus device can perform raw accesses would
blur the ownership of the AC200 function.

The private interface is intentionally narrow: it contains only the
operations whose implementation differs between the two packages,
while all normal Clause 22 behavior remains in one shared PHY driver.
Given the AC200-only, AC300-only and runtime-selected board
configurations, I think that separation provides a cleaner boundary
than moving both control backends into the common link-PHY driver.
