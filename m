Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7516A259C
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 21:25:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id o12so31506401lfq.9
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwQzSxEYATvXw39X4hIfByL5axaSJ+hp0GX3dcFg9xE=;
        b=RpM/5T09Rkd7whH1lYSUsRaIYsLxkJ0RHNwjJCSxMK6DXCHNXTKvm/1fd6/rqZteFR
         Rx0Dd96ySW4Ipv/w5BooL5M2xPSrcjrb8u6NBcWH5FYSfZQAuMc7l+4tKtdhQ+GupunV
         QxDrwD5p/mLnrG+XlPTaY3Bs1cduAAinJEmPjaKEHtI6PU/jlh7sqgyaCKUUx4NHkvwe
         gQ7yfcspKa3yD8qwC59MMnhKCEbG5hH4oqDos1yN52iQjO8nTh3HigOQyXj7O5Dbi9ZV
         h8NZhnbLYWMt7sRrzSiuElVjYuCoOb7cJR9nec0Geq3YRRQA9H69XcMHraBJpty9UP+5
         LQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwQzSxEYATvXw39X4hIfByL5axaSJ+hp0GX3dcFg9xE=;
        b=5Q0Wy9QywG3ni0pt9KG4UVG/mUUlaBAj9A60G+IGMfW/wNNm93LsnoZcgVIWuxyUCA
         a+dId0X02dOCUWp7P9aJ0i2eZ91bTKE5UpmrBEDxHaStEVfDM3zR96aGJxXf6cuOVgRj
         5JaCT6ksNqih20zTqOc7qJq3iZuxombLxvkfvc9W5mmxW95qmae82MRho3Lh/V+xChA4
         DoImnas8NHuqO8JWgEIdXNXR9QG3eDugYOeI6FbnIOFXT+5tWzXmi8Vi4Yjb8xR0StDZ
         3ySn6piU+4Ic6o8BJobe2C9+u8esOKqtJvctKMOQlEr2EghrHYDtNF/Slb2iHEfTZXj3
         YNpQ==
X-Gm-Message-State: ACrzQf19UXxzHHpgVzAZ4cU/jylrICUv1Jlwvf4YoIGnqoTjcodeYOYC
	UxP+RwZYoiZimb42K68idsw=
X-Google-Smtp-Source: AMsMyM6ensEOd7HbTbNfYIT/f7EQdTyWIhqe5A2BIVTj3+ujPQdHszK3t50zI7jkiMDMZGau3DPaxg==
X-Received: by 2002:ac2:5b50:0:b0:4af:d01:63d0 with SMTP id i16-20020ac25b50000000b004af0d0163d0mr2786228lfp.596.1666819523402;
        Wed, 26 Oct 2022 14:25:23 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:c898:de98:30b3:a07? ([2a02:a31a:a240:1700:c898:de98:30b3:a07])
        by smtp.googlemail.com with ESMTPSA id p8-20020a2eba08000000b00277041268absm1070023lja.78.2022.10.26.14.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 14:25:22 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <1adf0b0b-3743-4b5a-9416-823b8bf903fa@gmail.com>
Date: Wed, 26 Oct 2022 23:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v6 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Cc: linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-14-e7792734108f@cerno.tech>
Content-Language: pl
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-14-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

> +static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
> +					       struct drm_cmdline_mode *cmd)
> +{
> +	struct drm_display_mode *mode;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
> +		const struct drm_named_mode *named_mode = &drm_named_modes[i];
> +
> +		if (strcmp(cmd->name, named_mode->name))
> +			continue;
> +
> +		if (!named_mode->tv_mode)
> +			continue;
> +
> +		mode = drm_analog_tv_mode(dev,
> +					  named_mode->tv_mode,
> +					  named_mode->pixel_clock_khz * 1000,
> +					  named_mode->xres,
> +					  named_mode->yres,
> +					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
> +		if (!mode)
> +			return NULL;
> +
> +		return mode;
> +	}
> +
> +	return NULL;
> +}
> +

You didn't add tv_mode_specified to struct drm_named_mode, and left the
if (!named_mode->tv_mode) condition here. This will break on NTSC.

Best regards,
Mateusz Kwiatkowski

