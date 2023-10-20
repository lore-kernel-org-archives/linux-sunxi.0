Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3651CFA6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIurIKt9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so7420455e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697810939; x=1698415739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkSRSoe+NCrUdsy2PEWfZaaHcoEfqOm9ULUGMQivKU4=;
        b=hIurIKt9p5jXgVzMTTDIgobTqFyN36NuOtl1+eccG+FYXRELGXve957nIDnhZCUW90
         FKODEdWZjnT0nlLljSvl/1BqASvczJ9nmBXBBno/D6OEhT3kfyJQm7YAu7QQ8qldKdJv
         90RWaRBwPD7xNyu88nFpsEwdMH7UM9LYn2gRUfp7DegPYUfjU/ywPFqnimGjTV08AeJL
         fpDRXnlanRXtkUHKVfiZu6VqdtT/PTk7oagPr2bD6vMkH2BEYudvi2EHj2XGCshJkgGx
         2KKa/QuFYXjHNtK4nH606CE+GKiRKZDtXtA+GoPWxj6Tm0wpaxhsRPWzfAbsiZ30wwtO
         bhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810939; x=1698415739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkSRSoe+NCrUdsy2PEWfZaaHcoEfqOm9ULUGMQivKU4=;
        b=t7g02Q4YiIA4XYorhF00FdqAZgcYFDGjpXbaQKtdoTdU84UoP3aEzsHyboOg6o/ZHy
         x2bBX8vHw1QPoeMXJ7ewF/cxUBd1E1W7lVVItYXLjxD5PO17ICt6B5iObATMyfm1bk8t
         /l+P2WPM20WtzbNEvbR0Jd0+B/jId3pX4Kf3gV4NJBst5Qz/T+KysDxBpNgL61M/RhVJ
         b/hcB1t9rB4aOaqf//C6G6BaVJ5K2aaBYKMlq4BD8YUnIlhrW5nFBLHGZd9eZ8GCkEve
         xsELljiC3OPFv7x2GENoZUrGJDor9qMG+8joV8UEwqk5/lh6p68YucsIMXfBGXi53aRR
         rWig==
X-Gm-Message-State: AOJu0YxTSib6QOtrC7zKqOUlS9MwwjmmxPqi5U23vgNRaDh4neROzuS2
	joPZkIZIRqblWKaAqadmrlk=
X-Google-Smtp-Source: AGHT+IEf5vEfKXkcjURNmEeHj5q5T93McM3/MsTajOoseh/P6iDVAzUGDoq2OziQXf+rZCfHzZaAqQ==
X-Received: by 2002:a05:600c:4747:b0:405:359a:c950 with SMTP id w7-20020a05600c474700b00405359ac950mr1521123wmo.19.1697810938083;
        Fri, 20 Oct 2023 07:08:58 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c431500b004076f522058sm6989920wme.0.2023.10.20.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:08:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 02/42] crypto: sun8i-ce - Convert to platform remove callback
 returning void
Date: Fri, 20 Oct 2023 16:08:55 +0200
Message-ID: <2319555.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20231020075521.2121571-46-u.kleine-koenig@pengutronix.de>
References:
 <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-46-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 20. oktober 2023 ob 09:55:24 CEST je Uwe Kleine-K=F6nig napisal(=
a):
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
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/=
crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index d4ccd5254280..1741758e03eb 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -1071,7 +1071,7 @@ static int sun8i_ce_probe(struct platform_device *p=
dev)
>  	return err;
>  }
> =20
> -static int sun8i_ce_remove(struct platform_device *pdev)
> +static void sun8i_ce_remove(struct platform_device *pdev)
>  {
>  	struct sun8i_ce_dev *ce =3D platform_get_drvdata(pdev);
> =20
> @@ -1088,7 +1088,6 @@ static int sun8i_ce_remove(struct platform_device *=
pdev)
>  	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
> =20
>  	sun8i_ce_pm_exit(ce);
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun8i_ce_crypto_of_match_table[] =3D {
> @@ -1110,7 +1109,7 @@ MODULE_DEVICE_TABLE(of, sun8i_ce_crypto_of_match_ta=
ble);
> =20
>  static struct platform_driver sun8i_ce_driver =3D {
>  	.probe		 =3D sun8i_ce_probe,
> -	.remove		 =3D sun8i_ce_remove,
> +	.remove_new	 =3D sun8i_ce_remove,
>  	.driver		 =3D {
>  		.name		=3D "sun8i-ce",
>  		.pm		=3D &sun8i_ce_pm_ops,
>=20




