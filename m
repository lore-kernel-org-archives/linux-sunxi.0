Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624369;
	b=tEklOPEGLWQu5FNnLkI8ctOcnzoKyhCsAkN0OxtN7fzjGLMgWrPpCkRytFq4tUkAmgYk
	 bxB1SUhRmyBATgTVQrct7t+XWZKOd4c4GnlWTkefY7G8HUj1t6RH8CMhseKt/mvvplOcL
	 s9ppWvKAiwVZjdQyZoP5ZIyGcObVSr4UZcGJUdy5qvf9dhCLCL6tnNuyOYhA44H75lRB1
	 0SaTXhr6pYXm/aMbN0dz54DuQV6zpyqIx8T2bHrNOwVd/dOGqsHNE5ZR5jRsVmt3MnNGQ
	 34OlvmmKoa8ssmAuV0fGNqKxm8eGVUkARvxSD0Cx/1nhmyV9spmMXLa7ank3/+WarLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
	b=H/h/JQp+APhsNFVbT5xmlURQVKILjWHinvib5wQFq+ZNralpjj4VC8a7pukAw+Uk/5s1
	 D/I4BnCn+t9dE3iUISLLe3CCPJA/06jG0CWyILCR+WeapiPqjwpjz79BZGLJEtoFXhrlr
	 M9KysRhwLsV+mJPHArJ69bF8ARWqS9VF7Zk5OJA1w8YenCBmakZJzArwydw/h0NQ5hcRp
	 xkgdZOG2+UsAVldKw+XLA0rTzu0lYXYHAFFhiWj37UDgDm+VzB2ewpzL3j4fQVtsMrTPv
	 KgVhjLo7G3zOUtvsdMHJXp8Zz7FhGqDZtcqZKFbwf1kK8IgQKRNjzlXztn+p3JYCqwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRsrn693;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F2606A33C
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48F2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRsrn693
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so51075055e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624367; x=1796229167; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=vRsrn69325843ApKLNF0OSjywFs3Xl5IXyw3SuQfgoBMgkvm+A1yV07CS7X9LbmMEn
         bkQ0g5KmUZ/H/a34XG1nmzlnBfpQcB577g502xzJFAoXmy2fWl18hA5PUDgidR57hb+z
         +iERTTgtlvHjtgZOdGtv9LW8Pxj/DC7pAlgXDadcuscdOz5n2buAvvvG3z63YnkgykxF
         hn1TnZyDxVahHaML5Wbo/3LSZoD2rloGPJoVdCNNL6WQhrbpuKmteyvDvBxx0GEC4pgv
         PLYXOiNJ4kd9VEd9g0ToEXh1EuMjNSXG5gMNLYeJ6vK1uX0u3aCow/eEF6hccestk7sW
         rTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624367; x=1796229167;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=wojUPvCI+WNlzB2yVnruYMOBUTgYudaLJOV560wOjB9e0wjQaqJa5AMM62Zlr+yGBO
         AV7hiobDt6P7kOIVZE8eH3L3kFFiff03dLQz3iiJulK0WyeQZjkG7WDOyvqx+HNenEJn
         U0Mr+Ywql5CWi2DUriwqTR7Gy2neua4mgLTiZuHsKg8oDF4XPnr8VoPwKojbG/9bRkYg
         YHAONx9yYYkMuBaryGNNw0LDDAN1IP+n45vHKq3meRBdu+hD1SkP52PIImVQbaQwuUcR
         rEb9TV//mGLYUhA9LNTTX9LvGYAYVppKjUydlYD7Usiw7UO+Qx63JYzWYriJFYG9E027
         kCrg==
X-Forwarded-Encrypted: i=1; AL+hErHv210JCkwP1F0gEYdSM6v2X56UtzhzTFGfe/Td8KLYM+DaAlRll5TEY8neJdcPPgRtQ0TER7oCLfQ7pQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+eXcPtTCYsrkrHWnXUExQ212dFVbAAIy5gn3RlMr45nzSCDfA2
	jCp3eAJj2ke9KY/DMI/WYeiUfZO1Pw91XZEuD5QGDhrcUmyKG4JDOWUN
X-Gm-Gg: AZFdTZcGTuWkM743wrBRp0jjcGir24wHIIskuB/alp144XiVc7zXoN94luJVRR7V2jL
	AO0w+ojZi+7xgPyA2vZIKGhGqbQH/vFmQZjyKP1Jt8R/JsDGl7fOZwNso+fG0at2vBo66r/bjxo
	gbLHV1aYwdeD0PSK50f9LHpZvPOE9qA125Jntm7Q14ix9C+B3eHoR8QzEO7Tr0GuBL2naOiBazD
	jgt69XQDh5zIKFp71F1PCkxLjS8yQXz4rkgcpiaX+PpKVNMH1VKu1K/jq2L0IISflfRWFK3eZSu
	CJQgMQK8zcas+EPGKl7Yu9wqTD+SGGxL5Gv3TYZREzezEkvbzOwMK3P6wqzyHCbovedtofzMI71
	Fw1fegXA/GnuA7i6Ol2cre/+I3qgLxokmHJitYfrP8slExPldxDHAern89Kdf43YMrDTaNZTqCT
	RZe4l2G9ffqNHEnPWWT7KJFiz/mfPN2pw1PHqNKrQT1Jgij7rihBWCVfCgu9+e2gTB6KFQjTy0B
	9opShg9jD4EP8ZbhTWc6V93p+1qA+FHKL2zPHAKw727ewbWM/U5CB55LkYGeLhqXQsuuHdRQcvf
	f9+qCvm8jHDGiekgQDMiorpQas1IJY1A12KP8q7O10sIDBey/HN3gNLHhCRYNQ41YAkTkmzfqa4
	uQdllPdbIy7Qs561EksBd99srHKtI3Q2T3cWaHn73/TfgRm4bIQ9gcalep2s2yLf45lCeDIcGda
	psL1wqgw+oFeGGXfl8ti9ldu1vhqZRcc9DREnv7K/gfylSVkWaH2FcQZtDXS2d1OVCQmUfg6+gg
	VzhxPfemzhpobo8E9OlOsQeZyD/Kn+VIgdGMuBzwmz8hq8MxYWc2o+2U7jrPJqAiXw9yyoVordV
	4RvlhDK/
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr381679255e9.19.1795624366963;
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm560493135e9.8.2026.11.25.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped
 offsets
Date: Wed, 25 Nov 2026 17:32:45 +0100
Message-ID: <sBipOLw6T_aZ1e-H2zFl3g@gmail.com>
In-Reply-To: <20261124074041.115251-4-wenst@chromium.org>
References:
 <20261124074041.115251-1-wenst@chromium.org>
 <20261124074041.115251-4-wenst@chromium.org>
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

Dne torek, 24. november 2026 ob 08:39:31 Srednjeevropski standardni =C4=8Da=
s je Chen-Yu Tsai napisal(a):
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>=20
> This turned out to be wrong in a couple ways. The hardware is programmed
> with clipped dimensions, so it needs the buffer address to start at the
> clipped boundary. Moving to the helper negated the clipping. Also, when
> clipping on the left, the buffer address needs to start at the first
> pixel in the sub-sampling group even for the luma plane. The hardware
> handles the interpolation internally.
>=20
> Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
> buffer address starting at the clipped boundary. Calculate the intra-group
> offset and adjust the luma plane buffer address so that it points to the
> start of the sub-sampling group.
>=20
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_ad=
dr()
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f9c7f28f9fa2..67cce1b0e70f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i=
_layer *layer,
>  	ch_base =3D sun8i_channel_base(layer);
> =20
>  	/* Get the start of the displayed memory */
> -	dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
> +	dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
> =20
>  	/* Set the line width */
>  	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 4d3fc03f9877..b6796416d550 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
> =20
>  	for (i =3D 0; i < format->num_planes; i++) {
>  		/* Get the start of the displayed memory */
> -		dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +		dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, i);
> +
> +		/*
> +		 * The mixer can handle odd offsets into sub-sampled YUV
> +		 * planes, but needs the address of the first pixel in each
> +		 * sub-sampled block. Adjust the luma buffer address backwards.
> +		 */
> +		if (i =3D=3D 0) {
> +			u32 x_diff, y_diff;
> +
> +			x_diff =3D (state->src.x1 >> 16) & (format->hsub - 1);
> +			y_diff =3D (state->src.y1 >> 16) & (format->vsub - 1);
> +			dma_addr -=3D y_diff * fb->pitches[i];
> +			dma_addr -=3D x_diff * format->cpp[i];
> +		}


This could be done differently.

Before for loop (done only once):
src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

Inside for loop:
gem =3D drm_fb_dma_get_gem_obj(fb, i);
dma_addr =3D gem->dma_addr + drm_framebuffer_get_block_offset(fb, i, src_x,=
 src_y);

But it works in any case, so:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  		/* Set the line width */
>  		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>=20




