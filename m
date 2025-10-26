Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9CF2FF177
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 23:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520046; cv=none; b=Oh9FdmMrpz3lEHGuITwLQe4Y8NHqutW2ev9ph3zIFVFO+fxbj843CHX4d81aBLa9nXe/AccgZbbVt/Cd0LyVuPEkoyVmBdJ7+GYnDN2FwBujnHBWk05rDwbY4iIY8ieAQ4rGs49NVhlPJi9DLnhjIGGR8h+mVWKmx6GPYcn1dDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520046; c=relaxed/simple;
	bh=zdUKiD+Qz3TeQYdX3eqJFbV7RW9fuDUgGBiICtPMnVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFkZZtr2Ka3V9Q9HIMNoGwMv+63bGJuFR6uaK1KbwmskKESx3CKuq0oKUy4lYUfSJH5MoBPvNnJOGvPUmEvQjUq2KxnU5gGYHYPq97jYoqt0Y+WBxxEZgCR0qF5fvCZQpfRMHP/QudJMkvthngtuxGl3hWhVBkWaNipR7uHwVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 796981764;
	Sun, 26 Oct 2025 16:07:15 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA43B3F673;
	Sun, 26 Oct 2025 16:07:22 -0700 (PDT)
Date: Sun, 26 Oct 2025 23:06:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: a523: Add OrangePi 4A defconfig
Message-ID: <20251026230642.276fb54f@minigeek.lan>
In-Reply-To: <20251020161930.2761929-1-wens@kernel.org>
References: <20251020161930.2761929-1-wens@kernel.org>
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

On Tue, 21 Oct 2025 00:19:30 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Chen-Yu,

> The OrangePi 4A is a typical Raspberry Pi model B sized development
> board from Xunlong designed around an Allwinner T527 SoC.
> 
> The board has the following features:
> - Allwinner T527 SoC
> - AXP717B + AXP323 PMICs
> - Up to 4GB LPDDR4 DRAM
> - micro SD slot
> - optional eMMC module
> - M.2 slot for PCIe 2.0 x1
> - 16 MB SPI-NOR flash
> - 4x USB 2.0 type-A ports (one can be used in gadget mode)
> - 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
> - 3.5mm audio jack via internal audio codec
> - HDMI 2.0 output
> - eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
> - USB type-C port purely for power
> - AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
> - unsoldered headers for ADC and an additional USB 2.0 host port
> - 40-pin GPIO header
> 
> Add defconfig for it.
>

This looks good to me, queued for the PR.

> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  board/sunxi/MAINTAINERS       |  5 +++++
>  configs/orangepi_4a_defconfig | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 configs/orangepi_4a_defconfig
> 
> diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
> index e00b54f45356..897f4009b29d 100644
> --- a/board/sunxi/MAINTAINERS
> +++ b/board/sunxi/MAINTAINERS
> @@ -435,6 +435,11 @@ M:	Andre Heider <a.heider@gmail.com>
>  S:	Maintained
>  F:	configs/orangepi_3_defconfig
>  
> +ORANGEPI 4A BOARD
> +M:	Chen-Yu Tsai <wens@kernel.org>
> +S:	Maintained
> +F:	configs/orangepi_4a_defconfig
> +
>  ORANGEPI LITE2 BOARD
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  S:	Maintained
> diff --git a/configs/orangepi_4a_defconfig b/configs/orangepi_4a_defconfig
> new file mode 100644
> index 000000000000..6a44dd979590
> --- /dev/null
> +++ b/configs/orangepi_4a_defconfig
> @@ -0,0 +1,32 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-t527-orangepi-4a"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
> +CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
> +CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
> +CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
> +CONFIG_DRAM_SUNXI_TPR0=0x80808080
> +CONFIG_DRAM_SUNXI_TPR1=0x06060606
> +CONFIG_DRAM_SUNXI_TPR2=0x5f090503
> +CONFIG_DRAM_SUNXI_TPR6=0x38000000
> +CONFIG_DRAM_SUNXI_TPR10=0x802f3333
> +CONFIG_DRAM_SUNXI_TPR11=0xc6c4c2c0
> +CONFIG_DRAM_SUNXI_TPR12=0x3a373233
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

