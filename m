Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0129CA
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:08:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D4F65C0118;
	Fri,  5 Nov 2021 23:08:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Nov 2021 23:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=z
	GyiuK+quzho3prcYU7OZ3liWXJdezEwmmgKCnG6M50=; b=E0SSzXDaY10O13quz
	EWpN5S/Eg02dTHLIDFO1zJZJiq0AuMukPr6lk7DyJ6i1ztm17WWaAEsB9bZvmmL+
	5bK5hTytEn3iCCPCCm+Tuf8gjwZDQWO/EFlabO0uwby5YTpDV64PC2bvUtYHThhs
	L6WpHkQtId1VPJIJLM+i8kN1j90ex212Lad0jqOuaIXdhhs/IRmz76AXiKWM+zof
	IPNQZApE3ldcRmCujZohtiOJd1wVjL72y633S5D7yICG6jbsKeGudqZBKizI1cDW
	j6KivL8WbDLEIwY1RwhFZA2MCL9WdDl6kHUZQTqkwUl46lmKjGUi8xjUs2/wtcTb
	hF+rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=zGyiuK+quzho3prcYU7OZ3liWXJdezEwmmgKCnG6M
	50=; b=gtMXmnI8b/eaU6BSGK/9zL5qiEVffR9nPHLvF/0IYLCCZPJL1SokhBnhF
	49sNEqZcfmh5AdTuXAbfTY1B+ieQyb/We0yItDpTPN1JUjbmBAjeQkSQoxwLDGf9
	i5n5R2FrkxyAPru+qXjH3gKJ/8IuKFg6h9Y5lhj6VnMx72gtpR/ln8VWApEVJv8i
	ILGocNLeZ2HnZN9QCfpuyaqGtVItjztQB+o4EQASzJkvMh4LoE9EBdadCVq+x1vl
	9T8FMRMw6/U0mDpG3KGAXP0icYEzafMAsY8XhavStvKu91ofZx/VVAYz2NZMnabl
	OB5BeKo+LSeSXowC1I+gyn20ioNnA==
X-ME-Sender: <xms:wPGFYcePEmDdcKQ-wgVMhRbCliWhHwDVOdq7a6rSyorEUMVoZV5U4w>
    <xme:wPGFYeMdfvrf4q_Ik9sHK6yEptI659K8tvl4FyVidWAe_UWRl-d8SM-3oTYa4R4Ln
    94k8It_WPWzLXr-NQ>
X-ME-Received: <xmr:wPGFYdgDMVUpm7tm0M0rpKzV9Eyg6WDOeH70rTCCc2JXz4aHlzyJsy-41Oa0CPz66gV6MEYj9c4IdABbIIVd6U5RDJsGoxO_1aqhoxThoD9dLFrKJo91POAftg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:wPGFYR8fVm-uYnBDlAoqSEJZcpU47ZH5vWDFTgEjuLes_9pDUHTvPQ>
    <xmx:wPGFYYveeJZoJu3vKZbHcTrTKZtyGgaK3Chxgyq7kdK0O8k4OSzsYA>
    <xmx:wPGFYYE_ctxzpiW3YMBW4psdh7PFblebhnXKd4gZFw7rUns59-E8YQ>
    <xmx:wPGFYaKrwxBQVpFIZCoOADv6hlxoN9souavh0-vmtZ2NqZd7fBeuzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:08:47 -0400 (EDT)
Subject: Re: [RFC PATCH 10/13] clk: sunxi: add support for R329 in sunxi DM
 clock driver
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-11-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <a4e681ef-34c5-7162-eead-019e31c8e11d@sholland.org>
Date: Fri, 5 Nov 2021 22:08:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-11-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> Currently only a subset of clocks/resets (similar to other SoCs) are
> supported.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

> ---
>  drivers/clk/sunxi/Kconfig    |  7 +++
>  drivers/clk/sunxi/Makefile   |  1 +
>  drivers/clk/sunxi/clk_r329.c | 94 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk_r329.c
> 
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> index bf084fa7a8..8dd3be4683 100644
> --- a/drivers/clk/sunxi/Kconfig
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -86,6 +86,13 @@ config CLK_SUN50I_H616
>  	  This enables common clock driver support for platforms based
>  	  on Allwinner H616 SoC.
>  
> +config CLK_SUN50I_R329
> +	bool "Clock driver for Allwinner R329"
> +	default MACH_SUN50I_R329
> +	help
> +	  This enables common clock driver support for platforms based
> +	  on Allwinner R329 SoC.
> +
>  config CLK_SUN50I_A64
>  	bool "Clock driver for Allwinner A64"
>  	default MACH_SUN50I
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 4f9282a8b9..050f7ecc46 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -19,4 +19,5 @@ obj-$(CONFIG_CLK_SUN9I_A80) += clk_a80.o
>  obj-$(CONFIG_CLK_SUN8I_H3) += clk_h3.o
>  obj-$(CONFIG_CLK_SUN50I_H6) += clk_h6.o
>  obj-$(CONFIG_CLK_SUN50I_H616) += clk_h616.o
> +obj-$(CONFIG_CLK_SUN50I_R329) += clk_r329.o
>  obj-$(CONFIG_CLK_SUN50I_A64) += clk_a64.o
> diff --git a/drivers/clk/sunxi/clk_r329.c b/drivers/clk/sunxi/clk_r329.c
> new file mode 100644
> index 0000000000..17157214b6
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk_r329.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2021 Sipeed
> + * Based on clk_h616.c, which is:
> + *   Copyright (C) 2021 Jernej Skrabec <jernej.skrabec@siol.net>
> + */
> +
> +#include <common.h>
> +#include <clk-uclass.h>
> +#include <dm.h>
> +#include <errno.h>
> +#include <asm/arch/ccu.h>

This will need to be updated when you rebase:

#include <clk/sunxi.h>

Regards,
Samuel

> +#include <dt-bindings/clock/sun50i-r329-ccu.h>
> +#include <dt-bindings/reset/sun50i-r329-ccu.h>
> +#include <linux/bitops.h>
> +
> +static struct ccu_clk_gate r329_gates[] = {
> +	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
> +	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
> +
> +	[CLK_BUS_UART0]		= GATE(0x90c, BIT(0)),
> +	[CLK_BUS_UART1]		= GATE(0x90c, BIT(1)),
> +	[CLK_BUS_UART2]		= GATE(0x90c, BIT(2)),
> +	[CLK_BUS_UART3]		= GATE(0x90c, BIT(3)),
> +
> +	[CLK_SPI0]		= GATE(0x940, BIT(31)),
> +	[CLK_SPI1]		= GATE(0x944, BIT(31)),
> +
> +	[CLK_BUS_SPI0]		= GATE(0x96c, BIT(0)),
> +	[CLK_BUS_SPI1]		= GATE(0x96c, BIT(1)),
> +
> +	[CLK_BUS_EMAC]		= GATE(0x97c, BIT(0)),
> +
> +	[CLK_USB_PHY0]		= GATE(0xa70, BIT(29)),
> +	[CLK_USB_OHCI0]		= GATE(0xa70, BIT(31)),
> +
> +	[CLK_USB_PHY1]		= GATE(0xa74, BIT(29)),
> +	[CLK_USB_OHCI1]		= GATE(0xa74, BIT(31)),
> +
> +	[CLK_BUS_OHCI0]		= GATE(0xa8c, BIT(0)),
> +	[CLK_BUS_OHCI1]		= GATE(0xa8c, BIT(1)),
> +	[CLK_BUS_EHCI0]		= GATE(0xa8c, BIT(4)),
> +	[CLK_BUS_OTG]		= GATE(0xa8c, BIT(8)),
> +};
> +
> +static struct ccu_reset r329_resets[] = {
> +	[RST_BUS_MMC0]		= RESET(0x84c, BIT(16)),
> +	[RST_BUS_MMC1]		= RESET(0x84c, BIT(17)),
> +
> +	[RST_BUS_UART0]		= RESET(0x90c, BIT(16)),
> +	[RST_BUS_UART1]		= RESET(0x90c, BIT(17)),
> +	[RST_BUS_UART2]		= RESET(0x90c, BIT(18)),
> +	[RST_BUS_UART3]		= RESET(0x90c, BIT(19)),
> +
> +	[RST_BUS_SPI0]		= RESET(0x96c, BIT(16)),
> +	[RST_BUS_SPI1]		= RESET(0x96c, BIT(17)),
> +
> +	[RST_BUS_EMAC]		= RESET(0x97c, BIT(16)),
> +
> +	[RST_USB_PHY0]		= RESET(0xa70, BIT(30)),
> +
> +	[RST_USB_PHY1]		= RESET(0xa74, BIT(30)),
> +
> +	[RST_BUS_OHCI0]		= RESET(0xa8c, BIT(16)),
> +	[RST_BUS_OHCI1]		= RESET(0xa8c, BIT(17)),
> +	[RST_BUS_EHCI0]		= RESET(0xa8c, BIT(20)),
> +	[RST_BUS_OTG]		= RESET(0xa8c, BIT(24)),
> +};
> +
> +static const struct ccu_desc r329_ccu_desc = {
> +	.gates = r329_gates,
> +	.resets = r329_resets,
> +};
> +
> +static int r329_clk_bind(struct udevice *dev)
> +{
> +	return sunxi_reset_bind(dev, ARRAY_SIZE(r329_resets));
> +}
> +
> +static const struct udevice_id r329_ccu_ids[] = {
> +	{ .compatible = "allwinner,sun50i-r329-ccu",
> +	  .data = (ulong)&r329_ccu_desc },
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(clk_sun50i_r329) = {
> +	.name		= "sun50i_r329_ccu",
> +	.id		= UCLASS_CLK,
> +	.of_match	= r329_ccu_ids,
> +	.priv_auto	= sizeof(struct ccu_priv),
> +	.ops		= &sunxi_clk_ops,
> +	.probe		= sunxi_clk_probe,
> +	.bind		= r329_clk_bind,
> +};
> 

