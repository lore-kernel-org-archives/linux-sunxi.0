Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3E7C
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:01:18 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id be20so7867884edb.12
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sf7MisxX3LNkimFSGyyrRktC622uWreucLzzkMFjVxE=;
        b=ZCIOZskE2WztPBVoBucejcl7KLi6eC4H3SnAqCPc8CvXVbhaKCFqwAOkouOeE3XIw4
         Xy2c+vTyka6xFaVskcbnlsDda6uY8l17JywdD5/voUCg6WN8WfLqOfGDW68e9t+zTrEt
         0EHyLLmWu+HgvGreor3M+2VVypMDBiYfpZCtdFON1ARa2E2BpkOlpCgpPhP2fFI1EA+5
         ObzvHgO+fm64AsNH8zzoWadVcDd/LHj4R65koel07f0BbMnNw0Gw4WNP2zXSvvs9gpKM
         tU7yAiznylfXsOKwsrA50rAMWixxISSD1TGwBbMsRoIYHTLavXJU2TUKruLGGZJBkdTh
         YiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sf7MisxX3LNkimFSGyyrRktC622uWreucLzzkMFjVxE=;
        b=lA4mKP3QpKstIcbgSuM1vlYEz/9zwUJXLMlikN5UG97h8IYeB5y5pWYVW2ubSTfYue
         OnuYl1OE/q2Eo4x29kh6T160/c6goUUZARancZfr5v6mcivj11pRLjSyGBPWqlyiUt3e
         W9PB6MXRQDh5h86mOAc/RNekJ5T7ITrvrUZGf+Z2c+XneUKo3irXETWLkgx+cLh7b6KB
         GHEFL55c47ehLB0WeOOgEE4LHo7oYExsF/sDMdHqV8G8LjTOUJeXDIuiHMOqZU1ojhoT
         cKkTwPlBZS4MwbBJSOlnu8UK1bG6qCGD84Whh2g1EzTnRkz+KRM8bKzkYUx5anfk0KVt
         //Ew==
X-Gm-Message-State: AOAM53010eVqJikoA/LeEJClBS8/qJzXgupZ4piiulrbVftgWe8Z8vQ6
	mkqF3PPHB+69yRdxLg/YN5I=
X-Google-Smtp-Source: ABdhPJw9EYpgPzBF7aomsbu5Pu2r+fJI1zxuI2gBwhN5+KDIqR1ckuUKzGAma1SNoXggt53pH+Sczw==
X-Received: by 2002:a50:ed11:0:b0:425:c3d1:4547 with SMTP id j17-20020a50ed11000000b00425c3d14547mr12150359eds.410.1650830476615;
        Sun, 24 Apr 2022 13:01:16 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906297100b006e49a9535f3sm2893176ejd.114.2022.04.24.13.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 13:01:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 09/14] drm/sun4i: Allow VI layers to be primary planes
Date: Sun, 24 Apr 2022 22:01:15 +0200
Message-ID: <2236113.ElGaqSPkdT@kista>
In-Reply-To: <20220424162633.12369-10-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org> <20220424162633.12369-10-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 24. april 2022 ob 18:26:27 CEST je Samuel Holland napisal(a):
> D1's mixer 1 has no UI layers, only a single VI layer. That means the
> mixer can only be used if the primary plane comes from this VI layer.
> Add the code to handle this case.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - Use Jernej's patches for mixer mode setting.
> 
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/
sun8i_vi_layer.c
> index bb7c43036dfa..f7d0b082d634 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -542,6 +542,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
drm_device *drm,
>  					       struct 
sun8i_mixer *mixer,
>  					       int index)
>  {
> +	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
>  	u32 supported_encodings, supported_ranges;
>  	unsigned int plane_cnt, format_count;
>  	struct sun8i_vi_layer *layer;
> @@ -560,12 +561,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
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


