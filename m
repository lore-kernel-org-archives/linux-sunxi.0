Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABE7F3
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Jun 2022 09:25:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so735428wme.0
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jun 2022 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Y8/6Pp5nGe2A+PBHGnSzBKqXDqyKAzy6/w/p+LLoPqE=;
        b=fKuH9IFPhd8ollg8ZJdh50nLElXMUmYvIXhDkBYh6EsB9ZMN6jd9Bm+K47cU3nr7q3
         tVbyu6GfEZCxth2w9I1GSRzp9ytqPLPlFBedJ7DT1lDhxHu/+bzqtkFqlzCs6yl2Lnn+
         oHcXLBcrLdA85eSsdPZsTHB1JKzL2piN7aD2Jn/pEIRPzxOmozbZaMKoOMhRoFHs2N2l
         i/LaE0qNCn1JS8YMUpkn7QRyO5d29soOih/KyfGCYd5pWJQsMbuLpk/a8CeDKq+mUFrD
         Vcy7iQ4+RbEzxL1TR5Uys8uQ8gFv07vBGBzfn9uo8KvjP2ryp3O9Q0f8ejr7/XaJZ+y8
         LBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y8/6Pp5nGe2A+PBHGnSzBKqXDqyKAzy6/w/p+LLoPqE=;
        b=Xnu02Vx3bmJtIJzEIH3D+lF5ALwLz6L5cuR+FnzirSmGt9YDybSeBlvuDRoepAf9Vf
         zOHKOPQC2U0IhAu0XWJr6geGpHyGvIF2PZNoteZDza0Yh54gyQlW8SfrHrpO3Z8lt2rl
         yvaoHX7jf9QEVPAlj/OG4TLgI722rcjejSWARnTqc+IGNAWrZvyTdq+50Mk8Ie5C0H/O
         K0LJiMlZGjjPLKQokSAv0LXXdSgMNkc7x+uQj4jBb+6TNzLw0pvJMxPn4rAtxAnLkLVv
         P6XFofN/S2mi66Wchwu9N6rwoVN868UAhZB/II0EJsV17Edn1o2NyQG/99/FIeimUPxN
         Plvg==
X-Gm-Message-State: AOAM5318w02J31yUaD6SpvPLZj7f60+JP2j6meiUsBXzq7bbzAhV1u3T
	c0BPBhkZDeKReo2jznSL60c=
X-Google-Smtp-Source: ABdhPJyODB04BV+Y8YIGQ2QxI4z6EUu+ICtspXZRf3LSI9ZoiefZdZbGVuNKzB2ZMiYafTKqHOfgCQ==
X-Received: by 2002:a7b:cc8e:0:b0:39c:829d:609b with SMTP id p14-20020a7bcc8e000000b0039c829d609bmr2927131wma.160.1654939541797;
        Sat, 11 Jun 2022 02:25:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q17-20020adffed1000000b00219f9829b71sm477266wrs.56.2022.06.11.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 02:25:41 -0700 (PDT)
Date: Sat, 11 Jun 2022 11:25:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] crypto: sun8i-ss - fix infinite loop in
 sun8i_ss_setup_ivs()
Message-ID: <YqRfk2Jr++9WUk7h@Red>
References: <1654885635-32290-1-git-send-email-khoroshilov@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1654885635-32290-1-git-send-email-khoroshilov@ispras.ru>

Le Fri, Jun 10, 2022 at 09:27:15PM +0300, Alexey Khoroshilov a écrit :
> There is no i decrement in while (i >= 0) loop.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> index 5bb950182026..910d6751644c 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -170,6 +170,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
>  	while (i >= 0) {
>  		dma_unmap_single(ss->dev, rctx->p_iv[i], ivsize, DMA_TO_DEVICE);
>  		memzero_explicit(sf->iv[i], ivsize);
> +		i--;
>  	}
>  	return err;
>  }
> -- 
> 2.7.4
> 

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
