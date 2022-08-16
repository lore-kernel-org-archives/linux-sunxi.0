Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEC5391
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 14:52:20 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id f14so8291148qkm.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tf29XLGj+1bd58LVE065Hm1nPqeAKMph377e+8mce68=;
        b=087d/8Z7wiJ+FYjnDrrSiSoyE9gjLixhQoG1t2w4sBnkOGy4/vIao5O+KqSwWPBEts
         04lp+rMBeebZOHDaS9hu3OAiR7zlcR9tkoLnuZhwfTKWxjarPll1kUWF9bP7F1v+b6IQ
         QMZP1zsN9yzbbDP9RlWjchkInrj70w7EmasQzqqWPUk7DUIjckKpFx4vpPdGg+x8fRkZ
         sFBp6QA+KCWLs9GHB5UKcAl+W5GHf00Cms2YGNoIiSYmjGEvRFTfp2xqxVCE3RVZkrVS
         JKnaTNLguP8y4+912xNGIO+xeHDRDH6Df0wFz5a3v/VEEV8Qo8RhXf7QAO+6uIHzUaky
         wKNA==
X-Gm-Message-State: ACgBeo2gprreigFH96OBYhWsNHu+UiskfyDyw8pZYiiF8HUsoSikODsn
	LPqAXn+g2CcyCKvsEzHEcfP4EX9LR9Z9wQ==
X-Google-Smtp-Source: AA6agR5arY/RdxwxEe0LqMWqRlrcA3Ms1zUv5DdW8YS/v6InaaLKHCNv78atC0bYJeFRz4OotOA1kw==
X-Received: by 2002:a05:620a:25c8:b0:6ae:bf82:8f36 with SMTP id y8-20020a05620a25c800b006aebf828f36mr15863215qko.354.1660661539849;
        Tue, 16 Aug 2022 07:52:19 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 190-20020a3703c7000000b006bb2bca5741sm5746120qkd.93.2022.08.16.07.52.19
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 07:52:19 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31f445bd486so157415457b3.13
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 07:52:19 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr16448315ywe.502.1660661082059; Tue, 16
 Aug 2022 07:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
 <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com> <20220816134624.cmb5s6i6pkdhu3qj@houat>
In-Reply-To: <20220816134624.cmb5s6i6pkdhu3qj@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 16:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
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

On Tue, Aug 16, 2022 at 3:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:27:17PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > The current construction of the named mode parsing doesn't allow to extend
> > > it easily. Let's move it to a separate function so we can add more
> > > parameters and modes.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
> > drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
> > (https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
> > ;-)
>
> Indeed, I forgot about that one, sorry :/
>
> I think I'd still prefer to have the check for refresh + named mode
> outside of the function, since I see them as an "integration" issue, not
> a parsing one.
>
> It's not the named mode parsing that fails, but the fact that we both
> have a valid refresh and a valid named mode.
>
> >
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
> > >         "PAL",
> > >  };
> > >
> > > +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> > > +                                             unsigned int name_end,
> > > +                                             struct drm_cmdline_mode *cmdline_mode)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > > +               int ret;
> > > +
> > > +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> > > +               if (ret != name_end)
> > > +                       continue;
> > > +
> > > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> > > +               cmdline_mode->specified = true;
> > > +
> > > +               return true;
> > > +       }
> > > +
> > > +       return false;
> >
> > What's the point in returning a value, if it is never checked?
> > Just make this function return void?
>
> Yeah, it's something I went back and forth to between the dev, and it's
> an artifact.
>
> I'll drop that patch, take your version and move the refresh check to
> drm_mode_parse_command_line_for_connector if that's alright for you?

Fine for me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
