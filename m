Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA61371
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 13:34:47 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id w129so478332vkg.10
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aaWmraAyVdsxzOKXcrqOwgi0BA7kWyk0fbcE3gB04Gk=;
        b=HIcJaKSPsO4oolpa6jeP0ErYSaynkIr0zRqo7/oQlnlafyicLRiimZQkBfA5dFe59m
         IG7le4IM3TOYdbiFTaSnelokyMROxNz9i+x8j9Jml2a8SvPjH/F8tltOI5gs7Cavt37w
         T8p8MdgaeAwqVGJ4HKH1T+O8DvudGLrJuJrRE9geKkEMVFjo2cViZoaTDtj/UXjuIxRU
         wbJTQSDVzIzN+sKHjJfiInDFpDA3avCf0i/eoPqG09pVHvG0DzqiKdqRPJtMAY6QCG9B
         ICRI7cLUI96DdPYM7frNSm4Zzyr0c3fU3xR65ef5xwRXm+z8CvdSzPMjxnjlLGX5qnBN
         Yvhg==
X-Gm-Message-State: ACgBeo3PKXdHR4qpG68b8ty6rrOWWqX4gKyp9vzi/pKEkInwDUQdEtDh
	WywoAkn4vrfFzF28apCXLtXQ0G3hDf0Ctg==
X-Google-Smtp-Source: AA6agR7PnaCiME4bLR8O49cnBeYJfGHu12KkbBhXy9+fMZ897rJuKQ3ijfYLr8vDpPxtFGpu9YiwxA==
X-Received: by 2002:a1f:a74c:0:b0:379:1113:4f07 with SMTP id q73-20020a1fa74c000000b0037911134f07mr1871502vke.40.1660311285912;
        Fri, 12 Aug 2022 06:34:45 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 5-20020a670805000000b0037ddf9489f2sm1249832vsi.13.2022.08.12.06.34.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:34:45 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id f15so309526uao.12
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 06:34:45 -0700 (PDT)
X-Received: by 2002:a25:da0b:0:b0:67a:7fb6:8ae with SMTP id
 n11-20020a25da0b000000b0067a7fb608aemr3414026ybf.89.1660310848820; Fri, 12
 Aug 2022 06:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:27:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
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

On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
(https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
;-)

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
>         "PAL",
>  };
>
> +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> +                                             unsigned int name_end,
> +                                             struct drm_cmdline_mode *cmdline_mode)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +               int ret;
> +
> +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> +               if (ret != name_end)
> +                       continue;
> +
> +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> +               cmdline_mode->specified = true;
> +
> +               return true;
> +       }
> +
> +       return false;

What's the point in returning a value, if it is never checked?
Just make this function return void?

> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -1848,18 +1870,14 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>                 parse_extras = true;
>         }
>
> -       /* First check for a named mode */
> -       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -               if (ret == mode_end) {
> -                       if (refresh_ptr)
> -                               return false; /* named + refresh is invalid */
> +       /*
> +        * Having a mode that starts by a letter (and thus is named) and
> +        * an at-sign (used to specify a refresh rate) is disallowed.
> +        */
> +       if (!isdigit(name[0]) && refresh_ptr)

This condition may have to be relaxed, if we want to support e.g.
"hd720p@50", cfr. my comments on "[PATCH v1 05/35] drm/connector:
Add TV standard property".

> +               return false;
>
> -                       strcpy(mode->name, drm_named_modes_whitelist[i]);
> -                       mode->specified = true;
> -                       break;
> -               }
> -       }
> +       drm_mode_parse_cmdline_named_mode(name, mode_end, mode);

This call needs to be conditional on mode_end being non-zero, cfr. my
patch "[PATCH v2 1/5] drm/modes: parse_cmdline: Handle empty mode name
part" (https://lore.kernel.org/dri-devel/302d0737539daa2053134e8f24fdf37e3d939e1e.1657788997.git.geert@linux-m68k.org).

>
>         /* No named mode? Check for a normal mode argument, e.g. 1024x768 */
>         if (!mode->specified && isdigit(name[0])) {


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
