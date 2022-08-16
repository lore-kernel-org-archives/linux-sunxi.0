Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D73539A
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 15:00:52 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g21so4606350qka.5
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5LUM7nzor1/XqC5vXK/cNLgsMpFS8BfigyHBrmKtMuQ=;
        b=0wsGENrlqESb2edMGa+9iSqTAydQLIdJT43PgaATO5iVDoCoa1dr+ef7/WsMRhkQVV
         j1WufMaZlZ9TRyvJDBuGz0BdaWfYhVEyoDLsLRuMgJgP/15V0VJO2z83EivvqATeKwc3
         EX0h+PeTe8P/rp6HZaAJl1QtYfCYiENzUiT2q1/Cg3kSBE+Thj3/IO6clGTR0+LhXP3i
         jdUuG5ubclcNy1Gr+Rp3IZAChfxO3FtBus9m+sQlCV/G3plRKUO4RtgcVHaTcsQvnfKB
         Kr2anfli1KdvnelFZzOm0YnStLmiDWRdvMPy2FZ8q92FhnlOjRj0qKJjFBqZgyECHzZD
         apPw==
X-Gm-Message-State: ACgBeo39+i6t/QuudoUCtvo3BhNHaqm8OAutvT6EUEzehYD2WfXLpW5K
	JYiMJbtMYW/AxYQb2x0tHsGK2UfSL0u9AQ==
X-Google-Smtp-Source: AA6agR5ETeS7hnpfx5bhSAvY1ZfoRZx3/pbNr0TlfZ6zTItLW7JAG1TwiTNDax7lB1oWbNmVdw/2TQ==
X-Received: by 2002:a05:620a:2ea:b0:6bb:264f:bf42 with SMTP id a10-20020a05620a02ea00b006bb264fbf42mr7111394qko.649.1660662050686;
        Tue, 16 Aug 2022 08:00:50 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id y18-20020a37f612000000b006b8e8c657ccsm11241416qkj.117.2022.08.16.08.00.50
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 08:00:50 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3246910dac3so157978097b3.12
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 08:00:50 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr130640ybr.202.1660662049765; Tue, 16
 Aug 2022 08:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com> <20220816132636.3tmwqmrox64pu3lt@houat>
In-Reply-To: <20220816132636.3tmwqmrox64pu3lt@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 17:00:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
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

On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> > > modes in the drivers.
> >
> > Nit: strictly speaking these are not analog modes, but the digital
> > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > 13.5 MHz sampling frequency for pixels.
> >
> > In analog modes, the only discrete values are the number of lines, and
> > the frame/field rate (fixing the horizontal sync rate when combined).
> >
> > The number of (in)visible pixels per line depends on the available
> > bandwidth.  In a digital variant (which is anything generated by a
> > digital computer system), the latter depends on the pixel clock, which
> > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
> > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).
> >
> > So I think we probably need some way to generate a PAL/NTSC-compatible
> > mode based not only on resolution, but also on pixel clock.
>
> This would also fix the comments made by Jani and Thomas, so I quite
> like the idea of it.
>
> I'm struggling a bit to find how would could implement this though.
>
> From what you were saying, I guess the prototype would be something like
>
> struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_clock,
>                                                 unsigned int lines,
>                                                 unsigned int frame_rate)
>
> But I have zero idea on what the implementation would be. Do you have
> some resources for this you could point me to?

Horizontally, I think you should calculate left/right margins and
hsync length to yield timings that match those for the BT.656 PAL/NTSC
modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
requested, you want to calculate left', right', and hslen' for

| <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen' --> |
                        @ 14 MHz

so they match the timings for left, right, and hslen for

| <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen ---> |
                        @ 13.5 MHz

As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
you want to make sure to align the center of the visible part.

Vertically, it's simpler, as the number of lines is discrete.
You do have to take into account interlace and doublescan, and
progressive modes with 262/312 lines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
