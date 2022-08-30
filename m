Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255836108
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 21:31:28 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id s15so7581354ljp.5
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
        b=kSqNn3A96fFfYAvZMnZM6fCkCnjNdGOAfgbjh9xsCUhPlw304ML9UOEGEq0noWgIeP
         e8mzpa9LJOTPz3mo314puee4Fei78Xd3dwfhduIl+R9me/flZOEnbstk45R5T8xMBH5j
         qj1SBot1DkuqGKcyF7RI8id8AqXjy7LQG9OWw/dcdOmtkhYzextF2jhnGSmja1hGlzqs
         8uFyhJM+XooSUzJnWBsnt2T9p8alpMeedc8qVliCE16DCl0Nea+DeCk5ybxPVZk/RlN9
         3wS6qGlyAK0i3imci6ec/k3ZZuvuHvx8V/aL+wP4XOiVLZG8emIw8ni+mIZBgQVmJWF/
         gsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
        b=bz8FGWpMDBeBUa4MpgfQxhiK01M1J4Gcu7mSGS6d7zG1fnq9iQjZt+Daf6R2v1qICB
         +M30Qvi1ArPb1jgxSRHORx6moqhNBcfxxOQX3qFOdyQ+DBzzGlKAoIYYe8IznkrefnRL
         CqCWRd+y/HgKgOBZYIIdvhx9RNItocpFvg/wUpwOY8QwNda3p6ck6sECJl+353wi8+p7
         X6yXU3fMtSwvEZVK3MUdg796SiSHLl8Z2p0yqiI61OL+dxTAsMhJ730pLTmfI5AMEZOC
         jvhV2xWWKaT7iaXKc+T8IKisDIk0hnUKeFSQg0YJzflGDSj32aWQ9watcGWhLorPYfxo
         FqjQ==
X-Gm-Message-State: ACgBeo21pW//dHAV3yFXw0RjI4n6x8fsNoUmgiprneo5/aEZJEg9fGRz
	fzB8UhmYASh8WMprMyXUxBk=
X-Google-Smtp-Source: AA6agR4S4WuypWhRAErxoi920Fo8fv4SJcbnBpQK5wzzMSWUXZMHydNeVYFmYA2Bqfe1pnKLfGrkYg==
X-Received: by 2002:a05:651c:507:b0:25e:73af:1661 with SMTP id o7-20020a05651c050700b0025e73af1661mr8063374ljp.195.1661895086153;
        Tue, 30 Aug 2022 14:31:26 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:d40b:b088:5bfe:3b81? ([2a02:a31a:a240:1700:d40b:b088:5bfe:3b81])
        by smtp.googlemail.com with ESMTPSA id x7-20020a056512078700b0048b0aa2f87csm1733424lfr.181.2022.08.30.14.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 14:31:25 -0700 (PDT)
From: kFYatek <kfyatek@gmail.com>
X-Google-Original-From: kFYatek <kfyatek+publicgit@gmail.com>
Message-ID: <a2ebfb0b-7b54-8059-036b-7aa1bdf4dd78@gmail.com>
Date: Tue, 30 Aug 2022 23:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: pl
To: Dom Cobley <dom@raspberrypi.com>
Cc: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
 <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
In-Reply-To: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 26.08.2022 o 16:56, Dom Cobley pisze:
> On Fri, 26 Aug 2022 at 05:08, Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
>> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
>> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
>>    https://github.com/raspberrypi/linux/pull/4639
>>
>> Either of these approaches makes VEC mode switching work again. Obviously
>> neither is appropriate for a permanent solution.
> Might be worth trying the latest rpi-update firmware.
> There was a change that affects restoring PIXEL/VEC clocks after a
> power domain cycle.
> There is also a fix for a USB boot breakage.
>
> If you still have an issue that occurs in downstream pi tree but not
> upstream, then create a linux github issue.

Hi Dom,

I just tested the 868f1cf firmware and its associated kernel, and everything
works like a charm for me, both USB boot and VEC power management.

Thanks!

