Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5AB14B812
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708628892; cv=none; b=rnEf/y1EOGYzrPqw4lle+rLG6/Cx9WnJE3Tl+UV4owCfIgXmmWzDFMEbmlzXeiLY+9VNAU4VBq+vYzv4an9Jq43UmWuRAzCM2QFoE9Mqjhw8mHDlAJMnSwYQqWIFUq1PdJb8KBu2jVeaWRZJ5kmi2iB4iO+AfUd6QwMCUqeLbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708628892; c=relaxed/simple;
	bh=Vj0CdswYrgpd1U1o0M5HTUkMxkiuvEUXaGvjLSwzlcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xg8j+X/mrhEGY5+eYvZRvxz3B/R5lbd+ZvNr7kT7+Lk+VVmu+qCJfa643ixGH7/aAjguMLEhz9O4CZYc7xp1MI1fDOXk9JUj6NS4Q+uSwHr8UHdaC480WqOAHgvVZrdgrkYWvqOjgp7Tgu4WjxRU7yJOsW+CAQ2T6AQ1kylGbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nefij/TQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nefij/TQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a34c5ca2537so11425766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708628888; x=1709233688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwGHver7Zdn7kvlDq1hFb/tIb6DJ0PWghCpxj29Cdaw=;
        b=Nefij/TQR329R8Gg5LnrTcmTYpTcDS3brDWq3aZA1rqutGI3xqAwKMbOVcku9/Waqd
         lksTssCnFb1o0IbACetx7j1EjzG6P3GmG231+kkAjMelv0f9N8gTZw/F77uU5tYiSxeK
         pQH2JIcDjKggHPjaQhKRTO3orMi8mPuec4LdKo/THWAmit8TPc3KAwRJnu6cfr14yJ/B
         vO8B9c3ja6XbrPLzjx5zqEQD4VUHvZFthOBMqE2OWeA3aBs8BiuFHscWkI0T5Ixfs/OQ
         OsZY8zboQXGMUPe+bFiC1+j50x7434PB+sLMnqjH3UL5u2bWDFwilIUYA2ZDyTZtBvac
         iZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708628888; x=1709233688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwGHver7Zdn7kvlDq1hFb/tIb6DJ0PWghCpxj29Cdaw=;
        b=b/5G3u2RMEd/ubcl/vgEPEp2WDTmvMeBXD6GzzjQBt+rIn5Wtz8MPFKZq2WG4/KnPK
         MLCatGjZ5M2/GPBRu5dhRkQcVHTj+SzGCONxNtZGTLZDfGNVXLHK84606uIX3c20P/Zx
         NRKeym1Shf9Ol0iqvG08dtpRLhzZrSZkwqyQP7EEFZuV25O7sCQOuejf0OZe4XZwW/Tv
         NK/O6IpRml2l7196i79R+IGmJmB1bOvM/8vjvUIqPqqJeFWuCE65Bx/d/Sox7qKWoaRh
         awZ7kBHF+8m8FBQKVH0epJtwmG6m5fIBdCNOxamxzK26BgHaB+ulBgqHVxVUgMhADSa2
         ah3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn3eO2qgYRLgsq4aNOLghrq7BqCMDi0+iON657IDOicxjwXxgDpr26jS/3C+o1kxyarlOHMH7jLuIPJ7E6cVmAZoHTyZ6cA6u7/5g=
X-Gm-Message-State: AOJu0YyajiZZIIayPMGTDk7e0a5WfR2PMw/WrXpUprTFOCsQLpxvDdkZ
	2NE9XOUfTMjQafxCw3Ufm5ojCvqrPVKNUvRIQK6V7Sx64zBhEv22
X-Google-Smtp-Source: AGHT+IH07eQ34d4DdPWILOvpSPCbS9FOaWmp8ij6cDkZAQw5B9sGMqV+xWKbUWYZV2D0b3TvgKbqtg==
X-Received: by 2002:a17:906:aad1:b0:a3e:a3d6:eb6f with SMTP id kt17-20020a170906aad100b00a3ea3d6eb6fmr8035501ejb.48.1708628888412;
        Thu, 22 Feb 2024 11:08:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id xg7-20020a170907320700b00a3d11feb32esm6145225ejb.186.2024.02.22.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:08:07 -0800 (PST)
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
Subject: Re: [PATCH v7 32/36] drm/sun4i: hdmi: Convert encoder to atomic
Date: Thu, 22 Feb 2024 20:08:05 +0100
Message-ID: <4545275.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-32-8f4af575fce2@kernel.org>
References:
 <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-32-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:18 CET je Maxime Ripard napisal=
(a):
> The sun4i_hdmi driver still uses the non-atomic variants of the encoder
> hooks, so let's convert to their atomic equivalents.
>=20
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 152375f3de2e..799a26215cc2 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -82,7 +82,8 @@ static int sun4i_hdmi_atomic_check(struct drm_encoder *=
encoder,
>  	return 0;
>  }
> =20
> -static void sun4i_hdmi_disable(struct drm_encoder *encoder)
> +static void sun4i_hdmi_disable(struct drm_encoder *encoder,
> +			       struct drm_atomic_state *state)
>  {
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	u32 val;
> @@ -96,7 +97,8 @@ static void sun4i_hdmi_disable(struct drm_encoder *enco=
der)
>  	clk_disable_unprepare(hdmi->tmds_clk);
>  }
> =20
> -static void sun4i_hdmi_enable(struct drm_encoder *encoder)
> +static void sun4i_hdmi_enable(struct drm_encoder *encoder,
> +			      struct drm_atomic_state *state)
>  {
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> @@ -120,9 +122,10 @@ static void sun4i_hdmi_enable(struct drm_encoder *en=
coder)
>  }
> =20
>  static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state)
>  {
> +	const struct drm_display_mode *mode =3D &crtc_state->mode;
>  	struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
>  	unsigned int x, y;
>  	u32 val;
> @@ -201,9 +204,9 @@ static enum drm_mode_status sun4i_hdmi_mode_valid(str=
uct drm_encoder *encoder,
> =20
>  static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs =3D=
 {
>  	.atomic_check	=3D sun4i_hdmi_atomic_check,
> -	.disable	=3D sun4i_hdmi_disable,
> -	.enable		=3D sun4i_hdmi_enable,
> -	.mode_set	=3D sun4i_hdmi_mode_set,
> +	.atomic_disable	=3D sun4i_hdmi_disable,
> +	.atomic_enable	=3D sun4i_hdmi_enable,
> +	.atomic_mode_set	=3D sun4i_hdmi_mode_set,
>  	.mode_valid	=3D sun4i_hdmi_mode_valid,
>  };
> =20
>=20
>=20




