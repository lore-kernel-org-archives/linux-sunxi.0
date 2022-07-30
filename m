Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797A23D9
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 09:14:47 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id fy29so12115021ejc.12
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
        b=I463grYfVol0JRUlt+Ar+SpcJUB4ZO9pNGMk3/6nbERWzXNnIlibdYQ9cGLRUwcdn0
         7fPs1V3TsdNGHjKKB5BGN45EUyF7Wugi7wwhUJ/7OxSNvgtsEo1A8biJVgtzfbXFqgfK
         I2oOZ6oRwBoo7JEE1aAnCwt43GepXKPWGHhnUmmM6ZV+wrcdgIu5wwhgd1X934R+b+PS
         N+pb9eFkY8TnaObP8ZIpEJwsPFxFwSNi9+uy+Ucj9ofrw7BTQe8qYLQRsn56BEQmQhkc
         4Rl8DvXCRHTHsdydiNGH8CZ0PJtM3lIFi7IlIKiKUDGDHkYi4jP9KdDTDjAxBLxSVhck
         XRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
        b=b/k+eA1lXGj+ztPCwSxpgvcGBN+kdSpyOeVokm+lDzpjYZ2YBE3Z5ZlSGm5NffE4mc
         x4HEn9oXP2OiKIAt/cv6f6XUkUEGCnARO2kuarQ2hSUsEyaDkcR8/4/2ANbO8HKfPFG8
         KFuDm28IpL0vwxu0WOKkHl0L9PsoJ8hjjTnOCB7R7nIhp/TNAfxh4KAOqyTMIfRcH6I3
         AjrAWE8/HANbh4hzrE0qk/PwYvLuP124P5+WiYXa2Q6srSHfwODbgRGux8xcJZ6C9wCw
         N87AyStuGLNJCwprkssX5BXj16crEloNZ8P/46XYOuO+coi939kln0r6lEiLsYF8TLVR
         3uug==
X-Gm-Message-State: ACgBeo2HlEGC8NyntFzdPv1oc6/UlYJ40pU13T7yjp/gLAE/UyO6USuU
	JpHSHX0IKGEKtt8y6jfL71g=
X-Google-Smtp-Source: AA6agR4VYJrXZiOXIvhb8G1HuoD3AuMr4cbsju8RIBJv//kfsMPN/cLW/Y0CDv/M1HP7A2m0gTyCfw==
X-Received: by 2002:a17:907:75f7:b0:730:5b01:56b0 with SMTP id jz23-20020a17090775f700b007305b0156b0mr145624ejc.689.1659172485555;
        Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id p3-20020a17090653c300b00730223dc5c0sm2204354ejo.206.2022.07.30.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 29/35] drm/sun4i: tv: Remove useless destroy function
Date: Sat, 30 Jul 2022 11:14:43 +0200
Message-ID: <4754901.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 29. julij 2022 ob 18:35:12 CEST je Maxime Ripard napisal(a):
> Our destroy implementation is just calling the generic helper, so let's
> just remove our function and directly use the helper.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 52bbba8f19dc..6d7e1d51569a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -491,15 +491,9 @@ static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_fu .get_modes	= sun4i_tv_comp_get_modes,
>  };
> 
> -static void
> -sun4i_tv_comp_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
>  	.fill_modes		= drm_helper_probe_single_connector_modes,
> -	.destroy		= sun4i_tv_comp_connector_destroy,
> +	.destroy		= drm_connector_cleanup,
>  	.reset			= 
drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state	= 
drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	= 
drm_atomic_helper_connector_destroy_state,




