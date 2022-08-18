Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A744405
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 12:58:13 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h4so988296qtj.11
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 05:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JREs+R+hOdRL2M18w+Jk20r5RGbAGO+48abMsau2ww8=;
        b=73vs8DWIqBDxdREwJt3bqKBUwIiidcGDMVNMnd1MwzW/KSDthO5k6g/h1kr/0qYgp5
         bwPpqSXmS10aK+H1YiR5vmd2ZmnTcA/nr2jTahFwNhDCjNWY2UZuHfO2ZHZJqm6w/mdy
         ZsAa754mTKiibOAVgcwKMKTFb0Y07irdf5LYrHdSEZ0j5km4CWXGAynvfgPqQKpUzfeU
         wBUgdwqiWwu+Qi5i8Quvf02p70mzatRYM2yLGBzSKCI2ZLrmbMOUq2bCkvQsyhdcSArj
         YCdPl/iic4E+x1h7mlydvcnWQVCEOWGcITnN5qrCohlhaS5UyPV6G1GfyWXGJ9ePWgAU
         ShUw==
X-Gm-Message-State: ACgBeo34caCBZtCPrHq7P6nYkUJeRyItlAKET4rz+9Rfv8YALRe+TCrP
	SdnMUjLAmb0CV+7xI4ofPt/k5lBwn4QU1g==
X-Google-Smtp-Source: AA6agR5UvM2NLRyosVlTtrgjV58cigaGwK4+nb8BuqhBi0BNJmJ3Fv/F6YcurxYstDWqKWuLLe6ogQ==
X-Received: by 2002:a05:622a:18a8:b0:343:6c8c:13e5 with SMTP id v40-20020a05622a18a800b003436c8c13e5mr2407733qtc.544.1660827492170;
        Thu, 18 Aug 2022 05:58:12 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h4-20020ac87764000000b0034355a352d1sm930386qtu.92.2022.08.18.05.58.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 05:58:09 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-324ec5a9e97so38498367b3.7
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 05:58:08 -0700 (PDT)
X-Received: by 2002:a25:cf83:0:b0:692:78ad:f44c with SMTP id
 f125-20020a25cf83000000b0069278adf44cmr2546178ybg.604.1660827488283; Thu, 18
 Aug 2022 05:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat> <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
In-Reply-To: <20220818123934.eim2bfrgbxsmviqx@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 14:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > I've looked around and it looks like the entire blanking area is
> > > supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
> >
> > 625 lines - 575[*] visible lines = 50 lines.
> >
> > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
> >      a frame in two fields of equal size.
> >
> > "visible" is relative, as it includes the overscan region.
> > Some PAL monitors used with computers had knobs to control width/height
> > and position of the screen, so you could make use of most or all of
> > the overscan region
>
> It brings back some memories :)
>
> > but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> > an Amiga used by default (with a 14 MHz pixclock).
>
> > > it's supposed to be split between the upper and lower margins and the
> > > sync period.
> >
> > "Field Synchronization of PAL System" on
> > http://martin.hinner.info/vga/pal.html shows the split.
>
> Thanks, that's excellent as well.
>
> I'm mostly done with a function that creates a PAL mode, but I still
> have one question.
>
> If I understand well, the blanking period is made up (interlace) of 16
> pulses for the first field, 14 for the second, each pulse taking half a
> line. That amount to 30 pulses, so 15 lines.
>
> I first assumed that the pre-equalizing pulses would be the back porch,
> the long sync pulses the vsync, and the post-equalizing pulses the front
> porch. But... we're still missing 35 lines to amount to 625 lines, that
> seems to be counted in the field itself (305 lines == (575 + 35) / 2)
>
> So I guess my assumption was wrong to begin with.

The back porch is the number of lines between the last "visible" line
and the start of the synchronization pulse, i.e. "l" in the "Field
Synchronization of PAL System" drawing.
Virtual sync length is "m".
The front porch is the number of lines between the end of
the synchronization pulse, and the first "visible" line, i.e.
"j - l - m" (I think you used "n", thus missing lines 6-23 and 319-335).

> You seem to have used a fixed vsync in amifb to 4 lines, and I don't

Actually "m" is 2.5 lines in the first field, and 3 lines in the second field,
so "4" is not that much off of 2.5 + 3.

> understand how you come up with the upper and lower margins (or rather,
> how they are linked to what's described in that page)

These margins probably came from the Amiga hardware reference manual,
for the default 640x512 (PAL) and 640x400 (NTSC) modes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
