Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60874756B9
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860720; cv=none; b=VbTUSsU2sRrwJW4i2VlPhEwBmTJ5jlNh16/tTXvOiUnEszKncULbrsrYrZcJr3ttXvo/9MP6tOuSoL67OHyFbORDLHOesqXWSX639a0Q/5YLlsok5dYIXqr7R8z/8/rXgyQev0zbhb6NTeXwkWKmDARgIh7axYTWnLGZstTcGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860720; c=relaxed/simple;
	bh=NAlE9xuWd+CbhPN4mDk9UF/4pM/OLyUdtNaqoUxbFuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/ksm8v5oNOiBrgXe6q87pcb0JmAVS4IE2Mf0SpkXDYwAu6tbtB9YUmaMgf0LWDOwcJTgedADnGL7+zYO5be6N7FOAwMyEDdTaG0VV0HICryJsu28diT+3U88ESz1CPwnbW8UhwY+XSWKu/EQFKSHCAxu9bjGUDbk+7XKl8a0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MebbBoCM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MebbBoCM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955de8797cso21449455e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785860709; x=1786465509; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gYefvAyqnzn8QAHjERbxmBW19GFjgq4+owbZqEl8b0=;
        b=MebbBoCMSh9+t33zj56NGkbsLzF/CYdA5Qp9DrXGpu1oiVdn/Wb3e4kFrEU5W4iC74
         6mI8ppfzLdHrJGQahJ1Ypsvi+IAGA/ubEtixi/fLxD6Ne5+ELoHB5PMx0rQ9tusblQST
         sfi3h55Elw01aahzlraRwMAVSQQaONRcpPfyAbTqm6wyOMkRr5IgdB9ccD3Ru1ZctFLa
         8jtcuIzaUCEFPwajJDHfuVoM6HZfI9Vlzrv06YrqXQ4TzYDMISSPhsPvgEUhl/K2xAj5
         ygmb5jU0yTHu+8LU2LzZmsBDtx3POOT1l7r7LKEjFR8NyAe7x/yhf3mAFHsDiFYkq8bp
         oeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860709; x=1786465509;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gYefvAyqnzn8QAHjERbxmBW19GFjgq4+owbZqEl8b0=;
        b=TShsF4QnsI+n8GKpkuH9GdPZfeHt01xQ9eUauDd/eQ4NBW17IStlKXpyxSQNl68zuJ
         o6sMvN3toBUI6PMqeWEigbVmIJrbVkNY2QTcOZrUT9Cw6A7qNJrRN9BfkKkQi0oSC7pj
         9Rsvl/WkvH0CW0EJT+J8haNl/1HYYhsMwhwK5AywsDCnp7uPI8bJSbo4h3kRAyaGkPm0
         ofXjW6oTvm5YTKkR63Mr1TERi1EN/TbIIA+rO5a6X8bc7ZYd6ilVHUpmj/0SLhtOoGzX
         OOknYSE+UHnaKc41MrXQn8lDxT3JtcydNuX+GcVp1c5xk81roDESs2N2UEToRqrIwv1I
         nHNA==
X-Forwarded-Encrypted: i=1; AHgh+RoqcIMHYabBh8u45LafqRlIo6QLD1JYEca1CYtqEBv99SxACLph6DShQHTztMObOoEoDdq4t+A0I30LMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSO5lk0BDEyqpdTYLMwYlw9PwGocz0H9n9klGOW9057+bI+e9t
	GUMSbYM53OSyCPD7mXYt70Hwv8P3WAczSkiDH2udM/pQBxCWHzD2dQta
X-Gm-Gg: AR+sD13yEc8awP3+wr9ZUg0gMIs5PYrv61EFP0jNotcJup4dJsNrp5iPxhZ8x8ZBDZB
	rkd8o/KYwfZzV+na0pwXWMLSvH+Gp3uTAvabpodlJn8SF5JvL8XB5zME7MAo+ZCKsGEtvK0X0+j
	yPVTYe5IG8fgiH1GwcKb4kf2A7XkxZ6g3dfm6jJgJRdrpvapjMRMuBwpM1Kj6lT/G0BOplVGvJ3
	3r1mAwk7CeovZ7iGbOuTPXE3O7ddz8UiuefVOc1q+Oea7+yEMrxofJddHDwRUnvwq1Z1BqJqCLg
	9r+JGUOLvJKtUUQnKHbkiamlplWQqd4rORwaaL6pvBKX0Mt6VwRXuWmH4qEaLPO0m6afzhz+vxO
	5Exq10BT094+2+4ll2YGeSecEgb38cGsLzvf7S0AjqPxg1xckpjR4PD3KELMOaVZgTkoPqjDFet
	xX56Sz7TEcmkk1FmMzoMDLwhQ41P7d/AX4yzS5H+EsN0uv+hpiCp00MxPx62bmUEhGCJi3pgBvV
	TMR5vqPqr+NDzWBRBS3pyxzhgXZz9MDEccPOTJhfoOscjdSsWEokojb77LQnc5prDPbOS0mhrOa
	U2m9vQ/MT0vpl+jxXfq7QP6q/l95WqdIqQi3+pnFFHHPhesMkbzp9bakHXh7Ojclh8bN/nt3wI0
	BBe/Mov3yh/9AMnK/f6+Xl6A6GbVv8X8qNdXFcFKhJUzoZR7G2eSVsbeJ37Fq70wRuHinndf/AA
	/CG4Q0jPD8M1Fymg==
X-Received: by 2002:a05:600d:8492:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-4980c64b873mr280626065e9.5.1785860708981;
        Tue, 04 Aug 2026 09:25:08 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-102-118-gprs.simobil.net. [46.122.102.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec249a5fsm897076f8f.33.2026.08.04.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 09:25:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue, 04 Aug 2026 18:25:06 +0200
Message-ID: <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
In-Reply-To:
 <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
References:
 <cover.1785772659.git.jernej.skrabec@gmail.com>
 <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
 <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. avgust 2026 ob 13:14:38 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
> >
> > On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@=
gmail.com> wrote:
> > >
> > > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
> > > Use drm_fb_dma_get_gem_addr() to get display memory").
> > >
> > > Chroma must start at the beginning of a subsampling block, for example
> > > chroma start address for NV12 must be aligned to 2 pixels.
> > > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
> > > and chroma by the coordinates divided by the subsampling factor, so f=
or
> > > odd offsets both planes no longer describe the same pixel, which the
> > > Display Engine scaler can't handle.
> > >
> > > Align source coordinates down for all planes instead. Remaining shift
> > > of one pixel is already compensated with scaler phase shift in
> > > sun8i_vi_layer_update_coord().
> >
> > Well I think this applies to the format in general, and probably should
> > be fixed in drm_fb_dma_get_gem_addr() instead?
> >
> > > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr(=
) to get display memory")
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm=
/sun4i/sun8i_vi_layer.c
> > > index 09f668c8af24..ad036cb9d88e 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct=
 sun8i_layer *layer,
> > >         struct drm_plane_state *state =3D plane->state;
> > >         struct drm_framebuffer *fb =3D state->fb;
> > >         const struct drm_format_info *format =3D fb->format;
> > > +       struct drm_gem_dma_object *gem;
> > > +       u32 dx, dy, src_x, src_y;
> > >         dma_addr_t dma_addr;
> > >         u32 ch_base;
> > >         int i;
> > >
> > >         ch_base =3D sun8i_channel_base(layer);
> > >
> > > +       /* Adjust x and y to be divisible by subsampling factor */
> > > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
> >
> > AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> > is the masking here, i.e. round_down().
> >
> > > +
> > >         for (i =3D 0; i < format->num_planes; i++) {
> > > -               /* Get the start of the displayed memory */
> > > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> > > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > > +
> > > +               dx =3D src_x;
> > > +               dy =3D src_y;
> > > +               if (i > 0) {
> > > +                       dx /=3D format->hsub;
> > > +                       dy /=3D format->vsub;
> > > +               }
> > > +
> > > +               dma_addr +=3D dx * format->cpp[i];
> > > +               dma_addr +=3D dy * fb->pitches[i];
> >
> >
> > Where as the helper has (or used to have before the blocksize stuff):
> >
> >     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->format=
=2D>hsub;
> >     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->format=
=2D>vsub;
> >
> > Am I missing something?
>=20
> After some headbanging on my end I see that the offset for the Y plane
> needs to be rounded down.
>=20
> But instead of reverting the whole thing and open-coding the helper
> again, could you adjust the address returned by the helper for odd
> offsets?

Yes, that's also an option. I'll do it in v2.

>=20
> And just a heads up, this also needs a clipped version of
> drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
> clipped dimensions. I am currently working on this part.

Can you explain a bit more? I don't see why it needs any adjustement.

Best regards,
Jernej

>=20
>=20
> ChenYu
>=20
> > >
> > >                 /* Set the line width */
> > >                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> > > --
> > > 2.43.0
> > >
>=20




