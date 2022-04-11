Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5D7B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:54:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h16so10215019wmd.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nmuYtqAwEElb8nxVd+fxQ89gGHmXquxvJjVsYoqHv2Y=;
        b=keocVt8ryOJFNtu5Az/dug++DkTAI4OLWaFHkX4cvSsY1xV/Wskbcl5ImhbUzHtCaE
         4OMIC3t4sUW/61SlvymjUxxHekkkGk8zMK66fM3+/Ff7PxoGkiTMizk0GgsSIZLo/faB
         kLIO1o1ZFqcHSMwQjOHxjyHcqO6AYi7MqD6XDvPzTCtq0xAgBohx+LNW4dE7cbKZg7js
         WdIJ2O1rpMwswpbjOOCj2iLMgUeClP+tOnqgOJc6YJeAyfnjPl7nyIpmEYi7YQvceh2V
         q8elVAXixGrrTSNmOmBdmnykQ14lXvMlgHWhHaASaJrj6SOf2cOsJHVG1CQKSGJ1JfCK
         IUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nmuYtqAwEElb8nxVd+fxQ89gGHmXquxvJjVsYoqHv2Y=;
        b=sRgvE7kjX61aXxR1i0JFwRjHf55xJwJ5vYxcoK8xCFvB299MQrdu8nDVf7EMSiG9rk
         fx0y3tKKa7bYR6MfWE0aHxkxRLCzR7pDY2qz8QcESmIb2j2/NaBVh6nqiyl0W/CDWW2D
         g69hje+7qYDSSLdibOK5BELjqXclmoACf02TMq8Zd3+YfbP4xKRloKK7VLOv1BM/vpzc
         D86tmd+3Y6TPXtMe1tkCdgGrSDLtWaDo3KnOAgkLdpwJAFaCjNf8KKM2YWAZe3dLgTVs
         7vZvIMvIQFIzIJyYbMSP3GCQjpIGM3KrWoeWHi9cwyuO+PzeeQQMtwHMeyO2lbOkE1qt
         GmOA==
X-Gm-Message-State: AOAM533scIC5LxLyPO/vt0u3i3NkXGS1khmsef1suQp3RBZ97oFThM06
	30KnGdImdVeWTRDOKotyl10=
X-Google-Smtp-Source: ABdhPJwKMQkKpncM2rJZD2K2/Z9LaMxbxU3HY7D5aMcEWRGUB8rsH5POeRJ5rWtiP9HOlGX7T5u88w==
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id g12-20020a05600c4ecc00b0038e354d0909mr30666672wmq.33.1649692467942;
        Mon, 11 Apr 2022 08:54:27 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600018a100b00207ab2305d5sm1569272wri.16.2022.04.11.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:54:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 10/10] drm/sun4i: Add compatible for D1 display engine
Date: Mon, 11 Apr 2022 17:54:26 +0200
Message-ID: <1908291.usQuhbGJ8B@kista>
In-Reply-To: <20220411043423.37333-11-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-11-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:22 CEST je Samuel Holland napisal(a):
> Now that the various blocks in the D1 display engine pipeline are
> supported, we can enable the overall engine.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/
sun4i_drv.c
> index 6a9ba8a77c77..275f7e4a03ae 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -418,6 +418,7 @@ static const struct of_device_id sun4i_drv_of_table[] = 
{
>  	{ .compatible = "allwinner,sun8i-r40-display-engine" },
>  	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
>  	{ .compatible = "allwinner,sun9i-a80-display-engine" },
> +	{ .compatible = "allwinner,sun20i-d1-display-engine" },
>  	{ .compatible = "allwinner,sun50i-a64-display-engine" },
>  	{ .compatible = "allwinner,sun50i-h6-display-engine" },
>  	{ }
> -- 
> 2.35.1
> 
> 


