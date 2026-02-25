Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713D13D903F
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038673; cv=none; b=UrR2mRI2TTxYI+x3JKNhcyrlooVGXx4osgg2z/goLqNA6RnisdEDC/TP5EnDH8u1DO5iFL/jQH4jhuST9C9ljUlIVumVFx1Ao9hcXovvIRRph8FIFkJ1nlDgEAmPAvkWgOHBFw3pEhodwirnntpRL0C3Sdz8+bBTPjwm7q5pKvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038673; c=relaxed/simple;
	bh=Yps99FyS901aqnCa3oM35uRJ1n1Iu2fP9xlC6LYC6x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZtEEilGxskExTg7jARRSu7XrwCNC6pGP6O2SIdbeA/MmCtGGTlDGCOnhb+RqwrDm5/43/vQ6jZOnic9NudDp5ItX2vt5A4eDfSHQ2cfq+JpIzNqRf9XTH3GqxGZEEEacKZ6VyWi8KQPAS8+R7pmVG/4GUnWZgToNEfvDVjeSW8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW/RcNJb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW/RcNJb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48371bb515eso87563635e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Feb 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038669; x=1772643469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=NW/RcNJbfMr2aW9Jn1qp68plW51m2lhWz5Z5iednzN9Kr8tq/l2zg6Hqet+FQotlaX
         GOWJVQgMIvdHN5d5KsSq+aKjFXnCOODws8p2kjSxMd3DcyvB67YEAUe3O2z8LNGM9Zgq
         N0A3MHPtoD5iq3HYhLSgFVEU5RIMI5F0JTaS3RGjf9ZBkb57kcejS57GL0I5d44S+60R
         WdPyf8LxTL24B/ubW45F1VFUshQLKhrkhoWMmmvA8EqYQunHKRWzngGa+OWCBCfJ/v2i
         cRUeQnSXwMtSGS9/qDSd6wDiZORBNd4q0aYS7S0vQqxExPijD+Jd2pM31nQVnuAxMdI8
         qL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038669; x=1772643469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=OXllc1EHP+f3fl5TRHJoyS+GSFm1llFGbVEJSW906QmiH2hcAL2ZKS4/5irfT+8yb9
         dJapy7NCkoWhAuiZBmU8Gqpjv9WKzxtJEh5OhTOuUog3yfOU8XLApoIuUwFUiDtcFVzh
         jvCnkWqdRjsEQGEAEa+GUv7Ynv5k8M6IW0sR+JKyOdCVCEegRneX/kqF5RYt4IJHjmTL
         /7h5aoal0RS/Ao90G0lTTVu7NjkXRZTMf5l4cJcoZULcI7nLjYIxoIYeris/O4orys3b
         LBS1PfI4ZSlU/I3rYyCXx2oSPHG20kwtJpG3x5Oe+JqQU9Y8QGUc1pDzDDk5ywR9vbAU
         grKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8msSMT2V9THd3iTj62isic/Hiz0SrZFANqUb700D6rMcIWRncKN6ExICOYt+uLMaplRK3t0xH7+AVSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrFtegmhokfV77fRv1bvhma8heyM46b8kUokubWqRoKvgH7vpn
	GrPrcLw8jq5Q8rpD9uIGWhQaqXsTJ+tP/rsMH/bd1Y6y9QWlrHShnU3E
X-Gm-Gg: ATEYQzwN1GKsXPPKIDJ8uxYsb/EcekPxcthzx8yNpNdGt4PkYp2aJx2pVLL7ElWP/Qa
	ApB5pgDGzO7q/db5+3cPMm4EkQIFEOXQ8+PiMGK//eIMikF5pDGdU8XAY+GCrA69lWCgr+xhRZW
	jhQxCPZUJCQQmqOb58Hl32oV8YtyPMKDEXYpMagCPA0uFCj39CqQfkw0SrDI775KaqJdx7vV9Cy
	l85URc8YmJQYRqAqa5G3ucae+h+PmzyOmajBIcjFDdhuWNQ3Tn35hKEEM5nMKYPFTltXFBg0ppO
	52yZ2xNNzryndbF0qKMSvY8wYE9qx+W4Cge23p9FJQb4EP1MaPHv/t6gVsw7aB3W8GYCOj8tCXv
	XCvTIR0KJfb1XtdD4Pn1krPXDiaf4RB4Xgl+lERuHdyxMwt8cUQnKAdtTxvGS1mB8RNj/DSMK4p
	9QxqBNUsps4Gjfbt3FGXjZvW8tqPKfTRqS3thKk3+Bo6y62Yf6ikdUMnNiCOUmRxETWlK//+k2q
	U9CFUlxmj16bHSx0eSKSBqcXMjq
X-Received: by 2002:a05:600c:a016:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483a962e470mr290674845e9.17.1772038668640;
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7141e4sm86300175e9.7.2026.02.25.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 wens@kernel.org
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Wed, 25 Feb 2026 17:57:46 +0100
Message-ID: <2818809.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
References:
 <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-3-wens@kernel.org>
 <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 25. februar 2026 ob 17:14:51 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> On Thu, Feb 26, 2026 at 12:08=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > The A523 SoC family features an LED controller that is identical to the
> > one found on previous SoCs.
> >
> > Add a device node for it, and one of the possible pinmux settings. This
> > setting is used on the Avaota A1.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index 09bd149bbf51..b8263e2872af 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
> >                                 bias-disable;
> >                         };
> >
> > +                       /omit-if-no-ref/
> > +                       ledc_ph_pin: ledc-ph-pin {
> > +                               pins =3D "PH19";
> > +                               function =3D "ledc";
> > +                               allwinner,pinmux =3D <5>;
> > +                       };
> > +
> >                         mmc0_pins: mmc0-pins {
> >                                 pins =3D "PF0" ,"PF1", "PF2", "PF3", "P=
=464", "PF5";
> >                                 allwinner,pinmux =3D <2>;
> > @@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
> >                         #reset-cells =3D <1>;
> >                 };
> >
> > +               ledc: led-controller@2008000 {
> > +                       compatible =3D "allwinner,sun55i-a523-ledc",
> > +                                    "allwinner,sun50i-a100-ledc";
> > +                       reg =3D <0x02008000 0x400>;
> > +                       interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
> > +                       clock-names =3D "bus", "mod";
> > +                       resets =3D <&ccu RST_BUS_LEDC>;
> > +                       dmas =3D <&dma 42>;
> > +                       dma-names =3D "tx";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                 ths1: thermal-sensor@2009400 {
>=20
> I Forgot to rebase this patch before the thermal sensor one in my tree.
> I can fix this when applying, so please still review the patch.

Values are correct, so with a rebase this patch is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ChenYu
>=20
> >                         compatible =3D "allwinner,sun55i-a523-ths1";
> >                         reg =3D <0x02009400 0x400>;
> > --
> > 2.47.3
> >
>=20




