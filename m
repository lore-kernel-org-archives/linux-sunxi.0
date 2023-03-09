Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706829A9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 08:17:28 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5384ff97993so21381947b3.2
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=zHNKNBYRp8ZMtYES6iOOJZdPs+/VrS4r4YOJIdMcn27ttfxXw+5AQLOM553VKzbfnu
         vLHmIOaLbVGba0VsvH1A00WV2qAWWgRg6OCdzr0CGE6bztDfQMn/g9Y5OsP9YhvR9IvQ
         MBPkKaiastTwTZvY+KgDfsVknQjxIsmsmH17UUOwZlFCPeT099gAT1AvqRLyWYGb78VF
         buB27vSGCDqka04+hzRqEy0gBl5mSK5NjjfTzm/G9U23TwZT1xq5DqboEq5enhwfaKIC
         YzzD9CYsGf0djIqiap2rDOQQywTt+nLUZAXM8IkxeeJ6AXIvCT0l3gLpZjJP6pzCZ/ff
         Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
        b=6GyLn/hjTzzte9ULZiz+Jmo+N/7NMjtvRa3XbnaH/Z81o/bM8cOEIe/6NOwkHRpGnX
         w5hieJfB6ngPptJawp8IJdcdVnBB9skx4J67FVJ6bBb303ErSCGNfHU3VbussWsVezq9
         A/djaqJVRhDSGqAqnHiOjbYAO5PsmW4SrEPlrkPQyAKrZOjrobXoCNzIDM9btqSyOFyy
         JeCHb55B+EKMK49FFbEliIm8qRUYH8HelEcUrUqpu3nfia9HKFhvzt3pFpEbVaK08qt4
         y8Pf2hnO1PY5QfzB7ZIQv5hCkmK2hTMVSPnU/ESa820FdKMoscLU2D+Bl9zUSJh1Ark4
         6EVA==
X-Gm-Message-State: AO0yUKWDAqDXx9vl5hp083M/vuMntI4bweJmXq/oCypofLPqs7hbOQ1n
	VIKb5F4xbHnr8mkAOa7etWQPvLquSpbJHMo9NEGJfg==
X-Google-Smtp-Source: AK7set9NqrT7RUuXgHnInuqDO8U0SE1ojud6SJk/FpmB3GQVriAzuG0269C9t+4xeg2JU5VBcDK6EbBkG9E/pM7QunM=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13477522ywa.9.1678349847927; Thu, 09
 Mar 2023 00:17:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
 <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
In-Reply-To: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 09:17:16 +0100
Message-ID: <CACRpkdYUVBq_-iZxtoe65eh3ruUOprF_JEG-sZfUSNVhjacVLA@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com, 
	yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
	philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	jyri.sarha@iki.fi, tomba@kernel.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 9:55=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 06.03.23 um 23:19 schrieb Linus Walleij:

> > 2) Why isn't this DRM driver changed?
> > drivers/gpu/drm/mcde/mcde_drv.c
> > AFAICT it also uses GEM buffers in system memory.
>
> This driver requires damage handling
> https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/mcde/mcde_dr=
v.c#L97
>
> for which we have to call the framebuffer's dirty callback

Oh that one is on me ... I no longer remember exactly why I used
drm_gem_fb_create_with_dirty() but I think it was because I had the
ambition that the driver would only send out updates to DSI command
displays whenever something changed, so as to minimize traffic.

It turns out this ambition with command mode isn't working in
practice because all the MCDE does is to create a continuous stream
of DSI commands and while it is possible to send single frame
updates with it, it's not working in practice. So we are just setting
up continuous updates. We turn of the VBLANK IRQs a bit, but I
guess the DRM framework does that for us when nothing goes on.

I tested to replace this with drm_gem_fb_create and it works just
fine. I'll send out a patch so you can make this change also to the
MCDE driver.

Yours,
Linus Walleij
