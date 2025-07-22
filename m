Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D5E1754B
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Jul 2025 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753144652; cv=none; b=el9umFK4RZZ8wSlPjThbtuzyDF9HRZkKr9f/ZAIYB2OzqyKSrcOQF+mI4kzAEK4s9MP1/Zp2WIikArxP+2W2CfSLHvs1K7DD16ttIQrdu5TkYTrKtn/ht+DRtd++iY8aw3ygBK4dSD41rIXatcE7zcF4p4PXsDZrmFTESIPWw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753144652; c=relaxed/simple;
	bh=Z0LYe8qnzz0LBcWlW04K7l4J0OcQNv8WmXs0S5//4qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FXNmKQmR2tkn1qaLGmy+zyTBl5y05a5Lyn9Zd+qJROOGBhpM+y+epjvpgNzt2XlEMyvFGai+b7MuszNTRUPIRlmoMCQBhSqwoiiItxyLTEhXj2EfOJJmX9E+MdkxmxPQizYyDN8pc87XOwVmdX2k6o6OXedIjyhN3MEkV8eVkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D75F1595;
	Mon, 21 Jul 2025 17:37:22 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDF953F66E;
	Mon, 21 Jul 2025 17:37:26 -0700 (PDT)
Date: Tue, 22 Jul 2025 01:35:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Mikhail Kalashnikov
 <iuncuim@gmail.com>, Yixun Lan <dlan@gentoo.org>, Paul Kocialkowski
 <paulk@sys-base.io>, linux-sunxi@lists.linux.dev, Tom Rini
 <trini@konsulko.com>
Subject: Re: [PATCH v2 20/20] sunxi: A523: add defconfigs for three boards
Message-ID: <20250722013526.6297858c@minigeek.lan>
In-Reply-To: <20250717235455.32528-21-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
	<20250717235455.32528-21-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Jul 2025 00:54:55 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Yixun,

see below for a comment on the missing eMMC support for the Radxa
defconfig. My board doesn't have eMMC, so can you please check this on
your end?

> So far developers seem to use three popular boards:
> - Avaota A1: dev board with USB 3.0, dual Ethernet, small display
> - X96QPro+: TV box with Gigabit Ethernet, USB 3.0, eMMC
> - Radxa A5E: small dev board with USB3/M.2 2230 (muxed), dual Ethernet
> 
> Add the defconfig files for those boards, containing the DRAM parameters
> and the usual Kconfig options.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/MAINTAINERS         | 15 +++++++++++++++
>  configs/avaota-a1_defconfig     | 31 +++++++++++++++++++++++++++++++
>  configs/radxa-a5e_defconfig     | 30 ++++++++++++++++++++++++++++++
>  configs/x96q_pro_plus_defconfig | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 configs/avaota-a1_defconfig
>  create mode 100644 configs/radxa-a5e_defconfig
>  create mode 100644 configs/x96q_pro_plus_defconfig
> 
> diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
> index 1b4b7d87163..66e6a8ff962 100644
> --- a/board/sunxi/MAINTAINERS
> +++ b/board/sunxi/MAINTAINERS
> @@ -137,6 +137,11 @@ M:	Chris Morgan <macromorgan@hotmail.com>
>  S:	Maintained
>  F:	configs/anbernic_rg35xx_h700_defconfig
>  
> +AVAOTA A1 BOARD
> +M:	Andre Przywara <andre.przywara@arm.com>
> +S:	Maintained
> +F:	configs/avaota-a1_defconfig
> +
>  BANANAPI M1 PLUS
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  S:	Maintained
> @@ -531,6 +536,11 @@ M:	Quentin Schulz <quentin.schulz@free-electrons.com>
>  S:	Maintained
>  F:	configs/parrot_r16_defconfig
>  
> +RADXA CUBIE A5E BOARD
> +M:	Andre Przywara <andre.przywara@arm.com>
> +S:	Maintained
> +F:	configs/radxa-a5e_defconfig
> +
>  SINLINX SINA31s BOARD
>  M:	Chen-Yu Tsai <wens@csie.org>
>  S:	Maintained
> @@ -591,6 +601,11 @@ M:	Andre Przywara <andre.przywara@arm.com>
>  S:	Maintained
>  F:	configs/x96_mate_defconfig
>  
> +X96Q PRO+ TV BOX
> +M:	Andre Przywara <andre.przywara@arm.com>
> +S:	Maintained
> +F:	configs/x96q_pro_plus_defconfig
> +
>  YONES TOPTECH BD1078 BOARD
>  M:	Paul Kocialkowski <contact@paulk.fr>
>  S:	Maintained
> diff --git a/configs/avaota-a1_defconfig b/configs/avaota-a1_defconfig
> new file mode 100644
> index 00000000000..55457edd3b3
> --- /dev/null
> +++ b/configs/avaota-a1_defconfig
> @@ -0,0 +1,31 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-t527-avaota-a1"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
> +CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
> +CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
> +CONFIG_DRAM_SUNXI_TPR0=0x80808080
> +CONFIG_DRAM_SUNXI_TPR1=0x06060606
> +CONFIG_DRAM_SUNXI_TPR6=0x38000000
> +CONFIG_DRAM_SUNXI_TPR10=0x802f3333
> +CONFIG_DRAM_SUNXI_TPR11=0xc7c5c4c2
> +CONFIG_DRAM_SUNXI_TPR12=0x3533302f
> +CONFIG_MACH_SUN55I_A523=y
> +CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> +CONFIG_R_I2C_ENABLE=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_REGULATOR_AXP=y
> +CONFIG_AXP717_POWER=y
> +CONFIG_AXP_I2C_ADDRESS=0x35
> +CONFIG_AXP_DCDC2_VOLT=920
> +CONFIG_AXP_DCDC3_VOLT=1160
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y
> diff --git a/configs/radxa-a5e_defconfig b/configs/radxa-a5e_defconfig
> new file mode 100644
> index 00000000000..012e7b4eeaf
> --- /dev/null
> +++ b/configs/radxa-a5e_defconfig
> @@ -0,0 +1,30 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-a527-cubie-a5e"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
> +CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
> +CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
> +CONFIG_DRAM_SUNXI_TPR0=0x80808080
> +CONFIG_DRAM_SUNXI_TPR1=0x06060606
> +CONFIG_DRAM_SUNXI_TPR6=0x38000000
> +CONFIG_DRAM_SUNXI_TPR10=0x802f3333
> +CONFIG_DRAM_SUNXI_TPR11=0xc7c5c4c2
> +CONFIG_DRAM_SUNXI_TPR12=0x3533302f
> +# BSP value: CONFIG_DRAM_SUNXI_TPR11=0xc6c4c2c0
> +# BSP value: CONFIG_DRAM_SUNXI_TPR12=0x3a373233
> +CONFIG_MACH_SUN55I_A523=y
> +CONFIG_R_I2C_ENABLE=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_REGULATOR_AXP=y
> +CONFIG_AXP717_POWER=y
> +CONFIG_AXP_DCDC2_VOLT=920
> +CONFIG_AXP_DCDC3_VOLT=1100
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y

This is missing CONFIG_MMC_SUNXI_SLOT_EXTRA=2 and
CONFIG_SUPPORT_EMMC_BOOT=y, as there are Radxa boards with eMMC.
The DT describes this, so we should follow suit here, to allow eMMC
booting. Should not harm boards without the eMMC chip.

Thanks,
Andre

> diff --git a/configs/x96q_pro_plus_defconfig b/configs/x96q_pro_plus_defconfig
> new file mode 100644
> index 00000000000..07d3b078bef
> --- /dev/null
> +++ b/configs/x96q_pro_plus_defconfig
> @@ -0,0 +1,32 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-h728-x96qpro+"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
> +CONFIG_DRAM_SUNXI_DX_DRI=0x0c0c0c0c
> +CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUNXI_ODT_EN=0x90909090
> +CONFIG_DRAM_SUNXI_TPR0=0x80808080
> +CONFIG_DRAM_SUNXI_TPR1=0x06060606
> +CONFIG_DRAM_SUNXI_TPR6=0x3380807e
> +CONFIG_DRAM_SUNXI_TPR10=0x802f7788
> +CONFIG_DRAM_SUNXI_TPR11=0x8f919190
> +CONFIG_DRAM_SUNXI_TPR12=0x22222723
> +CONFIG_MACH_SUN55I_A523=y
> +CONFIG_SUNXI_DRAM_A523_DDR3=y
> +CONFIG_DRAM_CLK=792
> +CONFIG_MMC_SUNXI_SLOT_EXTRA=2
> +CONFIG_R_I2C_ENABLE=y
> +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_REGULATOR_AXP=y
> +CONFIG_AXP717_POWER=y
> +CONFIG_AXP_DCDC2_VOLT=920
> +CONFIG_AXP_DCDC3_VOLT=1360
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y

