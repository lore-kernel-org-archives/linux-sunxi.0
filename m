Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D62321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:37:23 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id r17so40687425eja.7
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alAR4cu8HqOOXUvGGn9B/Lossu1DdN9Gjs6Z/Af79zQ=;
        b=KZ8EsFxSiNGZ2ZI0UANRWZlwxxEjvMrz+72eAL/EMyPw45Hew6ZVzft8vqdsYeqOSK
         Go2cd2HwD19ACAuS/SoSqUmzcASbZgJSJIC2kdWbrgBKtS8r729pt+PJtADbYUtQ0c+n
         T2MNZBDJvSFAmwytkHdnOcQN+MqAfKcbsbwG/RflJx7XE6P1qCcM1Yk1eSEkEU+M8jC6
         Hc9dnFZGafPM7swqBGLCgcG5g4Q4kYkIugVqmoycidH1vnOajcNiMpKQuBmfHUvsvQlO
         Y0nRW2lI0WR3ZplC8QNRSHDyBVuF/nkNnhs/C/RzvRsVW1neGhCMFfUQylPQzLqIpFT0
         Su5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alAR4cu8HqOOXUvGGn9B/Lossu1DdN9Gjs6Z/Af79zQ=;
        b=NF1vmUCG2bPaZiKuPhtoniQgL8mz57JvfWUZXAFlToR2ElndadpKpTIohIhRumkBtN
         LQwQVcYRNwMwYrbfiFONKLbH0UICCEKiwqzQ0e11mjx9hVW33J/J9tbO4COM1VRmPbic
         fVcGJfNkAndqBL39kB47ADSUyw61cDFzS4KrmKwsvze+efy8DGsEzF9yPEjKOc2JNfqw
         Qw+YsILyBqTsm5qWR/wkUJUg/dPw840dv/RtwzOZ2cXvPiq6aeY9qyGwyYjsEd8DzUcm
         SLiCmq1kK8TY459t5nFzKddfpiaoPyoeNojM8YghgQpVlC1qLV/LH1P4DG8s1gJ2np9j
         FDWQ==
X-Gm-Message-State: ACrzQf0pxpy8SwN3iBk09PAylX+kZoDAfaCKPEPWB0Hn9ZBibTRMcgTX
	1HJH6Mb/s2gFMAG0uRI1hhQ=
X-Google-Smtp-Source: AMsMyM5ftFfAHqOhgCcjbTXXydg8k38STsoJg7LalaNGntFs2QDju8UFT83PvOiY38Bug3L2Zn2L5g==
X-Received: by 2002:a17:907:6d9a:b0:78d:f864:de0e with SMTP id sb26-20020a1709076d9a00b0078df864de0emr3265012ejc.26.1665610641445;
        Wed, 12 Oct 2022 14:37:21 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id g3-20020a50ee03000000b0045391f7d877sm11951907eds.53.2022.10.12.14.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:37:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/6] sunxi: fix 32MB load address layout
Date: Wed, 12 Oct 2022 23:37:19 +0200
Message-ID: <2387534.jE0xQCEvom@kista>
In-Reply-To: <20221012163458.1968900-3-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:34:54 CEST je Andre Przywara napisal(a):
> The default load addresses for the various payloads (kernel, DT,
> ramdisk) on systems with just 32MB of DRAM have some issues:
> For a start the preceding comment doesn't match the actual values:
> apparently they were copied from the 64MB S3 layout, then halved, but
> since 0x5 is NOT the half of 0x10, they don't match up.
> Also those projected maximum sizes are quite restrictive: it's not easy
> to build a compressed kernel image with just 4MB. The only defconfig in
> mainline Linux that supports the F1C100s (the only 32MB user so far)
> creates a 6MB compressed / 15MB uncompressed kernel.
> Rearrange the default load addresses to accommodate such a kernel: we
> allow an 7MB/16MB kernel, and up to 5MB of ramdisk, stuffing the smaller
> binaries like the DTB towards the end, just before the relocated U-Boot.
> Shrink the size for DTB and scripts on the way, there is no need for
> allowing up to 512K for them.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  include/configs/sunxi-common.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
> index 416a0422861..fe90d55bd45 100644
> --- a/include/configs/sunxi-common.h
> +++ b/include/configs/sunxi-common.h
> @@ -165,17 +165,17 @@
> 
>  #elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 32)
>  /*
> - * 32M RAM minus 1MB heap + 8MB for u-boot, stack, fb, etc.
> - * 8M uncompressed kernel, 4M compressed kernel, 512K fdt,
> - * 512K script, 512K pxe and the ramdisk at the end.
> + * 32M RAM minus 2.5MB for u-boot, heap, stack, etc.
> + * 16M uncompressed kernel, 7M compressed kernel, 128K fdt, 64K script,
> + * 128K DT overlay, 128K PXE and the ramdisk in the rest (max. 5MB)

DT overlays and PXE could be even much smaller, but I guess it doesn't make 
much of a difference.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>   */
>  #define BOOTM_SIZE        __stringify(0x1700000)
> -#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(0500000))
> -#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(0C00000))
> -#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(0C50000))
> -#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(0D00000))
> -#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(0D50000))
> -#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(0D60000))
> +#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(1000000))
> +#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(1d50000))
> +#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(1d40000))
> +#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(1d00000))
> +#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(1d20000))
> +#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(1800000))
> 
>  #else
>  #error Need at least 32MB of DRAM. Please adjust load addresses.
> --
> 2.25.1


