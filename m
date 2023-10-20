Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB36A1CFA6
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJiWXV5l"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c5629fdbf8so6372751fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697810954; x=1698415754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAk8jT42K0k51X/whGDwwkWdg31+jN6q/2Mef/7UWrE=;
        b=KJiWXV5lfRjrH7q1xTpzfwYAXGwmFwgezBrRYri070LHlz2MfOnaAvYeutjvJLcIqi
         ZJc/S505qr5PE14+dxbpOly53tFEzP8QZRjRVdAxymqhIlxy+brcQfX28mMuTxLCIyI0
         77w2gXPtB7JjvSw05DLXiSN42ibmrQfKYHK5C/vEXxDTyBAsW8V7hqy4BAQyOQM4QPRb
         qEMIt9Y6GjSkSl4R4yOaIqxIJ3d86j9HZgtASnmhal2T+bmYVWNDCT6yE4Fmt79bj7W4
         UiSgbgjOJH6gSg/us/O9TwliyCVguq6ICU9c7twWsRTPJ7gr+71SChvJHRz1oZzIsx+C
         gz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810954; x=1698415754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAk8jT42K0k51X/whGDwwkWdg31+jN6q/2Mef/7UWrE=;
        b=QXCwzJUBjLtQ+RholIBV0IIla/p5eqn19PTSksh3T/Orrmah3bcL85YKd/3/HbVeZU
         tsgPtmgbRVMV/2EppAjz4XnRl8AWOqGJwikjEKyEJGTjLsbeGTc0OYnsZTBQfa2ShybU
         C0Cmo1F9I+u1n6SciWEXqAxBch2VNg6V6IKc24rkF10WqGw7C5iHI/8HqGMDw4zK1Dgo
         EoHr7OnE8bZAsOIEIjqBUDnU5C7T3N4aKmgjeudv/W3vQvMtAc3K6V4OnDKjbCbIOtp9
         v9UVwFnD/uKu7s9NMGCSOg70TTrYajNCEe6WsRjJJb95V7Rza3+LqbgSWCivuAdsM/2V
         PFNg==
X-Gm-Message-State: AOJu0YzJ1+3Rvn/GnjzSDyuvPOKR9l5RD5CHbBKynRVmH4qWVP6yR0bV
	W49G+kzEkw1N7b9i0/EWBbc=
X-Google-Smtp-Source: AGHT+IEcjRrEpDSqzSmBRW8cEQW7ATxuQF+r5HjzhQL71YF4PNK4hVxqHzayJTA6OlG1si/9bOF1Ng==
X-Received: by 2002:a05:651c:a0a:b0:2bb:a28b:58e1 with SMTP id k10-20020a05651c0a0a00b002bba28b58e1mr2191009ljq.41.1697810953817;
        Fri, 20 Oct 2023 07:09:13 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l23-20020a1c7917000000b004063cced50bsm2248792wme.23.2023.10.20.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:09:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH 03/42] crypto: sun8i-ss - Convert to platform remove callback
 returning void
Date: Fri, 20 Oct 2023 16:09:11 +0200
Message-ID: <1885790.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20231020075521.2121571-47-u.kleine-koenig@pengutronix.de>
References:
 <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-47-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 20. oktober 2023 ob 09:55:25 CEST je Uwe Kleine-K=F6nig napisal(=
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

>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/=
crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 4a9587285c04..f14c60359d19 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -908,7 +908,7 @@ static int sun8i_ss_probe(struct platform_device *pde=
v)
>  	return err;
>  }
> =20
> -static int sun8i_ss_remove(struct platform_device *pdev)
> +static void sun8i_ss_remove(struct platform_device *pdev)
>  {
>  	struct sun8i_ss_dev *ss =3D platform_get_drvdata(pdev);
> =20
> @@ -921,8 +921,6 @@ static int sun8i_ss_remove(struct platform_device *pd=
ev)
>  	sun8i_ss_free_flows(ss, MAXFLOW - 1);
> =20
>  	sun8i_ss_pm_exit(ss);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun8i_ss_crypto_of_match_table[] =3D {
> @@ -936,7 +934,7 @@ MODULE_DEVICE_TABLE(of, sun8i_ss_crypto_of_match_tabl=
e);
> =20
>  static struct platform_driver sun8i_ss_driver =3D {
>  	.probe		 =3D sun8i_ss_probe,
> -	.remove		 =3D sun8i_ss_remove,
> +	.remove_new	 =3D sun8i_ss_remove,
>  	.driver		 =3D {
>  		.name		=3D "sun8i-ss",
>  		.pm             =3D &sun8i_ss_pm_ops,
>=20




