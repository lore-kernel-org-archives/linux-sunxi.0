Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4C1C6BE
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713913733; cv=none; b=qaoUa6K1reDOY1ldkROcE9iuUq1wE+uqQKf5WPtTybFdzYSWMu8qwwne7rnWMgLFu+CwFk5phC6jC1UW64NnrVYQuKKeOd9B7E3x+bnePlB6l1XFrzZFZbgLcUhVMlA2IXkBJ/vPg9SEWF+R9+2hGNptgtXlNQt4twU9FQrair4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713913733; c=relaxed/simple;
	bh=mmRIkV2XMlCxj4R1CexxonFAsAeDGzYAWzEWtaDKnCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlqD3xW+CDbks0zu73CyQeoWGunbu6P35XhdIcEGk+nw71bxIRPSZ/yuEx9g6w+zOrtUOeApKykGPOrqhBCCC50xwTX9KSLViaucWHdKP9EZ2tq2To2Fqs0FClvFt+kwF5302BY22w5Ac5bMhzZ0/NWTB3IqsjcCdZ1IVzpbOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnoEmYTU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnoEmYTU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so7251193a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713913730; x=1714518530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOubRUxsYQ+p5re1HJn2aIjhIuCSgEkL2WgxwHltP6c=;
        b=PnoEmYTULaoRVFqB7a9qUq2IL96kEzTPz9+NEEQK/TzbKDesRvnu0uU1pfJ5Ch/Ds1
         BEEVP8xFbzCB7T4m7LBntmjUjfZuxSJ56Ba02LH+V0OZccwIqnVT6KpH7tbOce6oy73R
         3NYvSSD8ovrFpMixYlB8uVvljj0HpysCOzqjYMsNNod3RMlSK934+RwRk47J+saZ0/pP
         wL//731xDXe2Xuvt+nFgKOTIY1aVEqReExIHtXlRd1TiksMEqQyW89AICRdnfgMR5eW3
         FiE7CYx+KZv0N3Fw09l7hdT1wTtVyK/+CaZ08+fvxecr9n9x0VM9ehiXYaIMI2Z/mc3K
         SugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713913730; x=1714518530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOubRUxsYQ+p5re1HJn2aIjhIuCSgEkL2WgxwHltP6c=;
        b=qv2P9ujN+FCdWKMltxc8kMBcIN+JFDbP8pNbTvr1tEJPetdHNx/BewnQFCt36TvXs0
         kyqevRGdmLMUgqRe+vMxBkdSDEansSdSulTNZxVehPtQXIYMerTGrvjEvRIC0gO+XO7Z
         TqolaKSut0u6Uy6hJSQXan+rBkX64uTQV5Ts2q4qW6wK39czRHnIOCXztwW70kTA7K9l
         9N3UcsRQnYPDMqNQ2ZCLtSToO/Xdkpsc+vDEHDvjgVo2ESRmW+PlNoz11KvZ04l5X1w6
         jJTYA8QWvGGuJLgRYNCCV6jNLcHr3fa4QRtbr+g8+3BzA59FbQEwX9z6oyScYp3gKxuQ
         2PWA==
X-Forwarded-Encrypted: i=1; AJvYcCVOFtanRDH1NpsYLYJh4fJgNK0gATTCLmy0MXVw9p/+RHTWMBmkPcTpGjBr7+6B3QimwO5JRAT6RLth+9GvH04q/+g4bqnj0in6J7c=
X-Gm-Message-State: AOJu0YyTfcHoFvzw4UQlvfp2hj+SDZbEKk+7hz15lqHpaz9pxgbegKE0
	J/ie9USnhpzAhQPTmkaATg7t6N3LISs8l54m8pIO9cUWwAq2+Ze/EptiPjyd0XUAh+BN/w3dkHA
	1a4DrTvRYI2pZKQtkYd86peSxjfQ=
X-Google-Smtp-Source: AGHT+IH0I+fz392Yc9QQdmMfH48abnh5L/ReLRRQ4WhXNmBB/5ukEAf+sHnLvLjG5foXtSu/lNY/gm9SoFxlBu7Gy2s=
X-Received: by 2002:a17:906:aace:b0:a55:552d:965e with SMTP id
 kt14-20020a170906aace00b00a55552d965emr467140ejb.6.1713913729829; Tue, 23 Apr
 2024 16:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423223309.1468198-2-aren@peacevolution.org> <20240423223309.1468198-5-aren@peacevolution.org>
In-Reply-To: <20240423223309.1468198-5-aren@peacevolution.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 02:08:13 +0300
Message-ID: <CAHp75Vcp=-T2135s3rVbpQzcG=iiieit+L0BgnmoZet_AsbgcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] iio: light: stk3310: Manage LED power supply
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
> The stk3310 and stk3310 chips have an input for power to the infrared
> LED. Add support for managing it's state.

its

...

>         if (IS_ERR(data->vdd_reg))
>                 return dev_err_probe(&client->dev, ret, "get regulator vd=
d failed\n");
>
> +       data->led_reg =3D devm_regulator_get(&client->dev, "leda");
> +       if (IS_ERR(data->led_reg))
> +               return dev_err_probe(&client->dev, ret, "get regulator le=
d failed\n");

Can't you use a bulk regulator API instead?

--=20
With Best Regards,
Andy Shevchenko
