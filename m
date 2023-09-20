Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2D1A583
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 17:15:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so2594960a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695230139; x=1695834939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BA/1TKZ7fFQpqXSbCVNQn/zfVi+d+HyfuxOxnEyY4I=;
        b=bazA5XEpMmEIFzzTHztmIe1JK/6MKwcI7Hz8ak+YyMsgg7dhzTD0LfBVLDqIJZyG7H
         nFs1lgmzvc1ybh1EbmY3561Pa6ONVPydKDQXRn/SklU83zmELhyZFpv2O/aLV4YB693A
         1OlgP6vbAm86IV5YK3zyO/bXdpFvlZYyivl+v+TBONkulWZRAgeiDRa0R1HeDCtOZIiS
         x/BHKuTuVBLHARO/B5lugYpzRgfGdedilAoHeIbm21KQnUm6AaS0o8aSqZD1ITl6GC8l
         KGayABSqBMY4MqDgQ+WbPD8JFHERU+/pfGu7ZOrHXVMnlEqWWAwcIy78VUDuv8gwraL6
         lkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695230139; x=1695834939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BA/1TKZ7fFQpqXSbCVNQn/zfVi+d+HyfuxOxnEyY4I=;
        b=cLjeg54/ozVCcFtLw3zeaA+zdo6CPhkoaGBuw6OC56YQYPkTeI8XIiBayFCJaoj5WA
         6Xc1aX559RZrzZJ47zKkdaMvicKb4fh1P+iQBQDX6u1ijXtZUfat5QjrFR4krwt2Qn+5
         aIR0rSfdL4672jtT5ULGPWccCW5oBdroN7XflY9ZR/oM1LbmyiI5Ul7lQX9KGOlZb/Qf
         zvO1EfOizshEgt8HgT2JeTjdpxlfY97ASRyXIILSJ0yRRbBILEskPxFikk0FkOpAjMm/
         ILnKdQUrTQ2/upHL/X1WFPu+B803UHdw0tmBB2xUgrDyWl6UMVb4k5gZtJ44fVQtrAs+
         y7qA==
X-Gm-Message-State: AOJu0YyaknZxNc8ZDFV0olZz0M8MQQOxD/KRrb9/bRdY8ZRpQX2uIuEj
	HnzFYST7ZiuU8qlCluPTf9A=
X-Google-Smtp-Source: AGHT+IEQhqAdu9sZQ70y0DS8nngdK+Mk0pkfbWS4qneo1KxLRSZ3qBsiVtqIu4sC8i/YErZyL1rzjQ==
X-Received: by 2002:a17:906:3147:b0:993:eee4:e704 with SMTP id e7-20020a170906314700b00993eee4e704mr4288238eje.38.1695230139300;
        Wed, 20 Sep 2023 10:15:39 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id lx12-20020a170906af0c00b00988f168811bsm9649634ejb.135.2023.09.20.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 10:15:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>
Subject:
 Re: [PATCH RFC v2 07/37] drm/connector: hdmi: Add HDMI compute clock helper
Date: Wed, 20 Sep 2023 19:15:37 +0200
Message-ID: <1967070.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-7-17932daddd7d@kernel.org>
References:
 <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
 <20230920-kms-hdmi-connector-state-v2-7-17932daddd7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxime!

Dne sreda, 20. september 2023 ob 16:35:22 CEST je Maxime Ripard napisal(a):
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  5 +++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b01cb4783ea6..4c1af97971bb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2944,6 +2944,37 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
>  }
>  EXPORT_SYMBOL(drm_connector_update_privacy_screen);
>  
> +/**
> + * drm_connector_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
> + * @mode: Display mode to compute the clock for
> + * @bpc: Bits per character
> + * @fmt: Output Pixel Format used
> + *
> + * Returns the TMDS Character Rate for a given mode, bpc count and output format.
> + *
> + * RETURNS:
> + * The TMDS Character Rate, in Hertz
> + */
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +				      unsigned int bpc,
> +				      enum hdmi_colorspace fmt)
> +{
> +	unsigned long long clock = mode->clock * 1000ULL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		clock = clock * 2;
> +
> +	if (fmt == HDMI_COLORSPACE_YUV422)
> +		bpc = 8;

I think you're missing YUV420 handling, which needs half of clock speed. But
this is a thing of HDMI2.

Best regards,
Jernej

> +
> +	clock = clock * bpc;
> +	do_div(clock, 8);
> +
> +	return clock;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_compute_mode_clock);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>  				    struct drm_property *property,
>  				    uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a66cb4e35d7b..d74e9c64ee88 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -38,6 +38,7 @@ struct drm_connector_helper_funcs;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>  struct drm_crtc;
> +struct drm_display_mode;
>  struct drm_encoder;
>  struct drm_panel;
>  struct drm_property;
> @@ -2115,6 +2116,10 @@ void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
>  void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
> +unsigned long long
> +drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> +				      unsigned int bpc,
> +				      enum hdmi_colorspace fmt);
>  
>  /**
>   * struct drm_tile_group - Tile group metadata
> 
> 




