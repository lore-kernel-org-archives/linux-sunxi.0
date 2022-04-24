Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CD7C
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:06:09 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id i27so25935243ejd.9
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=88N/1qAZ8VIjuS2R1sRrs/MALWlEK6AkrWPDLccyzys=;
        b=K1edaGaOacjw80WVtueFnAw4giTEfU2sak5dGFtN6QQLPFylYk0rANxVN+weUL2Sed
         EYlRbQtra/oEBwdIisXjiI62T9ecUkEbHqCtePlXJY7WiGLcYETVAHRew6Pf+FxzNj0L
         p2BwMYyGxAPaaFedkJIvDfNh+pjmVFeExPl9OdAdECsbB6VpeKdmeMRWa5fux8NLPsI/
         I4G4ixkWLXjUA0CQsN9ipzeRPtJssww5pZWMuwlU+7C8CDrpzhIQjf4fxsG7/00jmEgk
         ZVJpmSNWUIzopYiPkICQ5hQCGjtTMAxk+HTsDor5y5tBpq49ABc8WTCi8MMjDlb1npgi
         sAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88N/1qAZ8VIjuS2R1sRrs/MALWlEK6AkrWPDLccyzys=;
        b=7uh4AtCDrvUKHoHwibWhVfhX3vxxI/Rj77MLhEMYSs4UTPW58ph/imi7FZg8k8inim
         oOJUwA3+/pHBGSW7kz1M/1KCAXRHyw0kRd8IN4VR2RiIy4LMm3SAp03ykq9o36fTjH91
         y1ut9fHHP3GKKCnZ7DKdrNXMVTex01pmrHynuWVI09WgyNVKF62rkeN5HSfttIDm9G8P
         BnSABcGIUAuPyvXHhnRcwlNPeJfHd595DQAd0vEmo10WjWRvuuOlN1PRZgvoLazc9Rs8
         nH2cM4JroXR48z44f7n3KNjKhGoHHdAMzljdSL2Cq8MVXhc/eSMBz6auo4LZZLSgVLOc
         jyfg==
X-Gm-Message-State: AOAM531ulF//c/fMl/3XbWdgMSK95EsAJC/xrC05ZJc8um/2yIRZZ9ps
	KwAn8xdQ9DInYSGLhMrTuqM=
X-Google-Smtp-Source: ABdhPJwPTndJLo/fj/nqzGhKpv1Odq/tnRLyRXZ6JHKhIo3rLA9hBiZqsjUjKlaQ5rMdlZP0TTa1hA==
X-Received: by 2002:a17:906:4fc8:b0:6d8:5059:f998 with SMTP id i8-20020a1709064fc800b006d85059f998mr13536450ejw.487.1650830768172;
        Sun, 24 Apr 2022 13:06:08 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id b17-20020a170906195100b006e8be812f08sm2956838eje.0.2022.04.24.13.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 13:06:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 12/14] drm/sun4i: Add support for D1 TCON TOP
Date: Sun, 24 Apr 2022 22:06:06 +0200
Message-ID: <13000910.uLZWGnKmhe@kista>
In-Reply-To: <20220424162633.12369-13-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org> <20220424162633.12369-13-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 24. april 2022 ob 18:26:30 CEST je Samuel Holland napisal(a):
> D1 has a TCON TOP with TCON TV0 and DSI, but no TCON TV1. This puts the
> DSI clock name at index 1 in clock-output-names. Support this by only
> incrementing the index for clocks that are actually supported.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/
sun8i_tcon_top.c
> index 1b9b8b48f4a7..da97682b6835 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -189,22 +189,23 @@ static int sun8i_tcon_top_bind(struct device *dev, 
struct device *master,
>  	 * if TVE is active on each TCON TV. If it is, mux should be 
switched
>  	 * to TVE clock parent.
>  	 */
> +	i = 0;
>  	clk_data->hws[CLK_TCON_TOP_TV0] =
>  		sun8i_tcon_top_register_gate(dev, "tcon-tv0", regs,
>  					     &tcon_top-
>reg_lock,
> -					     
TCON_TOP_TCON_TV0_GATE, 0);
> +					     
TCON_TOP_TCON_TV0_GATE, i++);
>  
>  	if (quirks->has_tcon_tv1)
>  		clk_data->hws[CLK_TCON_TOP_TV1] =
>  			sun8i_tcon_top_register_gate(dev, "tcon-
tv1", regs,
>  						     
&tcon_top->reg_lock,
> -						     
TCON_TOP_TCON_TV1_GATE, 1);
> +						     
TCON_TOP_TCON_TV1_GATE, i++);
>  
>  	if (quirks->has_dsi)
>  		clk_data->hws[CLK_TCON_TOP_DSI] =
>  			sun8i_tcon_top_register_gate(dev, "dsi", 
regs,
>  						     
&tcon_top->reg_lock,
> -						     
TCON_TOP_TCON_DSI_GATE, 2);
> +						     
TCON_TOP_TCON_DSI_GATE, i++);
>  
>  	for (i = 0; i < CLK_NUM; i++)
>  		if (IS_ERR(clk_data->hws[i])) {
> @@ -272,6 +273,10 @@ static const struct sun8i_tcon_top_quirks 
sun8i_r40_tcon_top_quirks = {
>  	.has_dsi	= true,
>  };
>  
> +static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
> +	.has_dsi	= true,
> +};
> +
>  static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
>  	/* Nothing special */
>  };
> @@ -282,6 +287,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
>  		.compatible = "allwinner,sun8i-r40-tcon-top",
>  		.data = &sun8i_r40_tcon_top_quirks
>  	},
> +	{
> +		.compatible = "allwinner,sun20i-d1-tcon-top",
> +		.data = &sun20i_d1_tcon_top_quirks
> +	},
>  	{
>  		.compatible = "allwinner,sun50i-h6-tcon-top",
>  		.data = &sun50i_h6_tcon_top_quirks
> -- 
> 2.35.1
> 
> 


