Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A07B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:51:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id r64so10183858wmr.4
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YS8EHgwmMuCqhyig1rAaWaRxXw3QqtoY27L8Jll0TfY=;
        b=As31xpNOOXW4cOL7/qqPuWMExguKMbXyka+Vh9C9W/8PbSFivYI75aVr2GVZmJcjgr
         kV8l4qy2Tg7yf0ZL0HMf5UlajwgEf/6IO/yB2BV/rekMrDTVP6T54LENY+PjKv515hDK
         ZulGZCIDUpMCpb47TlwyOwE+tf8P1n0XEh5rwPXgJlJVevhJ/jqjrXGRRzT3fvG8b2KJ
         fYzEnlx7I+/Lhth6iiZHjNNVJEmdTdiiMSUZ0YhWi1SfgfKAuAC/pvQ0gPD0kQRLB5k4
         WGwwSqF83vJ73SX0VyHlRTH15XOHjv+7fdr0/gn9Z0trOGwQ9wpZUIlh8rozIZsSrxgX
         wqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YS8EHgwmMuCqhyig1rAaWaRxXw3QqtoY27L8Jll0TfY=;
        b=k5o12m/bCzlKJpvV3NkFQ6zFZs4LLLw6JknyppTNeGBhxLCkd3fgwGLYX9bbFVu/b4
         mNle6tcwjzMAdIi1XG7/XIempOeTOrXpKNFuYVk6Fgk1t0Twf27+UTxv9P9r/tA04qxI
         e1sHdDO/evsNEC7I+JaWn+9Qj9XeLsecG5WbBFYwzlcQfC+RRB1X/edGSQz9OSrZohLK
         LW9Q5ZP9475wg5jLE37A+lM/wHJTSIN89dJv8QAStBykTulXO5bJm3dqv2cXwJGnBaWJ
         h4iN1tz1eh/qTjU3LeWRUd0KUAp3DE/ec9inWad49Kx1jRjwP/CkfhbIiYXM/5Ueuktr
         YOWQ==
X-Gm-Message-State: AOAM5328wlJjAcoSW1cC0ivd9AdvAhKJqgkV2cm2tU1Ym29q8XIJeB1U
	DIJpq2AmWgDQCC0qEfk2qzVkCfXjy+r1xA==
X-Google-Smtp-Source: ABdhPJxvtJQJT9jI/s9bYQuO90GNiVMlLPs03qEqheRFSe8rV0SXjb9P9bAhHpKdX5WiBso6FB1JZw==
X-Received: by 2002:a7b:cb05:0:b0:38c:7910:d935 with SMTP id u5-20020a7bcb05000000b0038c7910d935mr29586332wmj.170.1649692310794;
        Mon, 11 Apr 2022 08:51:50 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u1-20020a056000038100b00207a578e9d4sm4140041wrf.89.2022.04.11.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:51:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 07/10] drm/sun4i: Add support for D1 mixers
Date: Mon, 11 Apr 2022 17:51:49 +0200
Message-ID: <1721354.VLH7GnMWUR@kista>
In-Reply-To: <20220411043423.37333-8-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-8-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:19 CEST je Samuel Holland napisal(a):
> D1 has a display engine with the usual pair of mixers, albeit with
> relatively few layers. In fact, D1 appears to be the first SoC to have
> a mixer without any UI layers. Add support for these new variants.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/
sun8i_mixer.c
> index f5e8aeaa3cdf..49c0d17c6f0a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -585,6 +585,24 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg 
= {
>  	.mod_rate = 150000000,
>  };
>  
> +static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
> +	.ccsc		= 2,
> +	.mod_rate	= 297000000,
> +	.scaler_mask	= 0x3,
> +	.scanline_yuv	= 2048,
> +	.ui_num		= 1,
> +	.vi_num		= 1,
> +};
> +
> +static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
> +	.ccsc		= 1,
> +	.mod_rate	= 297000000,
> +	.scaler_mask	= 0x1,
> +	.scanline_yuv	= 1024,
> +	.ui_num		= 0,
> +	.vi_num		= 1,
> +};
> +
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  	.ccsc		= 0,
>  	.mod_rate	= 297000000,
> @@ -638,6 +656,14 @@ static const struct of_device_id sun8i_mixer_of_table[] 
= {
>  		.compatible = "allwinner,sun8i-v3s-de2-mixer",
>  		.data = &sun8i_v3s_mixer_cfg,
>  	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-de2-mixer-0",
> +		.data = &sun20i_d1_mixer0_cfg,
> +	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-de2-mixer-1",
> +		.data = &sun20i_d1_mixer1_cfg,
> +	},
>  	{
>  		.compatible = "allwinner,sun50i-a64-de2-mixer-0",
>  		.data = &sun50i_a64_mixer0_cfg,
> -- 
> 2.35.1
> 
> 


