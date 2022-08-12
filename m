Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F541371
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 13:38:06 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id x5so746657qtv.9
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6vlKlfYZ8UUr42Z0Ey6Sidm4mVEyWELk9h2eYr+jvz0=;
        b=IArKmqR1Eg5xd6ggV15mS0FEENM2CBw9FaKqT0S/9Emat22WPEgNm//BQsrcEM5+Qq
         1v0CslGCpAlmNFNa5jhIivxWmK+2ITv0Q3WL70b6g5Pa32SlOB94QSOhmzPDolrpBbXz
         4rJzJ+m2zyPcfd0pzSUDrlrU7aGYnAjSfXNUC2YrPPCiLA82I0L3as7m7w+dU+27N/yC
         G/YkR20s5VupMajmvoXAROWvUaLexSmWIEBmKLRbC5yf9BGh4ScNZvOM2RQTTVfiVJnh
         CXwv8YMfFCi6Agf1PXf/KQgmmxZ8yodqS11D5U8UcWBcmgjXgDuWBPN/Gm4eqWvRIEjC
         6pVg==
X-Gm-Message-State: ACgBeo3PynfUw1I7bHpNzek8mHfln1EdnHFKZUJdb6Bc6C/o1Z2oMIa9
	ruqNEp5AAp0z1HRPICjY0GdK6NmHI7irxg==
X-Google-Smtp-Source: AA6agR4nSaEh4H98ZpEIjQo4+tALYI+FEJIq0+t0m0fYp2U1L0x0geUUrE/GcvJkKV25iMEDc3Q01g==
X-Received: by 2002:a05:622a:190f:b0:343:5aa8:5538 with SMTP id w15-20020a05622a190f00b003435aa85538mr3467166qtc.445.1660311485626;
        Fri, 12 Aug 2022 06:38:05 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id l18-20020a37f912000000b006b5fe1c376fsm1700444qkj.131.2022.08.12.06.38.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:38:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 199so1502976ybl.9
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:38:05 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr3814535yws.47.1660311090509; Fri, 12 Aug
 2022 06:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:31:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Fri, Jul 29, 2022 at 6:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Our new tv mode option allows to specify the TV mode from a property.
> However, it can still be useful, for example to avoid any boot time
> artifact, to set that property directly from the kernel command line.
>
> Let's add some code to allow it, and some unit tests to exercise that code.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1677,6 +1677,80 @@ static int drm_mode_parse_panel_orientation(const char *delim,
>         return 0;
>  }
>
> +#define TV_OPTION_EQUAL(value, len, option) \
> +       ((strlen(option) == len) && !strncmp(value, option, len))
> +
> +static int drm_mode_parse_tv_mode(const char *delim,
> +                                 struct drm_cmdline_mode *mode)
> +{
> +       const char *value;
> +       unsigned int len;
> +
> +       if (*delim != '=')
> +               return -EINVAL;
> +
> +       value = delim + 1;
> +       delim = strchr(value, ',');
> +       if (!delim)
> +               delim = value + strlen(value);
> +
> +       len = delim - value;
> +       if (TV_OPTION_EQUAL(value, len, "NTSC-443"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_443;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-J"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_J;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-M"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_M;

[...]

You already have the array tv_norm_values[] from "[PATCH v1 05/35]
drm/connector: Add TV standard property". Can't you export that, and
loop over that array instead?

> +       else if (TV_OPTION_EQUAL(value, len, "HD480I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD480P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD720P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD720P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD1080I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD1080I;

The names in tv_norm_values[] use lower-case, while you use upper-case
here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
