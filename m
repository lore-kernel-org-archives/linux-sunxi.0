Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4D2C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:01:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E5C8D5C01A6;
	Fri,  5 Nov 2021 23:01:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Nov 2021 23:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=b
	tGGnWViORfaJ1G9X29CelAjypoLF26F+CpWzU74NDI=; b=HxXNWRF4zl/P14u6W
	1zXbzFzIYw/iVNi2fZ00jZLZF95c431nm1thdT4cziwy9yyfCU5nWU2xNNJ/691D
	aJvaGcppNkbpnFOnjXxxdwh+632Z6dS6CkAd9pzohxepfsuVaC+zuRArL9l7AAIA
	bMhGeZSPw5ZzBRTiFAr/3GNiBSCjEeHlxaiEFLhBbeHCWc/agbEbL1h1oNPvdqdh
	lrbnL3d6EG8ovp+0uZLeb2508FMgVC8iEM5uFXwA+NwSSPr8RtoreDeMfO0c41Yj
	T++qGjjG8PdsNth8ypIcA7SwPE6lPKTRWNfNxdXop59xzMcM/zqS5aDMkqWT0bl/
	WqJ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=btGGnWViORfaJ1G9X29CelAjypoLF26F+CpWzU74N
	DI=; b=n6XNZTSacr7HwUCnFhY9r2sWsnLC9+Cb01WkCCdwyFHoUmggCu5X+xmZB
	bjMVvNT0yiM1NKsJi/c+GNpzGDnlI0n+73KMy87K+MSRzhuoz8Ze37ui2YsdzQp5
	lUHgI9qWRra1XpmSxc8KkELV4D9wyYAavmAaTBT1xiJDA9W+6NhowotgVtDekckK
	lFOM7z34bTQ5rcMAJZlMYDSS2eIx1Hb/4pHK0FvbQEvGB3EItVlIwBM6qSWz/1hu
	jVtAXyCu630X1oyAXuLRzk7U4ndtNf5+IHZD6k7zD0O1KbDgdCXQCEfaxeAW49dd
	wRgQz/XL39HJITG991hmaKE5Od0BQ==
X-ME-Sender: <xms:GfCFYRo7lwfyEUa5Ztj-ltToKRiLY15kaB4dgeRX2YZhcm7rkQ242A>
    <xme:GfCFYTqia2rWjwsi3zZwgKx5yKN5UH7DAFV660arMavwSSy2OtCHhsdsRqV4V6d5R
    yyHyJ8UHZ6RwgfKkQ>
X-ME-Received: <xmr:GfCFYeOGbNSjFfzc03K6-UEfkkxQ9Xh-d6j0rP8TxLifcxGu74UQm6ng6rvqjGqEhL2qE1ZnxzSy4n0wo4tyvxpmxPvBCvr3wX6LvbS_dKi-0ra0tq5L4nc8-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtjeeiuddugfffveetkeffgeffgedutdfgfeekudevudekffeh
    tdefveeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:GfCFYc7MjGs9rlxRCu14nIlS01rS-iIu3NgtAxtXNtlNTU0y1g1yQg>
    <xmx:GfCFYQ4MIPm1nH39QFPACsLrT_XhH1WimH5eobV8IqaWWQGv7NarZQ>
    <xmx:GfCFYUhSSJ-WP7ApqPChwfQQfBVPUqkQSkX0TrqVWbPb0W9oZ4V0ng>
    <xmx:GfCFYb2wCNjvHW2oWGU9dyW-NmPAnmjuxetjU6Irj60do7glHBwpqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:01:45 -0400 (EDT)
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-7-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 06/13] sunxi: add support for basical pinmux setup on
 R329
Message-ID: <42bdece2-87dd-2377-ae90-e9325e30f677@sholland.org>
Date: Fri, 5 Nov 2021 22:01:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-7-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> Allwinner R329 SoC is the first known Allwinner SoC that has two
> possible pinmux setups for MMC0 controller.
> 
> Support configuration of both setups of MMC0 and UART0 at PB4/5.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  arch/arm/include/asm/arch-sunxi/gpio.h |  3 +++
>  arch/arm/mach-sunxi/Kconfig            |  7 +++++++
>  arch/arm/mach-sunxi/board.c            |  4 ++++
>  board/sunxi/board.c                    | 20 ++++++++++++++++++++
>  4 files changed, 34 insertions(+)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/gpio.h b/arch/arm/include/asm/arch-sunxi/gpio.h
> index 2969a530ae..da9acfab78 100644
> --- a/arch/arm/include/asm/arch-sunxi/gpio.h
> +++ b/arch/arm/include/asm/arch-sunxi/gpio.h
> @@ -166,12 +166,14 @@ enum sunxi_gpio_number {
>  #define SUN8I_A83T_GPB_UART0	2
>  #define SUN8I_V3S_GPB_UART0	3
>  #define SUN50I_GPB_UART0	4
> +#define SUN50I_R329_GPB_UART0	2
>  
>  #define SUNXI_GPC_NAND		2
>  #define SUNXI_GPC_SPI0		3
>  #define SUNXI_GPC_SDC2		3
>  #define SUN6I_GPC_SDC3		4
>  #define SUN50I_GPC_SPI0		4
> +#define SUN50I_R329_GPC_SDC0	3
>  
>  #define SUN8I_GPD_SDC1		3
>  #define SUNXI_GPD_LCD0		2
> @@ -185,6 +187,7 @@ enum sunxi_gpio_number {
>  #define SUNXI_GPF_SDC0		2
>  #define SUNXI_GPF_UART0		4
>  #define SUN8I_GPF_UART0		3
> +#define SUN50I_R329_GPF_SDC0	5
>  
>  #define SUN4I_GPG_SDC1		4
>  #define SUN5I_GPG_SDC1		2
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 49f94f095c..391a3dd9e5 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -672,6 +672,13 @@ config MMC3_CD_PIN
>  	---help---
>  	See MMC0_CD_PIN help text.
>  
> +config MMC0_PINS
> +	string "Pins for mmc0"
> +	default "PF"
> +	depends on MACH_SUN50I_R329
> +	---help---
> +	See MMC1_PINS help text.
> +

Please make this a Boolean MMC0_PINS_PC (this area was changed since you
sent these patches).

>  config MMC1_PINS
>  	string "Pins for mmc1"
>  	default ""
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index e979e426dd..1aa31c7e05 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -129,6 +129,10 @@ static int gpio_init(void)
>  	sunxi_gpio_set_cfgpin(SUNXI_GPH(0), SUN50I_H616_GPH_UART0);
>  	sunxi_gpio_set_cfgpin(SUNXI_GPH(1), SUN50I_H616_GPH_UART0);
>  	sunxi_gpio_set_pull(SUNXI_GPH(1), SUNXI_GPIO_PULL_UP);
> +#elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN50I_R329)
> +	sunxi_gpio_set_cfgpin(SUNXI_GPB(4), SUN50I_R329_GPB_UART0);
> +	sunxi_gpio_set_cfgpin(SUNXI_GPB(5), SUN50I_R329_GPB_UART0);
> +	sunxi_gpio_set_pull(SUNXI_GPB(5), SUNXI_GPIO_PULL_UP);
>  #elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN8I_A83T)
>  	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN8I_A83T_GPB_UART0);
>  	sunxi_gpio_set_cfgpin(SUNXI_GPB(10), SUN8I_A83T_GPB_UART0);
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 67acc01d83..bfc90345d9 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -417,12 +417,32 @@ static void mmc_pinmux_setup(int sdc)
>  
>  	switch (sdc) {
>  	case 0:
> +#if defined(CONFIG_MACH_SUN50I_R329)

Please use if (IS_ENABLED(...)).

Regards,
Samuel

> +		pins = sunxi_name_to_gpio_bank(CONFIG_MMC0_PINS);
> +
> +		if (pins == SUNXI_GPIO_C) {
> +			/* SDC0: PC0-PC6 */
> +			for (pin = SUNXI_GPC(0); pin <= SUNXI_GPC(6); pin++) {
> +				sunxi_gpio_set_cfgpin(pin, SUN50I_R329_GPC_SDC0);
> +				sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
> +				sunxi_gpio_set_drv(pin, 2);
> +			}
> +		} else {
> +			/* SDC0: PF0-PF5 */
> +			for (pin = SUNXI_GPF(0); pin <= SUNXI_GPF(5); pin++) {
> +				sunxi_gpio_set_cfgpin(pin, SUN50I_R329_GPF_SDC0);
> +				sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
> +				sunxi_gpio_set_drv(pin, 2);
> +			}
> +		}
> +#else
>  		/* SDC0: PF0-PF5 */
>  		for (pin = SUNXI_GPF(0); pin <= SUNXI_GPF(5); pin++) {
>  			sunxi_gpio_set_cfgpin(pin, SUNXI_GPF_SDC0);
>  			sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
>  			sunxi_gpio_set_drv(pin, 2);
>  		}
> +#endif
>  		break;
>  
>  	case 1:
> 

