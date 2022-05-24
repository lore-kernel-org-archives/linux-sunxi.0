Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8932569
	for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 17:14:47 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b200so6549700qkc.7
        for <linux-sunxi@lists.linux.dev>; Tue, 24 May 2022 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZgnngPnnlfyfo6Aczo4Zh89klMdrQ5lxNuhBGcA4OSg=;
        b=G5zlDAnOVWzTh7aFU6m1gSecCSybkrTFwi4XWn5EzZFL5QLyoOFP5SUj9kMaYQU9lX
         TLE9JMhSg1VrYCGbdqswKSWX0eSgFmY7VOPb3P7RtKuAN5IrX40NUJSWKE2er/T4t8TX
         mC9g5S+K1p8ECaO54I9aZw4hKh0EsN7xf5nf9liXpG42zwifY8R0E8IO3Lp9+Z2EKRro
         rgjIYsX9KarBbgjLfYeJxdSUxrpHwqwUhxpxuDyf38DCmlwiutos/P7LpeE0re94MgxR
         o52RnwrtVZImkJ0HqGm+jsBoMKm1GTNtjRg0A7ZoOMwe/8Fu0iyKYobCph5LscxiwXA1
         xwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZgnngPnnlfyfo6Aczo4Zh89klMdrQ5lxNuhBGcA4OSg=;
        b=CCyvAJqHQtWZuQR/FjrNS/u07f1psarnJH7/U+Iyq6uM43KvVY4iyw8YoxXhkebyKI
         Hn9Q8maNBAGKTPD+mSUD9liXRwZwCohQ/cAqa36RsfbP/vWCWKQDMCQoZggS6y368+fZ
         rmhNI8KRf1B/gefgT+M91WB57C1yL3erTGxzPvqImobmEYZ6E7SIW0z/hlASANw1shjZ
         /eSAdQtUZCUb4jge7BCK6GQxLLluY5YBSCpJnM/9tG8FiyiCcfYvY3WpwR0WfmC7c+iU
         v3oQfQzk6LIQPERuTffA5ij8TLYjXBjt5+GxTx+QkcitoUXAX/Rhiu4Ox9tm4B2NbFbw
         1zVg==
X-Gm-Message-State: AOAM533P9nUGn09GhdNLbTfx9LigxXlS47ejYvU24DoFUzmeMJPJEZYM
	A5j5+E6Js1ObWWEQfuzEOHsZDP4EFsQuv5twYUs=
X-Google-Smtp-Source: ABdhPJz1zShGJE2bgWhoaHtcRuM6+9mGDgyNQTlMLbM25Yw+VWLSCF52H2+OzuEmmc5kDKXvXyvnl5RGuGo1/CwV6dM=
X-Received: by 2002:a05:620a:4310:b0:67b:3fc1:86eb with SMTP id
 u16-20020a05620a431000b0067b3fc186ebmr17987024qko.495.1653412486546; Tue, 24
 May 2022 10:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <CAGphcd=wTPnTqNxP+TQ8YCDsT=7EUVssAKDpG2J_G=R-7N=YKQ@mail.gmail.com>
 <2629819.mvXUDI8C0e@kista> <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
In-Reply-To: <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Tue, 24 May 2022 20:14:35 +0300
Message-ID: <CAGphcdnbAS64yUomkaAMWqStO6mO3nLq2qrOU-W99htH0_Fz-g@mail.gmail.com>
Subject: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for DE2.0/DE3.0
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, airlied@linux.ie, 
	Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, megi@xff.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

By the way, not related to this issue:

I cherry-picked
https://patchwork.kernel.org/project/dri-devel/patch/20220424162633.12369-9=
-samuel@sholland.org/
and got a blank FB console on OPI3.
Can you check it please?

Regards,
Roman



=D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 20:10, Roman Strati=
ienko <r.stratiienko@gmail.com>:
>
> Please draft a test for the zpos issue you're mentioning.
>
> It's very easy to do with kmsxx using python wrapper.
>
> Or explain steps to reproduce here, I will write it by myself.
>
> Thanks.
> Regards
> Roman
>
> =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 19:21, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko napisal(a=
):
> > > NAK for this. Further testing showed such an approach is not reliable
> > > due to .atomic_update() callback called only in case planes have some
> > > changes.
> >
> > Additionally, I think it would be better to fix underlaying zpos issue =
first
> > (attempted many times) and then worry about blending.
> >
> > Best regards,
> > Jernej
> >
> > >
> > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Roman =
Stratiienko <r.stratiienko@gmail.com>:
> > > >
> > > > Corruption happens when plane zpos is updated
> > > >
> > > > Example scenario:
> > > >
> > > > Initial frame blender state:
> > > >     PLANE_ZPOS =3D {0, 1, 2, 3}
> > > >     BLD_ROUTE  =3D {0, 1, 2, 0}
> > > >     BLD_EN     =3D {1, 1, 1, 0}
> > > >
> > > > New frame commit (Only ZPOS has been changed):
> > > >
> > > >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> > > >
> > > > Expected results after plane state update:
> > > >                 Z0 Z1 Z2 Z3
> > > >     BLD_ROUTE =3D {1, 2, 0, 0}
> > > >     BLD_EN    =3D {1, 1, 1, 0}
> > > >
> > > > What is currently happening:
> > > >
> > > > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0):
> > > >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> > > >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> > > >
> > > > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1):
> > > >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> > > >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> > > >
> > > > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2):
> > > >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> > > >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> > > >
> > > > After updating of all the planes we are ending up with BLD_EN[2]=3D=
0,
> > > > which makes this channel disabled.
> > > >
> > > > To fix this issue, clear BLEND registers before updating the planes
> > > > and do not clear the old state while processing every plane.
> > > >
> > > > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.c=
om>
> > > > ---
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
> > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 ++++------------------=
----
> > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 ++++------------------=
----
> > > >  3 files changed, 24 insertions(+), 48 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/=
sun4i/
> > sun8i_mixer.c
> > > > index f5e8aeaa3cdf..004377a000fc 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u=
32
> > *hw_format)
> > > >         return -EINVAL;
> > > >  }
> > > >
> > > > +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> > > > +                              struct drm_crtc_state *old_state)
> > > > +{
> > > > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine)=
;
> > > > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > > > +
> > > > +       regmap_write(engine->regs,
> > > > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > +                    0);
> > > > +
> > > > +       regmap_write(engine->regs,
> > > > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > +                    0);
> > > > +}
> > > > +
> > > >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> > > >  {
> > > >         DRM_DEBUG_DRIVER("Committing changes\n");
> > > > @@ -299,6 +314,7 @@ static struct drm_plane **sun8i_layers_init(str=
uct
> > drm_device *drm,
> > > >  }
> > > >
> > > >  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> > > > +       .atomic_begin   =3D sun8i_atomic_begin,
> > > >         .commit         =3D sun8i_mixer_commit,
> > > >         .layers_init    =3D sun8i_layers_init,
> > > >  };
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/d=
rm/
> > sun4i/sun8i_ui_layer.c
> > > > index 7845c2a53a7f..b294a882626a 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > @@ -24,8 +24,7 @@
> > > >  #include "sun8i_ui_scaler.h"
> > > >
> > > >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int c=
hannel,
> > > > -                                 int overlay, bool enable, unsigne=
d int
> > zpos,
> > > > -                                 unsigned int old_zpos)
> > > > +                                 int overlay, bool enable, unsigne=
d int
> > zpos)
> > > >  {
> > > >         u32 val, bld_base, ch_base;
> > > >
> > > > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct sun8i_m=
ixer
> > *mixer, int channel,
> > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> > overlay),
> > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> > > >
> > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_b=
ase),
> > > > -
> > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > -                                  0);
> > > > -
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base=
),
> > > > -
> > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > -                                  0);
> > > > -       }
> > > > -
> > > >         if (enable) {
> > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > >
> > > > @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(struct
> > drm_plane *plane,
> > > >  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
> > > >                                           struct drm_atomic_state *=
state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(pl=
ane);
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay=
,
> > false, 0,
> > > > -                             old_zpos);
> > > > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay=
,
> > false, 0);
> > > >  }
> > > >
> > > >  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > > >                                          struct drm_atomic_state *s=
tate)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct drm_plane_state *new_state =3D
> > drm_atomic_get_new_plane_state(state,
> > > >
> > plane);
> > > >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(pl=
ane);
> > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > >         if (!new_state->visible) {
> > > >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > > > -                                     layer->overlay, false, 0, old=
_zpos);
> > > > +                                     layer->overlay, false, 0);
> > > >                 return;
> > > >         }
> > > >
> > > > @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(struct
> > drm_plane *plane,
> > > >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > >                                      layer->overlay, plane);
> > > >         sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay=
,
> > > > -                             true, zpos, old_zpos);
> > > > +                             true, zpos);
> > > >  }
> > > >
> > > >  static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_f=
uncs =3D
> > {
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/d=
rm/
> > sun4i/sun8i_vi_layer.c
> > > > index bb7c43036dfa..4653244b2fd8 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > @@ -18,8 +18,7 @@
> > > >  #include "sun8i_vi_scaler.h"
> > > >
> > > >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int c=
hannel,
> > > > -                                 int overlay, bool enable, unsigne=
d int
> > zpos,
> > > > -                                 unsigned int old_zpos)
> > > > +                                 int overlay, bool enable, unsigne=
d int
> > zpos)
> > > >  {
> > > >         u32 val, bld_base, ch_base;
> > > >
> > > > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct sun8i_m=
ixer
> > *mixer, int channel,
> > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > overlay),
> > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
> > > >
> > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_b=
ase),
> > > > -
> > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > -                                  0);
> > > > -
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base=
),
> > > > -
> > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > -                                  0);
> > > > -       }
> > > > -
> > > >         if (enable) {
> > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > >
> > > > @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(struct
> > drm_plane *plane,
> > > >  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
> > > >                                           struct drm_atomic_state *=
state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(pl=
ane);
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay=
,
> > false, 0,
> > > > -                             old_zpos);
> > > > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay=
,
> > false, 0);
> > > >  }
> > > >
> > > >  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > > >                                          struct drm_atomic_state *s=
tate)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct drm_plane_state *new_state =3D
> > drm_atomic_get_new_plane_state(state,
> > > >
> > plane);
> > > >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(pl=
ane);
> > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > >         if (!new_state->visible) {
> > > >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > > > -                                     layer->overlay, false, 0, old=
_zpos);
> > > > +                                     layer->overlay, false, 0);
> > > >                 return;
> > > >         }
> > > >
> > > > @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(struct
> > drm_plane *plane,
> > > >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > >                                      layer->overlay, plane);
> > > >         sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay=
,
> > > > -                             true, zpos, old_zpos);
> > > > +                             true, zpos);
> > > >  }
> > > >
> > > >  static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_f=
uncs =3D
> > {
> > > > --
> > > > 2.30.2
> > > >
> > >
> >
> >
