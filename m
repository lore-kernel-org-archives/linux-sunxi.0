Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258271CFA6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6izKHmc"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so12459771fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697810918; x=1698415718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMflfsDmr9yqToB8PqgOeqaiOA6GNOMvcqe9gF64FHI=;
        b=V6izKHmcPb6IM1U/aBw8D/U3SGC5qReCd+BRTy31eAkwmIqOHC22I+CW5TLkYSO4CE
         SFmhXS9CbOsDG5SXuDpIprbuAcMwZ/46lpEa0zncc0d2yDiaF+Bgqs1d7nUUnrIWtND3
         W6uJlDDocq/cXLN1A7iQTKp37JTDz/Hfofj40W1o+Eaj43Xa1ZAMfnHlwg5/vgyvqb5+
         2lq+Zd9YKpYZmmf8jJylX5pkecHEnSzeygwKWcqaP0BRGb3u+upVqTG48uN8aj20Z88n
         68VzkHW9MCxcMLowP4WUqVfRuY1y+yKfOuTxtgMzFVvnG7VMIwtGMutKdUASuPkMBosX
         COJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810918; x=1698415718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMflfsDmr9yqToB8PqgOeqaiOA6GNOMvcqe9gF64FHI=;
        b=JnXo0RJ0vzMsxqShBkSFf5z3SmI1qu9xmrW0x88KnaJE/R5f7VRIg/+M6EfgTx71NS
         eVryu1BE/blqlM/+WRKItL6shYN6j8iX1hwK5V4TTz2P1wY6XwQ7Ih7peeQp0gUcZSXr
         X3jHhOe/Sf2I9fR2xRdsz7lE2mo0u62oaRwcLxNW3HW4sVXsURpyM4kjPm4Gk1XuT04Y
         5DYpLCbQHTfnUoprFQU4Cs1s5jGFu5Cc1id3uZ7Y2fAUOkfY1g+yCXwrCQmZu0NdgOuA
         iaw1WLz7hxfcDvyt6nUBBOfkGmd6aN5xZogBv4tY2gA8oHaJMgBrNnscUeBxnct6AGBN
         Guyw==
X-Gm-Message-State: AOJu0YzmOdb9NKsGqlFSgQfzcnj3C5XWnIUgcI5ceePrlY5PYfzloiIH
	dwqUwCYU5K/Oj1MA0o1mVao=
X-Google-Smtp-Source: AGHT+IEtk/yAj3a8PCb0KZzldeCx2CbR79ZxGh0hDIudcXsx+etyQ8nDzlijIASYKTsxGNlegWLaLA==
X-Received: by 2002:a2e:9a8a:0:b0:2bf:b133:dd65 with SMTP id p10-20020a2e9a8a000000b002bfb133dd65mr1330993lji.38.1697810917790;
        Fri, 20 Oct 2023 07:08:37 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c130e00b0040772934b12sm6964862wmf.7.2023.10.20.07.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:08:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 01/42] crypto: sun4i-ss - Convert to platform remove callback
 returning void
Date: Fri, 20 Oct 2023 16:08:35 +0200
Message-ID: <4886899.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20231020075521.2121571-45-u.kleine-koenig@pengutronix.de>
References:
 <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-45-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 20. oktober 2023 ob 09:55:23 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 3bcfcfc37084..ba80878e2df5 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -509,7 +509,7 @@ static int sun4i_ss_probe(struct platform_device *pde=
v)
>  	return err;
>  }
> =20
> -static int sun4i_ss_remove(struct platform_device *pdev)
> +static void sun4i_ss_remove(struct platform_device *pdev)
>  {
>  	int i;
>  	struct sun4i_ss_ctx *ss =3D platform_get_drvdata(pdev);
> @@ -529,7 +529,6 @@ static int sun4i_ss_remove(struct platform_device *pd=
ev)
>  	}
> =20
>  	sun4i_ss_pm_exit(ss);
> -	return 0;
>  }
> =20
>  static const struct of_device_id a20ss_crypto_of_match_table[] =3D {
> @@ -545,7 +544,7 @@ MODULE_DEVICE_TABLE(of, a20ss_crypto_of_match_table);
> =20
>  static struct platform_driver sun4i_ss_driver =3D {
>  	.probe          =3D sun4i_ss_probe,
> -	.remove         =3D sun4i_ss_remove,
> +	.remove_new     =3D sun4i_ss_remove,
>  	.driver         =3D {
>  		.name           =3D "sun4i-ss",
>  		.pm		=3D &sun4i_ss_pm_ops,
>=20




