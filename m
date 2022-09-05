Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A33C02
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 16:44:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id z29so13772386lfb.13
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=pg/PAiNvnu7vtuOyQRQ/USUHgpjKV+PX2R3Qe58I9a8=;
        b=gpdNZAEDxje8wnITyn+RZoWmy+HDFnOquwNGCkPFH4u26oFe9BJkGsChjuvli+EpUC
         udG041BUDBCsixXiASZMPopuq5kkYgAZ75M5qx/664s54esc8z1HhBFqbN3K9kHPpL1i
         /c/k2keYZOCrifzS9i3Jol3/Ys8sNIUeajA/nxV7uULUR3TcQoLuptOLB6RGc/f719/2
         O/X4incruiAcIvG6rSJmQeWED2QziZfV7nNN+Xw4npnDsDvap4T4VaB6gU99RsKT0/sK
         ObY9ODTZh1llvOmzGkvb7+zUE3IWaTV/TsOIDkNGg6kHEUV4Ijytw/jtF/wsnn40KB7l
         WmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=pg/PAiNvnu7vtuOyQRQ/USUHgpjKV+PX2R3Qe58I9a8=;
        b=7TJ4JHccDgm+YKonLehdSS5mEPGSpEV7VyBIQEJyJxtLOlR//pqXWB0fgegYOJEpXv
         0EVfznP8z/23ybKxYCT+CE6gPs8hYCRKKzEeOJPnHF7vRNig6sMP8LpIFkmPUNtMwF0p
         1ghqHBRqdvRpOIbLfidPq5giUvqxiKHZn13jos1A8SKq4KWbrKvB0FS6DcmV16z9u/72
         lJc1StKsDasN0dI1iqr5oWHEqHFbyXvgq2PwZ0EknDWnb2TcfTvbSuPTPnD/bd75gA90
         D4yaEjH2UKU1LwrTX1re4c84UryIHMN8ubU2/yWhzNTEqIzLOM+gDQfyaFBu/Uy2HSrG
         pIZQ==
X-Gm-Message-State: ACgBeo242k2A+3hk/suY0Oez6TlId+d3uvf80nXJMIZC674768NvNHZY
	2KbmPBTl9YIBRmTaVg64tJA=
X-Google-Smtp-Source: AA6agR5QgKJH0v/+7sAguBYeCvG9a+g/CeSbeIITanudZorCWC9+TludMawIYPfRu4Xh0pTJ0sIw1w==
X-Received: by 2002:a05:6512:ba2:b0:494:6d93:e9ee with SMTP id b34-20020a0565120ba200b004946d93e9eemr11762898lfv.378.1662396285601;
        Mon, 05 Sep 2022 09:44:45 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852? ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
        by smtp.googlemail.com with ESMTPSA id q5-20020a2eb4a5000000b0025e59f125fbsm1469514ljm.53.2022.09.05.09.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:44:45 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
Date: Mon, 5 Sep 2022 18:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
In-Reply-To: <20220905133755.gcmmntg3wnecyqjq@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

W dniu 5.09.2022 o 15:37, Maxime Ripard pisze:
>>> +    vfp = vfp_min + (porches_rem / 2);
>>> +    vbp = porches - vfp;
>>
>> Relative position of the vertical sync within the VBI effectively moves the
>> image up and down. Adding that (porches_rem / 2) moves the image up off center
>> by that many pixels. I'd keep the VFP always at minimum to keep the image
>> centered.
>
> And you would increase the back porch only then?

Well, increasing vbp only gives a centered image with the default 480i/576i
resolutions. However, only ever changing vbp will cause the image to be always
at the bottom of the screen when the active line count is decreased (e.g.
setting the resolution to 720x480 but for 50Hz "PAL" - like many game consoles
did back in the day).

I believe that the perfect solution would:

- Use the canonical / standard-defined blanking line counts for the standard
  vertical resolutions (480/486/576)
- Increase vfp and vbp from there by the same number if a smaller number of
  active lines is specified, so that the resulting image is centered
- Likewise, decrease vfp and vbp by the same number if the active line number
  is larger and there is still leeway (this should allow for seamless handling
  of 480i vs. 486i for 60 Hz "NTSC")
- If even more active lines are specified, once the limit for vfp is hit, then
  decrease vbp only - the resulting image will definitely be off-center, but
  there's no other way

I hope this makes sense for you as well.

Best regards,
Mateusz Kwiatkowski
