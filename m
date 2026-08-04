Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6B541DE06
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863097; cv=none; b=qZFlFTfIMNp7rJ25P8173+r8egIcvn2KeBvIOdESLVcvlIU7kcJq0YFHrh8XZ1Elu2CFV3RbDcwssn+KvgOwi6UoJq/ijg5D2VO5F/cFZcA/aiv1cPDvIjSuq77loz5XmvlRGpxehBhRXv9qWnBpX9tWuc4J472mo5SXkQIBTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863097; c=relaxed/simple;
	bh=d30zVtGCbkqf84iuqOxXAT5Mnv/na0VTtuO+KQoBuTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2p3zhAPM17XyFl93/X7Wlsy77hbeqZ9SBob320iPz+IC8V+bqlH974dJBIlt/kE2F4mCn8mQBq1NYYnowvbhfmZnKExCArL5nt2sYwgojx+xJu7KWq5/WV51rKhwZpz+1cYScUwl9BjNS0ygocPHriPlnJgfWUPkBt3tPox2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg7OoWzi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg7OoWzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C661F00A3D
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863064;
	bh=Mdy5BwKP2BUlXSPT818fsnoO/+gx2VkeYa1S7BhDg0A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=bg7OoWziEtDRjqC4NPN8cKVmWJ+CKhiKvG1BGvdcP8l6UqkD9OeZLO5Wey3SL5Hk4
	 jz7H4wWr/Pp3bw1Tcexu2Pz4RS4LQwY0H0I4bObe/+iZjVyg7eiADFsDZg62Q5Dsqn
	 fqBAOobykxBmMQtpohVjEBoRFR0ZdM0zMByMDjAqEE1pLGJbqDrnxIgET4X+8/neHe
	 VAg+2kLTMbXE2WuqcFliF1HZ+35BK5IN+H0AvEDSXY65anSU2FhsmKeUTqOLfSZf3w
	 RKPdKKSySk1OpPWPT7f1V3c0SwPypmfVC96Swv0o77F4kicbFogvzM7/BH7MUSXNE8
	 dIIqekk+50UQQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c95395230so846421fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 10:04:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpk5aeUiFwWoUvTdZWWES/timZUYNbHuRAaCI+ILKpxG3jvN8SxMjGhY8hwbZPGrfQfiqC2eSEaDquzwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFo/MBdYe781qFmsyFEaTB1D6EiTzutizwIZQ9/+fTWyTZQ9Z7
	05XdMjdBYeo/DT/OZOfL3qzUoZmLgkIrwQCPy31s1VdLMs+8CdzrhIlHVThhntj61Ky7jfNOCO/
	LVfqt/1e/m2RicbJuscS65R1luqIABFA=
X-Received: by 2002:a05:651c:b21:b0:39e:b257:e878 with SMTP id
 38308e7fff4ca-39fbae384e5mr15601fa.8.1785863062769; Tue, 04 Aug 2026 10:04:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
 <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com> <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
In-Reply-To: <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Aug 2026 01:04:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
X-Gm-Features: AUfX_mxqXe7yankErUPBEOhM0CS9DLRlpwPXjUeNfllWGs8vBgMDWFkZlhW-0lE
Message-ID: <CAGb2v67mTzB+R7XDasSNhpmdzu5ikdoO0QwiHR432pdt_v7A_Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 12:25=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 4. avgust 2026 ob 13:14:38 Srednjeevropski poletni =C4=8Das je=
 Chen-Yu Tsai napisal(a):
> > On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> > >
> > > On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabe=
c@gmail.com> wrote:
> > > >
> > > > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers=
:
> > > > Use drm_fb_dma_get_gem_addr() to get display memory").
> > > >
> > > > Chroma must start at the beginning of a subsampling block, for exam=
ple
> > > > chroma start address for NV12 must be aligned to 2 pixels.
> > > > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordina=
tes
> > > > and chroma by the coordinates divided by the subsampling factor, so=
 for
> > > > odd offsets both planes no longer describe the same pixel, which th=
e
> > > > Display Engine scaler can't handle.
> > > >
> > > > Align source coordinates down for all planes instead. Remaining shi=
ft
> > > > of one pixel is already compensated with scaler phase shift in
> > > > sun8i_vi_layer_update_coord().
> > >
> > > Well I think this applies to the format in general, and probably shou=
ld
> > > be fixed in drm_fb_dma_get_gem_addr() instead?
> > >
> > > > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_add=
r() to get display memory")
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> > > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/d=
rm/sun4i/sun8i_vi_layer.c
> > > > index 09f668c8af24..ad036cb9d88e 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(stru=
ct sun8i_layer *layer,
> > > >         struct drm_plane_state *state =3D plane->state;
> > > >         struct drm_framebuffer *fb =3D state->fb;
> > > >         const struct drm_format_info *format =3D fb->format;
> > > > +       struct drm_gem_dma_object *gem;
> > > > +       u32 dx, dy, src_x, src_y;
> > > >         dma_addr_t dma_addr;
> > > >         u32 ch_base;
> > > >         int i;
> > > >
> > > >         ch_base =3D sun8i_channel_base(layer);
> > > >
> > > > +       /* Adjust x and y to be divisible by subsampling factor */
> > > > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > > > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
> > >
> > > AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> > > is the masking here, i.e. round_down().
> > >
> > > > +
> > > >         for (i =3D 0; i < format->num_planes; i++) {
> > > > -               /* Get the start of the displayed memory */
> > > > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> > > > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > > > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > > > +
> > > > +               dx =3D src_x;
> > > > +               dy =3D src_y;
> > > > +               if (i > 0) {
> > > > +                       dx /=3D format->hsub;
> > > > +                       dy /=3D format->vsub;
> > > > +               }
> > > > +
> > > > +               dma_addr +=3D dx * format->cpp[i];
> > > > +               dma_addr +=3D dy * fb->pitches[i];
> > >
> > >
> > > Where as the helper has (or used to have before the blocksize stuff):
> > >
> > >     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->form=
at->hsub;
> > >     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->form=
at->vsub;
> > >
> > > Am I missing something?
> >
> > After some headbanging on my end I see that the offset for the Y plane
> > needs to be rounded down.
> >
> > But instead of reverting the whole thing and open-coding the helper
> > again, could you adjust the address returned by the helper for odd
> > offsets?
>
> Yes, that's also an option. I'll do it in v2.
>
> >
> > And just a heads up, this also needs a clipped version of
> > drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
> > clipped dimensions. I am currently working on this part.
>
> Can you explain a bit more? I don't see why it needs any adjustement.

My understanding is that drm_atomic_helper_check_plane_state() calculates
the "clipped" rectangles for the plane using values from userspace in
state->src_[xywh] and state->crtc_[xywh] and puts them in state->src
and state->dst, respectively. If the overlay is moved partially outside
the screen, the overlay is "clipped".


Say we have a screen of 1920x1080, with an overlay buffer that is 1280x720.
Say state->src_x and state->src_y are (-50, 0), given by userspace.
drm_atomic_helper_check_plane_state() will calculate the clipped & scaled
rectangles and put them in state->src. This latter rectangle is what is
used sun8i_ui_layer_update_coord().

So we would have:

    (src_x, src_y) =3D (-50, 0), (src_w, src_h) =3D (1280, 720)

The clipped numbers are

    (src.x1, src.y1) =3D (0, 0), (src.x2, src.y2) =3D (1230, 720)

src, not src_[xywh], is what sun8i layers uses to program the coordinates,
and prior to the drm_fb_dma_get_gem_addr() conversion, also to calculate
the buffer start address. drm_fb_dma_get_gem_addr() however uses src_[xy]
to calculate the address.


Essentially, when overlaying a clipped plane, the start address needs to
be adjusted if the source (top left) offset is outside the screen.
clipping =3D=3D automatic cropping to fit the screen.

I don't know if userspace applications routinely do this, but I think this
needs to be restored to the prior behavior.


ChenYu
