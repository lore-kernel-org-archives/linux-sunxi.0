Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8AA70
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Jun 2021 05:50:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m3so3900020wms.4
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 22:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qlTnjtVq5LMYL7jzINOOQZ8kf2Nzrn+TPRYcDeIg2h0=;
        b=SiLTDvfFAPtsT7g5hmY2xacBNmjD7FcLOQOqYLWmHYmoNesLXBRPwpJfwdeADwF1VQ
         lppzL5puHAQuZ8v1kx9cIXVd/iZi6l4ZDHMgWk3/iclwDBtC+lqxO4VKbsB8+jZ5V2IP
         7m+G8B00rBUuTNKze1RoBt8Vg7u3NkFpu4dqIXmVdhRxJ7cMZELFcsj8qTF8Wpg2omJJ
         hKcBYe/sptrj0YUXInb3MRyyKcV/g780XgC3GBKd6ysSZf5zP3OsX9OfGV8jVfc2uA/0
         wKveBba3NZHcqbPpCDLc8wOcNrF7j3sw3e3wz3k5816Mb5kanydx2yE4GyO6TAChz2aP
         ZEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlTnjtVq5LMYL7jzINOOQZ8kf2Nzrn+TPRYcDeIg2h0=;
        b=EukZGRPDh+f97TvdZTEnVYo8t8Znf0iATREY9GwXb2Oo1fOMel2emjcxSmFAGfWncL
         EMjvDq+DkUNX0V6G84kU3hH5DtIavurmFN8PqtOUMreVCsbsZG0mLhzLxShisjxGbjxn
         CBAg2X1+ho/QByK/ADG7d224s7aPcdd+LuguDNvi4dhODJWHjvRHeLgZUKF4fov2DzKg
         zh/xSrN158LJiYltKNmi0hJXn9iQgyXXIGGKaybk5z5kpNPNlqgIKtZqaH95WdcULcIT
         s9J/fpO6KU5KAmzeaUZj3ObAoR8tyg5w4VEnSx9N+uF+W5jbxm3FTURtbG/Z85hfWCHq
         QLlg==
X-Gm-Message-State: AOAM530S4opWU4Zllppi7c5XHh6S7Hc3Gz3J1OrZkyOlML0ymPlJaBCH
	YpSMpt2PNhxZqgRhXuAqv7A=
X-Google-Smtp-Source: ABdhPJwLXecyWXiJEdyTNDw1EQyTCDa7FFn7iuzae9YXY+gNABsABj083nsOO5dmEmKcM0KMFC3NEQ==
X-Received: by 2002:a05:600c:350a:: with SMTP id h10mr6960679wmq.164.1623477028952;
        Fri, 11 Jun 2021 22:50:28 -0700 (PDT)
Received: from kista.localnet (cpe1-4-249.cable.triera.net. [213.161.4.249])
        by smtp.gmail.com with ESMTPSA id f12sm11062130wru.81.2021.06.11.22.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 22:50:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] configs: OrangePi PC2: Update defaults
Date: Sat, 12 Jun 2021 07:50:27 +0200
Message-ID: <2418795.6bcLzA2rA2@kista>
In-Reply-To: <20210607174245.480188-1-jernej.skrabec@gmail.com>
References: <20210607174245.480188-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. junij 2021 ob 19:42:45 CEST je Jernej Skrabec napisal(a):
> OrangePi PC2 board has DRAM with ODT, so enable it. ZQ value is also
> slightly different in vendor images, so update it as well. H5 SoC is
> also connected to voltage regulator. It's default value is pretty low,
> so in order to avoid instability, enable driver for it and set it to
> appropriate voltage.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  configs/orangepi_pc2_defconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
> index f72ffe27b26c..5e4cca793f53 100644
> --- a/configs/orangepi_pc2_defconfig
> +++ b/configs/orangepi_pc2_defconfig
> @@ -3,13 +3,15 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN50I_H5=y
>  CONFIG_DRAM_CLK=672
> -CONFIG_DRAM_ZQ=3881977
> -# CONFIG_DRAM_ODT_EN is not set
> +CONFIG_DRAM_ZQ=4145117
>  CONFIG_MACPWR="PD6"
>  CONFIG_SPL_SPI_SUNXI=y
> +CONFIG_SPL_I2C_SUPPORT=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-pc2"
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=y
> +CONFIG_SY8106A_POWER=y
> +CONFIG_SY8106A_VOUT1_VOLT=1100

I'm not sure if voltage regulator adjustment needs to be enabled. By default, 
it's set to 1.1 V using resistor divider. However, it can be still needed if 
board is rebooted and OS set it to lower value before reboot.

Best regards,
Jernej

>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_MUSB_GADGET=y
> -- 
> 2.31.1
> 
> 


