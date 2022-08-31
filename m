Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383B7E1
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Aug 2022 08:22:57 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11ee4649dfcso16070601fac.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Aug 2022 01:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tL3Pu80GajPbXIuFp2pntr8ejcDbNLFHN+ltW3MDRBA=;
        b=YnU/zduouf7ZL50JCFVDoWmHpq4rWyZK+N3780caJ2mgaIG3OjYy/g9qSw/2SIOepZ
         GP6bpZpDtIBHF8cbOw9x2mvWGctbsHa6nfnXaDOU1i1+bkL/Tvp5anEPq+M8aitGGjuH
         NPJ8MBsdjk2+lncvHPDFyoBUBIW/qwFN6lUKoW5sSXjQ2XU/CywkTFAHI45N/UtYxFbv
         vhERs0E1huO0+VNC17dm7bzkMWkgguL4SRQAnH1VntMmLdT63WEUtSGdtvYg8nZEp4oY
         UhBbYLLCFa0x9p5mPQ2WGvw8ZJTp8pcr6cYhfqiQhTuyKahBCzC0ECtykrkdvUMyQK5S
         hyvA==
X-Gm-Message-State: ACgBeo0O2m4uuMjAEGRRvlrP37SKnTRhXRLQrchRJYG3XuwSiQikDRKd
	7CCJi+Svdx2Z7gDJ71phBy5SObSB8kWGKg==
X-Google-Smtp-Source: AA6agR7Aw3chUBSUiWGpNVb/0y03PyuYZM9GRyvcvrnQW1FEEj8Jr5DRrnTnfSwmO7NV+YfO/u1flw==
X-Received: by 2002:a05:6870:a1a5:b0:120:8d35:c8a3 with SMTP id a37-20020a056870a1a500b001208d35c8a3mr830248oaf.237.1661934176310;
        Wed, 31 Aug 2022 01:22:56 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id s8-20020a056830148800b0063911de9fd8sm8635466otq.24.2022.08.31.01.22.56
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 01:22:56 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so9783423otk.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Aug 2022 01:22:56 -0700 (PDT)
X-Received: by 2002:a25:24b:0:b0:696:4e87:7cec with SMTP id
 72-20020a25024b000000b006964e877cecmr14439821ybc.202.1661933679611; Wed, 31
 Aug 2022 01:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech> <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
In-Reply-To: <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Aug 2022 10:14:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
Message-ID: <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>, 
	Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Lyude Paul <lyude@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Phil Elwell <phil@raspberrypi.com>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nouveau Dev <nouveau@lists.freedesktop.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mateusz,

On Wed, Aug 31, 2022 at 3:44 AM Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> Wow. That's an enormous amount of effort put into this patch.
>
> But I'm tempted to say that this is actually overengineered quite a bit :D
> Considering that there's no way to access all these calculations from user
> space, and I can't imagine anybody using anything else than those standard
> 480i/576i (and maybe 240p/288p) modes at 13.5 MHz any time soon... I'm not
> sure if we actually need all this.

We'll need it when we get an Amiga DRM driver, which will use
7/14/28 MHz pixel clocks.

> But anyway, I'm not the maintainer of this subsystem, so I'm not the one to
> decide.
>
> > +enum drm_mode_analog {
> > +    DRM_MODE_ANALOG_NTSC,
> > +    DRM_MODE_ANALOG_PAL,
> > +};
>
> Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes is common,
> but strictly speaking a misnomer. Those are color encoding systems, and your
> patchset fully supports lesser used, but standard encodings for those (e.g.
> PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some more neutral
> naming scheme. Some ideas:
>
> - DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refresh rate)
> - DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standard line
>   count)

IMHO these are bad names, as e.g. VGA640x480@60 is also analog, using
60 Hz and 525 lines.  Add "TV" to the name?

> - DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding ITU System
>   Letter Designations)

Or DRM_MODE_ITU_*?
But given the long list of letters, this looks fragile to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
