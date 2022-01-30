Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C7D29CA
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:25:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23AD2D6E;
	Sun, 30 Jan 2022 14:25:26 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5234D3F718;
	Sun, 30 Jan 2022 14:25:25 -0800 (PST)
Date: Sun, 30 Jan 2022 22:20:01 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] sunxi: Fix H616 DRAM read calibration for dual rank
Message-ID: <20220130222001.64b51fce@slackpad.fritz.box>
In-Reply-To: <20220129155843.111741-3-jernej.skrabec@gmail.com>
References: <20220129155843.111741-1-jernej.skrabec@gmail.com>
	<20220129155843.111741-3-jernej.skrabec@gmail.com>
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

On Sat, 29 Jan 2022 16:58:43 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> Although it isn't known what bit 0 in PHY reg 8 does, it's obvious that
> it has to be set before read calibration and cleared afterwards. This is
> already done for first rank, but not for second (copy & paste error.)

Indeed looks like it, from the logic point of view.

> 
> Fix it.
> 
> Fixes: f4317dbd06b6 ("sunxi: Add H616 DRAM support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Applied to sunxi/master.

Cheers,
Andre

> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 76f520f4e780..83e8abc2f8d8 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -360,7 +360,7 @@ static bool mctl_phy_read_calibration(struct dram_para *para)
>  			}
>  		}
>  
> -		setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 1);
> +		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 1);
>  	}
>  
>  	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 0x30);

