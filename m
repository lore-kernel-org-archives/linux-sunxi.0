Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8A21A444
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760862275; cv=none; b=o4dvtkb2rUmXnEtf6pt2scpdJH15fjY8KbSSS8cDteqoCFJkWpFpawQwYICbqjTImfHlGAOnRT+fdtU005FX/LB8Mtw3Xzxl1FN0RJo2m5YDab60tNHEp54M03v8b4ABtCbbD2MVhRe8ql/mn7CMvN1Prvydgfc64+z54ErJnnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760862275; c=relaxed/simple;
	bh=u/sO7vOpFHkZEAJ7Yrx1elkkxXoxzXW8I8m2lrzhxZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9kI5195Bh3mY8tIRiqLPOgkSf8WwX0ND1OL8csYCmsYvDTcDa9/HWotGeHFITAm6qYSdVEq9X0rK/T3ByHc+5Ha2B3ysdlZcIRwzgvMDKk+wV67E8f0tApLSMSyPT/G8n4qIQ+PyGsn60FmQxm+HFNxnkjawgZvIjLUjyUaGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso3902416e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760862269; x=1761467069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMwNP3my/AAtkqEoi875nhGGuoIYGuPvqPRBJ3G+A9w=;
        b=vW84zMQSSo1+9c3qt7bqkAN7wQ1cRhvOoBp22FHoDW8b6u+z8ie+5VXeNFh8RGFUFs
         s9hszCVTK1oeVnT+B6S4MfO3s9kF2drbyVUjFSD88bCciGdxlXqAmNwh0npK6VDDNdcK
         QRFKz6oaoEEiG/RF9qS/JWI+CHVhdaSNzcT03hAP1nv2D8kzEIytv3WV/dLVfB0xCLYX
         LE+46Rw6JqU5AGwdM6LHhv3Wxj5fwG7m8R+bJ4TNBElt/yt6XfUhDD21fzgTInikhiBj
         9vHn4KWWavo2y33mm4bTz9vYcG1xWIT4dA/8eH6qZo5YTMlShijmf/wGXzQ6X6ojf40u
         pM1A==
X-Forwarded-Encrypted: i=1; AJvYcCWfPwkgRAeekbfLlaLShNvEIn1wcBwAx+n8CwfoEy/RWDgiGlvmPQ3dZV90jzzRDbBoCp9QmKUuNdefyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh/iJzBqeE4jFSyBpzXIw2eCVbP7+rCiK8vpLlFS30GYzgMApq
	l1zruIMnPIV2hQA6SeSuz1ulNZPvqG9RNdOjMWmc1cej0oF9kL0tsbnRWATO0jQw
X-Gm-Gg: ASbGncvfZtFGBe10ku5pYzMmumsEy83EUxDOqasxFiks3s+TvblggbPwZsTd0zEr3QZ
	zXZ4gdKqNI97Z+IZuee9cRIFykioZUGArmpRtNE+3s97ahTgsZAwsl6LP2ThYwsmXcdai7GKdnS
	mjc9XyPDEm70/19cWdfRyImbCIGVb6d/2vkSw1l6qcmBBcsD3h0bA94/Jp5jT+bnwVxHf+O9FEc
	t30mhvaGwb3xLJpyN17QGTcJZpGjoGZZNpaPat4CA5/fEs2ywA8yb4lX/RAXY3z6UU1VvBxEsEb
	zmTwvX10Kjw6xwc36c3cMSvO/lhFrJPlSSOVrWsQpE+zmttcbc1P/N1MOnX510ZRH7pYiApVlp4
	LDx6Auyx2F7ATGIkVdgTYUmgbS4bMzo/3Lcuq6q5haRCs9ok0F3GkB/GqA668RoeILkOW9k1HNC
	RHyibbpNS/v9w+6DotTaIG/8lvnjtNbzBfN0o92rTAzUM=
X-Google-Smtp-Source: AGHT+IGN6ljyyLWn/GJHYV1Zvl58PW8+K/OGkXvH+u4mFhU8KJrwzVIgXbgbj8Gb1VqPcePqFMBSiA==
X-Received: by 2002:a05:6512:2251:b0:57b:fb1d:616e with SMTP id 2adb3069b0e04-591d85661b0mr3163408e87.39.1760862269077;
        Sun, 19 Oct 2025 01:24:29 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16a7bsm1370347e87.55.2025.10.19.01.24.28
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-367874aeeacso38986191fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9gTerTbbl3rV29NdaXC1eMEXqj3D9yZD0U5oZHNr1Ng53f3BYyDdh/Jexac34stippmJp2tpJBS3iow==@lists.linux.dev
X-Received: by 2002:a2e:bd86:0:b0:36b:f63:2785 with SMTP id
 38308e7fff4ca-37797a09b5emr26596581fa.27.1760862268372; Sun, 19 Oct 2025
 01:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-5-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-5-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:24:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
X-Gm-Features: AS18NWD0jnxz1Ue42cbwTGa97ilz_J4ZeWnbXU3EI3BU7YNx8yeEWNSRMp4bPA8
Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to
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
> DRM requires that all checks are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

                                  ^ atomic_check?

Otherwise the commit message seems self-contradictory.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 9b786e5c7f3c..fce7b265c5d8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         const struct drm_format_info *fmt;
>         u32 val, ch_base, hw_fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret || fmt->is_yuv) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return -EINVAL;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_pla=
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
> @@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret || fmt->is_yuv) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return -EINVAL;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>
