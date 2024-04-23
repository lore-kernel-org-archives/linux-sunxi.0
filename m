Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985736AF8
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 23:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713914206; cv=none; b=SfvjPZSf2y0vbysvtuU73BjfIb1hqw28v1GLBUCzw7s4jgrlQX4mfSp/5Df9mU9WvifSm6aIy5iyB2sD6PPUuu1ETxHwZC+6967GESbZuadKpVTtFgdD8VTQ5XSm8sXAjLBUlpxz2xCp+jMQTE3yaPL/PSkOsV+DcmuLvxo+NYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713914206; c=relaxed/simple;
	bh=7wftDFTjIIAwQlVxhCOtE1A7It3KWm3iQw5DK5y64pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzMnK2vxRjbCwlRoZqFrw33y02+pev6xcCRlz25Q5hFA6bT2SPCEbBGHfHFsrpgRYVrzelrUbDA3GGgqQ0ltkAtKQsNsbDZVcNTViNS0fp3hvWlQpmBu85cwSaW5Adv92fu/gOTJLxe5oUT7yiFSpS1zTxXpyrLv9tT56FE/Mak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP0CNZ8P; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP0CNZ8P"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so6393012e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 16:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713914203; x=1714519003; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aca9K8EpXVseGVnleC7T/tkn8XH23MGY+cAgNNEhNds=;
        b=QP0CNZ8PijHm/odDtzi3uAFRCyjC9zsYk3Ug9JGDq3v/bpXnfra7J/Qz7HUE4Y3914
         OokByLiaBBDglGJ48UPBc/dzWxl3SOeYz4UrCGExAOipkaznX/9Xk/ErvVKcGOuVa+b3
         flDEX8WHulcyAtrMfQH3T9wXrS5mvRuYMO59ClnjQPeWSBAdy8J/VO0+CMl4ZloxvTrf
         Mbra/gicSyuYdh9dAMkS0O8+1oY3lNu60OovF2t+D0KRLB3sxambSuJyiYkRz3+Dvoz7
         /+obgLecVqrXd1qELs3u+PVYZdEUPDG66EEdwBPmQtMXJvUv14XbQhba+ED9SsLGVASA
         EIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713914203; x=1714519003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aca9K8EpXVseGVnleC7T/tkn8XH23MGY+cAgNNEhNds=;
        b=s4d7D8caBuLPigEjj3LseJD+RmPZsv6586aeJZgCc2Ti15wukvHCOZGOJjXo6MRObR
         BxJMo50WVk6thmRyp4WgiMsTzjaiFv9ustddssuveMOq3YvQnruaHQTX88N3cXvDAIHG
         QLgOi81A7a2NA3+qSDNTuqMU9MV49S8IoBm8JWJSg7WsU+w7yZ1+050fPKKRkKkV4y8S
         JvAzcE5V23WvbB5sMn2QjD5rGBJ1JtJ539zKjMU4K+TFKn3UOW19OvHa9lKMEkKXWAvV
         cSDcmDfLRF41nO6+8C+4RyhL0c7u1SnA6RoSGSUOs/KXYiQKnoUOxLgCAJljHAo2uADm
         UaAA==
X-Forwarded-Encrypted: i=1; AJvYcCWhJEf4CU9t9OVMJaFssSU2NTaARXXCelLQvNvLFnXYy9m2GDVI89PzKd3C87tyP0JBXdAbToEp9JBMaB+TladEBRtQdY8Y0wNWM1Q=
X-Gm-Message-State: AOJu0YwIABwDvtUOjgCuHG4Nr8M9Hx1/nLKWP6aHpN75IgSYgHoG3Frb
	c8yln6PLV2wZi4Csm8ZZ7v1ikJuLztwQaWb5DAK0zAkRcbaC3cvUm7aG9ZbTZUbCXpJZqFDthzK
	PIfJkpqhF4DWbQFUjp4KB8Kw1ZvU=
X-Google-Smtp-Source: AGHT+IH10mlUfrVcAQ8LqIHHv7aiYPpNjEMy52tN6YA8d6VSedLkjWnBjwpaw//pCrnhLX3kZ6HsfrXhTzJKHNzrtK8=
X-Received: by 2002:a19:ca08:0:b0:51a:f3b9:f774 with SMTP id
 a8-20020a19ca08000000b0051af3b9f774mr637571lfg.21.1713914202904; Tue, 23 Apr
 2024 16:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423223309.1468198-2-aren@peacevolution.org> <20240423223309.1468198-4-aren@peacevolution.org>
In-Reply-To: <20240423223309.1468198-4-aren@peacevolution.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 02:16:06 +0300
Message-ID: <CAHp75VeRDSPvpmSbUyZPp0RMoTOE193U2ma18qxv_qZQKLCq8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] iio: light: stk3310: Implement vdd supply and
 power it off during suspend
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Willow Barraco <contact@willowbarraco.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 1:41=E2=80=AFAM Aren Moynihan <aren@peacevolution.o=
rg> wrote:
>
> From: Ondrej Jirman <megi@xff.cz>
>
> VDD power input can be used to completely power off the chip during
> system suspend. Do so if available.

...

>         ret =3D stk3310_init(indio_dev);
>         if (ret < 0)
> -               return ret;
> +               goto err_vdd_disable;

This is wrong. You will have the regulator being disabled _before_
IRQ. Note, that the original code likely has a bug which sets states
before disabling IRQ and removing a handler.

Side note, you may make the driver neater with help of

  struct device *dev =3D &client->dev;

defined in this patch.

...

>  static int stk3310_suspend(struct device *dev)
>  {
>         struct stk3310_data *data;

>         data =3D iio_priv(i2c_get_clientdata(to_i2c_client(dev)));

Side note: This may be updated (in a separate change) to use
dev_get_drvdata() directly.

Jonathan, do we have something like iio_priv_from_drvdata(struct
device *dev)? Seems many drivers may utilise it.

>  }

...

>  static int stk3310_resume(struct device *dev)

Ditto.

--
With Best Regards,
Andy Shevchenko
