Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED2728EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:43:53 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bcf2de59cso541243166b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691329432; x=1691934232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LahOmtw+dOqGhFwzPmluy7sMbX8L+Z01CVnjmnkuSGE=;
        b=EQs5tl40ZqlRkOieUvmpt+4gweDpn3uaZuMfP/5OPhZkcxAMbtjuu55ZriQ/hNBd7O
         gAw61tFcAkK/P7taebAR/DCYAqXAi/fHayaI1/+l8bSDplGZT569mM2lgoXECLKAUQWv
         Zi7qe0lyAngrCZAmXm2pesi+iLRuzZwZ5PRJoEZpxleytAb5pwVECvER1ZCRLweVtoq5
         HyEoiXVE4eopy22W3K8IfQ6PqyHq6K9W91kY8x+pNOj6RIrt8v9vkbrq3DjNemHqlPIv
         cHRHpyA5mNLIcOMA80n4ZQl5kOEFJp+D/MTIA7IBtiswANmmEtgobgxRO0s5MxBLEbBs
         BBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691329432; x=1691934232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LahOmtw+dOqGhFwzPmluy7sMbX8L+Z01CVnjmnkuSGE=;
        b=AVnA/OMQmrxWjzOfnXTL28kDE0U5nHdfeiSMTYSIalZw5knquqXLkI/Bm2tS9/QB+R
         30Z5B69IvarHDaAeY+zg5LdDB/aIqOcMRkopbWgwgIUiFM8WOmm3MZf+7m90d0Nzz6Tl
         +qn5JzFvYspfkgrDmiwSZdsMBYEXn+2ohs4jVe1TgTiK1c8gmVYoJPjqjf0naE+IHCoe
         kO1pecJh4KD8ahUZ5bBMRiG5g1yHjQwcYfQmpY/ExECGZsCBAdi3eh+3fDccacIGYISY
         MP5TwvQR+nrA87rP/LOdMgYfSo9nX5RpA/DkthTXpwl+xovtcZGOo3+IiSZege89JtYU
         NQcw==
X-Gm-Message-State: AOJu0Yx13uWZY3KfLz11whuQSjAqZ7zotMZ+WDngogS+HwpFws5gxNh8
	2iRfE9tmHom83t+y9Pdvt0I=
X-Google-Smtp-Source: AGHT+IEBFtSKShfsGfbCpFMtiZEsrdUskRucT0bUssz2Grq5iCZlM9ACJ1wQ8XcSZrSneHMxv8mb6w==
X-Received: by 2002:a17:906:319b:b0:99c:bb4d:f5a0 with SMTP id 27-20020a170906319b00b0099cbb4df5a0mr3426696ejy.14.1691329431999;
        Sun, 06 Aug 2023 06:43:51 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id oz13-20020a170906cd0d00b00992b71d8f19sm1359086ejb.133.2023.08.06.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:43:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v5 11/11] clk: sunxi-ng: nkm: Prefer current parent rate
Date: Sun, 06 Aug 2023 15:43:50 +0200
Message-ID: <1904467.taCxCBeP46@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-11-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-11-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:56 CEST je Frank Oltmanns napisal(a):
> Similar to ccu_mp, if the current parent rate allows getting the ideal
> rate, prefer to not change the parent clock's rate.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index 896bb1ef8642..1e49444817cf 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -35,7 +35,8 @@ static unsigned long
> ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
> 
>  				tmp_rate = tmp_parent * _n * _k / 
_m;
> 
> -				if (ccu_is_better_rate(common, 
rate, tmp_rate, best_rate)) {
> +				if (ccu_is_better_rate(common, 
rate, tmp_rate, best_rate) ||
> +				    (tmp_parent == *parent && 
tmp_rate == best_rate)) {
>  					best_rate = tmp_rate;
>  					best_parent_rate = 
tmp_parent;
>  					best_n = _n;




