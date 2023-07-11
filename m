Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588817FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:27:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso74409935e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689100071; x=1691692071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY50bhfklwYom6IbFHdDY1XKnR9zwxPbXW3WB2UupyU=;
        b=RWaG0sP3x2YIg5aKevCdAMmLZT83c2FrrbgfmqwS7pZlxU6ab4xZCkQENYRD9NvnFR
         Xz7xr7o/VJzRT0fctp3QMC0TZeAeKE6fu8J6UGEnE17lNFMArv7tUKgqKpE8vLMQSIiD
         0MsxdDnZoYhYxs2pW4XQFOY4MOUI7HujXZI+bDSv6EHNlFZISUDU8bN/N43w+Rfd6oBA
         dgVBwd6wWBRvSIq6HxR/OmaEKS//BGrWuZTx6lynL1QjUpKcl8qslQ48LwyS8MlKclX8
         ZAKQbpDRSL4qLkheFUSRfT0zTrCLdTT6Hv1MrgZhnxaZDJc7TC20O7fC2MavzRdJKMpL
         /X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689100071; x=1691692071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY50bhfklwYom6IbFHdDY1XKnR9zwxPbXW3WB2UupyU=;
        b=RTSleklcPU7wy3ZcT1S93asqq1+bHVn9vOrd7B0bw0u5RvavOsGSUJJQIIgPrwlDnN
         qGJOs1FhrMvH0dF+OULOlpKkSf7QQB8jBFnWxjkKb7o/XOisLPy82/nSKRRCuTvmtU37
         B7EVZ8E/tF1bTyxCVbb38TuQouDG3M9uOjeN7y/+rBOvPSlexm4ymhXWsj8jFmTCfZA2
         37VJlo8cHWixJWxJHI2btlO2sa+pYJzH057Qj7MGqXFX0RNLW1yYccaYr2gRuEj0J/wA
         kEbnWuGSYEPGq6US/bP2p/Ve3FcV7PS+Cxqh9E59m5AS2uEW4uCIVu6zOSE4/pcXfAqJ
         kfgw==
X-Gm-Message-State: ABy/qLY4DyYWpEAcesldk4JTVOSXwqV4gWQGBkCes2PxT8AH5bma35PJ
	YdNAva2rhYzLrFFHIpxYSs0=
X-Google-Smtp-Source: APBJJlFc4oDq1avIkEm53uwVKsR4aP34NcWZvU8wFGjGRSwXz5Z9yA0NUsBwqFDZyh2iYIWORi/COw==
X-Received: by 2002:a7b:cd94:0:b0:3f7:f2d0:b904 with SMTP id y20-20020a7bcd94000000b003f7f2d0b904mr21276033wmj.8.1689100070637;
        Tue, 11 Jul 2023 11:27:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003fbd9e390e1sm13643250wmc.47.2023.07.11.11.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:27:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 07/10] Input: sun4i-lradc-keys - Convert to
 devm_platform_ioremap_resource()
Date: Tue, 11 Jul 2023 20:27:49 +0200
Message-ID: <5846980.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20230705052346.39337-7-frank.li@vivo.com>
References:
 <20230705052346.39337-1-frank.li@vivo.com>
 <20230705052346.39337-7-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 05. julij 2023 ob 07:23:43 CEST je Yangtao Li napisal(a):
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c
> b/drivers/input/keyboard/sun4i-lradc-keys.c index
> 15c15c0958b0..95d927cc8b7e 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -307,8 +307,7 @@ static int sun4i_lradc_probe(struct platform_device
> *pdev)
> 
>  	input_set_drvdata(lradc->input, lradc);
> 
> -	lradc->base = devm_ioremap_resource(dev,
> -			      platform_get_resource(pdev, 
IORESOURCE_MEM, 0));
> +	lradc->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(lradc->base))
>  		return PTR_ERR(lradc->base);




