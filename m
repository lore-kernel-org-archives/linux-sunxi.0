Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB5187F
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 13:06:06 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id j6so10258261qkl.10
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wT+w/e1pir6od65k8fW73wcIBpWHrOcKqnuAFp6tc4E=;
        b=ET189lIKAY/XWK8OhnXrTqj65YU+hfl2wxF5qOcTEOKnx+4EOVx7AFlWJH2Zmnww4i
         Ad1TUsI/aKjbzml2fHIDsI2HYvm7yRlMATmDtrUUch5de8SDFU4JnTIhGdKDn0ZUtFgg
         vMXs7Q+IoxOj6CBUwwTYt8wc6yB02iQj9ZyrMGEM9aiYBFnHYwna4XvJjMSfWEnLL4ey
         AQr2b+IJSE/KZZru46r9IS8W3N9lvEr78tJoc54iD7y8+uiofmQOQny5D6a4MsJoyTX9
         AweIjAMGrXcAEPob8NEPJuQ2+pXX0OLvuywnb6XMGyfaBPNejqTaZRFSMuJ7y49AisNd
         s0IA==
X-Gm-Message-State: ACgBeo1SF5qMQtMuhLIvPTH4dsvjxASmLjAYkCv1eZvjXHjPx4WgCQyT
	MfaSK+pRmaoyqCZdmaXBaB2q+RHbKn70LQ==
X-Google-Smtp-Source: AA6agR68I0EgAoTVYWfGL/0GMm1SXFHjEJSkTVuvPtCoXmxuxB2VYG3iuvKMEsRPuSPrNedTO27EvQ==
X-Received: by 2002:ae9:e30f:0:b0:6bb:868:c7d8 with SMTP id v15-20020ae9e30f000000b006bb0868c7d8mr12471104qkf.25.1660741565277;
        Wed, 17 Aug 2022 06:06:05 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id fz9-20020a05622a5a8900b003447ee0a6bfsm1537296qtb.17.2022.08.17.06.06.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:06:05 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3246910dac3so228870957b3.12
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 06:06:04 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr14565309ywf.316.1660741564697; Wed, 17
 Aug 2022 06:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
In-Reply-To: <20220817111454.pn2iltvyo2drebq7@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 15:05:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > >
> > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > >
> > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > >
> > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > >
> > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > >
> > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > >
> > > > > > Above you said "I think the former would make more sense", so that
> > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > >
> > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > >
> > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > >
> > > I agree, and I don't see how that command-line doesn't express that?
> >
> > Oh, I see what you mean: yes, it expresses that.
> > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > where the TV mode specifies both number of lines and frame rate.
>
> Only if we're using a named mode, and naming is hard :)

That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
mode with 525 lines and 30 frames/s.

> Honestly, I'd be inclined to drop the hd* for now from this series. I
> don't have a hardware to test it with, for some we don't even have
> drivers that could implement these modes, we don't have a spec to work
> from, it looks like a recipe for failure :)

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
