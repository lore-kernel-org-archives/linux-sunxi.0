Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27880DDC9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:47:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so42242375e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695584844; x=1696189644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0UiLgnPTra5qLP9o6AOXP+MP5rQqIbxexMkPfbpuaE=;
        b=AB8wJ1NCbOT6EeCbzLesQY0uERMRMnpnPcE/Sr5PSxikCI26CWFAoDyS36liMDdANd
         GdvV+t0aZt95XOtxUnhiZAUrDQ+f7nlv10e7Por+3vch+5AYAQLo+42FtsiiHdMWBNEb
         3XLU5z1o+0jSuAOX0cRWdc9P3Q082cJ3vEj+RQbRS609UlT1nrhpIKIe7CRSEbbWbYvY
         2qZriLpbLFvNQy8EIoOxV0H+ucaI8trlLs8qXaxXnjrMUOFM5egCL6Bk3iI54rSN1sHK
         AA66TcvvrC4bLWCLS+XumRyENG+r9crqbCJ0UXIYrqsZHQ7G1vq0LQsb4sZ+CF4bkVd4
         k/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695584844; x=1696189644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0UiLgnPTra5qLP9o6AOXP+MP5rQqIbxexMkPfbpuaE=;
        b=D56lj77W1byewGG1gvBFOlsbFcGeNm2Z5RcxKK46occfMIAuXZc1A89YWurCV0JWdV
         cQivmCaA6n/Bt5SiNx8Da8VC/oCuJ244PiNSkKPrCcVTHJmJKfvUMyJeMdwOtx2duPjJ
         HpiPiWIgpGCdMpWYfk3ZK/iK53AU3JIMgA2rfCXTu9fQJ9ouHe9C/rDbnYH3npvTUSvr
         jDtMx9tcPEbf7y1pqEVxBF3q41aMZbHxF4hD63cwkcCNQqILy7ZjEB0sJI3pk4+8FtRH
         TAuJMjZUTXuSz94xKrsdUkVrQUpqWLDJaaqdbq7uACOsv9F+UpgqapjO6PS+khQvaezR
         sjlg==
X-Gm-Message-State: AOJu0YyekjD4yyhGvS0Xkuqd7LogYY0lmlbJeFFXLTRgr0mddda6PeEA
	GEkzWiBC/kRyyLzJ9XN7rjc=
X-Google-Smtp-Source: AGHT+IGDoDkjcAsXY5BDoD37D7SSWWRRbHvSuc/IWVrkcNbbcS4m6aLfl01i4du0XtIIfHFrGLoGGQ==
X-Received: by 2002:adf:ebcc:0:b0:319:85e2:6972 with SMTP id v12-20020adfebcc000000b0031985e26972mr4084047wrn.42.1695584844170;
        Sun, 24 Sep 2023 12:47:24 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id sd6-20020a170906ce2600b00997e99a662bsm5315866ejb.20.2023.09.24.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:47:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: airlied@gmail.com, liuhaoran <liuhaoran14@163.com>
Cc: daniel@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, liuhaoran <liuhaoran14@163.com>
Subject: Re: [PATCH] drm/sun4i: Add error handling in sun4i_layer_init_one()
Date: Sun, 24 Sep 2023 21:47:22 +0200
Message-ID: <2156768.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230924074216.17390-1-liuhaoran14@163.com>
References: <20230924074216.17390-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne nedelja, 24. september 2023 ob 09:42:16 CEST je liuhaoran napisal(a):
> This patch adds error-handling for the drm_plane_create_alpha_property()
> and drm_plane_create_zpos_property() inside the dw_hdmi_imx_probe().

dw_hdmi_imx_probe() is not from this driver.

Best regards,
Jernej

> 
> Signed-off-by: liuhaoran <liuhaoran14@163.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_layer.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
> index 98f3176366c0..a3343afb7935 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -224,9 +224,22 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
>  	drm_plane_helper_add(&layer->plane,
>  			     &sun4i_backend_layer_helper_funcs);
>  
> -	drm_plane_create_alpha_property(&layer->plane);
> -	drm_plane_create_zpos_property(&layer->plane, layer->id,
> -				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
> +	ret = drm_plane_create_alpha_property(&layer->plane);
> +
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to install alpha property,
> +			rc = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = drm_plane_create_zpos_property(&layer->plane, layer->id, 0,
> +					     SUN4I_BACKEND_NUM_LAYERS - 1);
> +
> +	if (ret) {
> +		dev_err(drm->dev, "Failed to install zpos property,
> +			rc = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return layer;
>  }
> 




