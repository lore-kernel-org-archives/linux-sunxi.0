Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73168110F
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 03:15:19 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-777b4c9e341so161853939f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Jun 2023 20:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687144518; x=1689736518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fEGoGkpefyU2ysb5vxtmJYfOveIj6J0uDhKj28oKMU=;
        b=iiC20Fg8UjGFgGW6LdSjsG3QxVjBnWzE1FiuefW4l5bYF10EFsEkEwskWfUwSY3aFb
         nLIN3nFG+eLAetLnrFtKaEL4iIgacFDWq3V/BFGI7AcNlC+JP3sKb90gjT0ztgQGT8AP
         Iwh5eB8jZKG+ukSEeGg1MBFsX3kE04mHB8BTAz7QMVWQX/s+xFTCWuAbO2o5X9oqSRNj
         mjOprV+j+xzNN+ABgqmEm5StulpSlkkNt8fylOgaMZ+zgW62dINjnCuqsMLoTD3bYRHM
         IN77FUgun653o01JS92biT1lKsZPAI/zXeiNK0NxQs7qcJOy2xKkRYTYDBqWkNWY4rO/
         P+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687144518; x=1689736518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fEGoGkpefyU2ysb5vxtmJYfOveIj6J0uDhKj28oKMU=;
        b=QqOWhiAEAIE6IlMkZI5Q5KNH10KrMYdPm+8VE8Hn/vin1hyEeWx23edcZOFCkho+rp
         tgaNz13lZ8YCyvXWiY99z8Q+Az5gqnfNzWjMV+5fTv9rU4BpInsT9pAAX+hVDyWxCx1I
         O/ALen6BUPDOwKeaHiHyM6HKX/VP5hVKREB4w3DzkuE7i7OTiNnUeaxaNW6RZ7CavCKx
         jTmTIIOAcPqWyKtjWcACyGR4JnFpr9lXQGhjdWjFBxf/L6JDH1OWoDBbCEJ71fex13Y6
         OmRM2QcwGgNb/bf2LvUceKWdHJNeQa/vDfCV14nWO7BhaymuwFs1JiNzw0cgzMEna0rF
         OqlA==
X-Gm-Message-State: AC+VfDzmTDqgic8I4EgZ/69wbZTKs73eOqiMwkK004YI4K6cW4shNIm4
	/6uLH2Ga7OjSv0lPtQlapBo=
X-Google-Smtp-Source: ACHHUZ6PDJ1v+df7aUjN8kknUGMaLDGAlGMwnR1LYA/sbHSjqXi3pk+GFu0AfCB5iMtwtoYY0Rv5Dw==
X-Received: by 2002:a5e:a91a:0:b0:753:ca30:6bb0 with SMTP id c26-20020a5ea91a000000b00753ca306bb0mr8642547iod.4.1687144518212;
        Sun, 18 Jun 2023 20:15:18 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:dcc3:8835:ea36:687? ([2001:470:42c4:101:dcc3:8835:ea36:687])
        by smtp.gmail.com with ESMTPSA id t25-20020a6b0919000000b0077a1d1029fcsm8382899ioi.28.2023.06.18.20.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 20:15:17 -0700 (PDT)
Message-ID: <f07b38e6-d9ba-f385-b363-ebc5b6f17214@gmail.com>
Date: Sun, 18 Jun 2023 21:15:16 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] sunxi: Kconfig: rework PHY_USB_SUN4I selection
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Marek Vasut <marex@denx.de>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?B?6Lev6L6J?= <luhux76@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20230611233241.14235-1-andre.przywara@arm.com>
 <20230611233241.14235-4-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230611233241.14235-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/23 17:32, Andre Przywara wrote:
> At the moment we use "select" in each Allwinner SoC's Kconfig section to
> include the USB PHY driver in the build. This means it cannot be disabled
> via Kconfig, although USB is not really a strictly required core
> functionality, and a particular board might not even include USB ports.
> 
> Rework the Kconfig part by removing the "select" lines for each SoC's
> section, and instead letting it default to "y" in the PHY driver section
> itself. We use "depends on !" to exclude the few SoCs we don't support
> (yet). The Allwinner V3s does not enable USB (PHY) support at the moment,
> even though it should work: let the PHY default to "n" to keep the
> current behaviour.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>   arch/arm/mach-sunxi/Kconfig   | 11 -----------
>   drivers/phy/allwinner/Kconfig |  6 +++++-
>   2 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 6dcbb096f74..e0b1bde35a9 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -207,7 +207,6 @@ endif
>   
>   config MACH_SUNXI_H3_H5
>   	bool
> -	select PHY_SUN4I_USB
>   	select SUNXI_DE2
>   	select SUNXI_DRAM_DW
>   	select SUNXI_DRAM_DW_32BIT
> @@ -236,7 +235,6 @@ config MACH_SUNIV
>   config MACH_SUN4I
>   	bool "sun4i (Allwinner A10)"
>   	select CPU_V7A
> -	select PHY_SUN4I_USB
>   	select DRAM_SUN4I
>   	select SUNXI_GEN_SUN4I
>   	select SUPPORT_SPL
> @@ -247,7 +245,6 @@ config MACH_SUN5I
>   	bool "sun5i (Allwinner A13)"
>   	select CPU_V7A
>   	select DRAM_SUN4I
> -	select PHY_SUN4I_USB
>   	select SUNXI_GEN_SUN4I
>   	select SUPPORT_SPL
>   	imply SPL_SYS_I2C_LEGACY
> @@ -261,7 +258,6 @@ config MACH_SUN6I
>   	select ARCH_SUPPORT_PSCI
>   	select SPL_ARMV7_SET_CORTEX_SMPEN
>   	select DRAM_SUN6I
> -	select PHY_SUN4I_USB
>   	select SPL_I2C
>   	select SUN6I_PRCM
>   	select SUNXI_GEN_SUN6I
> @@ -277,7 +273,6 @@ config MACH_SUN7I
>   	select ARCH_SUPPORT_PSCI
>   	select SPL_ARMV7_SET_CORTEX_SMPEN
>   	select DRAM_SUN4I
> -	select PHY_SUN4I_USB
>   	select SUNXI_GEN_SUN4I
>   	select SUPPORT_SPL
>   	select ARMV7_BOOT_SEC_DEFAULT if OLD_SUNXI_KERNEL_COMPAT
> @@ -291,7 +286,6 @@ config MACH_SUN8I_A23
>   	select CPU_V7_HAS_VIRT
>   	select ARCH_SUPPORT_PSCI
>   	select DRAM_SUN8I_A23
> -	select PHY_SUN4I_USB
>   	select SPL_I2C
>   	select SUNXI_GEN_SUN6I
>   	select SUPPORT_SPL
> @@ -305,7 +299,6 @@ config MACH_SUN8I_A33
>   	select CPU_V7_HAS_VIRT
>   	select ARCH_SUPPORT_PSCI
>   	select DRAM_SUN8I_A33
> -	select PHY_SUN4I_USB
>   	select SPL_I2C
>   	select SUNXI_GEN_SUN6I
>   	select SUPPORT_SPL
> @@ -316,7 +309,6 @@ config MACH_SUN8I_A83T
>   	bool "sun8i (Allwinner A83T)"
>   	select CPU_V7A
>   	select DRAM_SUN8I_A83T
> -	select PHY_SUN4I_USB
>   	select SPL_I2C
>   	select SUNXI_GEN_SUN6I
>   	select MMC_SUNXI_HAS_NEW_MODE
> @@ -344,7 +336,6 @@ config MACH_SUN8I_R40
>   	select SUPPORT_SPL
>   	select SUNXI_DRAM_DW
>   	select SUNXI_DRAM_DW_32BIT
> -	select PHY_SUN4I_USB
>   	imply SPL_SYS_I2C_LEGACY
>   
>   config MACH_SUN8I_V3S
> @@ -372,7 +363,6 @@ config MACH_SUN9I
>   config MACH_SUN50I
>   	bool "sun50i (Allwinner A64)"
>   	select ARM64
> -	select PHY_SUN4I_USB
>   	select SUN6I_PRCM
>   	select SUNXI_DE2
>   	select SUNXI_GEN_SUN6I
> @@ -395,7 +385,6 @@ config MACH_SUN50I_H5
>   config MACH_SUN50I_H6
>   	bool "sun50i (Allwinner H6)"
>   	select ARM64
> -	select PHY_SUN4I_USB
>   	select DRAM_SUN50I_H6
>   	select SUN50I_GEN_H6
>   
> diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
> index f8f1e99c4f5..565b4617b01 100644
> --- a/drivers/phy/allwinner/Kconfig
> +++ b/drivers/phy/allwinner/Kconfig
> @@ -4,6 +4,10 @@
>   config PHY_SUN4I_USB
>   	bool "Allwinner Sun4I USB PHY driver"
>   	depends on ARCH_SUNXI
> +	depends on !MACH_SUN9I
> +	depends on !MACH_SUN50I_H616
> +	default n if MACH_SUN8I_V3S
> +	default y
>   	select DM_REGULATOR
>   	select PHY
>   	help
> @@ -11,7 +15,7 @@ config PHY_SUN4I_USB
>   	  sunxi SoCs.
>   
>   	  This driver controls the entire USB PHY block, both the USB OTG
> -	  parts, as well as the 2 regular USB 2 host PHYs.
> +	  parts, as well as the regular USB HCI host PHYs.
>   
>   config INITIAL_USB_SCAN_DELAY
>   	int "Delay initial USB scan by x ms to allow builtin devices to init"

This does result in PHY_USB_SUN4I being enabled by default, so I guess:
Tested-by: Sam Edwards <CFSworks@gmail.com>

However, it's now possible to (attempt to) build the mUSB driver with 
PHY_USB_SUN4I switched off, resulting in link errors. Should the proper 
"depends on" be added under USB_MUSB_SUNXI?

Best,
Sam
