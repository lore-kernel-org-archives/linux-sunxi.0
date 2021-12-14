Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E4268
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 17:17:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso16751169wml.1
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GFFAoeq10p/BewcIsMdur10WgktKHb2G3jsHBJTwFoo=;
        b=Y+QzygzCFcDl3czEHysoNSnwNKLhDghCzEKNyCk4U/nNlMQl23eHVWVc8tLX6sJ9r6
         4Oha6CIEwtObw8hekff+oTDQ/g3s3XtPRKlH7yzG1rG6c3sdqZTmEXS4S0bAFbXC7FPr
         9XmY2vALrBrk10cOo5mdsvhnzzEGycMM5RHZKhw7I7t2uX1WOMkR4ppoq17Ngq4/hMZN
         OSi7brR7IFk+KliQdF5RWhrSpxefZK39Ps87OBiwzCs+Gh/Xxkkz+lsezcyKa2zl+xxU
         674Nd4m0WMC8v6TItRHPxf28C+R/0WskZWn/en1/GvNAX1EyhstXRtc36mj2oz+S0F6L
         R3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GFFAoeq10p/BewcIsMdur10WgktKHb2G3jsHBJTwFoo=;
        b=vR+Azs54Kz/amkaZlgAoEFz1qYyzaOizqun4wbGK1domiWEyS0B6cpfe2zwKk+bT4L
         vOdKfVDzIsCpMqwA1PpYgfgcvAH8Ry3GuA4jWAdJnHddV5tYgjVAKSKFFlO/r5BGv9g6
         pcEQqP0tkN8dSblk+aN9jv/JlnqOTBvZW4YeNDULJX8PT3DZGTpKAKmVwZy9Ou68WEch
         dWKxml6d9lnipGyh52JjmbOfvikAJPgpBQSiCaIeIC1zjUK2wUA8GcZ0N1lducBbA55T
         7v7Z8wisQ7FDWbRvoaL7bsvnouN75KW1CznVW9VtPG1ci1j1yWQ5yS5PufrKdm4oYAZr
         F+/g==
X-Gm-Message-State: AOAM532p3S2sa6RvoeyLlW1Sljamcx8bwjTFnV9Y9a6gatzisZJJ4r/a
	qr6FeJh78v3McbLuHt179fE=
X-Google-Smtp-Source: ABdhPJzkNOdSzpXbFJ2vPaV7ZXxN3u3nfQxI1K4UQLRHCA7flIW7EQMYbldJxjnGbzvWlc63BFd6XA==
X-Received: by 2002:a05:600c:3846:: with SMTP id s6mr221447wmr.55.1639502260561;
        Tue, 14 Dec 2021 09:17:40 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id e18sm396535wrs.48.2021.12.14.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 09:17:39 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] sunxi: add board documentation
Date: Tue, 14 Dec 2021 18:17:38 +0100
Message-ID: <4672090.GXAFRqVoOG@kista>
In-Reply-To: <20211214010758.37ea91b4@slackpad.fritz.box>
References: <20211213010322.10726-1-andre.przywara@arm.com> <3402428.iIbC2pHGDl@kista> <20211214010758.37ea91b4@slackpad.fritz.box>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 14. december 2021 ob 02:07:58 CET je Andre Przywara napisal(a):
> On Mon, 13 Dec 2021 18:20:37 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> thanks for having a look!
>=20
> > Dne ponedeljek, 13. december 2021 ob 02:03:22 CET je Andre Przywara=20
> > napisal(a):
> > > Add some long overdue instructions for building and installing U-Boot=
 on
> > > Allwinner SoC based boards.
> > > This describes the building process, including TF-A and crust, plus
> > > installation to SD card, eMMC and SPI flash, both from Linux and U-Bo=
ot
> > > itself. Also describe FEL booting.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > > Hi,
> > >=20
> > > please have a look whether this makes sense. Feel free to just try  =
=20
> > something,
> > > and point out ambiguities or missing bits. For missing topics, please
> > > send a follow-up patch ;-) =20
> >=20
> > This documentation seems to include all of board/sunxi/README.sunxi64 a=
nd=20
> > README.nand. I think it would make sense to remove those files. If any =
file=20
gets=20
> > out of sync for any reason, it would be very confusing for end user.
>=20
> Indeed, I think README.sunxi64 is redundant now.
> I didn't look at README.nand too closely, but since I don't even mention
> NAND, I don't think it can be removed just yet. I guess I just convert
> it to RST and move it into this directory.
>=20
> > I would also remove all non-essential command parameters, so all comman=
ds=20
are=20
> > as simple as possible. Power users will know about them anyway and non-
skilled=20
> > users might perceive that it's harder that it really is. I have in mind=
 "-
j5 -
> > s" for make, "-v -p" for sunxi-fel
>=20
> I see, makes sense.
>=20
> > and DEBUG=3D1 for TF-A (maybe I missed some=20
> > places). Actually, DEBUG=3D1 could be mentioned afterwards as=20
troubleshooting=20
> > step. In my experience, stable version of TF-A was never source of boot=
=20
issues=20
> > nor it provided any useful information for debugging anything else.
>=20
> Well, I'd tend to keep DEBUG=3D1 enabled, this lists the regulators
> enabled, which helps debugging. Also in the past DEBUG=3D0 was very
> silent, which wasn't helpful to verify that TF-A actually started.

I patched out enabling regulators in TF-A, we already discussed this in the=
=20
past.

>=20
> Do you typically build or recommend DEBUG=3D0?


I set DEBUG=3D1 only when I actually want to debug this part of boot proces=
s,=20
which is very rarely. I don't remember that I would help anyone with buildi=
ng=20
TF-A, so I don't make recommendations in either direction. For LibreELEC, w=
e=20
build it with DEBUG=3D0, unless debug build of ATF package was requested. A=
gain,=20
basically never. Release images are build with DEBUG=3D0. Note that based o=
n my=20
experience, many LibreELEC users don't actually own serial adapter, so it=20
doesn't really matter what U-Boot and TF-A print out. Fortunatelly, boot=20
issues in LE are very rare these days (I don't remember last time someone=20
reported it).

Best regards,
Jernej

>=20
> > Some comments bellow.
> >=20
> > >=20
> > > Also this is quite long, shall this be split up in two (or more) file=
s?
> > >=20
> > > This is what rst.ninjs.org made of it, if you prefer to read it=20
formatted:
> > > https://paste.c-net.org/PleasantNeedy
> > >=20
> > > Cheers,
> > > Andre
> > >=20
> > >  doc/board/allwinner/index.rst |   9 +
> > >  doc/board/allwinner/sunxi.rst | 304 ++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 313 insertions(+)
> > >  create mode 100644 doc/board/allwinner/index.rst
> > >  create mode 100644 doc/board/allwinner/sunxi.rst
> > >=20
> > > diff --git a/doc/board/allwinner/index.rst b/doc/board/allwinner/
index.rst
> > > new file mode 100644
> > > index 00000000000..7352ccd5c0a
> > > --- /dev/null
> > > +++ b/doc/board/allwinner/index.rst
> > > @@ -0,0 +1,9 @@
> > > +.. SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +Allwinner (sunxi) boards
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +.. toctree::
> > > +   :maxdepth: 2
> > > +
> > > +   sunxi
> > > diff --git a/doc/board/allwinner/sunxi.rst b/doc/board/allwinner/
sunxi.rst
> > > new file mode 100644
> > > index 00000000000..693eb32e168
> > > --- /dev/null
> > > +++ b/doc/board/allwinner/sunxi.rst
> > > @@ -0,0 +1,304 @@
> > > +.. SPDX-License-Identifier: GPL-2.0+
> > > +.. Copyright (C) 2021 Arm Ltd.
> > > +
> > > +Allwinner SoC based boards
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +For boards using an Allwinner ARM based SoC ("sunxi"), the U-Boot bu=
ild
> > > +system generates a single integrated image file: ``u-boot-sunxi-with=
=2D =20
> > spl.bin.``
> > > +This file can be used on SD cards, eMMC devices, SPI flash and for t=
he
> > > +USB-OTG based boot method (FEL). To build this file:
> > > +
> > > +* For 64-bit SoCs, build Trusted Firmware (TF-A, formerly known as A=
TF)  =20
> > first,
> > > +  you will need its ``bl31.bin``. See below for more details.
> > > +* Optionally on 64-bit SoCs, build the crust management processor=20
firmware.
> > > +* Build U-Boot::
> > > +
> > > +  $ export BL31=3D/path/to/bl31.bin		# required for=20
64-bit SoCs
> > > +  $ export SCP=3D/src/crust/build/scp/scp.bin	# optional for some 64-
bit =20
> >  SoCs
> >=20
> > NIT: I guess path for SCP could be in same form, at least first part?
>=20
> Yeah, makes sense.
>=20
> > > +  $ make <yourboardname>_defconfig
> > > +  $ make -j5 -s
> > > +* Transfer to an uSD card (see below for more details)::
> > > +
> > > +  $ dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdX bs=3D8k seek=3D1=
 =20
> >=20
> > Most, if not all, distros require root for above command, so $ -> #? I =
see=20
> > that you used # below. Alternative would be to prepend command with sud=
o,=20
> > which is imo more beginners friendly.
>=20
> Ah, good catch!
>=20
> > > +* Boot and enjoy!
> > > +
> > > +For more details, and alternative boot locations or installations, s=
ee  =20
> > below.
> > > +
> > > +Building Arm Trusted Firmware (TF-A)
> > > +------------------------------------
> > > +Boards using a 64-bit Soc (A64, H5, H6, H616, R329) require the BL31=
=20
stage  =20
> > of
> > > +the `Arm Trusted Firmware-A`_ firmware. This provides the reference
> > > +implementation of secure software for Armv8-A, offering PSCI and SMC=
CC
> > > +services. Allwinner support is fully mainlined. To build bl31.bin::
> > > +
> > > +  $ git clone https://git.trustedfirmware.org/TF-A/trusted-firmware-=
a.git
> > > +  $ cd trusted-firmware-a
> > > +  $ make CROSS_COMPILE=3Daarch64-linux-gnu- PLAT=3Dsun50i_a64 DEBUG=
=3D1
> > > +  $ export BL31=3D$(pwd)/build/sun50i_a64/debug/bl31.bin
> > > +
> > > +The target platform (``PLAT=3D``) for A64 and H5 SoCs is sun50i_a64,=
 for=20
the  =20
> > H6
> > > +sun50i_h6, for the H616 sun50i_h616, and for the R329 sun50i_r329.=20
Use::
> > > +
> > > +  $ find plat/allwinner -name platform.mk
> > > +
> > > +to find all supported platforms. `docs/plat/allwinner.rst`_ contains=
=20
more
> > > +information and lists some build options.
> > > +
> > > +Building the Crust management processor firmware
> > > +------------------------------------------------
> > > +For some SoCs and boards, the integrated OpenRISC management control=
ler=20
can
> > > +be used to provide power management services, foremost suspend to RA=
M.
> > > +There is a community supported Open Source implementation called=20
`crust`_,
> > > +which runs on most SoCs featuring a management controller.
> > > +
> > > +This firmware part is optional, setting the SCP environment variable=
 to
> > > +/dev/null avoids the warning message when building without one.
> > > +
> > > +To build crust's scp.bin, you need an OpenRISC (or1k) cross compiler=
,  =20
> > then::
> > > +
> > > +  $ git clone https://github.com/crust-firmware/crust.git
> > > +  $ cd crust
> > > +  $ make <yourboard>_defconfig
> > > +  $ make CROSS_COMPILE=3Dor1k-none-elf- scp =20
> >=20
> > I guess it would be good to point out that compiler prefix may not be t=
he=20
same=20
> > on all distros. For example, Arch packages this compiler and proper pre=
fix=20
> > there is or1k-elf- which also works just fine.
>=20
> I feel I shouldn't spend too much time on this, instead just point to
> crust's README.
>=20
> Thanks,
> Andre
>=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > > +  $ export SCP=3D$(pwd)/build/scp/scp.bin
> > > +
> > > +Find a list of supported board configurations in the `configs/`_=20
directory.
> > > +
> > > +Building the U-Boot image
> > > +-------------------------
> > > +Find the U-Boot defconfig file for your board first. Those files liv=
e in
> > > +the ``configs/`` directory; you can grep for the stub name of the=20
devicetree
> > > +file, if you know that, or for the SoC name to find the right versio=
n::
> > > +
> > > +    $ git grep -l MACH_SUN8I_H3 configs
> > > +    $ git grep -l sun50i-h6-orangepi-3 configs
> > > +
> > > +The `linux-sunxi`_ wiki also lists the name of the defconfig file in=
 the
> > > +respective board page. Then use this defconfig file to create the .c=
onfig
> > > +file, and build the image::
> > > +
> > > +    $ make <yourboard>_defconfig
> > > +    $ make -j5
> > > +
> > > +For 64-bit boards, this requires either the BL31 environment variabl=
e=20
to be
> > > +set (as shown above in the TF-A build example), or it to be supplied=
 on=20
the
> > > +build command line::
> > > +
> > > +    $ make BL31=3D/src/tf-a.git/build/sun50i_h616/debug/bl31.bin -j5=
 -s
> > > +
> > > +The same applies to the (optional) SCP firmware.
> > > +
> > > +The file containing everything you need is called ``u-boot-sunxi-wit=
h- =20
> > spl.bin``,
> > > +you will find it in the root folder of your U-Boot (build) tree. Exc=
ept=20
for
> > > +raw NAND flash devices this very same file can be used for any boot=
=20
source.
> > > +It will contain the SPL image, fitted with the proper signature=20
recognised  =20
> > by
> > > +the BROM, and the required checksum. Also it will contain at least U-
Boot
> > > +proper, either wrapped in the legacy U-Boot image format, or in a FI=
T  =20
> > image.
> > > +The board's devicetree is also included, either appended to the U-Bo=
ot  =20
> > proper
> > > +image, or contained in the FIT image. If required by the SoC, this F=
IT=20
file  =20
> > will
> > > +also include the other firmware images.
> > > +
> > > +Installing U-Boot
> > > +-----------------
> > > +
> > > +Installing on a (micro-) SD card
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +All Allwinner SoCs will try to find a boot image at sector 16 (8KB) =
of
> > > +an SD card, connected to the first MMC controller. To transfer the=20
generated
> > > +image to an SD card, from any Linux device (including the board itse=
lf)  =20
> > with
> > > +an (micro-)SD card reader, type::
> > > +
> > > +    # dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdX bs=3D1k seek=
=3D8
> > > +
> > > +``/dev/sdx`` needs to be replaced with the block device name of the =
SD=20
card
> > > +reader. On some machines this could be ``/dev/mmcblkX``.
> > > +Newer SoCs (starting from H3), also look at sector 256 (128KB) for t=
he
> > > +signature (after having checked the 8KB location). Installing the=20
firmware
> > > +there has the advantage of not overlapping with a GPT partition tabl=
e.  =20
> > Simply
> > > +replace the "``seek=3D8``" above with "``seek=3D128``".
> > > +
> > > +You can also use an existing (mainline) U-Boot to write to the SD ca=
rd.  =20
> > Load
> > > +the generated U-Boot image somewhere into DRAM (via ``ext4load``,  =
=20
> > ``fatload``,
> > > +or ``tftpboot``), then write to MMC device 0::
> > > +
> > > +    =3D> fatload mmc 0:1 $kernel_addr_r u-boot-sunxi-with-spl.bin
> > > +    =3D> mmc dev 0
> > > +    =3D> mmc write $kernel_addr_r 0x10 0x7f0
> > > +
> > > +To use the alternative boot location on newer SoCs::
> > > +
> > > +    =3D> mmc write $kernel_addr_r 0x100 0x700
> > > +
> > > +Installing on eMMC (on-board flash memory)
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +Some boards have a soldered eMMC chip, some other boards have an eMM=
C  =20
> > socket
> > > +to receive an optional eMMC module. U-Boot can be installed to those=
=20
chips,
> > > +to boot without an SD card inserted. The Boot-ROM can boot either fr=
om=20
the
> > > +regular user data partition, or from one of the separate eMMC boot  =
=20
> > partitions.
> > > +U-Boot can be installed either from a running Linux instance on the=
=20
device,
> > > +from a running (mainline) U-Boot, or via an adapter for the (removab=
le)
> > > +eMMC module.
> > > +
> > > +Installing on an eMMC user data partition from Linux
> > > +````````````````````````````````````````````````````
> > > +If you have a running Linux instance on the device, and have somehow=
=20
copied
> > > +over the image file to that device, you can write the image directly=
=20
into  =20
> > the
> > > +eMMC device from there.
> > > +Find the name of the block device file first, it is one of the
> > > +``/dev/mmcblk<X>`` devices. eMMC devices typically also list a
> > > +``/dev/mmcblk<X>boot0`` partition (see below), this helps you to tel=
l=20
it  =20
> > apart
> > > +from the SD card device.
> > > +To install onto the user data partition::
> > > +
> > > +    # dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/dev/mmcblkX bs=3D1=
k seek=3D8
> > > +
> > > +Similar to SD cards, the BROM in newer SoCs (H3 and above) also chec=
ks
> > > +sector 256 of an eMMC, so you can use "``seek=3D128``" as well.
> > > +
> > > +Installing on an eMMC boot partition from Linux
> > > +```````````````````````````````````````````````
> > > +In the following examples, ``/dev/mmcblkX`` needs to be replaced wit=
h=20
the  =20
> > block
> > > +device name of the eMMC device. The eMMC device can be recognised by=
=20
also
> > > +listing the boot partitions (``/dev/mmcblkXboot0``) in ``/proc/ =20
> > partitions``.
> > > +
> > > +To allow booting from one of the eMMC boot partitions, this one need=
s=20
to be
> > > +enabled first. This only needs to be done once, as this setting is
> > > +persistent, even though the boot partition can be disabled or change=
d=20
again
> > > +any time later::
> > > +
> > > +    # apt-get install mmc-utils
> > > +    # mmc bootbus set single_hs x1 x4 /dev/mmcblkX
> > > +    # mmc bootpart enable 1 1 /dev/mmcblkX
> > > +
> > > +The first "1" in the last command points to the boot partition numbe=
r to=20
be
> > > +used, typically devices offer two boot partitions.
> > > +
> > > +By default Linux disables write access to the boot partitions, to=20
prevent
> > > +accidental overwrites. You need to disable the write protection (unt=
il=20
the
> > > +next reboot), then can write the U-Boot image to the *first* sector =
of=20
the
> > > +selected boot partition::
> > > +
> > > +    # echo 0 > /sys/block/mmcblkXboot0/force_ro
> > > +    # dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/mmcblkXboot0 bs=3D=
1k
> > > +
> > > +Installing on an eMMC user data partition from U-Boot
> > > +`````````````````````````````````````````````````````
> > > +You can also write the generated image file to an SD card, boot the=
=20
device
> > > +from there, and burn the very same image to the eMMC device from U-
Boot.
> > > +The following commands copy the image from the SD card to the eMMC=20
device::
> > > +
> > > +    =3D> mmc dev 0
> > > +    =3D> mmc read $kernel_addr_r 0x10 0x7f0
> > > +    =3D> mmc dev 1
> > > +    =3D> mmc write $kernel_addr_r 0x10 0x7f0
> > > +
> > > +You can also copy an image from the 8K offset of an SD card to the 1=
28K
> > > +offset of the eMMC (or any combination), just change the "``0x10=20
0x7f0``"  =20
> > above
> > > +to "``0x100 0x700``", respectively. Of course the image file can be=
=20
loaded  =20
> > via
> > > +any other loading method, including ``fatload``, ``ext4load``,  =20
> > ``tftpboot``.
> > > +
> > > +Installing on an eMMC boot partition from U-Boot
> > > +````````````````````````````````````````````````
> > > +The selected eMMC boot partition needs to be initially enabled first=
=20
(same
> > > +as in Linux above), you can do this from U-Boot with::
> > > +
> > > +    =3D> mmc dev 1
> > > +    =3D> mmc bootbus 1 1 0 0
> > > +    =3D> mmc partconf 1 1 1 1
> > > +
> > > +The first "1" in both commands denotes the MMC device number. The se=
cond=20
"1"
> > > +in the partconf command sets the required ``BOOT_ACK`` option, the l=
ast=20
two  =20
> > "1"s
> > > +selects the active boot partition and the target for the next data=20
access,
> > > +respectively. So for the next "``mmc write``" command to address one=
 of=20
the  =20
> > boot
> > > +partitions, the last number must either be "1" or "2", "0" would swi=
tch  =20
> > (back)
> > > +to the normal user data partition.
> > > +
> > > +Then load the ``u-boot-sunxi-with-spl.bin`` image file into DRAM, ei=
ther=20
by
> > > +reading directly from an SD card or eMMC user data partition, or fro=
m a
> > > +file system or TFTP (see above), and transfer it to the boot partiti=
on::
> > > +
> > > +    =3D> tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> > > +    =3D> mmc write $kernel_addr_r 0 0x7f0
> > > +
> > > +After that the device should boot from the selected boot partition,=
=20
which  =20
> > takes
> > > +precedence over booting from the user data partition.
> > > +
> > > +Installing on SPI flash
> > > +^^^^^^^^^^^^^^^^^^^^^^^
> > > +Some devices have a SPI NOR flash chip soldered on the board. If it =
is
> > > +connected to the SPI0 pins on PortC, the BROM can also boot from the=
re.
> > > +Typically the SPI flash has the lowest boot priority, so SD card and=
=20
eMMC
> > > +devices will be considered first.
> > > +
> > > +Installing on SPI flash from Linux
> > > +``````````````````````````````````
> > > +If the devicetree enables and describes the SPI flash device, you ca=
n=20
access
> > > +the SPI flash content from Linux, using the `MTD utils`_::
> > > +
> > > +    # apt-get install mtd-utils
> > > +    # mtdinfo
> > > +    # mtd_debug erase /dev/mtdX 0 0xf0000
> > > +    # mtd_debug write /dev/mtdX 0 0xf0000 u-boot-sunxi-with-spl.bin
> > > +
> > > +``/dev/mtdX`` needs to be replaced with the respective device name, =
as  =20
> > listed
> > > +in the output of ``mtdinfo``.
> > > +
> > > +Installing on SPI flash from U-Boot
> > > +```````````````````````````````````
> > > +If SPI flash driver and command support (``CONFIG_CMD_SF``) is enabl=
ed=20
in  =20
> > the
> > > +U-Boot configuration, the image file can be installed via U-Boot as=
=20
well::
> > > +
> > > +    =3D> tftpboot $kernel_addr_r u-boot-sunxi-with-spl.bin
> > > +    =3D> sf probe
> > > +    =3D> sf erase 0 +0xf0000
> > > +    =3D> sf write $kernel_addr_r 0 $filesize
> > > +
> > > +Installing on SPI flash via USB in FEL mode
> > > +```````````````````````````````````````````
> > > +If the device is in FEL mode (see below), the SPI flash can also be=
=20
filled
> > > +with the sunxi-fel utility, via an USB(-OTG) cable from any USB host=
  =20
> > machine::
> > > +
> > > +    $ sunxi-fel -v -p spiflash-write 0 u-boot-sunxi-with-spl.bin
> > > +
> > > +Booting via the USB(-OTG) FEL mode
> > > +----------------------------------
> > > +If none of the boot locations checked by the BROM contain a medium o=
r=20
valid
> > > +signature, the BROM will enter the so-called FEL mode, in which it w=
ill
> > > +listen to commands from a host on the SoC's USB-OTG interface. Those=
  =20
> > commands
> > > +allow to read from and write to arbitrary memory locations, also to=
=20
start
> > > +execution at any address, which allows to bootstrap a board solely v=
ia=20
an
> > > +USB cable. Some boards feature a "FEL" or "U-Boot" button, which for=
ces
> > > +FEL mode despite a valid boot location being present. The same can b=
e  =20
> > achieved
> > > +via a `magic binary`_ on an SD card, which allows to enter FEL mode =
on=20
any
> > > +board.
> > > +
> > > +To use FEL booting, let the board enter FEL mode, via any of the=20
mentioned
> > > +methods (no boot media, FEL button, SD card with FEL binary), then=20
connect
> > > +a USB cable to the board's USB OTG port. Some boards (Pine64, TV box=
es)  =20
> > don't
> > > +have a separate OTG port. In this case mostly one of the USB-A ports=
 is
> > > +connected to USB0, and can be used via a non-standard USB-A to USB-A=
=20
cable.
> > > +
> > > +Typically there is no on-board indication of FEL mode, other than a =
new=20
USB
> > > +device appearing on the connected host computer. The USB vendor/devi=
ce=20
ID
> > > +is 1f3a:efe8. Mostly this will identify as "sunxi SoC OTG connector =
in
> > > +FEL/flashing mode", but older distributions might still report "Onda
> > > +(unverified) V972 tablet in flashing mode".
> > > +
> > > +The `sunxi_fel`_ tool implements the proprietary BROM protocol, and=
=20
allows  =20
> > to
> > > +bootstrap U-Boot by just providing our venerable u-boot-sunxi-with- =
=20
> > spl.bin::
> > > +
> > > +    $ sudo apt-get install sunxi-tools
> > > +    $ sunxi-fel -v -p uboot u-boot-sunxi-with-spl.bin
> > > +
> > > +Additional binaries like a kernel, an initial ramdisk or a boot scri=
pt,=20
can
> > > +also be uploaded via FEL, check the Wiki's `FEL page`_ for more=20
details.
> > > +
> > > +.. _`Arm Trusted Firmware-A`:  https://www.trustedfirmware.org/proje=
cts/
tf-a/
> > > +.. _`docs/plat/allwinner.rst`: https://trustedfirmware-a.readthedocs=
=2Eio/
en/ =20
> > latest/plat/allwinner.html
> > > +.. _`crust`: https://github.com/crust-firmware/crust
> > > +.. _`configs/`: https://github.com/crust-firmware/crust/tree/master/
configs
> > > +.. _`linux-sunxi`: https://linux-sunxi.org
> > > +.. _`MTD utils`: http://www.linux-mtd.infradead.org/
> > > +.. _`magic binary`: https://github.com/linux-sunxi/sunxi-tools/raw/
master/ =20
> > bin/fel-sdboot.sunxi
> > > +.. _`sunxi_fel`: https://github.com/linux-sunxi/sunxi-tools
> > > +.. _`FEL page`: https://linux-sunxi.org/FEL/USBBoot
> > > --=20
> > > 2.17.6
> > >=20
> > >  =20
> >=20
> >=20
> >=20
>=20
>=20


