Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D641841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 06:14:14 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id g18so12723566ejj.5
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Apr 2023 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680934453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o69rVVZUlQtAKepCevn5KK/mZXmD+OWtcVmo2waT3xg=;
        b=mjhbBpv8kUf7fH+VkParqaWCUwai+qeq2UU76YSVCZo/hX+0gR/6qZyJL4myvsMIfq
         uZQzcUhl8V3o3V4+reLMDx4Pz9rrtDDjtdUdxMXmTF0H7HXuTn7AQWXS96XJS1v9x/h+
         Ml3BrAYtyQHVHQ28TNWNH4OB51u5LZrGYy8kMrVW9eyujzHpYJAnw13/DXYfM0e8k0pa
         4qn4mpUHzML7Kku2yhXAah4fEPh4iNQtdVnkIyq4AOCvByWyvLmKl+pv7iXR94OtZFYG
         nAAtou/7SFKD5mXwW6VeQj3/poB28KdOCEZrvZkgKQbXcFHowtvYO3gvEkfBh4sfmfUt
         dEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680934453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o69rVVZUlQtAKepCevn5KK/mZXmD+OWtcVmo2waT3xg=;
        b=YuNDHv9yPnXJO1EJkJ9ENbrXiSU8vILvGf87TSVFIquU/0NaNt81API3TX3XEKqkhS
         Sx0JgG3UjT9HpjJa2JPlWXdzL9U7tUnN4IQZxZ9+LEujOuVzI6pa+X4rymBTjQYGZSf0
         sjgmbhooQasTI2nNKPIatbF69toLyrJ5fKdrE7ziB/cyXj6nQji9+mtB8WWZ8YZ+p3sz
         4KcKyS8Nq8zoJ8P7147hzWKoTNlm3d7NuWH9/PMXctCCa6CbyuZAVbMF2bnvB6ql0pQn
         pQfV+C8fRc/fI810ubq6D9To3nR5MFUfQU+faswozJf33Z9Wjv4gAlmh1XaSWGZRAjp3
         GO4g==
X-Gm-Message-State: AAQBX9cqLiac0s4ilDX9ojmsrI4fx+v3ZJmg1WmmHfW2m34AzUqu1Jl4
	W21uGcN70cj6F9NMk3vzYAw=
X-Google-Smtp-Source: AKy350ZwyUZPiXJOiEEerVIcF5m847p4Hnm9TCL793TSsSPKtxtJjbO35GToMvnEXUIoJF2Sdrbe6g==
X-Received: by 2002:a17:906:711b:b0:930:625d:6a25 with SMTP id x27-20020a170906711b00b00930625d6a25mr1528971ejj.61.1680934453010;
        Fri, 07 Apr 2023 23:14:13 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id ta14-20020a1709078c0e00b00949c02dcf10sm2808780ejc.6.2023.04.07.23.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:14:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/2] sunxi: boot0.h: allow RVBAR MMIO address customisation
Date: Sat, 08 Apr 2023 08:14:11 +0200
Message-ID: <4818131.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230405142731.1246503-1-andre.przywara@arm.com>
References: <20230405142731.1246503-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 05. april 2023 ob 16:27:30 CEST je Andre Przywara napisal(a):
> To switch the ARMv8 Allwinner SoCs into the 64-bit AArch64 ISA, we need
> to program the 64-bit start code address into an MMIO mapped register
> that shadows the architectural RVBAR register.
> This address is SoC specific, with just two versions out there so far.
> Now a third address emerged, on a *variant* of an existing SoC (H616).
> 
> Change the boot0.h start code to make this address a Kconfig
> selectable option, to allow easier maintenance.
> We make this address user-visible (even though it shouldn't be), to
> allow putting this in defconfig. This is needed because there are
> apparently revisions of the H616 SoC out there using different
> addresses, so this becomes a per-board decision.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/include/asm/arch-sunxi/boot0.h |  7 ++-----
>  arch/arm/mach-sunxi/Kconfig             | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h
> b/arch/arm/include/asm/arch-sunxi/boot0.h index 46b7e073b59..59ea75a96b5
> 100644
> --- a/arch/arm/include/asm/arch-sunxi/boot0.h
> +++ b/arch/arm/include/asm/arch-sunxi/boot0.h
> @@ -39,11 +39,8 @@
>  	.word	0xf57ff06f	// isb     sy
>  	.word	0xe320f003	// wfi
>  	.word	0xeafffffd	// b       @wfi
> -#ifndef CONFIG_SUN50I_GEN_H6
> -	.word	0x017000a0	// writeable RVBAR mapping address
> -#else
> -	.word	0x09010040	// writeable RVBAR mapping address
> -#endif
> +
> +	.word	CONFIG_SUNXI_RVBAR_ADDRESS	// writable RVBAR mapping 
addr
>  #ifdef CONFIG_SPL_BUILD
>  	.word	CONFIG_SPL_TEXT_BASE
>  #else
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 6417aee944b..b46667ce01e 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -110,6 +110,18 @@ config SUNXI_SRAM_ADDRESS
>  	Some newer SoCs map the boot ROM at address 0 instead and move the
>  	SRAM to a different address.
> 
> +config SUNXI_RVBAR_ADDRESS
> +	hex "RVBAR address"
> +	depends on ARM64
> +	default 0x09010040 if SUN50I_GEN_H6
> +	default 0x017000a0
> +	---help---
> +	The read-only RVBAR system register holds the address of the first
> +	instruction to execute after a reset. Allwinner cores provide a
> +	writable MMIO backing store for this register, to allow to set the
> +	entry point when switching to AArch64. This store is on different
> +	addresses, depending on the SoC.
> +
>  config SUNXI_A64_TIMER_ERRATUM
>  	bool




