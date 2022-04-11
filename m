Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73457B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:25:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso10271902wmz.4
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzsEqdN9GWBZCp9gbidm1vb5G8aw4lFe2X8gpnY6F9U=;
        b=JQrYEIFBxiKgk+B/U4eSm8qQmxNxlhQQJSFEVnH4IiJtIEp3Iyxq5LhWBdVbC9LXNE
         fjx+B0j5+rGkH6hhrv3Vhu2BCOPj7AWkXgjJ8+uaYU2cbY/BVn09qPoZtz4r7WmtCgRc
         6jAhjsJke1LITOa0Vfldz77wZj1VlbRfWgN7pe8I6kxAzvSOYjNJJc4Nw7MG9YNr4aUG
         SGm8GZ0/H9xwhSw4bjPRJ9LCkvogFt2nujW+EA73cCJFafK8gHwzuZw+mRbDJ1aVEqlI
         0njk9NS0L8d1rnRwHRpEArL4g96GYrOCP53MSQAnvE3aRkjnwc2JjwMeLuM8fqhl4EFJ
         Kb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzsEqdN9GWBZCp9gbidm1vb5G8aw4lFe2X8gpnY6F9U=;
        b=jwSZ2Qd+3cZQ19lKMCBozoiSmi3UMZMS5g6W4d/bGnNwoHzUxjmYVm2K0jjEQ0PG6s
         aTFsoIUhIUgfRBhE4Y5VuprFhEqUCBP6Onpk5U4ZA7NtQ1F5yGcnUgF3sDgk2kwbehHa
         DyB9ic/Tpp/iF7WmKsl/rjLbZepPBFACiZpAhmLMKn8tfsLmKJW9tItCLTnQlI5PqovS
         eMB3gwGNPEBEK8HhKCcGqw39ccRF8Pg0w3z/tjgJqWX9iDzMnRNV7RHNZXYJfGso5tx5
         zKCbR+VlvpCFjfPkcRKbiRmbquHk03OKhl0nf26f79rFrOfQj+1h+K7DApfO1X3Ecgbd
         s4qA==
X-Gm-Message-State: AOAM531ubj1wOKEb7VHolVpuswCFtd731+2IdWhlrH634UbCGIAEKWf5
	COVVtJfX1V11cVYRypAGtAk=
X-Google-Smtp-Source: ABdhPJwEBfXcqXbo6nKoX7IGK2b48hhx00NtVYuq45Z9JeLIYxRw6WPyZdqv7NpnPbruES0SS+KWOQ==
X-Received: by 2002:a1c:f607:0:b0:381:1db:d767 with SMTP id w7-20020a1cf607000000b0038101dbd767mr28969100wmc.165.1649690700192;
        Mon, 11 Apr 2022 08:25:00 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a7-20020adffb87000000b00207982c7f4dsm9126970wrr.67.2022.04.11.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:24:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical
Date: Mon, 11 Apr 2022 17:24:58 +0200
Message-ID: <2233461.ElGaqSPkdT@kista>
In-Reply-To: <20220411050100.40964-1-samuel@sholland.org>
References: <20220411050100.40964-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 07:00:59 CEST je Samuel Holland napisal(a):
> Because some newer hardware variants have multiple possible parents for
> the RTC's timekeeping clock, this driver models it as a "rtc-32k" clock.
> However, it does not add any consumer for this clock. This causes the
> common clock framework to disable it, preventing RTC time access.
> 
> Since the RTC's timekeeping clock should always be enabled, regardless
> of which drivers are loaded, let's mark this clock as critical instead
> of adding a consumer in the RTC driver.
> 
> Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC clocks")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-
sun6i-rtc.c
> index 8a10bade7e0d..3d9c9ce5a3db 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -241,6 +241,7 @@ static struct clk_init_data rtc_32k_init_data = {
>  	.ops		= &ccu_mux_ops,
>  	.parent_hws	= rtc_32k_parents,
>  	.num_parents	= ARRAY_SIZE(rtc_32k_parents), /* updated 
during probe */
> +	.flags		= CLK_IS_CRITICAL,
>  };
>  
>  static struct ccu_mux rtc_32k_clk = {
> -- 
> 2.35.1
> 
> 


