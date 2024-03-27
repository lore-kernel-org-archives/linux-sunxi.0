Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3F12A157
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569217; cv=none; b=Tlxr/8XgaALodYM0jaIEXfQ31v26PtPHEdvEIKbE/8h4KZlDHmeQjKKCC5oCyqmtuBKGrxeUTrea2Sgn1xsjEUQFic3mi+LS3q8IWhs8z2RqIM97TOs2rakrAqLQW9tDC/iR1wejzLR4RdK5p/hp/M0pR6ey+3HMHLZZy9FWz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569217; c=relaxed/simple;
	bh=ljsJCTmbqL+1Z6c/Njgs93wJGruVEOG6LewDHWZFBDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnfOO5CqIeLxCmWGZO7H51abLRgUAKiz+DtHlZ6gWMK6euSAkr5wQM091aGMGLDNFpqeWR7ONtWTV7kkSMW3tlnpAQF6ok0RV6eMN5733BO8RX9SGPZFi+yUhzL5dTnHh6qR1KOCbh3RynORpa0a91Hla87vF+ZQ6EmmR8I7qMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMqicsTb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMqicsTb"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4e1566610fso10300866b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711569214; x=1712174014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdNTF6Kva1P11bABP85E0dh07br2jNGfWJsQyRATEsM=;
        b=UMqicsTb/Wwmve72fa8DgQUnBvjTDr9oynJ9KDPrKcvaTdBm7r0j6khm40NeSsWXeR
         dudaMMPSCUdQTu44BnsxGcSAL2O5615G0mj3+yY1SDHjCBG3kAozXujv0lY0a+jWsgbl
         BoNnsm62wlHf7UxMOYfN0qnVEiVHkC1tkAwZsI3vevNcBXAZyy6kXtx0JjXYN8dmwbu5
         vN3//b4u8hcA6VV4eAoJu8ReJ9zoo5aX+uHNfaEj81Je78MSosDr6KmxtVEZkeaMwxWc
         mW2JyAovco86lb3QFRJmPC7tiVrR9veqNcwwwzYLITTyrN8LxTscaKK8+HDVRKQ/uTrT
         ORJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569214; x=1712174014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdNTF6Kva1P11bABP85E0dh07br2jNGfWJsQyRATEsM=;
        b=Jn1uuPJ1Ta9rhneGK+HCq2Yz8IO5xXX1oGuUb18YMxDaz4twlySkp4g4eXXQuPbzxG
         R6wK9E27ETQdUI5nhkT+YAmr4IyUfSOHidJqI2R1lBY/54g2ElD/7aKFqHXg/CLV7QU9
         5IQ7PU5nOq3G1S45W5uCgEtNiP57V2jJzzAzZeCervCdDztdV4knTMbI+8dU2fKJzLP5
         NFldPiv942k8d+hXvJI9mv9WgAt3KvaqfTmlR6V9ijEz9C7G6I79JWkrxf+Gt6LEVu95
         9a6FNgU0jtM94UMMj7nl3c1enE3TCK8lMwEwX/B4bjzqFL5YaJC97GwYKwrZ7qILgZmG
         fbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt34MoDWBcUQPGfbVy9S6sXg0PskUw7MolYejUPxJbIXr0OdlXe6PVVNpVSjXN8Le2p0rKMA3GiqcT+j+1GmiUL222qDe1Cjyeyv4=
X-Gm-Message-State: AOJu0YygavyQ+8EErdmNpdNfr0Br3xsAUnLrayyIICYvIGdDJyksYgwh
	KUNaIPBf5I5O3uAl9idKqJn7FdG1qsbYkwNSdSRH2KgQAi+MAaZ9
X-Google-Smtp-Source: AGHT+IEJHCTAYc5wMgN6Si7Qw5l/pWCJQkkzN4bIwHlGrIGZr8/mrHXa8XC/hK8xrg65wMHL8M4lnw==
X-Received: by 2002:a17:906:e59:b0:a4e:a7a:84e0 with SMTP id q25-20020a1709060e5900b00a4e0a7a84e0mr335504eji.34.1711569213895;
        Wed, 27 Mar 2024 12:53:33 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709060acb00b00a4733982ba9sm5757294ejf.160.2024.03.27.12.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:53:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 John Watts <contact@jookia.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Watts <contact@jookia.org>
Subject: Re: [PATCH] ASoC: sunxi: sun4i-i2s: Enable 32-bit audio formats
Date: Wed, 27 Mar 2024 20:53:32 +0100
Message-ID: <23447395.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20240326-sunxi_s32-v1-1-899f71dcb1e6@jookia.org>
References: <20240326-sunxi_s32-v1-1-899f71dcb1e6@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 04:50:03 CET je John Watts napisal(a):
> The I2S driver already supports and checks for 32-bit sample sizes,
> so indicate this size is available for use in the DAI driver.
> 
> This change has been tested on the T113-S3, but it should work just
> fine on older hardware as get_sr checks for sample size support
> correctly according to each core's datasheet.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
> This patch enables support for 32-bit audio in the sunxi I2S driver.
> 
> I have only tested this on the Allwinner T113 but I'm fairly
> certain it will work on older boards.
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a736f632bf0b..aeea852141c1 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1103,7 +1103,8 @@ static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
>  
>  #define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
>  			 SNDRV_PCM_FMTBIT_S20_LE | \
> -			 SNDRV_PCM_FMTBIT_S24_LE)
> +			 SNDRV_PCM_FMTBIT_S24_LE | \
> +			 SNDRV_PCM_FMTBIT_S32_LE)

I wish it would be that simple. SUN4I_FORMATS is cross section of all I2S
variants that are supported by this driver. If you check A10, you'll see that
it doesn't support S32.

If you want to add support for S32, you'll have to add new quirk for each
variant.

Best regards,
Jernej

>  
>  static struct snd_soc_dai_driver sun4i_i2s_dai = {
>  	.capture = {
> 
> ---
> base-commit: 72fb52fb0ac44b6a1edd9bc390e44bce3acccd26
> change-id: 20240326-sunxi_s32-f2ab25b8e688
> 
> Best regards,
> 




