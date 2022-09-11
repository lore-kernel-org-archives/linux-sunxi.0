Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE877F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 04:32:51 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id q21so9664890lfo.0
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Sep 2022 21:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=eJ5+kSvRGx0e5DL23FMmsR32sATG84wn3pUtXfVNfJk=;
        b=UzwIqo7BotutKHABezU/5M4r1hFosIJShwkvIMqCyzl5TtN9VYDKXW7hFWomPhiGph
         Ym1yfhdW374PMwpW1PzT0+GQxyoj0se63YjLGw94N2hSZLa/vT+gtWArl6kk26PLdEw2
         +SlenG2reH47juH0ULuJ70Gf02WSKtrR2KLFtjVbQ9twzPi2bgcpBZrX3OjcKYn0lwXZ
         2IqDSdbK+ycclzRuVBZeW7CMnb3SVXqXzqSEH4jsllcB7PexwSKS4xCFyxDhhOsLsJgl
         RZ8+FTf+kdXOxVD/qjINJ/6P+5NUSOLgod5Ro4JMwXgX7O14od0BP7D0sF5hZAfjpql+
         bhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=eJ5+kSvRGx0e5DL23FMmsR32sATG84wn3pUtXfVNfJk=;
        b=l9YwEf8j8xUPw29kNckdDHMwfzv3ph9VPE6qmIjkzTYwCfPVlQFWcV3VEmuyRbfFrN
         TTR3SLumsPjs0XFSbB7xeJ6VV9qNI03b2pW87auMiuzg74zyblUI5CT7WmqrMg911K//
         XloBluvRLskXQ4bM5sHyzWniwm4E5l20fYT7Yf637FXzwzgDCbCZqkuRZONVmLsJGEK5
         zNFsuQ0PaVWcky3epFijRHB34kwvSnD1nMwBo8fC9M5YyP94w2ttg/WisaspDIemNt9M
         ZXZk7gQ2EaC/cyV4C5+uu94IpizpS9kXG/uNh718eIIBiDl+C3IzVzNl+t0Z1m24ae+U
         gYrA==
X-Gm-Message-State: ACgBeo24ZBr32XlSJdbJWlN7gGVo9EFhL0X6RDGbBUeqiW+zYS5KBpY4
	HstjSGuNwHgKO6dryu3HXQs=
X-Google-Smtp-Source: AA6agR5M1zbvVnaz19qs5aPClS3RbrwZxmnw+bU2659kQnERb5o7G/3kodQNdYL47ha1OqfWKOi8Kw==
X-Received: by 2002:a05:6512:308d:b0:499:bd1a:d1bc with SMTP id z13-20020a056512308d00b00499bd1ad1bcmr1536967lfd.274.1662870770059;
        Sat, 10 Sep 2022 21:32:50 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844? ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
        by smtp.googlemail.com with ESMTPSA id a17-20020a2eb551000000b00261a8e56fe4sm539994ljn.55.2022.09.10.21.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 21:32:49 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <efb2e46d-28be-737c-caa9-5b271523bbbb@gmail.com>
Date: Sun, 11 Sep 2022 06:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
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
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
 <20220907121009.toizfolruuazcrns@houat>
 <6639fb8f-e16c-1ef5-5978-c522f76c8ded@gmail.com>
 <20220909094647.aahohiwtwbbeyzj3@houat>
In-Reply-To: <20220909094647.aahohiwtwbbeyzj3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 9.09.2022 o 11:46, Maxime Ripard pisze:
> On Wed, Sep 07, 2022 at 09:52:09PM +0200, Mateusz Kwiatkowski wrote:
>> W dniu 7.09.2022 o 14:10, Maxime Ripard pisze:
>>> Hi,
>>>
>>> On Fri, Sep 02, 2022 at 12:00:33AM +0200, Mateusz Kwiatkowski wrote:
>>>> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
>>>>> The TV mode property has been around for a while now to select and get the
>>>>> current TV mode output on an analog TV connector.
>>>>>
>>>>> Despite that property name being generic, its content isn't and has been
>>>>> driver-specific which makes it hard to build any generic behaviour on top
>>>>> of it, both in kernel and user-space.
>>>>>
>>>>> Let's create a new bitmask tv norm property, that can contain any of the
>>>>> analog TV standards currently supported by kernel drivers. Each driver can
>>>>> then pass in a bitmask of the modes it supports.
>>>>
>>>> This is not a bitmask property anymore, you've just changed it to an enum.
>>>> The commit message is now misleading.
>>>>
>>>>> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
>>>>> +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
>>>>> +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
>>>>> +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
>>>>> +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
>>>>> +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
>>>>> +};
>>>>
>>>> I did not comment on it the last time, but this list looks a little bit random.
>>>>
>>>> Compared to the standards defined by V4L2, you also define SECAM-60 (a good
>>>> thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
>>>> SECAM-H, SECAM-LC (whatever that is - probably just another name for SECAM-L,
>>>> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTSC).
>>>>
>>>> Like I mentioned previously, I'm personally not a fan of including all those
>>>> CCIR/ITU system variants, as they don't mean any difference to the output unless
>>>> there is an RF modulator involved. But I get it that they have already been used
>>>> and regressing probably wouldn't be a very good idea. But in that case keeping
>>>> it consistent with the set of values used by V4L2 would be wise, I think.
>>>
>>> Ack. What would be the list of standards we'd absolutely need? NSTC-M,
>>> NTSC-J, PAL-60, PAL-B, PAL-M, SECAM-60 and SECAM-B?
>>
>> The "essential list" IMO is NTSC, NTSC-J, NTSC-443, PAL, PAL-M, PAL-N and SECAM.
>> Note that:
>>
>> - I intentionally propose "NTSC", "PAL" and "SECAM" without an ITU system
>>   designation. If we only consider composite signals, there's no difference
>>   between e.g. PAL-B, PAL-D and PAL-I, so it's better to label it as a generic
>>   mode, IMO.
>>
>>   * PAL-M and PAL-N are different, because those unique color encodings were
>>     only ever used with Systems M and N, respectively.
>>
>>   * NTSC-J is also different, because "System J" doesn't exist anywhere in ITU
>>     documents. Japan technically uses System M with a non-standard black level.
>>     But "NTSC-J" stuck as a universally recognized name for that variant.
>>
>> - I intentionally did not list PAL-60 or SECAM-60. TBH... PAL-60 is just
>>   regular PAL paired with 480i60 modeline. Most if not all displays that
>>   accept PAL-60 input will just label it as "PAL". If we are not introducing
>>   strict modeline validation, then maybe separating PAL and PAL-60 isn't really
>>   necessary? Same goes for SECAM vs. SECAM-60.
>>  
>>   ...and same goes for NTSC vs. NTSC-50 a.k.a NTSC-N, which is a very exotic
>>   mode, but known to exist at least in the Atari ST world, see also:
>>   https://en.wikipedia.org/wiki/NTSC#NTSC-N/NTSC50
>>
>> Combining PAL and PAL-60 into a single setting would complicate the vc4 driver
>> a little bit, though, as the registers need to be set up differently for those.
>>
>> My feelings about the PAL-60 issue are not that strong, though. Merging PAL
>> and PAL-60 in this context is just a loose suggestion, I won't even try to
>> argue if you disagree.
>
> Ack
>
>>>>> +/**
>>>>> + * drm_mode_create_tv_properties - create TV specific connector properties
>>>>> + * @dev: DRM device
>>>>> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
>>>>> +
>>>>> + * Called by a driver's TV initialization routine, this function creates
>>>>> + * the TV specific connector properties for a given device.  Caller is
>>>>> + * responsible for allocating a list of format names and passing them to
>>>>> + * this routine.
>>>>> + *
>>>>> + * Returns:
>>>>> + * 0 on success or a negative error code on failure.
>>>>> + */
>>>>> +int drm_mode_create_tv_properties(struct drm_device *dev,
>>>>> +                  unsigned int supported_tv_modes)
>>>>
>>>> supported_tv_modes is supposed to be a bitmask of BIT(DRM_MODE_TV_MODE_*)
>>>> (or (1<<DRM_MODE_TV_MODE_*)) rather than DRM_MODE_TV_MODE_* directly, but this
>>>> is not said explicitly anywhere in this doc comment.
>>>
>>> The argument doc mentions that it's a "Bitmask of TV modes supported
>>> (See DRM_MODE_TV_MODE_*)", how would you improve it?
>>
>> Maybe something like "Bitwise OR of BIT(DRM_MODE_TV_MODE_*) values"? Or maybe
>> just add a little usage example?
>
> This is the way we're usually documenting it in DRM:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L357
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_crtc.c#L861
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_blend.c#L546
>
> So I'd rather keep it consistent
>
> Maxime

Ack, OK then.
