Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C02FAF
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 07:29:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so8604991wmk.1
        for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BteD19/XIMy7sPKSp1FwggzNL7lWZZ0MvdiM4zhFQzc=;
        b=Bo15U9Y20Hqb3NlsFgxT3yszVwDyhuDGbpVOBCujpbnsPmteKa/z8y5SpAhnV2Gnyp
         SoJxCuBigGF+QWO69FsRYTvpvqr7FWs90dhyFheLpGldqzTW7nY2uUZorHFRM35jz/Ug
         2VDPS7Y3Kpi6R5XyE06Nad+Jl0DGIO/bkULFA45jO+lT05B+3valBRi5YGeS8CxiQp1Y
         DljyhPdR+r9+Fugom1ciFE2c1EFKJ5JTOC8Z1h6PySU5NXsaR2yDoi16fQEzD0QNEMuk
         UsUpF+Jscf0ujBCx3uRiIF34fL45zEDMfy5wp1wOX9RcN6qAFGZlqvWbsYvNXe1JXnWw
         inNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BteD19/XIMy7sPKSp1FwggzNL7lWZZ0MvdiM4zhFQzc=;
        b=tKkGpyVq+XuE4Ue0CbiUr+B6MuGPbHu7bEL2vIO+8eoOEZXUlsdU2Ian3Ayk8V3dzd
         bRjVSiTuYzuzFirp+pwQNYGc22DINf+AuDPqnvrdr4YbAv+BpNwtmYkVoq+TWwnyjm8+
         qC3h+9S1wJOQvQuyI6qjWmz/bxkLJW94OUsNHrDTVZ+d+R/8a3YwKv/sg9E/GIlxdhvd
         qdoi2Cg8/CZwFknuDH8zvUEhIstNId/ohDeZLgRWVYelK4U460ksys6kNTJf9nbeAZRu
         bWFgR0+HkRoINe930DDSRX1X3mQ/4zzMFWZZ04xOrD1bltfo9NVxOICUQ8DgHrtclc0B
         p5uQ==
X-Gm-Message-State: AOAM531YxUgqdhSVO5Hv+tnCu7o3noAJiYfDL4GjbGDH7VrQbHUP6LQX
	eKRr2L1bRMCCVCDsxuTPlcoNyKLTYvIwIw==
X-Google-Smtp-Source: ABdhPJxdyxnpBOl7HA9WGGTO11eaFSwsnPhX0cbz4gXc8j4i+pmAwPZLypk9MiEz337ZzicvShO/Xg==
X-Received: by 2002:a1c:402:: with SMTP id 2mr11902978wme.7.1621668568203;
        Sat, 22 May 2021 00:29:28 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id r5sm2044992wmh.23.2021.05.22.00.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 00:29:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 05/17] rtc: sun6i: Add Allwinner H616 support
Date: Sat, 22 May 2021 09:29:26 +0200
Message-ID: <10265315.EKgO2cQaHd@kista>
In-Reply-To: <20210519104152.21119-6-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com> <20210519104152.21119-6-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne sreda, 19. maj 2021 ob 12:41:40 CEST je Andre Przywara napisal(a):
> The H616 RTC changes its day storage to the newly introduced linear day
> scheme, so pair the new compatible string with this feature flag.
> So far the clock parts seem to be the same as the H6, so combine the
> compatible string with the existing H6 support bits.

There is one more difference - H616 alarm value is now broken down to days, 
hours, minutes and seconds.

Best regards,
Jernej

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 0228e9dfd969..ec0cd0ee539a 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -382,6 +382,8 @@ static void __init sun50i_h6_rtc_clk_init(struct 
device_node *node)
>  }
>  CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
>  		      sun50i_h6_rtc_clk_init);
> +CLK_OF_DECLARE_DRIVER(sun50i_h616_rtc_clk, "allwinner,sun50i-h616-rtc",
> +		      sun50i_h6_rtc_clk_init);
>  
>  /*
>   * The R40 user manual is self-conflicting on whether the prescaler is
> @@ -773,6 +775,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
>  	{ .compatible = "allwinner,sun8i-v3-rtc" },
>  	{ .compatible = "allwinner,sun50i-h5-rtc" },
>  	{ .compatible = "allwinner,sun50i-h6-rtc" },
> +	{ .compatible = "allwinner,sun50i-h616-rtc",
> +		.data = (void *)RTC_LINEAR_DAY },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> -- 
> 2.17.5
> 
> 


