Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037D7F
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 17:34:18 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id b18so11472396ljr.13
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4iSKyq/6RLyBw4TdJevIeK6LIwDkSY3maF+UHfhRrc=;
        b=Kb3uE39EqEeKXPUs/mXs6k65peycq9pdE/WXMK4E2BFk1YiAINvgg+vkC0YAaXyJnp
         VK5A3ChSRZG1GvlLyiVqIqR5FOG7BypHyXE38dY0/pytGejDjoy1MFeH0Fv01/KdamSk
         dZEaHlsAJAeQjNRCuzfXMbSHy6BItSb+Zs8ov21H6w0Gj+ByuPNU/m8dOTkEA+lrlBqH
         rF6WY3dsgRh0pnnkPbOdwVIrSy3hXsXiHkPJQJdUs7ysttYGu0er+okgYgRjQTy+uLr5
         dPyr+xyJy5N4rXlgSGh7/EXSDczjfBivOJ82p8PRq8ByRq2YVEecIGSpp222OndxdRHd
         XoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4iSKyq/6RLyBw4TdJevIeK6LIwDkSY3maF+UHfhRrc=;
        b=ZuEfEegFH2Ad9QrMEiAPARBOOIhFC5XLo8RetUEg+1G/CuRsQm5D4086o7a/xF2KfD
         Q5U186ptS+9L8zLLDVp0gKl1UB2LsPv73UNgvJmaUIDS0+GjIJIZrP1mGtoii6MTTwBw
         H2HnWklfbCUOy1NyV1rIUcdRufa52Ggdb/SWM+SKMD8gKdb4YYpIWADKFf3FKyy6OWWF
         y2XfQjyqolHdzGykX6/6aqjau3lWDLsx9jli25BpFUS/94Rvk+FMi43HpqJ0yx6kgn06
         ZN+a4BnNMyol2fAHXhTfnpbFjm6rH0EmjU9o8kc5j9pYtmAforqd08WaZLLCpQJy140M
         A44A==
X-Gm-Message-State: ACrzQf1HSshjFe2BmRDlfOmDDdgZRHH6uAYw2IHpWZGt2SBsh2bvfiFf
	75+g1NdIrZjCLP2TcPz/E7A=
X-Google-Smtp-Source: AMsMyM4FwFL8YTyWV0uuDmptwQ58R53jPCOYdbjm/t3gf92/x+NDTiDZK/HMDmSdTIkPCQ0ey+Q6jw==
X-Received: by 2002:a05:651c:114:b0:26f:a696:5a40 with SMTP id a20-20020a05651c011400b0026fa6965a40mr2909134ljb.350.1665941656107;
        Sun, 16 Oct 2022 10:34:16 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0? ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
        by smtp.googlemail.com with ESMTPSA id v23-20020ac258f7000000b0048a8586293asm1131359lfo.48.2022.10.16.10.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 10:34:15 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <30dbbcc8-1d14-0fc8-ed7c-0c3f7d094ea3@gmail.com>
Date: Sun, 16 Oct 2022 19:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Reply-To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v5 06/22] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Phil Elwell <phil@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-6-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-6-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime & everyone,

Sorry for being inactive in the discussions about this patchset for the last
couple of weeks.

> +const static struct analog_parameters tv_modes_parameters[] = {
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,
> +			  NTSC_LINES_NUMBER,
> +			  NTSC_LINE_DURATION_NS,
> +			  PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,
> +				      NTSC_HACT_DURATION_TYP_NS,
> +				      NTSC_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,
> +				      NTSC_HFP_DURATION_TYP_NS,
> +				      NTSC_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,
> +				      NTSC_HSLEN_DURATION_TYP_NS,
> +				      NTSC_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,
> +				      NTSC_HBP_DURATION_TYP_NS,
> +				      NTSC_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,
> +				      NTSC_HBLK_DURATION_TYP_NS,
> +				      NTSC_HBLK_DURATION_MAX_NS),
> +			  16,
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(16, 17)),
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,
> +			  PAL_LINES_NUMBER,
> +			  PAL_LINE_DURATION_NS,
> +			  PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,
> +				      PAL_HACT_DURATION_TYP_NS,
> +				      PAL_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,
> +				      PAL_HFP_DURATION_TYP_NS,
> +				      PAL_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,
> +				      PAL_HSLEN_DURATION_TYP_NS,
> +				      PAL_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,
> +				      PAL_HBP_DURATION_TYP_NS,
> +				      PAL_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,
> +				      PAL_HBLK_DURATION_TYP_NS,
> +				      PAL_HBLK_DURATION_MAX_NS),
> +			  12,
> +
> +			  /*
> +			   * The front porch is actually 6 short sync
> +			   * pulses for the even field, and 5 for the
> +			   * odd field. Each sync takes half a life so
> +			   * the odd field front porch is shorter by
> +			   * half a line.
> +			   *
> +			   * In progressive, we're supposed to use 6
> +			   * pulses, so we're fine there
> +			   */
> +			  PARAM_FIELD(3, 2),
> +
> +			  /*
> +			   * The vsync length is 5 long sync pulses,
> +			   * each field taking half a line. We're
> +			   * shorter for both fields by half a line.
> +			   *
> +			   * In progressive, we're supposed to use 5
> +			   * pulses, so we're off by half
> +			   * a line.
> +			   *
> +			   * In interlace, we're now off by half a line
> +			   * for the even field and one line for the odd
> +			   * field.
> +			   */
> +			  PARAM_FIELD(3, 3),
> +
> +			  /*
> +			   * The back porch starts with post-equalizing
> +			   * pulses, consisting in 5 short sync pulses
> +			   * for the even field, 4 for the odd field. In
> +			   * progressive, it's 5 short syncs.
> +			   *
> +			   * In progressive, we thus have 2.5 lines,
> +			   * plus the 0.5 line we were missing
> +			   * previously, so we should use 3 lines.
> +			   *
> +			   * In interlace, the even field is in the
> +			   * exact same case than progressive. For the
> +			   * odd field, we should be using 2 lines but
> +			   * we're one line short, so we'll make up for
> +			   * it here by using 3.
> +			   *
> +			   * The entire blanking area is supposed to
> +			   * take 25 lines, so we also need to account
> +			   * for the rest of the blanking area that
> +			   * can't be in either the front porch or sync
> +			   * period.
> +			   */
> +			  PARAM_FIELD(19, 20)),
> +};

Nit: setting vbp limits like that makes it impossible to use
drm_analog_tv_mode() to generate modes that include the VBI for e.g. emitting
teletext.

This probably doesn't matter, as it can still be created as a custom mode from
userspace, hence I'm mentioning it as a nit.

> +		 * By convention, NSTC (aka 525/60) systems start with

Typo: s/NSTC/NTSC/

Best regards,
Mateusz Kwiatkowski

