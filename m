Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF108347B9
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 17:58:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99c93638322so15725766b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695146327; x=1695751127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1NRUeCHZVcU7vFnB9mFf3Vt372PLclrw8mQfXYBE3E=;
        b=ln0fqk/4lz5UX4+W6HLx83qCXggDwYXufxLzSsPTxk+gz+eyhP0RX4wV/OXZB/EfVE
         AwXQKnNaWUGIj8T+saJi7XhA5BeeWp2rKZykZXwJVUPCFzs74SlLl9ysqu42iTdsVDU1
         J57u4q1UFRa8U8709QBcEEdiEGgipGzS/tOaSaJGs6ZJgdtVLJncsCAs9VLbRJwCXbz9
         L1CnpMjf0yN5Imta05LIyp3ciWh2HomEAxsGyGb0xT7PykQxTPog2A7HKVUuk5qeygoM
         UPQArd8aNl3SHhNGXh6HP3hdHV+IPUD+u18M5SJjFKayyx7735bahgawv6v7MpsQy9YK
         npvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695146327; x=1695751127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1NRUeCHZVcU7vFnB9mFf3Vt372PLclrw8mQfXYBE3E=;
        b=IVpjDiLG07xQr2qwfUuKLOihJykHSF5odc9uO2OwfPpHihYp1pypUDL0ScOoFZ6to+
         YssruBUb7kNwn89WDHTQpXrhgS65vTZ68a2IBdwqYPWEPuqVoJAnBIlH4ScnKs/dMVxy
         jEEx0N+G5bvFQspuykREm8yToAQBQXwqsf69KYjq97G5wZLZL7BckLqzlcF9WaaSDIna
         WWR193/1WoPTAm647p+J6tv0/RONFBfTH9qCLdVU8Jhq4b2o4s7cnHTxwkSBngwjAF1c
         NkAauHKp1irnREvyf/uZKOsmpg9caEv/q7JYUmP3R/4ntgxlJdGdpnvqPLcF02yhxCIv
         cT4w==
X-Gm-Message-State: AOJu0Yx10N55gMcGECfQN/nBb943LGwpYYNPPzZFYJa0ha5XxFajLIK8
	44nPLWyraqPgvUFYW0IVMPI=
X-Google-Smtp-Source: AGHT+IEiBbBQwup9WppiUmb+sqxSKYGgUrzhNxvYEKeXarSza67dv9jMX7VWYr8RD6NZ6k7/WFS3xA==
X-Received: by 2002:a17:907:25cd:b0:9ad:e62c:4517 with SMTP id ae13-20020a17090725cd00b009ade62c4517mr4196555ejc.34.1695146326452;
        Tue, 19 Sep 2023 10:58:46 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7d5d9000000b005288f0e547esm7697627eds.55.2023.09.19.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:58:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mark Brown <broonie@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Heiko Stuebner <heiko@sntech.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 24/49] iio: adc: sun4i-gpadc-iio: Convert to platform remove
 callback returning void
Date: Tue, 19 Sep 2023 19:58:44 +0200
Message-ID: <2243607.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230919174931.1417681-25-u.kleine-koenig@pengutronix.de>
References:
 <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
 <20230919174931.1417681-25-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 19. september 2023 ob 19:49:06 CEST je Uwe Kleine-K=F6nig napisa=
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
>  drivers/iio/adc/sun4i-gpadc-iio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c
> b/drivers/iio/adc/sun4i-gpadc-iio.c index 25bba96367a8..100ecced5fc1 1006=
44
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -669,7 +669,7 @@ static int sun4i_gpadc_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_gpadc_remove(struct platform_device *pdev)
> +static void sun4i_gpadc_remove(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
>  	struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);
> @@ -678,12 +678,10 @@ static int sun4i_gpadc_remove(struct platform_device
> *pdev) pm_runtime_disable(&pdev->dev);
>=20
>  	if (!IS_ENABLED(CONFIG_THERMAL_OF))
> -		return 0;
> +		return;
>=20
>  	if (!info->no_irq)
>  		iio_map_array_unregister(indio_dev);
> -
> -	return 0;
>  }
>=20
>  static const struct platform_device_id sun4i_gpadc_id[] =3D {
> @@ -702,7 +700,7 @@ static struct platform_driver sun4i_gpadc_driver =3D {
>  	},
>  	.id_table =3D sun4i_gpadc_id,
>  	.probe =3D sun4i_gpadc_probe,
> -	.remove =3D sun4i_gpadc_remove,
> +	.remove_new =3D sun4i_gpadc_remove,
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_gpadc_of_id);




