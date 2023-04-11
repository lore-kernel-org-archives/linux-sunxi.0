Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62C02F21
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 22:16:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46B34D75;
	Tue, 11 Apr 2023 15:17:17 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1B373F6C4;
	Tue, 11 Apr 2023 15:16:25 -0700 (PDT)
Date: Tue, 11 Apr 2023 23:16:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland
 <samuel@sholland.org>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Mikhail
 Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] sunxi: remove support for boot0 header reservation
Message-ID: <20230411231600.27afdeea@slackpad.lan>
In-Reply-To: <4790687.GXAFRqVoOG@jernej-laptop>
References: <20230405142731.1246503-1-andre.przywara@arm.com>
	<20230405142731.1246503-2-andre.przywara@arm.com>
	<4790687.GXAFRqVoOG@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 08 Apr 2023 08:19:16 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sreda, 05. april 2023 ob 16:27:31 CEST je Andre Przywara napisal(a):
> > In the early days of the Allwinner A64 U-Boot support, we relied on a
> > vendor provided "boot0" binary to perform the DRAM initialisation. This
> > replaced the SPL, and required to equip the U-Boot (proper) binary with
> > a vendor specific header to be recognised as a valid boot0 payload.
> > Fortunately these days are long gone (we gained SPL and DRAM support in
> > early 2017!), and we never needed to use that hack on any later 64-bit
> > Allwinner SoC.
> >=20
> > Since this is highly obsolete by now, remove the Kconfig option and the
> > small pieces of "code" associated with it.
> >=20
> > Provide some comments about the purpose of the remaining boot0 code on
> > the way.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I think it's time to remove this code too.
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks! So I kept the "code" in for now, to appease Piotr, but
removed the symbols from the A64's defconfigs. I will propose that
removal then again at a later time.

Queued for sunxi/master.

Cheers,
Andre



>=20
> > ---
> >  arch/arm/include/asm/arch-sunxi/boot0.h | 18 +++++++++++-------
> >  arch/arm/mach-sunxi/Kconfig             |  9 ---------
> >  configs/a64-olinuxino-emmc_defconfig    |  1 -
> >  configs/a64-olinuxino_defconfig         |  1 -
> >  configs/amarula_a64_relic_defconfig     |  1 -
> >  configs/bananapi_m64_defconfig          |  1 -
> >  configs/nanopi_a64_defconfig            |  1 -
> >  configs/oceanic_5205_5inmfd_defconfig   |  1 -
> >  configs/orangepi_win_defconfig          |  1 -
> >  configs/pine64_plus_defconfig           |  1 -
> >  configs/sopine_baseboard_defconfig      |  1 -
> >  11 files changed, 11 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h
> > b/arch/arm/include/asm/arch-sunxi/boot0.h index 59ea75a96b5..1a396f78488
> > 100644
> > --- a/arch/arm/include/asm/arch-sunxi/boot0.h
> > +++ b/arch/arm/include/asm/arch-sunxi/boot0.h
> > @@ -1,13 +1,17 @@
> >  /* SPDX-License-Identifier: GPL-2.0+ */
> >  /*
> > - * Configuration settings for the Allwinner A64 (sun50i) CPU
> > + * Very early code for Allwinner 64-bit CPUs.
> > + *
> > + * The BROM runs entirely in AArch32 state, so the SPL is entered using
> > this + * ISA. Depending on the rest of the firmware stack, this may als=
o be
> > true + * for U-Boot proper.
> > + * Provide the "RMR reset into 64-bit" sequence, in AArch32 machine
> > language, + * so that we can have all of U-Boot in AArch64. The first
> > instruction is + * chosen so that if the CPU is already using AArch64, =
it
> > will skip the code + * and jump straight to the reset vector.
> >   */
> >=20
> > -#if defined(CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER) &&
> > !defined(CONFIG_SPL_BUILD) -/* reserve space for BOOT0 header informati=
on
> > */
> > -	b	reset
> > -	.space	1532
> > -#elif defined(CONFIG_ARM_BOOT_HOOK_RMR)
> > +#ifdef CONFIG_ARM_BOOT_HOOK_RMR
> >  /*
> >   * Switch into AArch64 if needed.
> >   * Refer to arch/arm/mach-sunxi/rmr_switch.S for the original source.
> > @@ -47,7 +51,7 @@
> >  	.word   CONFIG_TEXT_BASE
> >  #endif
> >  	.word	fel_stash - .
> > -#else
> > +#else	/* !CONFIG_ARM_BOOT_HOOK_RMR */
> >  /* normal execution */
> >  	b	reset
> >  #endif
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index b46667ce01e..0527b3863a7 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -386,15 +386,6 @@ config MACH_SUN8I
> >  	default y if MACH_SUN8I_R40
> >  	default y if MACH_SUN8I_V3S
> >=20
> > -config RESERVE_ALLWINNER_BOOT0_HEADER
> > -	bool "reserve space for Allwinner boot0 header"
> > -	select ENABLE_ARM_SOC_BOOT0_HOOK
> > -	---help---
> > -	Prepend a 1536 byte (empty) header to the U-Boot image file, to be
> > -	filled with magic values post build. The Allwinner provided boot0
> > -	blob relies on this information to load and execute U-Boot.
> > -	Only needed on 64-bit Allwinner boards so far when using boot0.
> > -
> >  config ARM_BOOT_HOOK_RMR
> >  	bool
> >  	depends on ARM64
> > diff --git a/configs/a64-olinuxino-emmc_defconfig
> > b/configs/a64-olinuxino-emmc_defconfig index 8ec9eb3e9c2..a5989fab1c6
> > 100644
> > --- a/configs/a64-olinuxino-emmc_defconfig
> > +++ b/configs/a64-olinuxino-emmc_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-olinuxino-emmc"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUPPORT_EMMC_BOOT=3Dy
> > diff --git a/configs/a64-olinuxino_defconfig
> > b/configs/a64-olinuxino_defconfig index 16cef18beef..0b469c25d0d 100644
> > --- a/configs/a64-olinuxino_defconfig
> > +++ b/configs/a64-olinuxino_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-olinuxino"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUN8I_EMAC=3Dy
> > diff --git a/configs/amarula_a64_relic_defconfig
> > b/configs/amarula_a64_relic_defconfig index ae44b66d109..292af6e372e 10=
0644
> > --- a/configs/amarula_a64_relic_defconfig
> > +++ b/configs/amarula_a64_relic_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-amarula-relic"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> >  # CONFIG_VIDEO_DE2 is not set
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defc=
onfig
> > index 99dc2f7d209..d957071cb13 100644
> > --- a/configs/bananapi_m64_defconfig
> > +++ b/configs/bananapi_m64_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-bananapi-m64"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUPPORT_EMMC_BOOT=3Dy
> > diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
> > index 70fc257eebd..608238757ba 100644
> > --- a/configs/nanopi_a64_defconfig
> > +++ b/configs/nanopi_a64_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-nanopi-a64"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUN8I_EMAC=3Dy
> >  CONFIG_USB_EHCI_HCD=3Dy
> > diff --git a/configs/oceanic_5205_5inmfd_defconfig
> > b/configs/oceanic_5205_5inmfd_defconfig index 2ebca673808..6cdcf782bee
> > 100644
> > --- a/configs/oceanic_5205_5inmfd_defconfig
> > +++ b/configs/oceanic_5205_5inmfd_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-oceanic-5205-5inmfd"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_SUNXI_DRAM_LPDDR3_STOCK=3Dy
> >  CONFIG_DRAM_CLK=3D552
> >  CONFIG_DRAM_ZQ=3D3881949
> > diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defc=
onfig
> > index 3b78ad7e52d..df11ad8c8fd 100644
> > --- a/configs/orangepi_win_defconfig
> > +++ b/configs/orangepi_win_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-orangepi-win"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_MACPWR=3D"PD14"
> >  CONFIG_SPL_SPI_SUNXI=3Dy
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defcon=
fig
> > index f42f4e5923a..08c13b58a1e 100644
> > --- a/configs/pine64_plus_defconfig
> > +++ b/configs/pine64_plus_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-pine64-plus"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_PINE64_DT_SELECTION=3Dy
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_OF_LIST=3D"sun50i-a64-pine64 sun50i-a64-pine64-plus"
> > diff --git a/configs/sopine_baseboard_defconfig
> > b/configs/sopine_baseboard_defconfig index a5e1478c117..d9b0eb37c54 100=
644
> > --- a/configs/sopine_baseboard_defconfig
> > +++ b/configs/sopine_baseboard_defconfig
> > @@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-sopine-baseboard"
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I=3Dy
> > -CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=3Dy
> >  CONFIG_SUNXI_DRAM_LPDDR3_STOCK=3Dy
> >  CONFIG_DRAM_CLK=3D552
> >  CONFIG_DRAM_ZQ=3D3881949 =20
>=20
>=20
>=20
>=20
>=20

