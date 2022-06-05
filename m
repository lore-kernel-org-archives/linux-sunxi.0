Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BF1FD2
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jun 2022 20:23:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id s12so18182660ejx.3
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jun 2022 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=syDJi88yIFylEVum47mqcHZv+RTHJr0HACQpGPz7nFg=;
        b=UkdnJF7U/pehTnhldJ0iRVMzejB11Pwz4Nh6FtdzdqI7LZG4RriamDrXXxtEvidn4P
         RTY9zO7h022njdZW8eeUj0iinKe/b/CgKrWUQG3GegxQh2P9ZeqbM7W+B0XECBxhmWtQ
         aBNOkDMyKXYqYuWvAtcb2G1ciFjjdavXh3Ll6PV3Rns/37mLuoIne9Jp8TbGEWOJTlfx
         H+9T0HErvS9klcadxd2WMlR1/TI3gM0hr7gtZRLzyRC/5wyKhyDD3osNCeayoJKPijCI
         kK8sHqqdZTeIhqM5DsCL6vk0Er6Ntcp7e487O7BmZth3c0ITx3qhJ758UeLk/pav265k
         U69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=syDJi88yIFylEVum47mqcHZv+RTHJr0HACQpGPz7nFg=;
        b=r7MGsAXueH0xe2KO6ucj9/WcAF5KvQOHtMRdCwhBcJ9enSXrZHDWscErA5zZYyJkZI
         n8I9ffZDTbWZZCuhnEmm6F3Kub4FqM6+LuHMjktsM//n1/bMkS8SVW+3FX65RcXgBBRx
         Ld4OvyWyZY6FxJGNwuPUn9rfdGilo56FCU7Sw5TsCjuqsiVGzUMr4rmkM/QIte1DhB13
         HEz5CNyLbYKilZR4+D4qMguGgDc/seLE41XZHF2T/vUo6iwKYZgzf2hq+PKU/bFQ3UJo
         Un7IyXRH7osJK4iWfAfvV1HgI/it6N1OV62zX7/SBQ2kqTAnIeov3Gi2oCCUA8dLZBPW
         n1Yw==
X-Gm-Message-State: AOAM533+LNYRcDxkfAWEoTskE1P22mR7N7JTetkKn1xMNCDBDAOyArfA
	Usz5SSr700U/1YilexE7CSU=
X-Google-Smtp-Source: ABdhPJx3SAJQ47i6a+JSGjvv9dNZLjFQAuaIZnoyyym7cAW0Id1txRWDbdUrlqHzWh9rkQnzTDpv2A==
X-Received: by 2002:a17:906:3ed5:b0:6f5:108c:a45 with SMTP id d21-20020a1709063ed500b006f5108c0a45mr18253665ejj.623.1654460600393;
        Sun, 05 Jun 2022 13:23:20 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id a22-20020aa7d916000000b0042dd4f9c464sm7226427edr.84.2022.06.05.13.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 13:23:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz, Roman Stratiienko <r.stratiienko@gmail.com>
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Enable output signal premultiplication for DE2/DE3
Date: Sun, 05 Jun 2022 22:23:18 +0200
Message-ID: <5826286.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20220605094018.9782-1-r.stratiienko@gmail.com>
References: <20220605094018.9782-1-r.stratiienko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 05. junij 2022 ob 11:40:18 CEST je Roman Stratiienko napisal(a):
> Otherwise alpha value is discarded, resulting incorrect pixel
> apperance on the display.
> 
> This also fixes missing transparency for the most bottom layer.

Can you explain that a bit more? Also, BSP driver never enables this bit. What 
are we doing differently?

> 
> Test applications and videos w/ w/o this patch are available at [1].
> 
> [1]: https://github.com/GloDroid/glodroid_tests/issues/1

As stated in other emails, commit messages should not contain external links 
(per patch rules).

Best regards,
Jernej

> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> 
> ---
> Changelog:
> 
> V2: Added code hunk missing in v1
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 5 +++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index 6b1711a9a71f..ba2932aaed08
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -320,8 +320,9 @@ static void sun8i_mixer_mode_set(struct sunxi_engine
> *engine, else
>  		val = 0;
> 
> -	regmap_update_bits(engine->regs, 
SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> -			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, 
val);
> +	val |= SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY;
> +
> +	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base), 
val);
> 
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index ebfc276b2464..bc12c95af6f3
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -65,6 +65,7 @@
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
> 
> +#define SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY	BIT(0)
>  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
> 
>  #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)




