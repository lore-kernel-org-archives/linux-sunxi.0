Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DFB37171
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 17:22:35 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso112589066b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144153; x=1695748953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cGNNyLACgJb4AD5nR+SBP4DdztAWfhiNOuK7PDwoIw=;
        b=Ef2swQaLAlrKCO6OsUUqo49MI6faa0BkY7gbmmvl7jBx2x59INjx7Lgj6e+E+7wa+B
         s7Bp4lCA+mQyXYmEmPViPUJ516PZn27u5XjIJiMf6WHfNpHEeON7uWvI50vcbVVdmrU2
         wXRXApqH9m/huk4w3rH69VUtBQtx21hdriiWu6h0qWIIfzVAQ+n8KnDMQm4Irm5WcwKE
         96DNLbtuOmPzBZwICDIWw9yFHvhfOgddcK48eH19f6fp/xWSoHBFtxl78+B+a+uV0FQr
         bEmdiU7PSnm7YQTAKwkFVXwvpftymga1Qm0W2MjX+VFoc+MxwBkVEja/XJlGZj3A7Y39
         0xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144153; x=1695748953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cGNNyLACgJb4AD5nR+SBP4DdztAWfhiNOuK7PDwoIw=;
        b=VtliU/RWTUrL2A0a7cci+rOE1JQG3tGkjtjAtdg0zil3BmVWwJmMhvMtuWidFygypY
         XxHBOE/iHlpEJSv1H48pU7BiZed4NBUTmnySeXiZ2OD732WgZ9tr1OLS/cYcRQsdimKI
         pIRuYx61onhaTiYlz0/rm8S3rJlH5MUO2fXLXkQ9uiM1nj6IjrQFk4USNSr0ZQFKMBZu
         0xtPgv5YFaDL987DgKQqhOThCwhvMK7BqypUKuMi/Qu5iCQclJCC1dv2hT43/30qRks1
         TsaXdoRbn4Y95Fet7ouZNvCqduPICyxPcEXXO7zaWXIOXir1TMxIhJ0cYz5ucKGNQdgm
         QP+Q==
X-Gm-Message-State: AOJu0Yz0M+Y2hM1cXH5epu928nsOsqCHZ0ol5lTWEJiYfFn9odTabTGg
	z5h0vuowWAV81w9/ghSlEZI=
X-Google-Smtp-Source: AGHT+IFv8smAnvNFarSKEjNvCp7t+rF8X2hnJd77OUxGbDfg7ce42ijsLqP+RJ7vT0FdhbTF+1rjDg==
X-Received: by 2002:a17:906:5dcc:b0:99e:39d:4fa7 with SMTP id p12-20020a1709065dcc00b0099e039d4fa7mr37618ejv.22.1695144153180;
        Tue, 19 Sep 2023 10:22:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id rp15-20020a170906d96f00b009a1b857e3a5sm8086138ejb.54.2023.09.19.10.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:22:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject:
 Re: [PATCH net-next 04/54] net: ethernet: allwinner: Convert to platform
 remove callback returning void
Date: Tue, 19 Sep 2023 19:22:31 +0200
Message-ID: <3254669.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230918204227.1316886-5-u.kleine-koenig@pengutronix.de>
References:
 <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
 <20230918204227.1316886-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 18. september 2023 ob 22:41:36 CEST je Uwe Kleine-K=F6nig=20
napisal(a):
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
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c
> b/drivers/net/ethernet/allwinner/sun4i-emac.c index
> a94c62956eed..d761c08fe5c1 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -1083,7 +1083,7 @@ static int emac_probe(struct platform_device *pdev)
>  	return ret;
>  }
>=20
> -static int emac_remove(struct platform_device *pdev)
> +static void emac_remove(struct platform_device *pdev)
>  {
>  	struct net_device *ndev =3D platform_get_drvdata(pdev);
>  	struct emac_board_info *db =3D netdev_priv(ndev);
> @@ -1101,7 +1101,6 @@ static int emac_remove(struct platform_device *pdev)
>  	free_netdev(ndev);
>=20
>  	dev_dbg(&pdev->dev, "released and freed device\n");
> -	return 0;
>  }
>=20
>  static int emac_suspend(struct platform_device *dev, pm_message_t state)
> @@ -1143,7 +1142,7 @@ static struct platform_driver emac_driver =3D {
>  		.of_match_table =3D emac_of_match,
>  	},
>  	.probe =3D emac_probe,
> -	.remove =3D emac_remove,
> +	.remove_new =3D emac_remove,
>  	.suspend =3D emac_suspend,
>  	.resume =3D emac_resume,
>  };




