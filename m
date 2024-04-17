Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7A364BA
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713385614; cv=none; b=mvpYI+L+7Ggpg63BCioB5Mb9ug8R7JTADAe1zBDD8oiyA2jfewX0JhEQypta9UbJT7Qrh/Dx5goAjoy00dNE6SJdzliQHO7aIhV0AelD+k0z8y1ak5a5+uYNcoGy8HloUQ494VX9fHAZVgolpp4LR8D0DR8OyZ5jTW6p0zT04aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713385614; c=relaxed/simple;
	bh=+lNHKE0CaXaeti88Mcg9KuAjPlZ39ncXXzPcS1CG6NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBcMCNZaznUH+BXHxgwcIm6kwK8/T2a30rSHdqANlkHCDLLPuToXdG3E1QYhQP5jFSsUGBKz5d78i1pOK8uGH2Ee+7ZfJ17KA1OcFcnvMTblC+/Ntf/ONmy1KItUPrrBqyMtyWMB4KFma1NVXNM0WPY1l7wMAyHRF6T4drIueaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnTKcrtG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnTKcrtG"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e509baddaso107015a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 13:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713385610; x=1713990410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U51YIjOmDSTgBiQt57h68n6X/0b/4LWP9m/+t2oBzw=;
        b=cnTKcrtGPSUIUe5hsJnrag2LIaCiD4SatcX0AcyZ4KWLjuuwXUjZAHGnQJ7vWAKbXA
         tSWzyb5NeQG/ZgPHQVompcwTEACDu+g/YCzrwZjJzGUcTF4AIfw5jyC+3o4EyBTr2dB2
         t01nKHB5ccitl/pVRAJJxryNm2IFJFNBVDpL/6orZNNcnsk3aTMZFOEU+s/jLZ0nQMS7
         v1uaYF0/ZmLyTcj84G1E4ekXGzA6au4GCK3oXEHtMw1cMCuhnpy85lNZYs+EJgYbpjPm
         NKZRUWgMNBi58bVeJE+5u2wRmChqmwLS0LXFuRezxiTHo3SbgzNK9Bxkc3YZQF+bOeVC
         a8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713385610; x=1713990410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5U51YIjOmDSTgBiQt57h68n6X/0b/4LWP9m/+t2oBzw=;
        b=jlNYDR0sgTvl6+6jO9whoGU060FF2LkNu4gp5O4jPFqq4e8TSBrp29ihhtkvXnZ7qi
         CWIUBILrk4bXmtphZF5yAmSqJ3xiiA3taClryzmx/w72TWsHV1LRT1PurkjwcJQsAp7+
         7YPexdETADg/PMSesZfr2clZ6xR51dUv1fBYbDh7G2Tmty3mOz2Sx3hGExUODL0WGRHq
         Xz0g98kNHcIjcM8XLtDsEhTkArFf35B690KmSHAkaEiENQlBm9fojUL2s4On4Hv5SMtd
         XTf5cwoAbdTUhiUDWSWWgtFaENRMJXV9GORHMptJPRYfM0Mr/+4vqTxJprr3MK25P9oQ
         wG4Q==
X-Gm-Message-State: AOJu0YxXKqZCQCJeiU+lQ3CrvxJrzXEUaWmZXMskzaFoFJBs7QxpcTFI
	OsjgfWoVInxhdQ7juoqgrK6poLK+uZzw7QShwBPotVwsQnD51HSoHMNnkw==
X-Google-Smtp-Source: AGHT+IEAo/QrH12scC72S248kd5Y6GLG8Q9TLINPS2vee1HJzaNUUHtsuvxbgHyGKRtcge78y8kbZg==
X-Received: by 2002:a17:906:af17:b0:a51:f915:bf5a with SMTP id lx23-20020a170906af1700b00a51f915bf5amr317027ejb.75.1713385610141;
        Wed, 17 Apr 2024 13:26:50 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id z6-20020a170906434600b00a518c69c4e3sm14430ejm.23.2024.04.17.13.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:26:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org,
 mturquette@baylibre.com, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: h616: Add clock/reset for GPADC
Date: Wed, 17 Apr 2024 22:26:48 +0200
Message-ID: <3616000.R56niFO833@jernej-laptop>
In-Reply-To: <20240417170423.20640-2-macroalpha82@gmail.com>
References:
 <20240417170423.20640-1-macroalpha82@gmail.com>
 <20240417170423.20640-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 17. april 2024 ob 19:04:21 GMT +2 je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the GPADC required clock and reset which is used for the onboard
> GPADC.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 5 +++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
>  4 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 21e918582aa5..3646be2b88ab 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,6 +489,8 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ts_clk, "ts", ts_parents, 0x9b0,
>  
>  static SUNXI_CCU_GATE(bus_ts_clk, "bus-ts", "ahb3", 0x9bc, BIT(0), 0);
>  
> +static SUNXI_CCU_GATE(bus_gpadc_clk, "bus-gpadc", "apb1", 0x9ec, BIT(0), 0);
> +
>  static SUNXI_CCU_GATE(bus_ths_clk, "bus-ths", "apb1", 0x9fc, BIT(0), 0);
>  
>  static const char * const audio_parents[] = { "pll-audio-1x", "pll-audio-2x",
> @@ -807,6 +809,7 @@ static struct ccu_common *sun50i_h616_ccu_clks[] = {
>  	&bus_emac1_clk.common,
>  	&ts_clk.common,
>  	&bus_ts_clk.common,
> +	&bus_gpadc_clk.common,
>  	&bus_ths_clk.common,
>  	&spdif_clk.common,
>  	&bus_spdif_clk.common,
> @@ -940,6 +943,7 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = {
>  		[CLK_BUS_EMAC1]		= &bus_emac1_clk.common.hw,
>  		[CLK_TS]		= &ts_clk.common.hw,
>  		[CLK_BUS_TS]		= &bus_ts_clk.common.hw,
> +		[CLK_BUS_GPADC]		= &bus_gpadc_clk.common.hw,
>  		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
>  		[CLK_SPDIF]		= &spdif_clk.common.hw,
>  		[CLK_BUS_SPDIF]		= &bus_spdif_clk.common.hw,
> @@ -1021,6 +1025,7 @@ static struct ccu_reset_map sun50i_h616_ccu_resets[] = {
>  	[RST_BUS_EMAC0]		= { 0x97c, BIT(16) },
>  	[RST_BUS_EMAC1]		= { 0x97c, BIT(17) },
>  	[RST_BUS_TS]		= { 0x9bc, BIT(16) },
> +	[RST_BUS_GPADC]		= { 0x9ec, BIT(16) },
>  	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
>  	[RST_BUS_SPDIF]		= { 0xa2c, BIT(16) },
>  	[RST_BUS_DMIC]		= { 0xa4c, BIT(16) },
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> index fdd2f4d5103f..a75803b49f6a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> @@ -51,6 +51,6 @@
>  
>  #define CLK_BUS_DRAM		56
>  
> -#define CLK_NUMBER		(CLK_PLL_SYSTEM_32K + 1)
> +#define CLK_NUMBER		(CLK_BUS_GPADC + 1)
>  
>  #endif /* _CCU_SUN50I_H616_H_ */
> diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
> index 6f8f01e67628..ebb146ab7f8c 100644
> --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> @@ -112,5 +112,6 @@
>  #define CLK_HDCP		126
>  #define CLK_BUS_HDCP		127
>  #define CLK_PLL_SYSTEM_32K	128
> +#define CLK_BUS_GPADC		129
>  
>  #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
> diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
> index 1bd8bb0a11be..ed177c04afdd 100644
> --- a/include/dt-bindings/reset/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
> @@ -66,5 +66,6 @@
>  #define RST_BUS_TVE0		57
>  #define RST_BUS_HDCP		58
>  #define RST_BUS_KEYADC		59
> +#define RST_BUS_GPADC		60
>  
>  #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
> 




