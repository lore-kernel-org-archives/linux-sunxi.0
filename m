Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1B1DE8B2
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745778226; cv=none; b=B1tD2m+XD8/zMk+NOQx7J2zPUAb2vtCekeIZCHy/g87nhpHtb+k0ilhls9det1ahy9BsiIN/gsQZYb7K1wCrknYRswPeK9wKOrz9aHOAZTsjVSki+2oogxBLtHmfhxb+ryllbBvVdBK04PjVhOjZkpshpu4Q7Q0KJRVE7j/FVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745778226; c=relaxed/simple;
	bh=1duZXEd6o6yqgIxjU3gS1pYSWkmrgiC7CikfmSykev0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ4Pp2b8DGnv5VAiXtiQaSh81yI6MkAmcimPWXfvEktOGeQY+ffS8fVQt8MisT0Z4OlqTLY5xJ7ko9+cFxIS6w+3qOW4hpmWom5gHDOgHIg6S0KBG97ZxPjJS5a2FyS+fTIH3i7ZgaYQuIDy/FOCVPQofNcew9q7m/K0HDQRmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7tYUb7p; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7tYUb7p"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so6588892a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745778222; x=1746383022; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUSiCMc3+HiLY3TDrmFMgC3VJtgyOzx1EV4C1MFAjrY=;
        b=g7tYUb7p5t40/yHRu3ow4qbBiJFfcRG58RxhC/QYXvFZtXODpxcq1dc3StFUgR1dDi
         KIk/5eaMmRPCyO6MirbwcN9CH8mosI1zzcGnjhPG+GE9Id1Sju2l/OsKt5cckiap3XX8
         bGoPtetIpN/tbZMN7UtMcBHmVeRGPBD+vo9BdLjhZnto4DZmBnIsNFJ8nT6AVgEGqBcK
         NQMadYv51gw1fxis0MpVeaCmQvAX9JkltD9SXfnRs+3LVRTt0MNoGGyDiyRI0+8I+i8t
         XWxlPyK2SybjK+M562cXXwjkHIJxGptkdhp7Qgcs5xv5XPsv+W7/8kDwNnXUXYopYZoW
         odUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745778222; x=1746383022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUSiCMc3+HiLY3TDrmFMgC3VJtgyOzx1EV4C1MFAjrY=;
        b=w8YjClIycUgy8snquw3//91Ov2ucpmza1SlbtjXFB92V6b00tx+/qQRlRznN6hVFI3
         fXkQ6D7nDuLJ+SJYeC0mlTCEB3HhGaLnJ3/iY1a2aMQIO0ofwMOtyIQOwf9LZerTH33e
         vQ7IGhQFRWdlRri1mxsP3ePGjHHq79o34wRnmh4LedTgvtjLX7YnV1zoigkBldnahbw1
         ZE7W0UYFuk1ftI076iF0Dqx8aSr/kWSj8vvvEFEt1S6WsSqevpglu8LxLR5Xw/6ttdYR
         k/gy+zsID2JCO/VPzXVBjtZDXkv96v9v/Xb3fvExO8un+PXtYs48c4KQz85tPd45PNdW
         d2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV67PxIZCZ+QfCvvScUq6MR/uoyiSJYXylHsLMjyBqshA1swG5ae+C3q4ieLTyg+4xZIueVJmLLyh16Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwE80m4KSxgMOg9XJWu48brFmoWWVNxeq/Uv1gSxNKDqhGB0ee
	s6C4S5YWhg+N/uOumnoyT13rj9djNpEEfBRq1DUzG0wv3cTCXwYw
X-Gm-Gg: ASbGnctUSGvZyLlOv2oS+6/+r2pdMy+DXNdHGg7xUcqoKKjs8RnmtSmmbSygVeQoE2X
	eKWKz1L27QCoQhAx16XaS7DyzHeOe4ygvubcMyydZvjC2M2/DtEFpHSTrcszSFuRH987n9iX3Mm
	udB+zJsbtANne1/omb9s0hMSeQtXLkMzTxJyst2DAj1WHUVZgnaPB0xTSttxL15YE0JJihBPDWM
	/g9ovex21sglXD5FjgW2zvpTMsHdWXvGGg57icRZhKJMCfvKXmoBINhthZA03GoYo/OLskts+Bm
	xak5MI2K8dQ6+u9XqSGGNcARi0+qLaUlKoAIg/eoDsxhTyessRarJ0zvARYjolOHkoyUb7cglnp
	UgYy4mIr5L5Wq4iZE74ThtJnPxD2wsk45cOEW
X-Google-Smtp-Source: AGHT+IFvq46nAYQLC0nkEAA7EJrWLuZNcuxxB8BvzF8vxeFLFcLhIZ0aOQG+z7k46qu9zHJydkv9Kg==
X-Received: by 2002:a05:6402:5109:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-5f723a15496mr7817963a12.34.1745778221650;
        Sun, 27 Apr 2025 11:23:41 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038328f1sm4417391a12.70.2025.04.27.11.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 11:23:41 -0700 (PDT)
Message-ID: <e147c220-92e1-40cb-920b-916cf6703b40@gmail.com>
Date: Sun, 27 Apr 2025 21:23:40 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before
 calling DMA functions
To: Corentin Labbe <clabbe.montjoie@gmail.com>, herbert@gondor.apana.org.au,
 jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/27/25 2:12 PM, Corentin Labbe wrote:
> When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
> selftests.
> This is strange since on sunxi_defconfig, everything was ok.
> The problem was in the IV setup loop which never run because sg_dma_len
> was 0.
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
> 
> If someone know why sunxi_defconfig have sg_dma_len() which always works
> even with any DMA call not done.
> 

It seems that sunxi_defconfig has CONFIG_NEED_SG_DMA_LENGTH disabled, so
sg_dma_len() defaults to sg->length.

From include/linux/scatterlist.h:

/*
 * These macros should be used after a dma_map_sg call has been done
 * to get bus addresses of each of the SG entries and their lengths.
 * You should only work with the number of sg entries dma_map_sg
 * returns, or alternatively stop on the first sg_dma_len(sg) which
 * is 0.
 */
...
#ifdef CONFIG_NEED_SG_DMA_LENGTH
#define sg_dma_len(sg)		((sg)->dma_length)
#else
#define sg_dma_len(sg)		((sg)->length)
#endif


On the other hand, multi_v7_defconfig has CONFIG_NEED_SG_DMA_LENGTH
enabled, so sg_dma_len(sg) defaults to sg->dma_length and it would need
to be used after calling dma_map_sg() (as indicated in the comment from
include/linux/scatterlist.h).


Ovidiu

>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> index 4caf17310e90..ddec1b08d4f6 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -141,7 +141,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
>  
>  	/* we need to copy all IVs from source in case DMA is bi-directionnal */
>  	while (sg && len) {
> -		if (sg_dma_len(sg) == 0) {
> +		if (sg->length == 0) {
>  			sg = sg_next(sg);
>  			continue;
>  		}

