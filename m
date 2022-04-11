Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658A7B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:37:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m67-20020a1ca346000000b0038e6a1b218aso10318053wme.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZEd2NUfggsD7hgjY8ZW9Vk2tNqqVUG6JADb5kDnjH9Y=;
        b=ZOQvmS/wEUkvWeynt1+EWEaVA+W9eMPHyQEiaRq21gFbWomCufcS8tUyh7ZQPu5LwP
         eUJ1WFpwyr9Yaqft68B8Nm/C+PGGHXUuTmGoF51iyzkF3siGBMH+JbPuJgnjBYZUQ0rk
         Rcab+BNrqtIDRdL1aduuV/rJWLG6C3gqZxMSNqkBpLnMkCujJoCI1LqQFlAqfyYnWPkC
         bvWQ6Pmc5eLqexEdzFrdr3CkHrDmtXhkSU7mjU3BvZHz1uqWYGghCI2eTSdTnMfEAzTC
         H/xVAOBg32rRcMvl5vxvcfb3LXbU80yq1DS9PzCV7iURoVOOuLaKzCbcU5eq/IECPn71
         8chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZEd2NUfggsD7hgjY8ZW9Vk2tNqqVUG6JADb5kDnjH9Y=;
        b=Spuu5+Dm6oYWXet5Ets45ccLlbRipSo/pii5p7/MV6GiLisoHUE1e1hMk9Is7eNpvq
         TFRaUBPKDnAo+eNFNUYiZki7GMedQAXZH6GzAO+Zws1SqLkWH86Aioy+IoBa4/Ee5kOF
         hRGIRBhONiyLpAxkmSkiHKx2jsvjoFEP/fihtd2MxuPYb+0A3ARcwq0B1sKUks8Zc7iC
         jv2PiNXCZKG6B59D+U19XAbZEl4tXes5PrqABpImCXL8okSVHcRyIyxBvLw54a8ocXfC
         7JLx5nHxHtZqUYIsbSv45dwW8bsYCzj80Rm+LGFo0Tt3s7WZKOK8z+YM+ouWtSlJZmP0
         VbEw==
X-Gm-Message-State: AOAM532zyRal98szJ6TiCAHoyQ1sf8TO2CN3+NckONdlSpGfw1Osn/tC
	Ml+pwMSjRyUnSh20/6S2JyqIi5Sj9fGghg==
X-Google-Smtp-Source: ABdhPJy/BzuwObXpGrBkuPP/B+nIiUKgXHozXUMEVJpsQ9JEfJdCGxcjcG2VRWPpqzSHJ8PxH0l9YA==
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id z3-20020a7bc7c3000000b00389cbf1fadfmr30248265wmk.147.1649691471387;
        Mon, 11 Apr 2022 08:37:51 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0037bdfa1665asm22528252wmj.18.2022.04.11.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:37:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 03/10] drm/sun4i: Remove obsolete references to PHYS_OFFSET
Date: Mon, 11 Apr 2022 17:37:49 +0200
Message-ID: <3167527.44csPzL39Z@kista>
In-Reply-To: <20220411043423.37333-4-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:15 CEST je Samuel Holland napisal(a):
> commit b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a
> central place") added a platform device notifier that sets the DMA
> offset for all of the display engine frontend and backend devices.
> 
> The code applying the offset to DMA buffer physical addresses was then
> removed from the backend driver in commit 756668ba682e ("drm/sun4i:
> backend: Remove the MBUS quirks"), but the code subtracting PHYS_OFFSET
> was left in the frontend driver.
> 
> As a result, the offset was applied twice in the frontend driver. This
> likely went unnoticed because it only affects specific configurations
> (scaling or certain pixel formats) where the frontend is used, on boards
> with both one of these older SoCs and more than 1 GB of DRAM.
> 
> In addition, the references to PHYS_OFFSET prevent compiling the driver
> on architectures where PHYS_OFFSET is not defined.
> 
> Fixes: b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central 
place")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Good catch! Actually, people complained about non-working display on 
Cubietruck IIRC, which has 2 GB of RAM.

Did you test this on HW?

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun4i_frontend.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/
sun4i_frontend.c
> index 56ae38389db0..462fae73eae9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
> @@ -222,13 +222,11 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend 
*frontend,
>  
>  	/* Set the physical address of the buffer in memory */
>  	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
> -	paddr -= PHYS_OFFSET;
>  	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
>  	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
>  
>  	if (fb->format->num_planes > 1) {
>  		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 2 : 
1);
> -		paddr -= PHYS_OFFSET;
>  		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", 
&paddr);
>  		regmap_write(frontend->regs, 
SUN4I_FRONTEND_BUF_ADDR1_REG,
>  			     paddr);
> @@ -236,7 +234,6 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend 
*frontend,
>  
>  	if (fb->format->num_planes > 2) {
>  		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 1 : 
2);
> -		paddr -= PHYS_OFFSET;
>  		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", 
&paddr);
>  		regmap_write(frontend->regs, 
SUN4I_FRONTEND_BUF_ADDR2_REG,
>  			     paddr);
> -- 
> 2.35.1
> 
> 


