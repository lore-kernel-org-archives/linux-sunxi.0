Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA5B53AB
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 16:05:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eh3so21603688edb.11
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Mar 2023 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myjMOOaJx/Yyy4X1X4K5C1WLJmP+rbBydBL5hzDI24I=;
        b=Py9CPpKMCCbnztwqW3NSxXw3CBM+Stxv1hc87DRMM6fy7O5/1CPhw2+eQncKjw6fVp
         tM1am1nqJCvoYP6iPyx2lGZEh3lcq7MHqnvMUOUTbWJaesmjCYW02fOsFWrgY2BcFKIX
         TRTZfV/2sL4WLZztWZHQxW1OtDSgkvELiLBeRugs1UKp9r5JhPGNvyORfT7nARDA3Z/1
         9UqqHhG2vUhrqULX4sXASbyPPrDHwcYbHH/5lHBDwsIs6MHkmCFxpcz1NUOMNSe8LX7X
         XaEFrimDa/2tAAvyF93DehWX9SfbYJ5lFH4wsNC16FS+4oxvh44ajd/sTHDmn108Y+Ki
         Xg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myjMOOaJx/Yyy4X1X4K5C1WLJmP+rbBydBL5hzDI24I=;
        b=dcWzmswnyL9p/InlS4KKar3aYtxlYvYIhCzgZBEhBGwAs31EOs+liqiayi6IV9RfKQ
         WwbAZvS/lbhDIBZvCK2eJSgl5rvg541FSLU68zCcinrQ11sL9SmKPqZQDyUYHOztS+dL
         hgskl/YH5XFCFC7bgTIan802XjYyzKUQOBiJ00yItGNVeAKgcN6LV5WG6Mig3XjC6BBF
         Gxzu8tBn+WNK71p+CtgNovCWykCUK5nBpNdHp3Ino2h2EsOjaHf7yj/LxauSJJjh0NoF
         ml7/eydoLFBDPOy6UQk9jhBsv0SA7rsiwqk9fWINvsCLpRN2B04mhMweTI0Y+kZ8TWj2
         bVKg==
X-Gm-Message-State: AO0yUKViPc6aPLQmt40n0oXyYN1Zot1SHxi0JnILc/Hxbq01sVeaHNgR
	xlUmI7rTfOHJsgePSM3B4yNvJi3W/LqryA==
X-Google-Smtp-Source: AK7set9DU+m9BN6GX71+StLcOLYTPk/4jOJqYqVt5X6yccV+p4wkWAkWqBWC164NI+nirv6R2J+sgA==
X-Received: by 2002:aa7:d49a:0:b0:4ea:b218:f7d3 with SMTP id b26-20020aa7d49a000000b004eab218f7d3mr3524450edr.10.1678896341758;
        Wed, 15 Mar 2023 09:05:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j29-20020a508a9d000000b004fe9253e923sm2188748edj.83.2023.03.15.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 144/173] ASoC: sunxi: sun8i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:39 +0100
Message-ID: <1771389.TLkxdtWsSY@jernej-laptop>
In-Reply-To: <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
References:
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 15. marec 2023 ob 16:07:16 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun8i-codec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 9844978d91e6..4c0d0d7d3e58 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -1349,13 +1349,11 @@ static int sun8i_codec_probe(struct platform_devi=
ce
> *pdev) return ret;
>  }
>=20
> -static int sun8i_codec_remove(struct platform_device *pdev)
> +static void sun8i_codec_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun8i_codec_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct sun8i_codec_quirks sun8i_a33_quirks =3D {
> @@ -1385,7 +1383,7 @@ static struct platform_driver sun8i_codec_driver =
=3D {
>  		.pm =3D &sun8i_codec_pm_ops,
>  	},
>  	.probe =3D sun8i_codec_probe,
> -	.remove =3D sun8i_codec_remove,
> +	.remove_new =3D sun8i_codec_remove,
>  };
>  module_platform_driver(sun8i_codec_driver);




