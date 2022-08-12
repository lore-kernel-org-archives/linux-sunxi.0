Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7DA1371
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 13:33:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so569746otb.5
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OXdSHuVG78f8K6rpNcMaWPwy/pvmJ+nqUgx8dG2xzfs=;
        b=RZ042pM0+IOKB+cWLPCyVLGdkVx+n80EtkmMN7UoKpfh1O00tArtp45J6UaoU1q5Q0
         Gv4wNtoQVUFt6LWy8RfdX64JqLg9TC0RlCa0ojyl3Wtegw71Jze0p9TREMwI9YGmCF8P
         Elxhl43sXqgWwDdO0cb7/H9jDzhkv8x3YgUK+3lNAvd4wNUh1T84rCpF8f77HpT9K282
         68BfSaoD/xTRE3jiX5nqH277cGH2D80DTdGpyqtNF9fqqUKy2FzROw6ctxK27wSghyHJ
         YFPQJk2NUc5NlcXRcNCfaVQaKWSdjTYgGfkeKD2dBcmFx8HlEiPJLUc33dcjnX6bseaE
         A6zg==
X-Gm-Message-State: ACgBeo10QfHtIinn7P3JSRTbiy5KGseoRci67+1d8L+6YJxjr2uj1skS
	3FC4kZ8gwprW7Kq1wYBcv9pJVPEPzWS5mg==
X-Google-Smtp-Source: AA6agR7OiNalOYe5NrcDMGk2T9uQK+3u8MHKn0ZybXHRoF8wy+jXLpQbU9StqDIvtKz4zvXnssXkHQ==
X-Received: by 2002:a05:6830:9cb:b0:616:a9b5:df50 with SMTP id y11-20020a05683009cb00b00616a9b5df50mr1416267ott.306.1660311222520;
        Fri, 12 Aug 2022 06:33:42 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id i23-20020a9d4a97000000b00616e2d2204csm371691otf.21.2022.08.12.06.33.42
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:33:42 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id j1-20020a4ab1c1000000b0043576bcb9b1so173805ooo.10
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:33:42 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr3307653ybq.543.1660310750947; Fri, 12
 Aug 2022 06:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:25:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Subject: Re: [PATCH v1 07/35] drm/modes: Only consider bpp and refresh before options
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

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Some video= options might have a value that contains a dash. However, the
> command line parsing mode considers all dashes as the separator between the
> mode and the bpp count.
>
> Let's rework the parsing code a bit to only consider a dash as the bpp
> separator if it before a comma, the options separator.
>
> A follow-up patch will add a unit-test for this once such an option is
> introduced.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1819,20 +1819,22 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>
>         name = mode_option;
>
> +       /* Locate the start of named options */
> +       options_ptr = strchr(name, ',');
> +       if (options_ptr)
> +               options_off = options_ptr - name;
> +       else
> +               options_off = strlen(name);
> +
>         /* Try to locate the bpp and refresh specifiers, if any */
> -       bpp_ptr = strchr(name, '-');
> +       bpp_ptr = strnchr(name, options_off, '-');

Probably you still want to add a check that the next character
is actually a digit, cfr. my "[PATCH v2 5/5] drm/modes:
parse_cmdline: Add support for named modes containing dashes"
(https://lore.kernel.org/dri-devel/2eb205da88c3cb19ddf04d167ece4e16a330948b.1657788997.git.geert@linux-m68k.org)?

>         if (bpp_ptr)
>                 bpp_off = bpp_ptr - name;
>
> -       refresh_ptr = strchr(name, '@');
> +       refresh_ptr = strnchr(name, options_off, '@');
>         if (refresh_ptr)
>                 refresh_off = refresh_ptr - name;
>
> -       /* Locate the start of named options */
> -       options_ptr = strchr(name, ',');
> -       if (options_ptr)
> -               options_off = options_ptr - name;
> -
>         /* Locate the end of the name / resolution, and parse it */
>         if (bpp_ptr) {
>                 mode_end = bpp_off;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
