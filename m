Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E14EB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:13:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id o22so6328987edc.10
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=s2xCRCS5m4i4+EfBqMdOEQInaq/ShuXp1FW8bVckG40=;
        b=WAX9jpeTuNWjlK8hqNNxEsbMZ7M3aD+MgDj/BVKuUiGwTEAG17A1knJU8BBwA4hJLI
         /HAobNHHkFzxsZDlBjIj+o+3o/+6iXtKmwc4xnaXjaDOY912JF8twRccony2QhKgvpfW
         TcyGggtlXvNwPPIoSkb9Lt9CIi6oNAHS3KlNenppEF7SnhcoEnZBDDQhFLgLWXfvP3At
         Yl4REhB2gt4ghQ67RDOKrPaGLyt+LOAcuXAsF+P+cbJo7vI3lVKl9iu7p857sQEhgSZn
         PfRVlFm+SkktqecyYSYVmEej1B8TBwHPv0SHJjpB3R9xoBcQMFRfxWnOlbgMhqYakwnF
         dnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=s2xCRCS5m4i4+EfBqMdOEQInaq/ShuXp1FW8bVckG40=;
        b=zC/iLb4pJsVe/CbB1ZPPFAuOKOisUNntTsbmTgoVrrNC+rM40BU9wRYFFu0dNNvig8
         2kOuoCNb7yZN0DR+L9cHbagnrJcLiXqJ1W99dKIAUcAlo8T0l3cRgmFXKVDrzxQeI/wC
         zlU0ATj2Q1WBAxbZiCQE46nqna0BvYLktkh4F7/dQGr2Lyy0ql5lvb9nNmlR6rR+P8a+
         O93yd9x+kmGcDLO5f2psV5rmuAVdWuSXctQn4JQvieAJ93xvbIdEW9MeYuy6l+yEAcSF
         Zr7nv+YodUFNoi1WeoFw05Svovzl3eFuRxmmWgGJYrkdi+sKRHA4L691mTbVPxJhlEJg
         qRLA==
X-Gm-Message-State: ACgBeo1McW7/on6ouCRyXV9iJ4Hd09BQ8M/RqwmF8Ua/i0n8NLrR6glp
	v4estrNxby+QvN79GWuMZqg=
X-Google-Smtp-Source: AA6agR42k51Lq8Yp/MP5cdbyrsfugOi+nLPScpkpXy8R/epCeq6yMXoPKsS9t/LJLtkE6kyFkTmLCQ==
X-Received: by 2002:a05:6402:331f:b0:43d:931c:6945 with SMTP id e31-20020a056402331f00b0043d931c6945mr10280751eda.199.1660472033733;
        Sun, 14 Aug 2022 03:13:53 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c18-20020a056402121200b0043cc2c9f5adsm4496602edw.40.2022.08.14.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:13:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, cgel.zte@gmail.com
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] crypto: sun8i-ce:using the pm_runtime_resume_and_get  to simplify the code
Date: Sun, 14 Aug 2022 12:13:52 +0200
Message-ID: <8140378.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20220802074820.1648786-1-ye.xingchen@zte.com.cn>
References: <20220802074820.1648786-1-ye.xingchen@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 02. avgust 2022 ob 09:48:20 CEST je cgel.zte@gmail.com napisal(a):
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
> and pm_runtime_put_noidle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
> b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c index
> 19cd2e52f89d..ef9cfc61af32 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
> @@ -54,9 +54,8 @@ static int sun8i_ce_trng_read(struct hwrng *rng, void
> *data, size_t max, bool wa goto err_dst;
>  	}
> 
> -	err = pm_runtime_get_sync(ce->dev);
> +	err = pm_runtime_resume_and_get(ce->dev);
>  	if (err < 0) {
> -		pm_runtime_put_noidle(ce->dev);
>  		goto err_pm;
>  	}

You should also remove braces, since there is only one line left.

With that fixed:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



