Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABC321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:38:38 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m15so77400edb.13
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+WaYvBAOq1zI64y1SJ4De7VTt10VdsI91Ju/FwE9g0=;
        b=Em/GYy3t/+BYb2HoyHHrHs0Rpy58CGJShEaD4KdfsuIaz9dBMJF7Z6MMmAvezfVTUv
         lU7jfSsLqwd3060eqW66WMxpugVoNLDnj8wdGXYMy1X4AbbZYRZhi6B5WZ5WojC2374i
         ErPQvDH5Zp4KD7ZgaTn9yS30EuNeDWuZkHM3vpzmMxGsDTei2wuHVoUhHfD+sPthoPUJ
         OeNO5fPPWC6nwZk0RTsqx4m+c3DqZ0bIWggxFneAKOsUJcziW43d5f8l4mBfaT9fNPMv
         YpZcZknMEcjojTT/acxFqaqOYHp8PluNDrbRWPue8KO3TPQcg9Kp4Vel49W6IB3r+kIr
         VJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+WaYvBAOq1zI64y1SJ4De7VTt10VdsI91Ju/FwE9g0=;
        b=hJKcbe/qj71EjURf/aPr1Hc5tTusQ0ahZv6bhUkCs2a3GLOIfo0MkT7uKbjlQbGaDg
         MQCiEw9rs95S2zAS/rg8kQ3sV+ITVF2c+4mSmwcRqUfdyWw9bKWB8CkBsiPXrcRun/SK
         k/WS6OuhWhS3mEtz2DlAHJW/0i6czpMJplrAFXBHW0e3RdMMpUepWNDOpaU/gcv1Fdil
         RR5FPpK5jfuRpdlXBYQrtJJbQX6vgP6TRJcQxgk6reY5sEyeAK+J6XnS1Os7YIpCKa0/
         dHEJxxdne9jsBK2BZ9o+G/BPwmklmAagYuGuQz6qZd7IAV5G8ScWzDuRMBTX5JVJVmsV
         /5Mg==
X-Gm-Message-State: ACrzQf3xINHLNCFUbNAnKWvNnqT+VGspmaWu4aYFUMLPPIQogPDYkc81
	ePsVREcSpXoamMvnqNZsg7c=
X-Google-Smtp-Source: AMsMyM5Bm3G6W+G2gnj7bkpWRFBb0jsH6/aJZWa8cw236lSeEVQ5KeQOP3e785hUXcn1qy7NXgWneQ==
X-Received: by 2002:a05:6402:51c6:b0:45b:d0d7:4b41 with SMTP id r6-20020a05640251c600b0045bd0d74b41mr22155899edd.219.1665610717075;
        Wed, 12 Oct 2022 14:38:37 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709063d3200b0078d76ee7543sm81485ejf.222.2022.10.12.14.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:38:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/6] sunxi: f1c100: move SKIP_LOWLEVEL_INIT_ONLY into Kconfig
Date: Wed, 12 Oct 2022 23:38:35 +0200
Message-ID: <832806630.0ifERbkFSE@kista>
In-Reply-To: <20221012163458.1968900-4-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:34:55 CEST je Andre Przywara napisal(a):
> So far we stated the lack of a lowlevel() init function for the F1C100s
> board by defining the respective SKIP_* symbol in the board's
> defconfig. However we don't expect any *board* to employ such low level
> code, so expect this to be never used for the ARMv5 Allwinner SoCs.
> 
> Select the appropriate symbols in the Kconfig, so that we can remove
> them from the defconfig, and avoid putting them in future defconfigs for
> other boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/Kconfig     | 2 ++
>  configs/licheepi_nano_defconfig | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 9aa66deb9fd..fc5d8bb3c19 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -185,6 +185,8 @@ config MACH_SUNIV
>  	select CPU_ARM926EJS
>  	select SUNXI_GEN_SUN6I
>  	select SUPPORT_SPL
> +	select SKIP_LOWLEVEL_INIT_ONLY
> +	select SPL_SKIP_LOWLEVEL_INIT_ONLY
> 
>  config MACH_SUN4I
>  	bool "sun4i (Allwinner A10)"
> diff --git a/configs/licheepi_nano_defconfig
> b/configs/licheepi_nano_defconfig index 14e6bcda927..09f1a19cdbe 100644
> --- a/configs/licheepi_nano_defconfig
> +++ b/configs/licheepi_nano_defconfig
> @@ -1,6 +1,4 @@
>  CONFIG_ARM=y
> -CONFIG_SKIP_LOWLEVEL_INIT_ONLY=y
> -CONFIG_SPL_SKIP_LOWLEVEL_INIT_ONLY=y
>  CONFIG_SYS_DCACHE_OFF=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-licheepi-nano"
> --
> 2.25.1


