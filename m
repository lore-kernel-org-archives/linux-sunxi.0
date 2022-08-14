Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401CBEB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:12:25 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id y3so6350242eda.6
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1+mb69L+xqrAYBz+n/l0oT22rgwEo4zT/GChnKSihHg=;
        b=bhJnAPvl8dAmRl0/3Nc6acyExiSTqYLEqrbPRQJbd5QYDO21pR0LDR3ky1ftzHZU/j
         COElbRmt8asxFYHsS1lvDLqeT1DoCUGP1Ll0odlXXVnECaaWe2XH8edFWAnEIcgGFrvw
         vhb0H7Xf0hlfikfI1GpbP2ZahLXvXjJOMirQPpIT+KRZdJHk/HDrO3oBi5Z29hqG6unP
         rS0PTQ6bXhtJdpeakpaJ5+Bu7wBdfbyrTXKjped8VIFZQSkl/xATXHBmFmpdnZYHuFvF
         kwI3kXbcKYOcno4HAzsRyUguNoUMbXu7py6of5o1vIe51U8SKQTgpLlL8AzKqwalQuiL
         rLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1+mb69L+xqrAYBz+n/l0oT22rgwEo4zT/GChnKSihHg=;
        b=p+DNNreZiXDtwBdRUwqOGzyVQ6+q4t4fuXLap9GZC2LC1PlUYR8Jk2okpo5yv6e7Bd
         K6/XXgChrWmeb6Cfa3BOK6wD5gAz2JHkZOHvTnBdpBKbjM4ueagM3PUa5zK7OuMJTl9M
         OeKAw+DAf0APp/8hLynCgv+nJ6Rgd4BYYsaoZXiPxsgOP0hGWQPLZ72VHYlSSXQiboxo
         Vyd1IFs8q5wI0B/8eGhaZMsQFTDm6cIy3gwo8NLE7xovzeDXMlqTMiH4ixMB1W6J+5q4
         BfSxEUg330Sn8hTRP4ZjRTjh1KgUD8oJdSnbhO4mUekLSIYfPjr7wSobQ77sR15ZYW9+
         X++w==
X-Gm-Message-State: ACgBeo1HqXQhNRp6g28/g6Z3amjBQHXejjamnz9uYULwa7Z0wpibrC3z
	ejgd0g54g7FXlkvOrUyAmjk=
X-Google-Smtp-Source: AA6agR7X9N4O3WfDrYIk/VM94aaKm2o58k/Qya8E5B+4G+3yoIYZJ5fowQBFGeaSXfh59aq7b/6b1g==
X-Received: by 2002:a05:6402:540f:b0:440:d9a4:aebf with SMTP id ev15-20020a056402540f00b00440d9a4aebfmr10251453edb.196.1660471943579;
        Sun, 14 Aug 2022 03:12:23 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id b10-20020a0564021f0a00b0043df40e4cfdsm4488524edb.35.2022.08.14.03.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:12:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: daniel.lezcano@linaro.org, rafael@kernel.org, Daniel Lezcano <daniel.lezcano@linexp.org>
Cc: rui.zhang@intel.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, khilman@baylibre.com, abailon@baylibre.com, 
	lukasz.luba@arm.com, broonie@kernel.org, damien.lemoal@opensource.wdc.com, 
	heiko@sntech.de, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	talel@amazon.com, thierry.reding@gmail.com, digetx@gmail.com, 
	jonathanh@nvidia.com, anarsoul@gmail.com, tiny.windzz@gmail.com, 
	baolin.wang7@gmail.com, f.fainelli@gmail.com, bjorn.andersson@linaro.org, 
	mcoquelin.stm32@gmail.com, glaroque@baylibre.com, miquel.raynal@bootlin.com, 
	shawnguo@kernel.org, niklas.soderlund@ragnatech.se, matthias.bgg@gmail.com, 
	j-keerthy@ti.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v5 29/33] Input: sun4i-ts - switch to new of thermal API
Date: Sun, 14 Aug 2022 12:12:21 +0200
Message-ID: <5746387.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20220804224349.1926752-30-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org> <20220804224349.1926752-30-daniel.lezcano@linexp.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 05. avgust 2022 ob 00:43:45 CEST je Daniel Lezcano napisal(a):
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach. The ops are no longer device
> tree specific and are the generic ones provided by the core code.
> 
> Convert the ops to the thermal_zone_device_ops format and use the new
> API to register the thermal zone with these generic ops.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


