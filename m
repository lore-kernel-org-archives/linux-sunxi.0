Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA3453AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 16:05:07 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x13so30170885edd.1
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrfavOiI9RHFnuLIIn9fSoym+hJaH0KWDtFZHQ7FhFE=;
        b=GYgwADQDRBv/KWKhXsXUcAUFhDAgznha4R9pZMM9lDygOvRsskp2sjqb5eGtcIsRjb
         +BQBH+S7c2+bFJrgEcsJ33lmxXF+xaHV+Zf6R1acx0kd4THA11wrWaDE2PS71ADw1nhn
         Zx65qJONgMbEaCHuppuPpK/f19Y0eRvpyxKFsy2BYQpLOWC1Mysn+5xwS+qj0OBSMovR
         Uao5l7U1tmHILuzCEi0wR413TLsrQz3cmOUWwtDxd4w6T4wD/oEOOPpUwbCuBoECppEq
         vBHqkwqTycHcEvSf+HIIuFtDOtNKeTswqPcdwrlIsB2rmFNZOi/+cUOYLoGfJBl78Au4
         pr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrfavOiI9RHFnuLIIn9fSoym+hJaH0KWDtFZHQ7FhFE=;
        b=MCGLBeKIIAnu3dZ+ww7RRdsyfJuAc2LTvE16uGNWtCcrQQEoJ7UC92CUtUHhym0nEt
         +1vxrwAkg6BGdHWyV61KeqL//qHql4eVc6WzYxnH86VfBHxW5EMaovIJt0cPGPgF99ci
         mJuJAdXfHo87vzTvWXzz5mPnuvb4AEidkdO/G0XZkaSa9hrpI3q/aNmT7+9V7TeJo1jY
         9R58YvmWz5VfZvasZsog7qDFdQ4P++sFL7CgNQ2yqPYNQzmYILbXsRqu2A9HoAEjwI6Q
         WC8GIk62ovKtjfKvijnvbRV4mTClE8OLos3Rudqj8z7GHgSwecXEupD4NkZm+S01pZQ6
         WFQg==
X-Gm-Message-State: AO0yUKWm9+czKzgqSggrpbOv46SJJb/ZNCeX40yalN8H2VN6DwVBpl1t
	nJAAohlmMWWX0tyD047KunI=
X-Google-Smtp-Source: AK7set+myhS2q8BMTQLFMetCV+tCvu86Y0EnLMDAIQz6lrKoBkjoRsSEoQr/z5hKWoUoEpc8DQ+YAQ==
X-Received: by 2002:a17:906:d211:b0:926:9c33:ea4 with SMTP id w17-20020a170906d21100b009269c330ea4mr7175408ejz.27.1678896305325;
        Wed, 15 Mar 2023 09:05:05 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090619cb00b008b30e2a450csm2714894ejd.144.2023.03.15.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 142/173] ASoC: sunxi: sun4i-spdif: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:03 +0100
Message-ID: <2745562.BEx9A2HvPv@jernej-laptop>
In-Reply-To: <20230315150745.67084-143-u.kleine-koenig@pengutronix.de>
References:
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-143-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 15. marec 2023 ob 16:07:14 CET je Uwe Kleine-K=F6nig napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-spdif.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index bcceebca915a..ff18d4113aac 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -703,13 +703,11 @@ static int sun4i_spdif_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_spdif_remove(struct platform_device *pdev)
> +static void sun4i_spdif_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun4i_spdif_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct dev_pm_ops sun4i_spdif_pm =3D {
> @@ -724,7 +722,7 @@ static struct platform_driver sun4i_spdif_driver =3D {
>  		.pm	=3D &sun4i_spdif_pm,
>  	},
>  	.probe		=3D sun4i_spdif_probe,
> -	.remove		=3D sun4i_spdif_remove,
> +	.remove_new	=3D sun4i_spdif_remove,
>  };
>=20
>  module_platform_driver(sun4i_spdif_driver);




