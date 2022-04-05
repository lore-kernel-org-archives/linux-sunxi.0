Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1F2323B
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Apr 2022 23:02:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B0D723A;
	Tue,  5 Apr 2022 16:02:32 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6B43F718;
	Tue,  5 Apr 2022 16:02:31 -0700 (PDT)
Date: Tue, 5 Apr 2022 23:59:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Sunil Mohan
 Adapa <sunil@medhas.org>, linux-sunxi@lists.linux.dev, u-boot@lists.denx.de
Subject: Re: [RESEND PATCH v2 0/3] sunxi: Improve automatic eMMC boot
 partition support
Message-ID: <20220405235929.2dffd0f5@slackpad.lan>
In-Reply-To: <20210712100651.6912-1-andre.przywara@arm.com>
References: <20210712100651.6912-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jul 2021 11:06:48 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> (resent to also include forgotten U-Boot list)
> 
> The Allwinner BootROM supports loading the SPL from eMMC boot partitions,
> but so far the SPL support for this case was a bit lacking, as it was a
> compile time decision, and even required a manual config change.
> This actually got accidentally fixed in v2021.04 (c0b417b2f1a3 "sunxi:
> support loading with SPL > 32KB"), but still some gaps remain: When just
> enabling an eMMC boot partition, but having no bootable code there, the
> BROM will just continue with booting from the user data partition, but
> U-Boot does not detect this and will try to load U-Boot proper from that
> boot partition.
> 
> This series fixes this, by replicating the BROMs decisions in the SPL,
> to decide on the partition to continue loading from.
> 
> Patch 1/3 prepares a generic function to take an extra argument, while
> patch 2/3 implements the actual algorithm.
> As this now allows to always have eMMC boot support on, patch 3/3 just
> activates this for a number of boards I could test it on.
> 
> I'd like to encourage other people to test this on boards with eMMC, to
> enable this in the respective defconfig, maybe even centrally.
> 
> Some more details on eMMC boot partition support and how to install
> U-Boot in there can be found in the linux-sunxi Wiki:
> http://linux-sunxi.org/Bootable_eMMC

Rebased and updated patch 1/3, then merged into sunxi/master, which
landed in mainline already.

Thanks,
Andre

> 
> Cheers,
> Andre
> 
> Changelog v1 .. v2:
> - drop patch 1/5 (bugfix): already merged
> - drop patch 3/5, as it was obsoleted by c0b417b2f1a3
> - remove check for 32KB SPL limit (not applicable for H6 and beyond)
> - remove extra sector offset adjustment (obsoleted by c0b417b2f1a3)
> 
> Andre Przywara (3):
>   spl: mmc: extend spl_mmc_boot_mode() to take mmc argument
>   sunxi: eMMC: Improve automatic boot source detection
>   sunxi: defconfig: enable eMMC boot partition support
> 
>  arch/arm/mach-imx/spl.c                    |  2 +-
>  arch/arm/mach-k3/am6_init.c                |  2 +-
>  arch/arm/mach-k3/j721e_init.c              |  2 +-
>  arch/arm/mach-omap2/boot-common.c          |  2 +-
>  arch/arm/mach-rockchip/spl.c               |  2 +-
>  arch/arm/mach-socfpga/spl_a10.c            |  2 +-
>  arch/arm/mach-socfpga/spl_gen5.c           |  2 +-
>  arch/arm/mach-stm32mp/spl.c                |  2 +-
>  arch/arm/mach-sunxi/board.c                | 80 ++++++++++++++++++++++
>  arch/arm/mach-uniphier/mmc-boot-mode.c     |  5 +-
>  common/spl/spl_mmc.c                       |  4 +-
>  configs/bananapi_m64_defconfig             |  1 +
>  configs/emlid_neutis_n5_devboard_defconfig |  1 +
>  configs/pine64-lts_defconfig               |  1 +
>  configs/pine_h64_defconfig                 |  1 +
>  include/spl.h                              |  3 +-
>  16 files changed, 97 insertions(+), 15 deletions(-)
> 

