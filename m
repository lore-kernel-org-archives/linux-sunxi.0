Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0B227581
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490538; cv=none; b=CdhQZsyx64STsgI4VoWaa1p67xBj5H4OHIqP1XBkG7e2to/7y3l1zUlPB9qEFq9KO4S+LEqQUxgVnngn0xnAi2WnEk4kq02uKB5UgBnPFxGYRUBjrYyFfzGlzMMm41yfVkenKyGwd/Go8MAEsh1lbL8LiVAwrlH6b/SuON6Q14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490538; c=relaxed/simple;
	bh=I3Yp1YC8RYR0QAk/38zVfCmTj46GW+ntIKQzSiFsPl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/ltv/kVTdKarF5340TFkjGG+h+G7h7jN69ZUAvWH6JI6z1Q3iIkGOwkL9cVPaJMvQVR/Jb7lPKqhvKXorkhCRSQL81cXSUKAQ1jD0v6Jvp9UG0GBDFp+hl32GeJ09YA3kMz11cUtpqOtYU/UtBIIPQWsolbESfx8z1oxkFny5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db2c2c609so11029931fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 03:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490531; x=1746095331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIj64A9Kj7dSdNG5r+KzTmwdGPe5B5brgWerOzNi7es=;
        b=CX7qTa/Z4ezkrjD33IUk7ZFvcobbyoGmkEYDiuXBrBy/iv0yZhE12RKcvkdwbbZECs
         /ES8r9vKIxfgLwvRTfQ/kOHvWg9TtLl1CXlLPy3GftJSrtE7nLeCCmgI5Ry6HJJ/u4Zd
         NvwnDacwifBDd8rTVixXEekCvSrP7RpZ7wOk9Jr41yly8+rcJUFZdyBeXKxqGLAE5xdx
         gErLFjOROvQrDEiffZ26bVvj/2kYy6H/miqZQkw89oXdt69eJO7JXuVeZpLRFuK6pFDP
         reEyNvGgTqnqubYRt6QeEmG7KcBQZQGQ7dD3z0vaGJSnXqnya7lp6XdWLYmyYnHLaMq8
         h/hA==
X-Forwarded-Encrypted: i=1; AJvYcCUM70jz0kBQo7qLxUOrkMroZ7KuAvzYOflChMOIzE9XR23BLl+i/pmCInzQ+3V7v9hfwN6GXpnyu6Gdfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2SrReWtAWKja065pjoacfokFqN7h68ClswjtOG8aOhm6k+SrT
	QU6dPeIxoMexpG++MwtpFBTENm0+pGFMESPSY1fPDuWWlBxSshmxtBZY9VHY
X-Gm-Gg: ASbGncvKd5+6W42jTeJ88+W3UiRA2EOYm8U8NBXfTb3ac59qFfXMpq6JiOiC/sJHc7c
	kkb40rrPripUHUDmIW+x3CUNUqeN9XAnjvEtWVMxWm3WdDXRPkadLFamZIUcTrERQRnNVQGfw7k
	WWefemreaA3BDystS9v86pQJrPVialxl6f/NDFt0AbBX9AFh2EHReQZFseYYig5q+GW1ZwGSzNl
	nxF3hHj5MK3WF/8yH1EdUvaD0IY6AUKR4pZoY3CxFEY/2uepfCu2HDGkOK9CX0F5TpVYhWUAdGC
	sBR2nommon3i8LPzAtsak9EskDWdTZyVsEaoIOFNK3NS5AIr3zCov3bIWQTO0b/BLY2iu6NdyQ=
	=
X-Google-Smtp-Source: AGHT+IGtyxneUf5AqXHkP4EK5ep5eSR1LcryDy5UlaEnLGeR/uy75W1v5GwMimVN/fMbfsxEvKWmQQ==
X-Received: by 2002:a2e:a9a9:0:b0:2ff:d0c4:5ffe with SMTP id 38308e7fff4ca-3179e6e5d70mr8004471fa.16.1745490531360;
        Thu, 24 Apr 2025 03:28:51 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d001965dsm2038311fa.55.2025.04.24.03.28.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:28:49 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c2d427194so7717171fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 03:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxGGMoCoFsa08EAqQ/sXnjK6heeVWZ4Ifkfg54ycVqnSE+Yh9xjgzbXMyDdicgHPJUUPdB5/DoYxBnPA==@lists.linux.dev
X-Received: by 2002:a05:651c:1513:b0:30c:4346:b1ae with SMTP id
 38308e7fff4ca-3179ffc88femr9768651fa.33.1745490529368; Thu, 24 Apr 2025
 03:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-3-46ee4c855e0a@gentoo.org> <20250424014314.146e088f@minigeek.lan>
 <20250424032836-GYC47799@gentoo>
In-Reply-To: <20250424032836-GYC47799@gentoo>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 24 Apr 2025 18:28:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WaC_6vExOoeRvhQxvk3fhiEyJL8Cfhyeq7vseMtoYUQ@mail.gmail.com>
X-Gm-Features: ATxdqUETS2xqqAY8auwUfOgAexX7AZr4wXke2z1Y8iAkz-BxG6Ttd6UjjiwNFRU
Message-ID: <CAGb2v65WaC_6vExOoeRvhQxvk3fhiEyJL8Cfhyeq7vseMtoYUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Yixun Lan <dlan@gentoo.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:28=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Andre,
>
> On 01:43 Thu 24 Apr     , Andre Przywara wrote:
> > On Wed, 23 Apr 2025 22:03:24 +0800
> > Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Yixun,
> >
> > thanks for sending those patches!
> >
> > > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > > including the A527/T527 chips.
> >
> > maybe add here that MAC0 is compatible to the A64, and requires an
> > external PHY. And that we only add the RGMII pins for now.
> >
> ok
>
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 42 ++++++++++++++++=
++++++++++
> > >  1 file changed, 42 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun55i-a523.dtsi
> > > index ee485899ba0af69f32727a53de20051a2e31be1d..c3ba2146c4b45f72c2a56=
33ec434740d681a21fb 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > @@ -126,6 +126,17 @@ pio: pinctrl@2000000 {
> > >                     interrupt-controller;
> > >                     #interrupt-cells =3D <3>;
> > >
> > > +                   emac0_pins: emac0-pins {
> >
> > Both the alias and the node name should contain rgmii instead of emac0,
> > as the other SoCs do, I think:
> >                       rgmii0_pins: rgmii0-pins {
> >
> ok
> > > +                           pins =3D "PH0", "PH1", "PH2", "PH3",
> > > +                                   "PH4", "PH5", "PH6", "PH7",
> > > +                                   "PH9", "PH10","PH13","PH14",
> > > +                                   "PH15","PH16","PH17","PH18";
> >
> > I think there should be a space behind each comma, and the
> > first quotation marks in each line should align.
> >
> will do
>
> > PH13 is EPHY-25M, that's the (optional) 25 MHz output clock pin, for
> > PHYs without a crystal. That's not controlled by the MAC, so I would
> > leave it out of this list, as also both the Avaota and the Radxa don't
> > need it. If there will be a user, they can add this separately.
> >
> make sense
>
> > > +                           allwinner,pinmux =3D <5>;
> > > +                           function =3D "emac0";
> > > +                           drive-strength =3D <40>;
> > > +                           bias-pull-up;
> >
> > Shouldn't this be push-pull, so no pull-up?
> >
> will drop

It would be better to have an explicit "bias-disable" here.
That way you are not depending on the bootloader setting a
certain state, or depending on the reset default.

ChenYu

> > The rest looks correct, when compared to the A523 manual.
> >
> thanks for review
>
> --
> Yixun Lan (dlan)
