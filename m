Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDB28EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:32:33 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so5745168e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691328751; x=1691933551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkF8V9SS0Dv10Mhzf8yo4sbGOfqu3VWFivFwQBx9BP8=;
        b=SuQitmxEhvU/1w8QJiYfUxj+Tqz5kpgI3A5tIKj/rSs862S8vCH8MYUKDKMz5zUVr2
         0veZrYBG3IiXFiUORkM5LcDl450UGWI2KZpsBJWezv5ht15CK3VbaRnyBmVD4gvpk0J1
         M7KYnuRGzSEeBAAeY8Xe2hfdmkitvFpwH5aJFbPFyKjGKXNR5Ql61lsPJzsQOdd0fT+h
         SdVYCmteP0u5atDkkokhz4bak8dQrPAGwlHE5Wxk+Pud2kOusRexueld61C2UMZmRpLa
         UKK1pJR3yGnPXmETF5Knr27eWtB72fE/wBpsMIaWcYjwS8SEgFXOaXM9uI7B760gYN43
         cSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691328751; x=1691933551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkF8V9SS0Dv10Mhzf8yo4sbGOfqu3VWFivFwQBx9BP8=;
        b=Q4Irt7hpEoDKnmukqNXLK8fNjX04Wgih5BsEuxnyRaCSiN6n/zjRqv51tJlLlUhivu
         BFPq7OPBc7iOUCsnjwFCZKSwsLPjSpapH+UwrXzE2TeD3W2QFP3WKRhZW3dz6YQcN3ad
         DnTjAUgEAMi6thdCQgn1cRwM0cB7IMkrpF0rA5nkY7v3cze0RS+8t6dehRowzpVKGF+T
         8nXcVga0q78WabfDvin65icIct3TFQBVoofttW5hxR/TL87LOapUK4Hnu1VMQxL7Y6Xz
         6fcN7yRi5Om7XpB6gXM/Bxdxn10lI96Dd1kRSmBcN8Nn6SPhoa8T+i0je6E/te9vek+S
         cNWA==
X-Gm-Message-State: AOJu0YxjrEYjU/O9q3P+MiWfwnSoJ4NRXVeb467hQN1yRcTMw5I30PGn
	33QOHurt3ocCl8WpJOCQ8LM=
X-Google-Smtp-Source: AGHT+IG8L0BCJQj+X/JTbu7KGvHDe3BekcFFTKfTsvi0Xii9e25tarI8/ohJObfCqVIqTL9ftLKh3w==
X-Received: by 2002:ac2:4db0:0:b0:4fe:8c4:44f6 with SMTP id h16-20020ac24db0000000b004fe08c444f6mr4148158lfe.56.1691328751029;
        Sun, 06 Aug 2023 06:32:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402075700b0052237839229sm3912648edy.21.2023.08.06.06.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:32:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH v5 02/11] clk: sunxi-ng: nkm: consider alternative parent rates
 when determining rate
Date: Sun, 06 Aug 2023 15:32:29 +0200
Message-ID: <3752134.kQq0lBPeGt@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-2-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-2-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:47 CEST je Frank Oltmanns napisal(a):
> In case the CLK_SET_RATE_PARENT flag is set, consider using a different
> parent rate when determining a new rate.
> 
> To find the best match for the requested rate, perform the following
> steps for each NKM combination:
>  - calculate the optimal parent rate,
>  - find the best parent rate that the parent clock actually supports
>  - use that parent rate to calculate the effective rate.
> 
> In case the clk does not support setting the parent rate, use the same
> algorithm as before.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 45
> +++++++++++++++++++++++++++++++++++++++++- 1 file changed, 44
> insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index f267142e58b3..ea1b77e9b57f 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -6,6 +6,7 @@
> 
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/math.h>

Why do you need above include?

Best regards,
Jernej

> 
>  #include "ccu_gate.h"
>  #include "ccu_nkm.h"
> @@ -16,6 +17,45 @@ struct _ccu_nkm {
>  	unsigned long	m, min_m, max_m;
>  };
> 
> +static unsigned long ccu_nkm_find_best_with_parent_adj(struct clk_hw
> *parent_hw, +						
       unsigned long *parent, unsigned long rate,
> +						       
struct _ccu_nkm *nkm)
> +{
> +	unsigned long best_rate = 0, best_parent_rate = *parent, tmp_parent 
=
> *parent; +	unsigned long best_n = 0, best_k = 0, best_m = 0;
> +	unsigned long _n, _k, _m;
> +
> +	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
> +		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
> +			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) 
{
> +				unsigned long tmp_rate;
> +
> +				tmp_parent = 
clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> +
> +				tmp_rate = tmp_parent * _n * _k / 
_m;
> +				if (tmp_rate > rate)
> +					continue;
> +
> +				if ((rate - tmp_rate) < (rate - 
best_rate)) {
> +					best_rate = tmp_rate;
> +					best_parent_rate = 
tmp_parent;
> +					best_n = _n;
> +					best_k = _k;
> +					best_m = _m;
> +				}
> +			}
> +		}
> +	}
> +
> +	nkm->n = best_n;
> +	nkm->k = best_k;
> +	nkm->m = best_m;
> +
> +	*parent = best_parent_rate;
> +
> +	return best_rate;
> +}
> +
>  static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long
> rate, struct _ccu_nkm *nkm)
>  {
> @@ -124,7 +164,10 @@ static unsigned long ccu_nkm_round_rate(struct
> ccu_mux_internal *mux, if (nkm->common.features &
> CCU_FEATURE_FIXED_POSTDIV)
>  		rate *= nkm->fixed_post_div;
> 
> -	rate = ccu_nkm_find_best(*parent_rate, rate, &_nkm);
> +	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
> +		rate = ccu_nkm_find_best(*parent_rate, rate, &_nkm);
> +	else
> +		rate = ccu_nkm_find_best_with_parent_adj(parent_hw, 
parent_rate, rate,
> &_nkm);
> 
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate /= nkm->fixed_post_div;




