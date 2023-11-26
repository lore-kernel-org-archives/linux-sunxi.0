Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C27D276
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Nov 2023 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7BkzpvB"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c8880fbb33so43247511fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 26 Nov 2023 05:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701005418; x=1701610218; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+A2ODoEq+PbT1g17Ko+IenUBauOUVFuLuyXpQ4HSuy0=;
        b=O7BkzpvBEuc6RSyfwCgS1I1GkBh4YyvNz/H8gLMaMH5NeDjvPaoDC11s/7gqTfW9s7
         41OdDYeqH0g0d+0JHIrtpem4VyGOsVlPd/qfk2Cz150y1l+tHwnePfGusk8HF/vYm86T
         MubcGVdss0lEdOcLWfoBv2o/Mfro0O6s3KqDTF6mgmSd8NPy6CsbzzoP0aJN6Bp8rsPp
         gosi06D/bPcLwmBL8RPLgR56MYYBRgGnGpw3aVCTq4WGwIYnms8sJuY+hsgaJogdcUeN
         sYoQGOH3WQIKosuGExX5DVGHdRccg2n2v7H4yZXxyp2h3pxgVr/p08V/hMvJi2E2ITNu
         9EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701005418; x=1701610218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+A2ODoEq+PbT1g17Ko+IenUBauOUVFuLuyXpQ4HSuy0=;
        b=ic4RlCx6azIF/xQstYDOjj1ULSjuKSe7fWlr51NU/mn9eF23MzXDrFyh1Fwk1gbXDp
         JeTn7wdX588DFdpa7rYKWmOVO2Nanj1nwfKT/QIpiikn52pQ5nO55yXmd/A7VakxPNR6
         EgyPLB8UZCvNfcxdqnuQhQ8JJ+rpGpEPK0fsR8WPJFECl/UIZ9XcK0CL7ETRS8PKwugg
         9eGmzFh+JHiWJtcQQL2tXfntOBLiVvRIpgwLeRdp4ay3XhN+eYBawPKV5Olkfs1BiW+z
         XjLI5SscgK+cRpayDV/RYZYoDxfLEaTutyYtEHp3sCGwazafGOoIAOksbxlBU6iqCXC6
         AmaA==
X-Gm-Message-State: AOJu0Yy2Z5aUIeEELhdRj03+rMhzKE8ujUPFH/O4MNZUOmEXduWE1uLs
	RdGvO3rrgJqQswkLiRSNaxk=
X-Google-Smtp-Source: AGHT+IHljFUHWXCzN78mkE2vGo+PrL5o1xad2V67iXAGr93i0mP5hbPxAga27VIfqm5DSRSrKG8w8g==
X-Received: by 2002:a2e:b5d3:0:b0:2c9:a05c:547d with SMTP id g19-20020a2eb5d3000000b002c9a05c547dmr511682ljn.34.1701005418242;
        Sun, 26 Nov 2023 05:30:18 -0800 (PST)
Received: from [192.168.99.248] ([94.143.197.234])
        by smtp.gmail.com with ESMTPSA id b40-20020a05651c0b2800b002c8721c20e2sm981909ljr.106.2023.11.26.05.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 05:30:17 -0800 (PST)
Message-ID: <9eaccd15-a54d-4597-8530-e9f61c9e5f75@gmail.com>
Date: Sun, 26 Nov 2023 16:30:15 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] sunxi: H616: Add OrangePi Zero 3 board support
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
 <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
 <20231126002349.55404e43@slackpad.lan>
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20231126002349.55404e43@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.11.2023 03:23, Andre Przywara wrote:
Hi Andre,
> On Sat, 25 Nov 2023 20:43:12 +0300
> Mikhail Kalashnikov <iuncuim@gmail.com> wrote:
>
> Hi Mikhail,
>
>> Hi Andre!
>> Thanks for your patches. I started checking and noticed that USB storage
>> was not working:
>>
>> => usb reset
>> resetting USB...
>> Bus usb@5200000: USB EHCI 1.00
>> Bus usb@5200400: USB OHCI 1.0
>> scanning bus usb@5200000 for devices... 1 USB Device(s) found
>> scanning bus usb@5200400 for devices... 1 USB Device(s) found
>>         scanning usb for storage devices... 0 Storage Device(s) found
>> => usb storage
>> No storage devices, perhaps not 'usb start'ed..?
> Ah, thanks for the report, seems I didn't even test this!
> So digging around I figured it's working in Linux, and it's the right
> USB port, but we are missing the VBUS power switch, which is a GPIO
> controlled regulator. There are pending patches to pick this from the
> devicetree[1], but we are not there yet, so we need:
> CONFIG_USB1_VBUS_PIN="PC16"

With that usb storage work. Also I successfully loaded u-boot image to spi

with command:

sunxi-fel -p spiflash-write 0 u-boot-sunxi-with-spl.bin
100% [================================================]   828 kB,   74.7 
kB/s

After that u-boot successful started from spi.

Best regards,

Mikhail

> in the defconfig, for now. I will update the file. The same is
> actually missing from the OrangePi Zero2 defconfig, I will send a patch
> ASAP.
>   
>> Otherwise my OpiZero3 (4GB) board looks working.
>> Ethernet works with my 10 Mbps usb-dongle.
>>
>> sf probe detect spi nor flash:
>> => sf probe
>> SF: Detected zb25vq128 with page size 256 Bytes, erase size 4 KiB, total
>> 16 MiB
>>
>> Loading the kernel and running the operating system (from microsd) also
>> without problems.
>>
>> Tested-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> Great, thanks for the tag!
>
> Cheers,
> Andre
>
>> On 14.11.2023 04:31, Andre Przywara wrote:
>>> The OrangePi Zero 3 is a small development board featuring the Allwinner
>>> H618 SoC, shipping with up to 4GB of DRAM, Gigabit Ethernet, a micro-HDMI
>>> connector and two USB sockets.
>>> The board uses LPDDR4 DRAM and an X-Powers AXP313a PMIC, support for
>>> which was recently added to U-Boot.
>>>
>>> Add a defconfig file selecting the right drivers and DRAM options.
>>> Since the .dts file was synced from the Linux kernel repo already, we
>>> just need to add one line to the Makefile to actually build the .dtb.
>>>
>>> The DRAM parameters were derived from the values found in the BSP DRAM
>>> drivers on the SPI NOR flash.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>    arch/arm/dts/Makefile            |  1 +
>>>    board/sunxi/MAINTAINERS          |  5 +++++
>>>    configs/orangepi_zero3_defconfig | 30 ++++++++++++++++++++++++++++++
>>>    3 files changed, 36 insertions(+)
>>>    create mode 100644 configs/orangepi_zero3_defconfig
>>>
>>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>>> index 1be08c5fdc2..5fc888680b3 100644
>>> --- a/arch/arm/dts/Makefile
>>> +++ b/arch/arm/dts/Makefile
>>> @@ -835,6 +835,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
>>>    	sun50i-h6-tanix-tx6-mini.dtb
>>>    dtb-$(CONFIG_MACH_SUN50I_H616) += \
>>>    	sun50i-h616-orangepi-zero2.dtb \
>>> +	sun50i-h618-orangepi-zero3.dtb \
>>>    	sun50i-h616-x96-mate.dtb
>>>    dtb-$(CONFIG_MACH_SUN50I) += \
>>>    	sun50i-a64-amarula-relic.dtb \
>>> diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
>>> index 00614372119..f556857a391 100644
>>> --- a/board/sunxi/MAINTAINERS
>>> +++ b/board/sunxi/MAINTAINERS
>>> @@ -455,6 +455,11 @@ M:	Jernej Skrabec <jernej.skrabec@siol.net>
>>>    S:	Maintained
>>>    F:	configs/orangepi_zero2_defconfig
>>>    
>>> +ORANGEPI ZERO 3 BOARD
>>> +M:	Andre Przywara <andre.przywara@arm.com>
>>> +S:	Maintained
>>> +F:	configs/orangepi_zero3_defconfig
>>> +
>>>    ORANGEPI PC 2 BOARD
>>>    M:	Andre Przywara <andre.przywara@arm.com>
>>>    S:	Maintained
>>> diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
>>> new file mode 100644
>>> index 00000000000..e59044f6639
>>> --- /dev/null
>>> +++ b/configs/orangepi_zero3_defconfig
>>> @@ -0,0 +1,30 @@
>>> +CONFIG_ARM=y
>>> +CONFIG_ARCH_SUNXI=y
>>> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero3"
>>> +CONFIG_SPL=y
>>> +CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
>>> +CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>>> +CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
>>> +CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
>>> +CONFIG_DRAM_SUN50I_H616_TPR6=0x44000000
>>> +CONFIG_DRAM_SUN50I_H616_TPR10=0x402f6663
>>> +CONFIG_DRAM_SUN50I_H616_TPR11=0x24242624
>>> +CONFIG_DRAM_SUN50I_H616_TPR12=0x0f0f100f
>>> +CONFIG_MACH_SUN50I_H616=y
>>> +CONFIG_SUNXI_DRAM_H616_LPDDR4=y
>>> +CONFIG_R_I2C_ENABLE=y
>>> +CONFIG_SPL_SPI_SUNXI=y
>>> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>>> +CONFIG_SPL_I2C=y
>>> +CONFIG_SPL_SYS_I2C_LEGACY=y
>>> +CONFIG_SYS_I2C_MVTWSI=y
>>> +CONFIG_SYS_I2C_SLAVE=0x7f
>>> +CONFIG_SYS_I2C_SPEED=400000
>>> +CONFIG_SPI_FLASH_ZBIT=y
>>> +CONFIG_PHY_MOTORCOMM=y
>>> +CONFIG_SUN8I_EMAC=y
>>> +CONFIG_AXP313_POWER=y
>>> +CONFIG_SPI=y
>>> +CONFIG_USB_EHCI_HCD=y
>>> +CONFIG_USB_OHCI_HCD=y
>>> +CONFIG_USB_MUSB_GADGET=y
