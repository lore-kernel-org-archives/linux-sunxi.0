Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA3524B
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Nov 2023 02:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my5zu5my"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5bd306f86a8so3554838a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Nov 2023 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701138911; x=1701743711; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtPn7eZgNT/oorqCom+5KaiuORO3f5l/kpnudwPLLrI=;
        b=my5zu5myzG3BnGCOhGko9Ts3VElQaOURIDwjtHIRLoBypcFASyMCm0WH5iBlNVngDd
         sZuc7av3imIED68njaVCyHKlBO80qMX36co39cbDZETvdQ6Ew5W8gYRlcXDSu/2K9uxK
         +e+AGMu6VNKFpy8emu4oB8xW0idaOI5K8tBsTGR5iOkbT8vsCn8+3CN0PExsnSVqvLKY
         Y0cnhe9Oi4SF/gkkIP2uaiLdTc8/XeLNo4Is6vTEyhXpqKUQzXbTTMqpT/0zuw2iH+b5
         29ztQhnxEV6/sJbrO9fOGxeL0JbWzH2Ar41SGhSS7H3dE+Q784b68gQsZtF64WDCoGD9
         fAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701138911; x=1701743711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPn7eZgNT/oorqCom+5KaiuORO3f5l/kpnudwPLLrI=;
        b=Zi7wZtAM7nSl+p7EUciBrdirTDn4o0PuRVOshvTBxqeF9fGOEJz1+BPJ+k3LRX9p+h
         AnD4Y3hJCiYhSeXlWlW9AesGZYwCSl2wnnwwmzJPXv663Ajcl120EKVZSVX0rX2FkTmr
         aDUxfmymXtiuJEi8ox1dh0HXrjP5exMVou/0vbnvWaRaz0uM144lVlE6BhUQLIqyYvV3
         gsQtxt/5Y9uNGif8/z1PVJXF7KRepRm97HEmvaLPhv8QMhYGuo8TLzWQO/IRlx/mSU87
         GLi8eX3wUgNRldUNhecK1quHqj2liA6r87CTdNWh1GGrJghsZXn1R607EogZzbEgXFi3
         z0MA==
X-Gm-Message-State: AOJu0YzsApeRFXsBzJA8sWf1MxPh0gVFQnsv1Mh0cnGdHKCCtSXPUUzk
	y5a4Pp+UAsH2Z+6cPbR6Dy8=
X-Google-Smtp-Source: AGHT+IEtcRR2jBCjbBsrq+VfaOLZFfd0ZsZs3fl/vIgy1T9nBsPiUwkJ4/f6NRinIc4eMv0u36ZlMQ==
X-Received: by 2002:a05:6a21:3989:b0:186:de7:e803 with SMTP id ad9-20020a056a21398900b001860de7e803mr16054940pzc.53.1701138911106;
        Mon, 27 Nov 2023 18:35:11 -0800 (PST)
Received: from [192.168.1.3] (d23-16-72-139.bchsia.telus.net. [23.16.72.139])
        by smtp.gmail.com with ESMTPSA id fw13-20020a17090b128d00b002839d7d8bf3sm6588456pjb.55.2023.11.27.18.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 18:35:10 -0800 (PST)
Message-ID: <68d7dda4-666d-40e4-bed7-f6b754105a32@gmail.com>
Date: Mon, 27 Nov 2023 18:35:10 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] sunxi: H616: Add OrangePi Zero 3 board support
Content-Language: en-CA
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
 <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
 <20231126002349.55404e43@slackpad.lan>
 <465a5608-89f7-4691-a2e0-ebec9b85d994@gmail.com>
 <20231126122342.3944cad5@slackpad.lan>
 <d8862c87-072d-4f74-bb37-08f34c610cc8@gmail.com>
 <dae3bee5-e1c7-4154-959c-e41dabb5d844@gmail.com>
 <20231128013746.23648d39@slackpad.lan>
From: Stephen Graf <stephen.graf@gmail.com>
In-Reply-To: <20231128013746.23648d39@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I got the initial defconfig that I started testing with from:

https://gist.github.com/iuncuim/2150b7a5317700314393665260ca628e

which has CONFIG_DRAM_CLK=792.

Just a few hours ago, when I was testing without this parameter, my 
system misbehaved and refused to reboot. The file system was corrupted 
and I had to reinstall the rootfs to get it going again.  I put the 
u-boot with the CONFIG_DRAM_CLK=792 back on it.

I will retest the system by building u-boot which is what I was doing 
when it crashed.

On 2023-11-27 5:37 p.m., Andre Przywara wrote:
> On Mon, 27 Nov 2023 14:31:19 -0800
> Stephen Graf <stephen.graf@gmail.com> wrote:
> 
> Hi,
> 
>> Since the last test I rebuilt u-boot without the
>> "CONFIG_DRAM_CLK=792" in the defconfig and got the wrong DRAM size
>> problem (showing 2G instead of 1G). I had to do a power down/up to see this.
>> Are you planning to add this parameter to your patch?
> 
> This symptom is pretty surely not directly related to the DRAM
> frequency, it's caused by a missing barrier or delay *somewhere*.
> People report that this is fixed by adding another "dsb();" at the
> beginning of the mctl_mem_matches() function, but I don't have a good
> explanation why exactly there, and would like to avoid submitting
> patches that "just seem to work (TM)".
> 
> If I find some time, I will try to setup some automated environment
> where I can run some experiments with different barrier locations.
> I can offer some rationale for putting it at the end of the function(s)
> that call mctl_mem_matches(), so hope that this fixes it.
> 
> Cheers,
> Andre
> 
>> U-Boot 2024.01-rc3-00012-g1fcf078f54-dirty (Nov 27 2023 - 12:25:33
>> -0800) Allwin                                                      ner
>> Technology
>>
>> CPU:   Allwinner H616 (SUN50I)
>> Model: OrangePi Zero3
>> DRAM:  2 GiB
>>
>>
>> On 2023-11-27 12:21 p.m., Stephen Graf wrote:
>>> Yes I forgot about the zBIT patch. With this patch also included I built
>>> and retested u-boot loaded from SPI flash.  The two warning/error
>>> messages disappeared and the flash worked properly and booted from a USB
>>> device.
>>>
>>> There was one message that I did not understand:
>>> "Loading Environment from SPIFlash... SF: Detected zb25vq128 with page
>>> size 256 Bytes, erase size 4 KiB, total 16 MiB
>>> *** Warning - bad CRC, using default environment"
>>>
>>> I tried to follow the u-boot documentation on writing the SPI flash but
>>> had problems with the write command.  When issued it returned
>>> immediately. The erase command took about 5 sec to execute. I researched
>>> use of mtd commands and got a suggestion to use cat instead, which worked.
>>>
>>> "root@orangepizero3:~# mtdinfo
>>> Count of MTD devices:           1
>>> Present MTD devices:            mtd0
>>> Sysfs interface supported:      yes
>>> root@orangepizero3:~# mtd_debug erase /dev/mtd0 0 0xf0000
>>> Erased 983040 bytes from address 0x00000000 in flash
>>> root@orangepizero3:~# mtd_debug write /dev/mtd0 0 0xf0000
>>> /home/sysadmin/u-boot-sunxi-with-spl.bin
>>> file_to_flash: fread, size 0xf0000, n 0xf0000
>>> fread(): Success
>>> root@orangepizero3:~# cat /home/sysadmin/u-boot-sunxi-with-spl.bin >
>>> /dev/mtd0
>>>
>>>
>>> Console log of boot:
>>>
>>> U-Boot SPL 2024.01-rc3-00012-g1fcf078f54-dirty (Nov 27 2023 - 10:17:46
>>> -0800)
>>> DRAM: 1024 MiB
>>> Trying to boot from sunxi SPI
>>> NOTICE:  BL31: v2.10.0  (debug):v2.10.0
>>> NOTICE:  BL31: Built : 18:07:18, Nov 23 2023
>>> NOTICE:  BL31: Detected Allwinner H616 SoC (1823)
>>> NOTICE:  BL31: Found U-Boot DTB at 0x4a0b2798, model: OrangePi Zero3
>>> INFO:    ARM GICv2 driver initialized
>>> INFO:    Configuring SPC Controller
>>> INFO:    PMIC: Probing AXP305 on RSB
>>> ERROR:   RSB: set run-time address: 0x10003
>>> INFO:    Could not init RSB: -65539
>>> INFO:    BL31: Platform setup done
>>> INFO:    BL31: Initializing runtime services
>>> INFO:    BL31: cortex_a53: CPU workaround for erratum 855873 was applied
>>> INFO:    BL31: cortex_a53: CPU workaround for erratum 1530924 was applied
>>> INFO:    PSCI: Suspend is unavailable
>>> INFO:    BL31: Preparing for EL3 exit to normal world
>>> INFO:    Entry point address = 0x4a000000
>>> INFO:    SPSR = 0x3c9
>>> INFO:    Changed devicetree.
>>>
>>>
>>> U-Boot 2024.01-rc3-00012-g1fcf078f54-dirty (Nov 27 2023 - 10:17:46
>>> -0800) Allwinner Technology
>>>
>>> CPU:   Allwinner H616 (SUN50I)
>>> Model: OrangePi Zero3
>>> DRAM:  1 GiB
>>> Core:  57 devices, 25 uclasses, devicetree: separate
>>> WDT:   Not starting watchdog@30090a0
>>> MMC:   mmc@4020000: 0
>>> Loading Environment from SPIFlash... SF: Detected zb25vq128 with page
>>> size 256 Bytes, erase size 4 KiB, total 16 MiB
>>> *** Warning - bad CRC, using default environment
>>>
>>> Loading Environment from FAT... Card did not respond to voltage select!
>>> : -110
>>> ** Bad device specification mmc 0 **
>>> In:    serial@5000000
>>> Out:   serial@5000000
>>> Err:   serial@5000000
>>> Allwinner mUSB OTG (Peripheral)
>>> Net:   eth0: ethernet@5020000using musb-hdrc, OUT ep1out IN ep1in STATUS
>>> ep2in
>>> MAC de:ad:be:ef:00:01
>>> HOST MAC de:ad:be:ef:00:00
>>> RNDIS ready
>>> , eth1: usb_ether
>>> starting USB...
>>> Bus usb@5200000: USB EHCI 1.00
>>> Bus usb@5200400: USB OHCI 1.0
>>> scanning bus usb@5200000 for devices... Device NOT ready
>>>      Request Sense returned 02 3A 00
>>> Device NOT ready
>>>      Request Sense returned 02 3A 00
>>> Device NOT ready
>>>      Request Sense returned 02 3A 00
>>> 2 USB Device(s) found
>>> scanning bus usb@5200400 for devices... 1 USB Device(s) found
>>>          scanning usb for storage devices... 1 Storage Device(s) found
>>> Hit any key to stop autoboot:  0
>>> Card did not respond to voltage select! : -110
>>>
>>> Device 0: Vendor: Generic- Rev: 1.00 Prod: SD/MMC
>>>               Type: Removable Hard Disk
>>>               Capacity: 3828.0 MB = 3.7 GB (7839744 x 512)
>>> ... is now current device
>>> Scanning usb 0:1...
>>> Found U-Boot script /boot.scr
>>> 1575 bytes read in 1 ms (1.5 MiB/s)
>>> ## Executing script at 4fc00000
>>> Mainline u-boot / new-style environment detected.
>>> This installer medium does not contain a suitable device-tree file for
>>> this system (allwinner/sun50i-h618-orangepi-zero3.dtb). Aborting boot
>>> process.
>>> SCRIPT FAILED: continuing...
>>> Found U-Boot script /boot/boot.scr
>>> 621 bytes read in 2 ms (302.7 KiB/s)
>>> ## Executing script at 4fc00000
>>> 19472 bytes read in 3 ms (6.2 MiB/s)
>>> Working FDT set to 4fa00000
>>> 7088139 bytes read in 326 ms (20.7 MiB/s)
>>> 22491144 bytes read in 1031 ms (20.8 MiB/s)
>>> Moving Image from 0x40080000 to 0x40200000, end=41800000
>>> ## Loading init Ramdisk from Legacy Image at 4ff00000 ...
>>>      Image Name:   uInitrd
>>>      Image Type:   AArch64 Linux RAMDisk Image (gzip compressed)
>>>      Data Size:    7088075 Bytes = 6.8 MiB
>>>      Load Address: 00000000
>>>      Entry Point:  00000000
>>>      Verifying Checksum ... OK
>>> ## Flattened Device Tree blob at 4fa00000
>>>      Booting using the fdt blob at 0x4fa00000
>>> Working FDT set to 4fa00000
>>>      Loading Ramdisk to 4993d000, end 49fff7cb ... OK
>>>      Loading Device Tree to 00000000498cf000, end 000000004993cfff ... OK
>>> Working FDT set to 498cf000
>>>
>>> Starting kernel ...
>>>
>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>> [    0.000000] Linux version 6.6.2 (orangepi@orangepizero3) (gcc (Debian
>>> 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP Sat Nov
>>> 25 18:37:47 UTC 2023
>>>
>>>
>>> On 2023-11-26 4:23 a.m., Andre Przywara wrote:
>>>> On Sat, 25 Nov 2023 20:27:05 -0800
>>>> Stephen Graf <stephen.graf@gmail.com> wrote:
>>>>
>>>> Hi Stephen,
>>>>   
>>>>> I built u-boot with the additional parameter for usb and it works, I
>>>>> think.  There was one message that might be of concern "
>>>>> Card did not respond to voltage select! : -110".
>>>>
>>>> This is a normal, though admittedly confusing message if no SD card is
>>>> inserted. The code tries to (unconditionally) access the SD card, and
>>>> sees that no card is there, the missing respond to the voltage select
>>>> command is just the first real proof of this.
>>>>   
>>>>> I am not sure of the details of the boot.cmd. The output below came from
>>>>> the supplier image on an SD plugged into a USB card reader. The SD
>>>>> slot of the board was empty.
>>>>>
>>>>> I was able to install u-boot to the SPI flash memory and there is a
>>>>> warning message from that also: "
>>>>> Loading Environment from SPIFlash... jedec_spi_nor flash@0:
>>>>> unrecognized JEDEC id bytes: 5e, 40, 18
>>>>> *** Warning - spi_flash_probe_bus_cs() failed, using default
>>>>> environment"
>>>>
>>>> So for a start there is no environment on the SPI flash yet, so it
>>>> wouldn't do anything. But the "unrecognised JEDEC id bytes" message
>>>> doesn't sound right. Can you dig into this? Do you have patch 1/3
>>>> applied, which tells U-Boot about 0x5e meaning zBIT?
>>>>   
>>
> 
