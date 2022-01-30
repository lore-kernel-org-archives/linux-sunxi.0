Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F1529CA
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:26:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 554F2D6E;
	Sun, 30 Jan 2022 14:26:25 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 808513F718;
	Sun, 30 Jan 2022 14:26:24 -0800 (PST)
Date: Sun, 30 Jan 2022 22:19:06 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] sunxi: fix H616 DRAM ODT support
Message-ID: <20220130221752.28b9dd9b@slackpad.fritz.box>
In-Reply-To: <20220129155843.111741-2-jernej.skrabec@gmail.com>
References: <20220129155843.111741-1-jernej.skrabec@gmail.com>
	<20220129155843.111741-2-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Jan 2022 16:58:42 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> Kconfig symbol is missing CONFIG_ prefix, so compiler will always
> skip ODT configuration.
> 
> Fix symbol name.

Oops, nice catch!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Applied to sunxi/master.

Cheers,
Andre

> 
> Fixes: f4317dbd06b6 ("sunxi: Add H616 DRAM support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index acdfb3ceef8c..76f520f4e780 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -720,7 +720,7 @@ static bool mctl_phy_init(struct dram_para *para)
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
>  
> -	if (IS_ENABLED(DRAM_ODT_EN))
> +	if (IS_ENABLED(CONFIG_DRAM_ODT_EN))
>  		mctl_phy_configure_odt();
>  
>  	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);

