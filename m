Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D6B59E47
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Vb0VfIXa"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ba2dd905f9so910996b6e.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702564868; x=1703169668; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JznIu9lNlIeiTo8wKTcxQuhhJ2zgIwL8Q7gBCogBxvY=;
        b=Vb0VfIXaGSxQ7Ty1iU2nFbWoQUqNmqCFBVN0+Ry6Be9CmdBf/5tb1DEjweuuRpxmcV
         8pK6NfKOLJRmgpQ8z75r5STOcTSpeev+ME3fNJc14jsI39gv+7Kt7ur6cv/puSQOOEj0
         T3D6/CaRwAqPzVM4nOjwYhaD+D8mBGkOZihfBu//pZxD83tHmvKkAHLVgnhGom7/4Ct4
         bvJVT1hXvz/7OPzHkmf+92IUYAY22PK4wzq0nbtb3axb8LdjZUSwqg1zpzB44sZYHI5d
         rEV+9VcLViUXVrvVSRl8tiebqYyeoBLMI6zQz1fr000PThhvnx0yQC8lj5RuqmZ6HDrn
         Fo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564868; x=1703169668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JznIu9lNlIeiTo8wKTcxQuhhJ2zgIwL8Q7gBCogBxvY=;
        b=dgqWta06Sjpc4d8ssAlNJ/mCHFNZZlJCxEBmiqS0KiDZU0y5MEJATJhz6snkEveNdZ
         VyDAE7zpXq5lYBsZe1c3xKifhZoyn1/8rXRrVCpTjwVbav4BgPn1onDiA9DIbeT/iAa/
         EWzXZJOkYfd8U0vIPTzIn8u9KEGa58js2Abf32QcsLBG12gOEqjWGDGeLWhdp4UXJSNK
         cw5pqv4RMt/hDOT6Xv96qWbjfC5smIBamYUfVbZLiry68E6yMWjINGFke4PZ3JwG4JwU
         xvcdv7nsEV6cBUxj3AwT/9Fs7TTRZWNgALdcv2N2kcWbfmLW9fE5Cpxqe0u1b77P6ncB
         G5ag==
X-Gm-Message-State: AOJu0YwMpaED50sCQ+sIWvghzPPOtYBISGAd+4ljmZbjVO8tbXCq3vuW
	hFQDwF7IH9XIHI+YC3zjkVUwGL8IQJt5ETLoywJNOQ==
X-Google-Smtp-Source: AGHT+IH6Z7ttlPWqmsWbeFA/szWdyE6FZ1U9zu49mWSIzwza1ccFf3m2KxsdaL0W2oe0vmgh5g75w+m4VqHHxQxLixU=
X-Received: by 2002:a05:6808:140c:b0:3b9:ff46:fa9b with SMTP id
 w12-20020a056808140c00b003b9ff46fa9bmr12542705oiv.43.1702564868089; Thu, 14
 Dec 2023 06:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-7-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-7-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:40:52 +0000
Message-ID: <CAPY8ntDT1X-2y7P-FAdw1CsT3SQuxCbfuhG6kPGR=v2KCnoQ8g@mail.gmail.com>
Subject: Re: [PATCH v5 07/44] drm/connector: hdmi: Create an HDMI sub-state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
>
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 35 +++++++++++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  4 ++++
>  include/drm/drm_connector.h               |  7 +++++++
>  3 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 54975de44a0e..e69c0cc1c6da 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -570,6 +570,22 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>
> +/**
> + * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> + * @connector: DRM connector
> + * @new_state: connector state to reset
> + *
> + * Initializes all HDMI resources from a @drm_connector_state without
> + * actually allocating it. This is useful for HDMI drivers, in
> + * combination with __drm_atomic_helper_connector_reset() or
> + * drm_atomic_helper_connector_reset().
> + */
> +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> +                                             struct drm_connector_state *new_state)
> +{
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> +
>  /**
>   * drm_atomic_helper_connector_tv_check - Validate an analog TV connector state
>   * @connector: DRM Connector
> @@ -619,6 +635,25 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
>
> +/**
> + * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
> + * @connector: DRM Connector
> + * @state: the DRM State object
> + *
> + * Provides a default connector state check handler for HDMI connectors.
> + * Checks that a desired connector update is valid, and updates various
> + * fields of derived state.
> + *
> + * RETURNS:
> + * Zero on success, or an errno code otherwise.
> + */
> +int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> +                                          struct drm_atomic_state *state)
> +{
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index b9740edb2658..d59d2b3aef9a 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -71,7 +71,11 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
>  void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>                                          struct drm_connector_state *conn_state);
>  void drm_atomic_helper_connector_reset(struct drm_connector *connector);
> +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> +                                             struct drm_connector_state *new_state);
>  void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
> +int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
> +                                          struct drm_atomic_state *state);
>  int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
>                                          struct drm_atomic_state *state);
>  void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4491c4c2fb6e..000a2a156619 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1031,6 +1031,13 @@ struct drm_connector_state {
>          * DRM blob property for HDR output metadata
>          */
>         struct drm_property_blob *hdr_output_metadata;
> +
> +       /**
> +        * @hdmi: HDMI-related variable and properties. Filled by
> +        * @drm_atomic_helper_connector_hdmi_check().
> +        */
> +       struct {
> +       } hdmi;
>  };
>
>  /**
>
> --
> 2.43.0
>
