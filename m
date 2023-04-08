Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB21841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 06:19:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id g17so1612562ejt.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Apr 2023 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680934758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgcJy21RXsX+WnLBMXtACX3Bntb4oinJMT7nG6mVd50=;
        b=i8fZxrIcEat0PonPYKXdIUCxgi4BlQOIcmrTFiwGn0M7tOUur3qXdEr0cRQupkCMNM
         QCkuVboBQZ0wHDFIPqHws87xve2uxbLi2e0Q2TaRsp1sATthIf9T7+q5UvMVQYURAfn9
         Rt/wnAfbxvj891Cn/jkxaVbV5/mrJkjHoJ+72hM96lg+PJGwwHsnx2iM6zCwnIglOlpV
         2tic7bQp/TumkqJMiM2OAD+2SinxNigh2/SNUDLWvCj2ZWlXSDeVqbWApsMa8UGUeZ7u
         1Pf7TMVShH0AXnoBEM4nBWEpyavQrmHWPVk/YBgvyDnZTfZx2/9Ipg6/NUWaU+KbncLO
         voqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680934758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgcJy21RXsX+WnLBMXtACX3Bntb4oinJMT7nG6mVd50=;
        b=m7/XbnHsux8x39M8l/udeLePnIH2yTCjXakAVWzsaB5+S3VEFdqKOOC7l3UeDDFRvv
         LUQVD7wC1n1ODdumF49K4kQ43J0N8dQGAyCKbouQRXuWcQ/Ly7msxZ1Upg00WrDd5GKc
         0xQqBy6iT8Lmwa9AYZW/1orBlGGw9cQI25Aau6MLZbQMKBnjAhwgPxfeN1cQ9IRM4Iwc
         6ykJnvtTN/l2nA746BqLp98bQig0vFh8IP+cwldXYBr4LJUnydPRAZ4hkhtCxhRQTz/W
         Q0dbiOBrOrf5opMspztzBoQ8wlx9tyo9kCo1MWJc00LIJF8H7GHrW/QzmW78Cy34OroZ
         hZEQ==
X-Gm-Message-State: AAQBX9dfgwjojDTs1c8EsVryknW0J/rJp7fv7xCeUpX/rdKk9SlcjgIw
	HfwVh3/LJjQJ2Dv1eMzyz9g=
X-Google-Smtp-Source: AKy350ahOwIXuABJsCud1WoIgKDF20/yDi6RTPmRqT3sV2pEIX9pMqhbCVNq8VuQBKBO6KRSbPM+Fw==
X-Received: by 2002:a17:906:4715:b0:949:8772:8195 with SMTP id y21-20020a170906471500b0094987728195mr1684972ejq.38.1680934757423;
        Fri, 07 Apr 2023 23:19:17 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b00930d22474dbsm2821217ejc.97.2023.04.07.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:19:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] sunxi: remove support for boot0 header reservation
Date: Sat, 08 Apr 2023 08:19:16 +0200
Message-ID: <4790687.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230405142731.1246503-2-andre.przywara@arm.com>
References:
 <20230405142731.1246503-1-andre.przywara@arm.com>
 <20230405142731.1246503-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 05. april 2023 ob 16:27:31 CEST je Andre Przywara napisal(a):
> In the early days of the Allwinner A64 U-Boot support, we relied on a
> vendor provided "boot0" binary to perform the DRAM initialisation. This
> replaced the SPL, and required to equip the U-Boot (proper) binary with
> a vendor specific header to be recognised as a valid boot0 payload.
> Fortunately these days are long gone (we gained SPL and DRAM support in
> early 2017!), and we never needed to use that hack on any later 64-bit
> Allwinner SoC.
> 
> Since this is highly obsolete by now, remove the Kconfig option and the
> small pieces of "code" associated with it.
> 
> Provide some comments about the purpose of the remaining boot0 code on
> the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I think it's time to remove this code too.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/include/asm/arch-sunxi/boot0.h | 18 +++++++++++-------
>  arch/arm/mach-sunxi/Kconfig             |  9 ---------
>  configs/a64-olinuxino-emmc_defconfig    |  1 -
>  configs/a64-olinuxino_defconfig         |  1 -
>  configs/amarula_a64_relic_defconfig     |  1 -
>  configs/bananapi_m64_defconfig          |  1 -
>  configs/nanopi_a64_defconfig            |  1 -
>  configs/oceanic_5205_5inmfd_defconfig   |  1 -
>  configs/orangepi_win_defconfig          |  1 -
>  configs/pine64_plus_defconfig           |  1 -
>  configs/sopine_baseboard_defconfig      |  1 -
>  11 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h
> b/arch/arm/include/asm/arch-sunxi/boot0.h index 59ea75a96b5..1a396f78488
> 100644
> --- a/arch/arm/include/asm/arch-sunxi/boot0.h
> +++ b/arch/arm/include/asm/arch-sunxi/boot0.h
> @@ -1,13 +1,17 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
> - * Configuration settings for the Allwinner A64 (sun50i) CPU
> + * Very early code for Allwinner 64-bit CPUs.
> + *
> + * The BROM runs entirely in AArch32 state, so the SPL is entered using
> this + * ISA. Depending on the rest of the firmware stack, this may also be
> true + * for U-Boot proper.
> + * Provide the "RMR reset into 64-bit" sequence, in AArch32 machine
> language, + * so that we can have all of U-Boot in AArch64. The first
> instruction is + * chosen so that if the CPU is already using AArch64, it
> will skip the code + * and jump straight to the reset vector.
>   */
> 
> -#if defined(CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER) &&
> !defined(CONFIG_SPL_BUILD) -/* reserve space for BOOT0 header information
> */
> -	b	reset
> -	.space	1532
> -#elif defined(CONFIG_ARM_BOOT_HOOK_RMR)
> +#ifdef CONFIG_ARM_BOOT_HOOK_RMR
>  /*
>   * Switch into AArch64 if needed.
>   * Refer to arch/arm/mach-sunxi/rmr_switch.S for the original source.
> @@ -47,7 +51,7 @@
>  	.word   CONFIG_TEXT_BASE
>  #endif
>  	.word	fel_stash - .
> -#else
> +#else	/* !CONFIG_ARM_BOOT_HOOK_RMR */
>  /* normal execution */
>  	b	reset
>  #endif
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index b46667ce01e..0527b3863a7 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -386,15 +386,6 @@ config MACH_SUN8I
>  	default y if MACH_SUN8I_R40
>  	default y if MACH_SUN8I_V3S
> 
> -config RESERVE_ALLWINNER_BOOT0_HEADER
> -	bool "reserve space for Allwinner boot0 header"
> -	select ENABLE_ARM_SOC_BOOT0_HOOK
> -	---help---
> -	Prepend a 1536 byte (empty) header to the U-Boot image file, to be
> -	filled with magic values post build. The Allwinner provided boot0
> -	blob relies on this information to load and execute U-Boot.
> -	Only needed on 64-bit Allwinner boards so far when using boot0.
> -
>  config ARM_BOOT_HOOK_RMR
>  	bool
>  	depends on ARM64
> diff --git a/configs/a64-olinuxino-emmc_defconfig
> b/configs/a64-olinuxino-emmc_defconfig index 8ec9eb3e9c2..a5989fab1c6
> 100644
> --- a/configs/a64-olinuxino-emmc_defconfig
> +++ b/configs/a64-olinuxino-emmc_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-olinuxino-emmc"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUPPORT_EMMC_BOOT=y
> diff --git a/configs/a64-olinuxino_defconfig
> b/configs/a64-olinuxino_defconfig index 16cef18beef..0b469c25d0d 100644
> --- a/configs/a64-olinuxino_defconfig
> +++ b/configs/a64-olinuxino_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-olinuxino"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=y
> diff --git a/configs/amarula_a64_relic_defconfig
> b/configs/amarula_a64_relic_defconfig index ae44b66d109..292af6e372e 100644
> --- a/configs/amarula_a64_relic_defconfig
> +++ b/configs/amarula_a64_relic_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-amarula-relic"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>  # CONFIG_VIDEO_DE2 is not set
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
> index 99dc2f7d209..d957071cb13 100644
> --- a/configs/bananapi_m64_defconfig
> +++ b/configs/bananapi_m64_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-bananapi-m64"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUPPORT_EMMC_BOOT=y
> diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
> index 70fc257eebd..608238757ba 100644
> --- a/configs/nanopi_a64_defconfig
> +++ b/configs/nanopi_a64_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-nanopi-a64"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=y
>  CONFIG_USB_EHCI_HCD=y
> diff --git a/configs/oceanic_5205_5inmfd_defconfig
> b/configs/oceanic_5205_5inmfd_defconfig index 2ebca673808..6cdcf782bee
> 100644
> --- a/configs/oceanic_5205_5inmfd_defconfig
> +++ b/configs/oceanic_5205_5inmfd_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-oceanic-5205-5inmfd"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
>  CONFIG_DRAM_CLK=552
>  CONFIG_DRAM_ZQ=3881949
> diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
> index 3b78ad7e52d..df11ad8c8fd 100644
> --- a/configs/orangepi_win_defconfig
> +++ b/configs/orangepi_win_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-orangepi-win"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_MACPWR="PD14"
>  CONFIG_SPL_SPI_SUNXI=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
> index f42f4e5923a..08c13b58a1e 100644
> --- a/configs/pine64_plus_defconfig
> +++ b/configs/pine64_plus_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-pine64-plus"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_PINE64_DT_SELECTION=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_OF_LIST="sun50i-a64-pine64 sun50i-a64-pine64-plus"
> diff --git a/configs/sopine_baseboard_defconfig
> b/configs/sopine_baseboard_defconfig index a5e1478c117..d9b0eb37c54 100644
> --- a/configs/sopine_baseboard_defconfig
> +++ b/configs/sopine_baseboard_defconfig
> @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-sopine-baseboard"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I=y
> -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
>  CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
>  CONFIG_DRAM_CLK=552
>  CONFIG_DRAM_ZQ=3881949




