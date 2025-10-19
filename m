Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0F1643B
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760862327; cv=none; b=TsEK/kP2X/Tga0tp7LW0BZdPN3YdXAv9/pOp8c/z50t522siVmDyVFVDe4sgRzUC5S3nqFANcMM0+wJiihDznvrHxtRMfh3TlH5TxL1bOFpnUig0rrpNn2zXLhyKlPwyu2a9648s6PKGcg61BRQLCRouK3IbOZPAL1D1uCQv/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760862327; c=relaxed/simple;
	bh=4h8fA0nb54zpgXZYa5aTVEhQBGP+EvE0aipi3YnSi/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrat5pTfeulzmn5M4EvLfqB7E0gXnn4UD4EKAJJe/qdemvxJbCRc8ZvEHGl6/xZ9NThz0X77KCia3jOfF3NFiAdm08EO+205DJW9lUFWgeFGRIsmb9Xv09ftUP+dMdgS3bw/NUPTVnaurvAqcHjb2b3HkIakjkVJXE/P2azJ2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3778144a440so40208241fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760862323; x=1761467123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VW3mkeflKClv9lw164K4YGIw8SIsux7V05xBSu2+GpY=;
        b=xH9Ft0AdW/TBJiK+akNHehjxxbOyUgtDuqN/8C8xs1WUVYOiHEy7mqqrSHVbFaB9qm
         R5Buziu0/2iVX7ERQVLbWjCgUwvpxcLkaSAFrVHp696GtZ5Pf9fXoqrJT7XTH8gq26Qh
         kosHybxXiuq6iqo+pk7sX3Dybqw1eToiO/ExMPwQw4nDId1KgFf/TnC3f2or2JK6ur/v
         ot73yKUkLOs3PfkaWQF/GI4ACkLoHkajY/7balQ7d629PsDxjB+A8jCEltL5QOFXmxz/
         mu396iTp/tY3/9yKOFKPGEb2eoloOjKD38D0FXX9GSbwZaU6cTJL9urMjISvBNJ7ljE8
         wJjA==
X-Forwarded-Encrypted: i=1; AJvYcCXWNNXlQeukwsT46A13MoFDheg1bpk6qZYfT5fcfGUQ2pMkpUmulD1J6rtI9z2I5+avG8ysRcqAInATyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuc8Ck3JigMftKnzqEe/bYN5B65JPQ3dfXrulp03sFe9Ic79V1
	5pbuwyD0QA2JOs4Ajy2UshrVyPqDMBy8sXIUye8gpSnc5pxFqTpuEQ+r5Jrd40Fh
X-Gm-Gg: ASbGncvfVxyeAes8YP6Ak7LssAzt5/Wio2A90UINxe3Yc851P0Z2WxO1g5bDaYI445i
	zBhshHwbFzaABiQqikGvHAdTZdIxpnSND+wnr/1hLPwS0t2jARFGiuTu/Nln1T/4+JXwkxG/UvF
	ZaGIE9rasNyPoPD9PLT6KZgYunMXAECsHjAZW7jL3Ji3UZTB9KM9koWL9VeRghcS5jcukj1H6yB
	t2ft7ul4ipkxWC77cG9fYHn0VmLL/9go9+NXMKTlnTVye0K8FxhgFRTmKawWmLxW4fAtON7WMZj
	9/xkINNnkCaz57FyT5++KY24rTCs2TAasGnRDz6vfDFKjkkYIUidcgNINBuFRQ96TkzyCJct3N1
	PQ29J7K09d+GjUvaEFT2PMDPCPlMM/2pCj6RbS1n5O0yaTngJ9oP8cXTlwCroc/DdiSVjXiDFkH
	Z0TcRsly8tonx2Wvd6+BnOTLkVXTcvmrfxg2DP41R/xgHmL9EdSCOKPQ==
X-Google-Smtp-Source: AGHT+IGdE1bkdzFTaSGBna7TBxdSiwUO0hO3cHB5SjzFZW723GN27/+MajyagOX6z1nOCA7LXHdUgA==
X-Received: by 2002:a05:651c:1118:10b0:376:2802:84c2 with SMTP id 38308e7fff4ca-377822498eemr34286191fa.23.1760862322940;
        Sun, 19 Oct 2025 01:25:22 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9674e68sm11805001fa.57.2025.10.19.01.25.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:25:22 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-371e4858f74so40333571fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7lPh9WZsN24Ve2LiExL8ePOYIVehuc8Bn12I4yyq3moaQwAY1o4mdh36OgqvlgILT2PlPeyz+ErMREg==@lists.linux.dev
X-Received: by 2002:a05:651c:25da:10b0:376:41f5:a6ca with SMTP id
 38308e7fff4ca-37781f4148fmr32251171fa.0.1760862322639; Sun, 19 Oct 2025
 01:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-6-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
X-Gm-Features: AS18NWC1T4rH1wgxWICMNRFWZoKmEq_TA059og5Su5dyIUywI4YDjh2R7R0IKKc
Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

Same comment as the previous patch.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index bd6c7915bbc4..c80bdece5ffc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         u32 val, ch_base, csc_mode, hw_fmt;
>         const struct drm_format_info *fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return ret;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_pla=
ne *plane,
>         struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>         struct drm_crtc *crtc =3D new_plane_state->crtc;
>         struct drm_crtc_state *crtc_state;
> -       int min_scale, max_scale;
> +       const struct drm_format_info *fmt;
> +       int min_scale, max_scale, ret;
> +       u32 hw_fmt;
>
>         if (!crtc)
>                 return 0;
> @@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return ret;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>
