Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439F70
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 08:29:13 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e2so10029324wrq.6
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jul 2021 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n22KqpPAazgSksARsAU/X44h7JM3fyV54ywJMdrH1Wg=;
        b=MQOyJgGP3H0Qwd3EZsdIBT7b6O/W9S9SsA0h4t425dME6/6e1ft+IXDbzCuMfqbFbs
         uhN3HGZ2DvMHJQaNwadAe6kkc3PkMqa9J/Edh68+Kju0Yu/Qdiu1I2/FcJzqWQkReyUA
         6vZUAD+4dz6ULTV+vxYPsQCBQ2JZQx62BtW2i3ZmxVz+0OPneDsy5PxoblS+7oyRAvGk
         bV0Hp5E1HFrpiQ1cNi0159EnMdwHd6e4BO5mkG52bqcFmuRTRN48QQ/BmPPsZKZkfHEa
         qpNTxXTtO+RBNQAOJ41TX3QuYN9yHP4SGv/gB0SR6827E6Zzy3OraznJCGsmBqPALV7q
         Hqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=n22KqpPAazgSksARsAU/X44h7JM3fyV54ywJMdrH1Wg=;
        b=oce3wYyizPVYptD00rDt/26EmOiAPbz3aeCg5NUN3+Y8UuVjwMFNVqjIPH4o/lgZpb
         5exiIqycRl9C6upPHe2AVCfgXwMUatnBqX13Pwea3TOsvMwW75zV+WV6heVxzGj3DKjR
         AtW9hoHWeBLWEYVCLwcQSdhKwI66lro35Jg/ti6msbZmliPFnwa6SZ+ZyLMscwsiRcJX
         SIJcZkw5e4AFczjmfblhB4KcU+SzflxdY8T7xEqpWynchAJ4zzHPcdrvqNeaGNFc1Gr5
         w2cQHYjqlxLe+1h0FdFEO5Nal1VT2iOgZnX+HyhDBx7nQvsuASltSJ9KMJ3X8r0wZ/Xl
         B3Mw==
X-Gm-Message-State: AOAM533Q0Bqf92ypPjMd27qqz4IyShehseseUUlMP8yU3NcIZPJbmA7x
	/AYP/1RWrYIXQUJ1Syfdx5M=
X-Google-Smtp-Source: ABdhPJx2CObKDuRvwR8Y7nZ6jwmf6jEfBwMYvNyPgZtIdXaevpTVTg7oe+aKZLOi/9UY6KXdvGlUgA==
X-Received: by 2002:a5d:4527:: with SMTP id j7mr17958282wra.137.1627288151479;
        Mon, 26 Jul 2021 01:29:11 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l39sm9877874wms.1.2021.07.26.01.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 01:29:11 -0700 (PDT)
Date: Mon, 26 Jul 2021 10:29:08 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@google.com>,
	Colin Ian King <colin.king@canonical.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun8i-ce: fix memory leak and return value of
 sun8i_ce_hash_run
Message-ID: <YP5yVIVTmNM7yMLZ@Red>
References: <20210726075957.2231287-1-mudongliangabcd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726075957.2231287-1-mudongliangabcd@gmail.com>

Le Mon, Jul 26, 2021 at 03:59:36PM +0800, Dongliang Mu a écrit :
> This patch fixes some memory leak caused by dma_mmap_sg/single
> in the error handling code. In addition, it fixes the return value
> when errors related with dma_mmap_sg/single occur.
> 

Hello

"some" is too imprecise, exactly which allocation is leaked ?
In fact it will be easier to say that all dma_map_xx are leaked, I just saw that my code is really bad.

Furthermore, you should have two fixes, one for the memory leak, one for the error code.

But for the error code, I am not sure it is needed, error code is already given to user via crypto_finalize_hash_request().
The "return 0" is for crypto/crypto_engine API, returning an error will not change anything since we dont have retry_support.

So I propose you to focus on dma_map_xxx() fix patch.

> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>

"Reported-by:" is for credit when someone else give you informations.

> Fixes: 732b764099f65 ("crypto: sun8i-ce - fix two error path's memory leak")
This is not the patch which introduces the problem, the problem is from the beginning ("crypto: sun8i-ss - support hash algorithms")

> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
> v1->v2: move crypto_finalize_hash_request to the end of function; move
> the memcpy after the dma_mmap_sg/single functions. 
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> index 3c073eb3db03..fe5db3c84754 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
> @@ -324,11 +324,10 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>  	struct sun8i_ss_alg_template *algt;
>  	struct sun8i_ss_dev *ss;
>  	struct scatterlist *sg;
> -	int nr_sgs, err, digestsize;
> +	int j, i, todo, nr_sgs, digestsize, err;
>  	unsigned int len;
>  	u64 fill, min_fill, byte_count;
>  	void *pad, *result;
> -	int j, i, todo;

This is a change unrelated with the subject.

>  	__be64 *bebits;
>  	__le64 *lebits;
>  	dma_addr_t addr_res, addr_pad;
> @@ -368,14 +367,14 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>  	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
>  		dev_err(ss->dev, "Invalid sg number %d\n", nr_sgs);
>  		err = -EINVAL;
> -		goto theend;
> +		goto err_result;
>  	}
>  
>  	addr_res = dma_map_single(ss->dev, result, digestsize, DMA_FROM_DEVICE);
>  	if (dma_mapping_error(ss->dev, addr_res)) {
>  		dev_err(ss->dev, "DMA map dest\n");
>  		err = -EINVAL;
> -		goto theend;
> +		goto err_unmap_sg;
>  	}
>  
>  	len = areq->nbytes;
> @@ -390,7 +389,7 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>  	if (len > 0) {
>  		dev_err(ss->dev, "remaining len %d\n", len);
>  		err = -EINVAL;
> -		goto theend;
> +		goto err_addr_res;
>  	}
>  
>  	byte_count = areq->nbytes;
> @@ -421,27 +420,28 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
>  	}
>  
>  	addr_pad = dma_map_single(ss->dev, pad, j * 4, DMA_TO_DEVICE);
> -	rctx->t_src[i].addr = addr_pad;
> -	rctx->t_src[i].len = j;
> -	rctx->t_dst[i].addr = addr_res;
> -	rctx->t_dst[i].len = digestsize / 4;
>  	if (dma_mapping_error(ss->dev, addr_pad)) {
>  		dev_err(ss->dev, "DMA error on padding SG\n");
>  		err = -EINVAL;
> -		goto theend;
> +		goto err_addr_res;
>  	}
> +	rctx->t_src[i].addr = addr_pad;
> +	rctx->t_src[i].len = j;
> +	rctx->t_dst[i].addr = addr_res;
> +	rctx->t_dst[i].len = digestsize / 4;

This is right, it is useless to set addr_pad if it is "bad".
But this is a change unrelated with the subject.

Regards
