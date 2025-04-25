Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E724BC1A
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587834; cv=none; b=KtRsRWlY5lF7+HCAo9+/lggV5tvatqNleAHYslQBLCI3CnZDH1lkZdGQY/lzfF44X8NEd1NA3xl3ltogRfYyJFsMNtFJlb49WNMGA/mXsBPF6kUoAdsU7s3OzokBK5oUNI/uQ286A+7cxcHmCn5cqqlW4EFb3cgr55YC0AgxLNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587834; c=relaxed/simple;
	bh=WMPNN23hTTSzf665lOinNQAD+n0lrk8hBHf4iWIYd7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ea29fl44zrI9iRDX8HELQLsTII9m0HdGVK3LMGg5jNOrgTb60DtrOPD3QxOo4uWArQJIMri54h3KwAndDqfF5ZDVXC9rN495Lt8yi2YhJT5uWfOiIlMM0YjQ6p3O2Y0eYhcQf0eB2sJ7y/YRZ0j3ha+wyHv27bMunl2L3ky6teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcOZh1Fj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcOZh1Fj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edb40f357so15730315e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587831; x=1746192631; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=;
        b=TcOZh1FjNpWCxqw75hiGi1QzlNUjAOZIZX2EuVoXcMIrfl9+g/69/NOl7sU7Y3xRqU
         u97u3Qcm3m1hPVoybF8R/hK6WWmRTgGwKA/+cPXupyHNy+YSXfclXCvsEVnTChVw5I/f
         OTcYxPl+XBEpi3194j4ioVbAPZSDGo769vDUrbOlkfxXd7OBJtrTeYBJsHrd0jqfyFKJ
         zMC3Ycom+LTu475JoIsnbfqMZMQFnBheIL0DbAb2bqG9dkeCHcJGA94oN8JFYlQ7E5Ja
         o82n31lAfj4nnXhIHV/9VaWKWBGN2kyhAVHfLAt/QhKvXq49QjSMu+xu1u6y3ia+u9/m
         Hq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587831; x=1746192631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UqX8ZjtCt77K2Fit3CqVXamabKOpdFvwhUpSSi7NtE=;
        b=fXKcCkNOet/pLUl567UCwv/1VPcydIhZYNiDSHhdVlxVg/val26cqefrvPjqNEa8nR
         Rw7qBBjm9fLbBvclDTx2ACFstp1C3CWVjaj9qSFDXbgVWhkbUQFdh80r7SQ41hs13vQ+
         /+tqZhXADwMAvJYzx67Ywyuj8QYwHldKOjJI5re743VLRZV4bE/rZOpbI7DyDMO7jci4
         XhZeI3OzMUR8QcBqPqO9HvfOb6Zvht1ugs96cjxblTmBU5KziuL4c99p3c7+K2vn9DDQ
         I45CdRwZKBteWxeB8xtc2W+IH2DXmDO3HAtEjH3VfmTye3Z2uSYx6nFaoLAD591mqqZT
         S6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWksM9eKng96tpe19R95ZzMv67IY0mesKUZgQ4xuc8i2Rcr6M/SCWawmYgFtfEfNq4I0NLJp1bawwwg9w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+VsoowH6M0hLQ9SGCEKCPyBM5cB3IVTlVSLCywf+YRAmbheO/
	L0vP5ezeN9e+TLDGmw+5dLhU1n7bCXTBHDtXh0fPZbkr3jIiUR5E
X-Gm-Gg: ASbGncttMa3UqCMfgiMlPIbRjNeeYnD8n7ZmqDUnHVyKB1KJ5CK3GmhlW3Sj8Hl7xX7
	9OFXEdd9D292OhyhQZ17UfibaIBRJa143Dd8L7f9q0ucOp324llrR2zLIBN8zyh6Z4YJhe+3O3D
	rPT8N7ymXhOe8NmkwYqEDuwqQoZsSrXiQu5uCiG1xOIz2tweKdJidkHssHQr5OJp1qPUcfP0lu7
	cQ0u2lvN+P/bkEz2PJINT0RPhLnkYWo4cZdeDORJr4G7Y+npRaQvuyBIX4QmxootgzzBfNTBcaM
	/+gm2e9RZyZubHgIdYSrWvJI7gaV5N8ixBxXXm/6
X-Google-Smtp-Source: AGHT+IH4MAUOUOX1z32Y5YjXpUZYGNNANOzJfIUTq3LFTRzfoVT+ERQaNUzYocvxmVzREj0gMHwqtw==
X-Received: by 2002:a05:600c:1c0a:b0:440:68db:a045 with SMTP id 5b1f17b1804b1-440a66abaffmr18515515e9.26.1745587831225;
        Fri, 25 Apr 2025 06:30:31 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm58831505e9.14.2025.04.25.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:30:30 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:30:28 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks
 for debugfs stats
Message-ID: <aAuOdDhpnLE5bM_y@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com>

Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
> fallback counter updates to make sure the code is not included when
> debugfs statistics support is not enabled.
> 
> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index f03a8fa7bfa2..433cd18f0b5b 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  
>  	if (sg_nents_for_len(areq->src, areq->cryptlen) > MAX_SG ||
>  	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG) {
> -		algt->stat_fb_maxsg++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_maxsg++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen < crypto_skcipher_ivsize(tfm)) {
> -		algt->stat_fb_leniv++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_leniv++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen == 0) {
> -		algt->stat_fb_len0++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_len0++;
> +
>  		return true;
>  	}
>  
>  	if (areq->cryptlen % 16) {
> -		algt->stat_fb_mod16++;
> +		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +			algt->stat_fb_mod16++;
> +
>  		return true;
>  	}
>  
> @@ -57,12 +65,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  	sg = areq->src;
>  	while (sg) {
>  		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -			algt->stat_fb_srcali++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_srcali++;
> +
>  			return true;
>  		}
>  		todo = min(len, sg->length);
>  		if (todo % 4) {
> -			algt->stat_fb_srclen++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_srclen++;
> +
>  			return true;
>  		}
>  		len -= todo;
> @@ -73,12 +85,16 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>  	sg = areq->dst;
>  	while (sg) {
>  		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
> -			algt->stat_fb_dstali++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_dstali++;
> +
>  			return true;
>  		}
>  		todo = min(len, sg->length);
>  		if (todo % 4) {
> -			algt->stat_fb_dstlen++;
> +			if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
> +				algt->stat_fb_dstlen++;
> +
>  			return true;
>  		}
>  		len -= todo;
> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
>  		algt = container_of(alg, struct sun8i_ce_alg_template,
>  				    alg.skcipher.base);
>  
> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>  		algt->stat_fb++;
> -#endif

Hello

You put IS_ENABLED everywhere, but here you remove it, why ?
I think you forgot it.

Thanks
Regards

