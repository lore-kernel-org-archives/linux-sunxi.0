Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75633D1
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 19:55:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id i27so25903683ejd.9
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jnZc7DP16ZcOaHpZ/GNMFf37KvUcvRnbmi+EyiBH2ZE=;
        b=AcnpSf+5qxUgF0srl66FGmfTo7OdTmIAm/XziK6pVlV5y+Ze8LSEtuXW01aQzj32eD
         UhvkN+CUxB0D3gTzfZU5NC0QWTw1BPK7YYpaU6MzOU/HsH+8Q08WP7KHA5mIa7oZBEwE
         wAXKdW9/pDIDzu/uB8msTCKmtU8eteJ1GqlEBa1lSC1CYvQgFj3AiA+B5ttspv5NeG5+
         aIbecn5OirPqnhzLhgyFahyxe4soSmeTe+KIlqfaE0aAlRk9Mm9V3Ay9AtE5BhubNBLb
         +zPQgLpKF2iXZPpAq80rAdwJyn5049gSdgXFXx41HPG3B+FeEvCHhfCuQfP9Mtfj1qZF
         HJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnZc7DP16ZcOaHpZ/GNMFf37KvUcvRnbmi+EyiBH2ZE=;
        b=s5QcTedEe5GWj0jM2Soemt1xIJUnZsn8Qyr6UiToNqzb9VIMPVKXJ3/uwsnEx5RDzV
         QUJixwL4yHwFr5/EIn/AQ7Ocuk7R8EnRJlVVXTpioxseMui5j2S2U627kd3uWVV1pSde
         oaa+esy6kiF0BsNM+OaAZ3+mJWqe/29T/D3VWE2FsPIIb8z4J3NkEFYj0cdOTYrmOOCW
         3fGkNsjIE4F9ZhS9MCxqORXRahOpZ/hIa9RkSNcmPFuQIu5Gd7dMmpBFQdGcuz2my2fy
         CXgZMkVDF42t2cDB3gZ78zneRNolCD5LdKCjMIE8FBunuqTNlGUbrysRP0af7vZEmyfn
         xFFQ==
X-Gm-Message-State: AOAM532jVzs/597ICuN6+56Uw6fpn8J6D96tu5FUU2+bKGc0zBV4p/oz
	pm3Smaau1AIY5np5hvCog5I=
X-Google-Smtp-Source: ABdhPJzN3eVFBus3yS50upLR1PqeRSF6bppisLjUxreAllvxq33VJBsVI+bSpN1WSBIgUo8tDD0BvQ==
X-Received: by 2002:a17:906:5006:b0:6ce:3762:c72e with SMTP id s6-20020a170906500600b006ce3762c72emr13049979ejj.30.1650830118484;
        Sun, 24 Apr 2022 12:55:18 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id ak18-20020a170906889200b006f39a445b93sm148849ejc.141.2022.04.24.12.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 12:55:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH] clk: sunxi-ng: ccu-sun6i-rtc: set rtc-32k to critical
Date: Sun, 24 Apr 2022 21:55:17 +0200
Message-ID: <5560593.DvuYhMxLoT@kista>
In-Reply-To: <20220424055959.109286-1-uwu@icenowy.me>
References: <20220424055959.109286-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 24. april 2022 ob 07:59:59 CEST je Icenowy Zheng napisal(a):
> RTC itself is the one and only consumer of rtc-32k clock. As the rtc
> should be always running, set rtc-32k clock to critical, to prevent it
> from being gated by the kernel.
> 
> Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC clocks")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

This one was already submitted here:
https://lore.kernel.org/linux-sunxi/20220411050100.40964-1-samuel@sholland.org/

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-
sun6i-rtc.c
> index 8a10bade7e0d..3d9c9ce5a3db 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -241,6 +241,7 @@ static struct clk_init_data rtc_32k_init_data = {
>  	.ops		= &ccu_mux_ops,
>  	.parent_hws	= rtc_32k_parents,
>  	.num_parents	= ARRAY_SIZE(rtc_32k_parents), /* updated 
during probe */
> +	.flags		= CLK_IS_CRITICAL,
>  };
>  
>  static struct ccu_mux rtc_32k_clk = {
> -- 
> 2.35.1
> 
> 
> 


