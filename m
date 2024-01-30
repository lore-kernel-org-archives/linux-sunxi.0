Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244469DE8
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706641303; cv=none; b=YNIddRRJNgUCb7zB0+Qo4FPgqSjGnYqBsV65fCFNRKROb+897ryZX+oaYCjpyjlyUta6QFEhIZ9Kr06ADP8MTXIvbWv8zbQx+QIAUVEzQj4SXpPd6G43bbqctjAeKVPGBwBne0BZ866KbMAr13nsSFLZZEkM46Ut5qJnDkBGLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706641303; c=relaxed/simple;
	bh=+oH157mmrnh94jtgbXpWkH6kEKIpscoaIu+XpDmWi6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jU8/8JRytyez8JSU1Sp+Zfpln58oCeKheu/1ZyQw4tZXq8fNI93N3+TbjFt+PRLDM1k9hhgSS4v768SmkrmG6SkSV+SYqCsjP156fbznz2VZRF/w2rnOWYqadWAkHrwICcBiq2CuVoQ3B4qDyI834Llr5ivo9TZoeTP3ma4v3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrWKEf25; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrWKEf25"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a364b5c5c19so87510866b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706641300; x=1707246100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOLaQwh51zApHGNsYefMjqeRStAsKD+dGGc7kT7AuF8=;
        b=VrWKEf25dOTNX6WlSE3d05CHiORGQCGC9DBF0WXX6xlX0330Odh5UsCgTMu3rY4cGP
         pW/bl+A+NrZymRkXSfsSiaZkPvHhzUa6w5H9xRT5TUplkdF+PZlHibclbCb/N0kognpZ
         w67KCwZD0WnwNBpveZOoZ6co1mVc+XKmE47xkT8yN3HTyefzECY5Qj18hfhbIZDKzn/6
         Ym+g/MgOvZuN81CPscRwXlmfuce9sfW7iz9BtfU2kMpHxcAHlAbt/hlXrpin7QOXF+df
         STMh7mH5nJKa7T95zGHs+qQUmmaEmxA2uzJSVfo2m7JIpBaTNx8+GxB+KP9v18RJjomJ
         lWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641300; x=1707246100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOLaQwh51zApHGNsYefMjqeRStAsKD+dGGc7kT7AuF8=;
        b=OjjFJt8f2kJX4D7Aeh+Ce5U4rUiVY5Vr8SD1zPBVKmqkcAnZL9GdA2ZwCTaBaUVR0I
         yhOlVzz11KovzklUgYWE/A8ug5ymFX6R09oNHhYsEZtW8rA2CHszaLl9Mh7DfASHUxNU
         +hqz2mk9m/XieUrCd5pcTgU1RcYcPI02V45jEHSLLifQ3BK8XWd9W+5QUt028cqhfu42
         PNQ1MjgS/T3JjVru2AtXYgkNM6Co0BGS7hbVQ2AVMe7nyZqK/po4CgoNIBKHm75u9hLL
         FJz7nHQ9y4V/qgT4Wk7/Oy5nvhl5I12OAmMcdUa3YOD86cDspWG+jbCBDY0ITc2Ka04X
         KYhQ==
X-Gm-Message-State: AOJu0YxJCpep5hz2Vxx3Al6Pzs8UwXDyc3GJVkWO5RJoiBIYpyJ2LTnO
	n/Nwl9ClGH+ysXnkAtN3zoN9K1Muxqt+mHzFvfEQ8PGuLf3kNPpawk34zUdr
X-Google-Smtp-Source: AGHT+IE27TRl3+qALdfzNC+5+7QHBZ22qp0UTxbCu2nDq0OFNwRh3d4QtEG97gxwoOYGthRZCv6rmg==
X-Received: by 2002:a17:906:71d8:b0:a30:e782:ee56 with SMTP id i24-20020a17090671d800b00a30e782ee56mr161781ejk.27.1706641299916;
        Tue, 30 Jan 2024 11:01:39 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090699cc00b00a2cd74b743csm5377498ejn.3.2024.01.30.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:01:39 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi@lists.linux.dev,
 Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Marc Zyngier <maz@kernel.org>,
 James McGregor <james.mcgregor2@arm.com>
Subject: Re: [PATCH] sunxi: H616: Add OrangePi Zero 2W board support
Date: Tue, 30 Jan 2024 20:01:37 +0100
Message-ID: <2715486.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20240130141642.2714470-1-andre.przywara@arm.com>
References: <20240130141642.2714470-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 30. januar 2024 ob 15:16:42 CET je Andre Przywara napisal(a):
> The OrangePi Zero 2W is a tiny development board featuring the Allwinner
> H618 SoC, shipping with up to 4GB of LPDDR4 DRAM, a mini-HDMI connector,
> two USB Type-C sockets and a 16MB SPI NOR flash.
> There is an FPC connector to connect an expansion board, which sports
> two more USB Type-A sockets and a 100MBit Ethernet port. Support for
> the expansion board is not in the DT yet, probably a DT overlay would
> cover this in the future.
> 
> Add a defconfig file selecting the right drivers and DRAM options.
> Since the .dts file was synced from the Linux kernel repo already, we
> just need to add one line to the Makefile to actually build the .dtb.
> 
> The DRAM parameters were derived from the values found in the BSP DRAM
> drivers on the SPI NOR flash.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/dts/Makefile             |  1 +
>  board/sunxi/MAINTAINERS           |  5 +++++
>  configs/orangepi_zero2w_defconfig | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 configs/orangepi_zero2w_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 0d4b917fb3b..ed3978037ed 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -837,6 +837,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
>  	sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_MACH_SUN50I_H616) += \
>  	sun50i-h616-orangepi-zero2.dtb \
> +	sun50i-h618-orangepi-zero2w.dtb \
>  	sun50i-h618-orangepi-zero3.dtb \
>  	sun50i-h618-transpeed-8k618-t.dtb \
>  	sun50i-h616-x96-mate.dtb
> diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
> index a2da6a4a7a2..4bcd9b9af7f 100644
> --- a/board/sunxi/MAINTAINERS
> +++ b/board/sunxi/MAINTAINERS
> @@ -460,6 +460,11 @@ M:	Jernej Skrabec <jernej.skrabec@siol.net>
>  S:	Maintained
>  F:	configs/orangepi_zero2_defconfig
>  
> +ORANGEPI ZERO 2W BOARD
> +M:	Andre Przywara <andre.przywara@arm.com>
> +S:	Maintained
> +F:	configs/orangepi_zero2w_defconfig
> +
>  ORANGEPI ZERO 3 BOARD
>  M:	Andre Przywara <andre.przywara@arm.com>
>  S:	Maintained
> diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
> new file mode 100644
> index 00000000000..5734d9d839c
> --- /dev/null
> +++ b/configs/orangepi_zero2w_defconfig
> @@ -0,0 +1,30 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero2w"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
> +CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
> +CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
> +CONFIG_DRAM_SUN50I_H616_TPR6=0x48808080
> +CONFIG_DRAM_SUN50I_H616_TPR10=0x402f6663
> +CONFIG_DRAM_SUN50I_H616_TPR11=0x26262524
> +CONFIG_DRAM_SUN50I_H616_TPR12=0x100f100f
> +CONFIG_MACH_SUN50I_H616=y
> +CONFIG_SUNXI_DRAM_H616_LPDDR4=y
> +CONFIG_DRAM_CLK=792
> +CONFIG_R_I2C_ENABLE=y
> +CONFIG_SPL_SPI_SUNXI=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_MTD=y
> +CONFIG_SPI_FLASH_ZBIT=y
> +CONFIG_AXP313_POWER=y
> +CONFIG_SPI=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_MUSB_GADGET=y
> 




