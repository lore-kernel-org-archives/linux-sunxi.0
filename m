Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBDB110C
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 13:29:22 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b9so2505031qka.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 06:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hdhYrvwFVCJ/wIIa+DKIK8qp10gL+xmn48+Cm6GZTzY=;
        b=u7FBWxUGzAJAQk6UCgkQC7Snln5rtkkvGoGUP0kvufGJSa8ErQwc5WL7XvlnkzUJie
         P7C99lGISlnV1s1HmBsEmYlnkCquD+ePeqqOTT/YieVg431jQnccS26M2rGdryK3oWmx
         2PbY02K3ITg3a4rR/a/+L8pa2aPgiXnreE7ulLE8zn4jIxk+mhDgSYr8ADgpTtEpcNvT
         IiWw0oGX30lm9XTEgDyQZi317AxnkJtRZX4Jnsd07HTMT4Z+s3TlqdiR2h9gk5nKjLAe
         /Hbek5o95QLnbE68bWf3rU/LBQDozJCvoBgaANQw7lPgQ7FX6yD9V2RtYixa9dLBBbgI
         Eeqw==
X-Gm-Message-State: ACgBeo14B4WXaF91Dv3+2DD0SLMg+TX0JWm8O6JB3jrsLz5oZx/+PDrc
	tZ2gcm2p0dN9MFCwQuh49/H8tFbTDUnO+A==
X-Google-Smtp-Source: AA6agR7V0e4lBS6cs9KcReJz2rqslqVxFI1e2YQN9WuZl/z4ghte/u6sAy6FobelCq5P7VYUd9d7AA==
X-Received: by 2002:a05:620a:3705:b0:6b9:6ff:559d with SMTP id de5-20020a05620a370500b006b906ff559dmr14399363qkb.365.1660656561507;
        Tue, 16 Aug 2022 06:29:21 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id y23-20020ac87c97000000b00342f8984348sm10255247qtv.87.2022.08.16.06.29.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 06:29:20 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-332fc508d88so81233217b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 06:29:20 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr10322596ywf.316.1660656559751; Tue, 16
 Aug 2022 06:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com> <20220816132040.uwirtjm5yr6rdd3q@houat>
In-Reply-To: <20220816132040.uwirtjm5yr6rdd3q@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 15:29:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Tue, Aug 16, 2022 at 3:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:25:18PM +0200, Geert Uytterhoeven wrote:
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
> > >   * 0 on success or a negative error code on failure.
> > >   */
> > >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > > +                                 unsigned int supported_tv_norms,
> > >                                   unsigned int num_modes,
> > >                                   const char * const modes[])
> > >  {
> > > +       static const struct drm_prop_enum_list tv_norm_values[] = {
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> >
> > The above are analog standards, with a variable horizontal resolution.
> >
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> >
> > The above are digital standards, with a fixed resolution.
>
> Are they?
>
> It's not clear to me from looking at nouveau, but I was under the
> impression that they were modes for a component output, so CEA 770.3. I
> don't have the spec though, so I can't check.

Oh right, I forgot about analog HD over component, where you can use
other pixel clocks than in the digital standard.

> > You seem to have missed "hd1080p"?
>
> Nobody is using it. If we ever have a driver that uses it I think we can
> add it.

The PS3 supports 1080p over component
https://manuals.playstation.net/document/en/ps3/current/settings/videooutput.html

> > In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
> > and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
>
> It looks like nouveau only exposes modes for 480p at 59.94Hz, 576p at
> 50Hz, 720p at 60Hz, 1080i at 30Hz.

PS3 supports both 50 and 60 Hz (same link above).

> > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > currently a named mode and a refresh rate can't be specified both.
>
> I think the former would make more sense. It simplifies a bit the
> parser, and we're going to use a named mode anyway.
>
> > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > command-line option" uses a separate "tv_mode" option, and not the main
> > mode name, I think you want to add them here.
>
> It's a separate story I think, we could have a named mode hd720p50,
> which would be equivalent to 1280x720,tv_mode=hd720p

So where's the field rate in "1280x720,tv_mode=hd720p"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
