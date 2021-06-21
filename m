Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F34570
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Jun 2021 00:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D35ADD6E;
	Sun, 20 Jun 2021 17:34:37 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9E973F718;
	Sun, 20 Jun 2021 17:34:36 -0700 (PDT)
Date: Mon, 21 Jun 2021 01:34:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Qianfan Zhao <qianfanguijin@163.com>
Cc: u-boot@lists.denx.de, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng
 <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 2/4] sunxi_musb: Add musb configurations of sun8i-r40
Message-ID: <20210621013420.33260aa1@slackpad.fritz.box>
In-Reply-To: <20210616023326.18135-2-qianfanguijin@163.com>
References: <20210616023326.18135-1-qianfanguijin@163.com>
	<20210616023326.18135-2-qianfanguijin@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2021 10:33:24 +0800
qianfanguijin@163.com (qianfanguijin@163.com) wrote:

Hi,

> From: qianfan Zhao <qianfanguijin@163.com>
> 
> R40 has 8 user-configurable endpoints and 8KB FIFO for EPs.

This means the MUSB controller is fully compatible to the H3, so this
whole patch is not needed:

> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  drivers/usb/musb-new/sunxi.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb-new/sunxi.c
> b/drivers/usb/musb-new/sunxi.c index fea4105f3d..e03299ea5b 100644
> --- a/drivers/usb/musb-new/sunxi.c
> +++ b/drivers/usb/musb-new/sunxi.c
> @@ -263,7 +263,6 @@ static int sunxi_musb_enable(struct musb *musb)
>  	}
>  
>  	USBC_ForceVbusValidToHigh(musb->mregs);
> -
>  	enabled = true;
>  	return 0;
>  }
> @@ -438,6 +437,30 @@ static struct musb_hdrc_config musb_config_h3 = {
>  	.ram_bits	= SUNXI_MUSB_RAM_BITS,
>  };
>  
> +/* R40/A40 OTG supports only 4 endpoints */
> +#define SUNXI_MUSB_MAX_EP_NUM_R40	5
> +
> +static struct musb_fifo_cfg sunxi_musb_mode_cfg_r40[] = {
> +	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
> +	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
> +	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
> +	MUSB_EP_FIFO_SINGLE(2, FIFO_RX, 512),
> +	MUSB_EP_FIFO_SINGLE(3, FIFO_TX, 512),
> +	MUSB_EP_FIFO_SINGLE(3, FIFO_RX, 512),
> +	MUSB_EP_FIFO_SINGLE(4, FIFO_TX, 512),
> +	MUSB_EP_FIFO_SINGLE(4, FIFO_RX, 512),
> +};
> +
> +static struct musb_hdrc_config musb_config_r40 = {
> +	.fifo_cfg       = sunxi_musb_mode_cfg_r40,
> +	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_r40),
> +	.multipoint	= true,
> +	.dyn_fifo	= true,
> +	.soft_con       = true,
> +	.num_eps	= SUNXI_MUSB_MAX_EP_NUM_R40,
> +	.ram_bits	= SUNXI_MUSB_RAM_BITS,
> +};

Apart from changing the name, this is identical to the H3, so you won't
need a separate structure for that.

> +
>  static int musb_usb_probe(struct udevice *dev)
>  {
>  	struct sunxi_glue *glue = dev_get_priv(dev);
> @@ -527,6 +550,10 @@ static const struct sunxi_musb_config
> sun8i_h3_cfg = { .config = &musb_config_h3,
>  };
>  
> +static const struct sunxi_musb_config sun8i_r40_cfg = {
> +	.config = &musb_config_r40,
> +};
> +
>  static const struct udevice_id sunxi_musb_ids[] = {
>  	{ .compatible = "allwinner,sun4i-a10-musb",
>  			.data = (ulong)&sun4i_a10_cfg },
> @@ -536,6 +563,8 @@ static const struct udevice_id sunxi_musb_ids[] =
> { .data = (ulong)&sun6i_a31_cfg },
>  	{ .compatible = "allwinner,sun8i-h3-musb",
>  			.data = (ulong)&sun8i_h3_cfg },
> +	{ .compatible = "allwinner,sun8i-r40-musb",
> +			.data = (ulong)&sun8i_r40_cfg },

And since there is no difference to the H3, you don't need a separate
compatible string either. Just use "allwinner,sun8i-r40-musb",
"allwinner,sun8i-h3-musb" in the DT, and drop this whole patch here.

Cheers,
Andre

>  	{ }
>  };
>  

