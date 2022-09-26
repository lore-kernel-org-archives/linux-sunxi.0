Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7287B
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Sep 2022 10:34:15 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id ml1so4055760qvb.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Sep 2022 03:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Lmh1Xq7Cw51uqBYTm5xf2C78YKt/PjveAkuJS0FQxk4=;
        b=NEhCzjRJBluhqylELVW9Q/0JCVf9znIgUoC3bhlopHXaSkH1k+ExgYZO08w+e7kwla
         pDU1q/RCb1IbOxXPBoW+CD5bRF/NFN3MB8rKUKkvfpRmTLDTQV5+02e4JCdI/AOxQV8B
         lG7NerpEAvNKF/ozZn5VskHT2HqLv/bQku0ccf8jP90edZft05HFKqEKoik4EEhlm1jH
         wNib9p3UyfRsYIdcC+TL9+9HeWxUVqDQ3q/vfLJQ8trF3hw7zq2zUlNHamwmffsHaUMJ
         2SIkmA4sUqvznUqZkzSoB13CX6x64vA4PJmyVAKdRImYKJR5dgdyslULGb91a9kvpLqt
         vsIw==
X-Gm-Message-State: ACrzQf3RpfTqNqJRGLUOBmkDaMQXQNH70ehrzWrxc1lKtv4umYVZE9lJ
	M10SJmlPfg6z1KzlwyeXELEtvqvqTzbepg==
X-Google-Smtp-Source: AMsMyM7HLcmdm1+iOVl6vSWldoe2jVhMQ4kGSQlgH1CEoKrFDZMupzb+/gf4rMlJkigMogsL1dS2rg==
X-Received: by 2002:a05:6214:c89:b0:4ac:c6ba:3f22 with SMTP id r9-20020a0562140c8900b004acc6ba3f22mr16291581qvr.9.1664188454001;
        Mon, 26 Sep 2022 03:34:14 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h5-20020a05620a284500b006ce5f4720cdsm11377314qkp.47.2022.09.26.03.34.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:34:12 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-350cb1c0abaso26478687b3.9
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Sep 2022 03:34:12 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr19133647ywc.316.1664188452440; Mon, 26
 Sep 2022 03:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de> <20220926101716.urehomr2lzv5pqln@houat>
In-Reply-To: <20220926101716.urehomr2lzv5pqln@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Sep 2022 12:34:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
Message-ID: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
To: Maxime Ripard <maxime@cerno.tech>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
	David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
	Samuel Holland <samuel@sholland.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>, 
	intel-gfx@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Mon, Sep 26, 2022 at 12:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Sep 23, 2022 at 11:05:48AM +0200, Thomas Zimmermann wrote:
> > > +   /* 63.556us * 13.5MHz = 858 pixels */
> >
> > I kind of get what the comment wants to tell me, but the units don't add up.
>
> I'm not sure how it doesn't add up?
>
> We have a frequency in Hz (equivalent to s^-1) and a duration in s, so
> the result ends up with no dimension, which is to be expected for a
> number of periods?

To make the units add up, it should be 13.5 Mpixel/s
(which is what a pixel clock of 13.5 MHz really means ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
