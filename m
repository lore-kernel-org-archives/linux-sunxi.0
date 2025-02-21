Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2D1EEA43
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131684; cv=none; b=ftGPCEi7W4RY9a4jTzeqUc9ISHd2FBckluJ+qakg7PVHJBsuDPtvakWmvxMJKqL28pvax/j16qdwEtySTJATg6uM62nh1jU/gSV+0i7hYZ8lLTXxJ/0pvMmjQdmp+CdpOsT/fa0iP+VG0Q8P5/336Bpdw7lPrBSBHGHD0p5w2gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131684; c=relaxed/simple;
	bh=ro3d+iKXGoqGnuNHlS/fgeOaWF0UBAOH6kPyVBHtOvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAnqCJEQkLWEfoZt5u3SaDK1uH5x28E2hYHsL+tMTF1JVfC7LDwvyjyYkf+xe1ww99ZixBGYHK+5E/+fjWgdbnOst9iLlv3JtlwqwbwBeZw2qEnf+a5pfvgzBHTmV9n+e5fhBAG6tO39hAsggQoiUULtOOIW9HDqehW1Aj/9z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/qpQfPP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/qpQfPP"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so3551347a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740131681; x=1740736481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCWLQJXIRaGa+NaKBUA5lVma2HK+tvmrsuX2eAKzx3I=;
        b=X/qpQfPPN05IQhxO9ExdcTZMtdEWqohTg5O9uX/R6HRM16TZvB7d31AD0x3uUH4+Ms
         EagRZCcOBOi/8FBjG+/UdABbh71cxmSaLe9uzIvGNRdvpWajJ2p6Tm/i1C+IRrwKOj7h
         9VbwOePzqXrvx6K/XMZnkgCVMyJasrwzXSF/GZc0j2Jqu4wLtlpp8w5KbbvCsT9pFun6
         uMYyQyG/B5rYHZ0W0SGcFY0yKo0pcCz25oGM94IiUQizNV9guJtqcmNrnIw9O6ivOn0c
         Nt9o1BFo19fEsJmPIG/2sjBH87TkWb0Ro9JYoBueM7c4Q7XO53FdowMWPnZun8LhJIaD
         SY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131681; x=1740736481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCWLQJXIRaGa+NaKBUA5lVma2HK+tvmrsuX2eAKzx3I=;
        b=cuZBXfC9DbT2gdg8qBMQXlcrxJcbv9KSIpl0WeZD18mOuMxa6M0ZXAUpX2fEGyDPqD
         4NoVC00s1V9eMdSbqrbNV9g7PZpp7RsZ+zK5lPUfo+sX/p2W91T1wzHUY0Dn4roriQuD
         P8VUAGsCd1lGpiONYBw5ddGvetrKFjsRV9Zb0pOR9eB+ME3J8f6mjTp4pgD3P+5gsTBJ
         55uLz7JtmC1OHN02rL0fV+6vShtady21vri5jrrHRehqHorbYh6ZMjR6XD80AgsDGJ2n
         3qQpa3haQxNF4i079uTWEAgWmoZoUT5jyFlxyCQS+TVdnizo2e+FspHd9u5afCLHjBNB
         iw0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPMWZYWalJtuk1cWpE3htWFqzSUMK2BvTovmsz8p4tcmgxTvVG22udqrjTAvaKDHOH+46isOKfk6mEMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBmRidxrXLoOKiF3HXN7aMes3wEbBjyARk5HfQBPx0+YV5T0R+
	pnOy/26biWLJfaut1UDHYZX/hcmnhsNiqOEuWiG9i4dAI5HnWKTH0+vllYwvtccGXViy5CQS1B8
	SWkQzxJIovag1POXlnzoq72t+s6E=
X-Gm-Gg: ASbGnct0GJvH/q6WnljCVdEpbR1dssepSD4vbcknbwoI71UxEKVoGRMm5iZBTJ5ybRq
	rw+eKJVEi90Y1B6TTZO0uCXDxfvoZsklXWx3H8yebCpCEn7RtkTIAKSFu18mvl68HYHLwrlGd+P
	BdCgzKuCk=
X-Google-Smtp-Source: AGHT+IERzieE0HXpOGPr2oPq6V5HcGC9rINMOoagVFBANbqyTomsPjFp0m4XiausshWj0LORrEm4V/CktVu+ZQyj1Kw=
X-Received: by 2002:a05:6402:90b:b0:5e0:6e6c:e2b5 with SMTP id
 4fb4d7f45d1cf-5e0a1261230mr6369087a12.9.1740131680329; Fri, 21 Feb 2025
 01:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-3-simons.philippe@gmail.com> <3229934.fEcJ0Lxnt5@jernej-laptop>
In-Reply-To: <3229934.fEcJ0Lxnt5@jernej-laptop>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Fri, 21 Feb 2025 10:54:27 +0100
X-Gm-Features: AWEUYZlqXqdJfwgEwnpCfDSpt4wrYNSKsocDQVRpSu4fjABOQ7YP3MhnhFElf50
Message-ID: <CADomA4_yMUS_S-YDrQdSKmZrDMwPeakkJBix-r08UFQejTYYcw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 9:38=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=8D=
as je Philippe Simons napisal(a):
> > RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> > Enable HCI0s controllers and otg for dr_mode.
> > Add phy0 properties to descrive id_det, external vbus, and internal vbu=
s
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>
> This could work without previous two patches, right?

While this correctly describes the board, it currently doesn't works
as expected.
HCIs will enable the 5v on PHY and will never disable it.
Resulting in a blown regulator on the board if plugged with another host.
I managed to get this working by removing the PHY ref from the HCI,
but this is wrong.

>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
> > ---
> >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-=
2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.d=
ts
> > index 80ccab7b5..5a6ae42de 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input =
*/
> >               regulator-min-microvolt =3D <5000000>;
> >               regulator-max-microvolt =3D <5000000>;
> >       };
> > +
> > +     reg_usb0_vbus: regulator-usb0-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-name =3D "usb0-vbus";
> > +             vin-supply =3D <&reg_boost>;
> > +     };
> >  };
> >
> >  &cpu0 {
> > @@ -337,12 +347,23 @@ &uart0 {
> >       status =3D "okay";
> >  };
> >
> > -/* the AXP717 has USB type-C role switch functionality, not yet descri=
bed by the binding */
> > +/* the AXP717 has USB type-C role switch functionality */
> >  &usbotg {
> > -     dr_mode =3D "peripheral";   /* USB type-C receptable */
> > +     dr_mode =3D "otg";   /* USB type-C receptable */
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> >       status =3D "okay";
> >  };
> >
> >  &usbphy {
> > +     usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>=
; /* PI4 */
> > +     usb0_vbus_power-supply =3D <&usb_power>;
> > +     usb0_vbus-supply =3D <&reg_usb0_vbus>;
> >       status =3D "okay";
> >  };
> >
>
>
>
>
