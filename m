Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33515EFDB
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972081; cv=none; b=CDGG1Ahuu8xKI/IT0F/SdvNxXzKgIjZSnN9SNYfufbW23QtQpLFeeMBgzD9N85k2mzh7rWHf0E9lZmaPEgcDfu5jR4KachURPCYKajxDqxaxM1dRMeeihe1KHpcmOK6pE8M+3N0DQOtU80gmjCb7BDDuwJsfX+5b127WUNU8NMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972081; c=relaxed/simple;
	bh=die5GEdR93SZJIrj+6mbvz6RS0d1bUoi/TXLw5RP8dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=K5+nVxqiPT/AU8ow28gJ2Id69QLVwshDhULOHMhHfQnuexEENCDRAJX5V5EOF20PTOJwactcqZsqoD72p/W0UeO/gBK1P3Kc36Eu0TFG6YciTF1uUOQwvpjlTCyS5UeQliXiHEWyPoFYMJumAGJbL+zMKv+JWT7kqYUJdqEZIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meMwpUFd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meMwpUFd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e37503115so6156940a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713972078; x=1714576878; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmbep3Wj2edBDGZAic+hg2xj7nE0C73pjSQNpMAXt4k=;
        b=meMwpUFd8xs8OlgrDaqlyGAlRr1WYBuB6XTyJUCK2seZtYZj/sVDoG7nHcDi+bcWiC
         4+3HVSFnXuvkN/pmciCHKJJKeLDzYuOG/XPiGSZIrJqz8NulFo0rnkNrUo7nGVapH9pD
         IoycWWw133y5phpfjSUdbaEuMh3goJNpfvdbVR2tvOKyBIkDR+RG5xhXL9Tk65HxvOzh
         JJlqVbgy0nDY+Gf9FWYe34BY8l5PDCRNlPb+cBhhtaYl+54fdrPLicRJPfxTwDu8nM7u
         LHYo2rTCDOICOTG+kEUvNV4pDk/HyqqcL9ToDWT2tA6wXPqqJggeKeEq6w/UqqU/a1lD
         rDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972078; x=1714576878;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xmbep3Wj2edBDGZAic+hg2xj7nE0C73pjSQNpMAXt4k=;
        b=ElKCrupHhydiGy3lODmpWNY3K8H4Zy6szIB3Q40vj1/w90T/IUM6/sUoM5sMW6s3S7
         k0eqmrrmFNbhu5fiX5U2PUdy7BRFckt/ZU5GzK9Eo1dSj92PaISC1+q/wUkcnK8ur2VH
         l7Th8culZ1/GxcL8pogGlaiAUuegcdpIyCU/Lat6mIcj4cs7Lz+wVoleGm3oO06+hJIp
         9wsnYe9WceP+inCNEuTzeHyxKk+/v40hXjwBrLSpn8P3/41FW4mRY1TNhit2erKK773M
         1fJEtRd+s7OuhMy0xkdvNbolaC8ZIQ0Q/qjRKHBQHDgDHGBvZ3oPXs44iXRE2zSgfdkA
         NoUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCX4hF4bMiLaahThpq0PVfKTDKRW3C5hubwXu+KvONJsKfsutKMaKTYHhvvDFGyoFleTE/LAyz/x/XIGB85DvrIxSx5OkhATtJUnY=
X-Gm-Message-State: AOJu0YyLW99fszaVHO5vIpfdAO43Su9aEfz+8lTPsxIBYYF+fwuAoUyC
	u/Q7G/jxCmEp2A37k/Je7DwEg7G2iXKvkkOME/ApR+RK58TldkSs0AZC8078M4vhwrWYrOVagnp
	TCQM4qYM3A2C7X0hLi1X2e0Mzin4=
X-Google-Smtp-Source: AGHT+IGQUEPZE3TBNrB7jm9cFv207FSC0kpyhsF+3dnUvHUba9LKAV3qWkn9Wz5L3PgDviOeIm6K6r9u4HEv/wd6LO4=
X-Received: by 2002:a17:906:308c:b0:a51:8d60:215a with SMTP id
 12-20020a170906308c00b00a518d60215amr1836143ejv.27.1713972077907; Wed, 24 Apr
 2024 08:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423223309.1468198-2-aren@peacevolution.org>
 <20240423223309.1468198-4-aren@peacevolution.org> <CAHp75VeRDSPvpmSbUyZPp0RMoTOE193U2ma18qxv_qZQKLCq8g@mail.gmail.com>
 <5qqil7ltqhdeabml6toqpcy773uhjxgwaz3txpy4kv4sz55o2y@hmar674eey7s>
In-Reply-To: <5qqil7ltqhdeabml6toqpcy773uhjxgwaz3txpy4kv4sz55o2y@hmar674eey7s>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 18:20:41 +0300
Message-ID: <CAHp75VdR9HtWbSif+j8QHX5zG9xPF1GzUFY2s-0OjD3RAWD9-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] iio: light: stk3310: Implement vdd supply and
 power it off during suspend
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aren Moynihan <aren@peacevolution.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Willow Barraco <contact@willowbarraco.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 3:59=E2=80=AFPM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:
> On Wed, Apr 24, 2024 at 02:16:06AM GMT, Andy Shevchenko wrote:
> > On Wed, Apr 24, 2024 at 1:41=E2=80=AFAM Aren Moynihan <aren@peacevoluti=
on.org> wrote:

...

> > >         ret =3D stk3310_init(indio_dev);
> > >         if (ret < 0)
> > > -               return ret;
> > > +               goto err_vdd_disable;
> >
> > This is wrong. You will have the regulator being disabled _before_
> > IRQ. Note, that the original code likely has a bug which sets states
> > before disabling IRQ and removing a handler.
>
> How so? stk3310_init is called before enabling the interrupt.

Exactly, IRQ is registered with devm and hence the error path and
remove stages will got it in a wrong order.

> Original code has a bug that IRQ is enabled before registering the
> IIO device,

Indeed, but this is another bug.

> so if IRQ is triggered before registration, iio_push_event
> from IRQ handler may be called on a not yet registered IIO device.
>
> Never saw it happen, though. :)

Because nobody cares enough to enable DEBUG_SHIRQ.

--=20
With Best Regards,
Andy Shevchenko
