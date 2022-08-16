Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B85391
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 14:43:59 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id i24so8230046qkg.13
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Glu8BOq83InxmgivOsliME3h0KPUgqBt+ApKY1f8Hz8=;
        b=EILXIABDYGM7aVrZ8SPk3f615N8+R82O9cuAT+g10kKJ2vPwmIcc1VAJ/6CRFu7tAb
         QeK5E9royp6EPtzB7okBa3js1UZDYS01MKIJNiWI+T3AeXDVWbzzcEm3AaaBqWk1/rwE
         1klxvYH7I0guJr5hRqGngT7N6Nu2JQLVOEzMPTGf+YeXzq2fkSLHy1xbygPUNu8L0IjN
         KhLsjDHWHgJomlf3dDsEWCff/QEhFHojh4MV2ag5p1qEYH6pXGJafZIZoMSu5+xXjt2R
         8I9zTo/6Zl0lGNZfSWWYS0PYVZPw0Px2d/k/0sNID2T84U9NCL6q7sUT5cCfLZUeVhjJ
         UpyA==
X-Gm-Message-State: ACgBeo3L61TuUgv7ibb4+0Ncl9o+41TMs5KVD834fMfxfWYO3VhwccsQ
	SoPiELACdCyP8Jicld9IJye0Sc/kRa8f2Q==
X-Google-Smtp-Source: AA6agR77UDuo2J+Ws5BLLd+LV5FRCzdTzkRUMF7IdZIPiYSK+8d42GvO5qaWk+g4yoLWzT3yADv1nw==
X-Received: by 2002:a05:620a:bc3:b0:6a7:9e01:95ac with SMTP id s3-20020a05620a0bc300b006a79e0195acmr14896358qki.91.1660661037947;
        Tue, 16 Aug 2022 07:43:57 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id s17-20020ae9f711000000b006bb024c5021sm7638045qkg.25.2022.08.16.07.43.57
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 07:43:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-32194238c77so157001417b3.4
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:43:57 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr31311ywg.283.1660661036761; Tue, 16 Aug
 2022 07:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
In-Reply-To: <20220816141116.5nuszmilqv2exdb3@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 16:43:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
Message-ID: <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
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

On Tue, Aug 16, 2022 at 4:11 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 03:29:07PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 16, 2022 at 3:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Fri, Aug 12, 2022 at 03:25:18PM +0200, Geert Uytterhoeven wrote:
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
> > > > >   * 0 on success or a negative error code on failure.
> > > > >   */
> > > > >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > > > > +                                 unsigned int supported_tv_norms,
> > > > >                                   unsigned int num_modes,
> > > > >                                   const char * const modes[])
> > > > >  {
> > > > > +       static const struct drm_prop_enum_list tv_norm_values[] = {
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> > > >
> > > > The above are analog standards, with a variable horizontal resolution.
> > > >
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> > > > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> > > >
> > > > The above are digital standards, with a fixed resolution.
> > >
> > > Are they?
> > >
> > > It's not clear to me from looking at nouveau, but I was under the
> > > impression that they were modes for a component output, so CEA 770.3. I
> > > don't have the spec though, so I can't check.
> >
> > Oh right, I forgot about analog HD over component, where you can use
> > other pixel clocks than in the digital standard.
> >
> > > > You seem to have missed "hd1080p"?
> > >
> > > Nobody is using it. If we ever have a driver that uses it I think we can
> > > add it.
> >
> > The PS3 supports 1080p over component
> > https://manuals.playstation.net/document/en/ps3/current/settings/videooutput.html
>
> Yeah, and iirc the Xbox360 did too, but what I meant by nobody is using
> it is that there's no driver using it currently.

OK, it can be added later.

> > > > In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
> > > > and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
> > >
> > > It looks like nouveau only exposes modes for 480p at 59.94Hz, 576p at
> > > 50Hz, 720p at 60Hz, 1080i at 30Hz.
> >
> > PS3 supports both 50 and 60 Hz (same link above).
>
> I'm probably wary on this, but I'd rather stay at feature parity for
> this series. There's already plenty of occasion to screw up something
> that I'd rather not introduce new stuff I haven't been able to test :)
>
> Provided we can easily extend it to support these additional features of
> course :)
>
> > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > currently a named mode and a refresh rate can't be specified both.
> > >
> > > I think the former would make more sense. It simplifies a bit the
> > > parser, and we're going to use a named mode anyway.
> > >
> > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > mode name, I think you want to add them here.
> > >
> > > It's a separate story I think, we could have a named mode hd720p50,
> > > which would be equivalent to 1280x720,tv_mode=hd720p
> >
> > So where's the field rate in "1280x720,tv_mode=hd720p"?
>
> Yeah, sorry I meant 1280x720@50,tv_mode=hd720p

Above you said "I think the former would make more sense", so that
should be "1280x720,tv_mode=hd720p50"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
