Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618786E9
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 20:04:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id e17so8998551edc.5
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=plI2ccCtxFfQQaA/IHicso25P4hNeiGkni4LSwxPbm4=;
        b=Oa0+iWZ5DBGIMbtbaWYlC5APlU/wi67OB46kQ8Fked1WkqCJO7eSuYV4pXcpMtsrLh
         h4m8ns9bM2EwwF1pb3EvhBxIuI6zX9ev0R6fn6dUX6ngsdv7SQcvBDNqWnFLGSyURMsG
         3t1udFKm1hYrJJ9BkltIYCn31OmFy6AZPUQ8/Sj6T1LlhFdQjhA57LTt7OJxR5vTJLKR
         IuunwxnSMYyOBJoMqzyfHehMGdq3P/FdVikYQbvRTcieYwm9qSRwWDkFuVFhqCAaAZGj
         eCCSN7KdX2r0rqA0gSJxLFOqvSdqphm5EeP5zTMWlKZ20BzoIgCkXDmhh8P46XPQ9TEb
         YhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=plI2ccCtxFfQQaA/IHicso25P4hNeiGkni4LSwxPbm4=;
        b=y+E/vl0EToV/+jpHjvTU6kb6wWautRoxqCky523nRQYXYKXFuzkneG4xATpEd8DVOM
         dwcWMxb0lHA6XFYCYk5CZQ1TXmagVA2qyc57Qbe6PDlvZsmEmZwyzVIV9pdAynStXlqq
         PPecxaaji6N0wJXaW3niGvQQBtcNmMmpBbw/xLfjfw2WpmsdObSAcvs9iFx4kInCfDWV
         hHRJuqneH0LernkOXiEc2q3YNwF9HNvpeCCYzi/zmX3UKizrNgWQvjaVNO5Wjgd8qiF2
         gmTRg4jiY7OpXT08MMo5BU3f8Sf7irZR77u1EOhvG07G4g0hQzp/5TqT6ukGXEdPV46E
         HdpA==
X-Gm-Message-State: ACgBeo0HGGmmSkhGDiF9Cz9s17xT43brXVzhx/yEEjV1Nj357pPBBiGI
	kIhMH1UQ9LeYuFgddlQvRkM=
X-Google-Smtp-Source: AA6agR6Kk9aCcEfrY5Ey5jOi/kWmdkQVgNAUGJ16H1QclaprIGEZQnyZQvab5nv2idHUjXMCwzagDQ==
X-Received: by 2002:a05:6402:911:b0:44e:a5b4:74f7 with SMTP id g17-20020a056402091100b0044ea5b474f7mr211765edz.249.1662494675009;
        Tue, 06 Sep 2022 13:04:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906850600b0073d9a0d0cbcsm7193709ejx.72.2022.09.06.13.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:04:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into atomic_enable
Date: Tue, 06 Sep 2022 22:04:32 +0200
Message-ID: <10138422.nUPlyArG6x@kista>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-36-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech> <20220728-rpi-analog-tv-properties-v2-36-459522d653a7@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 29. avgust 2022 ob 15:11:50 CEST je Maxime Ripard napisal(a):
> Our mode_set implementation can be merged into our atomic_enable
> implementation to simplify things, so let's do this.

Are you sure this is a good thing in long term? What if user wants to change 
mode? Unlikely, but why not.

Best regards,
Jernej

> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index f7aad995ab5b..3944da9a3c34 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -359,23 +359,13 @@ static void sun4i_tv_enable(struct drm_encoder
> *encoder,
 {
>  	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
> -
> -	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
> -
> -	sunxi_engine_apply_color_correction(crtc->engine);
> -
> -	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
> -			   SUN4I_TVE_EN_ENABLE,
> -			   SUN4I_TVE_EN_ENABLE);
> -}
> -
> -static void sun4i_tv_mode_set(struct drm_encoder *encoder,
> -			      struct drm_display_mode *mode,
> -			      struct drm_display_mode 
*adjusted_mode)
> -{
> -	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
> +	struct drm_crtc_state *crtc_state =
> +		drm_atomic_get_new_crtc_state(state, encoder->crtc);
> +	struct drm_display_mode *mode = &crtc_state->mode;
>  	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
>  
> +	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
> +
>  	/* Enable and map the DAC to the output */
>  	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
>  			   SUN4I_TVE_EN_DAC_MAP_MASK,
> @@ -468,12 +458,17 @@ static void sun4i_tv_mode_set(struct drm_encoder
> *encoder,
> SUN4I_TVE_RESYNC_FIELD : 0));
>  
>  	regmap_write(tv->regs, SUN4I_TVE_SLAVE_REG, 0);
> +
> +	sunxi_engine_apply_color_correction(crtc->engine);
> +
> +	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
> +			   SUN4I_TVE_EN_ENABLE,
> +			   SUN4I_TVE_EN_ENABLE);
>  }
>  
>  static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
>  	.atomic_disable	= sun4i_tv_disable,
>  	.atomic_enable	= sun4i_tv_enable,
> -	.mode_set	= sun4i_tv_mode_set,
>  };
>  
>  static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
> 
> -- 
> b4 0.10.0-dev-65ba7



