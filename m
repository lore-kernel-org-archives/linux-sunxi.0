Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E678B50
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713193597; cv=none; b=HHvkMlmqxLtPDIx4hP7y0+f/P3GaC3hWAN9M4B4tobk1xW+1F7XW9aJ5IC9tKasWqXroGf00WoBpoCndd5BBjbKhAcPuxC+YMxLrhEF6Xt2UJXiuaa5I2lcS3STJmxIgycsG4A2WOOw5D1fGKKgAODGecIhLGa+kNjVYBmZ+9d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713193597; c=relaxed/simple;
	bh=mOsRfd5qxASFakmIqOXVcTvu3CyoQSRnAIxxp1fG+4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/BNzshQJSn5PVQ4JIVxOb0IASX1cUOvyv9KZa4lN4SNNBrCy707K7jXMcqllJEtGJ9MysmiGzGz2THQy6Y7Yfc7FCF50Vnb4EXMUAFf3hzGcGN7FwHRPEGKkrmLfj9aEiT0x7NXHuiYS0JaJcwH1ro7Z9W4vh51zMILRbLwAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inXSSxHf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inXSSxHf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a44665605f3so352467966b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713193591; x=1713798391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7/TBRaaPIPtSJDv4IMqFEGZB5oTZKPTNBkY3AEKti8=;
        b=inXSSxHfyHFNzKst/lH/tKiInDbyPC4R8ntTlV5CP6gVqVdYLYvBphXlbrGrxYWc3E
         6INiI3Je0rHPe1auKNW2ulIz5zJpC3FbxI0Onb+vTdLVdzXkuXze06+LWeqWpjMdtNHS
         AQmGc6vuQTk5uDEGb3WgBOnoFlbMgJg2xTIOgBmqB+dPeIv9REZiBjnf9qs2oz/r+iif
         iYFysNbGxdkDiDEXy6HKVtFbZ34ij33J1Q0u81u9zXOHaaoxnv7EqtdKV+q/vpqARBbd
         Id3dr3vcLzFLyDZz9SAJrS8rf7URdqkjBkD8izCBaHDBhhLxCqHk1fjlhUhXIgiBE8WQ
         /+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713193591; x=1713798391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7/TBRaaPIPtSJDv4IMqFEGZB5oTZKPTNBkY3AEKti8=;
        b=vHAwVLzAqtQqlr3ygMi4fha0IkKAZAuNHrKk4VfgpBbj+qD3q2ulcRNsFrP2Htt48t
         c1HXhiR8l51U0HyxS+r9LqI652esbxu9GhkmMORI/RN7L9fyDKd0iqxaCWm8W+OUL+i8
         z546kEjOcKJ/V/R68IKk/o2WtiBA6h8nJAtTLpy4pLWRPsOt8rv43U+c/pZttotrgD3F
         RQYhbbw3Efr5Rl3Ltum9+v6lzfgRPOeVlFHQhMpHgUtgsntJJWvBU6P0JNFgJpCNsvLH
         z8XUIXVdI4mYCadnZFVg9ZG29Vv3vzSFQmdFUm7PtUOsKEfnAdfXgPwBrBtER23zx5zc
         W/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWricDv8TwnMgqT/Nu/z0NWvNl3VZI8dI7X6keO1gtn6aLRVqq5xQPb23yHKk1EcRVIBl1ABHqgX9dDHPQDm+01Ru10h5qbf03T4LI=
X-Gm-Message-State: AOJu0YySHhZUFWKkVgaM8iKjHQcuxPfrYwzn2DDLQm2DUJpU1WaTa3Gf
	NfAYoEuG/g1UYzo1210s4fSI7xqblgwJ+gU3wztV5wbVuetmqbbjqXzM7fajYVssGqVL5LVnR4D
	3EF/JxNDYWX4O2G8A61E6kgi9d0Y=
X-Google-Smtp-Source: AGHT+IEZOaeQQWk/r3eJ/DbVb/nwCv9r/tKA3MdsC0SedQqpmw8jPxhTIbiLf3bZtwJnwgsZOK4XztHqpSaPZiAKWVk=
X-Received: by 2002:a17:906:3fc9:b0:a51:f915:bf5a with SMTP id
 k9-20020a1709063fc900b00a51f915bf5amr5280873ejj.75.1713193590873; Mon, 15 Apr
 2024 08:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240414175300.956243-1-aren@peacevolution.org>
 <20240414175716.958831-1-aren@peacevolution.org> <20240414175716.958831-3-aren@peacevolution.org>
In-Reply-To: <20240414175716.958831-3-aren@peacevolution.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Apr 2024 18:05:54 +0300
Message-ID: <CAHp75Vf_JX1Uv=_cvoiukzSaTVWbmQSW0P_nneP8C-kxX4fBXQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] iio: light: stk3310: log error if reading the chip id fails
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
> If the chip isn't powered, this call is likely to return an error.
> Without a log here the driver will silently fail to probe. Common errors
> are ENXIO (when the chip isn't powered) and ETIMEDOUT (when the i2c bus
> isn't powered).

>         ret =3D regmap_read(data->regmap, STK3310_REG_ID, &chipid);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to read chip id: %d", ret);
>                 return ret;
> +       }

Briefly looking at the code it seems that this one is strictly part of
the probe phase, which means we may use

  return dev_err_probe(...);

pattern. Yet, you may add another patch to clean up all of them:
_probe(), _init(), _regmap_init() to use the same pattern everywhere.

--=20
With Best Regards,
Andy Shevchenko
