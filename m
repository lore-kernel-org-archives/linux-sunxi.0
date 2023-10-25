Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10771CAB2
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiuK048n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40842752c6eso44551415e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698239675; x=1698844475; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkwfkDFcx7Qd4lPxQDGJFr4+GYrnmCr3zCpgntOLtp4=;
        b=jiuK048nbT88gFR0DrxgVJUBtRtDyd8QE3MIvET2AuKuhe2PHV8k2JYvyIJ/UknqSI
         iYUZCageZt8slyjhrp3MUxLzWXYhiM6saRhD9eNDMwWCvpO513Hm6JcCGRI8qh4z1dMC
         fywsJ2XKimy5fVmFxzp9R9Pm6FuzCCPIFuRzSyoG1g8yCKGn2svUZ3qXnfzYmdk+85Cm
         YmZjOjCfFUz0OPj8wNt38MKInAUr9qkpszo/6UAhigrGJoAsTdigAlfwOxa4qBuZSSNW
         sCJFsETsL+3L6BM76w6mJ9iy7AtPQoyRkeMX81p30PvibR4TMzj4XSHB9S3UaDZeoDVo
         MMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698239675; x=1698844475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkwfkDFcx7Qd4lPxQDGJFr4+GYrnmCr3zCpgntOLtp4=;
        b=Ah6paI1EnJ/hpYGF29QPRZX4/57gbQjlSr+N22ijnuLlmDBOD/n0xXhV0WfFKrGDuq
         iWg7c15vSz5wL5X+1WQ6YCABExVjYKlRkC7MoSPsJYuCNTQAHy2M38Cvd4Wk8LKArGEk
         IIsoT5uEZ5rmz5Zm0xHNmNq/R+qxi9h7/5s3Nd+VSFJCVWHUphviyVCDkDtFN1JRr8C+
         xArcvb2vFTcFYFLdz1YMrurtZMTG9vn0VZZ62Iw2QSM+P8kM1q5fqMyWnI/xTHq9VsYv
         X+DPiiE43WU699vpmBU5qcqaUrpAPpqsLleIxC+SBQoF25lfV1gWLmvQKoaZwjF9Ww3S
         Q8uA==
X-Gm-Message-State: AOJu0YzRjm1QyZrdtrSnO7dOPDSHch2hYEi7jkmuMYJvHDodRGm34Ivg
	ZWBruWSmbgNDGsMqG3E8a0I=
X-Google-Smtp-Source: AGHT+IFIiz0Gaa/L3N3mVvS6AZLsa1VCn8csfWCEXKdQ05Lj7wJli+7bRyrc7CgPva0DpaJiaRG8Mw==
X-Received: by 2002:a05:600c:4747:b0:405:359a:c950 with SMTP id w7-20020a05600c474700b00405359ac950mr11938669wmo.19.1698239674751;
        Wed, 25 Oct 2023 06:14:34 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id x22-20020a05600c189600b004083a105f27sm19036428wmp.26.2023.10.25.06.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 06:14:34 -0700 (PDT)
Date: Wed, 25 Oct 2023 15:14:33 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH 02/42] crypto: sun8i-ce - Convert to platform remove
 callback returning void
Message-ID: <ZTkUuQ4cu-Z593_f@Red>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-46-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020075521.2121571-46-u.kleine-koenig@pengutronix.de>

Le Fri, Oct 20, 2023 at 09:55:24AM +0200, Uwe Kleine-König a écrit :
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> index d4ccd5254280..1741758e03eb 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
> @@ -1071,7 +1071,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int sun8i_ce_remove(struct platform_device *pdev)
> +static void sun8i_ce_remove(struct platform_device *pdev)
>  {
>  	struct sun8i_ce_dev *ce = platform_get_drvdata(pdev);
>  
> @@ -1088,7 +1088,6 @@ static int sun8i_ce_remove(struct platform_device *pdev)
>  	sun8i_ce_free_chanlist(ce, MAXFLOW - 1);
>  
>  	sun8i_ce_pm_exit(ce);
> -	return 0;
>  }
>  
>  static const struct of_device_id sun8i_ce_crypto_of_match_table[] = {
> @@ -1110,7 +1109,7 @@ MODULE_DEVICE_TABLE(of, sun8i_ce_crypto_of_match_table);
>  
>  static struct platform_driver sun8i_ce_driver = {
>  	.probe		 = sun8i_ce_probe,
> -	.remove		 = sun8i_ce_remove,
> +	.remove_new	 = sun8i_ce_remove,
>  	.driver		 = {
>  		.name		= "sun8i-ce",
>  		.pm		= &sun8i_ce_pm_ops,
> -- 
> 2.42.0
> 
Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
