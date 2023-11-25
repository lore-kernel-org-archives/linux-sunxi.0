Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437823DB
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Nov 2023 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI0gbv+E"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c5071165d5so37463531fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 25 Nov 2023 09:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700934196; x=1701538996; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoPaQXs5kwCOGgQtskzKCQHgLNsgwa/aDk3uWUTMHtE=;
        b=AI0gbv+EDgy+GHxn/CsJAEOYup0MdGVrXimYqzmWx7wbqPHUZrN+5H3wSQFTM+9D1/
         DSoT4ABsHV9ed1j53raU58zlGPL3AaKbEFkz0sxpKEXw3ctW1SC95flxBq9DLenS+Bco
         v55tvC0pgF5AGX0seWxCtuOLaNSEBGeHviuUYPRSGGefy978dkkFu6tMMNs1Qek0wHO/
         bWPxb+IQaTCyearF80pWUp8RafksddjxdtiWGqx1Agn8bjxzXfBUbyE5bCQ9CEAhW3ay
         GzpPz6KjaLxuigzD9bvZz6HYQI+hf8qU06QwqUOnbMFjyIQbMzPy0Ca4tFJBgOVZ5dU9
         oIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700934196; x=1701538996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoPaQXs5kwCOGgQtskzKCQHgLNsgwa/aDk3uWUTMHtE=;
        b=GwoK0ldMjQ8Y3YJt4adLLY3rjzcHZflhNVLWpFLgs7GPhPTgZ5HW5WweMS/2e7QQxu
         u4bxFPWKTrzim1icZo577JrF1Z22xs2CsfXUtmdbCrSFoVyueBcUaMxtLoYkUgfoZXVQ
         dVh930pGr1LFW8TSqex8MrpePpV7HJ+7cPmVVz5KlZbluEZzYh7GejKxD5iKeo7Ycyfc
         VoWCdv0MJRa+wLwndZptX4kbHexZExugagAG7Y6jNZ8DrMUfeigVWqhpnS3RIRUFGz+h
         8lqG972YNHblgwG2/k2m/KVRRbmyePfuZjs1o9QR2b76vVhj7y2qg9VqrZgOZaGvnvh5
         JVWg==
X-Gm-Message-State: AOJu0YwNvT1RmQEz573N+EVc5IsjXzsDyL/M2c4yM0g/wl0XPl1W/Pkl
	ZVB602MvWyq2qWiDAH104M8=
X-Google-Smtp-Source: AGHT+IFl6HJxTncbFHoW9isHLjnj9ILw7Nl4xxH6taPv8J+WuLjtXfPizA4RQ9zQFQcVsCLDX9W5jg==
X-Received: by 2002:a2e:94c7:0:b0:2c1:522a:8e25 with SMTP id r7-20020a2e94c7000000b002c1522a8e25mr1122870ljh.32.1700934196336;
        Sat, 25 Nov 2023 09:43:16 -0800 (PST)
Received: from [192.168.99.248] ([94.143.197.234])
        by smtp.gmail.com with ESMTPSA id m9-20020a2e7109000000b002c506c89511sm902586ljc.37.2023.11.25.09.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 09:43:15 -0800 (PST)
Message-ID: <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
Date: Sat, 25 Nov 2023 20:43:12 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] sunxi: H616: Add OrangePi Zero 3 board support
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Vignesh R <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20231114013106.31336-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andre!
Thanks for your patches. I started checking and noticed that USB storage
was not working:

=> usb reset
resetting USB...
Bus usb@5200000: USB EHCI 1.00
Bus usb@5200400: USB OHCI 1.0
scanning bus usb@5200000 for devices... 1 USB Device(s) found
scanning bus usb@5200400 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
=> usb storage
No storage devices, perhaps not 'usb start'ed..?

Otherwise my OpiZero3 (4GB) board looks working.
Ethernet works with my 10 Mbps usb-dongle.

sf probe detect spi nor flash:
=> sf probe
SF: Detected zb25vq128 with page size 256 Bytes, erase size 4 KiB, total 
16 MiB

Loading the kernel and running the operating system (from microsd) also
without problems.

Tested-by: Mikhail Kalashnikov <iuncuim@gmail.com>


On 14.11.2023 04:31, Andre Przywara wrote:
> The OrangePi Zero 3 is a small development board featuring the Allwinner
> H618 SoC, shipping with up to 4GB of DRAM, Gigabit Ethernet, a micro-HDMI
> connector and two USB sockets.
> The board uses LPDDR4 DRAM and an X-Powers AXP313a PMIC, support for
> which was recently added to U-Boot.
>
> Add a defconfig file selecting the right drivers and DRAM options.
> Since the .dts file was synced from the Linux kernel repo already, we
> just need to add one line to the Makefile to actually build the .dtb.
>
> The DRAM parameters were derived from the values found in the BSP DRAM
> drivers on the SPI NOR flash.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   arch/arm/dts/Makefile            |  1 +
>   board/sunxi/MAINTAINERS          |  5 +++++
>   configs/orangepi_zero3_defconfig | 30 ++++++++++++++++++++++++++++++
>   3 files changed, 36 insertions(+)
>   create mode 100644 configs/orangepi_zero3_defconfig
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 1be08c5fdc2..5fc888680b3 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -835,6 +835,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
>   	sun50i-h6-tanix-tx6-mini.dtb
>   dtb-$(CONFIG_MACH_SUN50I_H616) += \
>   	sun50i-h616-orangepi-zero2.dtb \
> +	sun50i-h618-orangepi-zero3.dtb \
>   	sun50i-h616-x96-mate.dtb
>   dtb-$(CONFIG_MACH_SUN50I) += \
>   	sun50i-a64-amarula-relic.dtb \
> diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
> index 00614372119..f556857a391 100644
> --- a/board/sunxi/MAINTAINERS
> +++ b/board/sunxi/MAINTAINERS
> @@ -455,6 +455,11 @@ M:	Jernej Skrabec <jernej.skrabec@siol.net>
>   S:	Maintained
>   F:	configs/orangepi_zero2_defconfig
>   
> +ORANGEPI ZERO 3 BOARD
> +M:	Andre Przywara <andre.przywara@arm.com>
> +S:	Maintained
> +F:	configs/orangepi_zero3_defconfig
> +
>   ORANGEPI PC 2 BOARD
>   M:	Andre Przywara <andre.przywara@arm.com>
>   S:	Maintained
> diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
> new file mode 100644
> index 00000000000..e59044f6639
> --- /dev/null
> +++ b/configs/orangepi_zero3_defconfig
> @@ -0,0 +1,30 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero3"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
> +CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
> +CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
> +CONFIG_DRAM_SUN50I_H616_TPR6=0x44000000
> +CONFIG_DRAM_SUN50I_H616_TPR10=0x402f6663
> +CONFIG_DRAM_SUN50I_H616_TPR11=0x24242624
> +CONFIG_DRAM_SUN50I_H616_TPR12=0x0f0f100f
> +CONFIG_MACH_SUN50I_H616=y
> +CONFIG_SUNXI_DRAM_H616_LPDDR4=y
> +CONFIG_R_I2C_ENABLE=y
> +CONFIG_SPL_SPI_SUNXI=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SPI_FLASH_ZBIT=y
> +CONFIG_PHY_MOTORCOMM=y
> +CONFIG_SUN8I_EMAC=y
> +CONFIG_AXP313_POWER=y
> +CONFIG_SPI=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_MUSB_GADGET=y
