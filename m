Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342BB14C59D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Feb 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127477; cv=none; b=sSUF/BCOV4NhLmK0/EE6dskDCL6ciC3Khvd1n8Y2FZ+snpYZ4qw5VyDQJH26ccMKEXQ5oZxOFzXNC749cMjoenw1wJ+o8OLdXKsFl5OewCBB8uPYb9rm1KcFPCDp6bSoZPUcr4kKBn5emv576H8oQJQY1DRD0VXyYtmbCNvPGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127477; c=relaxed/simple;
	bh=ZrIig3MM4Z+bo/sqJIChCKj/Pje7QWTe1w+LQ7AYd7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3C5wje0ZBAMHkEDJvs/QqxLp7xj68H4AxADUJ30bVqnq/zL3/dwYb+lQ4TbFyRpFNJfLWwzOw7KwwSdLSUoX1A7HWEHru0gsSY9JOpKCY0hXAYR4ZMw0wqPWlPswHAHJOgW+0TMSo4ap3UvhrqzFGetE3VXcmMG5EFQROzjmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1K+4uyW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1K+4uyW"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512fb30dbc9so3585693e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Feb 2024 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709127474; x=1709732274; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxWgL4sElI1B0/tx2GgHOxLa5Q0889pBGSF5c/6AjSo=;
        b=A1K+4uyW7sd8EkU9eyI0ARarNGSa5NG/gKT9d5UpCLuysoBPbi+JKygaJwRyzEkNsW
         UNW/DzjuyAZp3TG4tfKGDD0g1K9CUrmb8jjquuCCVMwywzjHTMnlvoIwrikj6Iqdp5IS
         he/HxOnnORsXYv+gvwtPVF3+JFJZlsEtnrTRiWmznAjPDR+4t8TqFZx5f35xSKuZVzfO
         TvOlxQfbzarIbW+v9YE0pVFrAagi1+v4n9dXPqSfTmhnocHuEzr6EdT2LgtQ4YBBOKeS
         s4U+9beDEGnOf0tq1dX+3hwhh0QLdLtXRuElkabe8UqUkPaQSFoHdsX9DUwiKr+uD45Y
         yrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709127474; x=1709732274;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxWgL4sElI1B0/tx2GgHOxLa5Q0889pBGSF5c/6AjSo=;
        b=KM5BZMTR6BakomzLlVDTzh5jhhvfFIcXg4/6Jstnv8q1GUSk4CAhSA4lUqJUWRAdMd
         OO+IO13Xp7zMNij5frxIuB5N8T1MNjC9EVWI42WJxIMwcmXF5jITQv1yITs8X0GAayhc
         nTZU7slxHvrT6It95+MUn5LBGs2sTIj6ZB4SPGpJVBummDRObXgEgtEQWElDTT/51zJD
         CmbnMQ0CkOJsia4XthDo044NGOLCIkJLoYdeHuLMVqQ8E1e11Br94u2JNP47+im+gCHJ
         WML+8AlBnOOq1Pa6UJa95owb9Gw8n8voYFV6pYvBL3mqej23nZKweQa7P7k2mqD2Chx1
         p+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWiNvJlHsxHCm8gs0D/kgA7QfFO8VW2ZJtPbbZrKgp+VmLRJwwquSvOhrFgpZkRkyEiXP7BQ4ds6tth7Uxpm4bIQzvGTLLkTvhbFJ0=
X-Gm-Message-State: AOJu0YzsqQ1SzFzs9Co5lLwYK1+RAhhdG6889gi7i15/wY+khIhClcEU
	HG6xI8sDlGvTfG8OXKjtEbxi5PHFP13KR+TREkI8eZD0V+N374jl
X-Google-Smtp-Source: AGHT+IEGAbjhr46EhXX778kptGTzCsJXZVuCDdfQgon6/ZXpJpBpqXYL2Ir2C0Xs3h1Pus1GVC1Ojw==
X-Received: by 2002:a05:6512:21b1:b0:512:f733:9eb with SMTP id c17-20020a05651221b100b00512f73309ebmr5671413lft.11.1709127473910;
        Wed, 28 Feb 2024 05:37:53 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b005131434454bsm433619lfi.228.2024.02.28.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:37:53 -0800 (PST)
Date: Wed, 28 Feb 2024 16:35:39 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ovidiu Panait <ovidiu.panait@windriver.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH] crypto: rk3288 - Fix use after free in unprepare
Message-ID: <Zd82q8lw_qH7KLCs@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ovidiu Panait <ovidiu.panait@windriver.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240226215358.555234-1-andrej.skvortzov@gmail.com>
 <Zd75LLhzlJx4nJiP@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zd75LLhzlJx4nJiP@gondor.apana.org.au>

On 24-02-28 17:13, Herbert Xu wrote:
> The unprepare call must be carried out before the finalize call
> as the latter can free the request.
> 
> Fixes: c66c17a0f69b ("crypto: rk3288 - Remove prepare/unprepare request")
> Reported-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
> index 1b13b4aa16ec..a235e6c300f1 100644
> --- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
> +++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
> @@ -332,12 +332,12 @@ static int rk_hash_run(struct crypto_engine *engine, void *breq)
>  theend:
>  	pm_runtime_put_autosuspend(rkc->dev);
>  
> +	rk_hash_unprepare(engine, breq);
> +
>  	local_bh_disable();
>  	crypto_finalize_hash_request(engine, breq, err);
>  	local_bh_enable();
>  
> -	rk_hash_unprepare(engine, breq);
> -
>  	return 0;
>  }
>  
Thanks, that was quick. I had locally the same change.

Reviewed-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

-- 
Best regards,
Andrey Skvortsov
