Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041E28EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:32:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bfcf4c814so543488466b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691328766; x=1691933566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ord0VE1gzw6fjyq/8Y2drSOTCzaAFST4WDc+L9TSzDw=;
        b=P4vCFPRCDkh/3Vge3m5VHzaX/BPWceyKv0EwV2HZD2tQf0/7W4pyu5BTIJ6lq9aH5h
         svQeFbnUIp8AEuQLiZ6a5tbfFglZrD4FrroBywBi+qup2AuEbuIrC7vJOHUufRexC2Is
         Q3zTfyma3RT0aF9OLXgf9lm0WYR8F3r/TuM8soTRLBVp4vIZm1Q4WEep4Yg0+T7pqUXU
         7QlgVIsVUOoXtz0WraCyPekV11YTqFRKSMzovkYCCNjHRVHH5DrwqFAHFfBy8LHqYY70
         TRn48waodP6Hk9AG1qRXFUOBh58zr4Tw7Dx29Y4PoP93ysY+tZgARU7B1MQcgd+e69aG
         oB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691328766; x=1691933566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ord0VE1gzw6fjyq/8Y2drSOTCzaAFST4WDc+L9TSzDw=;
        b=PsGq/MKWLvKDyIKZxrL8eV4mjdlnR4iz4RHo3Bo42BlW84XSsq6hXc3p4gFPr640Et
         k9JswH0q+LN5dTfXvf5vMSaAzz7pSeQXyRYanySoWaDpy8+sZZez9rHKdn7PD+43VL1D
         H6TuSHIaFSK03YsGPbICax7rjYEMDpvdT9vrO4m1SD5ifkSW+u/O+W+WanIfDBaEx9b9
         bGBBycgIQYsCWQkWeubT9TFw9RThZRjFkv2BZfHbEq4uTT7ohoP3LFBVcOeqJA/swVeH
         fhqhPT2X24ZDPSSU5q92A1QtLvi9FJBvdNGTONTP8Ew0y1lxHtUQBbu+XJzMcttyP8L3
         jwvw==
X-Gm-Message-State: AOJu0YypjGyV1GD5GXIQ5dFnpqhHqfXsDAB2w+SNGcNgB1eO5WL3B3EN
	fR+icyqCKqs9ARDB9dxMdS8=
X-Google-Smtp-Source: AGHT+IGNgKA2tggoo8ssFL0zKai5UNRF86d4MEDqV+zq9foUkTbJFcP6xe9KlyRCsLFBGoaFwvXwyg==
X-Received: by 2002:a17:906:3050:b0:99c:6692:7f76 with SMTP id d16-20020a170906305000b0099c66927f76mr6869185ejd.16.1691328765775;
        Sun, 06 Aug 2023 06:32:45 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r4-20020a170906280400b00988e953a586sm3932281ejc.61.2023.08.06.06.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:32:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH v5 03/11] clk: sunxi-ng: a64: allow pll-mipi to set parent's rate
Date: Sun, 06 Aug 2023 15:32:43 +0200
Message-ID: <9144277.CDJkKcVGEf@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-3-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-3-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:48 CEST je Frank Oltmanns napisal(a):
> The nkm clock now supports setting the parent's rate. Utilize this
> option to find the optimal rate for pll-mipi.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c index 41519185600a..a139a5c438d4
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -179,7 +179,8 @@ static struct ccu_nkm pll_mipi_clk = {
>  	.common		= {
>  		.reg		= 0x040,
>  		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
> -					      &ccu_nkm_ops, 
CLK_SET_RATE_UNGATE),
> +					      &ccu_nkm_ops,
> +					      
CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT),
>  	},
>  };




