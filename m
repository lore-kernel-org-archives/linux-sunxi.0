Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6023D2B7
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Jun 2025 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675341; cv=none; b=g4ApnMBY2us60hN1vmaDNW+SoecjisEeCprBFGRahYoGjFVp2oNwghWj4cMPFHMlg0lM+XO6VAdI+DBPx8Y9YRzCP0womBA/iQNVv/STpAAgo0fonT5YVbvmLREPss5+/cvZPwE0pKmfMG1+2jKAh8EY4hEPoqXhH1GbKgEqcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675341; c=relaxed/simple;
	bh=l931bTX5MDMkwV6ZzTaGAigtZpZ8cMxO2lXHTUUf198=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrTYbqjn8fjujjDqWtLUsBqZEBs8q/Juj3C+qpsX9lKzoTuliu6Gq70PrzlvQbVZG71wxz2ZHS1fansHdzJv01VJv9x9W9yODnEwxbGM1M1Kss1JY2VbHpX7v2dAvBHFSqcurEKwrnYW/BfuzQYMBMd0gYAQUzpIORh6gFjhtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dagHaK1J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dagHaK1J"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so6715787a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Jun 2025 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750675337; x=1751280137; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Yw6imxd4BTDTWrkr9aN2QlmFrVCvg38lQ/oem6/zBU=;
        b=dagHaK1JxTK5nliydiy24vEvlPm6jcRZp1n61R7lREcQqda6kc4ROGtRAYZbOjFN4U
         nwvqEvKmqjANE5FBFmZupSPA+MXU4TwfGV97ZQKBIIla6CJc+SogNDqOR7RJ9o5cIy+c
         skiCBsfhp2eS2mTXK/CszZPu9hRRobQGBP2dbqUXA4pfcluXpxD3WkDkMUW1xo+F+Qvg
         Km+3eHLYt4yhXTgdMfYoV29IDY1zfWJSnL3ppG9jKMjSn0lPj3yrHoNM9jdB/qCj4FYo
         I0tMs/FrDTlN5zrPjFeRjlzX2Wah2RGQ6Rt6PgXEHti2JETNNOrSzCOVAmWo6nRI5OCV
         Th6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675337; x=1751280137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yw6imxd4BTDTWrkr9aN2QlmFrVCvg38lQ/oem6/zBU=;
        b=lWRZ0o0X1XQ9KdMQV7skIzqEN38pVJdh7XwTzzeniie7IWrucYV75Cix4oFFVZrOkW
         MKRepSsq0grM3M39SnVVUkW8tXSPikfuGIVzEkFYQ/yoFimZC7uY5VB+XKFzDxQ9VR87
         9WCec8jwXuJgnyOOVRbp3i4dB/TAbFCI1wrAvChX2RBDd+uE8rGpWyGj5xE2APX2ZMEP
         0Kd6xeppz6Btp9IZrSYn6p9BBwupJ0OOm5n6A0cJ5T10UgnaBjhneVuKl69apvzhWPVO
         KplgKmbBgedxnHV1mGLg5FUNyPY0XD3P+9OeikGhOLRDxh8/aLbsvfaBzD+aEjWpTdax
         qMCg==
X-Forwarded-Encrypted: i=1; AJvYcCWEMII0RN1InRTFfE3JOXNf5pijgzfWaWx51SOsX5P5XPgSqDPYu6OsGt2FU4PJF4K41m7Dw7zUrcEHCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGEjxtXsZFaXqjeJWyHcyaGjGVshlRYu0lBydxrLxtovQuoG37
	q2IoHSil/590N2iV/UpPdPoliGdLLQjrEeSnQ0OFemppmFS3m2cT4I5g
X-Gm-Gg: ASbGncsnbvyIBx59y6KNof8jXFTESgnPzMXo8N5WU/n80E/lSN7nckiDh7BmzRU05E/
	YsEjnS4haDbetvOLvfju6f82pxvjdJw1oYGSp4GDein0Q4V7hLjzjLOgMoIfnkuqbMAzicxDi0P
	GPt42oU2lSk1Ao/R8TScpaq7cXQYpY7t54LgIVsBr9tgD09TeagKiIAmL8PkxadrOnA7uYBQEDz
	a2wnw5R9zaHl9qkIVfX1iIEv9x26Q00iRmizdo5+ci4muRfuw1TS4AAYpmETA3eQPsWIc+X25rN
	eS0JeE6nsNxPLmskM85cW/WeGLleiDBUapzP+tAlvAXRrMEKEFKU2HImT0GZ7i8AAEgUP036Hmz
	EWQMiO+kP74JEUvnab2XugQAFzuiVzNcIyjNOfqB6rqcrRmA=
X-Google-Smtp-Source: AGHT+IEfNTyPHjwPJEzLQfQoS55yQsLH7CzoYZynUgBsxDONAr3ULxD/B75b39rL0u4RhOVhHN1eXA==
X-Received: by 2002:a17:906:6a1a:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ae057c0d793mr1084866966b.47.1750675337254;
        Mon, 23 Jun 2025 03:42:17 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069? ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm687693066b.111.2025.06.23.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:42:16 -0700 (PDT)
Message-ID: <0b963009-85fe-473a-a65b-6b427bee98c5@gmail.com>
Date: Mon, 23 Jun 2025 13:42:15 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: sun8i-ce: Fix `dma_unmap_sg()` nents value
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250623091009.65436-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20250623091009.65436-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 6/23/25 12:10 PM, Thomas Fourier wrote:
> The `dma_unmap_sg()` functions should be called with the same nents as the
> `dma_map_sg()`, not the value the map function returned.
> 

This should already be fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=b6cd3cfb5afe49952f8f6be947aeeca9ba0faebb

The sg nents are saved to request context during prepare() and then used
in unprepare().

Thanks,
Ovidiu

> Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index f9cf00d690e2..ce9d071f5693 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -326,8 +326,8 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  	struct sun8i_ce_flow *chan;
>  	struct ce_task *cet;
>  	unsigned int ivsize, offset;
> -	int nr_sgs = rctx->nr_sgs;
> -	int nr_sgd = rctx->nr_sgd;
> +	int ns = sg_nents_for_len(areq->src, areq->cryptlen);
> +	int nd = sg_nents_for_len(areq->dst, areq->cryptlen);
>  	int flow;
>  
>  	flow = rctx->flow;
> @@ -336,11 +336,11 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  	ivsize = crypto_skcipher_ivsize(tfm);
>  
>  	if (areq->src == areq->dst) {
> -		dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_BIDIRECTIONAL);
> +		dma_unmap_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
>  	} else {
> -		if (nr_sgs > 0)
> -			dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_TO_DEVICE);
> -		dma_unmap_sg(ce->dev, areq->dst, nr_sgd, DMA_FROM_DEVICE);
> +		if (rctx->nr_sgs > 0)
> +			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
> +		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
>  	}
>  
>  	if (areq->iv && ivsize > 0) {

