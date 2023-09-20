Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D4C8ED
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 16:07:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9a65f9147ccso923016466b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695226051; x=1695830851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q835YQDxM8a/Ydr2pG5h6K5+mFIlQ7bWDlpZnNz4kb4=;
        b=YVOWjTvtQ8ppPL/nsvnm7D+5/IM1jRrqBzOStA1EywrZ4xr7vtESAWxWfGMbIsVJLz
         5ZoPmQZyNE4DpxjdH59D8q7W2CdO/UXUyiwbQGRocHe1FEs13RH4m20j04h0nFXiujlG
         2cr9eRpth4IHOUyEjg1/E01mcvgTRShJwxuyRD/nxyLunikyWTBK50EWrABJtKg8p5Oz
         WrF1BYBUBL/p22nicbz/EX3sVhOzDidTfkTYOxekAscEjWkq79Z/7gdwkX1rqoUOZWri
         tIo93D/iZw0ZvboI/+lM9aXyeYaBx5elS9zS0Jqzysfi1TfGrqUQaDJhoVW5m9lvtJEx
         0mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226051; x=1695830851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q835YQDxM8a/Ydr2pG5h6K5+mFIlQ7bWDlpZnNz4kb4=;
        b=uzHyqSjBHHe0AGRrsF+Kfn0R7ZbTqaOIYkn7YnvmqlVpwi4aAxZDSvzAgLiQlHZSXz
         WnYPyB0vAlE7Su7kAsi9Gw6nOMJY0Jha4PWN72WI3kH0rFZpftsLelAkNaE56nyEvpxb
         kxbfrdTyuRsw3fE0toIZwcD0pyPkItILzgvetQUI4gulsmW/Jr+8jXSTFVD0LsOLjQES
         1ceJX+IOTidHNffTUuKihx24bIT42H7xQORm/ITC351DfXSIKoxbLfzvcuGV953P1Z6X
         LAExPbg4gp1cLG7YXcjCbsAlfGqu0IEotePr2b9Gn5wRtu8bqIcP/4eqOeGpiU1kw2ug
         FEkg==
X-Gm-Message-State: AOJu0YzV/qMNQ5lb4wyS2oHJBOcM+tom3iLdVSmnAndoWfRhnrOKcFIC
	mI6bMVqwYEVbRA11YSQMZBE=
X-Google-Smtp-Source: AGHT+IF+rmJKa4uB821gWE6ZlcCqFgyUhV7B2Ym02NESinzdpuwM0CQ3PlLZxaP3wSctTJ6kAsqMhg==
X-Received: by 2002:a17:907:b609:b0:9ae:61d:4248 with SMTP id vl9-20020a170907b60900b009ae061d4248mr2345778ejc.48.1695226051345;
        Wed, 20 Sep 2023 09:07:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id y15-20020a1709060a8f00b0099cb1a2cab0sm9464544ejf.28.2023.09.20.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:07:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 42/52] input: sun4i-ps2 - Convert to platform remove callback
 returning void
Date: Wed, 20 Sep 2023 18:07:30 +0200
Message-ID: <3766083.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230920125829.1478827-43-u.kleine-koenig@pengutronix.de>
References:
 <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-43-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 20. september 2023 ob 14:58:19 CEST je Uwe Kleine-K=F6nig napisa=
l(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/input/serio/sun4i-ps2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/serio/sun4i-ps2.c
> b/drivers/input/serio/sun4i-ps2.c index eb262640192e..aec66d9f5176 100644
> --- a/drivers/input/serio/sun4i-ps2.c
> +++ b/drivers/input/serio/sun4i-ps2.c
> @@ -297,7 +297,7 @@ static int sun4i_ps2_probe(struct platform_device *pd=
ev)
> return error;
>  }
>=20
> -static int sun4i_ps2_remove(struct platform_device *pdev)
> +static void sun4i_ps2_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_ps2data *drvdata =3D platform_get_drvdata(pdev);
>=20
> @@ -311,8 +311,6 @@ static int sun4i_ps2_remove(struct platform_device
> *pdev) iounmap(drvdata->reg_base);
>=20
>  	kfree(drvdata);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_ps2_match[] =3D {
> @@ -324,7 +322,7 @@ MODULE_DEVICE_TABLE(of, sun4i_ps2_match);
>=20
>  static struct platform_driver sun4i_ps2_driver =3D {
>  	.probe		=3D sun4i_ps2_probe,
> -	.remove		=3D sun4i_ps2_remove,
> +	.remove_new	=3D sun4i_ps2_remove,
>  	.driver =3D {
>  		.name =3D DRIVER_NAME,
>  		.of_match_table =3D sun4i_ps2_match,




