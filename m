Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE614B826
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708628911; cv=none; b=ahXK937lpd2TfEDENIFD1qvYlz8mXZcK9MnSEWoyDkgGIxmLYQxGmAImVbqx/JAV5oDX+AEDZD7fwruplTDiGDKyhYEHA7zCVbjMN4WRUT8qPo8Abg9uuCKPbOll6Yjspptel/UHOEX/XOQW7KYQ7+4jmV7N5vpT0W0L4tlh/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708628911; c=relaxed/simple;
	bh=4D9Oe8rDV8p+ZUKWWO/XSa6tVnlPRevU5T7Tsmgr9YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StOu5eUVAnfDrtBKpTzSPf/uzShN785eQOBx3agv3u05mlM8LquDJoG2ynnQRGuejNc0coHD3wNbm4bov2w7nKLdaiON1QihJucgQxKx6mGCxNPsX4EXWoIqdl9jWhwfEvx/L2/+XlvmqXIAZmjlO13j4mumnmdo3nS4RHyHob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpM4evnJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpM4evnJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3d484a58f6so8994866b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 11:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708628908; x=1709233708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miYXI5X8OB04A3nvBBpwERsgxft9kKmaWCdU6IfWrLc=;
        b=HpM4evnJaGnXC0XzrosoQYzqRchYVjIR+JQxG82y4kCJcPPUE2dHRs2E92OqKhx8Yq
         EX59rIVvFBY2e1YRdJXjP6vPpvpEPBYFfTEm72+st61AwovUOBmKCacH7xOl16OR+Xky
         ikPx2voli69VZs/+ouZ+o3e9djwftml10PTq6IhH1ahh2TQhAcd1yPAuhF1t/xqzd6De
         2AnoRQmhOPlro/3V3fED315Txz8dafu0rQrr+T/18G0soc4x1ZEmGz/I2NUSBdwrcDyU
         U4r9qgnMapcfmAu2Kqh48CkOLcCbPtBzMdbjXjcxz6Xxd+dnLk2gZLtXYq58U5aw38c6
         TiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708628908; x=1709233708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miYXI5X8OB04A3nvBBpwERsgxft9kKmaWCdU6IfWrLc=;
        b=c6yJRVwdvAajiWqFdEQ10DC1lWrLIhvZ8vfs7uLu7TKwU6jEP2RJj+lG8blMfDuPG8
         CuJZCX9TUzKejIcNh2qqjCixVR/hIEa8b9bj07eYiOyUSh2zJcB+gC1spSCbmNwitjiW
         aiMqSpDxgyB6jpk9YMxAkSDSIbVQI+SupwuEfY3X46jGRFveazaCkzXSHvrAeQLLwCVI
         HYHpFWM16T4FoWXaNqcvVW47l2SiKLKeAm6nx3f9heh+zBsml7eLxLIkii/w9YpRiNJI
         Aw3f8YmxRxU4oaQF8OaG973p4Vweo8d1DHKJlYT3jTkWQgHCeBOOSti8zxDgtIQZ1EnQ
         n38A==
X-Forwarded-Encrypted: i=1; AJvYcCUQn+JYxeG5/Uv+ZwcD9JEbv5Qeyqd0Xep+F0NB4MIpQmpXqg3I+Tnl88fyNfRppRIxNa4GuNtqwN+r92Iind/BrZu7Z81mSB6x8xk=
X-Gm-Message-State: AOJu0YyUpVNYG4VJHJdlCz6pe4Jg6XippYDlIQBg3bps9WanimhDrdh1
	dczzTU+p3/vsLy9+D1BveAoFzm0FHnqyTWvLtL366M0sZG+U1fwt
X-Google-Smtp-Source: AGHT+IFAwJtXHRxsMlfuxZbKsBCx57OJ9WWOE6NU3SwtpJdQrrzkkNNcvjYdXKu6pBGCRHU3AulfnQ==
X-Received: by 2002:a17:906:35d3:b0:a3f:2f67:4847 with SMTP id p19-20020a17090635d300b00a3f2f674847mr3966366ejb.19.1708628908074;
        Thu, 22 Feb 2024 11:08:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id b5-20020a170906490500b00a3e7b8bd2d8sm4663088ejq.111.2024.02.22.11.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:08:27 -0800 (PST)
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
Subject: Re: [PATCH v7 33/36] drm/sun4i: hdmi: Move mode_set into enable
Date: Thu, 22 Feb 2024 20:08:26 +0100
Message-ID: <4868938.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-33-8f4af575fce2@kernel.org>
References:
 <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-33-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:19 CET je Maxime Ripard napisal=
(a):
> We're not doing anything special in atomic_mode_set so we can simply
> merge it into atomic_enable.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 38 +++++++++++++---------------=
=2D-----
>  1 file changed, 14 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 799a26215cc2..bae69d696765 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -103,33 +103,11 @@ static void sun4i_hdmi_enable(struct drm_encoder *e=
ncoder,
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	struct drm_display_info *display =3D &hdmi->connector.display_info;
> +	unsigned int x, y;
>  	u32 val =3D 0;
> =20
>  	DRM_DEBUG_DRIVER("Enabling the HDMI Output\n");
> =20
> -	clk_prepare_enable(hdmi->tmds_clk);
> -
> -	sun4i_hdmi_setup_avi_infoframes(hdmi, mode);
> -	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> -	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
> -	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
> -
> -	val =3D SUN4I_HDMI_VID_CTRL_ENABLE;
> -	if (display->is_hdmi)
> -		val |=3D SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> -
> -	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> -}
> -
> -static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
> -				struct drm_crtc_state *crtc_state,
> -				struct drm_connector_state *conn_state)
> -{
> -	const struct drm_display_mode *mode =3D &crtc_state->mode;
> -	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> -	unsigned int x, y;
> -	u32 val;
> -
>  	clk_set_rate(hdmi->mod_clk, mode->crtc_clock * 1000);
>  	clk_set_rate(hdmi->tmds_clk, mode->crtc_clock * 1000);
> =20
> @@ -181,6 +159,19 @@ static void sun4i_hdmi_mode_set(struct drm_encoder *=
encoder,
>  		val |=3D SUN4I_HDMI_VID_TIMING_POL_VSYNC;
> =20
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_TIMING_POL_REG);
> +
> +	clk_prepare_enable(hdmi->tmds_clk);
> +
> +	sun4i_hdmi_setup_avi_infoframes(hdmi, mode);
> +	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> +	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
> +	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
> +
> +	val =3D SUN4I_HDMI_VID_CTRL_ENABLE;
> +	if (display->is_hdmi)
> +		val |=3D SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> +
> +	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>  }
> =20
>  static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *en=
coder,
> @@ -206,7 +197,6 @@ static const struct drm_encoder_helper_funcs sun4i_hd=
mi_helper_funcs =3D {
>  	.atomic_check	=3D sun4i_hdmi_atomic_check,
>  	.atomic_disable	=3D sun4i_hdmi_disable,
>  	.atomic_enable	=3D sun4i_hdmi_enable,
> -	.atomic_mode_set	=3D sun4i_hdmi_mode_set,
>  	.mode_valid	=3D sun4i_hdmi_mode_valid,
>  };
> =20
>=20
>=20




