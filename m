Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE517C7
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Nov 2023 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmzad0C9"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5098e423ba2so3603850e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Nov 2023 22:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700892668; x=1701497468; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nd0MDLoQkdhZIK5GMUrD1r8C4BUiQLMLDOhrrXlocwQ=;
        b=nmzad0C9kRjDJWLrdQAj9b29cm6s9qkdvLXSD/GwumY52wFjamx7gWWzTVVHxlUar6
         BqeYPZPS3SMyiDuZ/u2/9fiHwPOAMFwWHnoPGKPSOj0Ga3X50EjaW9p6bpPe50DWLyG1
         tF0hThD+1Y1SF6HB+jgw+j+vP4iw/jz0Dv4Wz8Fb1l5e6Lg3EN19anQkjDUsgpyfapnf
         rKE+85LZES8ZdKpAIBPix8X31x/qyHw37jGAmd2ck36ovVnmeNaSReacZxAn2P8VGMsO
         IQG2ccFvNH+K9K06kloxr5notMqz5cyx1P5vm+qX1p2aZQiaoWesA13kPfswDCAjLWHG
         Nsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700892668; x=1701497468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd0MDLoQkdhZIK5GMUrD1r8C4BUiQLMLDOhrrXlocwQ=;
        b=J1roi2VVPrxzi59mCiKArieKw46/GHfhl0QOkEBmvxTcK11pzJLdncwFpNJkN7jOxf
         Fnn3AEwW7pBgqCa2vJWcZUaHV8lXZysmByGtL/s7fXp6e4buZy6iGClHfJ/fcfIkGXFQ
         gDX+UrH7s1PAf+Wrz6IBXZJZPtZD38b5NhVL19QuoWNX6H5+XgLfnUcja4wJ0Q2flEk+
         yN7KNY2eb/T4EaL+lyhdIVkuwU4PRWtjk0ClSaybAHQAyAFX0j/YKRWNhFlZGZc8dLfW
         RG6cMK/f8jNmRLhmC1a0xCW6o//ANvhEX80sPLbpZJTagiyYrs25RGxyayhzD6pJKqwJ
         3IbQ==
X-Gm-Message-State: AOJu0Yw5f1atUVYypd59HpBjNLSKRx3+Lt4ChiOnoG92xoVvVId713Ji
	LMdzwmLqJ/W44PE3Fponsq8SwnwGhdA=
X-Google-Smtp-Source: AGHT+IHp4P1+1ZfUR5LdR/LsQ9cEhr9FDlUzpCeOCQsfC1u4CzxB8NK79txhv6/9JgQjhT/rygZdsw==
X-Received: by 2002:ac2:4208:0:b0:505:73e7:b478 with SMTP id y8-20020ac24208000000b0050573e7b478mr2953575lfh.16.1700892667782;
        Fri, 24 Nov 2023 22:11:07 -0800 (PST)
Received: from [192.168.99.248] ([94.143.197.234])
        by smtp.gmail.com with ESMTPSA id u5-20020ac25185000000b004fe47879d93sm726199lfi.106.2023.11.24.22.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 22:11:07 -0800 (PST)
Message-ID: <67a250b0-8b33-4a42-883e-4e37ec5833e7@gmail.com>
Date: Sat, 25 Nov 2023 09:11:05 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: orangepi zero3
To: Andre Przywara <andre.przywara@arm.com>,
 Stephen Graf <stephen.graf@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <28efed32-ee19-4a89-9c84-defa95c3a963@telus.net>
 <20231123141551.799dc14f@donnerap.manchester.arm.com>
 <dd04a65c-7f99-451b-9c89-b6300cdbf803@gmail.com>
 <20231124000952.6d24df32@slackpad.lan>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20231124000952.6d24df32@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24.11.2023 03:11, Andre Przywara wrote:
> On Thu, 23 Nov 2023 11:12:25 -0800
> Stephen Graf <stephen.graf@gmail.com> wrote:
>
> Hi Stephen,
>
>> Thank you for your reply.
> Thanks for coming back. Please keep the list(s) on CC:, as this is also
> interesting for others, and more eyes help to find issues faster.
> CC:ing Piotr and Mikhail, who were debugging the LPDDR4 DRAM setup
> before.
>
>> I built u-boot with the proposed changes and it seems to work. It does
>> however report "DRAM: 2048 MiB" although I have a board with only 1G.
> Ah, that's a good report! I actually saw the same issue (reporting 8GB
> instead of 4GB), and my hunch is that it's related to some missing
> barriers or delays, as seen on other boards.
> Can you try to add a "dsb();" to the beginning of
> arch/arm/mach-sunxi/dram_helpers.c:mctl_mem_matches(), before the first writel()?
> I am still not convinced this is the right place to put the barrier,
> but it would confirm that this is the issue.
> Also I didn't see this effect consistently, so did this happen for you
> every time?

I tried using an additional barrier as you described:

diff --git a/arch/arm/mach-sunxi/dram_helpers.c 
b/arch/arm/mach-sunxi/dram_helpers.c
index cdf2750..16938fa 100644
--- a/arch/arm/mach-sunxi/dram_helpers.c
+++ b/arch/arm/mach-sunxi/dram_helpers.c
@@ -34,6 +34,7 @@ bool mctl_mem_matches(u32 offset)
  {
      /* Try to write different values to RAM at two addresses */
      writel(0, CFG_SYS_SDRAM_BASE);
+    dsb();
      writel(0xaa55aa55, (ulong)CFG_SYS_SDRAM_BASE + offset);
      dsb();
      /* Check if the same value is actually observed when reading back */

After this I did not notice any problems with incorrect configuration.

As I understand it, the problem occurs most often during a hot plug.

>
> Another thing you could try is to increase the voltage to 1150mV, this
> is what Piotr needed for reliable operation.
>
>> When I built u-boot with the config that I used it reported 1G
>> correctly. The Zunlong distros do have different images for various RAM
>> configurations.
> Yeah, I saw this, and I hope we can avoid this. I am not sure if you
> are the first one with a 1GB board, so your testing is definitely
> helpful.
>
>> I do not know enough about the details to determine which differences in
>> the two configs result in the change.
>>
>> I am more than willing to test and report if someone can direct me a bit.
>>
>> sysadmin@ubuntu:~/defconfgs$ diff sg.txt andre.txt
> (please use "diff -u", that's easier to read and people are more used
> to its output style)
>
>> 9d8
>> < CONFIG_DRAM_SUN50I_H616_TPR0=0x0
>> 11,13c10,12
>> < CONFIG_DRAM_SUN50I_H616_TPR10=0x402f0663
>> < CONFIG_DRAM_SUN50I_H616_TPR11=0x24242323
>> < CONFIG_DRAM_SUN50I_H616_TPR12=0x0e0e0e0e
>> ---
>>   > CONFIG_DRAM_SUN50I_H616_TPR10=0x402f6663
>>   > CONFIG_DRAM_SUN50I_H616_TPR11=0x24242624
>>   > CONFIG_DRAM_SUN50I_H616_TPR12=0x0f0f100f
> I don't think those minor timing differences matter much, but you can
> try to experiment with both set of values.
>
>> 16d14
>> < CONFIG_DRAM_CLK=792
> Not specifying DRAM_CLK means it uses the default 720 MHz. In the past
> lowering the DRAM frequency was an easy way to stabilise the DRAM
> setup, even though this might somewhat paper over other issues.
>
>> 25c23
>> < CONFIG_SPI_FLASH_MACRONIX=y
>> ---
>>   > CONFIG_SPI_FLASH_ZBIT=y
> Please double check, but I think all new OrangePi boards now use a zBIT
> flash chip? Should have a small "Z" like logo on that 8 pin chip with
> the large pins on top.
>
>> 27a26
>>   > CONFIG_AXP313_POWER=y
>> 32,34c31
>> < CONFIG_AXP313_POWER=y
>> < CONFIG_AXP_DCDC3_VOLT=1100
> 1100mV is the default, so putting exactly this value in doesn't change
> anything.
>
>> < CONFIG_CMD_BOOTZ=y
> Why do you need bootz? I don't think this doing anything useful in
> mainline U-Boot. Don't know if OrangePi was just confused and had an
> actual use case for this.
>
>
>> ---
>>   >
>>
>> A second issue that I discovered with both builds is that the Ethernet
>> does not come up on a 1Gb switch, but works on a 100Mb switch.
> There is a pending patch for mainline Linux, can you try to apply those
> DT changes to U-Boot's DT copy and see if that helps?
> https://lore.kernel.org/linux-sunxi/2303336.ElGaqSPkdT@jernej-laptop/T/#m77ee30923cb0351f2d701a463a940dc7c00fa8b7
>
> Cheers,
> Andre
>
>
>> Output from the patch defconfig (1Gb LAN):
>>
>> U-Boot SPL 2024.01-rc3-00009-g9e53e45292-dirty (Nov 23 2023 - 18:08:24
>> +0000)
>> DRAM: 2048 MiB
>> Trying to boot from MMC1
>> NOTICE:  BL31: v2.10.0  (debug):v2.10.0
>> NOTICE:  BL31: Built : 18:07:18, Nov 23 2023
>> NOTICE:  BL31: Detected Allwinner H616 SoC (1823)
>> NOTICE:  BL31: Found U-Boot DTB at 0x4a0b2750, model: OrangePi Zero3
>> INFO:    ARM GICv2 driver initialized
>> INFO:    Configuring SPC Controller
>> INFO:    PMIC: Probing AXP305 on RSB
>> ERROR:   RSB: set run-time address: 0x10003
>> INFO:    Could not init RSB: -65539
>> INFO:    BL31: Platform setup done
>> INFO:    BL31: Initializing runtime services
>> INFO:    BL31: cortex_a53: CPU workaround for erratum 855873 was applied
>> INFO:    BL31: cortex_a53: CPU workaround for erratum 1530924 was applied
>> INFO:    PSCI: Suspend is unavailable
>> INFO:    BL31: Preparing for EL3 exit to normal world
>> INFO:    Entry point address = 0x4a000000
>> INFO:    SPSR = 0x3c9
>> INFO:    Changed devicetree.
>>
>>
>> U-Boot 2024.01-rc3-00009-g9e53e45292-dirty (Nov 23 2023 - 18:08:24
>> +0000) Allwinner Technology
>>
>> CPU:   Allwinner H616 (SUN50I)
>> Model: OrangePi Zero3
>> DRAM:  2 GiB
>> Core:  57 devices, 25 uclasses, devicetree: separate
>> WDT:   Not starting watchdog@30090a0
>> MMC:   mmc@4020000: 0
>> Loading Environment from FAT... Unable to use mmc 0:1...
>> In:    serial@5000000
>> Out:   serial@5000000
>> Err:   serial@5000000
>> Allwinner mUSB OTG (Peripheral)
>> Net:   eth0: ethernet@5020000using musb-hdrc, OUT ep1out IN ep1in STATUS
>> ep2in
>> MAC de:ad:be:ef:00:01
>> HOST MAC de:ad:be:ef:00:00
>> RNDIS ready
>> , eth1: usb_ether
>> starting USB...
>> Bus usb@5200000: USB EHCI 1.00
>> Bus usb@5200400: USB OHCI 1.0
>> scanning bus usb@5200000 for devices... 1 USB Device(s) found
>> scanning bus usb@5200400 for devices... 1 USB Device(s) found
>>          scanning usb for storage devices... 0 Storage Device(s) found
>> Hit any key to stop autoboot:  0
>> switch to partitions #0, OK
>> mmc0 is current device
>>
>> Device 0: unknown device
>> BOOTP broadcast 1
>> BOOTP broadcast 2
>> BOOTP broadcast 3
>> BOOTP broadcast 4
>> BOOTP broadcast 5
>> BOOTP broadcast 6
>> BOOTP broadcast 7
>> BOOTP broadcast 8
>> BOOTP broadcast 9
>> BOOTP broadcast 10
>> BOOTP broadcast 11
>> BOOTP broadcast 12
>>
>> Retry time exceeded; starting again
>> missing environment variable: pxeuuid
>> Retrieving file: pxelinux.cfg/01-02-00-d5-13-4f-ba
>> *** ERROR: `serverip' not set
>>
>>
>> Output from the defconfig that I had used (100Mb LAN):
>>
>> U-Boot SPL 2024.01-rc3-00009-g9e53e45292-dirty (Nov 23 2023 - 18:56:18
>> +0000)
>> DRAM: 1024 MiB
>> Trying to boot from MMC1
>> NOTICE:  BL31: v2.10.0  (debug):v2.10.0
>> NOTICE:  BL31: Built : 18:07:18, Nov 23 2023
>> NOTICE:  BL31: Detected Allwinner H616 SoC (1823)
>> NOTICE:  BL31: Found U-Boot DTB at 0x4a0b3b68, model: OrangePi Zero3
>> INFO:    ARM GICv2 driver initialized
>> INFO:    Configuring SPC Controller
>> INFO:    PMIC: Probing AXP305 on RSB
>> ERROR:   RSB: set run-time address: 0x10003
>> INFO:    Could not init RSB: -65539
>> INFO:    BL31: Platform setup done
>> INFO:    BL31: Initializing runtime services
>> INFO:    BL31: cortex_a53: CPU workaround for erratum 855873 was applied
>> INFO:    BL31: cortex_a53: CPU workaround for erratum 1530924 was applied
>> INFO:    PSCI: Suspend is unavailable
>> INFO:    BL31: Preparing for EL3 exit to normal world
>> INFO:    Entry point address = 0x4a000000
>> INFO:    SPSR = 0x3c9
>> INFO:    Changed devicetree.
>>
>>
>> U-Boot 2024.01-rc3-00009-g9e53e45292-dirty (Nov 23 2023 - 18:56:18
>> +0000) Allwinner Technology
>>
>> CPU:   Allwinner H616 (SUN50I)
>> Model: OrangePi Zero3
>> DRAM:  1 GiB
>> Core:  57 devices, 25 uclasses, devicetree: separate
>> WDT:   Not starting watchdog@30090a0
>> MMC:   mmc@4020000: 0
>> Loading Environment from FAT... Unable to use mmc 0:1...
>> In:    serial@5000000
>> Out:   serial@5000000
>> Err:   serial@5000000
>> Allwinner mUSB OTG (Peripheral)
>> Net:   eth0: ethernet@5020000using musb-hdrc, OUT ep1out IN ep1in STATUS
>> ep2in
>> MAC de:ad:be:ef:00:01
>> HOST MAC de:ad:be:ef:00:00
>> RNDIS ready
>> , eth1: usb_ether
>> starting USB...
>> Bus usb@5200000: USB EHCI 1.00
>> Bus usb@5200400: USB OHCI 1.0
>> scanning bus usb@5200000 for devices... 1 USB Device(s) found
>> scanning bus usb@5200400 for devices... 1 USB Device(s) found
>>          scanning usb for storage devices... 0 Storage Device(s) found
>> Hit any key to stop autoboot:  0
>> switch to partitions #0, OK
>> mmc0 is current device
>>
>> Device 0: unknown device
>> BOOTP broadcast 1
>> DHCP client bound to address 192.168.1.63 (5 ms)
>> *** Warning: no boot file name; using 'C0A8013F.img'
>> Using ethernet@5020000 device
>> TFTP from server 192.168.1.253; our IP address is 192.168.1.63
>> Filename 'C0A8013F.img'.
>> Load address: 0x42000000
>> Loading: T T T
>>
>> defconfig used:
>>
>> CONFIG_ARM=y
>> CONFIG_ARCH_SUNXI=y
>> CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero3"
>> CONFIG_SPL=y
>> CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
>> CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>> CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
>> CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
>> CONFIG_DRAM_SUN50I_H616_TPR0=0x0
>> CONFIG_DRAM_SUN50I_H616_TPR6=0x44000000
>> CONFIG_DRAM_SUN50I_H616_TPR10=0x402f0663
>> CONFIG_DRAM_SUN50I_H616_TPR11=0x24242323
>> CONFIG_DRAM_SUN50I_H616_TPR12=0x0e0e0e0e
>> CONFIG_MACH_SUN50I_H616=y
>> CONFIG_SUNXI_DRAM_H616_LPDDR4=y
>> CONFIG_DRAM_CLK=792
>> CONFIG_R_I2C_ENABLE=y
>> CONFIG_SPL_SPI_SUNXI=y
>> # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>> CONFIG_SPL_I2C=y
>> CONFIG_SPL_SYS_I2C_LEGACY=y
>> CONFIG_SYS_I2C_MVTWSI=y
>> CONFIG_SYS_I2C_SLAVE=0x7f
>> CONFIG_SYS_I2C_SPEED=400000
>> CONFIG_SPI_FLASH_MACRONIX=y
>> CONFIG_PHY_MOTORCOMM=y
>> CONFIG_SUN8I_EMAC=y
>> CONFIG_SPI=y
>> CONFIG_USB_EHCI_HCD=y
>> CONFIG_USB_OHCI_HCD=y
>> CONFIG_USB_MUSB_GADGET=y
>> CONFIG_AXP313_POWER=y
>> CONFIG_AXP_DCDC3_VOLT=1100
>> CONFIG_CMD_BOOTZ=y
>>
>>
>> On 2023-11-23 6:15 a.m., Andre Przywara wrote:
>>> On Tue, 21 Nov 2023 21:52:12 -0800
>>> Stephen Graf <s_graf@telus.net> wrote:
>>>
>>> Hi Stephen,
>>>   
>>>> I have been able to build a working (on my orangepi zero3 1G) u-boot for
>>>> the orangepi zero3 with the following defconfig. Would it be possible to
>>> thanks for your interest in contributing and for reaching out!
>>> As Peter already mentioned, you would need to send a patch, as generated
>>> by "git format-patch". "git send-email" would help you with sending this
>>> out.
>>>
>>> But actually I sent a small series already last week:
>>> https://lore.kernel.org/u-boot/20231114013106.31336-1-andre.przywara@arm.com/
>>>
>>> If you could apply these patches and test it on your board, I'd be
>>> grateful. If it works for you and you are happy, please reply to patch 3/3
>>> and add a "Tested-by: Your Name <your@email.com>" line.
>>> For instructions how to reply, check "Reply instructions" at the end of
>>> that mailing list archive web page above.
>>>
>>> I was just waiting for confirmations by other people before merging it.
>>>
>>> Cheers,
>>> Andre
>>>
>>>   
>>>> add this config to the working boards.  I would test it again with an
>>>> official build. The dtb/dts is in linux and in u-boot.
>>>>
>>>> The H618 processor is software compatible with the H616 and the zero3
>>>> board is very similar to the zero2 with the exception of DDR3 replaced
>>>> with LPDDR4 and the Realtek phy with Motorcomm.
>>>>
>>>> CONFIG_ARM=y
>>>> CONFIG_ARCH_SUNXI=y
>>>> CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero3"
>>>> CONFIG_SPL=y
>>>> CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
>>>> CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>>>> CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
>>>> CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
>>>> CONFIG_DRAM_SUN50I_H616_TPR0=0x0
>>>> CONFIG_DRAM_SUN50I_H616_TPR6=0x44000000
>>>> CONFIG_DRAM_SUN50I_H616_TPR10=0x402f0663
>>>> CONFIG_DRAM_SUN50I_H616_TPR11=0x24242323
>>>> CONFIG_DRAM_SUN50I_H616_TPR12=0x0e0e0e0e
>>>> CONFIG_MACH_SUN50I_H616=y
>>>> CONFIG_SUNXI_DRAM_H616_LPDDR4=y
>>>> CONFIG_DRAM_CLK=792
>>>> CONFIG_R_I2C_ENABLE=y
>>>> CONFIG_SPL_SPI_SUNXI=y
>>>> # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>>>> CONFIG_SPL_I2C=y
>>>> CONFIG_SPL_SYS_I2C_LEGACY=y
>>>> CONFIG_SYS_I2C_MVTWSI=y
>>>> CONFIG_SYS_I2C_SLAVE=0x7f
>>>> CONFIG_SYS_I2C_SPEED=400000
>>>> CONFIG_SPI_FLASH_MACRONIX=y
>>>> CONFIG_PHY_MOTORCOMM=y
>>>> CONFIG_SUN8I_EMAC=y
>>>> CONFIG_SPI=y
>>>> CONFIG_USB_EHCI_HCD=y
>>>> CONFIG_USB_OHCI_HCD=y
>>>> CONFIG_USB_MUSB_GADGET=y
>>>> CONFIG_AXP313_POWER=y
>>>> CONFIG_AXP_DCDC3_VOLT=1100
>>>> CONFIG_CMD_BOOTZ=y
>>>>   
