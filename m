Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E731FA0
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 08:52:10 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id s11so9912592qtx.6
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 01:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2JD+X/GOYgljDqW3V4/txiGVTXdbLlGZCC1UfMUdTQc=;
        b=1ix7aRNtBn3dvLXWXZPJPCfZW341QuTiyEFQLhKWcYJf4ImUw42UpZYXGbNbgf8lN2
         fx5/l6I1KNUIiZbjeZyL47+QRafyP2EeVtXonDe8ZnOVTLDkwjXRny1SMGXq4iq1vmHK
         lwM0WIucMUMbIwIc8aJj7Jwqf7sr+77Wm3cdzLddZi7rFPhvMDwlabryWbrNmU8zbwjO
         jJkZeJVI47nTamAFGULD4OQRB7lItsyFvjQLx5wXk6Of2B/Ukv1GNV4lQSqYtLdhpxGh
         9STcIqSmpYNw4hbVb3dGQ9HdbsmTNRaSznK3w+IAwP+cBds4CCCW8mBG81c+7t79PrsH
         FxMA==
X-Gm-Message-State: ACgBeo3PZriSq3aQUpza7vKKdk715kQ2gTj97ytC+UCRA1SwH/a+wXIY
	o+s/IEbW48YCEx8gILUu5YzIhUEd2Y1LYA==
X-Google-Smtp-Source: AA6agR6W87o2F6/+HTeHrd2EamIulWjqTwashaDycKF/FunLHP8BqUVMwTxG2EnWWgwIkFPrYE7zZg==
X-Received: by 2002:ac8:594e:0:b0:343:5e86:fa65 with SMTP id 14-20020ac8594e000000b003435e86fa65mr21799131qtz.29.1660726329446;
        Wed, 17 Aug 2022 01:52:09 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id h4-20020ac81384000000b00342fb07944fsm12051885qtj.82.2022.08.17.01.52.07
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:52:07 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-32a17d3bba2so214181007b3.9
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 01:52:07 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr18847109ybl.36.1660726327196; Wed, 17
 Aug 2022 01:52:07 -0700 (PDT)
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
 <20220817075351.4xpsqdngjgtiqvob@houat>
In-Reply-To: <20220817075351.4xpsqdngjgtiqvob@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 10:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Aug 17, 2022 at 9:54 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > Multiple drivers (meson, vc4) define the analog TV 525-lines and =
625-lines
> > > > > modes in the drivers.
> > > >
> > > > Nit: strictly speaking these are not analog modes, but the digital
> > > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > > > 13.5 MHz sampling frequency for pixels.
> > > >
> > > > In analog modes, the only discrete values are the number of lines, =
and
> > > > the frame/field rate (fixing the horizontal sync rate when combined=
).
> > > >
> > > > The number of (in)visible pixels per line depends on the available
> > > > bandwidth.  In a digital variant (which is anything generated by a
> > > > digital computer system), the latter depends on the pixel clock, wh=
ich
> > > > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e=
.g.
> > > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC=
)).
> > > >
> > > > So I think we probably need some way to generate a PAL/NTSC-compati=
ble
> > > > mode based not only on resolution, but also on pixel clock.
> > >
> > > This would also fix the comments made by Jani and Thomas, so I quite
> > > like the idea of it.
> > >
> > > I'm struggling a bit to find how would could implement this though.
> > >
> > > From what you were saying, I guess the prototype would be something l=
ike
> > >
> > > struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_cl=
ock,
> > >                                                 unsigned int lines,
> > >                                                 unsigned int frame_ra=
te)
> > >
> > > But I have zero idea on what the implementation would be. Do you have
> > > some resources for this you could point me to?
> >
> > Horizontally, I think you should calculate left/right margins and
> > hsync length to yield timings that match those for the BT.656 PAL/NTSC
> > modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> > requested, you want to calculate left', right', and hslen' for
> >
> > | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen'=
 --> |
> >                         @ 14 MHz
> >
> > so they match the timings for left, right, and hslen for
> >
> > | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen =
---> |
> >                         @ 13.5 MHz
> >
> > As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> > you want to make sure to align the center of the visible part.
>
> So I guess in that example if we want to center it, left =3D=3D right and
> left' =3D=3D right'? What about the sync length?

No, left and right are asymmetrical, cfr. front and back porch in
https://en.wikipedia.org/wiki/PAL#PAL_signal_details
I.e. if the pixel part is reduced, both the left and right margins
should be increased by the same amount.

From the table linked above, hslen should be ca. 4.7=C2=B5s (fixed).

> > Vertically, it's simpler, as the number of lines is discrete.
> > You do have to take into account interlace and doublescan, and
> > progressive modes with 262/312 lines.
>
> So we only have to deal with 525 and 625 lines total (without taking
> interlace and doublescan into account), right?

Yes.

> I guess we still have the same question, we probably want to center it,
> so top =3D=3D bottom, but what about the vsync length?

Unfortunately that table does not mention top and bottom margins.
But according to drivers/video/fbdev/amifb.c (see the "Broadcast
video timings" comment block and the definitions of the "ntsc-lace"
and "pal-lace" video modes), they are asymmetrical, too.

Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
have that info when I wrote amifb, as I used 4 lines there).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
