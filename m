Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5C63D
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9qRre6m"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so21969411fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697870048; x=1698474848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbC8h87UzfIRhyP1Qyy4557yzyg0hbjTmbjmrlFgJJI=;
        b=k9qRre6mv5FmudR/e+xirgIUkloYdV8A7q3Mhh6g1EUF/+FUHJCmnZ+glbf+WbJl8w
         y1m/ACzZBWBxpYFHhYFWowoJhGspeoWLq5tanR5wdEA0QPoLTAFvpXEeVKMZwIL9DBFE
         QHfXS27kG6YUFMz8G8fOMrdWo/tXyFebMbqvDWQ+KmSFwLMwpPsM3KTBU76ROSt1JqmD
         DN5qFjdMI8RDDKPdIT6UzsviXOrd2ubtHk6iab2xbWDukXGOV5Ojr5CmVHur2XsYbp+7
         d2s+t4TtbcnRgrDbsu5WExZVkEJ0EayKC1GZIPDggTDyH+25Fv3zpb9DKV2nh1H1GjaA
         P9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697870048; x=1698474848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbC8h87UzfIRhyP1Qyy4557yzyg0hbjTmbjmrlFgJJI=;
        b=Qp/B7L7/Vadr4+XGt6Hc2ehLzWNxS9UTTXAlIdVuTiepNv7dPIymkK6ktTZWy195eX
         oAwNGcqdVUt8UTWrc0jwd0qdjVffoH2lxiJSLRKENGVpiLv8HrRzIJby3YC0MxenH4jf
         ZmQtvz/emXiIzD/fQmFFUePT5BWu2l2MW5F1i7IkNr3bpGYF0Woj1IM4CF928t/uM6JC
         TYzRkThmqyIzk0PJx65KhuyNGUOcr+9Pbd3QyAaat+ug649BNoKUVzKJ3yX8S2Jx6sxR
         1A8kR4kYhYUmWAMxjIJqaYjGonZ6wAIajN0EeRUmznrEfyWyseoyDwGEqJkctou99FXU
         MdDg==
X-Gm-Message-State: AOJu0YxLPdLIUwdds6/rJJEWXGuLrDplhWlaGlYkAi8rpUOgnGfAjSaq
	x3GbDzvcT/+XKDO1koT99to=
X-Google-Smtp-Source: AGHT+IFehPW9UTf/d6o2gWO/RK9QDYe3YJqOmgQwojr59juPzciY/jFMsGBIp9X054loBe0wM/89/Q==
X-Received: by 2002:a05:651c:b20:b0:2c5:2298:d44e with SMTP id b32-20020a05651c0b2000b002c52298d44emr3017644ljr.5.1697870047739;
        Fri, 20 Oct 2023 23:34:07 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c1c0f00b003fefb94ccc9sm3773524wms.11.2023.10.20.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 23:34:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 SASANO Takayoshi <uaa@mx5.nisiq.net>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] sunxi: board: simplify early PMIC setup conditions
Date: Sat, 21 Oct 2023 08:34:06 +0200
Message-ID: <1965267.usQuhbGJ8B@archlinux>
In-Reply-To: <20231018155014.383566-2-andre.przywara@arm.com>
References:
 <20231018155014.383566-1-andre.przywara@arm.com>
 <20231018155014.383566-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, October 18, 2023 5:50:12 PM CEST Andre Przywara wrote:
> So far we have a convoluted #ifdef mesh that guards the early AXP PMIC
> setup in board.c. That combination of &&, || and negations is very hard
> to read, maintain and especially to extend.
> 
> Fortunately we have those same conditions already modelled in the
> Kconfig file, so they are actually redundant. On top of that the real
> reason we have those preprocessor guards in the first place is about the
> symbols that are *conditionally* defined: without #ifdefs the build
> would break because of them being undefined for many boards.
> 
> To simplify this, just change the guards to actually look at the symbols
> needed, so CONFIG_AXP_xxx_VOLT instead of CONFIG_AXPyyy_POWER.
> This drastically improves the readability of this code, and makes adding
> PMIC support a pure Kconfig matter.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/board.c   | 32 ++++++++++++++------------------
>  drivers/power/Kconfig |  2 +-
>  2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index ebaa9431984..65d79a02c25 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -597,50 +597,46 @@ void sunxi_board_init(void)
>  		}
>  	}
> 
> -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> -	defined CONFIG_AXP818_POWER
> +#ifdef CONFIG_AXP_DCDC1_VOLT
>  	power_failed |= axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
> +	power_failed |= axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
>  #endif
> -#if !defined(CONFIG_AXP305_POWER)
> +#ifdef CONFIG_AXP_DCDC2_VOLT
>  	power_failed |= axp_set_dcdc2(CONFIG_AXP_DCDC2_VOLT);
>  	power_failed |= axp_set_dcdc3(CONFIG_AXP_DCDC3_VOLT);
>  #endif
> -#if !defined(CONFIG_AXP209_POWER) && !defined(CONFIG_AXP818_POWER)
> +#ifdef CONFIG_AXP_DCDC4_VOLT
>  	power_failed |= axp_set_dcdc4(CONFIG_AXP_DCDC4_VOLT);
>  #endif
> -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> -	defined CONFIG_AXP818_POWER
> -	power_failed |= axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
> -#endif
> 
> -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> -	defined CONFIG_AXP818_POWER
> +#ifdef CONFIG_AXP_ALDO1_VOLT
>  	power_failed |= axp_set_aldo1(CONFIG_AXP_ALDO1_VOLT);
>  #endif
> -#if !defined(CONFIG_AXP305_POWER)
> +#ifdef CONFIG_AXP_ALDO2_VOLT
>  	power_failed |= axp_set_aldo2(CONFIG_AXP_ALDO2_VOLT);
>  #endif
> -#if !defined(CONFIG_AXP152_POWER) && !defined(CONFIG_AXP305_POWER)
> +#ifdef CONFIG_AXP_ALDO3_VOLT
>  	power_failed |= axp_set_aldo3(CONFIG_AXP_ALDO3_VOLT);
>  #endif
> -#ifdef CONFIG_AXP209_POWER
> +#ifdef CONFIG_AXP_ALDO4_VOLT
>  	power_failed |= axp_set_aldo4(CONFIG_AXP_ALDO4_VOLT);
>  #endif
> 
> -#if defined(CONFIG_AXP221_POWER) || defined(CONFIG_AXP809_POWER) || \
> -	defined(CONFIG_AXP818_POWER)
> +#ifdef CONFIG_AXP_DLDO1_VOLT
>  	power_failed |= axp_set_dldo(1, CONFIG_AXP_DLDO1_VOLT);
>  	power_failed |= axp_set_dldo(2, CONFIG_AXP_DLDO2_VOLT);
> -#if !defined CONFIG_AXP809_POWER
> +#endif
> +#ifdef CONFIG_AXP_DLDO3_VOLT
>  	power_failed |= axp_set_dldo(3, CONFIG_AXP_DLDO3_VOLT);
>  	power_failed |= axp_set_dldo(4, CONFIG_AXP_DLDO4_VOLT);
>  #endif
> +#ifdef CONFIG_AXP_ELDO1_VOLT
>  	power_failed |= axp_set_eldo(1, CONFIG_AXP_ELDO1_VOLT);
>  	power_failed |= axp_set_eldo(2, CONFIG_AXP_ELDO2_VOLT);
>  	power_failed |= axp_set_eldo(3, CONFIG_AXP_ELDO3_VOLT);
>  #endif
> 
> -#ifdef CONFIG_AXP818_POWER
> +#ifdef CONFIG_AXP_FLDO1_VOLT
>  	power_failed |= axp_set_fldo(1, CONFIG_AXP_FLDO1_VOLT);
>  	power_failed |= axp_set_fldo(2, CONFIG_AXP_FLDO2_VOLT);
>  	power_failed |= axp_set_fldo(3, CONFIG_AXP_FLDO3_VOLT);
> @@ -649,7 +645,7 @@ void sunxi_board_init(void)
>  #if defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER
>  	power_failed |= axp_set_sw(IS_ENABLED(CONFIG_AXP_SW_ON));
>  #endif
> -#endif
> +#endif	/* CONFIG_AXPxxx_POWER */
>  	printf("DRAM:");
>  	gd->ram_size = sunxi_dram_init();
>  	printf(" %d MiB\n", (int)(gd->ram_size >> 20));
> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index 7f3b990d231..83cb31c937a 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -180,7 +180,7 @@ config AXP_DCDC3_VOLT
> 
>  config AXP_DCDC4_VOLT
>  	int "axp pmic dcdc4 voltage"
> -	depends on AXP152_POWER || AXP221_POWER || AXP809_POWER || 
AXP818_POWER ||
> AXP305_POWER +	depends on AXP152_POWER || AXP221_POWER || AXP809_POWER 
||
> AXP305_POWER default 1250 if AXP152_POWER
>  	default 1200 if MACH_SUN6I
>  	default 0 if MACH_SUN8I

This patch is great, but this last change doesn't seem to be directly 
connected?

Best regards,
Jernej



