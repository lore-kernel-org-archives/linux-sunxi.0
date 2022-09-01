Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56A2577
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Sep 2022 22:46:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p7so833780lfu.3
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Sep 2022 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=j9JPtLXuGOAthdbqCGaZBEMPKdA+qziCC+Oox2WhyWE=;
        b=KeZRTpmg+yfKKrQlCWb6p9FCrXOfw+fAObK0nGPdoQQEB9jXrfaidZettyBeWa3nIV
         cOJHlY1O1waPz+lWUwvlk6O1GTp1OgOoT3QMrLYrtRNgSiZe8oO/nj9ihZAFKUeShrKo
         eZzD5wo3kchE7FbSnMJJSNSc7SkMe/AwUN2hrEx5QlHXysXfWa8bbvhaVxtr++E3utU8
         P+QAzv5pgUgN+NVWi9HJbQVusoZd5if6AUN8zXlSTRHzLJR2+7BUcjx9J4NDI6K0uoTC
         /2TNVxNYQTq15lTo5xELyjfNMDWWt1snAGJlPXjRN6aivFyUt5+admL+PKyoAO6TBUOA
         yy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=j9JPtLXuGOAthdbqCGaZBEMPKdA+qziCC+Oox2WhyWE=;
        b=HNTOfpKlNU5lMdm1UneK+RzpbMH10MbAPKBqPz/qLnpQBPwsJ0UVHm65Zx/63Nhqne
         +DqmcaDH9Kx1u9N6cmeG0zZHa5H6zAbqYaPU65LTz5ogvlPlHOHNNz6nU2VvRamHePBm
         GSLxxkhZ2zF3mWfUHo4Mv0JW9RtVeiTpXwAeurtpfuNmiGtQiTXKXCGkKlhJ0XlOB2BQ
         L/a5q+PNZ8uEKo6XZMA1CdC+TyEKOowqR2Ulphz1QjVI97YT9TEUN05Zm3NcoV8tXi+J
         1k2tBijKRE2YLEE2UXTxv6PH6uA7K67ZBYRVwHZm9AowqbPrCwLJhX2hnd2RNpGwW7RA
         miuw==
X-Gm-Message-State: ACgBeo0CBzAPBgKr3dq+n8RE2O/wWz2gBJKqV2Wrh2aqW6ZulA4x8ZM7
	jvQ3IJnVknlEwY/KUaHDhls=
X-Google-Smtp-Source: AA6agR4DDf2sl/p3w9svbMNnoZK7uBdh14I0I0N23iu/YSRY24vtSyAPu3BWH8/9FpD2KRu1t1XcVA==
X-Received: by 2002:a05:6512:10c4:b0:492:d006:2b13 with SMTP id k4-20020a05651210c400b00492d0062b13mr11967803lfg.398.1662072392749;
        Thu, 01 Sep 2022 15:46:32 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852? ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
        by smtp.googlemail.com with ESMTPSA id u25-20020a056512041900b00492d6ae2386sm29410lfk.96.2022.09.01.15.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 15:46:32 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <2f607c7d-6da1-c8df-1c02-8dd344a92343@gmail.com>
Date: Fri, 2 Sep 2022 00:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 19/41] drm/modes: Introduce the tv_mode property as a
 command-line option
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-19-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-19-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

> @@ -2212,20 +2239,22 @@ struct drm_named_mode {
>      unsigned int xres;
>      unsigned int yres;
>      unsigned int flags;
> +    unsigned int tv_mode;
>  };

Are _all_ named modes supposed to be about analog TV?

If so, then probably this structure should be renamed drm_named_analog_tv_mode
or something.

If not, then including tv_mode in all of them sounds almost dangrous. 0 is a
valid value for enum drm_connector_tv_mode, corresponding to
DRM_MODE_TV_MODE_NTSC_443. This is a very weird default (maybe it shouldn't be
the one that has a numeric value of 0?) and if there ever is a named mode that
is not related to analog TV, it looks that it will refer to NTSC-443.

Not sure where could that actually propagate, and maybe what I'm saying can't
happen, but I'm imagining weird scenarios where a GPU that has both a
VGA/HDMI/whatever output, and a composite output, switches to NTSC-443 on the
composite output by default because a named mode for the modern output is
selected.

Maybe something like DRM_MODE_TV_MODE_NONE = 0 would make sense?

Maybe not. This is not an actual suggestion, just "thinking out loud".

Best regards,
Mateusz Kwiatkowski
