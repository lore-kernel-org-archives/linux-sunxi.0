Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBE1FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 21:22:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id o25so10039725ejm.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+uKYXdP+hAwjll7pb6aDF1MjtCeY9OgKItERoEDFSg=;
        b=Y571+BtPBWYPZsGiGOdArDW26sF3iP879gIGoq1PYMCSqpTHmyw5OjUyib1auiHcWu
         U9NBEqQ022G4sS/jPvnYqgJyu+QDbSh+QMaPYR4iVKGBTLCuhH/sdrtbYQ49YiPIpGh8
         Q/wl7NJYBsv9c3Ve/RqkERvGtijr7K/vZw2wLDDz785NWaiCluIEpj1Ik7OnL/X9xLK4
         ZTrN3rHXC57cPA9MhRiYDgWn0/V0Bb7dK13quB2gMS2z8HlFt0W3x6gbE7W1zTzkpMO8
         P35A8vISHrxUPmjSGf7Sj+SWS+LSasOO5B7FQ5+1WQa5LlkXdwCwetTz2E1vY7kQ6oO+
         C1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+uKYXdP+hAwjll7pb6aDF1MjtCeY9OgKItERoEDFSg=;
        b=o/fAOTFJLcTpL6omPNjCmtuwe5nK6fcKmi13apzok+kwU8pYnB4f2Zc8gA/4LHlhdk
         3dftdnwkFOZsLBvkdG33xbVFwKvr5f0/JtjFBjy6cyRZT+VwrrXMABLogHz1N4jCxG3p
         nv9VpYsApwYHEkU7WauwlAvTcVdGnPw5SgoTExVmzMeTtzpIHrFl6lpJEhzcNzPZTZMw
         CjhMfdv2FXHv2p313xn3w5skAPrDL+HR7tTfcBmjCfAs706rPDHoJwZVD1FhH9s7cwkF
         /X5Lua0UL9ctgzqONHZRwEf+sXizAs9ImL1WxUrVFoPSKDbxnpD0iLSOaWytZ85n269Y
         rFKQ==
X-Gm-Message-State: AJIora9TWlErdTZ3ct65XfH/Y6RKTTMh+cYSM5fmmeFNSGT33lklCHPG
	vb+t5R5o+X4d1IBNdoe5QLI=
X-Google-Smtp-Source: AGRyM1sOLUCI5Z9pSbtRpdrO9mrFZa/SyMFDPAV5MKgJCcdQqQI9BJPD2O7q5UNYywnj22S81PZOgg==
X-Received: by 2002:a17:907:6da2:b0:726:3ebd:9c9a with SMTP id sb34-20020a1709076da200b007263ebd9c9amr20960512ejc.628.1656796942425;
        Sat, 02 Jul 2022 14:22:22 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a4-20020a170906274400b00726b03f83a0sm7937837ejd.33.2022.07.02.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 14:22:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: daniel.lezcano@linaro.org, tglx@linutronix.de, wens@csie.org, samuel@sholland.org, Zhou jie <zhoujie@nfschina.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel@nfschina.com, Zhou jie <zhoujie@nfschina.com>
Subject: Re: [PATCH] drivers: remove unnecessary (void*) conversions.
Date: Sat, 02 Jul 2022 23:22:20 +0200
Message-ID: <2589523.X9hSmTKtgW@jernej-laptop>
In-Reply-To: <20220629062658.56466-1-zhoujie@nfschina.com>
References: <20220629062658.56466-1-zhoujie@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 29. junij 2022 ob 08:26:58 CEST je Zhou jie napisal(a):
> remove unnecessary void* type casting.
> 
> Signed-off-by: Zhou jie <zhoujie@nfschina.com>

Subject line should have "clocksource/drivers/sun4i:" prefix instead of 
"drivers:"

Best regards,
Jernej

> ---
>  drivers/clocksource/timer-sun4i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-sun4i.c
> b/drivers/clocksource/timer-sun4i.c index 0ba8155b8287..6fe71f95e2c2 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -131,7 +131,7 @@ static void sun4i_timer_clear_interrupt(void __iomem
> *base)
> 
>  static irqreturn_t sun4i_timer_interrupt(int irq, void *dev_id)
>  {
> -	struct clock_event_device *evt = (struct clock_event_device 
*)dev_id;
> +	struct clock_event_device *evt = dev_id;
>  	struct timer_of *to = to_timer_of(evt);
> 
>  	sun4i_timer_clear_interrupt(timer_of_base(to));




