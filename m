Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933344;
	b=DkKEY7dvSOGA1jgiCCtvAdycwD+5qdDjq785eakSlyT2uWeYxgBs4ROdw5EPsDRTryy9
	 wShKhVd5zUiHNhheBIvB684j3xKA8/qVse0l5/anD9p+b9qiS+VWhRfp0KnWlT2vaEhbR
	 zw1pSDfM6xEDuk9z/0wFJreP8Onl6nAngEHr3wO4ZexzX41ydqASIoAVUmItWioH94IWO
	 0sS65np5IrCuVHV7WS6bqK9yc8GtAbuTI4NaRnKjVi/OwrRxQ9xdULcbOJpDmDRuCcDUp
	 wvqA8d+47NgnF2RLJfYElYDGk84Mjq9aiJgoa2pIKat7Hwli9yg8BQFDRHrZv+Li2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
	b=GWZ+HLutUxrdK5//QI8XsfOmoIVhWmgIwM1zaddF9g4kjdmdi1Y9Mj++n0MWYUnrgOc9
	 i4yYDi8rW1iqKfc/CaAEBV4z0amfnBhhsjbuO1htvVYPJWk0vZSOGxzMlQby81xg/oWQk
	 Vrr1yVnWDZI0iVet6qQN8Q9VP573TSEwIAdvktFJI8iy5dHgZ/2CF8VNl+AcQMAB/2iy7
	 W+t1Q6W6BtSei1CYydlV23MxXDlJ+1Hr2l7g9VCKO1HGpZZDUsC05ekDp00nMj8uwuY3z
	 ZtvbPHSNfsYUXgPnpSRXO7FFz/nXGLfI6y4q37Dzfooou4/f15XBzJlQU66FKQ+U9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaec7S2Y;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA097606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 16:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA097606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaec7S2Y
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso399245e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 08:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933342; x=1795538142; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=eaec7S2YFmHUOvcbCGR2/vUuL9SC13hp4n2O+EksFjKCpC6LQnXwEHcIYTbrUt3IbL
         ZZR2eXAie+4XpvvIPdVz0z0qJgc4z5YLgrdcdQjbqU7acg2julKg6fNi0zLw0FN5m9Sm
         Agg/dHCJ6wT3cw727tu3onXZfK1BTP6uzYTet/7yNQ7m4R0Wbt6PgZRi8RGmULWfssri
         +MjdrkfIjMlFpNVIJH062iyNMa5t5Fb7Q6j+mdxV/GIv2WpBpJKDKxeg2M38syMIzjy1
         AR/rGCErkJPl+rFwO8FILhkde7EBnoWSsOsHswQgjKoYG7Fbv7t0BxiXegpmQJZdkuX1
         YAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933342; x=1795538142;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=L8UW+nnMeqmXwLNwcXrfaYWs4WvvfPc5r0NF/CdW9X+LOnJRg+8inrY3XNp/NlsgBl
         PpASIGsrxbxh3q+zHE4h6LJ9JtTmPkwzOnU0fFhGVG5DcrqqP4Qa4GIGpClThuxSQnyY
         w4J7JZ9p8skHojBbAfajfvPqlPgso1xQSaNRE2E3Us9Y0G+gXrxLNmCywucaDdDQbHql
         VqcRU4a1pj42em8kC14rvkv2uoKmCunWLipwN6URRcgDA7YkGavx5bTSHb6ypvjXIdOz
         tgyAhk69wbEy2NgGAn9uOov7Zc0amhvCQ9K80aDXK3+1I4ZwarffqgeUP+eGXVrCbPyq
         IKrg==
X-Forwarded-Encrypted: i=1; AL+hErGat5V2RR8wyc09mXBlTVWhZAJh0TSRLU2uZFpOmVfLeJpeAwRqM+6Fivszk14Fx3lqdNaHgb6D0pEABQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+PXccf+eMgavBPQT/88Pud6HaZAuI/eDV99SlU43Joy7n2BZ5F
	IBgBFovhoB2lwGxWPzogl7Z/EEWh4Mzcw2SU9fqMpTFXcjZnSWF13Bew
X-Gm-Gg: AYBFou1RqzwTjG08xdpAJSy4ruIcv+dYk/a44NIx5x08Sn8c6+zG+qoryUM6zdVQv2K
	BTzvwRdYfjlWBaqmboEa7TEqhYPHE80RwJOYMC4ZUD7r/n9Dahlyg/SenG+mzD8Y7pizmpsjNBt
	wABiufMuBNRFnE9Mlsedsjcx3bktYVWYxcbl/mN3fney04KqGW4azSeuOf7aRu6pRTmITx6+TEJ
	G60RFFPkXxYCmB8QYWgZ2PJDItFLZUrBlOVQ49rVi6ekd++gkSmEdRxGiHkOln9nFB3MrxyZgJn
	YZGbnqc7FIujYArWeNpZoeyWd7xAqWfDelYz6lXfNvUJOwX29DYpELxwhDM0HHrf+/kFPAhT0za
	GSjnXpHaF0hwNrJVQS3xXHsfZJEpMVPhuSDaFz+TI0rC5+n2SEaaM1mjhuVQYU8V3VfiexYYXzQ
	Rw4HTZgB9UbSu4v5Thq4jYKfdXix/nL1AmL+lYY8Gtx399HV6sR9nSK1NpQ7LxdSzzO1bMixYnM
	2BGLzsPurK498jW082d9VcMJIxidUKFwvpgl5IJjenS4KJFl4vzCX+9Lk3S7Qh2CztThZ+0DO3h
	QuAumskOwwXjV7BcABziMSbG5neGRkD3G1N3iGhQbEQTvw68ntjiIbfu7Hn92DxtfQn3G9N2ejW
	LJwkKUYMxDJy136sKL5Fekv1BAewDIVeqBfjyas7U7ahsA3w1qoG0/uC8y3SRZpJDo9ZoumXEL3
	149fzXISABbp99i7ohOkT7+D2hTRQ2G1mVZBpovSOz9uJFy1ejasABFda83RbCktzE83WN+7gwc
	+fcdJNP1SpuQgmQ6Y0Vc9WJ707HjEAaYpPK5IM/H+ODSV07VA9gH+hc3qA=
X-Received: by 2002:a05:600c:620a:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb69912526mr176343095e9.22.1794933342249;
        Tue, 17 Nov 2026 08:35:42 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm28919970f8f.12.2026.11.17.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:35:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject:
 Re: [PATCH RESEND] drm/sun4i: report coverage pixel blending for
 alpha-capable planes
Date: Tue, 17 Nov 2026 17:35:40 +0100
Message-ID: <VyjYt3XHQ3e42-zx5UUDfg@gmail.com>
In-Reply-To: <20261117091932.12063-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 10:19:32 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
> per plane that exposes a pixel format with an alpha channel but has no
> blend mode property:
>=20
>   sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
>   alpha exposed but blend mode not setup. Please fix.
>=20
> The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
> to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
> BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
> DRM "coverage" blending equation.
>=20
> Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
> an alpha format (UI always, VI on DE3 and later). This matches the
> existing register programming, keeps userspace behaviour unchanged and
> satisfies the new validation. Premultiplied blending would require
> driving BLEND_PREMULTIPLY and is left as a follow-up.

The subject says drm/sun4i, but the DE1 backend planes (sun4i_layer.c)
also expose ARGB8888/ARGB4444/ARGB1555 without a blend mode property, so
A10/A20/A31/A33 still trigger the warning. Either handle them in a separate
patch or say in the commit message that this one only covers the DE2+
mixer.

>=20
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")

This is incorrect. That patch only added general check. Drop the tag.

> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 7d894e1eb..ef059ac47 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct d=
rm_device *drm,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	/*
> +	 * The mixer blends the layer using its own alpha channel with the
> +	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
> +	 * which is the DRM "coverage" equation. Report it so that the blend
> +	 * mode validation in drm_mode_config_validate() is satisfied.
> +	 */

Above comment doesn't add much value.

> +	ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +						   BIT(DRM_MODE_BLEND_COVERAGE));
> +	if (ret) {
> +		dev_err(drm->dev, "Couldn't add blend mode property\n");
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 92dd5a97f..b6771576b 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct d=
rm_device *drm,
>  		}
>  	}
> =20
> +	/*
> +	 * Only DE3 and later expose pixel formats with an alpha channel, and
> +	 * the mixer blends them with straight alpha (coverage), same as the UI
> +	 * layer.
> +	 */

And neither this.

Best regards,
Jernej

> +	if (layer->cfg->de_type >=3D SUN8I_MIXER_DE3) {
> +		ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +							   BIT(DRM_MODE_BLEND_COVERAGE));
> +		if (ret) {
> +			dev_err(drm->dev, "Couldn't add blend mode property\n");
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20




