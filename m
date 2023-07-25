Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CD1F188
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 21:21:21 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7835ae70e46so231244439f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690320081; x=1690924881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejl2rfjsmb90IERDNkIOn7yrff20Ist6wXDZxeE7lOY=;
        b=XKfewPS3+ycM3KLZ6+lHyJUv6IHGXuIoUKw/rl+4IK1ufw4gGiie1L9aK7HOrN+gBi
         Myh1sFmOS2YUPqKyhecR2TN1yrBeANTGk/ZudSuteEFkP4ZvdL3OrdBxawxeh1d99ok+
         zakOYnA35ZUCX8kksxXwEHkjUYQnZn2G3Su2cXWmV7n+FNGPxHULc7fntzGjntp+8p+q
         UYSHadootDkhOUSYyj9UGy0IxBxdztnnZ9rNX4TB6LKm4wjs977Ap1V8tfMXRASZMaUU
         b1rZP8e75f6qDyucxuIlf4X9Je4EZIoZNH3cUueYcFr9e/uxibcNCuPYNt7CyW+JTR9Z
         t3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690320081; x=1690924881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejl2rfjsmb90IERDNkIOn7yrff20Ist6wXDZxeE7lOY=;
        b=ON8Rq8TydvYRcEMgCGFaRX7prdlCihXSCllVxrJ/XyA5NeMwgF+Ogt7MquoXmGWREk
         fzdYkDDiOwlO8hmqRDR/YtgOQ4RaE1vXPDO1IcBfqYIWOmWljgF+kEOLuhyLcnZOih2Y
         kBcqA0mhAJSpyyacZw1KXiJs9fO+HHnxZ5Mj0/Jqra17TjPHVYb5tIwFWGnZAPi/XAmA
         VNhpMzFWrkHq7GAh7Wm1y+elchUyQGOgl9dScD9E3jYu5ENlPOz38FPeHjng1cDqfo2y
         a8KfRnmh7oTg71usHoT07sf5q1wEwtQR9bNertqTebmCpid5siSnS/9++7a19iC4Q3If
         bh2Q==
X-Gm-Message-State: ABy/qLYcY9b3JPkPowKo8LhRydlYpM3o1UYzDcHaVUHelH2lWSfd8AUT
	w3n6Z/z3HOjjaFjR4Csdtw2/qJ50wAXRJQ==
X-Google-Smtp-Source: APBJJlF20JBnU5M5/frWrtQ1GGMjqvTM5NaTeS5ATNCXaX5x6DY+0Xih/xULnaXAIyd25UOoDpGHdg==
X-Received: by 2002:a6b:f001:0:b0:783:727b:7073 with SMTP id w1-20020a6bf001000000b00783727b7073mr94175ioc.20.1690320080918;
        Tue, 25 Jul 2023 14:21:20 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:a777:7df3:b9ec:588b? ([2001:470:42c4:101:a777:7df3:b9ec:588b])
        by smtp.gmail.com with ESMTPSA id l6-20020a02a886000000b0042b2e90ed06sm3938548jam.23.2023.07.25.14.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 14:21:20 -0700 (PDT)
Message-ID: <30dd62cd-33e9-a872-fe0c-287e68c8d9ef@gmail.com>
Date: Tue, 25 Jul 2023 15:21:19 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/20] sunxi: remove CONFIG_MACPWR
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-3-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

Series looks good so far! I'm trying to move my testing build over to it 
now; I will report back when I've been running on it for a little bit.

On 7/21/23 07:45, Andre Przywara wrote:
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 7ac50c4ae8c..2db4a2d73ca 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -187,7 +187,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
>   /* add board specific code here */
>   int board_init(void)
>   {
> -	__maybe_unused int id_pfr1, ret, macpwr_pin;
> +	__maybe_unused int id_pfr1, ret;
>   
>   	gd->bd->bi_boot_params = (PHYS_SDRAM_0 + 0x100);
>   
> @@ -224,15 +224,6 @@ int board_init(void)
>   	if (ret)
>   		return ret;
>   
> -	/* strcmp() would look better, but doesn't get optimised away. */
> -	if (CONFIG_MACPWR[0]) {
> -		macpwr_pin = sunxi_name_to_gpio(CONFIG_MACPWR);
> -		if (macpwr_pin >= 0) {
> -			gpio_request(macpwr_pin, "macpwr");
> -			gpio_direction_output(macpwr_pin, 1);
> -		}
> -	}

This version of your series does not include the CONFIG_SATAPWR removal 
(is that intentional or did you miss it?) so these hunks do not apply 
against master. I was able to cherry-pick the rc series version of the 
CONFIG_SATAPWR removal and everything applied fine. Just thought you 
should know!

Cheers,
Sam
