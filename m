Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433E3717F
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 17:22:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-991c786369cso816837166b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Sep 2023 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144178; x=1695748978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcXUnksJwhyRAlze+kKPMXIvfRdnYvFyu340idGgApY=;
        b=chDiMzWerKLn6y7IBs82WIahG7FGXsmGuhMGmYxwAG1+VK7cAORWpy/Zb7TZfNJEYO
         ppGIbq8E3nfkSJFpe/wMME3mKdYwik/ZrVtJq8kgeZu94CXI1hraFA03CoF3SIeZR/3O
         ROGfOzm4xDr7mwIQjbfkyixpX0peSZpF7GOfJ9oANZrWK0vE9OZcYUvkE+YGqill03DE
         7j8vCYns537mLEa/vjZaXl05gDRlRzI/NPW/C6Bi+Y2kGiCRDckzUXuh+d1a6Lii2HNn
         KDENkTl25WY6+ohO6gaNBXqPHBRO1vikijywXdsA29Wi/Z1bKfIGnJfiquBMrYwDO0we
         dAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144178; x=1695748978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcXUnksJwhyRAlze+kKPMXIvfRdnYvFyu340idGgApY=;
        b=bkNONnVWP9Q+KzsOVOY9sBJxkWXcdphAB0mYhQb6JHv1KD7vofp0lHCzzFuLcJ61ga
         CcU7wS10TKmNnnYrYyNix0cp/BhnJLWl1U+fupkC1MGo+/6ZgQ44Qx/x830cyO55HYRv
         bwnMQKnz0kT6ISx5iJjc0GqTAEHAcgwzaxPyyz55jo6m9RlPUzki1iuT+Wd+eyH9iETp
         xAhoEdqo8z0VnS28ujxITpyzRuNu/pz8Vc1Zn+mYRSmOuxoBd5eR1R9zDrqHzh1lP7Yh
         izvcV7GeVwWMSeM68w6MNtxXgyk4Okg0VZeQfvzhD9To5EEgR1vViUyPyeLKxuXnNDJZ
         eqYA==
X-Gm-Message-State: AOJu0YygGOuGG+WachZo38xmiTRGcRDltonpXKmQ8u8PhWY/hHdQOm5D
	+rokVqZvAZH3wnTO6wwtF/U=
X-Google-Smtp-Source: AGHT+IF1Q4adU0rIcBVlI48STfiiF389ivz0W8cymo4KGMc3SHlL5K2MmpfuORVbO6ik0/JbKkDBjw==
X-Received: by 2002:a17:906:1de:b0:9ae:3f3a:828d with SMTP id 30-20020a17090601de00b009ae3f3a828dmr53646ejj.21.1695144177494;
        Tue, 19 Sep 2023 10:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id jp27-20020a170906f75b00b0099bd046170fsm8115171ejb.104.2023.09.19.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:22:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 18/19] net: mdio: sun4i: Convert to platform remove
 callback returning void
Date: Tue, 19 Sep 2023 19:22:55 +0200
Message-ID: <8276262.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20230918195102.1302746-19-u.kleine-koenig@pengutronix.de>
References:
 <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
 <20230918195102.1302746-19-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne ponedeljek, 18. september 2023 ob 21:51:01 CEST je Uwe Kleine-K=F6nig=20
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
>  drivers/net/mdio/mdio-sun4i.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/mdio/mdio-sun4i.c b/drivers/net/mdio/mdio-sun4i.c
> index f798de3276dc..4511bcc73b36 100644
> --- a/drivers/net/mdio/mdio-sun4i.c
> +++ b/drivers/net/mdio/mdio-sun4i.c
> @@ -142,7 +142,7 @@ static int sun4i_mdio_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_mdio_remove(struct platform_device *pdev)
> +static void sun4i_mdio_remove(struct platform_device *pdev)
>  {
>  	struct mii_bus *bus =3D platform_get_drvdata(pdev);
>  	struct sun4i_mdio_data *data =3D bus->priv;
> @@ -151,8 +151,6 @@ static int sun4i_mdio_remove(struct platform_device
> *pdev) if (data->regulator)
>  		regulator_disable(data->regulator);
>  	mdiobus_free(bus);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_mdio_dt_ids[] =3D {
> @@ -166,7 +164,7 @@ MODULE_DEVICE_TABLE(of, sun4i_mdio_dt_ids);
>=20
>  static struct platform_driver sun4i_mdio_driver =3D {
>  	.probe =3D sun4i_mdio_probe,
> -	.remove =3D sun4i_mdio_remove,
> +	.remove_new =3D sun4i_mdio_remove,
>  	.driver =3D {
>  		.name =3D "sun4i-mdio",
>  		.of_match_table =3D sun4i_mdio_dt_ids,




