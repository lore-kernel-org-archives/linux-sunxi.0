Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8301DDE4
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 15:13:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so1516707e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689261227; x=1691853227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44HyigfAUkqwYUlLZw+/R4+Jh04cH37c86hvLASsvR4=;
        b=Sd93XYTjxMgJIu8OY19hVkpV69Z7vs3OEsJXRpbpVWVHsA+XGQN6DAmvLo4Rr4qXWi
         cmiPbBZ2fKvtc0NFQQyTgkYKlAt12PTSCNjQsSppg657tk9qpAatPTvyLZHLaJKB4B4P
         7cDVvVQyyhKSnjtV2DkZVIdsCnfzEImF0m6swA7nR34g+knlBzMo/zGZCa8T0vxFa6Fb
         RpCH9eri5vmJm7lxZMhB7HEG1B23nc8hWO019qnZDfJ/DAUvvrql61IkC3Xm6L33wEav
         nLnahjxcry0YrcIGJBm6BM4qNXThY5ja6m+49C9/DXetSsriifAlRFVJv5qf7LzYOjDm
         xknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261227; x=1691853227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44HyigfAUkqwYUlLZw+/R4+Jh04cH37c86hvLASsvR4=;
        b=kY7QM8PENObMlVkZSF4CT6ldciLMSK9Z9+aVzFMhdE+lsqFEhd4VvBZhZGI5vCdT1n
         arYGqL3DNTUt/Qfh50uuQz2UCzBn6oCP+ukV49C+JENf9T4qsvlY4uAcjZcU2PuVssjL
         yQlGdnt4PDHQ1lWwMN9gyvG5kkAhuQgUIJnBzgLlIKYbaP6F7UfV8k1/bQYkM82oCBBd
         /nbcXct6PwJXPHclZJLQD1kj8eMoP+Zo/i/splBaxebOZyi8ADP5Sre+2zxC7DYBf1Kl
         WLruDwWhtg1c/4cko/24o1LVIWdi3PY5w84D4FeD7E2c1SSublDNzkbLAaO/NAbXVmvn
         l8Tw==
X-Gm-Message-State: ABy/qLaJu17tMONIKlaRMLObJpJeIM8Sz0QzFYIWEAUThw9SYHRsMcFx
	4OYYcO0mCZgnYqxJVRB393Q=
X-Google-Smtp-Source: APBJJlGttrq9UjDyoQktxgtCKagMhPdmnv/nWHqDmUvYq1WIllLwFO72WKYQb5Bue3tVDQ43/6XAOw==
X-Received: by 2002:a05:6512:39d2:b0:4f3:b708:f554 with SMTP id k18-20020a05651239d200b004f3b708f554mr1705282lfu.47.1689261227080;
        Thu, 13 Jul 2023 08:13:47 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j20-20020aa7c0d4000000b0051d9ee1c9d3sm4444448edp.84.2023.07.13.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:13:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 01/58] mmc: sunxi: Convert to platform remove callback returning
 void
Date: Thu, 13 Jul 2023 17:13:44 +0200
Message-ID: <5691053.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230713080807.69999-1-frank.li@vivo.com>
References: <20230713080807.69999-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 13. julij 2023 ob 10:07:10 CEST je Yangtao Li napisal(a):
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
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/mmc/host/sunxi-mmc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index 69dcb8805e05..d3bd0ac99ec4 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1486,7 +1486,7 @@ static int sunxi_mmc_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sunxi_mmc_remove(struct platform_device *pdev)
> +static void sunxi_mmc_remove(struct platform_device *pdev)
>  {
>  	struct mmc_host	*mmc =3D platform_get_drvdata(pdev);
>  	struct sunxi_mmc_host *host =3D mmc_priv(mmc);
> @@ -1499,8 +1499,6 @@ static int sunxi_mmc_remove(struct platform_device
> *pdev) }
>  	dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host-
>sg_dma);
>  	mmc_free_host(mmc);
> -
> -	return 0;
>  }
>=20
>  #ifdef CONFIG_PM
> @@ -1556,7 +1554,7 @@ static struct platform_driver sunxi_mmc_driver =3D {
>  		.pm =3D &sunxi_mmc_pm_ops,
>  	},
>  	.probe		=3D sunxi_mmc_probe,
> -	.remove		=3D sunxi_mmc_remove,
> +	.remove_new	=3D sunxi_mmc_remove,
>  };
>  module_platform_driver(sunxi_mmc_driver);




