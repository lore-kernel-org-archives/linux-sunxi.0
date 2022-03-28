Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEF161
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Mar 2022 16:57:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id bg10so29978526ejb.4
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Mar 2022 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBY8GOjTBGWVEL0GTMWI6P1arfhZD9nF3EMgpiHJ8pg=;
        b=TrhfV81sE8oJYSmCYeOpiNX4rwzFlNa0YYzLP08JEAl6V9ZLFZAITEpA+veBQrtYXd
         nTIjE75VTCdIqCw6ACstHID8jmEUgPezsa2Ye+Q8W1m3xfHTfeACSgW68kRyL0MmayFL
         y6fCbN7XOb4+BqlfFW+POMeDwCKcSLdInFNbxW1/RObEC7S48YVIEaaj7mIRVg9cBG15
         2beqkvhDpR66XCMne9A7AkOOyftPDo8lqXCdH3KL4usS/GBmP0v4FgXC0I0ohOZ3So6t
         JRh1x+o00LD4zh72QK1QlcGKLfNkewdqNuktuGZnEQEyx0ijfjAX/mqSuMPxI5K9/NIS
         EQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBY8GOjTBGWVEL0GTMWI6P1arfhZD9nF3EMgpiHJ8pg=;
        b=5DnnhYbYpKyBnv4myrMLOorSV7048QDnEaGdcLCxciwqgi3WCM7WIQsLf9UIGSQcRT
         s6WxKSJl8gdsHUNnXgq9ihVyfGY1DXz3i/3Wbu0Ew73PAkEG2J35sghM3aHc9xE0eyA+
         ZfTlSCNV4fkV7Dp2eEyRVO3kEEr/XCLwE/d65nu+cSN5FTmBzoiyJLTZeJl+dn6NS0aq
         DD7SDqEsamfhNybFh0r0bAGCUvG1cbHnTVg2u2vyRXQxLNskr5nCUGhaUaGwEfE/OIFt
         EmHoU/esk/IDRApYWdYHOU2x3ijidkwIrtWPCubr9LYHJlA9glBct5/XWmvFfzVw/vrm
         iY0g==
X-Gm-Message-State: AOAM530RcTWXnsKl/Wg2F8gh0wKakzirBxg73+cDiFdelTrNtWE5eznP
	SIbkNI68+AZ6izKMjWfMxqg=
X-Google-Smtp-Source: ABdhPJwbZdbg18gH4uRako7Q+MjVs4nlqqVBcAfzLaiEeJvaLPgfUTObm+Sv22eUIX11zO3Tys/+HQ==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id fe19-20020a1709072a5300b006cee4fe3f92mr28685432ejc.389.1648486649986;
        Mon, 28 Mar 2022 09:57:29 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090635cc00b006e055c9c91esm6038305ejb.101.2022.03.28.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 09:57:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Wan Jiabing <wanjiabing@vivo.com>
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix not NULL terminated coccicheck error
Date: Mon, 28 Mar 2022 18:57:28 +0200
Message-ID: <2621623.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220328073931.36544-1-wanjiabing@vivo.com>
References: <20220328073931.36544-1-wanjiabing@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 28. marec 2022 ob 09:39:31 CEST je Wan Jiabing napisal(a):
> Fix the following coccicheck error:
> ./drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:348:1-2: sun6i_rtc_ccu_match is
> not NULL terminated at line 348
> 
> Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC clocks")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c index 8a10bade7e0d..ffb72d9a9c36
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -346,6 +346,7 @@ static const struct of_device_id sun6i_rtc_ccu_match[] =
> { .compatible	= "allwinner,sun50i-r329-rtc",
>  		.data		= &sun50i_r329_rtc_ccu_data,
>  	},
> +	{},
>  };
> 
>  int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)




