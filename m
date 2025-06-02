Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB8F191F7F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748824858; cv=none; b=GAAtVXl7kwFP2d11qwuM2it5q47e7bdFN0gAICm5JTHWeHZjTxeYAI/jD5ePaXiC1Q7Aab4AZgMNYSYlTQyCyQz53cWpE3e436e1y3yo9SVjEDusLehGKtmU1SlplG8XyqUWRng0zzZGFXL0VKaGPuqSOivAEQ1KQuNSeI8OtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748824858; c=relaxed/simple;
	bh=FZPen8DBGM3vW9tsG19dyVOcTsUdjq7DMWy8EWV/uJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGQWs3wzZ68um6HSjCfZkXGQLOLHgzZ0ueDk7fk6bUpdERs7YuihwvXnLU7xMWMuDGVhs9ohAbWIS9tn54Z0AudPRQiR72mYaRetdpeSHGuwS8g+U7sdQcu3hbYg0F4ZS/n9AO+rIj8eq6RkKdXqrLgpH5jawkm+R2lo+NfPLhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CC241515;
	Sun,  1 Jun 2025 17:40:39 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7A643F673;
	Sun,  1 Jun 2025 17:40:54 -0700 (PDT)
Date: Mon, 2 Jun 2025 01:40:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/6] sunxi: Add support for the Lichee Pi Zero with Dock
Message-ID: <20250602014014.0664e6fe@minigeek.lan>
In-Reply-To: <20250601153943.2690123-3-contact@paulk.fr>
References: <20250601153943.2690123-1-contact@paulk.fr>
	<20250601153943.2690123-3-contact@paulk.fr>
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

On Sun,  1 Jun 2025 17:39:39 +0200
Paul Kocialkowski <contact@paulk.fr> wrote:

Hi Paul,

> This adds a U-Boot config and device-tree build for the Lichee Pi Zero
> with Dock. Compared to the Lichee Pi Zero, it has an ethernet port
> (with internal PHY) so the EMAC driver and network support are enabled.

I just realised that there is no difference between the U-Boot versions
of the DT and the kernel ones, so can you please use the opportunity to
upgrade the V3x systems to OF_UPSTREAM (in a separate patch)? This would
involve removing all the redundant .dts* files from arch/arm/dts, see
dc2dd2de0f782860 for an example.

Regardless the defconfig looks alright, but one comment:

> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  arch/arm/dts/Makefile                | 3 ++-
>  configs/LicheePi_Zero_Dock_defconfig | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>  create mode 100644 configs/LicheePi_Zero_Dock_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 32b698a7f411..be6867ceae0e 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -650,7 +650,8 @@ dtb-$(CONFIG_MACH_SUN8I_V3S) += \
>  	sun8i-s3-elimo-initium.dtb \
>  	sun8i-s3-pinecube.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
> -	sun8i-v3s-licheepi-zero.dtb
> +	sun8i-v3s-licheepi-zero.dtb \
> +	sun8i-v3s-licheepi-zero-dock.dtb
>  dtb-$(CONFIG_MACH_SUN8I_R528) += \
>  	sun8i-t113s-mangopi-mq-r-t113.dtb
>  dtb-$(CONFIG_MACH_SUN50I_H5) += \
> diff --git a/configs/LicheePi_Zero_Dock_defconfig b/configs/LicheePi_Zero_Dock_defconfig
> new file mode 100644
> index 000000000000..ec172d98b65e
> --- /dev/null
> +++ b/configs/LicheePi_Zero_Dock_defconfig
> @@ -0,0 +1,7 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun8i-v3s-licheepi-zero-dock"
> +CONFIG_SPL=y
> +CONFIG_MACH_SUN8I_V3S=y
> +# CONFIG_HAS_ARMV7_SECURE_BASE is not set

IIUC, the V3S does not have (secure) SRAM A2, and no ARISC? Can we
express this in the Kconfig file then, since it's not a board config
option?

Cheers,
Andre

> +CONFIG_SUN8I_EMAC=y

