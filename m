Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A6625
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 10:12:11 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id g21so8004172qka.5
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 03:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B6sPmfOEwPF2h7f07mGfudT4aQe+F6kN6ETICFIZHMY=;
        b=LSQhD6x6QZzw/PAiwIibjVWFRkIKWwNVU1lQiGhxBL7CFfgmfuQRh6xuxpGM1xPTLc
         64bpJK1ZGolzCyf2/tB8cAJUSpmYnhnjrVuYbsUQUdiwa+TTUxY7paQqhePTVI7ctYyi
         Jo9a6+qfdzCxBF07pmNoMnIjyCTj/TbJKe6r9eQYuTpsfZw9FHs7gv+STwAhGDmlFJP+
         j8z7fIyBEg1qJ8lsC2a+w+1XsB/u33HHIT0ut6KegvtbveoUvJ5ekmcWGrsZJ/DKjdn/
         rEuCppKItIP6NWGhAIuXNgz/jR+jcOw1x5IFusMaqk57DLTSO0hEaH7mADIz+GJVd6B3
         DovQ==
X-Gm-Message-State: ACgBeo3HIEMVNcvJOa96PZqjWWoGbbJ4MB89pNSAgd85cCetEvy68xXc
	kOJxp5AL77p6j7zSA2140xG9SIzhmfp9PQ==
X-Google-Smtp-Source: AA6agR743sGJdaRNNON+hJsWoSktjv2M2Co1wf2qdeSo/lrmui18312OdV3s32ztchi8KT/BsOaaMg==
X-Received: by 2002:a05:620a:40d5:b0:6bb:208:93d3 with SMTP id g21-20020a05620a40d500b006bb020893d3mr11344216qko.223.1661854330405;
        Tue, 30 Aug 2022 03:12:10 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id br13-20020a05620a460d00b006bad20a6cfesm8055835qkb.102.2022.08.30.03.12.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 03:12:10 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3376851fe13so260978157b3.6
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 03:12:10 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr10033148ybl.604.1661854027231; Tue, 30
 Aug 2022 03:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech> <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2022 12:06:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Message-ID: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, 
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
	linux-sunxi@lists.linux.dev, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1909,6 +1909,9 @@ void drm_connector_list_update(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_list_update);
>
> +#define STR_STRICT_EQ(str, len, cmp) \
> +       ((strlen(cmp) == len) && !strncmp(str, cmp, len))

This is not part of the move, but newly added.

> +
>  static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
>                                       struct drm_cmdline_mode *mode)
>  {
> @@ -2208,6 +2211,52 @@ static const char * const drm_named_modes_whitelist[] = {
>         "PAL",
>  };
>
> +static int drm_mode_parse_cmdline_named_mode(const char *name,
> +                                            unsigned int name_end,
> +                                            struct drm_cmdline_mode *cmdline_mode)
> +{
> +       unsigned int i;
> +
> +       if (!name_end)
> +               return 0;

This is already checked by the caller.

> +
> +       /* If the name starts with a digit, it's not a named mode */
> +       if (isdigit(name[0]))
> +               return 0;
> +
> +       /*
> +        * If there's an equal sign in the name, the command-line
> +        * contains only an option and no mode.
> +        */
> +       if (strnchr(name, name_end, '='))
> +               return 0;
> +
> +       /* The connection status extras can be set without a mode. */
> +       if (STR_STRICT_EQ(name, name_end, "d") ||
> +           STR_STRICT_EQ(name, name_end, "D") ||
> +           STR_STRICT_EQ(name, name_end, "e"))
> +               return 0;

These checks are not part of the move, and should probably be added
in a separate patch.

> +
> +       /*
> +        * We're sure we're a named mode at that point, iterate over the
> +        * list of modes we're aware of.
> +        */
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
> +               return 1;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -2244,7 +2293,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>         const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
>         const char *options_ptr = NULL;
>         char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
> -       int i, len, ret;
> +       int len, ret;
>
>         memset(mode, 0, sizeof(*mode));
>         mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> @@ -2285,17 +2334,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>                 parse_extras = true;
>         }
>
> -       /* First check for a named mode */
> -       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -               if (ret == mode_end) {
> -                       if (refresh_ptr)
> -                               return false; /* named + refresh is invalid */
>
> -                       strcpy(mode->name, drm_named_modes_whitelist[i]);
> -                       mode->specified = true;
> -                       break;
> -               }
> +       if (mode_end) {
> +               ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
> +               if (ret < 0)
> +                       return false;
> +
> +               /*
> +                * Having a mode that starts by a letter (and thus is named)
> +                * and an at-sign (used to specify a refresh rate) is
> +                * disallowed.
> +                */
> +               if (ret && refresh_ptr)
> +                       return false;
>         }
>
>         /* No named mode? Check for a normal mode argument, e.g. 1024x768 */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
