Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C504404
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 14:08:49 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id o184so15461064oif.13
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 07:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=9vGZaeYeF3C4CiTE5MgNIzB+zcyQS3be59eUDCUL+Fc=;
        b=U2Ics9pa2eYCZuxICjAC91dcUHdCWcuEio38yWJWPw6F26Zs8weuVhTYE/eJM5d6BR
         1WVwXggvWpW7H5PD0OaCKuLYh23kGgdsyL+zztF837M5qYNmYeG5NxnVbMhYla3nBzG9
         3u7S19kB8LmC5IfO1G0TeBxrfeNnQBWBKOKwuStKbF1wzS5BUA0lYSiKClSF4G5cIU8V
         ly7XdwDKxk86sLIpTHFE6NdnwV3xleY9W2RE7gwJ+RUsiGUJ4bRKSuL7/8E3Qfmn+Wlo
         L5+WPcIEkML50eLwhv6s3tp9d3jneHfPy+L0r9DjHh4jDzVzq8VeoaQ1OP3/jjxXaCkn
         XcQQ==
X-Gm-Message-State: ACgBeo2IMT4o85aQyx7mk/67zX4ffiMXCiTP44/7ocQfue8yc58guax8
	6g5+IvB85NJZD7IRCczr9DyAu5jaLX0Alw==
X-Google-Smtp-Source: AA6agR6R10Z/YRLoiSa6rDmfiLv/fA9CCKlAMnhPI7gIivaV+PdHBaF4matzxw0xyK/LES8Qjde2nw==
X-Received: by 2002:a05:6808:16a7:b0:2f9:39c4:c597 with SMTP id bb39-20020a05680816a700b002f939c4c597mr1591304oib.101.1660745328444;
        Wed, 17 Aug 2022 07:08:48 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id s24-20020a056808009800b00339c7af0e8esm1188169oic.51.2022.08.17.07.08.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:08:48 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 53-20020a9d0838000000b006371d896343so9457801oty.10
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 07:08:48 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr5998789ywe.384.1660744920203; Wed, 17
 Aug 2022 07:02:00 -0700 (PDT)
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
 <20220817131454.qcuywcuc4ts4hswm@houat>
In-Reply-To: <20220817131454.qcuywcuc4ts4hswm@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 3:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 10:51:55AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 9:54 AM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrot=
e:
> > > > > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > > Multiple drivers (meson, vc4) define the analog TV 525-lines =
and 625-lines
> > > > > > > modes in the drivers.
> > > > > >
> > > > > > Nit: strictly speaking these are not analog modes, but the digi=
tal
> > > > > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using=
 a
> > > > > > 13.5 MHz sampling frequency for pixels.
> > > > > >
> > > > > > In analog modes, the only discrete values are the number of lin=
es, and
> > > > > > the frame/field rate (fixing the horizontal sync rate when comb=
ined).
> > > > > >
> > > > > > The number of (in)visible pixels per line depends on the availa=
ble
> > > > > > bandwidth.  In a digital variant (which is anything generated b=
y a
> > > > > > digital computer system), the latter depends on the pixel clock=
, which
> > > > > > can wildly differ from the 13.5 MHz used in the BT.656 standard=
. (e.g.
> > > > > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (=
NTSC)).
> > > > > >
> > > > > > So I think we probably need some way to generate a PAL/NTSC-com=
patible
> > > > > > mode based not only on resolution, but also on pixel clock.
> > > > >
> > > > > This would also fix the comments made by Jani and Thomas, so I qu=
ite
> > > > > like the idea of it.
> > > > >
> > > > > I'm struggling a bit to find how would could implement this thoug=
h.
> > > > >
> > > > > From what you were saying, I guess the prototype would be somethi=
ng like
> > > > >
> > > > > struct drm_display_mode *drm_create_analog_mode(unsigned int pixe=
l_clock,
> > > > >                                                 unsigned int line=
s,
> > > > >                                                 unsigned int fram=
e_rate)
> > > > >
> > > > > But I have zero idea on what the implementation would be. Do you =
have
> > > > > some resources for this you could point me to?
> > > >
> > > > Horizontally, I think you should calculate left/right margins and
> > > > hsync length to yield timings that match those for the BT.656 PAL/N=
TSC
> > > > modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> > > > requested, you want to calculate left', right', and hslen' for
> > > >
> > > > | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hs=
len' --> |
> > > >                         @ 14 MHz
> > > >
> > > > so they match the timings for left, right, and hslen for
> > > >
> > > > | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hs=
len ---> |
> > > >                         @ 13.5 MHz
> > > >
> > > > As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> > > > you want to make sure to align the center of the visible part.
> > >
> > > So I guess in that example if we want to center it, left =3D=3D right=
 and
> > > left' =3D=3D right'? What about the sync length?
> >
> > No, left and right are asymmetrical, cfr. front and back porch in
> > https://en.wikipedia.org/wiki/PAL#PAL_signal_details
> > I.e. if the pixel part is reduced, both the left and right margins
> > should be increased by the same amount.
> >
> > From the table linked above, hslen should be ca. 4.7=C2=B5s (fixed).
>
> each pixel taking 1 / pixel_clock seconds (assuming pixel_clock is in
> Hz), and thus hslen (in pixels) =3D 4.7 * 10 ^ -6 * pixel_clk, right?

Exactly.

> > > > Vertically, it's simpler, as the number of lines is discrete.
> > > > You do have to take into account interlace and doublescan, and
> > > > progressive modes with 262/312 lines.
> > >
> > > So we only have to deal with 525 and 625 lines total (without taking
> > > interlace and doublescan into account), right?
> >
> > Yes.
> >
> > > I guess we still have the same question, we probably want to center i=
t,
> > > so top =3D=3D bottom, but what about the vsync length?
> >
> > Unfortunately that table does not mention top and bottom margins.
> > But according to drivers/video/fbdev/amifb.c (see the "Broadcast
> > video timings" comment block and the definitions of the "ntsc-lace"
> > and "pal-lace" video modes), they are asymmetrical, too.
> >
> > Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
> > have that info when I wrote amifb, as I used 4 lines there).
>
> Thanks, that's some great info already.
>
> It's mentioned though that the settings for NTSC are "straightforward",
> but it's definitely not for me :)

As in NTSC just uses different pixel clock and horizontal/vertical sync
rate values...

> I've looked around and it looks like the entire blanking area is
> supposed to be 40 pixels in interlaced, but I couldn't find anywhere how

625 lines - 575[*] visible lines =3D 50 lines.

[*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
     a frame in two fields of equal size.

"visible" is relative, as it includes the overscan region.
Some PAL monitors used with computers had knobs to control width/height
and position of the screen, so you could make use of most or all of
the overscan region, but on a real TV you're limited to ca. 640x512 (on
PAL)  which is what an Amiga used by default (with a 14 MHz pixclock).
> it's supposed to be split between the upper and lower margins and the
> sync period.

"Field Synchronization of PAL System" on http://martin.hinner.info/vga/pal.=
html
shows the split.

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
