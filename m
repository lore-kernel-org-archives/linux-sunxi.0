Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0930CDA9
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581098; cv=none; b=a1LNVahMqAmRBZa27IF/avm9uWm4aX1GK5AYZi9LDtYcgREgTgAUbTimewhVaB6cQKJULjcIVv6npIoeT4Y1EmUADlXloeCF2x5+pwObS6eSYkseEkVE21I8t5F3XarI2hEYbN3T7Mbbsccbip1YHK/PNR3W/Lk9SMLgxJtRAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581098; c=relaxed/simple;
	bh=NlwHw11BUjTJkh2dFsD8uZbhbzSybLPxCVNh/rquY7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJJQh4mXsSxve8g0LqCPpUwZOb/jzkNQVUFQpZ6X9FWp7/IsBy1f2uAbb+qFWOQFV8Vh5AyaKJTOCEEXDcXK1aQewazPiOiV62ikPR0OT5lRdp14ualftsVpOtixkk383utRm+O0s5hHuHJDRCqYXgigVey7zhwE9+S2+RJ0d4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso5718316e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581093; x=1762185893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBt+IECqNVtAsegMkIX7fm58vbKYt/6Urfpjeenw3Ow=;
        b=o1UfEWE2Nf2gdFnYv+JFGiuai+4aFcAwIJzCSzouU/ZciAGo4xbK/jiMT/yLlvcepO
         gcWbFIbwaKliizs5hXcYMDi3coU1GvdVIovT2b1tSIxFbTcX+D4JEZP7c9jCaMFBTW8f
         EekMs9t9vMt1N4tel8sZo9Eyhr3JyV5LfnP1B7uTicMMGh0XUmCGh+TqRTxmGMrT7t5n
         cq+0GZFAoRhTRv2hmtpRpdlFXhQpMSbNJ7qBTH0q0BwzCAq80KvSIzC1CrBUNu7SpKpK
         oKgYFk2W3JEja78hC4XRUjY3TsC8UrsU2GvSJ/0X2tXIpVoN+xnehihjQeChpuFdTz0x
         cwsw==
X-Forwarded-Encrypted: i=1; AJvYcCXxA4px1sw+EOY6p9mntQGhxc0GQAVyjg3CIiwQSUuHHqgdhX//Yo0yvTSKnm9Z61tACCAQVxXT//MgUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YycogMvqVJro1f53DmcPQ2g2E3zoGnjW/7g1TLL+ys5/HEqpDxu
	O2ogAJU+xgl4lZa3zyr+lmnOE6uCwJa3hBMBBBaOScdYnlv6dWzAX6EFl/rm5+xgQNg=
X-Gm-Gg: ASbGncuCf/oOz6H4zLvhcWMj2R1TySs8cvSSq9Orsgmk6QmYQ0nyzPeELD1boQgkaAm
	DEGCpxAjCAG0WEUiF1awf0azYXKnb8ceOT4inV9zMWAcds2lNgk73uJrLZWrAn0O8kT/aJA3zby
	jPKeWsP2lOKOiZgeiUbJE4ki8xYMDRO+8tNofe849ksFQKNIxlutWn4UTkkXeo/5AB6xKRqnCzM
	pnzU4i8jePQtjNTf+KAdvCSHifr3j6OFsY4fWz24myv20WSp8FQpk3HnL4EQ6Av3PYw4T+WBH6R
	B/cyNFLVzkV1eQJhSKgF4e7ZGshT5LGhwx+LQLd5cyQFLiWSC0opD/Pa32u3iqfP6G+ZYGrZ18k
	9B5Wem3lSRuKy/oD+o4OraJnraNNFxGDM3rmgs4PCFzbyugt2uApZ4qdrqLgUmzjhXQ37/fUbNn
	MDQmNIDiutMcGZksuEHx5Yzpae5bPg0B+F/cG34zJa1x6a6Rcb0o3OQg==
X-Google-Smtp-Source: AGHT+IHALU60CA91Oi6W8pnaYXjoh9BJLHX5m9Zey//gUFmSA7wRmQyAYb57tlIXgcBHl14Sf80wfg==
X-Received: by 2002:a05:6512:3dac:b0:55f:71ad:590f with SMTP id 2adb3069b0e04-5930e9f991dmr155218e87.53.1761581093118;
        Mon, 27 Oct 2025 09:04:53 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59303607f54sm2191297e87.41.2025.10.27.09.04.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-378d50e1cccso51028751fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNLt4TzXmzyWOadIzdyB9SlOIpJL/K6s6g21WZ2vOpqTpxiTQpd1+JS2o5JcziYNi7KrYl7xT08TLTkA==@lists.linux.dev
X-Received: by 2002:a05:651c:222c:b0:378:d499:d34d with SMTP id
 38308e7fff4ca-379076d8741mr539671fa.15.1761581092345; Mon, 27 Oct 2025
 09:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-9-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-9-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:04:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm99AcS6yMWuT9w2DAubuMwkVTQftsOHcXhHkfhxsBt-ffhIxUo7tu2w44
Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
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
> It turns out that none of the UI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework UI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
>  1 file changed, 16 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 12c83c54f9bc..8634d2ee613a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -25,25 +25,27 @@
>  #include "sun8i_ui_scaler.h"
>  #include "sun8i_vi_scaler.h"
>
> -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int c=
hannel,
> -                                       int overlay, struct drm_plane *pl=
ane)
> +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> +                                            int channel, int overlay,
> +                                            struct drm_plane *plane)
>  {
> -       u32 mask, val, ch_base;
> +       struct drm_plane_state *state =3D plane->state;
> +       const struct drm_format_info *fmt;
> +       u32 val, ch_base, hw_fmt;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
> +       fmt =3D state->fb->format;
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
> -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> -
> -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha =
>> 8);
> -
> -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?

Changing "plane->state" to "state" made the diff somewhat harder to read.

>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          mask, val);
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), va=
l);
>  }
>
>  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int c=
hannel,
> @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i=
_mixer *mixer, int channel,
>         }
>  }
>
> -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int=
 channel,
> -                                         int overlay, struct drm_plane *=
plane)
> -{
> -       struct drm_plane_state *state =3D plane->state;
> -       const struct drm_format_info *fmt;
> -       u32 val, ch_base, hw_fmt;
> -
> -       ch_base =3D sun8i_channel_base(mixer, channel);
> -
> -       fmt =3D state->fb->format;
> -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -
> -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val=
);
> -}
> -
>  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int =
channel,
>                                          int overlay, struct drm_plane *p=
lane)
>  {
> @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm=
_plane *plane,
>         if (!new_state->crtc || !new_state->visible)
>                 return;
>
> +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> +                                        layer->overlay, plane);
>         sun8i_ui_layer_update_coord(mixer, layer->channel,
>                                     layer->overlay, plane);
> -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> -                                   layer->overlay, plane);
> -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> -                                     layer->overlay, plane);
>         sun8i_ui_layer_update_buffer(mixer, layer->channel,
>                                      layer->overlay, plane);
>  }
> --
> 2.51.0
>
>
