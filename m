Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D371B2186
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384383; cv=none; b=qK7bNx314iqxuOc48Fsw3mlh94e1AdFZeLDHc5MtOIeqSMqvIY7YpY1NNDOJXtqQyAHFSy3RA7idRjK2ExaZUJqvytmESqBEQmbWtUUXBHXg39aV5XL4nTE4Kfv8qwBq0zb6M4hc5JKc4ZVFLqg37Z8qhAwb2FjjmvMV/t+Qd0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384383; c=relaxed/simple;
	bh=UUx7Qubxx4GnAWHZgQwjgtRTgGXGDcZjSsTPqDDDgeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2XQZUZnX6DyoEIOvMBN8cdeUjcLKqW7PtpNb7/YiTgh5n1m2mwVvthgVoOzzjfKZ4bVBlwxO/aD86GGJsvPw2NnDonOEBgiolTQtsdiJvANDdPcMArwDzWuTx0ZBaFn/hHsZAWhS/nasNFSgKr/B7OytPd1O9iYqqZheRQmAtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso5475371fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 23:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733384377; x=1733989177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haUzoOdl3j5ZhKh6v9Mp+uyoSF/yENN0p8H5q1O4kPw=;
        b=HSqx8KDHihxToYAUhZ8wVZa1cFrmVhg+uv1ejAjU9KJHbSoVjoM4RRcoFvsj3usTbm
         p/yCEOMZmbsVHCcOF3dp5BLKPgwryFkykZajckaSy1Q85J4V3ItstLWNH54Go7mQwCuy
         Ge90J9DSN7K+svIkDQOR96t6vlV4T6Lk5RpkFt9nyWFhZ5mPRUXJ79CEX5AZbGeHs67z
         DdO7OzYiR+Suj2L3cWxR37XLNSJ00Yi8nPR8e5QmiAX7nbEZLjArjthknONra5JMwGGd
         qdO4lpg0zVeoYrLX4qfaQmIi9mNGGmM2dkBNy7ZFvZ467eUydr3dvfS91eSJ6kQLQOPi
         E6tg==
X-Forwarded-Encrypted: i=1; AJvYcCWfYAgWhd0C0dgmM8BqzuiOSnnvM0Jg8ZQX7obiwQkKDTgIeyrZaqR/JlQC2keBUY4oVNL9d2zRvIfYfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNmYM172qiDny0/s9Q9brLVhAKvfzaRKB+Su2U8Lg9jUWa8qyr
	JQE7bFTNGYrV/fDkkZKmwJ5FyG61WuCQPSMQ4oZErwezS3JlVQvO3yMgsjHZ
X-Gm-Gg: ASbGnctG7eQDQJfKRGaMgjAqoJjGNr5kN/byb6BnH+gO4EZugNnTEAddqaqK610d2TK
	5D7erq9yL6WElCn4CWp5ywelRG6icNZ9lLgsiJ1lXl/8HCJ4oRQ1rCWWSNTzjPpHIN+yJLPgh30
	zu5ZAGEMUI7nRUTbq+MWTT9lnLJ+pBh//lh5kjDAmcDItf4HBQ9nw9RLU+S65RcsFqkLPB8BMsa
	1ODEuraI8fIxYU2nQu0iA1oOmt/5olChnAFIQgnpz5CRdf6e+fe0yIbLNUxnMo0dd0vwkiRefjN
	nMt0P94=
X-Google-Smtp-Source: AGHT+IHYvv4VBl6zAHcyaEXDNK3wE3WaMC1NqwsRP1jNXIkmPRDzh9ForJp18+bUvLogkN35t9xVKg==
X-Received: by 2002:a05:651c:154c:b0:300:17a3:7af3 with SMTP id 38308e7fff4ca-30017a37eeamr30569621fa.17.1733384377163;
        Wed, 04 Dec 2024 23:39:37 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020dc4b0csm1416061fa.68.2024.12.04.23.39.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 23:39:36 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffd796ba0aso4902321fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 23:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKUdmbLDyXHcDQBs8iwG8atb5L1FghI0bJcmEVkg7AvcNuRbBYSXOT795y4ioqo315hA/UIt81G/BlRQ==@lists.linux.dev
X-Received: by 2002:a2e:a907:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30009c50cb0mr55293541fa.22.1733384376650; Wed, 04 Dec 2024
 23:39:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com>
 <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com> <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
In-Reply-To: <CADomA482XLFNySkjujoPmPCnCrKn+RcppW=SqRqcA2WLMe-mNw@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 15:39:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64YFcEhTYVzTJWTvw7CZ3XF08e7+1jiTg25HN6C1Ny+Jg@mail.gmail.com>
Message-ID: <CAGb2v64YFcEhTYVzTJWTvw7CZ3XF08e7+1jiTg25HN6C1Ny+Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 3:26=E2=80=AFPM Philippe Simons
<simons.philippe@gmail.com> wrote:

Please reply inline.

> Ok I can do that, but the driver (axp20x-regulator.c) is using macros
>  to generate these regulator_desc structs.
>
> So I have two options, create a new macro with the ramp_delay, or
> modify the existing macro, using 0 for the regulators I don't know about.

You can add a new macro with the extra ramp_delay argument, and modify
the existing macro to expand to that with ramp_delay =3D 0.

ChenYu

> Philippe
>
> On Thu, Dec 5, 2024 at 5:16=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
> >
> > On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
> > <simons.philippe@gmail.com> wrote:
> > >
> > > AXP datasheet says that ramp delay is 15.625 us/step,
> > > which is 10mV in our case.
> >
> > (CC-ing Mark for knowledge on regulators)
> >
> > If this is the property of the PMIC, it probably belongs in the driver,
> > in "regulator_desc.ramp_delay".
> >
> > The "regulator-ramp-delay" in the DT can be used to override this
> > if the board has excessive ramp delay due to other design reasons.
> >
> >
> > ChenYu
> >
> > > add missing regulator-ramp-delay to dcdc regulators accordingly
> > >
> > > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > > ---
> > >  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +=
++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024=
.dts
> > > index 80ccab7b5..b6e76a804 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.=
dts
> > > @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <900000>;
> > >                                 regulator-max-microvolt =3D <1160000>=
;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-cpu";
> > >                         };
> > >
> > > @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <940000>;
> > >                                 regulator-max-microvolt =3D <940000>;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-gpu-sys";
> > >                         };
> > >
> > > @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
> > >                                 regulator-always-on;
> > >                                 regulator-min-microvolt =3D <1100000>=
;
> > >                                 regulator-max-microvolt =3D <1100000>=
;
> > > +                               regulator-ramp-delay =3D <640>;
> > >                                 regulator-name =3D "vdd-dram";
> > >                         };
> > >
> > > --
> > > 2.47.1
> > >
