Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C139E19C
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842095; cv=none; b=VDE5NRvA+ZdwXh4fm1QpmFCN6RHJrtiJHHYR8FDKHnsH1UBhAq+pRa6Ct9irnJZGL2Psj/SFPJ874APJwVARykWd2f3cSr+eRMRIpKzs5RImI9hbBAjK8mFyTpUKNGvehXI7Jfu9kryepP0Kz7XX6oQthiVIEmJoKnhtVDHfaZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842095; c=relaxed/simple;
	bh=k1oOH+EElIafdsZh0N1R4bLKvqQXdLJrziHBgRX2pG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwZi2mrBPyBNv3wB8HTX0e/ig+6DG9clIq13iRCdxRxx040/9mvoWrwSGY3yJ+WZOhBIt7IxWXl6NmtlabThLh6g9iLP+ocCJMf0KqK/PRbywW7B0CYOTQIFwLt2vWUTs/9lfWQbiYvsHA27QfY/R64SGtcmlOIZvTfsIONOkgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I998SUnu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I998SUnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B641F000E9
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842093;
	bh=fgnZvb3RUMxqApqKxj1p/2JMp+8yTlhg+fzaKOMnIEE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=I998SUnuog4UbpELB77UlYJh7XOzvtrOCCd6OX3qMh3k9/ipW/ilAtvvVSSV9oYK+
	 fese/7loH9nawu+3UQFk3jzsJ+NU8iOuGSHDyIGJNLvhiET1r3X1SWCkMZdnYAIdz3
	 OtDEVbDVq0cJNfc43OBN3KanYjO3Is9RSnCWRjiIROg58/dwrsy2NJsXtX0ukStfCF
	 3paYy5Ij43+3XxUdbuy4rBVH5NcxGrFcETPPYJUJ0tWoePzVMA1pZY5Ldz4WSNqo8l
	 jzpQkm+ArZQiiAjQ6OzRgaFyB/Piy3LL3yKbvHeOxQskh+mE1VON8J38KQLfR505Ms
	 Ro9S2FWcooO6w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7fd45465so38012311fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 04:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYLsMymjTVCKhMka5j9a9GQvJrzZYPLOUpqiEh1KEQ6eRD+w0/QCAsNNmXl7Qbaq5NYiWkGt3wTC3J5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm4gTpWrSsubRxKbbbat6tt5Rr3xg8NMrzxi1c+3/QJcXgJ9qh
	bqXpTxU/kBbjEYIJj/sxPYJGcDxNbBh5Q6+tNzluj0d1kRuMjON+8bmsVvEuJGNEC+a8dYmiXSx
	BKuMEyCfJR2nVZNwtxi3O6iwLJOhIZns=
X-Received: by 2002:a05:651c:1607:b0:38d:e220:8dc2 with SMTP id
 38308e7fff4ca-39f862d6e6dmr25991121fa.20.1785842092263; Tue, 04 Aug 2026
 04:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com>
 <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
In-Reply-To: <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 19:14:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
X-Gm-Features: AUfX_mx9hzvoUh1G84nXavbQjcP_NwL2YKj3AIrXlYUyRtxAKsoU5YliBwxz1Dg
Message-ID: <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
> > Use drm_fb_dma_get_gem_addr() to get display memory").
> >
> > Chroma must start at the beginning of a subsampling block, for example
> > chroma start address for NV12 must be aligned to 2 pixels.
> > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
> > and chroma by the coordinates divided by the subsampling factor, so for
> > odd offsets both planes no longer describe the same pixel, which the
> > Display Engine scaler can't handle.
> >
> > Align source coordinates down for all planes instead. Remaining shift
> > of one pixel is already compensated with scaler phase shift in
> > sun8i_vi_layer_update_coord().
>
> Well I think this applies to the format in general, and probably should
> be fixed in drm_fb_dma_get_gem_addr() instead?
>
> > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() =
to get display memory")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_vi_layer.c
> > index 09f668c8af24..ad036cb9d88e 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct s=
un8i_layer *layer,
> >         struct drm_plane_state *state =3D plane->state;
> >         struct drm_framebuffer *fb =3D state->fb;
> >         const struct drm_format_info *format =3D fb->format;
> > +       struct drm_gem_dma_object *gem;
> > +       u32 dx, dy, src_x, src_y;
> >         dma_addr_t dma_addr;
> >         u32 ch_base;
> >         int i;
> >
> >         ch_base =3D sun8i_channel_base(layer);
> >
> > +       /* Adjust x and y to be divisible by subsampling factor */
> > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
>
> AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> is the masking here, i.e. round_down().
>
> > +
> >         for (i =3D 0; i < format->num_planes; i++) {
> > -               /* Get the start of the displayed memory */
> > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > +
> > +               dx =3D src_x;
> > +               dy =3D src_y;
> > +               if (i > 0) {
> > +                       dx /=3D format->hsub;
> > +                       dy /=3D format->vsub;
> > +               }
> > +
> > +               dma_addr +=3D dx * format->cpp[i];
> > +               dma_addr +=3D dy * fb->pitches[i];
>
>
> Where as the helper has (or used to have before the blocksize stuff):
>
>     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->format->=
hsub;
>     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->format->=
vsub;
>
> Am I missing something?

After some headbanging on my end I see that the offset for the Y plane
needs to be rounded down.

But instead of reverting the whole thing and open-coding the helper
again, could you adjust the address returned by the helper for odd
offsets?

And just a heads up, this also needs a clipped version of
drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
clipped dimensions. I am currently working on this part.


ChenYu

> >
> >                 /* Set the line width */
> >                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> > --
> > 2.43.0
> >
