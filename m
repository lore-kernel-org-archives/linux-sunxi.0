Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E519D07A
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589036; cv=none; b=GIl2RIrsHMomLhuQU2vuwvJXEDETR0yeXH0OdaJ0reRokWU8YZIGmJeImdvM0QsBHg8wg3X5UdKG5QAFDN5j7HoV9NoreQ0RBwoK7wiOqF92cchMZTs+0EdfS1BLxZ2jEqfCNpnq/uz6qpqlRhImFhNp+HxMbsFZxneW2GjThlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589036; c=relaxed/simple;
	bh=6nd/xaCVmVViBpeV0cBqu/UumtloLX/T9G1ZHGpbMWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPjK2eLwUf84ATyVoLJwmFipt/AesP/OP4VxSgEhUWr31jLBPQ8uTrgDnoSUsEXGHBePvfrokbSieC1tzASLE9Hsu5Mms66m8mxGgGWs4o+k6yNLIz9JgCerd8q9Qb7YW7K0SIUsfhZyBob/XKyySa6KvL+SImIlz9i+/RPJ8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKDUIcrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKDUIcrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49609C16AAE
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761589036;
	bh=6nd/xaCVmVViBpeV0cBqu/UumtloLX/T9G1ZHGpbMWc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lKDUIcrQbRWMzcs/byoQUfInnMtMm4M/OR53T9IQQhw/pUi/12XLs/X12lQzVF5PO
	 nof4BoXiil+9PMKQDUtXURLrmEqw/dTSe1Tz29pJ2udO7wYiz9duSSQV0fM2BslIEo
	 4Y+47rUQnb6qOr9RHJIjE9WGhJzD78cDAZ6AGHxMqhtdJWs/8mXKoasLP3cuYO4TLU
	 6MlKur3i67dx6iHfiscGoChkYSdZhD2X/ubr/y38QaBPN6DhsyWIhQsn706VS30xqL
	 rjiiPPHMaKoc7GGsAKn7W6hj9jOoWx2xWjhKWC9tpCJ5n0LhiZnxUzNX9jm/g3szs/
	 VuESXGe8wrsCw==
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-9379a062ca8so207926339f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 11:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdIR0Nogo7Kt9VA06gGIZHel2NWW47o5l2d9geofSnsZZUh68KrrX/0Ybc9x2JuGmNqLU2Hhewm46rEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl2MWSxUKap+nA1HoNm7tQti09vBzlktaxlY/7k5QtGqeEM0F2
	EB7hXV0lWqB0DNRtpT6eaQDSl9Jam6MsZOxUcwXJqaikbC/ueEyiKtxSludZOZRC7rU1q6pMMc4
	mJo+uab1lpTLpaNLNHeHGogN4TBGc3IQ=
X-Google-Smtp-Source: AGHT+IG8zyj7yHZN9LacH9IlKXFT7dH+scROPtkp6gXmpK9NPsaJpiuFwmBzdRIMm/de3SVZSRzRTX72Xl1Fa1OPcJs=
X-Received: by 2002:a05:6602:6d14:b0:93e:856a:2fe8 with SMTP id
 ca18e2360f4ac-945b84edf9fmr159706739f.19.1761589035669; Mon, 27 Oct 2025
 11:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com> <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
 <10742932.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10742932.nUPlyArG6x@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 02:16:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v64YkkYRqfXnOcHkn+L3xh26mSXZ+CWjzbr_KXdNmq+Jpw@mail.gmail.com>
X-Gm-Features: AWmQ_bkVDWDL1iQ2lwVNNkITQo8BZYUH6exm_dJJvH_NxnAyZvBvVjoZ7LEJoQs
Message-ID: <CAGb2v64YkkYRqfXnOcHkn+L3xh26mSXZ+CWjzbr_KXdNmq+Jpw@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 2:13=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 27. oktober 2025 ob 17:04:38 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> > On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@=
gmail.com> wrote:
> > >
> > > It turns out that none of the UI channel registers were meant to be
> > > read. Mostly it works fine but sometimes it returns incorrect values.
> > >
> > > Rework UI layer code to write all registers in one go to avoid reads.
> > >
> > > This rework will also allow proper code separation.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++---------------=
--
> > >  1 file changed, 16 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm=
/sun4i/sun8i_ui_layer.c
> > > index 12c83c54f9bc..8634d2ee613a 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > @@ -25,25 +25,27 @@
> > >  #include "sun8i_ui_scaler.h"
> > >  #include "sun8i_vi_scaler.h"
> > >
> > > -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, i=
nt channel,
> > > -                                       int overlay, struct drm_plane=
 *plane)
> > > +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mix=
er,
> > > +                                            int channel, int overlay=
,
> > > +                                            struct drm_plane *plane)
> > >  {
> > > -       u32 mask, val, ch_base;
> > > +       struct drm_plane_state *state =3D plane->state;
> > > +       const struct drm_format_info *fmt;
> > > +       u32 val, ch_base, hw_fmt;
> > >
> > >         ch_base =3D sun8i_channel_base(mixer, channel);
> > > +       fmt =3D state->fb->format;
> > > +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> > >
> > > -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > > -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > > -
> > > -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->al=
pha >> 8);
> > > -
> > > -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) =
?
> > > +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> =
8);
> > > +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> >
> > Changing "plane->state" to "state" made the diff somewhat harder to rea=
d.
>
> Do you prefer that I change that in next revision?

No need.
