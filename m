Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93C3E1682
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Aug 2026 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883143; cv=none; b=eKAVEk+n8A/eoSYXc4bJUfqrQO2rmYeVDf7IKbt86KVON2B5rHqLz7b8RsIFx3fu02uqNcoL6j5p4R35LWOp5HtNNeV4YhsdduQyQv27sK5WV8Xe3q0WZRWkC0jhpQJY66wjve/IYS+qXzT2UAKAtgek8oLoxkcP2j3vCbJcUGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883143; c=relaxed/simple;
	bh=4+vbhmuJeY0Rjf6DoL1pseKV7KZwX/EwMow5IEeDzBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPzYCYKOaup1ECcC64AXzLTv9aqA28IcyLR+EgXIfRDeFRzAOf4pWTliRIR9vJnULlXzSoSzNukKwEYmW5Y2240I5TYQ3bafehKkRN0SFsoFuQbmH4IKElGTF9iXoCoj2Lefysana6VB7g7zf6DCO1H69IEL2wPMf4zvfyVHjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY9ySZin; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY9ySZin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF0D1F000E9
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Aug 2026 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786883139;
	bh=TkiLh9VOhdssJC2FCfvKMlpQ3w7S+D/K/oaLB8bYzhw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lY9ySZinctZuj+haz5hLxiQUDxCElY3uu9FDgqSEsYo7wADXYhrQRwV5wTUEAhkee
	 AonoMkTfq3/AVQScHmgV3e4m5ZEshnMgG8SPzQfrIfODLoT436dQxi46pM/MPZgSSB
	 efQPXvh1Mjwu+8gJeAyoEABki+2ZUbhWJQKl8PnfrojWy1YYdI5viz9AMz4/uYrTV1
	 5J3b0iA6Dlo9hx1v2TEKfUj/HpH9homlh2ZdlGq8VWqnV0USa1MYM0U3lXE4qZZ6TP
	 2VVDnkEhGZJ73xiQMVG6IteJ6j9XjhiPSbXbRQ1pCChDu6OB4LdlSv2jmsLajRy3+e
	 dcQDnSDdJe27g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so19988991fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Aug 2026 05:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rolrpxxmi5kNpuRD+IS5RaEURYTfJFApnwFFVrC2fm9JI8cgLqebOQSnMXIoabQpadZExUFOtK6wexFZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzarrn7QJQGeJGbeHc10TRgiJFw47GWg5+DBPeXNyPWm3GnAjh0
	tRujfG0JCj4NkHnM/vj/A81s4iGf8XU0bTEoZ8QNkPqA8FK5sYZhIftMKLbMZuTPasBJBhVYJ0W
	32uJ/HWi715KXCTmBrK6XshYEPTuoVbk=
X-Received: by 2002:a2e:8a89:0:b0:39a:e1c5:6f38 with SMTP id
 38308e7fff4ca-3a1324cd706mr17281661fa.24.1786883137563; Sun, 16 Aug 2026
 05:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org> <20260814-drm-no-more-plane-reset-v2-32-82d2963dd134@kernel.org>
In-Reply-To: <20260814-drm-no-more-plane-reset-v2-32-82d2963dd134@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Aug 2026 20:25:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PcWDgD=LjSPBWT6JQ8y3WwK6C3z2VuD37ZRDckev5AQ@mail.gmail.com>
X-Gm-Features: AcwNN1XmyExYj_GyxGcsVrwnbOt-0i9XNk3O88oB0lAIhgv7ZyXTo4OjeXMD8eM
Message-ID: <CAGb2v66PcWDgD=LjSPBWT6JQ8y3WwK6C3z2VuD37ZRDckev5AQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/61] drm/sun4i: sun8i: Convert to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> The plane only initializes a pristine state in its reset hook
> using drm_atomic_helper_plane_reset(), which is equivalent to what
> atomic_create_state expects. Convert to it.
>
> The conversion was done using the following Coccinelle semantic patch:
>
> @@
> identifier funcs;
> symbol drm_atomic_helper_plane_reset;
> symbol drm_atomic_helper_plane_create_state;
> @@
>
> struct drm_plane_funcs funcs =3D {
>   ...,
> - .reset =3D drm_atomic_helper_plane_reset,
> + .atomic_create_state =3D drm_atomic_helper_plane_create_state,
>   ...,
> };
>
> @match_struct_reset@
> identifier funcs, reset_func;
> @@
> struct drm_plane_funcs funcs =3D {
>     ...,
>     .reset =3D reset_func,
>     ...,
> };
>
> @reset_uses_helpers depends on match_struct_reset@
> identifier match_struct_reset.reset_func;
> @@
>
>  void reset_func(...)
>  {
>         <+...
> (
>         __drm_atomic_helper_plane_reset(...);
> |
>         __drm_gem_reset_shadow_plane(...);
> )
>         ...+>
>  }
>
> @match_struct_destroy@
> identifier funcs, destroy_func;
> @@
> struct drm_plane_funcs funcs =3D {
>     ...,
>     .atomic_destroy_state =3D destroy_func,
>     ...,
> };
>
> @script:python renamed_func@
> old_name << match_struct_reset.reset_func;
> new_name;
> @@
> if old_name.endswith("_reset"):
>     coccinelle.new_name =3D old_name.replace("_reset", "_create_state")
> else:
>     coccinelle.new_name =3D old_name
>
> @update_struct depends on match_struct_reset && reset_uses_helpers@
> identifier match_struct_reset.funcs, match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> @@
> struct drm_plane_funcs funcs =3D {
>     ...,
> -   .reset =3D reset_func,
> +   .atomic_create_state =3D new_name,
>     ...,
> };
>
> @drop_destroy depends on update_struct && match_struct_destroy@
> identifier match_struct_reset.reset_func;
> identifier match_struct_destroy.destroy_func;
> identifier container_func;
> identifier P;
> symbol drm_atomic_helper_plane_destroy_state;
> symbol __drm_atomic_helper_plane_destroy_state;
> @@
>
>  void reset_func(struct drm_plane *P)
>  {
>         ...
> (
> -       if (P->state) {
> -               <+...
> (
> -               drm_atomic_helper_plane_destroy_state(P, P->state);
> |
> -               __drm_atomic_helper_plane_destroy_state(P->state);
> |
> -               P->funcs->atomic_destroy_state(P, P->state);
> |
> -               destroy_func(P, P->state);
> )
> -               ...+>
> -       }
> |
> -       drm_WARN_ON_ONCE(P->dev, P->state);
> |
> -       WARN_ON(P->state);
> )
>         ...
> (
> -       kfree(P->state);
> |
> -       kfree(container_func(P->state));
> |
>         // kfree is optional
> )
> (
> -       P->state =3D NULL;
> |
>         // plane->state clearing is optional
> )
>         ...
>  }
>
> @drop_destroy_mtk depends on update_struct@
> identifier P;
> symbol __drm_atomic_helper_plane_destroy_state;
> symbol to_mtk_plane_state;
> @@
>
>  void mtk_plane_reset(struct drm_plane *P)
>  {
>         ...
> -       if (P->state) {
> -               __drm_atomic_helper_plane_destroy_state(P->state);
> -               ...
> -       } else {
>                 ...
> -       }
>         ...
>  }
>
> @transform_nv50_wndw depends on update_struct@
> identifier S;
> @@
>
>  void nv50_wndw_reset(...)
>  {
>         ...
> -       if (WARN_ON(!(S =3D kzalloc_obj(*S))))
> +       S =3D kzalloc_obj(*S);
> +       if (WARN_ON(!S))
>                 return;
>         ...
>  }
>
> @transform_kzalloc depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier P, S;
> statement ST;
> statement list STL;
> @@
>
>  void reset_func(struct drm_plane *P)
>  {
>         <...
>         S =3D kzalloc_obj(*S);
> (
> -       if (S)
> -       {
> -               STL
> -       }
> +       if (!S) return;
> +
> +       STL
> |
> -       if (S) ST
> +       if (!S) return;
> +
> +       ST
> )
>         ...>
>  }
>
> @transform_body depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier S, P;
> expression PS;
> @@
> - void reset_func(struct drm_plane *P)
> + struct drm_plane_state *new_name(struct drm_plane *P)
> {
>         ...
>         S =3D kzalloc_obj(*S);
>         ...
> (
>         if (!S) {
>                 ...
> -               return;
> +               return ERR_PTR(-ENOMEM);
>         }
> |
>         if (WARN_ON(!S)) {
>                 ...
> -               return;
> +               return ERR_PTR(-ENOMEM);
>         }
> |
>         if (S =3D=3D NULL) {
>                 ...
> -               return;
> +               return ERR_PTR(-ENOMEM);
>         }
> )
>         ...
> (
> -       __drm_atomic_helper_plane_reset(P, PS);
> +       __drm_atomic_helper_plane_state_init(PS, P);
> |
> -       __drm_gem_reset_shadow_plane(P, PS);
> +       __drm_gem_shadow_plane_state_init(P, PS);
> )
>         ...
> }
>
> @update_early_return depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>  struct drm_plane_state *new_name(struct drm_plane *P)
> {
>         <+...
> -       return;
> +       return ERR_PTR(-EINVAL);
>         ...+>
> }
>
> @update_return_plane depends on update_struct@
> identifier match_struct_reset.reset_func;
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>  struct drm_plane_state *new_name(struct drm_plane *P)
> {
>         ...
>         __drm_atomic_helper_plane_state_init(PS, P);
>         ...
> +
> +       return PS;
> }
>
> @update_return_shadow depends on update_struct@
> identifier renamed_func.new_name;
> identifier P;
> expression PS;
> @@
>  struct drm_plane_state *new_name(struct drm_plane *P)
> {
>         ...
>         __drm_gem_shadow_plane_state_init(P, PS);
>         ...
> +
> +       return &PS->base;
> }
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: linux-sunxi@lists.linux.dev
> Cc: samuel@sholland.org
> Cc: wens@kernel.org
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 00756ab78b4e..bad102134726 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -211,11 +211,11 @@ static const struct drm_plane_helper_funcs sun8i_ui=
_layer_helper_funcs =3D {
>  static const struct drm_plane_funcs sun8i_ui_layer_funcs =3D {
>         .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_state=
,
>         .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
>         .destroy                =3D drm_plane_cleanup,
>         .disable_plane          =3D drm_atomic_helper_disable_plane,
> -       .reset                  =3D drm_atomic_helper_plane_reset,
> +       .atomic_create_state =3D drm_atomic_helper_plane_create_state,
>         .update_plane           =3D drm_atomic_helper_update_plane,
>  };
>
>  static const u32 sun8i_ui_layer_formats[] =3D {
>         DRM_FORMAT_ABGR1555,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 09f668c8af24..2e9cda45c04e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -291,11 +291,11 @@ static const struct drm_plane_helper_funcs sun8i_vi=
_layer_helper_funcs =3D {
>  static const struct drm_plane_funcs sun8i_vi_layer_funcs =3D {
>         .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_state=
,
>         .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
>         .destroy                =3D drm_plane_cleanup,
>         .disable_plane          =3D drm_atomic_helper_disable_plane,
> -       .reset                  =3D drm_atomic_helper_plane_reset,
> +       .atomic_create_state =3D drm_atomic_helper_plane_create_state,

Looks like a pretty standard replacement.


Acked-by: Chen-Yu Tsai <wens@kernel.org>

>         .update_plane           =3D drm_atomic_helper_update_plane,
>  };
>
>  /*
>   * While DE2 VI layer supports same RGB formats as UI layer, alpha
>
> --
> 2.55.0
>
