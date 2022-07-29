Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287084C77
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Jul 2022 18:12:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id f20so1256123lfc.10
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Jul 2022 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
        b=nKEbCpTn4ES338fo/oL+ZxbpzekkKK2V0nZCrR8D9coR5pJNycc5h9KHT3bd8XeneQ
         vPSuxtMcHwyAfCbOMCvpReAOZt0imu43u+fzDy1KqhXerbTrgMa2PFQ/1EM3YFWwnm20
         n+Pay0YAcn5etX+RhQMrfN2166BiRYs1f6LlxnUIgqQA17G+U4KzPhZlOZpPSwW9yDJc
         VqmOVvoVheAn8/IAIy+SueUv7yI1jmne/GlQE11VSytvv8R0SJvtANTgFeVKRxqOoG8P
         pbs6XpbiFip7/U/Ms8xoVcdMPVTz11kQDSLw9cyGEAoUlwClryZRDsAT/7eUJXB0Enty
         p/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
        b=SlphMOzBVqcr8BLzu3GQQc8OiGaK1dGyluvT0vrMw0hFtR1O73BhJD7521eQGGoMhI
         EuF+nJ7FwrGRK5Gz+Lu7a9hjOQ5T5i6lDseVyWcUfEWBlJJzZVeXPH5hKGbAX3ijdKpM
         6FFMoWav/rh80cZq7jWCk2HDg2dx6/o8yP72GoCxrZWxon9cR4irWJYdmeASAFGuJZVH
         WyK7wcsUMUBc2LaJBKTnaBqKfPC7OsgZNmbzSpnQBT/G+EmZOyVhfPvKsNsfsecbJHXc
         +5BWxZHZar3rw0C8LOmEgeXUAnOcraGPXfuCrWD59usAFu8lXNAOEdRMp5Y0nDxmU/jf
         pCRw==
X-Gm-Message-State: AJIora9UJWmjJfSGBfeVVfuMsK9b6ZTt37vwLBo2CvQztSHR+txHbbE2
	9NKqTLMWmiAy+oFHTZQUcLA=
X-Google-Smtp-Source: AGRyM1tGTdtn7I/aNBel79an2DZRtTumSuY2b+SFhmNnAAQda14q5JmpFf7rHUQ5FfW3XCUPU7bjZw==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id bq33-20020a056512152100b0048a3c5d5d17mr1600643lfb.587.1659118331035;
        Fri, 29 Jul 2022 11:12:11 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs370360.centertel.pl. [37.47.77.249])
        by smtp.googlemail.com with ESMTPSA id p3-20020a2e7403000000b0025e0b9ea91csm731173ljc.84.2022.07.29.11.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 11:12:10 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0e285cf5-6ef2-3484-9fb7-5eb55c0ca269@gmail.com>
Date: Fri, 29 Jul 2022 20:12:07 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

I'm just noting that the modelines you defined in drm_modes.c are 
different to the ones you're removing here.

The horizontal sync differences probably doesn't matter too much, VC4 
uses those only as a hint anyway and generates sync autonomously, so the 
slight differences will only cause the image to slightly shift horizontally.

But you're also changing the 480i vertical sync (vsync_start is now 488 
instead of 487, etc.). Are you sure that this won't break anything? This 
will probably shift the image by 1 line (which for the 480i might 
actually mean going out of spec), and I _think_ it might control the odd 
vs. even field first modes on some drivers. I won't be able to test this 
before Monday, but I'm just pointing out the potential issue.

BTW, I've seen a similar thing in the sun4i driver changes (patch 32/35) 
and the differences in vertical sync are even more dramatic. It's 
entirely possible that the current timings in sun4i are broken and the 
new ones are correct (the new ones certainly look saner to me), but I'd 
double-check if that driver does not have any quirks that would 
_require_ such weird settings.

Best regards,
Mateusz Kwiatkowski

W dniu 29.07.2022 o 18:35, Maxime Ripard pisze:
> Now that the core has a definition for the 525 and 625 lines analog TV
> modes, let's switch to it for vc4.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 8f30a530b2d5..255bba563fce 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -224,38 +224,24 @@ static const struct debugfs_reg32 vec_regs[] = {
>   	VC4_REG32(VEC_DAC_MISC),
>   };
>   
> -static const struct drm_display_mode ntsc_mode = {
> -	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
> -		 480, 480 + 7, 480 + 7 + 6, 525, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
> -static const struct drm_display_mode pal_mode = {
> -	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
> -		 576, 576 + 4, 576 + 4 + 6, 625, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
>   static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>   	[VC4_VEC_TV_MODE_NTSC] = {
> -		.mode = &ntsc_mode,
> +		.mode = &drm_mode_480i,
>   		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_NTSC_J] = {
> -		.mode = &ntsc_mode,
> +		.mode = &drm_mode_480i,
>   		.config0 = VEC_CONFIG0_NTSC_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_PAL] = {
> -		.mode = &pal_mode,
> +		.mode = &drm_mode_576i,
>   		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_PAL_M] = {
> -		.mode = &pal_mode,
> +		.mode = &drm_mode_576i,
>   		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>   		.custom_freq = 0x223b61d1,
>

