Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF6223DE9
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050276; cv=none; b=m15K45/loNVf5J5PW5woLia3waqscImLWKZqm4igZNbbhKHF8+Xab27Kg2fxiHvTpXrIWv7RZ7EtwNF7XoqfGyXfRJcAt1hmRo9pwCDumTGQS54XNSH0hu214dy2FR9h+dK27c/lb3lG5e3oASNwuzoRb96Z+pu/C7RLpEiMKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050276; c=relaxed/simple;
	bh=rlbSlwGTV2AmvHlHO822z/zxZ++TLcjFgTSdirvXcOE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8wjhMjhKbfbLnhhx7T2EBKoymFUpUbZXFfAoVliHzy813TH+jyHYoXnG78B7HayBsM42pf9chiqLdksnZi0Qy5wb7DOMi3LH43zRFl8AJg4Li3mOysgW4SpBRfKNQ/fUPz5R7sO+dS/wF7kmaRTWh9O17REov5FfnV9YkP5iLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl0mxM2R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl0mxM2R"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so16928395e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 13:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779050274; x=1779655074; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=rl0mxM2R4pzrYQgQFF3mihNJPylqnbSRJM/u0UKmjG4vIbqF260nwIjpGHDueUMrue
         THTwrLRzgom7Ji6b+gbcBf5UkmcVFfowM5k1VuI+2cyim53ZUyQvE4i4Cc8pVdnwUuRU
         7oHODyqYaf1cr2HRpnr9QbKM7z/o5sBR4T5yy5L+yBFFejOV7HI4d8V1v19ijY0XQiJF
         V2LaKBXuyIP1f1E4r2vbWA737om2TapnSX1OrEiBQ+lSTaBrR5ApTGC7sS3AUH8GsQHj
         ycCcU7pxTiBMUIJqU5VZbujgcFtfr7n9JJIFQqZIwJsZxn4bKjDZmUo2b9qPT01PHLSD
         aW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050274; x=1779655074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPgB9UynDfl3zmI3aakfTZKeiVVfht++/m5WoF0UhgA=;
        b=TA05uuC4QbT8c8jGzWlxasSLKaJN16LhStiRQrs2lVEn2CNbRt+DkOJt4hFHhqSzJT
         Z/HrPwtEdrs9DMRbjXEOrL2kBPFA0udLrJ9O17ZvQGjaQ60HIZo2ewO+0WNkYn/ie9C2
         ifoXQ+LXFEmoktUZl6zXdJIOgUIeQEB6koYbmMpeLVCJ/l6MztHjOEaTT4nvtkYd7Ui9
         dhs3EfJ8+ljcPku51qbUqdH2fJj6dCY8O6HuwXcfp8uwjDWT+d/c7bChra3D5VspDNvU
         hPNLkfITASpDTUnS/5bBcRaf5GM6bgLbqopfzwngm2G52MOaxg/UP1xkh1uqYU8jFoUz
         JfYg==
X-Forwarded-Encrypted: i=1; AFNElJ+R4VVzAf4iUpo1zGI4JRsbjbfdL9WpyfRANwEbCvG469lYlputEHeR/hpfoCu/cTuj+UKNpjsRywkasw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu3kMXa2nYm3HVXcmGBJf7OBi4osy0S7ONMJOQiDb0FD0bYIyz
	SREUU6zGcR64mzoTVzanX1/LOWpyAtI3uhBvar6jQuZO5DbW1NChLiGq
X-Gm-Gg: Acq92OGN/IrwG87hpmVAaiE43AIhB6I9hy26aZD0MzdcwwbrbCFJsW9PXaCznLRtA5l
	PgfPg3Zk8db08EYJulVA5etabND9Dh0dRaYcwSK+tVFRlmEph4OHNnoSEo4cTcE2HTkUl36RWaj
	6bFmVsxS3ohKkdMyGwll1EUpwXn+fH5GHo4p32665ej4cD+pJ8cWkuBBGYMOWHJuGt3mjn5l4eI
	ko9y9W9syJpEOrjawgNiZ9AHmhpBhDa98BVH/5htPxKKsFFv8qAszPyUOvtciCPiDjZO86P91od
	OKUZdqtRzI0DlcoJr9CCOY4EcgqEdL8meaWJNxM6ORWVXi40f1kThTRvPW3Dhla61xJeV4JKFbO
	JdGfTm4PP4e+OOpXmSYFgNNFO1mh79qE9/oHwWwW/Hmki+1cfhe2mvZZ9/O07fGicF8Xf+AeuZp
	yTybujw53kVbiw/0MSUmrAvUPLm4CWmB//8HP5IpOG9IXB7nvIjHTt9+zoc+RU+zufF9O6/rDIf
	ng=
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr114181345e9.32.1779050273455;
        Sun, 17 May 2026 13:37:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm363386665e9.6.2026.05.17.13.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:37:52 -0700 (PDT)
Message-ID: <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 17 May 2026 22:38:13 +0200
In-Reply-To: <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Andre,

thanks for the quick feedback!

On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > @@ -0,0 +1,162 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Arm Ltd.
>=20
> Please put your own copyright here, even if that has been largely copied=
=20
> from an existing file.
>=20
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a100.dtsi"
> > +#include "sun50i-a100-cpu-opp.dtsi"
> > +
> > +/{
> > +	compatible =3D "baijie,helper-a133-core",
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun50i-a100";
> > +
> > +	aliases {
> > +		serial1 =3D &uart1;	/* BT module */
>=20
> Do we really need an alias for the BT UART? And is the BT module=20
> supported already? Then please add a child node to the UART node.

That's the only thing I can do currently regarding BT: stabilize the
serial enumeration, because UART1 cannot be used for anything else
except BT module, because this is soldered inside "core" module.
We can avoid different tty enumeration, should the support for
BT be implemented in the future...

> Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC1=
=20
> here. Provide the child node for the WiFi chip, even if there is no=20
> upstream support in the kernel for it yet.

So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
has neither upstream driver, nor [upstream] DT bindings. Even github
driver for AIC8800 doesn't seem to use DT, therefore it looks quite
pointless to me at this point to specify anything in the DT for the
chip which doesn't have the bindings idea even theoretically.

Nothing in the current DT shall block any future work on the AW869A
support though and the above "aliases" entry shall even guarantee
unchanged serial enumeration shall such support arise.

> > +&reg_aldo1 {
>=20
> What is aldo1 used for, actually? I don't see this referenced anywhere.=
=20
> I guess the kernel turns that off after booting?
> If you have access to the schematic, please check that. If that's for=20
> some peripheral not yet supported, please note the user anyway, ideally=
=20
> by an explaining regulator-name, or by a comment. Also if it's used for=
=20
> any of the required SoC VDD pins. See the Liontron .dts for comparison.
>=20
> > +	regulator-always-on;
        ^^^^^^^^^^^^^^^^^^^
I suppose it's not being switcdhed of because of the above.
It's used for both PLL supply for the whole SoC + as analog voltage referen=
ce
for LRADC (the buttons you've noticed on the board are connected to
this ADC via a resistor ladder).

>=20
> > +&reg_aldo2 {
> > +	regulator-always-on;
>=20
> For always-on regulators we definitely need an explanation. Does the=20
> board stop booting if you remove this line?
> Maybe it's for DRAM? Can you say what voltage it is, either from the=20
> reset default, or set by the bootloader?

Thanks for the hint! I'll put proper voltages into all regulators +
comment all the always-on regulators.

>=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > new file mode 100644
> > index 000000000000..ccbca5d0a40c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

> And you should provide a top level 5V regulator here, to be the root of=
=20
> the regulator tree. Look at reg_vcc5v in the Liontron .dts.

It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" regulat=
or.
It seems to be only used for reg_usb1_vbus, while HelperBoard A133 doesn't
have USB power control. The second issue with Helper/Core split is that
all PMIC story is inside Core board which has 5V input rail, while HelperBo=
ard
around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
putting it in the DT would introduce wierd dependency of the core to the
HelperBoard which carries it. Do you think it would make sense?

> So from the pictures I found online it looks like there is an USB-C port=
=20
> labelled "OTG", so can you please add an &usbotg reference here and=20
> describe that port.

Nice catch! I've missed the fact usbphy 0 has to be in peripheral mode,
not host mode. Will rework!

> > +&usbphy {
>=20
> Are the two USB ports always powered?
>=20
> And anyway, I see a *dual* USB-A socket on the pictures online, in=20
> addition to the USB-OTG port. So where does the third USB come from? The=
=20
> A133 only supports one host USB port plus the one OTG port. So is there=
=20
> an USB hub chip on the board?

There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
two USB-A ports are always powered from the board's 12V->5V DCDC, no USB
load switches.
>=20

--=20
Alexander Sverdlin.
