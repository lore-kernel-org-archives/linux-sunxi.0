Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743281EE03D
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Mar 2025 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968039; cv=none; b=SIJsCkbPKfEfWn/M6Q2db06PiHtB3ThSaZ5NMb/4V+sy7yQLiKSvN5+umVPNQwHh5nE0N9OO2eDRT6Qgl4w/w9EQQR2/NiqRsG3y8y/gsma3CJnqdKiM3UxTba+GjL5MgRVadLu4++yOEJ2KjhmCbfKR3374Jkk6rjy7+c1r2no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968039; c=relaxed/simple;
	bh=ax7jDivqNCm8Fd79tbZPgMwBc3TPoRnbbcDI9CxwYzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET8V0tIQq4hTxafNT4ei8lehp7OJCLsqkEjMiUJBfdhyPZ6bZwVn+PNSMKIsgpg64mQRazGIuo13A0/0ZuVlw47n+kidf628cfQBiUlCq3pgT+jMgCZb9a7xjPNKPRY7ajZlFLZap+vtWhzAdA6l6JgVx1XcbGjaLzavL5j/ACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRlMJBB7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRlMJBB7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff66327419so556811a91.1
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Mar 2025 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741968038; x=1742572838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
        b=VRlMJBB7HayL2A2XTkb5y+GhVucVerAoMgi2Ib/gDo+HF+HeXtvTvUZduVczBNeESw
         oJhU64U8XxfsXTDx6lXbItcgDNs7bpdhVXiTuN9G+tdjmebJXEUxr2ozB5WYewPpp342
         C3sMeWv6EZRFVaIONh2VXan48MWIHCMjoeaoVqbc2kfFuRASh6q3HeBElVN8dYNM/EGr
         IyRwkfsmQGeqXl6JhrMWzsWHuZ72knvxithw8YkFtB8UV1dvf+/owHKEJsTqZu0NMQHc
         EFOC6o3Hq0Lk+tqiUa1vUV7XVRkBspYmrAy54fCoVBgWREsdo+HXp2+pjuXmyqYnm9Pf
         spTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968038; x=1742572838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIY165QBF2I7E64kxf0y7gan5+WkPY6SwpR93M25+8U=;
        b=UB6q9F0k10I6mM2Ou1gobxqWgy7KIws//t7y4PHkIDWIH6vuumdkrM3VYF/00UlTXK
         aUoxms+Xz94k9yjOhPggA1RZpNyB38+WEyduR8spkBl2pCeUiGC5E6jmURYCCjJhl2wr
         Wfo3Y/yYl3wpmHncoT/m0F5NK2xTUR0oPH2hjYSGaEd8H2mHPVe5nwFtSArLVpclCRIz
         vthiMAuoqGXOoq4tlMQ1XYkEHehWwlpGi2mUErcX9sgNgtS/zzq1DCMthEdFUm/ntMW2
         AHIdQwDV2oZjU2qCc5jB6PiFusXgZyc8eO0RHiqcJC9SWgjYjl+hdijQ+2AymVP9185P
         ipsA==
X-Forwarded-Encrypted: i=1; AJvYcCUgBfaf0x+j6EUeyV7QXAfDoxh3lXAl6y8VSkro2TNQEMV1X1Vh4wXb1Th94s98t6uBJLqAqJA/Yj8gBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyewaCO4vfiBHA6Y0iE5rPOwGZwk27O7X9qNCGbR+XD0NmIAMnq
	YGQnP46MMe1/hV9ho+Bp0BpUUT4rsbgXN5WLiMiCvliLKQM8L3Xsx4Lg6efnlA6qkeU3KpFRNpw
	XRcdHgS09pTmAAjZC1rO0uCuRAA==
X-Gm-Gg: ASbGncuIX3cI5+iHASnUDLal1e7FlsDcAuwMwS9G/PdIbg0HK1xapYzcGHJYiR78Z5v
	trYemIWfaDu5lWsz8/K0Nt6BuqfrHgKC3gYCEGi7XMbiv+vvO8YVTgpox8Yb0OlwMKZNg2+5mx5
	ukolPUikwWU/dwPVNg/cS3A34TMzk=
X-Google-Smtp-Source: AGHT+IHPg5LEX9RcXJcT7z3Dh6z47dRs4csMp548pLAhreG5srJVcZIIpfZ8T/92XQSoT8s0QhUvp3pVVX5xQ+RxwCQ=
X-Received: by 2002:a17:90b:164f:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30151c88e12mr1556703a91.1.1741968037522; Fri, 14 Mar 2025
 09:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250314012029.668306-1-chenyuan0y@gmail.com> <20250314-prophetic-attentive-platypus-3ab214@houat>
In-Reply-To: <20250314-prophetic-attentive-platypus-3ab214@houat>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Fri, 14 Mar 2025 11:00:26 -0500
X-Gm-Features: AQ5f1JoUD0V5ZOdvR5FcIitlHbVLK_E695Xu4I0ACsV86e_NOveKe5yScUlp2jo
Message-ID: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in sun4i_backend_atomic_check
To: Maxime Ripard <mripard@kernel.org>
Cc: wens@csie.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com, 
	samuel@sholland.org, neil.armstrong@linaro.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Maxime.

Thanks so much for pointing that out!

How about such a patch?

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..5ad0e90d3e6b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
sunxi_engine *engine,
  drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
  struct drm_plane_state *plane_state =3D
  drm_atomic_get_plane_state(state, plane);
- struct sun4i_layer_state *layer_state =3D
- state_to_sun4i_layer_state(plane_state);
- struct drm_framebuffer *fb =3D plane_state->fb;
+ struct sun4i_layer_state *layer_state =3D NULL;
+ struct drm_framebuffer *fb =3D NULL;
+
+ if (IS_ERR(plane_state))
+ return PTR_ERR(plane_state);
+
+ layer_state =3D state_to_sun4i_layer_state(plane_state);
+ fb =3D plane_state->fb;

  if (!sun4i_backend_plane_is_supported(plane_state,
        &layer_state->uses_frontend))
--=20

-Chenyuan

On Fri, Mar 14, 2025 at 2:17=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > The function sun4i_backend_atomic_check was dereferencing pointers
> > returned by drm_atomic_get_plane_state without checking for errors. Thi=
s
> > could lead to undefined behavior if the function returns an error point=
er.
> >
> > This commit adds checks using IS_ERR to ensure that plane_state is
> > valid before dereferencing them.
> >
> > Similar to commit da29abe71e16
> > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_change=
d").
> >
> > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for=
 the frontend")
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/su=
n4i/sun4i_backend.c
> > index 2dded3b828df..a8e0e2123764 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi=
_engine *engine,
> >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> >               struct drm_plane_state *plane_state =3D
> >                       drm_atomic_get_plane_state(state, plane);
> > +
> > +             if (IS_ERR(plane_state))
> > +                     return PTR_ERR(plane_state);
> > +
>
> This introduces a build warning. You shouldn't mix declarations and code.
>
> Maxime
