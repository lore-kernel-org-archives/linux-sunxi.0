Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7684434
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 16:03:29 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11c9af8dd3eso1908880fac.10
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 09:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Bxc+m3Zk+4Bct+cVi+3Jt/UsQ5UzvU/3z9/2O8qvP0c=;
        b=ToluGyj3tKByVvWS2Z/mnygOHeqTUtsRwinFnQqtzS0/jz8OagIniBQjGb0rIyxKK6
         iq0vhGJN03VlWjQN8ECDY+iaY2UlINny1e0Y34OK9qAMmHU/QInjg9Ylsg/XArPXPDDV
         YMblNf4C7X+S3mAOHYYJw/prVEl99BIHmx/XNLopCFIe7jCZV5TtISMz/2msmNdQM+TQ
         3RYVPvZA2StEeTbUG2an9XaQRkTqE+hJvehK8GuKJVDS1oIbVN1eI0euhJitAntW9B79
         N31QIvgSxkHkjMn7BBaiqdAaOjfMakHdqPivXZQmEcl3ufWZ3PYekYlj2+unS6rUAdoF
         TAGg==
X-Gm-Message-State: ACgBeo0pI7BmvlHhRh/+8wb+FjA6qhvZvPrungxuAmn3uVqggjRY7LjL
	xJPkeKxQsMFdxWiWQl6nvenswejFs+xvNA==
X-Google-Smtp-Source: AA6agR5G/8DbG15cpZIFhxyQiJOCaH+W5D68IXaGe/7RlZeu5Sz3FygoGbopRT48dRxkktJ8eUay9A==
X-Received: by 2002:a05:6870:4625:b0:fe:4636:cf73 with SMTP id z37-20020a056870462500b000fe4636cf73mr1652852oao.278.1660838608484;
        Thu, 18 Aug 2022 09:03:28 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id p18-20020a4ad452000000b0041ba304546csm384614oos.1.2022.08.18.09.03.28
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 09:03:28 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id c17-20020a4a8ed1000000b004452faec26dso427432ool.5
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Aug 2022 09:03:28 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr3505302ybl.89.1660838207734; Thu, 18
 Aug 2022 08:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat> <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat> <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat> <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
In-Reply-To: <20220818154641.ouvrar5s74qu74zn@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:56:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 5:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > I started adding more sanity checks to my code, and I just realised I
> > > don't seem to be able to reach 720 pixels over a single line though. If
> > > I understood it properly, and according to [1] the active part of a line
> > > is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
> > > in the timing section has pretty much the same numbers, so it looks
> > > sane.
> > >
> > > At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 = 702
> > > pixels
> > >
> > > It seems we can go push it to 52350 ns, but that still gives us only 706
> > > pixels.
> > >
> > > Similarly, if I just choose to ignore that limit and just take the
> > > active time I need, 720 * 74 = 53280ns
> > >
> > > That leaves us 10720ns for the blanking period, and that's not enough to
> > > fit even the minimum of the front porch, hsync and back porch (1.55 +
> > > 4.5 + 5.5 = 11.55us).
> > >
> > > Are those constraints merely recommendations, or am I missing something?
> >
> > You are missing that the parts near the borders of the full image are
> > part of the overscan range, and may or may not be visible, depending
> > on your actual display.
> > The full 768x576 image size from BT.656 is not visible on a typical PAL display,
> > and is more of an "absolute maximum rating", guaranteed to cover more
> > than analog PAL.
>
> So the overscan range is not part of the active area, unlike what HDMI
> is doing for example?

Indeed. DVI-D and HDMI etc. are pure digital (let's ignore they are a
digitized variant of old analog VGA ;-), hence there is a one-to-one
match between pixels in the image and pixels on the screen (ignoring
scaling).  But even when using an analog VGA input on a modern
digital display, you have controls to e.g. move the image.

> Is there some minimal timings available somewhere to fit those absolute
> maximum ratings?

I guess they can be found on the Internet...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
