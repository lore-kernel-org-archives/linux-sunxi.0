Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130553AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 16:05:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id fd5so43634840edb.7
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYGX99pO1QhMCjaMfA2tt6x0aDGPLDNKPraVBhA8mfY=;
        b=OLQvLwhqfZHoCdUd/CB/heb6Rkub5zLWqQ38FphV9KG8d+V2dnKGE7Bxfw22JsCW/E
         gVMJose6qpqyl3T3eZb0IpEVaKi2c+Ci3EM560ZAyfil/YUE41QJBT8+m96IUCfripPt
         Ofctldl7TlC9G6UqCH8PolRbTmhmYStv5U+j5fCHM2uBzS4Q04ACs/vyGP7hnezZiSJv
         TL72vXaeZXEDWMdcaLJW+t/4PTcQ0NQsDVtvemmGH0GQ9JKMoGq65FNZ/T92/ibbBCI7
         hRRHXCEBFirLBfq8zxBlCannFFvVZVbqO89r0rfcixvjNo++uaHeFcaFz4osjuwZRhgw
         Wbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYGX99pO1QhMCjaMfA2tt6x0aDGPLDNKPraVBhA8mfY=;
        b=chYLAsUf8r7oGE2fwHcZwAkHhY5jG1EtaAfRDesfAWdtGzC4CW7aU877HhuNG64/zb
         pvzaRDLkpFxLrxjh84kIyjpT68s+MZjD+QOrLItiuGCH8LIVln/W5S9D5mAM6k6PEQXY
         d3dAGK0LHWqFNdTrAU1JPpPM6V2adzmhj0fwOMIjIzVx9RVADkOlcccqrsjWqEhLFkHt
         YVkKhPI4+Zz4JVAtpLguJfElzVJgy8NSD3kwW9RF3x3Cl35uN8gqopkxun/6hgRSUxcu
         rnhhIM93c4+N8dQ7j86T4fpOIE7uHal4WL8WPNXqCy/XLwLduUP7TnrS3ue/1FVpw1Mf
         9mCA==
X-Gm-Message-State: AO0yUKWVB3pyubL49QiSGHOyhfGVtJ0j83AIrId8JCaLYDdn0mmTXP1/
	LVPD9rjrTM/TMFfo0e6/wEk=
X-Google-Smtp-Source: AK7set/5iYiiCkiPNXJhp+k6XG0KokT/w7XIYCxSgGW7s6z/i1G3KHv3tbWMDV5m8dnbU+bgoCcLsw==
X-Received: by 2002:a17:906:4c4d:b0:888:db6b:5fa9 with SMTP id d13-20020a1709064c4d00b00888db6b5fa9mr8133172ejw.67.1678896325683;
        Wed, 15 Mar 2023 09:05:25 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id dt5-20020a170906b78500b008e82cb55195sm2704185ejb.203.2023.03.15.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 143/173] ASoC: sunxi: sun50i-dmic: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:23 +0100
Message-ID: <4127320.1IzOArtZ34@jernej-laptop>
In-Reply-To: <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
References:
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 15. marec 2023 ob 16:07:15 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun50i-dmic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index 069c993acb31..c10439b9e0a2 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -373,13 +373,11 @@ static int sun50i_dmic_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun50i_dmic_remove(struct platform_device *pdev)
> +static void sun50i_dmic_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun50i_dmic_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct dev_pm_ops sun50i_dmic_pm =3D {
> @@ -394,7 +392,7 @@ static struct platform_driver sun50i_dmic_driver =3D {
>  		.pm     =3D &sun50i_dmic_pm,
>  	},
>  	.probe          =3D sun50i_dmic_probe,
> -	.remove         =3D sun50i_dmic_remove,
> +	.remove_new     =3D sun50i_dmic_remove,
>  };
>=20
>  module_platform_driver(sun50i_dmic_driver);




