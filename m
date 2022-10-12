Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892E321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:33:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id m15so63074edb.13
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejhadf5DlkzFyiuyCq+1IGpgbobeNnocaDSFM48JnPM=;
        b=HqXGne1OUNwKssa4OrkXLKIyOpmApp/MJ2zvUgq8bd/v9bzqcYG/9yze3mxhJMff8v
         7L9zCm6ljl+Jj+0vbumTxUCglF0CFSRbmasHGT7Rtgh48BqBIqW+amIAPfL5e/08oAjB
         bg+do8yTaB4o/LuqADJPR8SyVqsa4nh0d22Qdsj8jpL7YrU+4gqmJeccE37JFt2Cizcs
         UKIyzJ+YMxs2EXFkTuPsLPeyI4/TqNw02zODZcj5aMmx8UISQO2TmdJ4HkVzW/X3X4Bp
         Wbt0qUBX8zirTtsHZxJ1faZQ0myOElR9r42cnMwP8WleX3BsSnHJtq9zi5O5M/StJLYo
         xm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejhadf5DlkzFyiuyCq+1IGpgbobeNnocaDSFM48JnPM=;
        b=mEwWUl1wtWABRSpkGwoXF1SMelc4bQrLLwhSCZVeMtToONH6gzrFAQl1rHUND0CGEb
         YDLpBlPWJtrbMnCIKLQrG3t3pQRDf/YMbTRPqwQ5UHb9DuBMiQ4mt6wkVx69YmFc09We
         gVucRzSJhLkM8PFLMr3u+kuZA+7o4lEFH8aqc+AobpjYA9UMkkHDjZEO2R+jiZbHCI9d
         Qf/agWNA8DHCVPr8eLTx2jb1YD3/oNalxVLaeGUJPdSUPfuHcfVe/JNsTuir0Daj/8sC
         JEHTQF1JapiBc3xvbYX2qQ55Qe1tl2kraQqK3yQCIGo3gUGh1SxTfddSlA0WAwowLvRo
         hdmQ==
X-Gm-Message-State: ACrzQf2wAmmV0v4kKZBENjfcvzOgXtPKrULNawQCI3TdKR3EurhyP664
	eX7XWYiRBNE/1/HAoZATYvoe1gCG/npDyZJS
X-Google-Smtp-Source: AMsMyM5bIsPYJIHIJXZpirvYowp31mp8t+2FrHmZ27Ry0XdPUgqlAzYJm4rhoSXJ33KKdnCfRkskEg==
X-Received: by 2002:a05:6402:50cf:b0:45c:dfce:66ae with SMTP id h15-20020a05640250cf00b0045cdfce66aemr494811edb.370.1665610409384;
        Wed, 12 Oct 2022 14:33:29 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a20-20020aa7cf14000000b00458dc7e8ecasm12022950edy.72.2022.10.12.14.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:33:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/6] sunxi: Kconfig: introduce SUNXI_MINIMUM_DRAM_MB
Date: Wed, 12 Oct 2022 23:33:27 +0200
Message-ID: <2128489.Icojqenx9y@kista>
In-Reply-To: <20221012163458.1968900-2-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:34:53 CEST je Andre Przywara napisal(a):
> Traditionally we assumed that every Allwinner board would come with at
> least 256 MB of DRAM, and set our DRAM layout accordingly. This affected
> both the default load addresses, but also U-Boot's own address
> expectations (like being loaded at 160 MB).
> 
> Some SoCs come with co-packaged DRAM, but only provide 32 or 64MB. So
> far we special-cased those *chips*, as there was only one chip per DRAM
> size. However new chips force us to take a more general approach.
> 
> Introduce a Kconfig symbol, which provides the minimum DRAM size of the
> board. If nothing else is specified, we use 256 MB, and default to
> smaller values for those co-packaged SoCs.
> Then select the different DRAM maps according to this new symbol, so
> that different SoCs with the same DRAM size can share those definitions.
> 
> Inspired by an idea from Icenowy.
> 
> This is just refactoring: compiled for all boards before and after this
> patch: the binaries were identical.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Nice approach.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  Kconfig                        |  6 +++---
>  arch/arm/mach-sunxi/Kconfig    | 12 ++++++++++++
>  boot/Kconfig                   |  4 ++--
>  include/configs/sunxi-common.h | 31 +++++++++++++++++--------------
>  4 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/Kconfig b/Kconfig
> index 2ea735d38e4..d297513bac6 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -312,9 +312,9 @@ config SYS_MALLOC_LEN
>  	default 0x4000000 if SANDBOX
>  	default 0x2000000 if ARCH_ROCKCHIP || ARCH_OMAP2PLUS || ARCH_MESON
>  	default 0x200000 if ARCH_BMIPS || X86
> -	default 0x120000 if MACH_SUNIV
> -	default 0x220000 if MACH_SUN8I_V3S
> -	default 0x4020000 if ARCH_SUNXI
> +	default 0x4020000 if SUNXI_MINIMUM_DRAM_MB >= 256
> +	default 0x220000 if SUNXI_MINIMUM_DRAM_MB >= 64
> +	default 0x120000 if SUNXI_MINIMUM_DRAM_MB >= 32
>  	default 0x400000
>  	help
>  	  This defines memory to be allocated for Dynamic allocation
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 6b16f43494f..9aa66deb9fd 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -615,6 +615,18 @@ config SYS_BOARD
>  config SYS_SOC
>  	default "sunxi"
> 
> +config SUNXI_MINIMUM_DRAM_MB
> +	int "minimum DRAM size"
> +	default 32 if MACH_SUNIV
> +	default 64 if MACH_SUN8I_V3S
> +	default 256
> +	---help---
> +	Minimum DRAM size expected on the board. Traditionally we assumed
> +	256 MB, so that U-Boot would load at 160MB. With co-packaged DRAM
> +	we have smaller sizes, though, so that U-Boot's own load address 
and
> +	the default payload addresses must be shifted down.
> +	This is expected to be fixed by the SoC selection.
> +
>  config UART0_PORT_F
>  	bool "UART0 on MicroSD breakout board"
>  	---help---
> diff --git a/boot/Kconfig b/boot/Kconfig
> index 6b3b8f072cb..45f86e946cd 100644
> --- a/boot/Kconfig
> +++ b/boot/Kconfig
> @@ -499,8 +499,8 @@ config SYS_TEXT_BASE
>  	default 0x80800000 if ARCH_OMAP2PLUS || ARCH_K3
>  	default 0x81700000 if MACH_SUNIV
>  	default 0x2a000000 if MACH_SUN9I
> -	default 0x42e00000 if MACH_SUN8I_V3S
> -	default 0x4a000000 if ARCH_SUNXI
> +	default 0x4a000000 if SUNXI_MINIMUM_DRAM_MB >= 256
> +	default 0x42e00000 if SUNXI_MINIMUM_DRAM_MB >= 64
>  	hex "Text Base"
>  	help
>  	  The address in memory that U-Boot will be running from, 
initially.
> diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
> index 0f0ef4f64bb..416a0422861 100644
> --- a/include/configs/sunxi-common.h
> +++ b/include/configs/sunxi-common.h
> @@ -135,7 +135,21 @@
>  #define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(FE00000))
>  #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(FF00000))
> 
> -#elif defined(CONFIG_MACH_SUN8I_V3S)
> +#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 256)
> +/*
> + * 160M RAM (256M minimum minus 64MB heap + 32MB for u-boot, stack, fb,
> etc. + * 32M uncompressed kernel, 16M compressed kernel, 1M fdt,
> + * 1M script, 1M pxe, 1M dt overlay and the ramdisk at the end.
> + */
> +#define BOOTM_SIZE        __stringify(0xa000000)
> +#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(2000000))
> +#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(3000000))
> +#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(3100000))
> +#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(3200000))
> +#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(3300000))
> +#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(3400000))
> +
> +#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 64)
>  /*
>   * 64M RAM minus 2MB heap + 16MB for u-boot, stack, fb, etc.
>   * 16M uncompressed kernel, 8M compressed kernel, 1M fdt,
> @@ -149,7 +163,7 @@
>  #define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(1B00000))
>  #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(1C00000))
> 
> -#elif defined(CONFIG_MACH_SUNIV)
> +#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 32)
>  /*
>   * 32M RAM minus 1MB heap + 8MB for u-boot, stack, fb, etc.
>   * 8M uncompressed kernel, 4M compressed kernel, 512K fdt,
> @@ -164,18 +178,7 @@
>  #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(0D60000))
> 
>  #else
> -/*
> - * 160M RAM (256M minimum minus 64MB heap + 32MB for u-boot, stack, fb,
> etc. - * 32M uncompressed kernel, 16M compressed kernel, 1M fdt,
> - * 1M script, 1M pxe, 1M dt overlay and the ramdisk at the end.
> - */
> -#define BOOTM_SIZE        __stringify(0xa000000)
> -#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(2000000))
> -#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(3000000))
> -#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(3100000))
> -#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(3200000))
> -#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(3300000))
> -#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(3400000))
> +#error Need at least 32MB of DRAM. Please adjust load addresses.
>  #endif
> 
>  #define MEM_LAYOUT_ENV_SETTINGS \
> --
> 2.25.1


