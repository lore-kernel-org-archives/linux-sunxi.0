Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E057F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 04:30:45 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id f11so9560628lfa.6
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Sep 2022 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=X5ivUekAN0+fAD88EJc1Tp5DfK9ShiN7PGoVIvmWHTk=;
        b=SF/F1NBTXeQZpKTxuzqq+tzmA/zefvP30kNFislPl/c21AQRl4fJEH3HHcLXeTofDx
         XeBgWrxCcjqp5N6EYuLpo3kslaSSphTvHrBdczZdE1upRdzx+eG57jBBVCmYMWsRkeTf
         onEDW8r5Rq0IyjslPTZsa1gjK0p2pOmrnxiOtsglzaey7ibbUcELBUw87WzQ62q10xz+
         iG/Ad9FZM+tguD8ga3HjuYqWAJbVDCLyygmqdK6iS8lzYlk3Th9tGQZEXN4T/567pNlk
         EyDl8mBGa4UJONrrP1xzVP1XyQRN2fnDJdhvXqa5oJxQUOXkOZdMEDG5Fz6RWQMtMuNZ
         ldYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=X5ivUekAN0+fAD88EJc1Tp5DfK9ShiN7PGoVIvmWHTk=;
        b=tm4IIWiUbTlPOlAFI/hLSaomd8n9mTXdxtkb++zw+mIoF41TuCSrkMsVaibEq4w1DC
         y4h08DpLUFkcvYlSpWkAiKWwZ6nflZNHW0LL9Psd2s5lhzdLxwuvjTok5B/qQW+H/uJI
         tINGg8oZMMFQ9sLV3PRiexulmqt4eqLk2uj2SOo3jzPsI5w9hXvH7sYOXSHHsP4vSsag
         c5vxUUq0iSURACtSaGACA/FplTKKnqW94WoaaX4K4RLBEy9hf6eq74Q7wpCW+2jb3Tvl
         irr+WdDjnUfnWU5ypVTfzrKFMSlPdnoLQXPYf/7J7cDORb6617IavTJUsr9GPPc/wSIg
         5Gyw==
X-Gm-Message-State: ACgBeo14lR2Cg0kvD9NC/TYXt0ElKasieiaU5nvEOtfuHmxtIFFA34M6
	7IsomtUmHZDyV0OMqv8K2AY=
X-Google-Smtp-Source: AA6agR4m72NSpZUn84imwDHKRYzYRKLuQBQ6rXVyBoLNtNkd1+J2xkRaAdKeYuiamtfa6MC1c9xbKg==
X-Received: by 2002:a05:6512:1586:b0:498:fa29:35ec with SMTP id bp6-20020a056512158600b00498fa2935ecmr3763479lfb.641.1662870643243;
        Sat, 10 Sep 2022 21:30:43 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844? ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
        by smtp.googlemail.com with ESMTPSA id o18-20020a056512051200b00497adccecddsm469940lfb.170.2022.09.10.21.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 21:30:42 -0700 (PDT)
Message-ID: <411ebe0f-f398-8e32-ad0e-b42732aa880f@gmail.com>
Date: Sun, 11 Sep 2022 06:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
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
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909140059.g57oihcmhuym62ei@houat>
From: kFYatek <kfyatek@gmail.com>
In-Reply-To: <20220909140059.g57oihcmhuym62ei@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

W dniu 9.09.2022 o 16:00, Maxime Ripard pisze:
> On Wed, Sep 07, 2022 at 11:31:21PM +0200, Mateusz Kwiatkowski wrote:
>> The "canonical" modelines (at least for vc4's VEC, see the notes below):
>>
>> - (vfp==4, vsync==6, vbp==39) for 576i
>> - (vfp==7, vsync==6, vbp==32) for 480i
>> - (vfp==5, vsync==6, vbp==28) for 486i (full frame NTSC as originally specified)
>
> It's not clear to me either how you come up with those timings?

Well, experimentally ;)

The values for 480i and 576i are the values currently used by the downstream
kernel, and those in turn has been copied from the firmware (or more precisely,
I chose them so that the PV registers end up the same as the values set by the
firmware).

I also checked with an oscilloscope that the waveforms look as they should.
VEC doesn't exactly handle the half-lines at the start and end of the odd field
right, but otherwise, the blanking and sync pulses are where they should be.

The 486i values has been constructed from the 480i ones according to the
calculations from cross-referencing SMPTE documents, see my previous e-mail.

I know this is perhaps unsatisfactory ;) I don't have access to the VC4
documentation, so this was _almost_ reverse engineering for me.

Best regards,
Mateusz Kwiatkowski
