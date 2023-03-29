Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B92F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:38:29 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5419d4c340aso299810087b3.11
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680104308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjRFa9g3onI1kC4K0Bhev7+GmSoMwaeDzlNBL5jHj68=;
        b=Mi6YU1rgntanGu1TnibK+PJaPy357W/mJA63yHdPw3nBV3U0TjPaqtjgyzXcQm1xtO
         6NMzWsRdpwuqTKCcNbr1TIFRMaxoWQElKew/F6Bo5LPjY8XdkphGmXPwUBH916LfOhQ5
         rK7ls+5F9RiRE7hN6V/acBEF7evVuF5i1WnGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680104308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjRFa9g3onI1kC4K0Bhev7+GmSoMwaeDzlNBL5jHj68=;
        b=Wo9HZfeTjrk0LixoF5zSzyJteqZbUfxB118t0VixHafxOvNwZVGIjju5N9mJxSYQ+j
         OLVGWlpvyonVH2J5dORRUNjI+ZyM9H3m/W0frbRtppSEH1kVg2pytjBquRl4O1IskG6Y
         XUEOhEcHlI7IHYvgw0gehfowRpXvk15upIDD37yz+2Lf0Wf423+S7J1mYaOWGjEx/U9S
         a3xal2EKLN6RwsWASZ4QHxTnHNM9TXyZuNTdS6n1xxGhhbcupSAXeJBEWyM6c2WpEMVi
         eqCdUIZE1TG2nNV2OWQLGCYUzT0UR4lY5gqBFBCTyxT+DaQMLbYLNiZfnkg/GFp7xGgE
         YLKQ==
X-Gm-Message-State: AAQBX9cVKT8ofWipayW1N130vPta+TiTWFE70XLzH3fjRt/pYJtWpaAn
	pUu/YdCMjkRRjBudOjdoEAkdatiAxqFCNJi/fU19Ew==
X-Google-Smtp-Source: AKy350YYUvrbMDF7TvuD73hFUqxg7MO1EfxmBpZ8yOwn2fCl7O3CFbZEtrIBZxvqLWsEjX5aIvD6D8tDlprGjyT23Xg=
X-Received: by 2002:a05:690c:b94:b0:541:698b:7bdb with SMTP id
 ck20-20020a05690c0b9400b00541698b7bdbmr1644187ywb.2.1680104308357; Wed, 29
 Mar 2023 08:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com> <20230329145939.7zcex4x2pipivuj4@penduick>
In-Reply-To: <20230329145939.7zcex4x2pipivuj4@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:08:17 +0530
Message-ID: <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
	linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> Hi,
>
> The patch prefix should be drm/sun4i:

I did follow my previous prefix, I will update this.

>
> On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > Convert the encoder to bridge driver in order to standardize on a
> > single API by supporting all varients of downstream bridge devices.
>
> Which variant, and why do we need to convert to a bridge to support all o=
f them?

Downstream bridge variants like DSI panel, DSI bridge and
I2C-Configured DSI bridges. Bridge conversion would be required for
the DSI host to access the more variety and complex downstream bridges
in a standardized bridge chain way which is indeed complex for encoder
driven DSI hosts.

>
> > The drm_encoder can't be removed as it's exposed to userspace, so it
> > then becomes a dumb encoder, without any operation implemented.
> >
> > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> [...]
>
> > +static const struct component_ops sun6i_dsi_ops;
> > +
> >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >                           struct mipi_dsi_device *device)
> >  {
> >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_node=
);
>
> That one looks unrelated. Why do you need that change?

This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
and bridge. I think I will separate this into another patch.

Thanks,
Jagan.
