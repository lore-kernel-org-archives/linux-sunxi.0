Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8182D6E64
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588804; cv=none; b=K5aLq5cPnN4wZQI1P0PGJw1wCcy6nKZhCLVfkshyQQGupkRTYdCkmNSeac4fOBzoP4/K4Mhm9yeKKXDYoEif1NS+xwNYfJCdKhR2uj2qEz7SIq1z4gCy6jewjibbbZscVObrxBJV064ZHwa7l7OQStZfNCwBTfdIUoMZFfKsglk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588804; c=relaxed/simple;
	bh=j0PiY+YX8mNYl+UK7bHBtrXVXJba6irTFWtbY7uyCQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaQWUpY/0Sbo7tcNlQO2m/TTFOKTlg2YJQDzxs7t/CrdJEVnfwJJXhPJXPV3e+DbTdl4u4bQnVBLKHAZxULG0B1w66lRWR8iqsrBSoO5772yYU0VVPKV2eK9UxlgyBH3iRCM5kW0JKnIizjVqp/M87XfnXJF7OYWsBpXqZ7samk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWzUg0ZH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWzUg0ZH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47117f92e32so44674505e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588801; x=1762193601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
        b=MWzUg0ZHsx8xLeddpaysCwL/mXs3Qu0lP8ux0wM29SY48X0twr2HKtWayJ3SEP7W6F
         BISWmp87jtFmrNzxxpGZ5Aog4++RqMxq5L2fNFYfekw4OZBoFjHHi48iiHKRxHj5Voku
         tIuMd8JUMFPmfVzDnwclcDiJRGpA0qsrvmrrYv2Mte5+RVHRtQs3FmI3aI7tUdat9uyL
         vpLvB5iy1wAi4xDECPBC9BfzC6vQRxm2OI3flsI0dkJVYjSmbPYE6Bf+W5YdC4f7obvX
         3MvcxbC2Mz6ugEC2oDCZl7SrtAgzB1xMtYIvCrb1cQb6IlMCHEHB0Jjyivm4mHTa8Dmd
         lrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588801; x=1762193601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
        b=LMioG+ioiHbtrvvk8LSD2AKWJ0x/1liZwnNcYEwaLwzb85gUq54tciMcmB9JlAwIew
         L5Fe2mmMIl6XUuUmzk5aOezD2KDV+76oyndqrY9wH8TYFEGIX8Vfy4xQXjtHunlhmq0L
         7hfd9Gps6XpqY4KhrpAbHOXtR4biql+sZ+wmCP8XM/HokYi4YOvF0/FDlHWYlbI4JbAZ
         s0fKkZaBMgx28FoYYRx4Tc27yI5+ZsksR5O7yaty2UC+WuiUU7LPQyERVtRXMXQjtXqX
         tlMHHJI/AbxiQ72wvDUWe2OqEK3dyNHu0GcFtT1vWxI2moiqk3kk35WM/6jlA25g3nf9
         7UyA==
X-Forwarded-Encrypted: i=1; AJvYcCXXu3zN26Wpprh5Z/gqlqHgHCz0U3PfE5r5oyqBjvFc+k1WbDNjc+gRUe389iVAx8pNExu9qTZPMWcoSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY5uG5jFKEP08oM8F9JnKF/ox/1JbPrb9tr3Vozb4GbB3WIGAu
	lIptlXGmjUij/qgH25L6SHfd19olll+08yk7+o/E7iyih2afJy/QmuH+
X-Gm-Gg: ASbGncv+pemjzoCNbWTOIYolEfdkluwkXL/WjjQ4sZ2P5euNxA/GPlW5dIx9Bfi4RlC
	N5IAPQQ0cJ++tf+8CHesTYrplf9iW/sKigtOdSbtGEBSB7m8HhTY7AVT8at7jbxinQAMGT854MB
	Q5doYIYBzV+mnSSZEKR1QXopmcwyDttQNwshVt5hKRUX5lCylUP8WOldnHjtYuMw5ReV59I1MH9
	H8tz7czyEB/OxYn35S0nZqqLivC6YeqAMmA165/tNqBBBlzGZe8AP0igsiuYVIG/2xA4GILdanr
	oGjre9y+Iw0tmCmACuzYQmWtHZ0C3SEYYm+khr1iUmuEZ9FjLyg2YlTsd52xBRO8zf4bJQlCXUR
	tqIY9WTJiIcYrsmk0a3GKV7vnZCZUvSnnur900HE96xWOIWjoWixG1yLStyxdXAp1Mt5O6QDNLW
	og2khwXT3t05sB9Ughw38qMQtoYpH1P5bPbTiL7qfEWZj0fb7sKfdHhcSTZ/1UYOAca/4wzeHKC
	+opsw==
X-Google-Smtp-Source: AGHT+IEqlnVwDpi13GnycHHx8DE0kjDHzXjgMTxar3Q9GtHCBjX6mOGesLa7ZV6EWb6wgPy30T7PJg==
X-Received: by 2002:a05:600c:6818:b0:475:de05:661f with SMTP id 5b1f17b1804b1-47717e67c68mr5088525e9.41.1761588800714;
        Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4924e2sm149902535e9.8.2025.10.27.11.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Mon, 27 Oct 2025 19:13:19 +0100
Message-ID: <10742932.nUPlyArG6x@jernej-laptop>
In-Reply-To:
 <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
References:
 <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com>
 <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 17:04:38 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > It turns out that none of the UI channel registers were meant to be
> > read. Mostly it works fine but sometimes it returns incorrect values.
> >
> > Rework UI layer code to write all registers in one go to avoid reads.
> >
> > This rework will also allow proper code separation.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
> >  1 file changed, 16 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> > index 12c83c54f9bc..8634d2ee613a 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -25,25 +25,27 @@
> >  #include "sun8i_ui_scaler.h"
> >  #include "sun8i_vi_scaler.h"
> >
> > -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int=
 channel,
> > -                                       int overlay, struct drm_plane *=
plane)
> > +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> > +                                            int channel, int overlay,
> > +                                            struct drm_plane *plane)
> >  {
> > -       u32 mask, val, ch_base;
> > +       struct drm_plane_state *state =3D plane->state;
> > +       const struct drm_format_info *fmt;
> > +       u32 val, ch_base, hw_fmt;
> >
> >         ch_base =3D sun8i_channel_base(mixer, channel);
> > +       fmt =3D state->fb->format;
> > +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> >
> > -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > -
> > -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alph=
a >> 8);
> > -
> > -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> > +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> > +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
>=20
> Changing "plane->state" to "state" made the diff somewhat harder to read.

Do you prefer that I change that in next revision?

Best regards,
Jernej

>=20
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> >
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          mask, val);
> > +       regmap_write(mixer->engine.regs,
> > +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), =
val);
> >  }
> >
> >  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int=
 channel,
> > @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun=
8i_mixer *mixer, int channel,
> >         }
> >  }
> >
> > -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, i=
nt channel,
> > -                                         int overlay, struct drm_plane=
 *plane)
> > -{
> > -       struct drm_plane_state *state =3D plane->state;
> > -       const struct drm_format_info *fmt;
> > -       u32 val, ch_base, hw_fmt;
> > -
> > -       ch_base =3D sun8i_channel_base(mixer, channel);
> > -
> > -       fmt =3D state->fb->format;
> > -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> > -
> > -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, v=
al);
> > -}
> > -
> >  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, in=
t channel,
> >                                          int overlay, struct drm_plane =
*plane)
> >  {
> > @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct d=
rm_plane *plane,
> >         if (!new_state->crtc || !new_state->visible)
> >                 return;
> >
> > +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> > +                                        layer->overlay, plane);
> >         sun8i_ui_layer_update_coord(mixer, layer->channel,
> >                                     layer->overlay, plane);
> > -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> > -                                   layer->overlay, plane);
> > -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> > -                                     layer->overlay, plane);
> >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >  }
> > --
> > 2.51.0
> >
> >
>=20




