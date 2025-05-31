Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8864A08
	for <linux-sunxi@lists.linux.dev>; Sat, 31 May 2025 00:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748652564; cv=none; b=AckbwC+Cm2JXRrqXFP5bnAvq7dUTX1qSad1A/pqAQomKmihoar9JG4Oqki89rEa61KfF/+QjtaJASwkMr3rJueeCcigmSVqv7qpue02SjfwdQW8+9AOqB8UETVJbH8mAI1dfur2uR9J+bGuBVjphAXsU2PPJlnMv8giiSBi8QQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748652564; c=relaxed/simple;
	bh=OvNqFUQ+wdR1AxR4NQ0AQuNa2dYebScEFxP0hfZDOEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sa2kGD6QaZ10xs38+fFKB3CJQdgWYJJ9w6PYowAsI3Ce2yxcRAUgnNGIZ9UwykxXT+kokqAWwtoFTvOuwl+MwpFrbeG2Vb5jM/kalt9TiZ3Xxg1XJ9LuuJi6RxxNhiQPQ1ziGfDAoMWtPwjveOcoPZwcOjLqWQr+RUivOPb8trE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgWMXMbt; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgWMXMbt"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e5a1a4e4aaso894535137.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 May 2025 17:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748652561; x=1749257361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=344ZXOydtru+LtTP4kRXS0HZ8/NsKlEl+mhmACEHqDs=;
        b=GgWMXMbtqge+IGmY06gvJL8l5EszU1T2BbOV+gU+NUX2uRM4q2fpZkdwvfyBOxnfg1
         XUJfUEwW6AOfPFlBLZS/Qz/LV+X5ro0ykbVrER8Y06h+x2183ZfcQeXWiQcP7pRsoKs5
         +zUnbTmH9NAoRlYdtTLESquFCSMhYklp0vhnSVxGeMPIZHMHaQbJvnghXvnNxV82NaLs
         bZHiAeKtquCqo+j+DMTE+eL/90eAUYo56GxmS++Dw+urSVWFrOvgVEYyigtdpz3aRRU2
         k6B0eDcGcD7sYpiapTx/2LNg7Zww+RMl0OkZwZ9iOtelDpMDs8+gQTLI892pI7XTZaOJ
         YorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748652561; x=1749257361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=344ZXOydtru+LtTP4kRXS0HZ8/NsKlEl+mhmACEHqDs=;
        b=kyVPQKiznX8ct0E0h+8xY/fJVBXVMyw9kCZZIew/mGVdFxOjkAd+N+IAiLaGfQoY+a
         O84LwkUyvsn8HzqTkq/rgSSGZEAtoPsXQAYePb4dqwKX7BiPxxOshmSRvAc336mVynOe
         y9oyUiHG2McIhgtI26nMQuY3VxkmmB88JWBAP3prQXi7lw0E2UZ522KtMszHF8YCKsDz
         imcXhvsJk25erKDmaGQm1Hhs174gRZMn8ghWC6ttBrlNghNaxxsC1qTP1glT4JxYqd1f
         yESC0pNUwxBcq4OnmiSG/Efhlq+aNOaPERnMJb+ktiGZ0Afe6Z93t3KSNaNOYG/FdoFM
         qyCA==
X-Forwarded-Encrypted: i=1; AJvYcCWaKbnQ5s0eSeiBUP2JcIV7739J+FUeStK5KumZK07n9UYrqCr3oJ0d3+tw/KVu/mC7dxTNtqgYXewCiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9JuMvBV/X7PkXSMiCLldsgHKTrC0eH2yRe8S9z1wtzU2gTWVR
	7ep23LKuRcG3Bodr6t65HSg2/85YgT1jVGCZigrAs4tYV8cVHc1CC9yopkNwlb9zr4hp3i2Zy31
	8DC/U7r3bfbB19z5QY9qRN9/Xs9v6BxY=
X-Gm-Gg: ASbGncvpJ4TXfP0HWAqCkfsBzdR9rcCCZ9JVR2gahKeHNvv2duPg2HXjSiS6FoY4yHT
	+dq3nfD/7e3a03JWeDhTORQ0OedlxOcmT53CbRzWO7RVtWZLAIQHTNIoDVf7IBbvsfDmjWpXeaR
	6VuAOGUBjnjUkKMDukj6dOUpTfOJA/nzAMLt7NZb984azW
X-Google-Smtp-Source: AGHT+IGXJmVpo36K5gmhxZOj9Z0RnB1rGuSi9/anoCRMQ6XHT10/qBZWClCon53dYhxQ1OUjw4aaz69nJ9Y0sSEFAok=
X-Received: by 2002:a05:6102:d8a:b0:4e6:245b:cf5e with SMTP id
 ada2fe7eead31-4e6ece4b027mr3457384137.17.1748652561434; Fri, 30 May 2025
 17:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com> <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
 <f5461b58-79ad-40b0-becd-3af61658bf61@gmail.com>
In-Reply-To: <f5461b58-79ad-40b0-becd-3af61658bf61@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 18:49:09 -0600
X-Gm-Features: AX0GCFupWsNFi2CuUY75nrFXpih2klRDW7O5Fm08l0tn6Tcu2AX3UTC3nexx8v4
Message-ID: <CADvTj4pZrOo8O=kH_RzoTNMG3vHEzwy8KsgP9eWSic46o9cAdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 6:24=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 5/30/25 17:02, James Hilliard wrote:
> > On Fri, May 30, 2025 at 5:56=E2=80=AFPM Florian Fainelli <f.fainelli@gm=
ail.com> wrote:
> >>
> >> On 5/30/25 16:46, James Hilliard wrote:
> >>> On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> >>>>
> >>>> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> >>>>> On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch=
> wrote:
> >>>>>>
> >>>>>> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> >>>>>>> Some devices like the Allwinner H616 need the ability to select a=
 phy
> >>>>>>> in cases where multiple PHY's may be present in a device tree due=
 to
> >>>>>>> needing the ability to support multiple SoC variants with runtime
> >>>>>>> PHY selection.
> >>>>>>
> >>>>>> I'm not convinced about this yet. As far as i see, it is different
> >>>>>> variants of the H616. They should have different compatibles, sinc=
e
> >>>>>> they are not actually compatible, and you should have different DT
> >>>>>> descriptions. So you don't need runtime PHY selection.
> >>>>>
> >>>>> Different compatibles for what specifically? I mean the PHY compati=
bles
> >>>>> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
> >>>>
> >>>> You at least have a different MTD devices, exporting different
> >>>> clocks/PWM/Reset controllers. That should have different compatibles=
,
> >>>> since they are not compatible. You then need phandles to these
> >>>> different clocks/PWM/Reset controllers, and for one of the PHYs you
> >>>> need a phandle to the I2C bus, so the PHY driver can do the
> >>>> initialisation. So i think in the end you know what PHY you have on
> >>>> the board, so there is no need to do runtime detection.
> >>>
> >>> Hmm, thinking about this again, maybe it makes sense to just
> >>> do the runtime detection in the MFD driver entirely, as it turns
> >>> out the AC300 initialization sequence is largely a subset of the
> >>> AC200 initialization sequence(AC300 would just not need any
> >>> i2c part of the initialization sequence). So if we use the same
> >>> MFD driver which internally does autodetection then we can
> >>> avoid the need for selecting separate PHY's entirely. This at
> >>> least is largely how the vendor BSP driver works at the moment.
> >>>
> >>> Would this approach make sense?
> >>
> >> This has likely been discussed, but cannot you move the guts of patch =
#2
> >> into u-boot or the boot loader being used and have it patch the PHY
> >> Device Tree node's "reg" property accordingly before handing out the D=
TB
> >> to the kernel?
> >
> > No, that's not really the issue, the "reg" property can actually be
> > the same for both the AC200 and AC300 phy's, both support using
> > address 0, the AC200 additionally supports address 1. In my example
> > they are different simply so that they don't conflict in the device tre=
e.
> >
> > The actual issue is that they have differing initialization sequences a=
nd
> > won't appear in mdio bus scans until after the initialization is comple=
te.
>  > >> Another way to address what you want to do is to remove the "reg"
> >> property from the Ethernet PHY node and just let of_mdiobus_register()
> >> automatically scan, you have the advantage of having the addresses
> >> consecutive so this won't dramatically increase the boot time... I do
> >> that on the boards I suppose that have a removable mezzanine card that
> >> includes a PHY address whose address is dictated by straps so we don't
> >> want to guess, we let the kernel auto detect instead.
> >
> > Yeah, I noticed this, but it doesn't really help since it's not the add=
ress
> > that's incompatible but the reset sequence, I'm having trouble finding
> > examples for mdio based reset drivers in the kernel however.
>
> Fair enough, but it seems like we need to dig up a bit more here on that
> topic. There is an opportunity for a MDIO driver to implement a
> "pre-scan" reset by filling in a mdio_bus::reset callback and there you
> can do various things to ensure that your Ethernet PHY will be
> responsive. You can see an example under
> drivers/net/mdio/mdio-bcm-unimac.c to address a deficiency of certain
> Ethernet PHYs.

So if I need to do custom stuff to make the generic PHY's addresses
on the mdio bus live would I replace the generic "snps,dwmac-mdio"
compatible with a custom compatible maybe?

> Through Device Tree you can use the standard properties "reset-gpios",
> "reset-assert-us", "reset-deassert-us" to implement a basic reset
> sequence on a per-PHY basis, there are other properties that apply to
> the MDIO bus/controller specifically that are also documented.

The mdio initialization sequence for both PHY's is custom from my
understanding so presumably we can't use the generic "reset-gpios"
and such.

> How does it currently work given that your example Device Tree uses:
>
> compatible =3D "ethernet-phy-ieee802.3-c22"
>
> this will still require the OF MDIO bus layer to read the
> PHYSID1/PHYSID2 registers in order to match your PHY device with its
> driver. You indicated that the PHYs "won't appear in mdio bus scan"
> unless that sequence is implemented. How would they currently respond
> given the example?

In my example it's not actually doing the initialization part yet, that's
all being done in some super hacky u-boot code. My assumption was
that we need different generic phy nodes to differentiate the resets
but I suppose that could all be done elsewhere in whichever driver
implements the initialization sequence.

> If you can involve the boot loader, you can create a compatible string
> for your PHY of the form:
>
> compatible =3D "ethernet-phy-idae02.5090"
>
> that includes the PHY OUI, and that will tell the OF MDIO bus code to
> bind the PHY device with the driver specified in the compatible string
> without reading the PHYSID1/PHYSID2 registers. Since you can detect the
> boards variants, you could do that.

The address 0 and 1 PHY OUI's are the same for the AC200/AC300,
the AC300 PHY however has a different PHY OUI for address 0x10
which is effectively used in place of the i2c initialization sequence in
the AC200. Note this 0x10 address is not usable for normal operations,
it's essentially only used to activate the main mdio address 0 used
for normal operations.

> It then becomes highly desirable to have a "dedicated" (as opposed to
> using the "Generic PHY") driver that within the .probe function can take
> care of putting the PHY in a working state.
> --
> Florian
