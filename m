Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C221EA76
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTM2ICcA"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso8217962a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 14:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700346076; x=1700950876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B119josK+jVs2ecxhPEL/ZG53Ca65uQoC2aDhpf/ABs=;
        b=dTM2ICcAaNXES3cibWpjBU/ZdPLVKkp7FXwUFmd697yL27k9wFDSw47Nz99VAy7d0U
         L9uAWwmSF4cKmFbAXHVI4LZqHMS+hMxhlC2O0wpcFQzGsq0WB+PDxFGLKzC0iWkAzywg
         wlcRixdLBSphUGCQ2h8dwmwtaVA3IoQNqSVW/9Ja9eMqceyZrsjo/OpO80UhKiZ0jYae
         IO3CXlV21IpwkIib3ppt4vRYtXElncOMzWvJBGKVE8RDeBtzkirfhxDuFCUSATE0OilL
         IXaKtaQDoTXmiouJXtaB5yPPHI8DHfoKSHFDMsTjp1Aw0JkYKGKsM1tb9Yd/GyrkCKv8
         DbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700346076; x=1700950876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B119josK+jVs2ecxhPEL/ZG53Ca65uQoC2aDhpf/ABs=;
        b=VckQrOsxxyiRsonyyP11WgEPuddLtfU5G1nvcYPDf7Bk7gqptW5gqlLqP9XPoUIefp
         TC+RAOZEBegU+lA6zyIhPU5gBCAIkoDDqsnMtcCEkg8czoyY7GVLOHOPhnDpP0uPq9CL
         V8pRMjCxQOeL/WycIdpgPTL4rmrFT257NuvcTYBrO+isY3gm3sGNQHuFZ6P6GnP/6pxW
         40C2PfXH8/p0j4bw4t9j5mHbr3CQ3b9kSDCl77YpOhWtaY7sFqW470x52eb60ZUvK7BE
         W2NmFUPq6TzG0/rGRr4lxM9bnkB85cbE3vkp1VMDTYr/Tq95Uhcev1nwvlDfZONcuC9W
         Vc5g==
X-Gm-Message-State: AOJu0YxiP+dZxEIi3Rlbj4o2BNTQ3RmhmekhCza/xix+H3jNpwtHZoZC
	hk7Euk1FktzdB5v36FDSE8Y=
X-Google-Smtp-Source: AGHT+IHfkQkjALlAHjgb+TbRxpaKzlxrqELSYFI1FqqjNE4iR+HkNWNz19BbiIKxjSub4XKj0ulFtQ==
X-Received: by 2002:a17:906:10d9:b0:9ef:b466:abe0 with SMTP id v25-20020a17090610d900b009efb466abe0mr3120554ejv.8.1700346076193;
        Sat, 18 Nov 2023 14:21:16 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id u1-20020a170906b10100b009b9977867fbsm2286388ejy.109.2023.11.18.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 14:21:15 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH][next] clk: sunxi-ng: nkm: remove redundant initialization of
 tmp_parent
Date: Sat, 18 Nov 2023 23:21:14 +0100
Message-ID: <13391015.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20231023133502.666559-1-colin.i.king@gmail.com>
References: <20231023133502.666559-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 23. oktober 2023 ob 15:35:02 CET je Colin Ian King napisal(a):
> Variable tmp_parent is being ininitialized with a value that is never
> read, the initialization is redundant and can be removed. Move the
> initialization and move the variable to the inner loop scope.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks!

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index eed64547ad42..853f84398e2b 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -21,17 +21,16 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
>  						       unsigned long *parent, unsigned long rate,
>  						       struct _ccu_nkm *nkm)
>  {
> -	unsigned long best_rate = 0, best_parent_rate = *parent, tmp_parent = *parent;
> +	unsigned long best_rate = 0, best_parent_rate = *parent;
>  	unsigned long best_n = 0, best_k = 0, best_m = 0;
>  	unsigned long _n, _k, _m;
>  
>  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
>  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
>  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
> -				unsigned long tmp_rate;
> +				unsigned long tmp_rate, tmp_parent;
>  
>  				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> -
>  				tmp_rate = tmp_parent * _n * _k / _m;
>  
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
> 




