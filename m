Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0FD3D81
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 20:36:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso3336880wma.2
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=m4tEcGBACEGWaQEpUxdmWQR6J1Khyc3oluJxMJzdBgo=;
        b=N2fAhrsl+kv9ZYKhW5EJYguEcSWxvXTY54bQUjLprmAcyC8Pa4oIWZXv2vCW7XK24I
         hl9vRRFcXaUFvUSnB7MJmtdF8YRRYkL1ae2Xja7m2tThhuimRk0+anfJw1UAV7fpjscX
         sROzAb/6r8vu5B2GH36HZ3Tmn1qmCzeTz8aBfi3WzC0FdoiJ2t/C7OG6Bqgu8DBDFcRE
         SMpgZljWW6enGuPxxF7cmilQehbK/czz5o/Nx5bGDz6j+iEkhhoySaaISUzqTwG5I9p+
         x5Phhdcjgh0mlWgWa7CSmPHetKPwnABLGOse9lGcbZLQSF67OvWd8mANePgcBA8pkM6i
         /ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=m4tEcGBACEGWaQEpUxdmWQR6J1Khyc3oluJxMJzdBgo=;
        b=F1F6ykuDF+7Hur868afE2ML2UMPpULkqvdoNWxmK/ihAEvr+i+0tXkPWOy+FuVtz1I
         axmvnJmjfFsknow3984rYJZJ/bZ4EcPUAFPd5o8SxE3Bo6GfgZSKl3DSg4y4ZlbJuueV
         aUaXXs72Aw/wfUIJN1d6SxSN4qYJolK/OVbWhsLMntNTv3/JlIeGlpkgIejBBfYf/5qo
         0B9vsp1dgsO3sOTxkMwBGggbU7jklDAfsfLXS2pAGa2a8yZ8WAfcSBarBydOMO/D20x4
         PqNeD9t9XbhbKItD3N1bO5r1vg6XxmUIIkOuhsz22NhhLpt2+8JZdYewdHPf8QGMj7yZ
         jkVg==
X-Gm-Message-State: ACgBeo3y4YAnZVdY0EQB3RHWPVEfpFtG8cc1ywaR2t7xAIk+ZTromTed
	Ha3VZjonshKqnm/pvdsfdC8=
X-Google-Smtp-Source: AA6agR5nmXXz4cnhxS3dpy898DY4fWV2qphQL7t2YuAZhFtAOHTBLIUInnvIoHdSrPi8xqnPsqzwSQ==
X-Received: by 2002:a05:600c:3c9:b0:3a5:c5b3:4bf with SMTP id z9-20020a05600c03c900b003a5c5b304bfmr9185791wmd.195.1661459784116;
        Thu, 25 Aug 2022 13:36:24 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c3b8400b003a608d69a64sm6328926wms.21.2022.08.25.13.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:36:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, "David S. Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Dan Carpenter <dan.carpenter@oracle.com>, Minghao Chi <chi.minghao@zte.com.cn>, Peng Wu <wupeng58@huawei.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] crypto: allwinner: Fix dma_map_sg error check
Date: Thu, 25 Aug 2022 22:36:22 +0200
Message-ID: <4734941.GXAFRqVoOG@kista>
In-Reply-To: <20220825072421.29020-6-jinpu.wang@ionos.com>
References: <20220825072421.29020-1-jinpu.wang@ionos.com> <20220825072421.29020-6-jinpu.wang@ionos.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 25. avgust 2022 ob 09:24:20 CEST je Jack Wang napisal(a):
> dma_map_sg return 0 on error.
>=20
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Minghao Chi <chi.minghao@zte.com.cn>
> Cc: Peng Wu <wupeng58@huawei.com>
> Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
> Fixes: d9b45418a917 ("crypto: sun8i-ss - support hash algorithms")
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 6 +++---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 4 ++--
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c index
> 74b4e910a38d..be7f46faef7e 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -208,7 +208,7 @@ static int sun8i_ce_cipher_prepare(struct crypto_engi=
ne
> *engine, void *async_req
>=20
>  	if (areq->src =3D=3D areq->dst) {
>  		nr_sgs =3D dma_map_sg(ce->dev, areq->src, ns,=20
DMA_BIDIRECTIONAL);
> -		if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> +		if (!nr_sgs || nr_sgs > MAX_SG) {
>  			dev_err(ce->dev, "Invalid sg number %d\n",=20
nr_sgs);
>  			err =3D -EINVAL;
>  			goto theend_iv;
> @@ -216,13 +216,13 @@ static int sun8i_ce_cipher_prepare(struct
> crypto_engine *engine, void *async_req nr_sgd =3D nr_sgs;
>  	} else {
>  		nr_sgs =3D dma_map_sg(ce->dev, areq->src, ns,=20
DMA_TO_DEVICE);
> -		if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> +		if (!nr_sgs || nr_sgs > MAX_SG) {
>  			dev_err(ce->dev, "Invalid sg number %d\n",=20
nr_sgs);
>  			err =3D -EINVAL;
>  			goto theend_iv;
>  		}
>  		nr_sgd =3D dma_map_sg(ce->dev, areq->dst, nd,=20
DMA_FROM_DEVICE);
> -		if (nr_sgd <=3D 0 || nr_sgd > MAX_SG) {
> +		if (!nr_sgd || nr_sgd > MAX_SG) {
>  			dev_err(ce->dev, "Invalid sg number %d\n",=20
nr_sgd);
>  			err =3D -EINVAL;
>  			goto theend_sgs;
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c index
> 8b5b9b9d04c3..0e6843ec197f 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
> @@ -389,7 +389,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, v=
oid
> *breq) cet->t_asym_ctl =3D 0;
>=20
>  	nr_sgs =3D dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
> -	if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> +	if (!nr_sgs || nr_sgs > MAX_SG) {
>  		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
>  		err =3D -EINVAL;
>  		goto theend;
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c index
> 910d6751644c..fdcc98cdecaa 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -232,13 +232,13 @@ static int sun8i_ss_cipher(struct skcipher_request
> *areq) nr_sgd =3D nr_sgs;
>  	} else {
>  		nr_sgs =3D dma_map_sg(ss->dev, areq->src, nsgs,=20
DMA_TO_DEVICE);
> -		if (nr_sgs <=3D 0 || nr_sgs > 8) {
> +		if (!nr_sgs || nr_sgs > 8) {
>  			dev_err(ss->dev, "Invalid sg number %d\n",=20
nr_sgs);
>  			err =3D -EINVAL;
>  			goto theend_iv;
>  		}
>  		nr_sgd =3D dma_map_sg(ss->dev, areq->dst, nsgd,=20
DMA_FROM_DEVICE);
> -		if (nr_sgd <=3D 0 || nr_sgd > 8) {
> +		if (!nr_sgd || nr_sgd > 8) {
>  			dev_err(ss->dev, "Invalid sg number %d\n",=20
nr_sgd);
>  			err =3D -EINVAL;
>  			goto theend_sgs;
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c index
> 36a82b22953c..fcb8c41cc957 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> @@ -527,7 +527,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, v=
oid
> *breq) rctx->method =3D ss->variant->alg_hash[algt->ss_algo_id];
>=20
>  	nr_sgs =3D dma_map_sg(ss->dev, areq->src, sg_nents(areq->src),
> DMA_TO_DEVICE); -	if (nr_sgs <=3D 0 || nr_sgs > MAX_SG) {
> +	if (!nr_sgs || nr_sgs > MAX_SG) {
>  		dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
>  		err =3D -EINVAL;
>  		goto theend;
> --
> 2.34.1


