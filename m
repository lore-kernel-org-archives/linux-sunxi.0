Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAA3A8756
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826550; cv=none; b=MqSoU1i5nvYbojYF8enlV1PANuDSKT6XDXj5nmRHf0BCee28w15B9VoYaosP0TWI6rW2jsMrxmHSjy028GReVboV/KkCNTZsdfzJJ29NdE8qRZoNflMPkHfar2vr/WgPtHBoftP0AHELvWE6zuw9I5wIne1AiDLhlnQbDuw1l/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826550; c=relaxed/simple;
	bh=NNL2xgUJCPM81B+UYpkjib8Cjd06OgJVpxhiciQMxo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVbzZRRBiN5nNDTPqK6q+R0MahvF3oO3r7d+S9lI9gYHL2zpNTCvPcRrQA+LbZhTKA7xc5bpARiRTwT/N5TQ0YPbGPy7/3AxEQTrWX2Ke6uBMgpVD07/RmlM2vwDtfxOmSEKJrMV06YEZkPIzgp1iWArj3BhabNLwvgxmQqDGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFt9s5U9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFt9s5U9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AB2C4AF09
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773826550;
	bh=NNL2xgUJCPM81B+UYpkjib8Cjd06OgJVpxhiciQMxo4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=TFt9s5U9RL0FcxVNls0KlnRrgrlHTyP6WbwAinOm/ERWY3mJGthOeJVm7ADc673y9
	 THwq1X9VkBBVfbfXIvSTTJ4LVxqNxBiwCYF6VhiFYP31JGBNVne8Pvly4mJRFRJOIx
	 SERFuWsFOacNy47KPA7/spwnt+Mg3Ov6wZKu+wkJzl/AFQsEHeYgBhkc4sh60ZyMpt
	 rdV4k6VG/ieYleYKHrsjFw3dg9tdQdcliCX03RVEq9G3/dG4QDMvaFdM0vX9BF2myK
	 o3WXZJ21LKhLgD7Sa+UvwlXuZ3mrEqeumm4UmWCeiNZPW8S67r+CTEdBo8OgHvKpAf
	 /b31jJNKWv1lQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso6422079e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Mar 2026 02:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6QoUlI+RkB+2UFm8h3dWRBI2rK8m0f433PixWT/f3VQqKKP4skuDq1VczUMJ/IIqZZWnsAS107esq/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qhpjANCsZqnE5wT8JckRZrXR/9N0n4Qj+sHaCau+NGxy00SY
	vXYJ97PG7izTqPV2ltw7qLcA1Chvq5IIji+A6BOO7lBXd2N1aUuphiYZ0KGtepiby3pmTUL5eo8
	7MXGSwhfZHaV2dgbUa67s6ovwWSXPADE=
X-Received: by 2002:a05:6512:4385:b0:5a2:7a31:9194 with SMTP id
 2adb3069b0e04-5a27a319417mr807672e87.19.1773826548295; Wed, 18 Mar 2026
 02:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309165635.1138413-1-wens@kernel.org>
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Mar 2026 17:35:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
X-Gm-Features: AaiRm51bZESMFhkKeSPe84bj2pH_AC1xNkhL9Br1ZIQosPwlFSutjUaZxouPc_E
Message-ID: <CAGb2v67sA48gfecLKiGozULmTo45hXF25n+2+nAHVFY_QEL24w@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get
 display memory
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 10, 2026 at 12:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
>
> This patch uses this helper to replace our own open coded version of the
> same function.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
>  2 files changed, 4 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f08f6da55dd0..72c92203ae63 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct sun=
8i_layer *layer,
>  {
>         struct drm_plane_state *state =3D plane->state;
>         struct drm_framebuffer *fb =3D state->fb;
> -       struct drm_gem_dma_object *gem;
>         dma_addr_t dma_addr;
>         u32 ch_base;
> -       int bpp;
>
>         ch_base =3D sun8i_channel_base(layer);
>
> -       /* Get the physical address of the buffer in memory */
> -       gem =3D drm_fb_dma_get_gem_obj(fb, 0);
> -
> -       DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
> -
> -       /* Compute the start of the displayed memory */
> -       bpp =3D fb->format->cpp[0];
> -       dma_addr =3D gem->dma_addr + fb->offsets[0];
> -
> -       /* Fixup framebuffer address for src coordinates */
> -       dma_addr +=3D (state->src.x1 >> 16) * bpp;
> -       dma_addr +=3D (state->src.y1 >> 16) * fb->pitches[0];
> +       /* Get the start of the displayed memory */
> +       dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);

I just realized while reading more code that there's a subtle difference
here.

The original code used state->src.x1, which is the "clipped" coordinates,
while drm_fb_dma_get_gem_addr() uses state->src_x, which is the original
coordinates.

Jernej, do you know which one the driver is supposed to use? Or maybe
it doesn't matter?


ChenYu
