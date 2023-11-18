Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50D1B27F
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzYJtg0C"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9d10972e63eso431931466b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700344235; x=1700949035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIuycvwcOtzj5a92tHoVOAi7oenZudHbZIioAcVhUH8=;
        b=KzYJtg0CZ290CGdV8VS49fiC094qwYmrlsvaiXMfLZ/+03VgaHxZ2QiSaxTSaqnF21
         AW+nOAYrkEmVWmLUOJ5mWyXEtsBOinAgKg87FUYQm7HaxzA7es2S4Ekc3p4QKiEQN3ON
         kvGQZ9/AV+P8XR7QT7rSoJeDxcy9A0WEJZYQg3PoJuv/8vBU9v+WY9W6SNiWXyPpJhM7
         stOiHM9DMvzH1juu7JY/rtxd3jQH+npOaUoWAy/gAX6yKBCeN9jK+Xln7pnMKA1ARTz0
         jcxF77sWApsTGvtar/DKEpfBxwuSz7daK7T4Rj8DTc6rQxHXi/MpTOsMgP97NjEMvAvl
         EMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700344235; x=1700949035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIuycvwcOtzj5a92tHoVOAi7oenZudHbZIioAcVhUH8=;
        b=WhZaeOVrB2B9V1X2gVxjn0WYH5kUPmmipk4F4/+Weq7Ky3R70bPKDXrS24UfM17fkn
         sSfC630WPZylMd6T2eacKpF/Yqhb88AV/AvltF9/q2knApgImARhw6ZsLkZ18cekkW/Z
         DZmSxLL+XRhSRtSkssTF2YXPM603/OOuSwMzn9aOb9cwTC1Q18zm4duvRTuEDb+ulW7e
         WKCM0BGGM8pLnZ849CMYTnOu5NUqlyHc4PnCMTZHfOdYZA732UKZaawEswifH7sfq1fb
         LAY3yh15oMqqAhqPxHUw3RtjZCOKn2CYg1yrF6jfk5W0uJW6RDYVDJbdkd1dZO3q3ACg
         2bYA==
X-Gm-Message-State: AOJu0YwEvqvLCtBb2bqsitqiEmyBFjIHd3i3XpGYKmry6BHbGNxBKiND
	IOPCOh477nLm9TI0dW/ojrE=
X-Google-Smtp-Source: AGHT+IHiK+AbaxW1Wc75IyiNhOW9ArhXV2tF0E1iEFOC758dB4Re3ICn5guoVvHiY5DBe7czrLcFtg==
X-Received: by 2002:a17:906:4356:b0:9c7:4d3e:1e50 with SMTP id z22-20020a170906435600b009c74d3e1e50mr2139036ejm.76.1700344234769;
        Sat, 18 Nov 2023 13:50:34 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m8-20020a170906234800b009bf94de8971sm2250339eja.70.2023.11.18.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 13:50:34 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject:
 Re: [PATCH 06/12] bus: sun50i-de2: Convert to platform remove callback
 returning void
Date: Sat, 18 Nov 2023 22:50:33 +0100
Message-ID: <5727528.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231109202830.4124591-7-u.kleine-koenig@pengutronix.de>
References:
 <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
 <20231109202830.4124591-7-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 09. november 2023 ob 21:28:36 CET je Uwe Kleine-K=C3=B6ni=
g napisal(a):
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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/bus/sun50i-de2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
> index 414f29cdedf0..3339311ce068 100644
> --- a/drivers/bus/sun50i-de2.c
> +++ b/drivers/bus/sun50i-de2.c
> @@ -24,10 +24,9 @@ static int sun50i_de2_bus_probe(struct platform_device=
 *pdev)
>  	return 0;
>  }
> =20
> -static int sun50i_de2_bus_remove(struct platform_device *pdev)
> +static void sun50i_de2_bus_remove(struct platform_device *pdev)
>  {
>  	sunxi_sram_release(&pdev->dev);
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
> @@ -37,7 +36,7 @@ static const struct of_device_id sun50i_de2_bus_of_matc=
h[] =3D {
> =20
>  static struct platform_driver sun50i_de2_bus_driver =3D {
>  	.probe =3D sun50i_de2_bus_probe,
> -	.remove =3D sun50i_de2_bus_remove,
> +	.remove_new =3D sun50i_de2_bus_remove,
>  	.driver =3D {
>  		.name =3D "sun50i-de2-bus",
>  		.of_match_table =3D sun50i_de2_bus_of_match,
>=20




