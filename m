Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BA3D54B
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NywxCaBG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a234205785dso204365366b.0
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916215; x=1703521015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bezxA4w3BofKoayOrhRD9PM6sHufVYtq2w+UEfMweo=;
        b=NywxCaBG3aAkbJcGjxe7M+ed9Qcz32MLQGiJbrUMf2p3qUjoFy4EOkHSugvQT/nsV4
         nBcE4MAWGd2i/eZ2AiWJe79NrdPm/R6aYjMbsUN4mprMy0JylbWILelZ4CweCgS3e+D9
         Q7se3NSy1w/aCIqQY77BrKaqWeiyMoyL5OW3pF0WD337UkcZx2Bkwmc2a0bZ/2iUf0/7
         jY2fS1+xegzrhOF7c4adioy3+pDyEGk9BMRf737d3RYsyfBKT/ve4b2Wu+jfPtmGfumE
         Nmj/WuvA8nygqUZ3bLzde3hdYos1Ghr8H51Gyesv7yXwmkXadQYsf2Qv6KVL0+t/W8xB
         Felg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916215; x=1703521015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bezxA4w3BofKoayOrhRD9PM6sHufVYtq2w+UEfMweo=;
        b=NAyaYfWAYrHNehX/Yvu7w9DjiKB7ywR6DJ2aN7/J4bwf0DnFr7y9Oa/XSISFG2PAvI
         GhEGJS+rp4djCZJOIJ6AVZIbTAXcmocF7mNYOONjHQXyHV5iFNJZqE56dL8j8arE488y
         TIXdCAVm2iCUOkbIzs4yIlUvUeUbPsmKLb+npkd1MS3m6tlZP1oqy68G5Exig9D9cVte
         H4Ge5adwmVRrrM13/lK9ADPk4qYVxhtvw/yWH7+3spLhZu1NNPYWmFDIdADzuIhyOrfw
         klE5hAudjylUNxuVcMRoxWOejrmT7C53kz4rqgxvVp5i8RF4Mbw19+oSr2rGzSX2iaLO
         LTTg==
X-Gm-Message-State: AOJu0YyyrX4YFxBvYxszrV+tTmOiYWv5mZ2VmacU5207fECkWfPNiofs
	0brOMKOLbGN0CIsdy0dMyew=
X-Google-Smtp-Source: AGHT+IGGXZM869rCvborKIS6+AaZ6Fg2Fee5h0yXK5Lip2vogxh1X3uCF4McDxJ8OOYxEvnqggmR6w==
X-Received: by 2002:a17:906:516:b0:a23:4e3a:a643 with SMTP id j22-20020a170906051600b00a234e3aa643mr528083eja.168.1702916214829;
        Mon, 18 Dec 2023 08:16:54 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id fj8-20020a1709069c8800b00a1d5c342674sm14186209ejc.27.2023.12.18.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:16:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject:
 Re: [PATCH v2 5/5] cpufreq: Make sun50i h6 cpufreq Kconfig option arch
 generic
Date: Mon, 18 Dec 2023 17:16:52 +0100
Message-ID: <5737049.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231218110543.64044-6-fusibrandon13@gmail.com>
References:
 <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-6-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 12:05:43 CET je Brandon Cheo Fusi napisal(a):
> Move the Allwinner SUN50I cpufreq driver from Kconfig.arm to the
> main Kconfig file so it supports other architectures, like RISC-V
> in our case, and drop the 'ARM_' prefix.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/Kconfig     | 12 ++++++++++++
>  drivers/cpufreq/Kconfig.arm | 12 ------------
>  drivers/cpufreq/Makefile    |  2 +-
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index 35efb53d5..50aa66cfc 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -301,5 +301,17 @@ config QORIQ_CPUFREQ
>  	  This adds the CPUFreq driver support for Freescale QorIQ SoCs
>  	  which are capable of changing the CPU's frequency dynamically.
>  
> +config ALLWINNER_SUN50I_CPUFREQ_NVMEM
> +	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
> +	depends on ARCH_SUNXI
> +	depends on NVMEM_SUNXI_SID
> +	select PM_OPP
> +	help
> +	  This adds the nvmem based CPUFreq driver for Allwinner
> +	  h6/D1 SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sun50i-cpufreq-nvmem.
> +
>  endif
>  endmenu
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index f91160689..98b8e6eef 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -29,18 +29,6 @@ config ACPI_CPPC_CPUFREQ_FIE
>  
>  	  If in doubt, say N.
>  
> -config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
> -	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
> -	depends on ARCH_SUNXI
> -	depends on NVMEM_SUNXI_SID
> -	select PM_OPP
> -	help
> -	  This adds the nvmem based CPUFreq driver for Allwinner
> -	  h6 SoC.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called sun50i-cpufreq-nvmem.
> -
>  config ARM_APPLE_SOC_CPUFREQ
>  	tristate "Apple Silicon SoC CPUFreq support"
>  	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index 8d141c71b..110b676d2 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_ARM_SCMI_CPUFREQ)		+= scmi-cpufreq.o
>  obj-$(CONFIG_ARM_SCPI_CPUFREQ)		+= scpi-cpufreq.o
>  obj-$(CONFIG_ARM_SPEAR_CPUFREQ)		+= spear-cpufreq.o
>  obj-$(CONFIG_ARM_STI_CPUFREQ)		+= sti-cpufreq.o
> -obj-$(CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
> +obj-$(CONFIG_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o

This should be moved, so it's sorted alphabetically.

Best regards,
Jernej

>  obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
> 




