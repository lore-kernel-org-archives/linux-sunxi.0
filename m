Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9EF53B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:13:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C78DFEC;
	Tue, 11 Apr 2023 03:14:15 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33D913F73F;
	Tue, 11 Apr 2023 03:13:30 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:13:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 05/10] sunxi: Always configure ODT on H616 DRAM
Message-ID: <20230411111327.764deaeb@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-6-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
 <20230410082119.24616-6-jernej.skrabec@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Apr 2023 10:21:14 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Vendor H616 DRAM code always configure part which we call ODT
> configuration. Let's reflect that here too.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Still not a big fan of "depends on !MACH_SUN50I_H616", but the logic
seems fine nevertheless:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/mach-sunxi/Kconfig            | 2 +-
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 1b47a49f938c..4300d388e066 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -488,12 +488,12 @@ config DRAM_ZQ
>  
>  config DRAM_ODT_EN
>  	bool "sunxi dram odt enable"
> +	depends on !MACH_SUN50I_H616
>  	default y if MACH_SUN8I_A23
>  	default y if MACH_SUNXI_H3_H5
>  	default y if MACH_SUN8I_R40
>  	default y if MACH_SUN50I
>  	default y if MACH_SUN50I_H6
> -	default y if MACH_SUN50I_H616
>  	---help---
>  	Select this to enable dram odt (on die termination).
>  
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 630c7c3be882..7d2434309b07 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -736,8 +736,7 @@ static bool mctl_phy_init(struct dram_para *para)
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
>  
> -	if (IS_ENABLED(CONFIG_DRAM_ODT_EN))
> -		mctl_phy_configure_odt(para);
> +	mctl_phy_configure_odt(para);
>  
>  	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
>  

