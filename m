Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99E14B812
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708629156; cv=none; b=AUiMRGVmJVqt/RllWpM1TH/QVOWeoMpaVMrjUKrSB3CeUp2QYgy6vE58Cv2oi+uZ+vcOzl6iVKgtMmzs2OFyxeesZA9q941Pn4/8s/eakmIA4GYNNcLmtdl++NravlanhZsVuPwbTIMKWPAmLK0z94mSwFOF6L1xdN5R9SdYqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708629156; c=relaxed/simple;
	bh=EW5s5hgTLOrLlu9kaSmm1DDCMmvLyTW02LJkYzGXn+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0Ua0KZgJCocQY2wqVF4uZmRz2WgChbjt00fMqknvjGUgbof4cb+n1kcuIaa44QPbPUVCw6L6QpxrMcMINLXdi+1uKCXzOvHbT9pyNlwV7XcVF76WaZmoJeHXuTj0r2poWc/7usWPGGa8CQ7sMVyWb8zoUmkKGTXYMvlEnnAr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCpMpCN9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCpMpCN9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51197ca63f5so208469e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 11:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708629153; x=1709233953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ascVxuLaaMNM+iLyCaaEtYsJ/LtdyKIcDFbaaHuf7+A=;
        b=bCpMpCN9M9QoULaYsVC4YAo7PZDT2dpI7EN9AEBJhZaS7S74Vm+M68JtpmtyYHKoyE
         02YpCEIZfhP1hDAIUad4/yI9eFVwO0yRufHjE6h9v3dLVoqcBkpV1HSKbHnImH+2OZRI
         wg49jOAznw6RdeIfIWuotVAy+K/B/FUYjTIsvya85QVXWCC6bgpBfG8UP+tdoTXac46G
         xFXQJC7XAHiqMnzB0Aklosvl4O6uYx7boU28C2IDwZgnmvP9mEyq7qsFuzALNdiy5j+9
         M3EZ0EdK7dU2N3cpYWJvr4zH/e3xf2GBQn6gqmJG7zL8eVJ+XKZbTuhOAr7y1fB+IPXB
         Teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708629153; x=1709233953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ascVxuLaaMNM+iLyCaaEtYsJ/LtdyKIcDFbaaHuf7+A=;
        b=ceEjPUW0iRuVVFa2pgBABbKV+91v382Y+Wj4s0wNMYrffsQfrNKpp7yjZFRdsiKNIU
         6ALtlOKViaOLjFy4bxrJ7bGVnjKzYWhYKS6xSdlyLsDZOrc9Y3UJx2U1d39e0Evj2iy/
         uOpPP42i66iRthK/KeiU96KeYYjrSbZZI8MzE1pZuyadrpuTiYH+hgCwtnwZNu9iXW5H
         ApGhiTPLEtihEhMDbadif+7zoN0KnZdOMjLZkIuQANz51krnHSoKL7leZyZoFyGgkV0D
         e3hUg/7OLZ0Y40RND3sk9M/ZYZaTbNSVboqqcQJNSfcqxJoVvQePvoBjv3WJY0yV9BVq
         X1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVHwHrosqHpVmnecjRrkhkOmmOQDPVGeF2OpjCJYhvtS0ykzTsTrqh4Z4a6uTfNf0ElxTmX9UZfZEXFo4fD/c/KE918RsA9E2u6ZuU=
X-Gm-Message-State: AOJu0YxIAHyBriiaHnyXRYFUdOQX01xWuBdoyP/rWh970mEa2xNXwATE
	ovWAfq60RuuW7qQeaNUxh07269LXs57UttEcBvh88rLKCYcbyh9p
X-Google-Smtp-Source: AGHT+IGu+ExwuJo5Vy53aR587PvPGA/BvgjURLqHK9mgxxEedn8hBlpN+TNPuvzQRBJx6tkns7NcdQ==
X-Received: by 2002:a05:6512:1196:b0:512:d655:9d4b with SMTP id g22-20020a056512119600b00512d6559d4bmr55318lfr.5.1708629152360;
        Thu, 22 Feb 2024 11:12:32 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id r17-20020ac25a51000000b00512bfc0c2b9sm1189234lfn.178.2024.02.22.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:12:31 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject:
 Re: [PATCH v7 35/36] drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
Date: Thu, 22 Feb 2024 20:12:29 +0100
Message-ID: <2921783.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
References:
 <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-35-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:21 CET je Maxime Ripard napisal=
(a):
> atomic_check and mode_valid do not check for the same things which can
> lead to surprising result if the userspace commits a mode that didn't go
> through mode_valid. Let's merge the two implementations into a function
> called by both.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 74 +++++++++++++++++++++-------=
=2D-----
>  1 file changed, 47 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index c276d984da6b..b7cf369b1906 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -62,18 +62,6 @@ static int sun4i_hdmi_setup_avi_infoframes(struct sun4=
i_hdmi *hdmi,
>  	return 0;
>  }
> =20
> -static int sun4i_hdmi_atomic_check(struct drm_encoder *encoder,
> -				   struct drm_crtc_state *crtc_state,
> -				   struct drm_connector_state *conn_state)
> -{
> -	struct drm_display_mode *mode =3D &crtc_state->mode;
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
>  static void sun4i_hdmi_disable(struct drm_encoder *encoder,
>  			       struct drm_atomic_state *state)
>  {
> @@ -166,31 +154,61 @@ static void sun4i_hdmi_enable(struct drm_encoder *e=
ncoder,
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>  }
> =20
> -static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *en=
coder,
> -					const struct drm_display_mode *mode)
> +static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
> +	.atomic_disable	=3D sun4i_hdmi_disable,
> +	.atomic_enable	=3D sun4i_hdmi_enable,
> +};
> +
> +static enum drm_mode_status
> +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
> +				 const struct drm_display_mode *mode,
> +				 unsigned long long clock)
>  {
> -	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> -	unsigned long rate =3D mode->clock * 1000;
> -	unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI spec */
> +	const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connector=
);
> +	unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI spec */
>  	long rounded_rate;
> =20
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		return MODE_BAD;
> +
>  	/* 165 MHz is the typical max pixelclock frequency for HDMI <=3D 1.2 */
> -	if (rate > 165000000)
> +	if (clock > 165000000)
>  		return MODE_CLOCK_HIGH;
> -	rounded_rate =3D clk_round_rate(hdmi->tmds_clk, rate);
> +
> +	rounded_rate =3D clk_round_rate(hdmi->tmds_clk, clock);
>  	if (rounded_rate > 0 &&
> -	    max_t(unsigned long, rounded_rate, rate) -
> -	    min_t(unsigned long, rounded_rate, rate) < diff)
> +	    max_t(unsigned long, rounded_rate, clock) -
> +	    min_t(unsigned long, rounded_rate, clock) < diff)
>  		return MODE_OK;
> +
>  	return MODE_NOCLOCK;
>  }
> =20
> -static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
> -	.atomic_check	=3D sun4i_hdmi_atomic_check,
> -	.atomic_disable	=3D sun4i_hdmi_disable,
> -	.atomic_enable	=3D sun4i_hdmi_enable,
> -	.mode_valid	=3D sun4i_hdmi_mode_valid,
> -};
> +static int sun4i_hdmi_connector_atomic_check(struct drm_connector *conne=
ctor,
> +					     struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state =3D
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc *crtc =3D conn_state->crtc;
> +	struct drm_crtc_state *crtc_state =3D crtc->state;
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> +	enum drm_mode_status status;
> +
> +	status =3D sun4i_hdmi_connector_clock_valid(connector, mode,
> +						  mode->clock * 1000);
> +	if (status !=3D MODE_OK)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static enum drm_mode_status
> +sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> +				struct drm_display_mode *mode)
> +{
> +	return sun4i_hdmi_connector_clock_valid(connector, mode,
> +						mode->clock * 1000);
> +}
> =20
>  static int sun4i_hdmi_get_modes(struct drm_connector *connector)
>  {
> @@ -236,6 +254,8 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct =
device *dev)
>  }
> =20
>  static const struct drm_connector_helper_funcs sun4i_hdmi_connector_help=
er_funcs =3D {
> +	.atomic_check	=3D sun4i_hdmi_connector_atomic_check,
> +	.mode_valid	=3D sun4i_hdmi_connector_mode_valid,
>  	.get_modes	=3D sun4i_hdmi_get_modes,
>  };
> =20
>=20
>=20




