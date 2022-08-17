Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E357C
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 07:31:43 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id m5so9834670qkk.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 00:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MoCGxpdBSZqOnL0zHKYLDEdga6g996l84p2nV9SRtCY=;
        b=TNPG5J7Hu/gMoGw6VGd6zTrBW3RtSd+3QRs85Uf72BTz9+FK82mH3HYOu4n7ygR1ug
         0kAKxjKGuvDrsGpWSjmnOcCnsetch8ZGlOZKGippSV9mtqYE9FvsKRICeoSAUQYzwe0I
         DCpm7wOUtxAqaO21/noQZZTgR5fUGHz4gATV6AI9FsfGXyBlb9Sco47Lg3/eEMsvmk7J
         3yoebKjklpXxyEFqlyvW8xjeus3F97m0KJj8+CS0Exnr1u4UsWr1IuAh+G+JSHojHZqy
         fnysEbngpNbEqfoGYNGv12VpPkyZF2mr8my/bax88e30MkAcfU+RTww2ynG7+2j8lEcI
         E3/Q==
X-Gm-Message-State: ACgBeo3PJpmdkrlZFPseQ93SaOjUGZy+ralISPAFnQgdWGVeR4nDsUbX
	851/vOZxlosUgWU3TAfEyjCix4RplsyjGw==
X-Google-Smtp-Source: AA6agR5L3WFcUvzWeMtAI7VIwS+HY/rINJRfwRbiqEyZmlWuBYXQILlc22c+mFqVcER6UTZliOPI8A==
X-Received: by 2002:a05:620a:424d:b0:6a7:9714:9443 with SMTP id w13-20020a05620a424d00b006a797149443mr17353692qko.544.1660721491997;
        Wed, 17 Aug 2022 00:31:31 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a431600b006af08c26774sm13899561qko.47.2022.08.17.00.31.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 00:31:31 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-32a17d3bba2so209975057b3.9
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 00:31:30 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr17606473ybp.380.1660721490548; Wed, 17
 Aug 2022 00:31:30 -0700 (PDT)
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
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
In-Reply-To: <20220816154956.pkdpxmmw27mia5ix@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 09:31:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
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

On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > >
> > > > > I think the former would make more sense. It simplifies a bit the
> > > > > parser, and we're going to use a named mode anyway.
> > > > >
> > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > mode name, I think you want to add them here.
> > > > >
> > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > >
> > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > >
> > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> >
> > Above you said "I think the former would make more sense", so that
> > should be "1280x720,tv_mode=hd720p50"?
>
> No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p

I disagree: hd720p50 and hd720p60 are different TV modes.
Treating them the same would be similar to treating unmodulated (e.g.
component) PAL-N (25 frames/s) and PAL-M (30 frames/s) the same.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
