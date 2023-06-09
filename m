Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990822D61
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:29:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso21589345e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686342578; x=1688934578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcEqnQrFd3mgFBtWsADlMbCpvozzm7xABYQxFiwSrjI=;
        b=d+70ExT5dRraLMDptlSvdJYrVeijCa7xXUq9NFcNGFEQUbIQQ6q+RX/xqWGfZLNLmr
         Erji3q5Rc1DwxiHHJ0MTM8Gcngs8L340fq02oVWyh5QWtHvUaswMpHC3u6p/7x4cKoKQ
         0X1cnziZokhnRHAYOdGhqfNmybKmR95sJcy0Zjjdu43jApjZEJddqsYrsocUaQHkX3Lb
         M5Q0ckK+HnoXUn0T7YL754pmtNIP7+aQ17kONfZMtpVFPA0FWvmi/kKY3QMxFl17iJe6
         Lex7euFmo8f5gDLTvZtdcBItFNlzGzqDsnRqPgeWT9csKKHe3rXPZB10ypgCZkusGa2h
         29rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686342578; x=1688934578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcEqnQrFd3mgFBtWsADlMbCpvozzm7xABYQxFiwSrjI=;
        b=D09PkiSULZbXiOtaMdKMNHOA5Cgmm+iebr8nu9chpCBtmLotx2+3otMF1OKmxmtJyT
         QviV+nrrL9Nn9RNJvgfIrCNfMwDCtnMyp0KVC4nCGPkAwDVa5hHsCmHrFP/dGoVtFqi9
         kC3Gfovd5ORpS+VdYizgyltZUsY5ImpEVk8nYXW72ATwszhiZ7KG8lJ66LoqjihBYLCj
         o5Hy8YF4G2mRlkj2iZ4rQVS1e3Pt4vTQAvXvrz3VtGhvUDFKMry1YaE0EWpFcYF/8zw4
         l6jlqBzwi677yzusORJ3tedyUzJFfMbdEtv3UYY/jWNzAGwyITlY3GeJyVh9EbAeJYza
         94Pg==
X-Gm-Message-State: AC+VfDy2OqdmsPhhLClHJVcn/UWNLiig9jZpGcP4iItMopkgIgFOq00j
	W7zr/s/PfEVMaUwOL57SctU=
X-Google-Smtp-Source: ACHHUZ6gJ6dOzJshzTZzq88n9qdQGalCvRmGnVFTiG/xvzHEv57kj9J98h6Lcckibzl9Y74E2jaEKA==
X-Received: by 2002:a05:6000:196e:b0:30a:a15d:eb2f with SMTP id da14-20020a056000196e00b0030aa15deb2fmr1908675wrb.3.1686342577523;
        Fri, 09 Jun 2023 13:29:37 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id w11-20020a1cf60b000000b003f7ff6b1201sm3555000wmc.29.2023.06.09.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:29:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/5] sunxi: H616: add DRAM type selection
Date: Fri, 09 Jun 2023 22:29:33 +0200
Message-ID: <13284109.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230607000745.10245-5-andre.przywara@arm.com>
References:
 <20230607000745.10245-1-andre.przywara@arm.com>
 <20230607000745.10245-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 07. junij 2023 ob 02:07:44 CEST je Andre Przywara napisal(a):
> From: iuncuim <iuncuim@gmail.com>
> 
> Allwinner H616 SoC supports several types of DRAM memory. To further
> integrate other types of memory, we need to add this delimitation.
> ---
>  arch/arm/mach-sunxi/Kconfig               | 10 +++++++++-
>  arch/arm/mach-sunxi/dram_timings/Makefile |  3 +--
>  configs/orangepi_zero2_defconfig          |  1 +
>  configs/x96_mate_defconfig                |  1 +
>  4 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 6dcbb096f74..197d77ea658 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -442,7 +442,7 @@ config ARM_BOOT_HOOK_RMR
>  	This allows both the SPL and the U-Boot proper to be entered in
>  	either mode and switch to AArch64 if needed.
>  
> -if SUNXI_DRAM_DW || DRAM_SUN50I_H6
> +if SUNXI_DRAM_DW || DRAM_SUN50I_H6 || DRAM_SUN50I_H616
>  config SUNXI_DRAM_DDR3
>  	bool
>  
> @@ -487,6 +487,14 @@ config SUNXI_DRAM_H6_DDR3_1333
>  	This option is the DDR3 timing used by the boot0 on H6 TV boxes
>  	which use a DDR3-1333 timing.
>  
> +config SUNXI_DRAM_H616_DDR3_1333
> +	bool "DDR3-1333 boot0 timings on the H616 DRAM controller"
> +	select SUNXI_DRAM_DDR3
> +	depends on DRAM_SUN50I_H616
> +	---help---
> +	This option is the DDR3 timing used by the boot0 on H616 TV boxes
> +	which use a DDR3-1333 timing.

I'm always a bit unsure about help part. There is no need for "---", right?
I also usually ident help block with extra two spaces. Do we have any rules
for that?

Apart from that and SoB tag, it looks good.

Best regards,
Jernej

> +
>  config SUNXI_DRAM_DDR2_V3S
>  	bool "DDR2 found in V3s chip"
>  	select SUNXI_DRAM_DDR2
> diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-sunxi/dram_timings/Makefile
> index 39a8756c297..4d78c04c9ae 100644
> --- a/arch/arm/mach-sunxi/dram_timings/Makefile
> +++ b/arch/arm/mach-sunxi/dram_timings/Makefile
> @@ -3,5 +3,4 @@ obj-$(CONFIG_SUNXI_DRAM_LPDDR3_STOCK)	+= lpddr3_stock.o
>  obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+= ddr2_v3s.o
>  obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+= h6_lpddr3.o
>  obj-$(CONFIG_SUNXI_DRAM_H6_DDR3_1333)	+= h6_ddr3_1333.o
> -# currently only DDR3 is supported on H616
> -obj-$(CONFIG_MACH_SUN50I_H616)		+= h616_ddr3_1333.o
> +obj-$(CONFIG_SUNXI_DRAM_H616_DDR3_1333)	+= h616_ddr3_1333.o
> diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
> index 6cb942f511a..e38cc20ac72 100644
> --- a/configs/orangepi_zero2_defconfig
> +++ b/configs/orangepi_zero2_defconfig
> @@ -7,6 +7,7 @@ CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>  CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
>  CONFIG_DRAM_SUN50I_H616_TPR10=0xf83438
>  CONFIG_MACH_SUN50I_H616=y
> +CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
>  CONFIG_R_I2C_ENABLE=y
>  CONFIG_SPL_SPI_SUNXI=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index 122c1a99e32..c86cf43771c 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -10,6 +10,7 @@ CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
>  CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
>  CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
>  CONFIG_MACH_SUN50I_H616=y
> +CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
>  CONFIG_R_I2C_ENABLE=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=y
> 




