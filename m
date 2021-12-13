Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8668
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Dec 2021 17:26:24 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id e3so55404456edu.4
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Dec 2021 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hv+4w/d93d7COKSLgaaOFGUtLGfbFEM9UhQ1AyuoBoM=;
        b=LXsFxgqKF6Z4a50SdvtLmHj3BgH92Xt+qBjB3lTNQUSAytyncpXUA0bg8FtPkngK/H
         EqWMoznPwxk3x3NZQ4T0NN8xATZskJ5Ou2wdH5Hxcyi0kR67rgoj+iKQxjmA9007Swhw
         YNOB2FymsoNsjAmHmVvAxooedGaTeSC6l3H484LnofttJxenQ02Ps2U6okkvDwNKUPz+
         KwmSBSinpdDWOBiUtH5hL3c321rm4NKPibR8S7gOjUekfrhz1Xebja9g2Mj7OY94N5Vk
         asKgWHnXFCfJS49467HtKKZGZDkehk5x7I4NDZAvBZFxJZpbCNNIYlIpNy54r3ML8dvr
         qp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hv+4w/d93d7COKSLgaaOFGUtLGfbFEM9UhQ1AyuoBoM=;
        b=ptroUy0S73IQWW3LDZPJB7E+JVqo21s9EyjStpcxjip5nMaDBSVrpBZOLoFcE9Gacy
         dfVFgMbz8bgYIb1NeUvqlVGLeL3w1FDIGh+7DLF+ADpZHc+3qUtAjpqvmed5i24Eh6H2
         bIiIpfgnSkwR4c2P4J26wEaBtIbEkc8l9SsqCD00pWEGYDPU5WHgcdndXrqxYkMxCxRq
         Va6jz95nRNrpsx7G5vC4i+hGfZsv1mn/rxr2hKzqw2Te7uQ1wmLad0YHurKlDJYBLv53
         kT3kiEMVuy7TTLFQFb1u7+Gz3f8dAqogx3nYWE/azKsh21TU6jBnJw26XqJCk9JEaQxG
         hXQw==
X-Gm-Message-State: AOAM532s0jFMB+wC70NkEADwQ3j8Uqm6QZySx5XsDxjDjqW8sw5f7kdF
	gYfmxe5EUBzBvgq7N1UmVgQ=
X-Google-Smtp-Source: ABdhPJxVssVuAgvXoBZEiQvkwXnZuMHWOw/X1SkVFgRa4Brk4d/iF5lWatB0R32BFRy+jeYfw0upnA==
X-Received: by 2002:a17:906:c7c9:: with SMTP id dc9mr44419796ejb.34.1639416382794;
        Mon, 13 Dec 2021 09:26:22 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id g9sm6956746edb.52.2021.12.13.09.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 09:26:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: add board documentation
Date: Mon, 13 Dec 2021 18:20:37 +0100
Message-ID: <3402428.iIbC2pHGDl@kista>
In-Reply-To: <20211213010322.10726-1-andre.przywara@arm.com>
References: <20211213010322.10726-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne ponedeljek, 13. december 2021 ob 02:03:22 CET je Andre Przywara 
napisal(a):
> Add some long overdue instructions for building and installing U-Boot on
> Allwinner SoC based boards.
> This describes the building process, including TF-A and crust, plus
> installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> itself. Also describe FEL booting.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> please have a look whether this makes sense. Feel free to just try 
something,
> and point out ambiguities or missing bits. For missing topics, please
> send a follow-up patch ;-)

This documentation seems to include all of board/sunxi/README.sunxi64 and 
README.nand. I think it would make sense to remove those files. If any file gets 
out of sync for any reason, it would be very confusing for end user.

I would also remove all non-essential command parameters, so all commands are 
as simple as possible. Power users will know about them anyway and non-skilled 
users might perceive that it's harder that it really is. I have in mind "-j5 -
s" for make, "-v -p" for sunxi-fel and DEBUG=1 for TF-A (maybe I missed some 
places). Actually, DEBUG=1 could be mentioned afterwards as troubleshooting 
step. In my experience, stable version of TF-A was never source of boot issues 
nor it provided any useful information for debugging anything else.

Some comments bellow.

> 
> Also this is quite long, shall this be split up in two (or more) files?
> 
> This is what rst.ninjs.org made of it, if you prefer to read it formatted:
> https://paste.c-net.org/PleasantNeedy
> 
> Cheers,
> Andre
> 
>  doc/board/allwinner/index.rst |   9 +
>  doc/board/allwinner/sunxi.rst | 304 ++++++++++++++++++++++++++++++++++
>  2 files changed, 313 insertions(+)
>  create mode 100644 doc/board/allwinner/index.rst
>  create mode 100644 doc/board/allwinner/sunxi.rst
> 
> diff --git a/doc/board/allwinner/index.rst b/doc/board/allwinner/index.rst
> new file mode 100644
> index 00000000000..7352ccd5c0a
> --- /dev/null
> +++ b/doc/board/allwinner/index.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Allwinner (sunxi) boards
> +========================
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   sunxi
> diff --git a/doc/board/allwinner/sunxi.rst b/doc/board/allwinner/sunxi.rst
> new file mode 100644
> index 00000000000..693eb32e168
> --- /dev/null
> +++ b/doc/board/allwinner/sunxi.rst
> @@ -0,0 +1,304 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +.. Copyright (C) 2021 Arm Ltd.
> +
> +Allwinner SoC based boards
> +==========================
> +For boards using an Allwinner ARM based SoC ("sunxi"), the U-Boot build
> +system generates a single integrated image file: ``u-boot-sunxi-with-
spl.bin.``
> +This file can be used on SD cards, eMMC devices, SPI flash and for the
> +USB-OTG based boot method (FEL). To build this file:
> +
> +* For 64-bit SoCs, build Trusted Firmware (TF-A, formerly known as ATF) 
first,
> +  you will need its ``bl31.bin``. See below for more details.
> +* Optionally on 64-bit SoCs, build the crust management processor firmware.
> +* Build U-Boot::
> +
> +  $ export BL31=/path/to/bl31.bin		# required for 64-bit SoCs
> +  $ export SCP=/src/crust/build/scp/scp.bin	# optional for some 64-bit
 SoCs

NIT: I guess path for SCP could be in same form, at least first part?

> +  $ make <yourboardname>_defconfig
> +  $ make -j5 -s
> +* Transfer to an uSD card (see below for more details)::
> +
> +  $ dd if=u-boot-sunxi-with-spl.bin of=/dev/sdX bs=8k seek=1

Most, if not all, distros require root for above command, so $ -> #? I see 
that you used # below. Alternative would be to prepend command with sudo, 
which is imo more beginners friendly.

> +* Boot and enjoy!
> +
> +For more details, and alternative boot locations or installations, see 
below.
> +
> +Building Arm Trusted Firmware (TF-A)
> +------------------------------------
> +Boards using a 64-bit Soc (A64, H5, H6, H616, R329) require the BL31 stage 
of
> +the `Arm Trusted Firmware-A`_ firmware. This provides the reference
> +implementation of secure software for Armv8-A, offering PSCI and SMCCC
> +services. Allwinner support is fully mainlined. To build bl31.bin::
> +
> +  $ git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
> +  $ cd trusted-firmware-a
> +  $ make CROSS_COMPILE=aarch64-linux-gnu- PLAT=sun50i_a64 DEBUG=1
> +  $ export BL31=$(pwd)/build/sun50i_a64/debug/bl31.bin
> +
> +The target platform (``PLAT=``) for A64 and H5 SoCs is sun50i_a64, for the 
H6
> +sun50i_h6, for the H616 sun50i_h616, and for the R329 sun50i_r329. Use::
> +
> +  $ find plat/allwinner -name platform.mk
> +
> +to find all supported platforms. `docs/plat/allwinner.rst`_ contains more
> +information and lists some build options.
> +
> +Building the Crust management processor firmware
> +------------------------------------------------
> +For some SoCs and boards, the integrated OpenRISC management controller can
> +be used to provide power management services, foremost suspend to RAM.
> +There is a community supported Open Source implementation called `crust`_,
> +which runs on most SoCs featuring a management controller.
> +
> +This firmware part is optional, setting the SCP environment variable to
> +/dev/null avoids the warning message when building without one.
> +
> +To build crust's scp.bin, you need an OpenRISC (or1k) cross compiler, 
then::
> +
> +  $ git clone https://github.com/crust-firmware/crust.git
> +  $ cd crust
> +  $ make <yourboard>_defconfig
> +  $ make CROSS_COMPILE=or1k-none-elf- scp

I guess it would be good to point out that compiler prefix may not be the same 
on all distros. For example, Arch packages this compiler and proper prefix 
there is or1k-elf- which also works just fine.

Best regards,
Jernej

> +  $ export SCP=$(pwd)/build/scp/scp.bin
> +
> +Find a list of supported board configurations in the `configs/`_ directory.
> +
> +Building the U-Boot image
> +-------------------------
> +Find the U-Boot defconfig file for your board first. Those files live in
> +the ``configs/`` directory; you can grep for the stub name of the devicetree
> +file, if you know that, or for the SoC name to find the right version::
> +
> +    $ git grep -l MACH_SUN8I_H3 configs
> +    $ git grep -l sun50i-h6-orangepi-3 configs
> +
> +The `linux-sunxi`_ wiki also lists the name of the defconfig file in the
> +respective board page. Then use this defconfig file to create the .config
> +file, and build the image::
> +
> +    $ make <yourboard>_defconfig
> +    $ make -j5
> +
> +For 64-bit boards, this requires either the BL31 environment variable to be
> +set (as shown above in the TF-A build example), or it to be supplied on the
> +build command line::
> +
> +    $ make BL31=/src/tf-a.git/build/sun50i_h616/debug/bl31.bin -j5 -s
> +
> +The same applies to the (optional) SCP firmware.
> +
> +The file containing everything you need is called ``u-boot-sunxi-with-
spl.bin``,
> +you will find it in the root folder of your U-Boot (build) tree. Except for
> +raw NAND flash devices this very same file can be used for any boot source.
> +It will contain the SPL image, fitted with the proper signature recognised 
by
> +the BROM, and the required checksum. Also it will contain at least U-Boot
> +proper, either wrapped in the legacy U-Boot image format, or in a FIT 
image.
> +The board's devicetree is also included, either appended to the U-Boot 
proper
> +image, or contained in the FIT image. If required by the SoC, this FIT file 
will
> +also include the other firmware images.
> +
> +Installing U-Boot
> +-----------------
> +
> +Installing on a (micro-) SD card
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +All Allwinner SoCs will try to find a boot image at sector 16 (8KB) of
> +an SD card, connected to the first MMC controller. To transfer the generated
> +image to an SD card, from any Linux device (including the board itself) 
with
> +an (micro-)SD card reader, type::
> +
> +    # dd if=u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1k seek=8
> +
> +``/dev/sdx`` needs to be replaced with the block device name of the SD card
> +reader. On some machines this could be ``/dev/mmcblkX``.
> +Newer SoCs (starting from H3), also look at sector 256 (128KB) for the
> +signature (after having checked the 8KB location). Installing the firmware
> +there has the advantage of not overlapping with a GPT partition table. 
Simply
> +replace the "``seek=8``" above with "``seek=128``".
> +
> +You can also use an existing (mainline) U-Boot to write to the SD card. 
Load
> +the generated U-Boot image somewhere into DRAM (via ``ext4load``, 
``fatload``,
> +or ``tftpboot``), then write to MMC device 0::
> +
> +    => fatload mmc 0:1 $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    => mmc dev 0
> +    => mmc write $kernel_addr_r 0x10 0x7f0
> +
> +To use the alternative boot location on newer SoCs::
> +
> +    => mmc write $kernel_addr_r 0x100 0x700
> +
> +Installing on eMMC (on-board flash memory)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +Some boards have a soldered eMMC chip, some other boards have an eMMC 
socket
> +to receive an optional eMMC module. U-Boot can be installed to those chips,
> +to boot without an SD card inserted. The Boot-ROM can boot either from the
> +regular user data partition, or from one of the separate eMMC boot 
partitions.
> +U-Boot can be installed either from a running Linux instance on the device,
> +from a running (mainline) U-Boot, or via an adapter for the (removable)
> +eMMC module.
> +
> +Installing on an eMMC user data partition from Linux
> +````````````````````````````````````````````````````
> +If you have a running Linux instance on the device, and have somehow copied
> +over the image file to that device, you can write the image directly into 
the
> +eMMC device from there.
> +Find the name of the block device file first, it is one of the
> +``/dev/mmcblk<X>`` devices. eMMC devices typically also list a
> +``/dev/mmcblk<X>boot0`` partition (see below), this helps you to tell it 
apart
> +from the SD card device.
> +To install onto the user data partition::
> +
> +    # dd if=u-boot-sunxi-with-spl.bin of=/dev/dev/mmcblkX bs=1k seek=8
> +
> +Similar to SD cards, the BROM in newer SoCs (H3 and above) also checks
> +sector 256 of an eMMC, so you can use "``seek=128``" as well.
> +
> +Installing on an eMMC boot partition from Linux
> +```````````````````````````````````````````````
> +In the following examples, ``/dev/mmcblkX`` needs to be replaced with the 
block
> +device name of the eMMC device. The eMMC device can be recognised by also
> +listing the boot partitions (``/dev/mmcblkXboot0``) in ``/proc/
partitions``.
> +
> +To allow booting from one of the eMMC boot partitions, this one needs to be
> +enabled first. This only needs to be done once, as this setting is
> +persistent, even though the boot partition can be disabled or changed again
> +any time later::
> +
> +    # apt-get install mmc-utils
> +    # mmc bootbus set single_hs x1 x4 /dev/mmcblkX
> +    # mmc bootpart enable 1 1 /dev/mmcblkX
> +
> +The first "1" in the last command points to the boot partition number to be
> +used, typically devices offer two boot partitions.
> +
> +By default Linux disables write access to the boot partitions, to prevent
> +accidental overwrites. You need to disable the write protection (until the
> +next reboot), then can write the U-Boot image to the *first* sector of the
> +selected boot partition::
> +
> +    # echo 0 > /sys/block/mmcblkXboot0/force_ro
> +    # dd if=u-boot-sunxi-with-spl.bin of=/dev/mmcblkXboot0 bs=1k
> +
> +Installing on an eMMC user data partition from U-Boot
> +`````````````````````````````````````````````````````
> +You can also write the generated image file to an SD card, boot the device
> +from there, and burn the very same image to the eMMC device from U-Boot.
> +The following commands copy the image from the SD card to the eMMC device::
> +
> +    => mmc dev 0
> +    => mmc read $kernel_addr_r 0x10 0x7f0
> +    => mmc dev 1
> +    => mmc write $kernel_addr_r 0x10 0x7f0
> +
> +You can also copy an image from the 8K offset of an SD card to the 128K
> +offset of the eMMC (or any combination), just change the "``0x10 0x7f0``" 
above
> +to "``0x100 0x700``", respectively. Of course the image file can be loaded 
via
> +any other loading method, including ``fatload``, ``ext4load``, 
``tftpboot``.
> +
> +Installing on an eMMC boot partition from U-Boot
> +````````````````````````````````````````````````
> +The selected eMMC boot partition needs to be initially enabled first (same
> +as in Linux above), you can do this from U-Boot with::
> +
> +    => mmc dev 1
> +    => mmc bootbus 1 1 0 0
> +    => mmc partconf 1 1 1 1
> +
> +The first "1" in both commands denotes the MMC device number. The second "1"
> +in the partconf command sets the required ``BOOT_ACK`` option, the last two 
"1"s
> +selects the active boot partition and the target for the next data access,
> +respectively. So for the next "``mmc write``" command to address one of the 
boot
> +partitions, the last number must either be "1" or "2", "0" would switch 
(back)
> +to the normal user data partition.
> +
> +Then load the ``u-boot-sunxi-with-spl.bin`` image file into DRAM, either by
> +reading directly from an SD card or eMMC user data partition, or from a
> +file system or TFTP (see above), and transfer it to the boot partition::
> +
> +    => tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    => mmc write $kernel_addr_r 0 0x7f0
> +
> +After that the device should boot from the selected boot partition, which 
takes
> +precedence over booting from the user data partition.
> +
> +Installing on SPI flash
> +^^^^^^^^^^^^^^^^^^^^^^^
> +Some devices have a SPI NOR flash chip soldered on the board. If it is
> +connected to the SPI0 pins on PortC, the BROM can also boot from there.
> +Typically the SPI flash has the lowest boot priority, so SD card and eMMC
> +devices will be considered first.
> +
> +Installing on SPI flash from Linux
> +``````````````````````````````````
> +If the devicetree enables and describes the SPI flash device, you can access
> +the SPI flash content from Linux, using the `MTD utils`_::
> +
> +    # apt-get install mtd-utils
> +    # mtdinfo
> +    # mtd_debug erase /dev/mtdX 0 0xf0000
> +    # mtd_debug write /dev/mtdX 0 0xf0000 u-boot-sunxi-with-spl.bin
> +
> +``/dev/mtdX`` needs to be replaced with the respective device name, as 
listed
> +in the output of ``mtdinfo``.
> +
> +Installing on SPI flash from U-Boot
> +```````````````````````````````````
> +If SPI flash driver and command support (``CONFIG_CMD_SF``) is enabled in 
the
> +U-Boot configuration, the image file can be installed via U-Boot as well::
> +
> +    => tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    => sf probe
> +    => sf erase 0 +0xf0000
> +    => sf write $kernel_addr_r 0 $filesize
> +
> +Installing on SPI flash via USB in FEL mode
> +```````````````````````````````````````````
> +If the device is in FEL mode (see below), the SPI flash can also be filled
> +with the sunxi-fel utility, via an USB(-OTG) cable from any USB host 
machine::
> +
> +    $ sunxi-fel -v -p spiflash-write 0 u-boot-sunxi-with-spl.bin
> +
> +Booting via the USB(-OTG) FEL mode
> +----------------------------------
> +If none of the boot locations checked by the BROM contain a medium or valid
> +signature, the BROM will enter the so-called FEL mode, in which it will
> +listen to commands from a host on the SoC's USB-OTG interface. Those 
commands
> +allow to read from and write to arbitrary memory locations, also to start
> +execution at any address, which allows to bootstrap a board solely via an
> +USB cable. Some boards feature a "FEL" or "U-Boot" button, which forces
> +FEL mode despite a valid boot location being present. The same can be 
achieved
> +via a `magic binary`_ on an SD card, which allows to enter FEL mode on any
> +board.
> +
> +To use FEL booting, let the board enter FEL mode, via any of the mentioned
> +methods (no boot media, FEL button, SD card with FEL binary), then connect
> +a USB cable to the board's USB OTG port. Some boards (Pine64, TV boxes) 
don't
> +have a separate OTG port. In this case mostly one of the USB-A ports is
> +connected to USB0, and can be used via a non-standard USB-A to USB-A cable.
> +
> +Typically there is no on-board indication of FEL mode, other than a new USB
> +device appearing on the connected host computer. The USB vendor/device ID
> +is 1f3a:efe8. Mostly this will identify as "sunxi SoC OTG connector in
> +FEL/flashing mode", but older distributions might still report "Onda
> +(unverified) V972 tablet in flashing mode".
> +
> +The `sunxi_fel`_ tool implements the proprietary BROM protocol, and allows 
to
> +bootstrap U-Boot by just providing our venerable u-boot-sunxi-with-
spl.bin::
> +
> +    $ sudo apt-get install sunxi-tools
> +    $ sunxi-fel -v -p uboot u-boot-sunxi-with-spl.bin
> +
> +Additional binaries like a kernel, an initial ramdisk or a boot script, can
> +also be uploaded via FEL, check the Wiki's `FEL page`_ for more details.
> +
> +.. _`Arm Trusted Firmware-A`:  https://www.trustedfirmware.org/projects/tf-a/
> +.. _`docs/plat/allwinner.rst`: https://trustedfirmware-a.readthedocs.io/en/
latest/plat/allwinner.html
> +.. _`crust`: https://github.com/crust-firmware/crust
> +.. _`configs/`: https://github.com/crust-firmware/crust/tree/master/configs
> +.. _`linux-sunxi`: https://linux-sunxi.org
> +.. _`MTD utils`: http://www.linux-mtd.infradead.org/
> +.. _`magic binary`: https://github.com/linux-sunxi/sunxi-tools/raw/master/
bin/fel-sdboot.sunxi
> +.. _`sunxi_fel`: https://github.com/linux-sunxi/sunxi-tools
> +.. _`FEL page`: https://linux-sunxi.org/FEL/USBBoot
> -- 
> 2.17.6
> 
> 


