Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B445137171
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 17:21:45 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32167a4adaaso876653f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144104; x=1695748904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCW05DYPpdGYyJU3IE/oUGPdifsWeWp895tHny3FRl8=;
        b=cEhNXc6uEjXxizBz9ZLbhLYKGDv1QZZEOTErbBCCz38XRa40r4efgOso3u1adXWyfm
         oY4XugfAyuFX6GmpqtrVX62Q5zVoM2TRNWSVMghXPaSGiVn6pxeTMRjpYRDzdGeoaCF8
         pdkLnOkae+Bnt8SotZsBXzO0MUz0+mJ2YuuUDLKjTXiWiQEozw1whPej5i0/OFojiDlx
         8OcF/3qhv6pkIDbmFyno7VuIK8alH9ijdy/UG+/1ZA7qO4e0eUYNO31RRljauGXvSyIG
         afhJM5HGibRypI+dakXvJ6uCTgpdrtn/hA7rRquEg+OzfySoKmlcyKnI4TnYuMHnvn1v
         nhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144104; x=1695748904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCW05DYPpdGYyJU3IE/oUGPdifsWeWp895tHny3FRl8=;
        b=q8PHyl1P3SPmak1pyCPZVGW7lSdHHapryhgZVOfy3nVPtKihRg4Jm86reNwCqeOrKv
         J/6ulaKjsU23sKuA19Rs5Utn2Gs3yh4RIahylpq5zC744OC3sBK1yRhKoi3ljdnEY2tp
         0W3teKvXvUn+aOPjwsXroyEkIIG2xcsA7iuxviVj1fnl7wfVWTSOHsBSDepfgBoaRl1Z
         bbjqjpctB/nevLa+WiR/F6aY6SpLoPEOhNm2xRxRf0Ge3fGOAP1RriUQetiS9L7Fuaf3
         apSnZg83UpsnTBPAo2bDNFsG8duXoB+DDKMsw8lFmqXK7cbqQcyusIsfwDbHQ6UXsS7f
         xlzA==
X-Gm-Message-State: AOJu0YyVs50FkxtePkrWiFLVOqGSd8TtK1dWaPlt5LbKLwX1vcXpmG7Q
	HGPTbfe4BlZWWnQ7RKpNd4U=
X-Google-Smtp-Source: AGHT+IH2Km3ubh0lb33ebM1eHNMAYyqIfJqNboXqNuS/MKTzpkoELMt5NJJdos3JsfqGyHZjA2EDMA==
X-Received: by 2002:adf:e506:0:b0:319:8bb3:ab83 with SMTP id j6-20020adfe506000000b003198bb3ab83mr226937wrm.66.1695144103504;
        Tue, 19 Sep 2023 10:21:43 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id kg11-20020a17090776eb00b009a1a653770bsm8078550ejc.87.2023.09.19.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:21:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH 45/59] dma: sun4i-dma: Convert to platform remove callback
 returning void
Date: Tue, 19 Sep 2023 19:21:41 +0200
Message-ID: <1868017.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230919133207.1400430-46-u.kleine-koenig@pengutronix.de>
References:
 <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-46-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 19. september 2023 ob 15:31:53 CEST je Uwe Kleine-K=F6nig napisa=
l(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/dma/sun4i-dma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index e86c8829513a..2e7f9b07fdd2 100644
> --- a/drivers/dma/sun4i-dma.c
> +++ b/drivers/dma/sun4i-dma.c
> @@ -1271,7 +1271,7 @@ static int sun4i_dma_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_dma_remove(struct platform_device *pdev)
> +static void sun4i_dma_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_dma_dev *priv =3D platform_get_drvdata(pdev);
>=20
> @@ -1282,8 +1282,6 @@ static int sun4i_dma_remove(struct platform_device
> *pdev) dma_async_device_unregister(&priv->slave);
>=20
>  	clk_disable_unprepare(priv->clk);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_dma_match[] =3D {
> @@ -1294,7 +1292,7 @@ MODULE_DEVICE_TABLE(of, sun4i_dma_match);
>=20
>  static struct platform_driver sun4i_dma_driver =3D {
>  	.probe	=3D sun4i_dma_probe,
> -	.remove	=3D sun4i_dma_remove,
> +	.remove_new =3D sun4i_dma_remove,
>  	.driver	=3D {
>  		.name		=3D "sun4i-dma",
>  		.of_match_table	=3D sun4i_dma_match,




