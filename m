Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01AD29CA
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Dec 2021 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1640676286;
	bh=BOBxp9zl5ji6VO0VJUT2Id7Nh5lKAdLekbeovZ1CvxQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lFCETZyTE9+3IIzPIcl/xL9r1kofa1WVZLiLd0HYQEqDVgptLfGEACxwIJwHY2dc1
	 zOByzqKEmKrBYOywXtb0ki4H/pVRVJgLMeM8mqcIVsm2HiMsVNAF9PE+WtjntvTXv1
	 1oL36sZtHHOfQB5vVTh5ZjYuFYzeIictBLxzghII=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([88.152.144.157]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbkC-1mjTX81vYq-00KuL3; Tue, 28
 Dec 2021 08:24:46 +0100
Message-ID: <b588381f-fc88-74bb-ee7b-4de396ee3bca@gmx.de>
Date: Tue, 28 Dec 2021 08:24:38 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] sunxi: add board documentation
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
 linux-sunxi@lists.linux.dev, Jagan Teki <jagan@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
References: <20211227150736.1437-1-andre.przywara@arm.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20211227150736.1437-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JWyVRL/Ku2DSW5l6oPa7DS/9qca7gmuGHWBWlR57/J+EaLPEEKV
 wkNP52SJT5CPpnWXM7BuHp6+xaMVdJoICCf4i+GjoF2Q8Gpy5xkemgYuW4N7bAV7W6aMJ7n
 T24VbG8jqzx/OX4GJ46dcTL6vXs9GwsavjQOM1XLZrEjwnux3W+EmisAOgNE3MSK2mW/eut
 gSGfL6b4MOkJRqMEyWuWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aB/b1r8UfO8=:i2OJ1GlY93kCUUyFcvYDwX
 RxmrnqdDibAfmIJJSNq+Is1NvU2O1m8494zp4LYdEUxqH8WnDfYaoqxnSE55Rdh88Hm4guyOt
 1tl9g6rMlDYUfopQn1CjSUea4sw5NLUBBpa9+RSJktN0YewwjbaezpHQORC69LYopSW/JDfe0
 4cbTKStw+B4A7r/CtlFIuIsfXj0UgybxZgNTIyJe0DMmRcObFuvarYFgXSvTR5XizKZv9nQ9L
 Y1YbIKx3Lsdc5iHpUa8bjADUvr8M3YNSYnJrdMAqf4KRl2rCqde9VmNqGuIc4JWKpaeW07VVt
 faVUy6R10MlD413sl7K866PeSwSv1Wh1d0aLPol24s3ZgXdkxbopVw0t4Rsc2MpktvGKbyv+y
 DUfU6NnFzqTNMqwVFRu/rvlNsCo1cPauh2GDwdzKSWFECdfLvrK/ave/grlJK++pNIDQ7v44D
 pXmAfgmLxjk4XRCLxl8Xt2ck4NVz9/+q14CYm+qDA52I+i6YfDnds1xh18/Ewc8/A+v8dcUVr
 z88+FtFR5E0Dfa5WMwDyQ9xHvRb+92MvYdGNNfiZqRxmEG1AqUNVeElYZGXTKCjk6fV7D85JX
 U4MOt7bXZCPzE0Tcg1qb5VShf9s6PSZNuCz5ec9lRE/IhiELWYCOxCOEC/Y8GuGr5EVg17atu
 59V32gefssdpFa9qmvyUHbbIedRIzKa6ehZntXp9AVdtZTTsucrIt+0lM1c9CZ8bQW2uNw02y
 JIPnVIoYzxDObQMsji7Twf+7+XXuhq7PXICYg86q+VEsaRyD3YnqAjWNDowrd0UtFwyg/iykY
 ZIQGJGsLwnfMYryFaD57nQJhGjfCXaoo+LO3OTLey9gpAgXz1xoC1EnbBsVgmvI8VbgSacPyl
 aj/0jRSvmgM00pFEacUzuirdB79YMFe8N2ZuGCsXJzQiwbCOfNnQIF6hHoKN34mH+GftiSwSR
 Fn5XZZWEva0iXjJY2MQMgR4JC9rZYmNKmvtfrpSX24dfo4UDd3jt5rEOco2Di04o5GmcpaqSp
 WFxQwB5kZLJJy9Wf2aO0vv2eUtyFdFxddn3KeHpS+NOXAe/TBhpvLja9Cu0izqZfBTWuD/MqU
 6aq7M1+v1ffrko=

On 12/27/21 16:07, Andre Przywara wrote:
> Add some long overdue instructions for building and installing U-Boot on
> Allwinner SoC based boards.
> This describes the building process, including TF-A and crust, plus
> installation to SD card, eMMC and SPI flash, both from Linux and U-Boot
> itself. Also describe FEL booting.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changelog v1 ... v2:
> - drop optional command line parameters (-j, -v, ...)
> - more links and explanations around crust
> - use "sudo dd" instead of "#" root prompt to indicate root privileges
> - add prominent note about BROM header inside GPT
> - more hints on SoCs with 128K boot offset ability
> - add Allwinner index to top-level index.rst
> - smaller typo fixes
>
>   doc/board/allwinner/index.rst |   9 +
>   doc/board/allwinner/sunxi.rst | 320 ++++++++++++++++++++++++++++++++++
>   doc/board/index.rst           |   1 +
>   3 files changed, 330 insertions(+)
>   create mode 100644 doc/board/allwinner/index.rst
>   create mode 100644 doc/board/allwinner/sunxi.rst
>
> diff --git a/doc/board/allwinner/index.rst b/doc/board/allwinner/index.r=
st
> new file mode 100644
> index 00000000000..7352ccd5c0a
> --- /dev/null
> +++ b/doc/board/allwinner/index.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Allwinner (sunxi) boards
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   sunxi
> diff --git a/doc/board/allwinner/sunxi.rst b/doc/board/allwinner/sunxi.r=
st
> new file mode 100644
> index 00000000000..ea0f1be10b2
> --- /dev/null
> +++ b/doc/board/allwinner/sunxi.rst
> @@ -0,0 +1,320 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +.. Copyright (C) 2021 Arm Ltd.
> +
> +Allwinner SoC based boards
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +For boards using an Allwinner ARM based SoC ("sunxi"), the U-Boot build
> +system generates a single integrated image file: ``u-boot-sunxi-with-sp=
l.bin.``
> +This file can be used on SD cards, eMMC devices, SPI flash and for the
> +USB-OTG based boot method (FEL). To build this file:
> +
> +* For 64-bit SoCs, build Trusted Firmware (TF-A, formerly known as ATF)=
 first,
> +  you will need its ``bl31.bin``. See below for more details.
> +* Optionally on 64-bit SoCs, build the `crust`_ management processor fi=
rmware,
> +  you will need its ``scp.bin``. See below for more details.
> +* Build U-Boot::
> +
> +  $ export BL31=3D/path/to/bl31.bin		# required for 64-bit SoCs
> +  $ export SCP=3D/path/to/scp.bin			# optional for some 64-bit SoCs
> +  $ make <yourboardname>_defconfig
> +  $ make
> +* Transfer to an (micro)SD card (see below for more details)::
> +
> +  $ sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdX bs=3D8k seek=
=3D1
> +* Boot and enjoy!
> +
> +.. note::
> +  The traditional SD card location the Allwinner BootROM loads from is =
8KB
> +  (sector 16). This works fine with the old MBR partitioning scheme, wh=
ich most
> +  SD cards come formatted with. However this is in the middle of a pote=
ntial
> +  GPT partition table, which will become invalid in this step. Newer So=
Cs
> +  (starting with the H3 from late 2014) also support booting from 128KB=
, which
> +  is beyond even a GPT and thus a safer location.
> +

I will remove this duplicate blank line when merging.

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> +
> +For more details, and alternative boot locations or installations, see =
below.
> +
> +Building Arm Trusted Firmware (TF-A)
> +------------------------------------
> +Boards using a 64-bit Soc (A64, H5, H6, H616, R329) require the BL31 st=
age of
> +the `Arm Trusted Firmware-A`_ firmware. This provides the reference
> +implementation of secure software for Armv8-A, offering PSCI and SMCCC
> +services. Allwinner support is fully mainlined. To build bl31.bin::
> +
> +  $ git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-a.g=
it
> +  $ cd trusted-firmware-a
> +  $ make CROSS_COMPILE=3Daarch64-linux-gnu- PLAT=3Dsun50i_a64 DEBUG=3D1
> +  $ export BL31=3D$(pwd)/build/sun50i_a64/debug/bl31.bin
> +
> +The target platform (``PLAT=3D``) for A64 and H5 SoCs is sun50i_a64, fo=
r the H6
> +sun50i_h6, for the H616 sun50i_h616, and for the R329 sun50i_r329. Use:=
:
> +
> +  $ find plat/allwinner -name platform.mk
> +
> +to find all supported platforms. TF-A's `docs/plat/allwinner.rst`_ cont=
ains
> +more information and lists some build options.
> +
> +Building the Crust management processor firmware
> +------------------------------------------------
> +For some SoCs and boards, the integrated OpenRISC management controller=
 can
> +be used to provide power management services, foremost suspend to RAM.
> +There is a community supported Open Source implementation called `crust=
`_,
> +which runs on most SoCs featuring a management controller.
> +
> +This firmware part is optional, setting the SCP environment variable to
> +/dev/null avoids the warning message when building without one.
> +
> +To build crust's scp.bin, you need an OpenRISC (or1k) cross compiler, t=
hen::
> +
> +  $ git clone https://github.com/crust-firmware/crust.git
> +  $ cd crust
> +  $ make <yourboard>_defconfig
> +  $ make CROSS_COMPILE=3Dor1k-none-elf- scp
> +  $ export SCP=3D$(pwd)/build/scp/scp.bin
> +
> +Find a list of supported board configurations in the `configs/`_ direct=
ory.
> +The `crust README`_ has more information about the building process, in=
cluding
> +information about where to get OpenRISC cross compilers.
> +
> +Building the U-Boot image
> +-------------------------
> +Find the U-Boot defconfig file for your board first. Those files live i=
n
> +the ``configs/`` directory; you can grep for the stub name of the devic=
etree
> +file, if you know that, or for the SoC name to find the right version::
> +
> +    $ git grep -l MACH_SUN8I_H3 configs
> +    $ git grep -l sun50i-h6-orangepi-3 configs
> +
> +The `linux-sunxi`_ wiki also lists the name of the defconfig file in th=
e
> +respective board page. Then use this defconfig file to create the .conf=
ig
> +file, and build the image::
> +
> +    $ make <yourboard>_defconfig
> +    $ make
> +
> +For 64-bit boards, this requires either the BL31 environment variable t=
o be
> +set (as shown above in the TF-A build example), or it to be supplied on=
 the
> +build command line::
> +
> +    $ make BL31=3D/src/tf-a.git/build/sun50i_h616/debug/bl31.bin
> +
> +The same applies to the (optional) SCP firmware.
> +
> +The file containing everything you need is called ``u-boot-sunxi-with-s=
pl.bin``,
> +you will find it in the root folder of your U-Boot (build) tree. Except=
 for
> +raw NAND flash devices this very same file can be used for any boot sou=
rce.
> +It will contain the SPL image, fitted with the proper signature recogni=
sed by
> +the BROM, and the required checksum. Also it will contain at least U-Bo=
ot
> +proper, either wrapped in the legacy U-Boot image format, or in a FIT i=
mage.
> +The board's devicetree is also included, either appended to the U-Boot =
proper
> +image, or contained in the FIT image. If required by the SoC, this FIT =
file will
> +also include the other firmware images.
> +
> +Installing U-Boot
> +-----------------
> +
> +Installing on a (micro-) SD card
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +All Allwinner SoCs will try to find a boot image at sector 16 (8KB) of
> +an SD card, connected to the first MMC controller. To transfer the gene=
rated
> +image to an SD card, from any Linux device (including the board itself)=
 with
> +an (micro-)SD card reader, type::
> +
> +    $ sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdX bs=3D1k seek=
=3D8
> +
> +``/dev/sdx`` needs to be replaced with the block device name of the SD =
card
> +reader. On some machines this could be ``/dev/mmcblkX``.
> +Newer SoCs (starting from the H3 from 2014, and including all ARM64 SoC=
s),
> +also look at sector 256 (128KB) for the signature (after having checked=
 the
> +8KB location). Installing the firmware there has the advantage of not
> +overlapping with a GPT partition table. Simply replace the "``seek=3D8`=
`" above
> +with "``seek=3D128``".
> +
> +You can also use an existing (mainline) U-Boot to write to the SD card.=
 Load
> +the generated U-Boot image somewhere into DRAM (via ``ext4load``, ``fat=
load``,
> +or ``tftpboot``), then write to MMC device 0::
> +
> +    =3D> fatload mmc 0:1 $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    =3D> mmc dev 0
> +    =3D> mmc write $kernel_addr_r 0x10 0x7f0
> +
> +To use the alternative boot location on newer SoCs::
> +
> +    =3D> mmc write $kernel_addr_r 0x100 0x700
> +
> +Installing on eMMC (on-board flash memory)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +Some boards have a soldered eMMC chip, some other boards have an eMMC s=
ocket
> +to receive an optional eMMC module. U-Boot can be installed to those ch=
ips,
> +to boot without an SD card inserted. The Boot-ROM can boot either from =
the
> +regular user data partition, or from one of the separate eMMC boot part=
itions.
> +U-Boot can be installed either from a running Linux instance on the dev=
ice,
> +from a running (mainline) U-Boot, or via an adapter for the (removable)
> +eMMC module.
> +
> +Installing on an eMMC user data partition from Linux
> +````````````````````````````````````````````````````
> +If you have a running Linux instance on the device, and have somehow co=
pied
> +over the image file to that device, you can write the image directly in=
to the
> +eMMC device from there.
> +Find the name of the block device file first, it is one of the
> +``/dev/mmcblk<X>`` devices. eMMC devices typically also list a
> +``/dev/mmcblk<X>boot0`` partition (see below), this helps you to tell i=
t apart
> +from the SD card device.
> +To install onto the user data partition::
> +
> +    $ sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/dev/mmcblkX bs=
=3D1k seek=3D8
> +
> +Similar to SD cards, the BROM in newer SoCs (H3 and above) also checks
> +sector 256 of an eMMC, so you can use "``seek=3D128``" as well. Having =
a GPT
> +on an eMMC device is much more likely than on an SD card, so you should
> +probably stick to the alternative location, or use one of the boot part=
itions.
> +
> +Installing on an eMMC boot partition from Linux
> +```````````````````````````````````````````````
> +In the following examples, ``/dev/mmcblkX`` needs to be replaced with t=
he block
> +device name of the eMMC device. The eMMC device can be recognised by al=
so
> +listing the boot partitions (``/dev/mmcblkXboot0``) in ``/proc/partitio=
ns``.
> +
> +To allow booting from one of the eMMC boot partitions, this one needs t=
o be
> +enabled first. This only needs to be done once, as this setting is
> +persistent, even though the boot partition can be disabled or changed a=
gain
> +any time later::
> +
> +    # apt-get install mmc-utils
> +    # mmc bootbus set single_hs x1 x4 /dev/mmcblkX
> +    # mmc bootpart enable 1 1 /dev/mmcblkX
> +
> +The first "1" in the last command points to the boot partition number t=
o be
> +used, typically devices offer two boot partitions.
> +
> +By default Linux disables write access to the boot partitions, to preve=
nt
> +accidental overwrites. You need to disable the write protection (until =
the
> +next reboot), then can write the U-Boot image to the *first* sector of =
the
> +selected boot partition::
> +
> +    # echo 0 > /sys/block/mmcblkXboot0/force_ro
> +    # dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/mmcblkXboot0 bs=3D1k
> +
> +Installing on an eMMC user data partition from U-Boot
> +`````````````````````````````````````````````````````
> +You can also write the generated image file to an SD card, boot the dev=
ice
> +from there, and burn the very same image to the eMMC device from U-Boot=
.
> +The following commands copy the image from the SD card to the eMMC devi=
ce::
> +
> +    =3D> mmc dev 0
> +    =3D> mmc read $kernel_addr_r 0x10 0x7f0
> +    =3D> mmc dev 1
> +    =3D> mmc write $kernel_addr_r 0x10 0x7f0
> +
> +You can also copy an image from the 8K offset of an SD card to the 128K
> +offset of the eMMC (or any combination), just change the "``0x10 0x7f0`=
`" above
> +to "``0x100 0x700``", respectively. Of course the image file can be loa=
ded via
> +any other loading method, including ``fatload``, ``ext4load``, ``tftpbo=
ot``.
> +
> +Installing on an eMMC boot partition from U-Boot
> +````````````````````````````````````````````````
> +The selected eMMC boot partition needs to be initially enabled first (s=
ame
> +as in Linux above), you can do this from U-Boot with::
> +
> +    =3D> mmc dev 1
> +    =3D> mmc bootbus 1 1 0 0
> +    =3D> mmc partconf 1 1 1 1
> +
> +The first "1" in both commands denotes the MMC device number. The secon=
d "1"
> +in the partconf command sets the required ``BOOT_ACK`` option, the last=
 two "1"s
> +selects the active boot partition and the target for the next data acce=
ss,
> +respectively. So for the next "``mmc write``" command to address one of=
 the boot
> +partitions, the last number must either be "1" or "2", "0" would switch=
 (back)
> +to the normal user data partition.
> +
> +Then load the ``u-boot-sunxi-with-spl.bin`` image file into DRAM, eithe=
r by
> +reading directly from an SD card or eMMC user data partition, or from a
> +file system or TFTP (see above), and transfer it to the boot partition:=
:
> +
> +    =3D> tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    =3D> mmc write $kernel_addr_r 0 0x7f0
> +
> +After that the device should boot from the selected boot partition, whi=
ch takes
> +precedence over booting from the user data partition.
> +
> +Installing on SPI flash
> +^^^^^^^^^^^^^^^^^^^^^^^
> +Some devices have a SPI NOR flash chip soldered on the board. If it is
> +connected to the SPI0 pins on PortC, the BROM can also boot from there.
> +Typically the SPI flash has the lowest boot priority, so SD card and eM=
MC
> +devices will be considered first.
> +
> +Installing on SPI flash from Linux
> +``````````````````````````````````
> +If the devicetree enables and describes the SPI flash device, you can a=
ccess
> +the SPI flash content from Linux, using the `MTD utils`_::
> +
> +    # apt-get install mtd-utils
> +    # mtdinfo
> +    # mtd_debug erase /dev/mtdX 0 0xf0000
> +    # mtd_debug write /dev/mtdX 0 0xf0000 u-boot-sunxi-with-spl.bin
> +
> +``/dev/mtdX`` needs to be replaced with the respective device name, as =
listed
> +in the output of ``mtdinfo``.
> +
> +Installing on SPI flash from U-Boot
> +```````````````````````````````````
> +If SPI flash driver and command support (``CONFIG_CMD_SF``) is enabled =
in the
> +U-Boot configuration, the image file can be installed via U-Boot as wel=
l::
> +
> +    =3D> tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> +    =3D> sf probe
> +    =3D> sf erase 0 +0xf0000
> +    =3D> sf write $kernel_addr_r 0 $filesize
> +
> +Installing on SPI flash via USB in FEL mode
> +```````````````````````````````````````````
> +If the device is in FEL mode (see below), the SPI flash can also be wri=
tten to
> +with the sunxi-fel utility, via an USB(-OTG) cable from any USB host ma=
chine::
> +
> +    $ sunxi-fel spiflash-write 0 u-boot-sunxi-with-spl.bin
> +
> +Booting via the USB(-OTG) FEL mode
> +----------------------------------
> +If none of the boot locations checked by the BROM contains a medium or =
valid
> +signature, the BROM will enter the so-called FEL mode, in which it will
> +listen to commands from a host on the SoC's USB-OTG interface. Those co=
mmands
> +allow to read from and write to arbitrary memory locations, also to sta=
rt
> +execution at any address, which allows to bootstrap a board solely via =
an
> +USB cable. Some boards feature a "FEL" or "U-Boot" button, which forces
> +FEL mode despite a valid boot location being present. The same can be a=
chieved
> +via a `magic binary`_ on an SD card, which allows to enter FEL mode on =
any
> +board.
> +
> +To use FEL booting, let the board enter FEL mode, via any of the mentio=
ned
> +methods (no boot media, FEL button, SD card with FEL binary), then conn=
ect
> +a USB cable to the board's USB OTG port. Some boards (Pine64, TV boxes)=
 don't
> +have a separate OTG port. In this case mostly one of the USB-A ports is
> +connected to USB0, and can be used via a non-standard USB-A to USB-A ca=
ble.
> +
> +Typically there is no on-board indication of FEL mode, other than a new=
 USB
> +device appearing on the connected host computer. The USB vendor/device =
ID
> +is 1f3a:efe8. Mostly this will identify as "sunxi SoC OTG connector in
> +FEL/flashing mode", but older distributions might still report "Onda
> +(unverified) V972 tablet in flashing mode".
> +
> +The `sunxi_fel`_ tool implements the proprietary BROM protocol, and all=
ows to
> +bootstrap U-Boot by just providing our venerable u-boot-sunxi-with-spl.=
bin::
> +
> +    $ sudo apt-get install sunxi-tools
> +    $ sunxi-fel uboot u-boot-sunxi-with-spl.bin
> +
> +Additional binaries like a kernel, an initial ramdisk or a boot script,=
 can
> +also be uploaded via FEL, check the Wiki's `FEL page`_ for more details=
.
> +
> +.. _`Arm Trusted Firmware-A`:  https://www.trustedfirmware.org/projects=
/tf-a/
> +.. _`docs/plat/allwinner.rst`: https://trustedfirmware-a.readthedocs.io=
/en/latest/plat/allwinner.html
> +.. _`crust`: https://github.com/crust-firmware/crust
> +.. _`configs/`: https://github.com/crust-firmware/crust/tree/master/con=
figs
> +.. _`crust README`: https://github.com/crust-firmware/crust/blob/master=
/README.md#building-the-firmware
> +.. _`linux-sunxi`: https://linux-sunxi.org
> +.. _`MTD utils`: http://www.linux-mtd.infradead.org/
> +.. _`magic binary`: https://github.com/linux-sunxi/sunxi-tools/raw/mast=
er/bin/fel-sdboot.sunxi
> +.. _`sunxi_fel`: https://github.com/linux-sunxi/sunxi-tools
> +.. _`FEL page`: https://linux-sunxi.org/FEL/USBBoot
> diff --git a/doc/board/index.rst b/doc/board/index.rst
> index 74ea33e0816..4555af5f119 100644
> --- a/doc/board/index.rst
> +++ b/doc/board/index.rst
> @@ -9,6 +9,7 @@ Board-specific doc
>      actions/index
>      advantech/index
>      AndesTech/index
> +   allwinner/index
>      amlogic/index
>      apple/index
>      atmel/index

