Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C51CAB2
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSK5IRux"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32003aae100so533805f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698239637; x=1698844437; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0snOBFDkNxaQ8hqvYUXLFUigtIsrarAvrFjX75PwbE4=;
        b=YSK5IRuxSGSt5ndnSsVVX8gqfAjXE8G9IzbGFJmdMJuCDGqJSGidpaKwSQWr3EzZGd
         mThUR12PP/0hdQsZTRO7R6edNN6GOo0CRdD0vlNIxiwwE9YUUbn1/+oX+R8hslqTI7L6
         t8U9IZTEnC2iTapaxkoazxNR/6ZSMtE8cJlbcX2DUT0E9nFxker8VFtQnSijHXDMaNu3
         ZZ1ORSCIyzQliLW+BiHNJeZ8nynchpOG9OJxhjqn+rLuC9lFYMv3h8GvhWZhXQGfLZU2
         2eVbcHSiakhbItATeVaL4fh6GuYQXyeia08Mw9cJQ3IfxF3iWTGa/fwfkmfZQPG6yBbn
         Qm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698239637; x=1698844437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0snOBFDkNxaQ8hqvYUXLFUigtIsrarAvrFjX75PwbE4=;
        b=v3fccMvoJA1lOy2MDrQQmkyf928BL7kHTVaii4o3NLMEE3a1Ovx4FhfFIZgqAe26Vs
         l9eYiXPeUGjR082P7ssEUqdCLt1n8VdzXrWg3UKnnwKPv9zICJcAwPygNZSHdQ6Jp9vP
         2NAIh5iU5PV4UHgPzpFpldv5dOMQdww3RJLjohv9a1NspYejeXxT8Sv0tm92lUvUw6ir
         08i4J4UUoXkqyo7JFwVOCRAS1sHr82Q0oX9/5IK8dKYGLFVs3lPVR4SPLsSgjdLfBzqq
         +Z+zZ8jeYwNZviJHHqx3Nc+ZyvNqaHW8iL6hU80Ja0psyRZHy9inWV+8tzzAWOHIpnMk
         QbVQ==
X-Gm-Message-State: AOJu0Yyu2noyx0OtDqJgKwpuWHDijO9JcTsexUTk1ogXo0WvLzCD5DEK
	n4EJ4uoocUymII5VliEYdRs=
X-Google-Smtp-Source: AGHT+IErz0EQGvLQbRef9SN5Vh8Xo+GHXjPBuT+skFgyEYLw4/yqaK0Z8I+UnZVewsLLXzAzENPDgg==
X-Received: by 2002:adf:ecd1:0:b0:31d:caae:982d with SMTP id s17-20020adfecd1000000b0031dcaae982dmr13700694wro.12.1698239636579;
        Wed, 25 Oct 2023 06:13:56 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id x12-20020a5d650c000000b0032d9a1f2ec3sm12019266wru.27.2023.10.25.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 06:13:56 -0700 (PDT)
Date: Wed, 25 Oct 2023 15:13:54 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 01/42] crypto: sun4i-ss - Convert to platform remove
 callback returning void
Message-ID: <ZTkUkp3NPpX0blk0@Red>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-45-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020075521.2121571-45-u.kleine-koenig@pengutronix.de>

Le Fri, Oct 20, 2023 at 09:55:23AM +0200, Uwe Kleine-König a écrit :
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
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 3bcfcfc37084..ba80878e2df5 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -509,7 +509,7 @@ static int sun4i_ss_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int sun4i_ss_remove(struct platform_device *pdev)
> +static void sun4i_ss_remove(struct platform_device *pdev)
>  {
>  	int i;
>  	struct sun4i_ss_ctx *ss = platform_get_drvdata(pdev);
> @@ -529,7 +529,6 @@ static int sun4i_ss_remove(struct platform_device *pdev)
>  	}
>  
>  	sun4i_ss_pm_exit(ss);
> -	return 0;
>  }
>  
>  static const struct of_device_id a20ss_crypto_of_match_table[] = {
> @@ -545,7 +544,7 @@ MODULE_DEVICE_TABLE(of, a20ss_crypto_of_match_table);
>  
>  static struct platform_driver sun4i_ss_driver = {
>  	.probe          = sun4i_ss_probe,
> -	.remove         = sun4i_ss_remove,
> +	.remove_new     = sun4i_ss_remove,
>  	.driver         = {
>  		.name           = "sun4i-ss",
>  		.pm		= &sun4i_ss_pm_ops,
> -- 
> 2.42.0
> 

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
