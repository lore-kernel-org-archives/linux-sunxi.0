Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4FB79C3
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFsu5b/5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507c5249d55so5427044e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 14:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698096512; x=1698701312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i5l9FjisPDPcqgMEOco4v6QQottzWN3f7xhyjrsuPE=;
        b=LFsu5b/5JepxjTE/MTSqps/jaDjEeBg0gcynw5wFa5kqyHGL96Wny924Plc5pulm4h
         Jr9XuCWnX/f36Be03WZrd+Z2qAsJy8a52ji65QhCM4rluBawLSUM2HJc5797z7me2ogv
         mz26yWqtSDFLe7yHEYq+O7jSTxmWEBY581tiH6kGz2hrfXP3xhNSkQDylV3ugKD+JZXL
         ILBtEMLz9Az6I9vnRjuKvNYO/XO7VQhufUIC0vUk5i5CDnZCxzeqBOGBpDRvooxK3t08
         KwedC04l+pCsqnObC1H0UFd3h9ATbsv02qH/LBRkjGF+g/+FnVPIu/8AGkZeWvfXqyaW
         9mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698096512; x=1698701312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i5l9FjisPDPcqgMEOco4v6QQottzWN3f7xhyjrsuPE=;
        b=YWtnINxZL6CT1fVlapYom5GET+bG6vdNNG8c9y1VxidIGA7S0RX0uGVkiPmZUPXQ7K
         y+l+N1GpkyewBLOa/p6iaqUWY3a5mL/K3JAbHKBeA4kZ3+otEwvAHy58eOBgI+Kukf+m
         fMuQUcfKsPuVFBnUU34xZyI5PE9cPgpD3XlH0dNDTDtSvpQHZPfz8Gbb1hLKQ739FdfA
         3HrKyKG+1usjIQUyL5TIft2S+gY0wmT4OACVLDNsGEBDoPR+HAzJvku+bsEihnldqPSl
         VC5qEbdib8wxClE61CXk9cc8Fcs2S+Mt6jJ7Il/TXBmBeIywP+2m0/IqCmdqpaFyYvhF
         7bZg==
X-Gm-Message-State: AOJu0YxT7wcVSYlp67+xW3pUp0WGls6xFunNd220e0XKLZab45XjOj7B
	WbuqYQNfVkRXL6ibHgsZmvw=
X-Google-Smtp-Source: AGHT+IEf+hJBpR5SXhMS3VVLSjHNP/1//4tt9MjRaPhH6/m5DlgNbmQlN9gKwgp6ApxZyeAQlMzb+A==
X-Received: by 2002:a05:651c:2112:b0:2c5:1490:1687 with SMTP id a18-20020a05651c211200b002c514901687mr8100017ljq.33.1698096511675;
        Mon, 23 Oct 2023 14:28:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600c3d0900b003feae747ff2sm15256302wmb.35.2023.10.23.14.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:28:31 -0700 (PDT)
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
Date: Mon, 23 Oct 2023 23:28:29 +0200
Message-ID: <2924841.e9J7NaK4W3@jernej-laptop>
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

Dne ponedeljek, 23. oktober 2023 ob 15:35:02 CEST je Colin Ian King napisal(a):
> Variable tmp_parent is being ininitialized with a value that is never
> read, the initialization is redundant and can be removed. Move the
> initialization and move the variable to the inner loop scope.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

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




