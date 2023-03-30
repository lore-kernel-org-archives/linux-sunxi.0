Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF241C05
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Mar 2023 06:46:02 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id cf7so22295181ybb.5
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680158761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9KvtDBDjnJJEqpcZjjyzTKCX1rkB36TxwhuGzvhZPc=;
        b=bt6C87APwyUX1JWG2oRItuviKVBrMHw3USsuZx8wsxFNZ16hHSgB9jqvVzth8JfDAc
         nCKeHwTTHh/atvFf0BOOJwm6q9GvyC/A8TnZcm+tFv6pwFpd1/6TQEFZrxrKImHm/vEF
         2Q6U14wyjnzNbfB7KrxWRBqOEAThwA7ExMtq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680158761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9KvtDBDjnJJEqpcZjjyzTKCX1rkB36TxwhuGzvhZPc=;
        b=KLJ9GkUL4mrMxHKCKQwXrrSokuVkC+ovcAfK1HWzbz/Y7VgS56JFLu/7ahaT26Y/jB
         8pea2NqlodzzP2iiwZ5BG2f5pqBbUV62+p50B/P1RbihMGkR/+ymVy3G61dJuuwK5iw4
         tJxEFxRzrRdEF2xVZ8rKWEK3QiECn9FcFZisTl1a5M+R/yh9X1l6URWgp1i2NknKG0k8
         KAcnr4E+H+RhiANCdjGwUM8/Q378Sxnq2OuSdIMxrK8C3VvNILDvY9wUFPL65QoyxjzH
         J/Gi3lBkyK6p+p/G8or+pDBSxjqL1e99kh696ewbVXiIJBxUbNE0udwIyeMsNqtlvToa
         TgGQ==
X-Gm-Message-State: AAQBX9d0sXFXjBX96DHjDQUXChAphhwUd1ggA5liO2NZE6NFLx53YDq7
	Np1KrGHyZWhFbhTotLHL0QAowm8zyzDzBWsrdl2+4g==
X-Google-Smtp-Source: AKy350akHF5ZJtdSHsp/EicclOQgIOG1PqepWwCthsk5hLwQa4/j37Q/HX7g3wekmsrvapGpdWWusB+vmhPMm/2t6q0=
X-Received: by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr14621745ybu.5.1680158761113; Wed, 29 Mar
 2023 23:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com> <20230329145939.7zcex4x2pipivuj4@penduick>
 <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com> <20230329160652.7gel5qvckzwihjx4@penduick>
In-Reply-To: <20230329160652.7gel5qvckzwihjx4@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 12:15:49 +0530
Message-ID: <CAMty3ZB=R0RfU+o7LZWpS=4-ny00ocCxBu-M6yicY4q0-eYL9A@mail.gmail.com>
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

On Wed, Mar 29, 2023 at 9:36=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> On Wed, Mar 29, 2023 at 09:08:17PM +0530, Jagan Teki wrote:
> > On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > >
> > > Hi,
> > >
> > > The patch prefix should be drm/sun4i:
> >
> > I did follow my previous prefix, I will update this.
> >
> > >
> > > On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > > > Convert the encoder to bridge driver in order to standardize on a
> > > > single API by supporting all varients of downstream bridge devices.
> > >
> > > Which variant, and why do we need to convert to a bridge to support a=
ll of them?
> >
> > Downstream bridge variants like DSI panel, DSI bridge and
> > I2C-Configured DSI bridges. Bridge conversion would be required for
> > the DSI host to access the more variety and complex downstream bridges
> > in a standardized bridge chain way which is indeed complex for encoder
> > driven DSI hosts.
> >
> > >
> > > > The drm_encoder can't be removed as it's exposed to userspace, so i=
t
> > > > then becomes a dumb encoder, without any operation implemented.
> > > >
> > > > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > [...]
> > >
> > > > +static const struct component_ops sun6i_dsi_ops;
> > > > +
> > > >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > > >                           struct mipi_dsi_device *device)
> > > >  {
> > > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_=
node);
> > >
> > > That one looks unrelated. Why do you need that change?
> >
> > This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
> > and bridge. I think I will separate this into another patch.
>
> So, it looks to me that you're doing two (unrelated) things in that patch=
:

Correct.

>
>   - You modify the existing driver to be a bridge

Yes, Convert to bridge driver - register drm_bridge_add and replace
encoder ops with bridge ops.

>
>   - And you support downstream device being bridges.

Yes, Support the downstream bridge. (If I'm correct we can still use
encoder ops with this).

If we see the hierarchy of support it would
1. support the downstream bridge.
2. convert to the bridge driver.

>
> Both are orthogonal, can (and should!) be done separately, and I'm
> pretty sure you don't actually need to do the former at all.

Do you mean converting to bridge driver is not needed?

Thanks,
Jagan.
