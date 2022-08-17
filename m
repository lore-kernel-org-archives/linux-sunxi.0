Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAE4404
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 14:04:39 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id m17so1010370qvv.7
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 07:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4dcyblUn3bURjZBjn5VOr+f2Wy5bXXXMGqJEHlnVqeg=;
        b=Mxmmi8tCLDLxTPEPdJt51oYXPtEqsPL1HaxSH2NZ0S41nUQEpzl2l9l2qI1aJJ2scl
         pN1XUE8QjW/zL9c6DtiYtXx1k+kObJ10IzzHbYwR2518B9MSSWSby28Kr0K3N3xsU52t
         r+AfgsRHBGnpiRpSG0fTwDGBZLGrb2zCvUlhEV9SRxmvZAvvCUB0QlxFQsXhGLLB6UZs
         vhBoK042fFCPdmUIycuNz0wIPAar6C2RfBY4GY2Yvgs9t2krUtAF8iyKQjss1zGaB6VM
         uNg2rItzf4S8rSQahLP20REZewYH7aUQwLbpMf2dZbLk8/mAesu7HdnPlklKaMtIQze6
         R5tQ==
X-Gm-Message-State: ACgBeo2XIy8luosuAB5pK+YiQOOuSibZfUT/lmDSyt0THiLkZC+TEIop
	da6WbSG/x3csx/N0gJXtAvwtYQKdxZBHhA==
X-Google-Smtp-Source: AA6agR5TZmV9JDBepdmeeQMWzNhwvYTxRyFxlpk5hqXTTldNn87mOk0J/UmyG3XeDiKM5zorw19n/g==
X-Received: by 2002:ad4:5ca4:0:b0:474:9391:4ea5 with SMTP id q4-20020ad45ca4000000b0047493914ea5mr21892686qvh.4.1660745078468;
        Wed, 17 Aug 2022 07:04:38 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 197-20020a3708ce000000b006b95b0a714esm13389763qki.17.2022.08.17.07.04.37
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-324ec5a9e97so233509427b3.7
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr21824312ywp.383.1660745076963;
 Wed, 17 Aug 2022 07:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat> <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
In-Reply-To: <20220817131854.jwmhqvhfhp77bbr3@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:04:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > > > >
> > > > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > >
> > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > >
> > > > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > > > >
> > > > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > > > >
> > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > > > >
> > > > > > > > Above you said "I think the former would make more sense", so that
> > > > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > > > >
> > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > > > >
> > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > >
> > > > > I agree, and I don't see how that command-line doesn't express that?
> > > >
> > > > Oh, I see what you mean: yes, it expresses that.
> > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > > where the TV mode specifies both number of lines and frame rate.
> > >
> > > Only if we're using a named mode, and naming is hard :)
> >
> > That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
> > 625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
> > mode with 525 lines and 30 frames/s.
>
> In that series, "640x480,tv_mode=PAL-N" would be rejected as invalid:
>
> https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech/

It would become supported once the ideas from thread "[PATCH v1 04/35]
drm/modes: Introduce 480i and 576i modes" are implemented...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
