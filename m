Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF07114B824
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708629498; cv=none; b=gTBxyvM4cRI+G7gyYGdeWaoe/GtPd5IPl+15aAmpeE01M43wKAAdPumaZAD++y/ohvo03w7Vn6E8SW0GGgDu5YwSsyGxd2+6RCrYd4PleaDigEMmWnNdBC6CaZUW6Npl1oDq/cznOcVYWKiXrHL4hvrVDvz8/JFjJOtLE+DTzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708629498; c=relaxed/simple;
	bh=ipRg99dKoCexGU0mT0wMiy7MuLoK0LzRc3yx/o9w7ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpCN/6QW4FY7miafjMy5j5XaxIlFqRsNM4v3BllWAZ7S2jgXmk6a3PAWkH0kU6eyXvN2q3+GnZVuvB/8Pax03Wn/8TJSOrpp+FF042RQ676JO2WXl8dM2XbB5lQC2IeSBhocMuE+2OUqmgjrfgthoWJ/nZqLrYwWXmgqf3ueTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfQdDvSk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfQdDvSk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a28a6cef709so11705666b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 11:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708629495; x=1709234295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKmv8VA9qwrVjGnHU1RMltzYyr4GiBIOxbbvEQt4SA4=;
        b=ZfQdDvSkIoxNHmVITCnR4WW62sUCNumYtCTqqcAKScwFlDE8w3E2Tu2oaYhAIMwlpL
         7hrxhR6cf+m2QhINLrdv3rGh6P5+t67wlZOpttC9D9aiqcbRHlchHO7EorxdqzRnIOTu
         yaF1abqwiO8PfGAItiIcvYTTu4kPfCTbAIvjEFxWYNaceKDB+GFQMRGnPSadSWcg8RBl
         uDrJWpVg0GZc4dRAPjUTv5y5HfTgGzM04u6UKt7rJS9K6i2B2ZX0mHDGONrfxmycmwMT
         7mS3i/5gpnlCUvGHbM4gkLdXCi5qgyPjO+1IrsZPrpXRfP6ebP2oOGlEdxrPjrRhdr+G
         Ch5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708629495; x=1709234295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKmv8VA9qwrVjGnHU1RMltzYyr4GiBIOxbbvEQt4SA4=;
        b=SybRlMzddxLBsCTQbi35j5BIAF+zPHGsECsoxLWvrV1MxqSKl8GAmcOQqosOkL9hgA
         1NM2BUvlT0SpKHZzdolBsa7NY5weIYCgXEAwMPTeYOcf3y672S5Djy7cceyfYNACESNt
         w91f86Ba2B/EKuvvKhX2g80eYtOckJsG7C33fGMNKdOVNHd+3ODi/WLRMEf+8tXjUWP9
         pwYa2HXvu2hs2FTI8PfsM2NWggtVAt1dyNe8GispWawMilZA3KEYqEgcBl6AAOEPiZQj
         lf9Jw+FRr0gPYEK82JQJ/9kd2Jc6rPI15FlcfAm869L5OLmmT/VH9OSsYaQbRpBzIVyv
         yoIw==
X-Forwarded-Encrypted: i=1; AJvYcCVlv12a7bTSAEru/AqVmOvZ7/yfr/SMqRlLRPi/4ZBv7HJekCpkT+9TNxbvlLtRKoZYToSCofFEVJYHXObIvZgqpGwah339g7o4MFI=
X-Gm-Message-State: AOJu0YxEk9wGm8T3bKnzGVwCYIxHFPSo+R+klAN1c4Bm7EQQkgrkBZXL
	Oosw7lsfzlJdzYvUY1t6R9YZFlUdbO23qCZXcy6r1J/zzwY5XU5g
X-Google-Smtp-Source: AGHT+IGgtYpDu1X4LtE8dy25QBXvH7D+LGd/bcwDqJXyxCvF0xkzXLXvaCPTDclOjmCat6T4CZzXoA==
X-Received: by 2002:a17:906:1854:b0:a3e:73c8:d383 with SMTP id w20-20020a170906185400b00a3e73c8d383mr10308795eje.49.1708629494886;
        Thu, 22 Feb 2024 11:18:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id vu2-20020a170907a64200b00a3fa275de38sm425296ejc.162.2024.02.22.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:18:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/3] drm/sun4i: Add more parameters to sunxi_engine commit
 callback
Date: Thu, 22 Feb 2024 20:18:13 +0100
Message-ID: <9236885.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240216190430.1374132-3-megi@xff.cz>
References:
 <20240216190430.1374132-1-megi@xff.cz> <20240216190430.1374132-3-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 16. februar 2024 ob 20:04:25 CET je Ond=C5=99ej Jirman napisal(a=
):
> From: Ondrej Jirman <megi@xff.cz>
>=20
> These will be needed later on when we move layer configuration to
> crtc update.
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_backend.c |  4 +++-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c    |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c   |  5 ++++-
>  drivers/gpu/drm/sun4i/sunxi_engine.h  | 13 ++++++++++---
>  4 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4=
i/sun4i_backend.c
> index 335fd0edb904..e89eb96d3131 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -69,7 +69,9 @@ static void sun4i_backend_disable_color_correction(stru=
ct sunxi_engine *engine)
>  			   SUN4I_BACKEND_OCCTL_ENABLE, 0);
>  }
> =20
> -static void sun4i_backend_commit(struct sunxi_engine *engine)
> +static void sun4i_backend_commit(struct sunxi_engine *engine,
> +				 struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
>  {
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index c06d7cd45388..18e74047b0f5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -91,7 +91,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *cr=
tc,
> =20
>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> =20
> -	sunxi_engine_commit(scrtc->engine);
> +	sunxi_engine_commit(scrtc->engine, crtc, state);
> =20
>  	if (event) {
>  		crtc->state->event =3D NULL;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 1e681314e379..bdeb9b80e038 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_framebuffer.h>
> @@ -249,7 +250,9 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_=
format)
>  	return -EINVAL;
>  }
> =20
> -static void sun8i_mixer_commit(struct sunxi_engine *engine)
> +static void sun8i_mixer_commit(struct sunxi_engine *engine,
> +			       struct drm_crtc *crtc,
> +			       struct drm_atomic_state *state)
>  {
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> =20
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i=
/sunxi_engine.h
> index ec8cf9b2bda4..ec0c4932f15c 100644
> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -7,6 +7,7 @@
>  #define _SUNXI_ENGINE_H_
> =20
>  struct drm_plane;
> +struct drm_crtc;
>  struct drm_device;
>  struct drm_crtc_state;
>  struct drm_display_mode;
> @@ -59,7 +60,9 @@ struct sunxi_engine_ops {
>  	 *
>  	 * This function is optional.
>  	 */
> -	void (*commit)(struct sunxi_engine *engine);
> +	void (*commit)(struct sunxi_engine *engine,
> +		       struct drm_crtc *crtc,
> +		       struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @layers_init:
> @@ -144,12 +147,16 @@ struct sunxi_engine {
>  /**
>   * sunxi_engine_commit() - commit all changes of the engine
>   * @engine:	pointer to the engine
> + * @crtc:	pointer to crtc the engine is associated with
> + * @state:	atomic state
>   */
>  static inline void
> -sunxi_engine_commit(struct sunxi_engine *engine)
> +sunxi_engine_commit(struct sunxi_engine *engine,
> +		    struct drm_crtc *crtc,
> +		    struct drm_atomic_state *state)
>  {
>  	if (engine->ops && engine->ops->commit)
> -		engine->ops->commit(engine);
> +		engine->ops->commit(engine, crtc, state);
>  }
> =20
>  /**
>=20




