Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305AA8C14
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:33:39 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bdcade7fbso424218666b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693946018; x=1694550818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y/qz5Q/D4Xh82fml9lf+22Tut8ew4AzgdNATkCb0mg=;
        b=MGlcC8hl4JxJKOMp/Ylos0aq9nH87nmaob/tGMUSooznVOCbGbVe0u+/SxuWMEy3Bd
         Z8oScI3O6wjxem3oeQPiiNiLWyj8k3n+n4ZNcJAWnXx9LWwgwgQ8YiIudesnvZnUnWCa
         qe9nji8rNhqf7YqwwuCO03L0EhfskukvkzPwqpiOYBviovrIJVeIjWjK44CAWNWHSB1G
         A7iVDYZVDxgDsgrhp1XiBXEqDPe58EE76izBCCGVjQbno5ipnTyJ9hpvdSR1SdHcki3y
         +KqDNib/856WHRyrlHkxtc9BPljsZhmhb1XQQLMWSLzdWz7GI8T7mTQ8kCsb7gkDIT11
         Wh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693946018; x=1694550818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Y/qz5Q/D4Xh82fml9lf+22Tut8ew4AzgdNATkCb0mg=;
        b=cK6NPNzdqX4wKfpUIris6CiqWSfwEHAXS6Re8HLgEKKlIvH9ByX5h3onrZvvwR9uCK
         9RLfx008yuA52lPB8qtubVb4QTfr1oLYKx1lMaEW3LrJ8d8sb8smu4dpTLTTgA4iUnND
         0Vln/zMJcwHVi9hz2tA8ljqknOC7cwGo+FJglweMObOPpFVDTxfjwgujp3UXfMZXpdX4
         NEk37hJkx0YJJAxmbE1eqsxa3jiw0k/FrkXhr7D7Hki8dYGQT1OTbb7BI40ubRV3AWEO
         v+JlsmjiupuRyV18cAENIOJPXQ1Vf7Qjy96NH9vGY0Gpnfo2lTNK7Yo5Xm5nP43phAvM
         0kZQ==
X-Gm-Message-State: AOJu0YwMUMRniPa3W/zQCbEtAdw2eCPDPuUK5PlEcSxzhjjlp9HTdKFL
	Ndn4xl94KxoB2kN/4hw9LVM=
X-Google-Smtp-Source: AGHT+IF7LbRquDkm6YhWhL50x9Jtu4g7EmvWSZoEBIMpq9IJRoIB/RdOfSm3q6foUsGnO/tlDPbmiQ==
X-Received: by 2002:a17:906:5a6c:b0:99d:dd43:d427 with SMTP id my44-20020a1709065a6c00b0099ddd43d427mr711749ejc.10.1693946017963;
        Tue, 05 Sep 2023 13:33:37 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id s23-20020a170906c31700b009934b1eb577sm8035258ejz.77.2023.09.05.13.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:33:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Mans Rullgard <mans@mansr.com>,
 Maxime Ripard <mripard@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject:
 Re: [PATCH -next] clocksource/drivers/sun5i: Remove redundant dev_err() for
 platform_get_irq()
Date: Tue, 05 Sep 2023 22:33:36 +0200
Message-ID: <3440176.QJadu78ljV@archlinux>
In-Reply-To: <20230901071328.1322235-1-ruanjinjie@huawei.com>
References: <20230901071328.1322235-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 1, 2023 9:13:28 AM CEST Jinjie Ruan wrote:
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
> to platform_get_irq*()") and commit 2043727c2882 ("driver core:
> platform: Make use of the helper function dev_err_probe()"), there is
> no need to call the dev_err() function directly to print a custom
> message when handling an error from platform_get_irq() function as it is
> going to display an appropriate error message in case of a failure.
> 
> Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device
> driver") Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This was already submitted one day earlier:
https://lore.kernel.org/all/20230831041414.66434-1-yang.lee@linux.alibaba.com/

Best regards,
Jernej

> ---
>  drivers/clocksource/timer-sun5i.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c
> b/drivers/clocksource/timer-sun5i.c index 69fee3540d37..0d229a9058da 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -256,10 +256,8 @@ static int sun5i_timer_probe(struct platform_device
> *pdev) }
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Can't get IRQ\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk)) {




