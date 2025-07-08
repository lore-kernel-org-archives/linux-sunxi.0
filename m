Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DB21CC74
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751999806; cv=none; b=C06bPsZ8nVs8rpCUDTbShrQdMMo+qovFoCpkIdP06s4F548ahO5n0v9ZzY0TGPYlg84Q/7feqWXYuKEtQDYoUD97lIE9FWtEg4eUpOyHmRryoUeIVr60sxOEUMDaDI9Z+X/BuCBPaqIUBqTvoYBC3IPyG693tzuDq8bCCu/ApxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751999806; c=relaxed/simple;
	bh=+vaofl95bqvvnLYwDszC8RbyTM4tCMvnw5NvGQbXRrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dalaGatPiVRx5ue8LqLU9EVCy8maGkwyj+FrhqJueHvLur5zFRWPouyVQLATINr1RWR1iUNWhgh7lU0EMXtlfHnwWzTXSJBmVngbQjM5FRoqiqom+86ZzLqGkbySgvZxEcmdrHCybnMzBqBMnWhvasGaqAYy/spgZyYQRllUc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHF9BCB0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHF9BCB0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453634d8609so32484195e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751999802; x=1752604602; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZzB0X2FsBXzqI5HGqH1OR/QsRNZjrSGBBRmka+LrH0=;
        b=dHF9BCB014F6wvDdV5XNuQKWnzAVo1XIB1U5I2n/x6TC7AxwnyYJ0Wuiffe0wK821K
         TWpRECikFRxof/W0z5KvHoy9c5ZyHDYhW8kBZx9Ei8yXInjIgK3mZ9H3Ku7s1CNawSvA
         O35r8x/tR0NrdMYrAVhLNrZN7kiCsBdIMql+3ptBttz95yGZ5ra3pzyu5v9cTvXLQnNP
         +etZeDkuUUa07Tci5DJmBOLaRGcpa1LnFKfG1G6s48V4cDJ6XPhvWfCBZuOBIlkQVXzg
         RGdK8Pc2wWdtZq3ieKcpvAly1XJXde1LNogZRfkvXpHa/lpYJU7H2QTCLXR1hNunHMek
         /SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751999802; x=1752604602;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZzB0X2FsBXzqI5HGqH1OR/QsRNZjrSGBBRmka+LrH0=;
        b=hSezs9kr2B9vX2ZKrf1lxSXA8hsxIFr5TVBvlI4aPSX9R661xz7QtZ+2G6ebmMi43F
         5RIp/bIBw5+k3UVePYvHvASEJWMR51hoHKITGUEFRowla9kIOTADhbeCyNn1gcXDhXdv
         4T+IHW0JUNN9Tf5yhBdWDvux5OBnwJQNidX+k0HgmVFJVQPbVoXAGNX1k/Pb7dQeKrht
         ZgBeg9euO0xlSCS+hLaZKE26D533MAakOJ2GhmOnSJDMtOmBZqQkkcQn1xW3G4Q+1g8B
         yo2YFjZtPBmxtGINeBmx8KNCOU1bPPkD+aFylYEcskQtBKvxjh1AMsGmBCxTyagCfENB
         zmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKUTcsg+7CUKE1rYQc0BNIrW5NFseABRF1FUdE2JInXyv6iq5UbP3TET1ezXloNXw7wXJqU26WegUPxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj3rGhi3HZUM+cFymBv0jQmcjFjNh8lx8OUCro2NJc8xF3TbKl
	/kdyZr7AXEtG7pAku5LDtOVBbGY2AtoMvoNMfJRrM3DSRvqhFi61TlYq
X-Gm-Gg: ASbGncunYKhaZvTqMlZwdQZjseCOh5G9E2Tm+0lUKlZFOSqziDoCzKuo6kbAdDzsve6
	snaYuVDeYHXa+elSayAPw5+hn/Joynnk7cD/ttBbz/O+i724IRg0uBnw9rZvHN8G88FCvQDQt/k
	TvRQohFSdIkrQ+kk0sS89WtpY4jCq7sFxLdKdXwSdUs9XkehvHGc1GSAFIr7LTbRqNVuWUsx7gJ
	+pOFHHCRrQMiwet7TZUlvkW3ftwWFoDaS4nsNST2ONXml14lMqxvp2BbCBrq2YIWR1lApRPA1PG
	EXtvQo9p/PYLKUGcQKD2vOAWzAcXAGIFLYhGdvtm3RI1tQw9+SnZAzJPT401ZdyAsEs1R0VGYA=
	=
X-Google-Smtp-Source: AGHT+IGzirJ3lcOZbMfjaWTE+B8TfpMfBT54EdWIh7tTV0hajxIMDDBeGmh91j5QzxZyK7lYKyBaXw==
X-Received: by 2002:a05:600c:4683:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-454cd5447a2mr53481945e9.30.1751999801979;
        Tue, 08 Jul 2025 11:36:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5dfd4657dsm2083334f8f.17.2025.07.08.11.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:36:41 -0700 (PDT)
Date: Tue, 8 Jul 2025 20:36:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv
 to request context
Message-ID: <aG1lN94feb4OJVsI@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-4-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-4-ovidiu.panait.oss@gmail.com>

Le Thu, Jun 26, 2025 at 12:58:06PM +0300, Ovidiu Panait a écrit :
> Currently, the iv buffers are allocated once per flow during driver probe.
> Having a single iv buffer for all requests works with the current setup
> where requests are processed one by one, but it wouldn't work if multiple
> requests are chained together and processed in one go.
> 
> In preparation for introducing request batching, allocate iv buffers per
> request, rather than per flow.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
>  3 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index 113a1100f2ae..9963e5962551 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -209,11 +209,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
>  	if (areq->iv && ivsize > 0) {
>  		if (rctx->op_dir & CE_DECRYPTION) {
>  			offset = areq->cryptlen - ivsize;
> -			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
> +			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
>  						 offset, ivsize, 0);
>  		}
> -		memcpy(chan->bounce_iv, areq->iv, ivsize);
> -		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
> +		memcpy(rctx->bounce_iv, areq->iv, ivsize);
> +		rctx->addr_iv = dma_map_single(ce->dev, rctx->bounce_iv, ivsize,
>  					       DMA_TO_DEVICE);
>  		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
>  			dev_err(ce->dev, "Cannot DMA MAP IV\n");
> @@ -299,13 +299,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
>  
>  		offset = areq->cryptlen - ivsize;
>  		if (rctx->op_dir & CE_DECRYPTION) {
> -			memcpy(areq->iv, chan->backup_iv, ivsize);
> -			memzero_explicit(chan->backup_iv, ivsize);
> +			memcpy(areq->iv, rctx->backup_iv, ivsize);
> +			memzero_explicit(rctx->backup_iv, ivsize);
>  		} else {
>  			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
>  						 ivsize, 0);
>  		}
> -		memzero_explicit(chan->bounce_iv, ivsize);
> +		memzero_explicit(rctx->bounce_iv, ivsize);
>  	}
>  
>  	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
> @@ -348,13 +348,13 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  					 DMA_TO_DEVICE);
>  		offset = areq->cryptlen - ivsize;
>  		if (rctx->op_dir & CE_DECRYPTION) {
> -			memcpy(areq->iv, chan->backup_iv, ivsize);
> -			memzero_explicit(chan->backup_iv, ivsize);
> +			memcpy(areq->iv, rctx->backup_iv, ivsize);
> +			memzero_explicit(rctx->backup_iv, ivsize);
>  		} else {
>  			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
>  						 ivsize, 0);
>  		}
> -		memzero_explicit(chan->bounce_iv, ivsize);
> +		memzero_explicit(rctx->bounce_iv, ivsize);
>  	}
>  
>  	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index 79ec172e5c99..930a6579d853 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -757,18 +757,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
>  			err = -ENOMEM;
>  			goto error_engine;
>  		}
> -		ce->chanlist[i].bounce_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
> -							 GFP_KERNEL | GFP_DMA);
> -		if (!ce->chanlist[i].bounce_iv) {
> -			err = -ENOMEM;
> -			goto error_engine;
> -		}
> -		ce->chanlist[i].backup_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
> -							 GFP_KERNEL);
> -		if (!ce->chanlist[i].backup_iv) {
> -			err = -ENOMEM;
> -			goto error_engine;
> -		}
>  	}
>  	return 0;
>  error_engine:
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> index f12c32d1843f..0d46531c475c 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
> @@ -188,8 +188,6 @@ struct ce_task {
>   * @status:	set to 1 by interrupt if task is done
>   * @t_phy:	Physical address of task
>   * @tl:		pointer to the current ce_task for this flow
> - * @backup_iv:		buffer which contain the next IV to store
> - * @bounce_iv:		buffer which contain the IV
>   * @stat_req:	number of request done by this flow
>   */
>  struct sun8i_ce_flow {
> @@ -198,8 +196,6 @@ struct sun8i_ce_flow {
>  	int status;
>  	dma_addr_t t_phy;
>  	struct ce_task *tl;
> -	void *backup_iv;
> -	void *bounce_iv;
>  #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>  	unsigned long stat_req;
>  #endif
> @@ -264,6 +260,8 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
>   * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
>   * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
>   * @addr_key:		The key addr returned by dma_map_single, need to unmap later
> + * @bounce_iv:		Current IV buffer
> + * @backup_iv:		Next IV buffer
>   * @fallback_req:	request struct for invoking the fallback skcipher TFM
>   */
>  struct sun8i_cipher_req_ctx {
> @@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
>  	int nr_sgd;
>  	dma_addr_t addr_iv;
>  	dma_addr_t addr_key;
> +	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
> +	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>  	struct skcipher_request fallback_req;   // keep at the end

Hello

Are you sure you could do DMA on sun8i_cipher_req_ctx ?

Regards
