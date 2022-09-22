Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6F8B12
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Sep 2022 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663879489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egAUUE2RcVn0MmhtNqGb8yG9hkjyoED8dnHu3MKi3J4=;
	b=HwPlNIPKm5Ucqf8CD6s9I9mOolAezofci3sywvnD0CX1nPalpl8ScLV5IDkvPYr7BbN0Cj
	zPlDCrXCMpII07fIolvijRq0B6zUmmEoNoEuI8fbBrF56/VHjc3ZhdPOcppqoh+mwlo4V6
	CtclT2U2pLj3mhtMlZQX3V7YVinLFRs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-bboWlCccNg2wTt2sxY65mw-1; Thu, 22 Sep 2022 16:44:49 -0400
X-MC-Unique: bboWlCccNg2wTt2sxY65mw-1
Received: by mail-qk1-f199.google.com with SMTP id bj42-20020a05620a192a00b006cf663bca6aso1706271qkb.3
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Sep 2022 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=egAUUE2RcVn0MmhtNqGb8yG9hkjyoED8dnHu3MKi3J4=;
        b=0hzTskCtWiZ5jGtbhWHZewYiKo9kmtO2w3/kiOBJze9j2bPaflLw2gGjVnCp8NeWVo
         0SgAfYrBn1RFEVlO8HsS/FdU3HGQp9TCmYNsXA7tbQC8+xXFExH0g95Sy+wGOO51hykN
         ath74+xXBI1a0gDhH0pp4+N5WJC/xkIRZAYpZcWn/lO8kY8jahKWl6BrgQAH6GFN/Acq
         YNuiHwS3WKIn9TpFvuV0WhSksYPx5Mj9sup6Y3ltoVJs/Xg7MrX2q+VMgyhps/bwIrz5
         g5vlMM98qEupEfNCQNFIXbYnFI4tMWtLgtAF6YxHlFEBSJwVr6eQtbl6K+QMMHA9KphD
         t+3Q==
X-Gm-Message-State: ACrzQf3fciEkNfgCi5XYAonPQiALlwgkZqAiRyVAAEb3SQI/2OXVFbNI
	xCnu7A3iWtwAM4tFgR94NC7apSEAP0N6sFuM+XLPVmgufDVdxmCC+FoLhTZmSIi/FhtUPMlEhKO
	SSf1g0udQDmm8rMNQ3ekaipQ=
X-Received: by 2002:a05:620a:294f:b0:6b4:6915:f52d with SMTP id n15-20020a05620a294f00b006b46915f52dmr3552152qkp.159.1663879487389;
        Thu, 22 Sep 2022 13:44:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hJvnfHuMPYQoa1dF90aVYxvfszCs4uruKj4GsCDhC2vD0dA8TaI5sQiI8L5AI1KqlQ5onkw==
X-Received: by 2002:a05:620a:294f:b0:6b4:6915:f52d with SMTP id n15-20020a05620a294f00b006b46915f52dmr3552136qkp.159.1663879487126;
        Thu, 22 Sep 2022 13:44:47 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
        by smtp.gmail.com with ESMTPSA id o29-20020a05620a0d5d00b006b60d5a7205sm4017402qkl.51.2022.09.22.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 13:44:46 -0700 (PDT)
Message-ID: <0f9235df571e422e8d3375603d17ccff19530ad5.camel@redhat.com>
Subject: Re: [PATCH v2 06/33] drm/connector: Rename legacy TV property
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben
 Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,  Maxime
 Ripard <mripard@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Emma Anholt <emma@anholt.net>, Karol
 Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org, Noralf =?ISO-8859-1?Q?Tr=F8nnes?=
 <noralf@tronnes.org>, Dom Cobley <dom@raspberrypi.com>, 
 linux-sunxi@lists.linux.dev, Mateusz Kwiatkowski
 <kfyatek+publicgit@gmail.com>,  dri-devel@lists.freedesktop.org
Date: Thu, 22 Sep 2022 16:44:44 -0400
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
	 <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

nouveau changes:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-09-22 at 16:25 +0200, Maxime Ripard wrote:
> The current tv_mode has driver-specific values that don't allow to
> easily share code using it, either at the userspace or kernel level.
> 
> Since we're going to introduce a new, generic, property that fit the
> same purpose, let's rename this one to legacy_tv_mode to make it
> obvious we should move away from it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c06d0639d552..7f2b9a07fbdf 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -698,8 +698,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->tv.margins.top = val;
>  	} else if (property == config->tv_bottom_margin_property) {
>  		state->tv.margins.bottom = val;
> -	} else if (property == config->tv_mode_property) {
> -		state->tv.mode = val;
> +	} else if (property == config->legacy_tv_mode_property) {
> +		state->tv.legacy_mode = val;
>  	} else if (property == config->tv_brightness_property) {
>  		state->tv.brightness = val;
>  	} else if (property == config->tv_contrast_property) {
> @@ -808,8 +808,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->tv.margins.top;
>  	} else if (property == config->tv_bottom_margin_property) {
>  		*val = state->tv.margins.bottom;
> -	} else if (property == config->tv_mode_property) {
> -		*val = state->tv.mode;
> +	} else if (property == config->legacy_tv_mode_property) {
> +		*val = state->tv.legacy_mode;
>  	} else if (property == config->tv_brightness_property) {
>  		*val = state->tv.brightness;
>  	} else if (property == config->tv_contrast_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..ede6025638d7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1686,14 +1686,14 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
>  	if (drm_mode_create_tv_margin_properties(dev))
>  		goto nomem;
>  
> -	dev->mode_config.tv_mode_property =
> +	dev->mode_config.legacy_tv_mode_property =
>  		drm_property_create(dev, DRM_MODE_PROP_ENUM,
>  				    "mode", num_modes);
> -	if (!dev->mode_config.tv_mode_property)
> +	if (!dev->mode_config.legacy_tv_mode_property)
>  		goto nomem;
>  
>  	for (i = 0; i < num_modes; i++)
> -		drm_property_add_enum(dev->mode_config.tv_mode_property,
> +		drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
>  				      i, modes[i]);
>  
>  	dev->mode_config.tv_brightness_property =
> diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
> index fa636206f232..86e992b2108b 100644
> --- a/drivers/gpu/drm/gud/gud_connector.c
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -303,7 +303,7 @@ static int gud_connector_atomic_check(struct drm_connector *connector,
>  	    old_state->tv.margins.right != new_state->tv.margins.right ||
>  	    old_state->tv.margins.top != new_state->tv.margins.top ||
>  	    old_state->tv.margins.bottom != new_state->tv.margins.bottom ||
> -	    old_state->tv.mode != new_state->tv.mode ||
> +	    old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
>  	    old_state->tv.brightness != new_state->tv.brightness ||
>  	    old_state->tv.contrast != new_state->tv.contrast ||
>  	    old_state->tv.flicker_reduction != new_state->tv.flicker_reduction ||
> @@ -424,7 +424,7 @@ gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
>  	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
>  		return config->tv_bottom_margin_property;
>  	case GUD_PROPERTY_TV_MODE:
> -		return config->tv_mode_property;
> +		return config->legacy_tv_mode_property;
>  	case GUD_PROPERTY_TV_BRIGHTNESS:
>  		return config->tv_brightness_property;
>  	case GUD_PROPERTY_TV_CONTRAST:
> @@ -454,7 +454,7 @@ static unsigned int *gud_connector_tv_state_val(u16 prop, struct drm_tv_connecto
>  	case GUD_PROPERTY_TV_BOTTOM_MARGIN:
>  		return &state->margins.bottom;
>  	case GUD_PROPERTY_TV_MODE:
> -		return &state->mode;
> +		return &state->legacy_mode;
>  	case GUD_PROPERTY_TV_BRIGHTNESS:
>  		return &state->brightness;
>  	case GUD_PROPERTY_TV_CONTRAST:
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
> index b91e48d2190d..d29b63fd6178 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -264,7 +264,7 @@ static int ch7006_encoder_create_resources(struct drm_encoder *encoder,
>  				      priv->hmargin);
>  	drm_object_attach_property(&connector->base, conf->tv_bottom_margin_property,
>  				      priv->vmargin);
> -	drm_object_attach_property(&connector->base, conf->tv_mode_property,
> +	drm_object_attach_property(&connector->base, conf->legacy_tv_mode_property,
>  				      priv->norm);
>  	drm_object_attach_property(&connector->base, conf->tv_brightness_property,
>  				      priv->brightness);
> @@ -315,7 +315,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
>  		ch7006_load_reg(client, state, CH7006_POV);
>  		ch7006_load_reg(client, state, CH7006_VPOS);
>  
> -	} else if (property == conf->tv_mode_property) {
> +	} else if (property == conf->legacy_tv_mode_property) {
>  		if (connector->dpms != DRM_MODE_DPMS_OFF)
>  			return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> index 9379f3463344..abaf9ded942d 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -1986,7 +1986,8 @@ intel_tv_init(struct drm_i915_private *dev_priv)
>  	}
>  	drm_mode_create_tv_properties(dev, i, tv_format_names);
>  
> -	drm_object_attach_property(&connector->base, dev->mode_config.tv_mode_property,
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.legacy_tv_mode_property,
>  				   state->tv.mode);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_left_margin_property,
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index be28e7bd7490..1a15534adc60 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -662,7 +662,7 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
>  					conf->tv_subconnector_property,
>  					tv_enc->subconnector);
>  	drm_object_attach_property(&connector->base,
> -					conf->tv_mode_property,
> +					conf->legacy_tv_mode_property,
>  					tv_enc->tv_norm);
>  	drm_object_attach_property(&connector->base,
>  					conf->tv_flicker_reduction_property,
> @@ -722,7 +722,7 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
>  		if (encoder->crtc)
>  			nv17_tv_update_rescaler(encoder);
>  
> -	} else if (property == conf->tv_mode_property) {
> +	} else if (property == conf->legacy_tv_mode_property) {
>  		if (connector->dpms != DRM_MODE_DPMS_OFF)
>  			return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 0b3333865702..77c50ecb0309 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -274,7 +274,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  	struct drm_display_mode *mode;
>  
>  	mode = drm_mode_duplicate(connector->dev,
> -				  vc4_vec_tv_modes[state->tv.mode].mode);
> +				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
>  	if (!mode) {
>  		DRM_ERROR("Failed to create a new display mode\n");
>  		return -ENOMEM;
> @@ -312,7 +312,7 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
>  	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
>  
>  	drm_object_attach_property(&connector->base,
> -				   dev->mode_config.tv_mode_property,
> +				   dev->mode_config.legacy_tv_mode_property,
>  				   VC4_VEC_TV_MODE_NTSC);
>  
>  	drm_connector_attach_encoder(connector, &vec->encoder.base);
> @@ -449,7 +449,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
>  {
>  	const struct vc4_vec_tv_mode *vec_mode;
>  
> -	vec_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
> +	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
>  
>  	if (conn_state->crtc &&
>  	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1d5e3cccb9e3..5cfad8b6ad83 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -695,7 +695,7 @@ struct drm_connector_tv_margins {
>   * @select_subconnector: selected subconnector
>   * @subconnector: detected subconnector
>   * @margins: TV margins
> - * @mode: TV mode
> + * @legacy_mode: Legacy TV mode, driver specific value
>   * @brightness: brightness in percent
>   * @contrast: contrast in percent
>   * @flicker_reduction: flicker reduction in percent
> @@ -707,7 +707,7 @@ struct drm_tv_connector_state {
>  	enum drm_mode_subconnector select_subconnector;
>  	enum drm_mode_subconnector subconnector;
>  	struct drm_connector_tv_margins margins;
> -	unsigned int mode;
> +	unsigned int legacy_mode;
>  	unsigned int brightness;
>  	unsigned int contrast;
>  	unsigned int flicker_reduction;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6b5e01295348..35a827175c24 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -714,11 +714,13 @@ struct drm_mode_config {
>  	 * between different TV connector types.
>  	 */
>  	struct drm_property *tv_select_subconnector_property;
> +
>  	/**
> -	 * @tv_mode_property: Optional TV property to select
> +	 * @legacy_tv_mode_property: Optional TV property to select
>  	 * the output TV mode.
>  	 */
> -	struct drm_property *tv_mode_property;
> +	struct drm_property *legacy_tv_mode_property;
> +
>  	/**
>  	 * @tv_left_margin_property: Optional TV property to set the left
>  	 * margin (expressed in pixels).
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

