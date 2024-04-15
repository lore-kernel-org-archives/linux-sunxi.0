Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F373500
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189936; cv=none; b=N3XJChAolsG5p8DQOuiKV0WDQ7aVVIC2w/Ck4V9u1ysE0RHoOIHgvyyKLJuujHQafcD5KGOLV5tqX2GKjAakhTmZQxHsPogFb4JILAZ2BLEw3m8F5s4xkyNwgDASMI7KMyovA3ioM2Plp6fisfLBttsc0QekFrdNLmH9vrRn2FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189936; c=relaxed/simple;
	bh=C2RaXFcuh6uhrQqFZdquLpLy57EbGKkPUni9Jf4Km8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQPDm4x5IosXjz312JCq5OUHq9IJV2631BLzYVNQDkl5TG8QANgKSyMDhsIKA8weBO5ZXyIAtG34F88QZGUvwT765EHIhMNcDInMJzxpxPOAKIMBlix0Zkn69KeUkcs1Lr9q1JCf3vROxUvd2aSA3l9VKT++PUyEkP3HIuMVd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8IcsbhS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8IcsbhS"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a52223e004dso361923766b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713189929; x=1713794729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce+RZRNdvY2/c7BMbLG8IKG8g7W50m+r0bqN56BPld4=;
        b=C8IcsbhSqy7cw/r2L26kYjTJ9OC6Gr3/tJFFDY4v1gYEkGS/pLzqgeB2IO4qND31XV
         bH876z+J8VxbHZJePVUHhC1KotiTyz3nHBemN4Qvf0LZUXlC3msUZJu2j26sVyJqFxD4
         asVGoRqFbXMtI5aCHMord8Hf3HIEoqPe1oP8J6qmEEtoJ9JvhZDDOM30qT0zZJ1GKJJi
         M0HMVTrzDdRieUHDS2F14AFpjSaHYdMoeuvGoT7vU5mg2EVz1rHD+w6EZrNvRxgAIEMK
         BLQcOz5frVT7a9MAD0gdx8XAHf2Bd0JfiZsZ7bt0We7C++wClaoUzX3PF7rsas0aaOuo
         fBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713189929; x=1713794729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce+RZRNdvY2/c7BMbLG8IKG8g7W50m+r0bqN56BPld4=;
        b=vf47YQaqpcGWyX4ut300SOZnl75ZGpRZ9aTRpAyw+XY/A+iZGAbdMRCXrheQlgNoBe
         nISzOUIXDkjReuzsYockBbNuN3WYjYZ9+Vb6RJsXKZnpGoXemKogSkfDy9nwP16SSpuJ
         DBgshb+1iDihWJVVA7J/FdbzvXhS1AhZsyWKM4I9hwbeM1jWxGi/m0LFbbm15ur47CC8
         cX1oJjF+UNr7ZCvO7c8Oc3Wq7QRqNnEI2/BOVb5+oYlt9rEM4ny3tzuV9fR/cqcRTBsQ
         L7gOFmbZjWCNRdwJbH73wE8QyX+YxxWqGrmvbYQ31avpDZGYt46XtuLPdFPvDPkPgK0M
         VGgw==
X-Forwarded-Encrypted: i=1; AJvYcCUo49dePZp/EkEKn8r4dilhNFSqfjIvdhNEDBG2esUmyA2zML4K2kvTuf42v/C7FluiCEGOCuFQ6Lu78XF3rLvsUWe+iyJQLQUzJso=
X-Gm-Message-State: AOJu0YycXHu0ggi15L0NCq8AD5ToWIsTYcMtRZGB1/rDwxEaobMSV1jf
	81iL6PzGAGqW/7BjKkVQim4YvsBoJO3QKlDC2vpCyjluby6S2aszPq4d6UzgbcoBnIHziMYJZCG
	1S9MIJ2xl9p5uh4iYyrhIP9t2oMM=
X-Google-Smtp-Source: AGHT+IH86wMUY1Sjlbl77b74h8OkFHcq+fDgDK9uWIRulsSWUGwrIz3dHKroKOaN9XoU6ownWtnCcV0AOUGrp658hc4=
X-Received: by 2002:a17:906:1355:b0:a4a:3441:2e2a with SMTP id
 x21-20020a170906135500b00a4a34412e2amr6807358ejb.55.1713189929060; Mon, 15
 Apr 2024 07:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240414175300.956243-1-aren@peacevolution.org>
 <20240414175716.958831-1-aren@peacevolution.org> <20240414175716.958831-2-aren@peacevolution.org>
In-Reply-To: <20240414175716.958831-2-aren@peacevolution.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Apr 2024 17:04:53 +0300
Message-ID: <CAHp75VdZavToGYqLYnkKYt53HXoQxXnRER5Cn5b2==gWTvkAWQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: light: stk3310: Implement vdd supply and power
 it off during suspend
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

On Sun, Apr 14, 2024 at 8:57=E2=80=AFPM Aren Moynihan <aren@peacevolution.o=
rg> wrote:
>
> From: Ondrej Jirman <megi@xff.cz>
>
> VDD power input can be used to completely power off the chip during
> system suspend. Do so if available.

...

>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>

> +#include <linux/regulator/consumer.h>

Move it to be ordered and add a blank line to separate iio/*.h group.

...

> +       data->vdd_reg =3D devm_regulator_get_optional(&client->dev, "vdd"=
);
> +       if (IS_ERR(data->vdd_reg)) {
> +               ret =3D PTR_ERR(data->vdd_reg);
> +               if (ret =3D=3D -ENODEV)
> +                       data->vdd_reg =3D NULL;

> +               else

Redundant 'else' when you follow the pattern "check for error condition fir=
st".

> +                       return dev_err_probe(&client->dev, ret,
> +                                            "get regulator vdd failed\n"=
);
> +       }

...

> +       if (data->vdd_reg) {
> +               ret =3D regulator_enable(data->vdd_reg);
> +               if (ret)
> +                       return dev_err_probe(&client->dev, ret,
> +                                            "regulator vdd enable failed=
\n");
> +
> +               usleep_range(1000, 2000);

fsleep()

> +       }

...

>         stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY);
> +       if (data->vdd_reg)
> +               regulator_disable(data->vdd_reg);

I forgot to check the order of freeing resources, be sure you have no
devm_*() releases happening before this call.

...

> +               usleep_range(1000, 2000);

fsleep()

--=20
With Best Regards,
Andy Shevchenko
