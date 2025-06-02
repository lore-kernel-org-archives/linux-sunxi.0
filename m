Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9241A23BA
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 00:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748824850; cv=none; b=MCYvvTmp07n8Sm+2KIWBjdKsHY029J1zS3275bBW6inyVqbL/u3E+wLsLrsrTOajJdibe5YkAcwtyyUzcYCpluv22306OTXqNTF+i488p8GSfBVvngpTJ50a/2SbhA3rJl/n8vjU8BNZ2bpPFMKglPfqRIbuxjmbLUo79UOztrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748824850; c=relaxed/simple;
	bh=6Cpa/Ly1GONGOQgKeqS/ORWMscyQAMGcvQsgfaTVkqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgt71B0L9t7Ixv2naGEDm7L28TVbuM60lWzx16HGs+wPOYu51qnKPZfhMOwD4GjNTSqBvcY3vaJuLC+7u4o9We1m2uOf+w33/gd6LtHhOv6FsVm44pawd9qXRBLMgesYzD1ej1W//rwk8XTQgnkEf5NADGBHD0O6PJO243tCltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D3D1515;
	Sun,  1 Jun 2025 17:40:25 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A10533F673;
	Sun,  1 Jun 2025 17:40:40 -0700 (PDT)
Date: Mon, 2 Jun 2025 01:39:55 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/6] sunxi: Kconfig: Fix default order for V3s DRAM
 clock
Message-ID: <20250602013955.61191d77@minigeek.lan>
In-Reply-To: <20250601153943.2690123-2-contact@paulk.fr>
References: <20250601153943.2690123-1-contact@paulk.fr>
	<20250601153943.2690123-2-contact@paulk.fr>
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

On Sun,  1 Jun 2025 17:39:38 +0200
Paul Kocialkowski <contact@paulk.fr> wrote:

Hi Paul,

> The V3s (using co-packaged DRAM) runs at 360 MHz, which is specified in
> the common platform Kconfig file. However the value for MACH_SUN8I will
> be picked up instead due to ordering.
> 
> Re-order the defaults to have MACH_SUN8I_V3S before MACH_SUN8I and let
> it select the correct default. Also update the LicheePi Zero Dock
> defconfig to remove the value, which is now correctly selected.

Looks alright, can confirm that all generated .config files are the
same before and after:

> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre

> ---
>  arch/arm/mach-sunxi/Kconfig     | 2 +-
>  configs/LicheePi_Zero_defconfig | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 17179593913e..8b43fd176dc0 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -591,9 +591,9 @@ config DRAM_CLK
>  	int "sunxi dram clock speed"
>  	default 792 if MACH_SUN9I
>  	default 648 if MACH_SUN8I_R40
> -	default 312 if MACH_SUN6I || MACH_SUN8I
>  	default 360 if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || \
>  		       MACH_SUN8I_V3S
> +	default 312 if MACH_SUN6I || MACH_SUN8I
>  	default 672 if MACH_SUN50I
>  	default 744 if MACH_SUN50I_H6
>  	default 720 if MACH_SUN50I_H616
> diff --git a/configs/LicheePi_Zero_defconfig b/configs/LicheePi_Zero_defconfig
> index c37c49ccbb16..b2cf0a018c7f 100644
> --- a/configs/LicheePi_Zero_defconfig
> +++ b/configs/LicheePi_Zero_defconfig
> @@ -3,6 +3,5 @@ CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun8i-v3s-licheepi-zero"
>  CONFIG_SPL=y
>  CONFIG_MACH_SUN8I_V3S=y
> -CONFIG_DRAM_CLK=360
>  # CONFIG_HAS_ARMV7_SECURE_BASE is not set
>  CONFIG_NO_NET=y

