Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151927E
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Sep 2022 07:41:21 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-11f11d932a8so2903602fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Sep 2022 00:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=I0BzN+oySEF5bQ4YY03gLnpAlLeJEFGcm1NmTucRGdY=;
        b=mBYdei7qf4A2A8Zne+eqMXO2r9yV4UXF1e/3IEB5ZdMjCxML+VUYEBIonlomSY0cM6
         PHQ9Ru7DsxcItMKC0X22KumGoQjpaKJ7AQqc11I7uEmaoTflACk3dDI+oDjcZYMdU0uu
         bpMH7/0erE6UDWT8TxuNacoXXgWuGhMYugPcUDIuQY7HNHZEvcn9jBX2rmJHQT/kprQJ
         ezzYQ7KWUAIckMsDTTDjzAetg+7RwhINsCvHKTAspgdZktawkE0CkGuXFyEiIFr94FO9
         XK/RBzCjQMlgKTjMIOtbrr4g4ax3kDRbll43QZITmNS5OimhUReIaYG450P3czhkp0wQ
         OvuQ==
X-Gm-Message-State: ACgBeo3P49+Tryw4O62j/ShKsVyUOFrGp1CImOVji77/vOTpk/wvee3y
	6dRMjX4o2Mc3ONdkYWYzk5mGTYKJf5satg==
X-Google-Smtp-Source: AA6agR5HG+8tjaDa99I1TrIcyYimfq9+JTluPWSCKGZFYw7zCqvbsymvnzeXyONpMjWUROIybmlkpw==
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id q40-20020a056808202800b00344246d2bedmr1272494oiw.19.1662104480871;
        Fri, 02 Sep 2022 00:41:20 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id n45-20020a4a9570000000b0044afc1ba91asm428150ooi.44.2022.09.02.00.41.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 00:41:20 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso930305otv.1
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Sep 2022 00:41:20 -0700 (PDT)
X-Received: by 2002:a81:750b:0:b0:341:10ef:2c37 with SMTP id
 q11-20020a81750b000000b0034110ef2c37mr20502429ywc.316.1662104131692; Fri, 02
 Sep 2022 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech> <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
In-Reply-To: <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Sep 2022 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
Message-ID: <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
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

On Fri, Sep 2, 2022 at 12:00 AM Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> > The TV mode property has been around for a while now to select and get the
> > current TV mode output on an analog TV connector.
> >
> > Despite that property name being generic, its content isn't and has been
> > driver-specific which makes it hard to build any generic behaviour on top
> > of it, both in kernel and user-space.
> >
> > Let's create a new bitmask tv norm property, that can contain any of the
> > analog TV standards currently supported by kernel drivers. Each driver can
> > then pass in a bitmask of the modes it supports.
>
> This is not a bitmask property anymore, you've just changed it to an enum.
> The commit message is now misleading.
>
> > +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> > +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> > +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> > +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> > +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> > +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> > +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> > +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> > +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> > +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> > +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> > +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> > +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> > +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> > +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> > +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> > +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> > +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> > +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> > +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> > +};
>
> I did not comment on it the last time, but this list looks a little bit random.
>
> Compared to the standards defined by V4L2, you also define SECAM-60 (a good
> thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
> SECAM-H, SECAM-LC (whatever that is - probably just another name for SECAM-L,
> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTSC).
>
> Like I mentioned previously, I'm personally not a fan of including all those
> CCIR/ITU system variants, as they don't mean any difference to the output unless
> there is an RF modulator involved. But I get it that they have already been used
> and regressing probably wouldn't be a very good idea. But in that case keeping
> it consistent with the set of values used by V4L2 would be wise, I think.

Exactly. Anything outputting RGB (e.g. through a SCART or VGA connector)
doesn't care about the color subcarrier or modulator parts.  Likewise,
anything outputting CVBS doesn't care about the modulator part.

Perhaps "generic" variants of NSTC and PAL/SECAM should be added, which
would really just mean 525/60 resp. 625/50.

Alternatively, the tv_mode field could be split in two parts (either
two separate fields, or bitwise), to maintain a clear separation between
lines/fields versus color encoding and RF modulation (with zero for the
latter meaning a generic version)? That would also keep the door open
for TV_MODE_405_50, TV_MODE_819_50, TV_MODE_750_50, TV_MODE_750_60, ...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
