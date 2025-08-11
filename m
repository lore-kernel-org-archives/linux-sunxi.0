Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0BF1E47CC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754955221; cv=none; b=nolXH5IPx3Mx2gXyyuhATDpq42tFSRSVVB2qGnvOoKxk01St+DejGdLuRWgtWCvjCn96uAKwbSk3ElNuFFakL5uF6sUIqYzdtx3+r4D7LZAjKKVZNyzTDq2m1fu9xj1B0pxpnWU3RKRZ3vqYG8ZcBUKouUAATnYbp1BkXCxLXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754955221; c=relaxed/simple;
	bh=la4rlq1A82VeAE9olPe0HoA4QaqtDZ/HfL3AWWGyqw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejhHT3wrVgqjxOFf4TABYDdQ/krLVoMtel2uY+LoH8DlzcGHCuY0xP90rmjYHiJXjgQzd+JOTqkot5I70m7K0PAfxLaTmXPY9fwiGjlYrD6AaDoEc6qPuxQ1HAgOkKXA5Z4P0wyS/ftgXJV2WFp0Z6t/o00egm07ZKD0dm3pRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63C53106F;
	Mon, 11 Aug 2025 16:33:30 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAA0D3F63F;
	Mon, 11 Aug 2025 16:33:37 -0700 (PDT)
Date: Tue, 12 Aug 2025 00:30:57 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Eric Anderson <ejona86@gmail.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>, Stefan
 Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH] sunxi: Enable SPL/SPI boot for OLinuXino Lime2
Message-ID: <20250812003057.0068a65e@minigeek.lan>
In-Reply-To: <20250713002741.367252-1-ejona86@gmail.com>
References: <20250713002741.367252-1-ejona86@gmail.com>
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

On Sat, 12 Jul 2025 17:27:41 -0700
Eric Anderson <ejona86@gmail.com> wrote:

Hi,

> 58e9502e6 "arm: sunxi: Enable SPL/SPI boot for Olinuxino Lime2-eMMC
> boards" enabled SPI boot for the eMMC variant. Olimex offers the
> "s16MB" variant with SPI flash populated but without eMMC populated.
> Tested on board rev L.

Indeed there is a config without eMMC and with SPI flash in their shop.

But actually I wonder why Olimex has two different DTs for the
eMMC-less boards and the board with eMMC. Many other boards make eMMC
optional, either as separate SKUs, or when eMMC is on a module. And we
just go with one DT, describing the eMMC, the code will just skip the
initialisation if no "card" is found. That affects the A20 and A64
boards.

So I wonder if anyone wants to clean this up, because I think we would
only need the A20-OLinuXino-Lime2-eMMC_defconfig,
A20-OLinuXino_MICRO-eMMC_defconfig and a64-olinuxino_defconfig.

> Signed-off-by: Eric Anderson <ejona86@gmail.com>
> ---
>  configs/A20-OLinuXino-Lime2_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
> index f885fc01e6e..a2c3dade795 100644
> --- a/configs/A20-OLinuXino-Lime2_defconfig
> +++ b/configs/A20-OLinuXino-Lime2_defconfig
> @@ -2,6 +2,7 @@ CONFIG_ARM=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime2"
>  CONFIG_SPL=y
> +CONFIG_SPL_SPI_SUNXI=y

This needs to go further down below. After configuring for a board, run
"make savedefconfig", then compare the generated "defconfig" file
with your ..._defconfig version (or just copy ./defconfig over).

With this fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Will fix this up while committing, so no further action needed.

Cheers,
Andre

>  CONFIG_MACH_SUN7I=y
>  CONFIG_DRAM_CLK=384
>  CONFIG_I2C1_ENABLE=y

