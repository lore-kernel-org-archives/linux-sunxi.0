Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CDEB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:11:31 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a7so9070330ejp.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bHUqv/0GJPBCxHv+0WA5YwKaB/OSuW/QMKq7Vb1Yd3Y=;
        b=H9Q7SUQm+w/IZFinc+9IuGZRvyrc241jl2NXMTsWWzK4Yj/bMca3jtmqXimH+PoLbj
         2tVsPtc0OBB1cWpTsK/ypRcAlVZ/oc5Fm3ZVDm0k5kgXDzpSN4W+WaHryNCwo66pJDLz
         xUwI5u56/PgqhkW+91DeXvq9Zxbq1ayvGKJtLUXMSisVyhtIDqI6axlu4upiXKieu5Hq
         JIcX3ZxxJuBcGLV7J8a5YSjhoLUQta4nKDZyf/30VbQq53CXMGRd3EMi1AAvOpnPeCBQ
         6Kg49DtGHFitHX0fGzHErFmG16oJUsyiji2F2PO4jzO/Ab9e+C+UvcMpCMHfrz3fMvAQ
         QA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bHUqv/0GJPBCxHv+0WA5YwKaB/OSuW/QMKq7Vb1Yd3Y=;
        b=JGGg7JlRhz+b3VbyWrFiUjXQpqGI21PSXUfvLkguE1dNHK7NCwJ2GuHwSS791PrESk
         dEdoQhCQi1k7bDQ7r5hX72UbjFI/4oZq4JpCK5u2iBGtYWBS7KIL7j0vCvxyJ1h6ew7Q
         6kCb/+wfSC6TJK6/nqHBEvDB2lZb5x4Jpt677K3AxlBKwQx9ZhQszWUHZDbGG8ceJj6C
         ybGlH2a9So46o1AVzJp5BtjwvpSUKzf6q9EcL4cbKl7YhA8KyxzQiMR0Att2BLhGGy6k
         mSQfPLp7sKo4Cl0PvG1InmElnCBj8rXQbAKpYbx42vTjdIaYONAZOV2SWkBNodqYggqx
         mpmg==
X-Gm-Message-State: ACgBeo2vxs3GAqqo54/1zbZ/yrMn6sjhJ+lLnVW6s2mezBhB6Q0k/KBy
	J7eGuFN7mHAXpnlgroTu8Mw=
X-Google-Smtp-Source: AA6agR59O0rxTrcXuFbtEwWNQAihsOjIR0aJFZi3EF6pxH9m8ayr/toLSzZmLt9jpvao2bukmLllwA==
X-Received: by 2002:a17:907:969f:b0:730:b649:ff90 with SMTP id hd31-20020a170907969f00b00730b649ff90mr7496486ejc.337.1660471889310;
        Sun, 14 Aug 2022 03:11:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id v1-20020aa7d641000000b004417eeff836sm4538337edr.53.2022.08.14.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:11:28 -0700 (PDT)
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
	j-keerthy@ti.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v5 28/33] iio/drivers/sun4i_gpadc: Switch to new of thermal API
Date: Sun, 14 Aug 2022 12:11:26 +0200
Message-ID: <8976333.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20220804224349.1926752-29-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org> <20220804224349.1926752-29-daniel.lezcano@linexp.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 05. avgust 2022 ob 00:43:44 CEST je Daniel Lezcano napisal(a):
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach. The ops are no longer device
> tree specific and are the generic ones provided by the core code.
> 
> Convert the ops to the thermal_zone_device_ops format and use the new
> API to register the thermal zone with these generic ops.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


