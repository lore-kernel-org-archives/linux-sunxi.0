Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67272173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 13:49:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D87A11B3;
	Thu, 22 Jul 2021 06:49:19 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068303F694;
	Thu, 22 Jul 2021 06:49:17 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:48:46 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 03/13] mmc: sunxi: conditionally include MMC2
 initialization code
Message-ID: <20210722144846.4e77dacd@slackpad.fritz.box>
In-Reply-To: <20210722063015.421923-4-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
	<20210722063015.421923-4-icenowy@sipeed.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jul 2021 14:30:05 +0800
Icenowy Zheng <icenowy@sipeed.com> wrote:

Hi Icenowy,

> Allwinner R329 has no MMC2.
> 
> Only include the code of MMC2 if the base address of it is defined.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

One day (TM) we will hopefully get somehow rid of those #ifdefs
somehow, but until then it looks OK.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre

> ---
>  drivers/mmc/sunxi_mmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 178b8cf106..6b809c001f 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -73,10 +73,12 @@ static int mmc_resource_init(int sdc_no)
>  		priv->reg = (struct sunxi_mmc *)SUNXI_MMC1_BASE;
>  		priv->mclkreg = &ccm->sd1_clk_cfg;
>  		break;
> +#ifdef SUNXI_MMC2_BASE
>  	case 2:
>  		priv->reg = (struct sunxi_mmc *)SUNXI_MMC2_BASE;
>  		priv->mclkreg = &ccm->sd2_clk_cfg;
>  		break;
> +#endif
>  #ifdef SUNXI_MMC3_BASE
>  	case 3:
>  		priv->reg = (struct sunxi_mmc *)SUNXI_MMC3_BASE;

