Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF46C8ED
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 16:07:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53136a13cd4so3939848a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695226042; x=1695830842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekSqycYp4RwH4ZHstWy56AGx1vKb/jqJ8VujViJUQjQ=;
        b=iJaaTFfTic7t0RXqFb1fVQXqJJ6QXjsxtZznHBMCvuImH/uOcGs4pdjfKIUtF9l2sl
         4hoH9PIaest4m9FkWb4VQquJ2vIWei9qLhhA8xYNE+OHer8zIMEBxF3FJq+MV+UTqZ00
         o/NnMR9mn7XXqPRehPUU+T6yxkdSgMdQiGoGb0WZnJ4HiyqGtk8B8qCpzq0cbhWeCp2I
         kMKA4tIdsfY637OAGwUtEOHvC/6jCnDKeRU1BWVSvW7c4oDesLTjU4dg0FNYAUWFjE45
         sLgmbq61GrO+IVzwA4Z0gGhsrWCpKJBzyd6pk8VZrrQ2/4DpKJf2foMlNBPAg/oMvZlc
         zgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226042; x=1695830842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekSqycYp4RwH4ZHstWy56AGx1vKb/jqJ8VujViJUQjQ=;
        b=bbnTZzZ/dhhokq4gvDoAJVO2nbLywxNuPtwv31mg0l1Mf+8qmb1j2Ob0YiY99buBnl
         OJDn1HZYYEFw59UmSZVUTRsj8iY/MJQsdLkeYjfmJ6iqPYn2LlyK6SgIdKLAFBoHQUim
         hyMJ1yaGSDUWrNkk24lbvCIMuo3ciiXPdjDOwYW+K/64pnIRbWhyXwFZe4Or3BAh+CeY
         cZ/FwnLBam7m7eVfYB27ww6POzWomZnllV9mqZR2oDMW+Ejn7dtoHDXm8G1I9Wh9ny2A
         o7TyneAWQKt1wbYYxybKuUeHuhI8AU+6LYSJBhHVNZK4ajmi2Hajt+oz/79yk4sOBBze
         5YMg==
X-Gm-Message-State: AOJu0YwiiFw+J8+pI4WPFRU7b67X01P+/IIBGh4ebBYs9GuulxZgUTj7
	8mznHN6A9xH7RqXD1mzRktM=
X-Google-Smtp-Source: AGHT+IGMv0ZtJsEgJtZM/5dYCyyx1ISAg5ccS+2o7Y0ZtAsAUjUiusDZNZo4TvmOYcyMmJW10Tts6A==
X-Received: by 2002:aa7:c7d6:0:b0:523:3754:a4e1 with SMTP id o22-20020aa7c7d6000000b005233754a4e1mr2372527eds.22.1695226041144;
        Wed, 20 Sep 2023 09:07:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm2415478edb.66.2023.09.20.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:07:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 49/52] input: sun4i-ts - Convert to platform remove callback
 returning void
Date: Wed, 20 Sep 2023 18:07:18 +0200
Message-ID: <22023189.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20230920125829.1478827-50-u.kleine-koenig@pengutronix.de>
References:
 <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-50-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 20. september 2023 ob 14:58:26 CEST je Uwe Kleine-K=F6nig napisa=
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
>  drivers/input/touchscreen/sun4i-ts.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/sun4i-ts.c
> b/drivers/input/touchscreen/sun4i-ts.c index bb3c6072fc82..92b2b840b4b7
> 100644
> --- a/drivers/input/touchscreen/sun4i-ts.c
> +++ b/drivers/input/touchscreen/sun4i-ts.c
> @@ -375,7 +375,7 @@ static int sun4i_ts_probe(struct platform_device *pde=
v)
>  	return 0;
>  }
>=20
> -static int sun4i_ts_remove(struct platform_device *pdev)
> +static void sun4i_ts_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_ts_data *ts =3D platform_get_drvdata(pdev);
>=20
> @@ -385,8 +385,6 @@ static int sun4i_ts_remove(struct platform_device *pd=
ev)
>=20
>  	/* Deactivate all IRQs */
>  	writel(0, ts->base + TP_INT_FIFOC);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_ts_of_match[] =3D {
> @@ -403,7 +401,7 @@ static struct platform_driver sun4i_ts_driver =3D {
>  		.of_match_table =3D sun4i_ts_of_match,
>  	},
>  	.probe	=3D sun4i_ts_probe,
> -	.remove	=3D sun4i_ts_remove,
> +	.remove_new =3D sun4i_ts_remove,
>  };
>=20
>  module_platform_driver(sun4i_ts_driver);




