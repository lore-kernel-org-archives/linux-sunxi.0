Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD1250BE5
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740162026; cv=none; b=ebhIJZWJzZRIF4gPHOeOAR6Djrf1gaLvpvZMQ0ytj1pNhQlfM4bRQLhn5IT3lFAA4f9A6Ul96MGjuhaMYXzsd/ZDrM/QhZOousgNfIO+/HPMULU2AOOw+gVt8NKgU5LHMNmU3pJ5KBjBRSBaxuycZ54OCNCo8jFVfk9N1iQo6JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740162026; c=relaxed/simple;
	bh=FlMFiPqoPoOO8nzB7qRWFAsrP98gJ9Y3C8ZL+zevz6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPovT6ZBAfiTeqoW/imBspMY6asXwcvvE94SlhaUunodVx3rhVhQ1JLzSVrLvkpptxWYHb9DcoNVL8VDgRlS2dKxZKlzRR0bBF3EIcdexcy6oyaz5LmruOCUMWpfrfyMf7HwkhgO3xKm7KJfZqTglUj2QULg4zy/0bJNCKIM67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B674QlhH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B674QlhH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1316780f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740162023; x=1740766823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veHeZGAsIMfeo9MJB9NRykJz3c6tbQQyeQEGIEl/Nmc=;
        b=B674QlhHjxLlLyLDGtbLiNsZLW5ONtY3bVxIqRw8bBzVfHo1DEvVlVJxKB0brtFY9I
         rXwvlLQ19kTBAEQnfByzu6j/Y5UYSZN6KfsMZk2EG0YadBfLRG3AI+R8utXR0YS1dmCy
         f9JT7IW9zWjRChz1uoFsHLqxz7Sa/L3OO8dCG68hgwl7QnQ8cVAWQtC2D1n2BxFYhW0c
         2lHHO4Ay2CCvgTz1TTleTWN0kHmZx+pr3Q/MWcIbHGxjzaHP+8czzmH8w4akAEMb5er9
         O/LIPvt3+GTlUwGo4iXVy5enzKwXbwBXgjAP64i6Fe8YaWp7sb1e0q2UiZxZ7XpEao5r
         vOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740162023; x=1740766823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veHeZGAsIMfeo9MJB9NRykJz3c6tbQQyeQEGIEl/Nmc=;
        b=GyP9pqR5e9sB04m/V1w2yXDSq/P/3IqWWM4OUBmFqlLnNDF2+vCzaF9MRZKEabzdtw
         3vrDZ00/DcirR1inXiqsgBXtHMVJDcUc94sVLfmKiD5TGhvScDlRVW56ZHwhv1Qp1Rqm
         Rh5Sr+ExHbMSzOLRf8c7ZX5kBVU/cZkXqGPuK5hjiQubTEjpmuqoBQXwkAcgFQNLiLeY
         CQjEtQ5C8t+q5zq4vTifhWoucQ1eoVfBqfmHe7UFMw79eYwpiEqegdyZuXpXgdkGknjl
         O7Tzg9M7IIgQcBOU1X+WRNBCc8ESoBDYd1v4xDd1pRZX1WLGQTgqX1a9Gk4vuf6LBqVo
         kbLw==
X-Forwarded-Encrypted: i=1; AJvYcCVuALYKDyp8QN40W/vVCkA6RhsvEMlJZHExzT4LOebHaMsGpxNegKw8OTiTRWPWIXmv4bxuJ18qgdAEYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLXEUDDJj98z30bTnORLsrMJLNrBPhYeWG9m99LVyw6cYef/2C
	Vm+wFko85o1XaQsyFKNmNyhl1Upy09XmEG/AkVMtVxs7sTFjXFKROQKS8YBg8GM=
X-Gm-Gg: ASbGncuF9BaOprRqPt8MjHDoingxrTfYzQ06M0dRiCEu+K4cbgy5vHZF+v+9ZRwAGM+
	VO0Vrd4poxkwjdokfBu7vdu9XZbdbUo0THwe1WJObnGe7Y9ZatTpTomREwY4E5A1S2t+bVPyvV1
	hDMT9SKmjcal1v/+/wMlIanRSiBZL6MbWQvL1m9XgtPWUPvwT/3E2AOGH4c9hTr2j5BtBn8ECdb
	QbTxmME3NiD6kiEE/Hx/nwHJOaz9DjBokFWkzQuK8tSWw9hwLbVFmHY3uXLxXSugTiCLNS0dU5z
	DfWGZFU61iwIY6GTuIAYmGmXlpg6ioSA1IZ+klHhs6xQ+m7fcmUmcMrgoeMmxCb7+lGRXTc9EGH
	yRw==
X-Google-Smtp-Source: AGHT+IG5DSiVWK86jS+eT9SXqpVSAsqf+fVk2fzSBX+ycmlA1PLgE8RCGQ9E1+kLqZ2oPVb+Mg5AIg==
X-Received: by 2002:a5d:5f83:0:b0:38f:4e6e:22 with SMTP id ffacd0b85a97d-38f6f0d1c7emr4036180f8f.48.1740162021124;
        Fri, 21 Feb 2025 10:20:21 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm24489778f8f.64.2025.02.21.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:20:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Fri, 21 Feb 2025 19:20:19 +0100
Message-ID: <8490202.T7Z3S40VBb@jernej-laptop>
In-Reply-To:
 <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
References:
 <20250118102207.9339-1-simons.philippe@gmail.com>
 <3229934.fEcJ0Lxnt5@jernej-laptop>
 <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 21. februar 2025 ob 10:54:27 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> On Thu, Feb 20, 2025 at 9:38=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=
=8Das je Philippe Simons napisal(a):
> > > RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> > > Enable HCI0s controllers and otg for dr_mode.
> > > Add phy0 properties to descrive id_det, external vbus, and internal v=
bus
> > >
> > > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> >
> > This could work without previous two patches, right?
>=20
> While this correctly describes the board, it currently doesn't works
> as expected.
> HCIs will enable the 5v on PHY and will never disable it.
> Resulting in a blown regulator on the board if plugged with another host.
> I managed to get this working by removing the PHY ref from the HCI,
> but this is wrong.

Ok, so this patch shouldn't be merged until USB patches are in.

Best regards,
Jernej

>=20
> >
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> > > ---
> > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++=
=2D-
> > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
=2Edts
> > > index 80ccab7b5..5a6ae42de 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power inpu=
t */
> > >               regulator-min-microvolt =3D <5000000>;
> > >               regulator-max-microvolt =3D <5000000>;
> > >       };
> > > +
> > > +     reg_usb0_vbus: regulator-usb0-vbus {
> > > +             compatible =3D "regulator-fixed";
> > > +             enable-active-high;
> > > +             gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> > > +             regulator-min-microvolt =3D <5000000>;
> > > +             regulator-max-microvolt =3D <5000000>;
> > > +             regulator-name =3D "usb0-vbus";
> > > +             vin-supply =3D <&reg_boost>;
> > > +     };
> > >  };
> > >
> > >  &cpu0 {
> > > @@ -337,12 +347,23 @@ &uart0 {
> > >       status =3D "okay";
> > >  };
> > >
> > > -/* the AXP717 has USB type-C role switch functionality, not yet desc=
ribed by the binding */
> > > +/* the AXP717 has USB type-C role switch functionality */
> > >  &usbotg {
> > > -     dr_mode =3D "peripheral";   /* USB type-C receptable */
> > > +     dr_mode =3D "otg";   /* USB type-C receptable */
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ehci0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ohci0 {
> > >       status =3D "okay";
> > >  };
> > >
> > >  &usbphy {
> > > +     usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP=
)>; /* PI4 */
> > > +     usb0_vbus_power-supply =3D <&usb_power>;
> > > +     usb0_vbus-supply =3D <&reg_usb0_vbus>;
> > >       status =3D "okay";
> > >  };
> > >
> >
> >
> >
> >
>=20




