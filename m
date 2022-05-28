Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7A23DA
	for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 13:02:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p19so4001930wmg.2
        for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7wy3dUyQWNogGADw4lO33z6qxHFzYWUYOjv8UwSVAP0=;
        b=ZXQjp8KHD0+l6fo+NIl29eZN8iX0cX6uE+/CQW6bgjq+D8JhDED72B2SUHCYrEbKbm
         mC8qqXJpPkNGvt8DiochAm6q4hK7J/qyq70kHGwl8upA0qgIhGP7F+gAh9aV82wu7hBc
         5FQk61eV2wXtdPP3AVc7Y0uzpE8OVDauRSrFEha9KBD2m2Oiu+5EZuNfAzV7hyEAQh5w
         dvvSSpUIYxU08qcapttqQMbxlKKImU5QEbHiLokj4Yd+QuNmveuke3G5sKwZ8Wt9ChPk
         Tm7D+0t2I+4PO4wt79R59K5XADeovPyV0yvCdaoyC22bO8g6cYDw/dDiLBV7V377fepi
         WD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7wy3dUyQWNogGADw4lO33z6qxHFzYWUYOjv8UwSVAP0=;
        b=MJGWpvRyOZ0pATajRvqv9UKMRn1a2XzmAt8uJ+KQBTburF0yephcPaS2DNeF3Yy+R+
         vMhYhXxcwfanLbGkqqca8cUnOBYwtn0GIYw2T0lo35BcVqPsiAD/czOidBxMAhpNeh2r
         Hoj2H2paJAVL5ajVM2GitrzxHoG6AJCz5bzL+OatB5uoRM2h+Wj6yivxCQUj3GQ1oVFC
         qANaMe50E1bI1l8X8lFl4UjhCoPp866BccX/2QMMGVWQOMUT69G2FVOUB4RXd6ADzWR6
         jhvBt9UItWqrf9IM2OtChNdmH8Dn3ThNo+ifzEXwbuBACzhBOj9NFOjt1PNEzs7FO4WX
         7yTw==
X-Gm-Message-State: AOAM533H3k0jvxgxWgzx55eW5lKRcnD/6FX1TTVi7GX+r/gJ9M/0EckH
	8dsYxYoetxWwBy2tev6/uEY=
X-Google-Smtp-Source: ABdhPJyzFr4UpHJ1pEfZWDzcDmbvmeMbXxoNEk26RmRrq29ebEudvaKSF8uWSnPczdaHYuaHRuhYzA==
X-Received: by 2002:a7b:c109:0:b0:397:43ef:b66f with SMTP id w9-20020a7bc109000000b0039743efb66fmr11025623wmi.44.1653742945710;
        Sat, 28 May 2022 06:02:25 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m3-20020a5d6243000000b0020cd8f1d25csm4314343wrv.8.2022.05.28.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 06:02:25 -0700 (PDT)
Date: Sat, 28 May 2022 15:02:23 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
	linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - Fix error codes for
 dma_mapping_error()
Message-ID: <YpIdX5ipcm/hMw6S@Red>
References: <YoUuAsJndw7aLn+S@kili>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoUuAsJndw7aLn+S@kili>

Le Wed, May 18, 2022 at 08:33:54PM +0300, Dan Carpenter a écrit :
> If there is a dma_mapping_error() then return negative error codes.
> Currently this code returns success.
> 
> Fixes: 801b7d572c0a ("crypto: sun8i-ss - add hmac(sha1)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun8i-a83t-bananapi-m3

Thanks
