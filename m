Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D02C3266
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777925; cv=none; b=URRD4OtJnIJB8gZ7e1RZJco5huGX1G4JXYcqq+ScmpiyoqdjosJPelO2peWQurNXdQ4YoV7sljfuJAoOumPnTZ5Y3tCTVSiXNUKku7sfvUqV/cie8HihrgJZ5I3sOrG0OZsOhL5RGI7nsuaFNtS37aH7bwuigHgtrBqlH9KxbhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777925; c=relaxed/simple;
	bh=NJHZqG06k30qcXscxD9BSpN/t5zkGq12GueI8dpxpKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXFVp+hTN1WUts/mYwrWTRTx8G8utMGlfkjr4mscIvtYTrb87uRMwrx5Rugebkdh5jbLUs0UprAsbFnFun4JYn8sx8EpeeR/5PwMsyeSenrsyrQIFTqNoG4VC4b2vxJyhrG+FaoXub6ALd2IBn4eUOvOMvXsr3C5GJc1Uqw8s5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFTEUWkm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFTEUWkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4405A1F00A3D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777924;
	bh=f8Wl8glcfw9dwbeP1JywUt3GNYgmfkhCQveycZVpS4Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=GFTEUWkmu2NCm4po3VjBMuGvVHYDGUBNmMaXilf0mY7UiI11PCXNoSowwKYofYwuG
	 a94uOifcgZdGu4a8vv7o/Cl86Eiyf+4BdVRXzdwratD0+v1CZ8dDIIZmmYPUiHlXCA
	 rpXFLEDhUdpVbg9W6F2dyCd7bbnM4dYvkIeSulNt4QJEPd+U92q/2f8fwiRHpaAfU+
	 j/NbMgtA5vXrIuVdGBYH4Me0aHnfGqmk6QmNluqfzByvNi42EN8SqYej3sR6iTBE1S
	 f6OoD5z62DgI7yTUygaubHXGcNTf9W0u8oYL5TdZiwbfOE6KJZf4rsJeudLtWCVPbm
	 KAWasP5FyLHkw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c83acb86eso32724011fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzJuC8dCGDmaTxPdFYDm5pdhOwBa0tzkbw/uQ0WYBk0NS/BetQtf6IRhqC/7YKNuu3dDMep1Fsew/xvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqF/SHjMokLnYcX66zHEoOfqrKiBOgwPdUDoYzo/YqUlHGI45i
	/vAo/d8fPHv8votf9qOOAagvxocCVJMFI/xNUPf7Je6VzZ5QXWuenk7c7MSkiJJqn2mG1S4sYCJ
	n18beaowLTkRWJIeL10IAzATDcAFaLOg=
X-Received: by 2002:a2e:bc23:0:b0:39c:99e9:da37 with SMTP id
 38308e7fff4ca-39f86105917mr20611141fa.1.1785777922694; Mon, 03 Aug 2026
 10:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
X-Gm-Features: AUfX_my_BxERgV_M62Gj1-mbWsAsqDTo5FE1B6VdIoWAAMqmFyEPjHTvoGE-COI
Message-ID: <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
> Use drm_fb_dma_get_gem_addr() to get display memory").
>
> Chroma must start at the beginning of a subsampling block, for example
> chroma start address for NV12 must be aligned to 2 pixels.
> drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
> and chroma by the coordinates divided by the subsampling factor, so for
> odd offsets both planes no longer describe the same pixel, which the
> Display Engine scaler can't handle.
>
> Align source coordinates down for all planes instead. Remaining shift
> of one pixel is already compensated with scaler phase shift in
> sun8i_vi_layer_update_coord().

Well I think this applies to the format in general, and probably should
be fixed in drm_fb_dma_get_gem_addr() instead?

> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 09f668c8af24..ad036cb9d88e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct sun=
8i_layer *layer,
>         struct drm_plane_state *state =3D plane->state;
>         struct drm_framebuffer *fb =3D state->fb;
>         const struct drm_format_info *format =3D fb->format;
> +       struct drm_gem_dma_object *gem;
> +       u32 dx, dy, src_x, src_y;
>         dma_addr_t dma_addr;
>         u32 ch_base;
>         int i;
>
>         ch_base =3D sun8i_channel_base(layer);
>
> +       /* Adjust x and y to be divisible by subsampling factor */
> +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
is the masking here, i.e. round_down().

> +
>         for (i =3D 0; i < format->num_planes; i++) {
> -               /* Get the start of the displayed memory */
> -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> +
> +               dx =3D src_x;
> +               dy =3D src_y;
> +               if (i > 0) {
> +                       dx /=3D format->hsub;
> +                       dy /=3D format->vsub;
> +               }
> +
> +               dma_addr +=3D dx * format->cpp[i];
> +               dma_addr +=3D dy * fb->pitches[i];


Where as the helper has (or used to have before the blocksize stuff):

    paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->format->hs=
ub;
    paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->format->vs=
ub;

Am I missing something?


ChenYu

>
>                 /* Set the line width */
>                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> --
> 2.43.0
>
