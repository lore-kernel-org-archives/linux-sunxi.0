Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E31FCC
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 04:07:51 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id u24so492073lji.0
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=lG3KBGxgM0IZ0jal5mxcI9GiPn0tOppPs9EWUxXKMzc=;
        b=EUXkPEtjiOsAOCIESOEqHeNyhWwNegFwwh3Lj8+SDfQogvhW95SYMog+dzO7ZbJlkl
         cnmlffs10Jy62yQ3vsjLGkVxplEH9hCSxi9kEtmnyx+CJSFO4+MKYKXjFvCNrS0EaYrl
         bmagE/DzPD/eD08koEKLBZ66Q/TTC19wW9aW9k6RCKYWgaaBKcmTirXuLrNH60BuPpYk
         wimXNdhDydQARpFtKvG1++3xm4MOOSAyltOgd8bEQywrwEP+7vl6FslX5gvxg8WQZspJ
         ehCG3TToh9lrHtn7KzIr5mPP4gDdPhyUpoUn9ISNB9VaGwkQmf/Lbuj0jOVZAUv0M2SM
         9UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=lG3KBGxgM0IZ0jal5mxcI9GiPn0tOppPs9EWUxXKMzc=;
        b=7EZpmCNa+xqCM6KK6WPun/Jb7OedI+D51P0lvI8UTjENr3Yno33JQeLfFg2pIukapW
         QJzbvqoh2qqv/rHdyzSY7AzS0RybtGM3PnkAfr9KZaT/0g4KeD0547qqR39PRzBveuTL
         YpLfSPvnH4pUp1Pw6oBXqL0wcSa4Or0hVMETFw+n55KfCTyKs11SC0G1IrHr0q3kWvxl
         mv+LSqOyVizZrJgQrp7aVtUDbRiTn6O5tQzszQjXe+R0t0U9vQQ5GbaOujd0yCCOK36t
         CBRPQirIBC571DIEk9cNRFELCWWmJeNiyOG1cmA4tLpxWwjsAFzD5AAftp4Rv73RKeH8
         hk/g==
X-Gm-Message-State: ACgBeo0QGV58pvMtIKbchT2DxNWPaqxqVYTtpo8H7KO7SmOlBOhiZSUW
	WlhzOru0U4qMPcpyS/HSH2A=
X-Google-Smtp-Source: AA6agR6KtaCESfzpTHDLkoCDLh4paQXM/kfy5jk3CTr71K94Vrr2wmpHWobsZfb+FPRxr4a/5jN0Jw==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr1851650ljp.500.1661486870019;
        Thu, 25 Aug 2022 21:07:50 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:7563:5c5e:5903:bdb? ([2a02:a31a:a240:1700:7563:5c5e:5903:bdb])
        by smtp.googlemail.com with ESMTPSA id k8-20020a2ea268000000b0025e304903f5sm264075ljm.6.2022.08.25.21.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 21:07:49 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
Date: Fri, 26 Aug 2022 06:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
In-Reply-To: <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime, Noralf and everyone,

Just as a quick update. I isolated the issue to the power management subsystem.
Unfortunately I know very little about the power management subsystem so
I don't think I can help.

There are two alternative dirty ad-hoc hacks that get things working.

- Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
- Reverting this PR by Dom Cobley a.k.a. popcornmix:
   https://github.com/raspberrypi/linux/pull/4639

Either of these approaches makes VEC mode switching work again. Obviously
neither is appropriate for a permanent solution.

I tried some random code permutations that came to my mind, like using the
vc4_encoder callbacks (e.g. post_crtc_powerdown) instead of the standard
enable/disable encoder callbacks, but to no avail.

Since the clocks and power management seem to be delegated to the firmware now,
my guess is that this might be a firmware issue, but I can't really check all
the firmware versions. It certainly crashes on the version currently available
in Raspberry Pi OS repos, and on this one:
https://github.com/raspberrypi/rpi-firmware/commit/4dde751. My Pi4 doesn't boot
using any newer firmware, at least not from USB - I might try some SD card
after the weekend.

Best regards,
Mateusz Kwiatkowski

W dniu 25.08.2022 o 18:17, Mateusz Kwiatkowski pisze:
> Hi Maxime,
>
> W dniu 25.08.2022 o 17:55, Maxime Ripard pisze:
>> Hi Mateusz,
>>
>> On Mon, Aug 22, 2022 at 10:57:26AM +0200, Mateusz Kwiatkowski wrote:
>>> Hi Maxime,
>>>
>>> I tried testing and reviewing your changes properly over the last weekend, but
>>> ultimately ran into this ("flip_done timed out" etc.) issue and was unable to
>>> mitigate it, at least so far. This seems to pop up every time I try to change
>>> modes in any way (either change the TV norm, or just try doing
>>> "xrandr --output Composite-1 --off" followed by bringing it back on; it also
>>> means that the Pi goes unusable when the DE's screen saving routine kicks in).
>>>
>>> I'm using a Pi 4, and it works with the rpi-5.13.y branch
>>> https://github.com/raspberrypi/linux, but seemingly nothing newer.
>>> I specifically tried rpi-5.14.y, rpi-5.15.y and rpi-5.19.y - rpi-5.15.y,
>>> which is the current main branch in Raspberry Pi OS, seems to be broken since
>>> forever; at least since my patches (originally written for 5.10) landed there.
>>>
>>> I'll try identifying the issue further, possibly later today, and maybe check
>>> the rpi-6.0.y branch as well.
>> I've tried it this, and I can't reproduce it here. But I'm curious, how
>> did you apply this series? rpi-5.13.y is probably full of conflicts
>> everywhere?
> I applied your patches onto rpi-5.15.y. There were conflicts, but they seemed
> relatively minor. I'm not sure if I did a good job at resolving them - I ran
> into various problems trying to test your changes, but I chose not to criticize
> you before making sure that it's really due to your changes, or without some
> remarks more constructive than "doesn't work" ;-)
>
> I can push my rebase onto some Github fork if you're interested.
>
> I was able to work around some of those problems, and also saw that some
> of them were already mentioned by other reviewers (such as the generic modes
> not matching due to the aspect ratio setting).
>
> Ultimately I got stuck on this bug, so I put testing this series on hold
> in favor of debugging the bigger issue. So far unfortunately no luck with it.
>
> I did not try rebasing your changes onto 5.13 or older.
>
>> Maxime
> Best regards,
> Mateusz Kwiatkowski


