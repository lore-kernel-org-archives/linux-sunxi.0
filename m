Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E779C7B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:49:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p189so10180851wmp.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qi7eZg7eL4sVsLMsy0YjPHKG017lj1wQEyIFwGViWAM=;
        b=Hcuy/vAQzyD17YUsghb6LKm+6+s4YDr705jX4CsiwWq9VxmAGbrdyRmeixApfoNWmV
         RyZjfdTljqLOpTYYxSGTXxN7zQo9o1xWzQ9142lEscAsZnMwU+Kt9dNgtoiCAj8HwqID
         AxkThIp1zjjtHUEUQe1xs9yhbIS0Uy5Qrvo1ALCaK/2TxFAh/7lWWOaJIg1R97CFYX9k
         dNj0PI330BZ35QIkJrSSSI7lCYuC5NYfWV6WkB+8rMf+s9YdsI4O3ZIXIxSqLUAf1ppd
         5wD/9QVOwN3G0fJ1vQyHxUpDwTbnkVezLEd7ehy3CDnyCmEhPaJxAxeMdIPE+of+F2ud
         n4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qi7eZg7eL4sVsLMsy0YjPHKG017lj1wQEyIFwGViWAM=;
        b=MBeXkOs6RuaffgBZQndsL+LNxUoonG3Y11iEkYU50k1HVMUXVQcuuTyi6KoGD0UuOS
         3mEqoloNyqW5/h+toNW+KyRIScv6d0nk6KS6cAqaj9e8eA1rDUkrjUuHcAtJ6cKHdWBx
         axKSwE1jDT79WyCPMBjDs+QSRfRVsNFh+EzgA57Z0BPbOwXjr+/7Rvp0PP5OdDdqLGu0
         B7TFvWAz9m+XeicHCpkjEAl/ZKIuv2dnid92fUht/EIW8TMgclc+px9yjy69ChH744YX
         y8x09wCOLYh9JaO+aAbCiUYFdpu075+8VYLeiprYHrQbz0jA2Ke2Kjxh39zJulxXN438
         um/A==
X-Gm-Message-State: AOAM533ZiIad++IydmpW9MCMU/y4ciu667psElI2pebhGQKBTvXhUfuJ
	SIbQGOd4d767MF3SRe0h0pg=
X-Google-Smtp-Source: ABdhPJxg6gCExkFst8ObOPuO3ENH/Jiahpnnv1uxdrIaBDYAOcjx7+rWzK7x7weJ/8GqR1ckC8YxOA==
X-Received: by 2002:a05:600c:4f95:b0:38e:b596:b3f5 with SMTP id n21-20020a05600c4f9500b0038eb596b3f5mr9549574wmq.164.1649692139309;
        Mon, 11 Apr 2022 08:48:59 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id r129-20020a1c2b87000000b0038e6a025d05sm19083256wmr.18.2022.04.11.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:48:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/10] drm/sun4i: Allow VI layers to be primary planes
Date: Mon, 11 Apr 2022 17:48:57 +0200
Message-ID: <3096240.5fSG56mABF@kista>
In-Reply-To: <20220411043423.37333-7-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org> <20220411043423.37333-7-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:34:18 CEST je Samuel Holland napisal(a):
> D1's mixer 1 has no UI layers, only a single VI layer. That means the
> mixer can only be used if the primary plane comes from this VI layer.
> Add the code to handle this case, setting the mixer's global registers
> in the same way as when the primary plane comes from a UI layer.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/
sun8i_vi_layer.c
> index bb7c43036dfa..86212cb2098c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -146,6 +146,36 @@ static int sun8i_vi_layer_update_coord(struct 
sun8i_mixer *mixer, int channel,
>  	insize = SUN8I_MIXER_SIZE(src_w, src_h);
>  	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
>  
> +	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +		bool interlaced = false;
> +		u32 val;
> +
> +		DRM_DEBUG_DRIVER("Primary layer, updating global size W: 
%u H: %u\n",
> +				 dst_w, dst_h);
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_GLOBAL_SIZE,
> +			     outsize);
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), 
outsize);
> +
> +		if (state->crtc)
> +			interlaced = state->crtc->state-
>adjusted_mode.flags
> +				& DRM_MODE_FLAG_INTERLACE;
> +
> +		if (interlaced)
> +			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> +		else
> +			val = 0;
> +
> +		regmap_update_bits(mixer->engine.regs,
> +				   
SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +				   
SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> +				   val);
> +
> +		DRM_DEBUG_DRIVER("Switching display mixer interlaced 
mode %s\n",
> +				 interlaced ? "on" : "off");
> +	}
> +

Above code doesn't really belong to layer management and actually cause an 
issue when primary plane is reconfigured to cover only part of display. It 
should be executed at mode set time. I already wrote patches for that. Feel 
free to reuse them:

https://github.com/jernejsk/linux-1/commit/
bddb61cfa9c8ab70f5af6ed384fc7ffe159ac064
https://github.com/jernejsk/linux-1/commit/
3320184b88df81b7d3d2b375db899442e1085519
https://github.com/jernejsk/linux-1/commit/
05a04d721ae31dbff0432606892ec94b6a63b8bc

FWIW, I have other clean ups stacked here: https://github.com/jernejsk/
linux-1/commits/hdmi-yuv420

Best regards,
Jernej

>  	/* Set height and width */
>  	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
>  			 (state->src.x1 >> 16) & ~(format->hsub - 
1),
> @@ -542,6 +572,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
drm_device *drm,
>  					       struct 
sun8i_mixer *mixer,
>  					       int index)
>  {
> +	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
>  	u32 supported_encodings, supported_ranges;
>  	unsigned int plane_cnt, format_count;
>  	struct sun8i_vi_layer *layer;
> @@ -560,12 +591,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
drm_device *drm,
>  		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
>  	}
>  
> +	if (!mixer->cfg->ui_num && index == 0)
> +		type = DRM_PLANE_TYPE_PRIMARY;
> +
>  	/* possible crtcs are set later */
>  	ret = drm_universal_plane_init(drm, &layer->plane, 0,
>  				       &sun8i_vi_layer_funcs,
>  				       formats, format_count,
>  				       sun8i_layer_modifiers,
> -				       DRM_PLANE_TYPE_OVERLAY, 
NULL);
> +				       type, NULL);
>  	if (ret) {
>  		dev_err(drm->dev, "Couldn't initialize layer\n");
>  		return ERR_PTR(ret);
> -- 
> 2.35.1
> 
> 


