Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5667F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 04:51:22 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bt10so9655863lfb.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Sep 2022 21:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=XIY+68P3U22mQGsLLoSSFcg2zg1iq6nyQPz8fLaQ0oE=;
        b=KMFPIZg72ybP/U7EjC2ScfiAUimjnENQw0GEyTYJzmkUU52crQ6OHlLskmExR7NsSs
         eMY9SN0NOGAqyKnlGcCLLgdOs6Zjmj+OE9PviAhQdducKwbYV9wzHgn/rbq+7bGUx559
         NodqqgwDI1U8LSxxaSKvzGyevZmw4d85G43k+/QUsDCmQzdS/01OO6nGrrgv4o8ywLAS
         oZGLMbfaTaDk8ekJkgsUnobyUQLa71UK+15ACp1hxK9r8APUX/VCok+93Z33A1EZsq93
         n9631zSD2uMvomFLsW6aMIbP145LN5a+TL/DXeuW565iBiQ7pgoEkG9EPtVOin1SV0ul
         8gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=XIY+68P3U22mQGsLLoSSFcg2zg1iq6nyQPz8fLaQ0oE=;
        b=bE2lHTGmlvNVFVwVQDULmG2hTuvAmNlYSsN9k/xg6HbJVeOBhk1IxWJdbyGY6KrCh7
         CEzrLITza3otDU+UxZa9TTigs0368BiXcw5jO8ERe8SJyGpTF2rsyCid17Z6QGTMhBau
         B39ZdfmT5NP7DVut61u855btTZQMDXvBSIJS5I6IgNQU7Os7/X49eC3+bnZEozVr9Ynt
         5UdKWpLOSjtirTXYdJdGojXiY9BXGiglbfKxLMrRZPRk2CmjFxFWW3MgtOWMOGMSG9oE
         1kjKWMEfsCegySZac+xRyrMKGf/Od/S6RDoSPjCcnJ2/W4bvjpxBG5C1hsYBjx7+Id2Y
         UTZQ==
X-Gm-Message-State: ACgBeo39UGET8fU3NricB7sroTwq6VqYJWYf3+8j5/iy6fyYHVX8oxSN
	+/P3cVYjC4U850lx5FFYSgg=
X-Google-Smtp-Source: AA6agR4HaTIFXR95Cv35IjLjzgwZoQn9BgzbhDxW7IP1eMizctu6PfCBylwC524DiMtSVr18MWoAFw==
X-Received: by 2002:a05:6512:281a:b0:49a:4e46:34ff with SMTP id cf26-20020a056512281a00b0049a4e4634ffmr411587lfb.72.1662871880581;
        Sat, 10 Sep 2022 21:51:20 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844? ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
        by smtp.googlemail.com with ESMTPSA id 7-20020a2eb947000000b00268cfcf841asm46332ljs.56.2022.09.10.21.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 21:51:20 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <c1d7ac5a-90bf-d6ea-ec77-ec7662482d2e@gmail.com>
Date: Sun, 11 Sep 2022 06:51:18 +0200
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
 <20220909135444.5oi6oh6nqwuke3jl@houat>
 <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
In-Reply-To: <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Yes, lines 0-23 is the entire blanking area. And the "back porch" in this
> context is everything from the start of the sync pulse to the start of active
> video. It's not just the equalizing pulses.

I meant "from the end of the sync pulse", obviously. Sorry about the slipup.
