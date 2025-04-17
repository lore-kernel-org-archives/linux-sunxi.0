Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177EC1A3178
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 03:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744861189; cv=none; b=U3LpsebG4eF5p9d77ntoBL2kg35zUJv906k8ELqau0LGwcjWX5iHjUPRKNNIGOkvZZ1bnYJx78Gu/8svi1uMMIX5mcvXZgrbn+o/M/jllpHGLKImR/Ez4uep5FSgQDcfINzU8v4tmiI+0v5/ltCh8//P1wGPrxBMsEq8i7xLz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744861189; c=relaxed/simple;
	bh=Xl+cNR3nxOM2hVI2clp/nqiHa6xkhaKt2K3YjhaQrnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEI5bjVN8/KCnTL9UokXVH9XSGb6TKJ5C9ArLT3yif85dC3lQQImnpOSg1ygkX4IY0su8VQQOqAAnT6FBY+jcNBPqvyfu6Fxwu1IyAYrmBlTdW8ArKmWuqhs/qXJiFw7U/cFmy8haCQ681Wiguh2NxAjFChwYWKXYX6kW0a4hsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 998FE343142;
	Thu, 17 Apr 2025 03:39:46 +0000 (UTC)
Date: Thu, 17 Apr 2025 03:39:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] sunxi: add "fake" FEL pin support
Message-ID: <20250417033935-GYA34332@gentoo>
References: <20250417000539.3709-1-andre.przywara@arm.com>
 <20250417000539.3709-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417000539.3709-3-andre.przywara@arm.com>

Hi Andre,

On 01:05 Thu 17 Apr     , Andre Przywara wrote:
> Some boards with Allwinner SoCs feature a "FEL" key, sometimes also
> labelled "uboot", which triggers the BootROM FEL mode, when pressed upon
> power-on or reset. This allows to access the SoC's memory via USB OTG,
> and to upload and execute code. There is a tool to upload our U-Boot image
> and immediately boot it, when the SoC is in FEL mode.
> 
> To mimic this convenient behaviour on boards without such a dedicated key,
> we can query a GPIO pin very early in the SPL boot, then trigger the
> BootROM FEL routine.  There has not been much of a SoC or board setup at
> this point, so we enter the BROM in a rather pristine state still. On
> 64-bit SoCs the required AArch32 reset guarantees a clean CPU state anyway.
> 
> Any GPIO can be used for that, the signal is expected to be active low,
> consequently we enable the pull-up resistors for that pin. A board (or a
> user) is expected to specify the GPIO name using the
> CONFIG_SUNXI_FAKE_FEL_PIN Kconfig variable. When this variable is not set,
> the compiler will optimise away the call.
> 
> Call the code first thing in board_init_f(), which is the first sunxi
> specific C routine.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
>  arch/arm/mach-sunxi/board.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index ab432390d3c..f1cfdb548bc 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -825,6 +825,16 @@ config USB3_VBUS_PIN
>  	---help---
>  	See USB1_VBUS_PIN help text.
>  
> +config SUNXI_FAKE_FEL_PIN
> +	string "fake FEL GPIO pin"
> +	default ""
> +	---help---
> +	Define a GPIO that shall force entering FEL mode when a button
> +	connected to this pin is pressed at boot time. This must be an
> +	active low signal, the internal pull-up resistors are activated.
> +	This takes a string in the format understood by sunxi_name_to_gpio,
> +	e.g. PH1 for pin 1 of port H.
> +
>  config I2C0_ENABLE
>  	bool "Enable I2C/TWI controller 0"
>  	default y if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUN8I_R40
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index 701899ee4b2..4ee0b333176 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -457,8 +457,39 @@ u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>  	return result;
>  }
>  
> +static void check_fake_fel_button(void)
> +{
> +	u32 brom_entry = 0x20;
> +	int pin, value, mux;
> +
> +	/* check for empty string at compile time */
> +	if (sizeof(CONFIG_SUNXI_FAKE_FEL_PIN) == sizeof(""))
use 'sizeof("")' to express it's an empty string _explicitly_? 
otherwise, I'd prefer '0' simply (save few chars)..

> +		return;
> +
> +	pin = sunxi_name_to_gpio(CONFIG_SUNXI_FAKE_FEL_PIN);
> +	if (pin < 0)
> +		return;
> +
> +	mux = sunxi_gpio_get_cfgpin(pin);
> +	sunxi_gpio_set_cfgpin(pin, SUNXI_GPIO_INPUT);
...
> +	sunxi_gpio_set_pull(pin, SUNXI_GPIO_PULL_UP);
it seems this doesn't work for me.

while I'm testing on A527, using pin PD6 (GPIO4_D6 in schematic)
it goes directly to FEL mode, not sure if I setup things wrong..
CONFIG_SUNXI_FAKE_FEL_PIN="PD6"

> +	value = gpio_get_value(pin);
> +	sunxi_gpio_set_cfgpin(pin, mux);
> +
> +	if (value)
> +		return;
> +
> +	/* Older SoCs maps the BootROM high in the address space. */
> +	if (fel_stash.sctlr & BIT(13))
> +		brom_entry |= 0xffff0000;
> +
> +	return_to_fel(0, brom_entry);
> +}
> +
>  void board_init_f(ulong dummy)
>  {
> +	check_fake_fel_button();
> +
this isn't a problem, I can understand calling it here will make board
enter FEL mode as early as possible..

just wondering if better to move this function after preloader_console_init(),
and log out a message to let user know explicitly - entering FEL mode from SPL..
(I personally find it helpful)

but, if you prefer not to change, then fine by me..

>  	sunxi_sram_init();
>  
>  	/* Enable non-secure access to some peripherals */
> -- 
> 2.46.3
> 

-- 
Yixun Lan (dlan)
