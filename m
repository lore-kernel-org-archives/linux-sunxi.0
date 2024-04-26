Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2884E0E
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145866; cv=none; b=Hblt+VIY//SGk4vob2P2ueNkqrhqcRlbp6/fQfnRigF3dmvzsSTJBznji8C3iUF7rvpgLXsdY6WibCjZSozi4TpYJ81uxY1HG2+1+lyb/KdAZXIaSE0FJxP4zoSyPHEIH+POWER3MN2Xx2oNAthdG1aL0E5sM2LtsEFcz4XOZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145866; c=relaxed/simple;
	bh=Rck3V7A+RmzHoKveKNNk6Uc4pHjWyyyyaJfC/10inZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/slYgDpoaLXgqlopv3EAx1jPqLhFFfcGzj5vbERIfscMEVSUTMXmeYRj/gLUrQETwn6JeUz2u3U3qfY0HKcA0q+tY4105s3NvobaH4AcobNnbA+URRPCspani788BNb5qVKuoTllp2JeTtZU0z76Vyt9a6IAIbXBbmE5xuY4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3iDFSWN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3iDFSWN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e8so4171705e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714145863; x=1714750663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fnllMvw5rV4aVeEqjprC/GqDGLK/jA5NIktH0d4s7A=;
        b=d3iDFSWN9BiVSkHKUsWOeZwTOT8QzF7Wee63wnCr8t6Ydas+uBmqOjJT/BLTqyS1oQ
         JYP7z3fuwPXuebvH3Ygl1Ib0DZV47zF7KTvLRdGaxdxlvf5jiesantPuz7kpOjFjzXrP
         3q2vbVxwEqHBxwSax7LwSkT2kW4ctC+oqD+1REC/kSGZcRT6GRBktlqy7OriHREANiWW
         Wb13yk3x0vVGlBw6hMBefguRk4EI4SFCJSZMxonqPAnKNy2HFnad+Mm+eBK8XGsqvImo
         VAC07NZ9Wut0pw4qGgqugq1vwHjce2XJNyNw8ah8uPIp++hn4+yGHj251gViIaJhMwt5
         1mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145863; x=1714750663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fnllMvw5rV4aVeEqjprC/GqDGLK/jA5NIktH0d4s7A=;
        b=YRRzd9QLMtwLRifl2aquTRIUH2uh15iYnrd0as3cNtRaf++1gyJiQ+yyyUrLKzXBKj
         NpIibSLVPnii0d4nnrHMThjFi3GVLcPinaAFTO81Sr0hhiP4JMiZHQrqmHPMdfoLxckv
         E8mydkD+omMbv9y1ZlNgXv2Iqft9ly5h2V3PkH6HMPuTIY7NvPNciIfqqSCjNNy8t4zC
         YhzKK+olM8+l8YFDg4Znud8MvKcMpkPxG2e0oXAFGqNsHhQ7D5nV05cMUVwqRpc+h79q
         0iwqCCSR5VXUqUhfA1qb5+Ie0BRhwDXlx6ii47TuvsYJM91waIT+2a6zKdoztNaymRkV
         Q+pg==
X-Forwarded-Encrypted: i=1; AJvYcCU0ep4raUMEoHbxjPfiscEM6ZyPLnMMYRqGPDuTzWnmcCxcwFyvTznAE6HayVONCQU+J80ugP9iYajuKofH7eTTCDmWs0rsr6FzCwk=
X-Gm-Message-State: AOJu0YxwKMOECD/J4XPQmMeCc63fQJ56hj6rMT4ZP5m8ZmlkOiKMPACz
	7g9qskfSGDR0JJbzUfA/6yqHoJlqcZpqKFu9RJMO5gmAuUJfm/cj
X-Google-Smtp-Source: AGHT+IF86aCF2y03zjD72DabiUs318EzT1BZ/WTa9OJV2HjgTF93fx7CNQA08TDph3S28W4TYeipuA==
X-Received: by 2002:a05:600c:1988:b0:41a:7ab1:fd98 with SMTP id t8-20020a05600c198800b0041a7ab1fd98mr2473420wmq.21.1714145863392;
        Fri, 26 Apr 2024 08:37:43 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b004162d06768bsm35189838wmo.21.2024.04.26.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:37:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject:
 Re: [PATCH v1 1/1] leds: sun50i-a100: Use match_string() helper to simplify
 the code
Date: Fri, 26 Apr 2024 17:37:42 +0200
Message-ID: <3557566.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
References: <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 17:25:15 GMT +2 je Andy Shevchenko napisal(a):
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-sun50i-a100.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
> index 62d21c3a3575..119eff9471f0 100644
> --- a/drivers/leds/leds-sun50i-a100.c
> +++ b/drivers/leds/leds-sun50i-a100.c
> @@ -252,18 +252,16 @@ static int sun50i_a100_ledc_parse_format(struct device *dev,
>  					 struct sun50i_a100_ledc *priv)
>  {
>  	const char *format = "grb";
> -	u32 i;
> +	int i;
>  
>  	device_property_read_string(dev, "allwinner,pixel-format", &format);
>  
> -	for (i = 0; i < ARRAY_SIZE(sun50i_a100_ledc_formats); i++) {
> -		if (!strcmp(format, sun50i_a100_ledc_formats[i])) {
> -			priv->format = i;
> -			return 0;
> -		}
> -	}
> +	i = match_string(sun50i_a100_ledc_formats, ARRAY_SIZE(sun50i_a100_ledc_formats), format);
> +	if (i < 0)
> +		return dev_err_probe(dev, i, "Bad pixel format '%s'\n", format);

I know that old code used dev_err_probe() without reason, but could you change
it to ordinary dev_err()? dev_err_probe() is useful only when return code could
be -EPROBE_DEFER. This is clearly not the case here.

Best regards,
Jernej

>  
> -	return dev_err_probe(dev, -EINVAL, "Bad pixel format '%s'\n", format);
> +	priv->format = i;
> +	return 0;
>  }
>  
>  static void sun50i_a100_ledc_set_format(struct sun50i_a100_ledc *priv)
> 




