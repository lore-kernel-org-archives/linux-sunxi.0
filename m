Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60645028C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383575; cv=none; b=qDVSqjoANlhiUmD6bSfsNhPvWKcImkK1/qZCC7aWEUGvOFxTvz1HXt23Z/i/WgAwLy1T0ccOZ5LqWHYKG+Ewf9N8/2dSd1GZZnACF+m3ydrfEXY4usy3zWbNloAxgb7Wm6KWLCtJ8HaIqriHODlwlnqzg395CkRqYRy1o79jtDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383575; c=relaxed/simple;
	bh=Y2QaX9gVKGxNagsoDmEZMqVr4sqCCzk6oBiVfc2Cd0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAhQTI29WNoW3H2oXNl1ZVKu6cfeCY5q0H82q9nB601xqMh1CpdnrUrXFmhMw38XTcVp0HM7A+u0Xf4mHIgwSkPPuaQ8CXY3yUHcABEcSpyuobuSDiOd2dXyywe/ncojk/PRTds2ARrBkoh3WABD1PLFKwGhHd2w8jUpqOZBhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSLZJggU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSLZJggU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so612643a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733383571; x=1733988371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyamlqHI1fumzoheugLJdZAdLQLKXUTMBwxcQkBbITI=;
        b=ZSLZJggUPzfXEW2uhtL6lmSL7T7AN9b036fFxZ6Ay0GeIgGZdgrl96C4InV428Ln1C
         pShI3ig/7A0qoxU6VybocwD/ZBOB5bxppry0m3N3ppcqSGSf2i+TPLTO3h2wh5zMFBLh
         MS4TUL6xWj0meELtHMJS92b7m/RI6jKzRv/I6YJU0RW6FIkpHrUO6C92GXq5fUGjzXtg
         VQT7e0NEqxG7yu4TGyWLa8UUljljFri/XJbF1aFVVWmIKoywsf0xfHecvJpiCZInBQGJ
         le4g7zXyuwTIqC31p533bR37FfCTshFKEUXiXuZO3x660hDY+Tm+lg2qxDGmO7GznEEH
         XhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383571; x=1733988371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyamlqHI1fumzoheugLJdZAdLQLKXUTMBwxcQkBbITI=;
        b=ktT9Gf9/B5EZD+zSOGR1qcEsifVlpHO2FpmUXwm0F5XUEkJWjkfoZIjOjQNi2A8jp8
         ANAuDAgXIztM5hh0SrKQzS9gw1Z9f7WAza9LYpzNSvMUrwxkODT3yB9Am98TxO1/T8KC
         gG7PJrpXw7gGFJImMKD7vriiRVlcT6AgvO1124kQ4fnrg2j8B9VFIf3kQlkfeoS3s8Pt
         7VJJu4iv7oC5pu+qfZnV1BgYjdTDMPio3cp2NHJnYS/6G+yu2WyUFGY2HDpm4CL6tXrY
         R/jVeZVBCx/N/cG6kDEKmf/hxZ1l/seasr+BBi2IWjyLSghCdHZ5WrKybbHmeKo94j4z
         R9DA==
X-Forwarded-Encrypted: i=1; AJvYcCWA9oYw/2H7NXS2VMFvu/Gf4EQVBK0xEzrpUWa2NrZNORrt+7GwGsBzKiyFcM9strDSW30/WxMBTkJJTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybDT2zaK9g2AYaCs7TovqXMMNkKt8DVSZ9aeDwY1ZsKPpGhQDz
	ES+wR/fdmr5rpXnp7OXbcweO3TiQmHR7pzWJItIdcOVPtk1te7UbSMAa9ZvsFiIhaBbTwTwheen
	kS6kx9OU5bn/ehTVU9z1GUPQSwJY=
X-Gm-Gg: ASbGnctf9AWdy6sHhG6iWmr8aDvjcdmrOGWLhCuBlVJlLRSdSbojp0x38lrkcwG3qpD
	CMAALw2dozqxMebMLZ5U0C7DGJ0mv9gjLi/0T
X-Google-Smtp-Source: AGHT+IEjjB6Yn5ERQ4OSD0aCIa1Del//AgoR//24wAIvdKXXlyvcU8djUAx+OKR/4R6Km+pIAmIVry+Wods3NVO2neI=
X-Received: by 2002:a05:6402:42c8:b0:5d0:ceec:deec with SMTP id
 4fb4d7f45d1cf-5d10cb55abdmr8598789a12.13.1733383570763; Wed, 04 Dec 2024
 23:26:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com> <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
In-Reply-To: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Thu, 5 Dec 2024 08:26:00 +0100
Message-ID: <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I can do that, but the driver (axp20x-regulator.c) is using macros
 to generate these regulator_desc structs.

So I have two options, create a new macro with the ramp_delay, or
modify the existing macro, using 0 for the regulators I don't know about.

Philippe

On Thu, Dec 5, 2024 at 5:16=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
> <simons.philippe@gmail.com> wrote:
> >
> > AXP datasheet says that ramp delay is 15.625 us/step,
> > which is 10mV in our case.
>
> (CC-ing Mark for knowledge on regulators)
>
> If this is the property of the PMIC, it probably belongs in the driver,
> in "regulator_desc.ramp_delay".
>
> The "regulator-ramp-delay" in the DT can be used to override this
> if the board has excessive ramp delay due to other design reasons.
>
>
> ChenYu
>
> > add missing regulator-ramp-delay to dcdc regulators accordingly
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-=
2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.d=
ts
> > index 80ccab7b5..b6e76a804 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dt=
s
> > @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <900000>;
> >                                 regulator-max-microvolt =3D <1160000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-cpu";
> >                         };
> >
> > @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <940000>;
> >                                 regulator-max-microvolt =3D <940000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-gpu-sys";
> >                         };
> >
> > @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
> >                                 regulator-always-on;
> >                                 regulator-min-microvolt =3D <1100000>;
> >                                 regulator-max-microvolt =3D <1100000>;
> > +                               regulator-ramp-delay =3D <640>;
> >                                 regulator-name =3D "vdd-dram";
> >                         };
> >
> > --
> > 2.47.1
> >
