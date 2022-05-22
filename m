Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE42103
	for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 07:37:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gi33so14343794ejc.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 00:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OdhdDP/uxlcANINOeHwQJ1MfvJN8y/K+wdplfOLCUbg=;
        b=Q7vTZzoeodbfmkaLaMjIU/yoC1tkECqU3K6iKZ4VlVbZVdYZymn4X8AizZmULhwZZW
         HKh4Bq4IpzdMFY8uupDPGDVXPIc+okstubtxys/zfpxcQytXclhiT0DQ5lNaAviPpoGi
         G2HhydMwmWaX/5N2cvyefWrUjHYjdQw0u0LdTibjGwH2ZKjOwgkopi3lokgOa4XJ6gxf
         6IVL19F9sSqP/068BF/oY7XJeoT6aCCthhjNCmqJDgodHVJqDS36f1rlGs0mjR0GY4G2
         B2KtbUrSNltXro6jngVpNd56rSWb7gqC+rQXfJgG99jAT2YxrUdbONXd4nwIL77GTf70
         zALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OdhdDP/uxlcANINOeHwQJ1MfvJN8y/K+wdplfOLCUbg=;
        b=RXuIyQsAu/9zPhP3FhlcbIwZ5GdbqnxvElc74aYrM6x6yhKI4VhewVG5EC5HQ2AoNt
         wIgS0jA57Cfxa8XTmj4gceQM+2O1qFNAc42tuPoU6EoS2Yd7Q3rpfqtZLu0FjYRlKufA
         fap9Rrzsrz8fq9uFvz95UjztXy/nA+hv6f7tfuUwOjNJOVMtLKqrrJ6VnXs02TDN/hes
         CMy2gmrPxRyfHS3O8I7xTSiT2ZOXDI9uOtnOtf2TznFGoorbZCOf1VLuy9rrI8sOKbc5
         QNdeD6/+F5s0q9KL4wIFE2LDKMyvMkLLIubk+MS4Uw0vlTOao/8ZWdLMDWZhb61J9/6h
         KEdQ==
X-Gm-Message-State: AOAM5323xW8aXv877VfojVVjg2E5MrP46EjttBlvePNClszfC1gdgpMg
	3/tz7ZFeCxat0xtJin2CiKc=
X-Google-Smtp-Source: ABdhPJxQBeuln8XMeRYo4K+y9ER4XF9UILSt1sR+YydK3j1021j2KKwVo/wXR5MBMrpqHT1JvAHAqg==
X-Received: by 2002:a17:907:2d10:b0:6fe:debf:bfc7 with SMTP id gs16-20020a1709072d1000b006fedebfbfc7mr304155ejc.502.1653205034817;
        Sun, 22 May 2022 00:37:14 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709067ad000b006fed8dfcf78sm238483ejo.225.2022.05.22.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 00:37:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-spdx@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev
Subject: Re: [patch 10/10] clocksource/drivers/timer-sun5i: Convert to SPDX identifier
Date: Sun, 22 May 2022 09:37:13 +0200
Message-ID: <4737788.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220510171254.970933294@linutronix.de>
References: <20220510171003.952873904@linutronix.de> <20220510171254.970933294@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 10. maj 2022 ob 19:24:51 CEST je Thomas Gleixner napisal(a):
> The license information clearly states GPL version 2 only. The extra text
> which excludes warranties is an excerpt of the corresponding GPLv2 clause
> 11.
> 
> So the SPDX identifier covers it completely.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-sunxi@lists.linux.dev

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clocksource/timer-sun5i.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -1,13 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Allwinner SoCs hstimer driver.
>   *
>   * Copyright (C) 2013 Maxime Ripard
>   *
>   * Maxime Ripard <maxime.ripard@free-electrons.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2.  This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
>   */
> 
>  #include <linux/clk.h>




