Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16C81B142D
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 23:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864267; cv=none; b=jBQ/dk6dsa2G7PimSi8LYlfqTIBzA2EGJCSp6bq4xo8Pz9ty6njbhmWPZ8gxvVCh8eBaVQtRBI5s4cFDpfZYeS43gQA2qUfb0Q5tYXvLchVrzu89dPQ9UNnH/amGJk2B8S0TZmmppFk2aQ6oXowtfqsPil+TIR5xQkAZKpHbpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864267; c=relaxed/simple;
	bh=Cf7leO0YzJSBjVaL3K714/hL+4ADz7SHJEc7E9WXltM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ub3hbXl6H6jJ/iUo4m04mKq9ezHVJoIThT5yMkqSsTaiBCXvfUrRKeKIUmhT9TKMgifhQuR8skQLk7HGAgWFDBavBOPjmuY2nHGWqKL8vDH6dY4zHgbDQcBAmpwYGdqTLofpCfVRZjIzhXzorKxNllhif48mSV5E6/uOKLz87xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 850731476;
	Mon, 19 Jan 2026 15:10:58 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6F763F632;
	Mon, 19 Jan 2026 15:11:03 -0800 (PST)
Date: Tue, 20 Jan 2026 00:09:57 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Jagan Teki
 <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Paul Kocialkowski <contact@paulk.fr>, Samuel
 Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 2/9] power: regulator: enable AWP318W SPL support
Message-ID: <20260120000957.4843aa84@ryzen.lan>
In-Reply-To: <20260113-01-a733-soc-support-v3-2-f19dcd098f60@gentoo.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
	<20260113-01-a733-soc-support-v3-2-f19dcd098f60@gentoo.org>
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

On Tue, 13 Jan 2026 12:01:56 +0800
Yixun Lan <dlan@gentoo.org> wrote:

Hi,

> Add the descriptions for the DC/DC regulators of the AXP318W, and enable
> it when CONFIG_AXP318W_POWER is enabled.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/power/Kconfig   | 10 ++++++++++
>  drivers/power/Makefile  |  1 +
>  drivers/power/axp_spl.c | 20 ++++++++++++++++++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index d17337c0c3f..1b06d8a66c7 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -58,6 +58,7 @@ choice
>  	default AXP209_POWER if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I
>  	default AXP221_POWER if MACH_SUN6I || MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_R40
>  	default AXP818_POWER if MACH_SUN8I_A83T
> +	default AXP318W_POWER if MACH_SUN60I_A733
>  	default SUNXI_NO_PMIC if MACH_SUNXI_H3_H5 || MACH_SUN50I || MACH_SUN8I_V3S
>  
>  config SUNXI_NO_PMIC
> @@ -140,6 +141,14 @@ config AXP818_POWER
>  	Say y here to enable support for the axp818 pmic found on
>  	A83T dev board.
>  
> +config AXP318W_POWER
> +	bool "axp318w pmic support"
> +	select AXP_PMIC_BUS
> +	select CMD_POWEROFF
> +	---help---
> +	Select this to enable support for the AXP318W PMIC found on some
> +	A733 boards.
> +
>  config SY8106A_POWER
>  	bool "SY8106A pmic support"
>  	depends on MACH_SUNXI_H3_H5
> @@ -154,6 +163,7 @@ config AXP_I2C_ADDRESS
>  	depends on ARCH_SUNXI && !SUNXI_NO_PMIC
>  	default 0x36 if AXP305_POWER
>  	default 0x36 if AXP313_POWER
> +	default 0x36 if AXP318W_POWER
>  	default 0x30 if AXP152_POWER
>  	default 0x34
>  	---help---
> diff --git a/drivers/power/Makefile b/drivers/power/Makefile
> index 3363191fdc8..1a54898c874 100644
> --- a/drivers/power/Makefile
> +++ b/drivers/power/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_AXP152_POWER)	+= axp152.o
>  obj-$(CONFIG_AXP209_POWER)	+= axp209.o
>  obj-$(CONFIG_AXP305_POWER)	+= axp_spl.o
>  obj-$(CONFIG_AXP313_POWER)	+= axp_spl.o
> +obj-$(CONFIG_AXP318W_POWER)	+= axp_spl.o
>  obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
>  obj-$(CONFIG_AXP809_POWER)	+= axp809.o
>  obj-$(CONFIG_AXP818_POWER)	+= axp818.o
> diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
> index 7c51a9b3dfb..b40f13c2261 100644
> --- a/drivers/power/axp_spl.c
> +++ b/drivers/power/axp_spl.c
> @@ -67,6 +67,26 @@ static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
>  #define AXP_SHUTDOWN_REG	0x1a
>  #define AXP_SHUTDOWN_MASK	BIT(7)
>  
> +#elif defined(CONFIG_AXP318W_POWER)				/* AXP318W */
> +
> +static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
> +	{ 0x10, BIT(0), 0x12, 0x1f, 1000, 3400, 100,  0 },

That should be same "NA" symbol as the last entry, but I can fix this
up while committing.

The rest looks fine, so with that fixed, and for the records (and
patchworks):

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +	{ 0x10, BIT(1), 0x13, 0x7f,  500, 1540,  10, 70 },
> +	{ 0x10, BIT(2), 0x14, 0x7f,  500, 1540,  10, 70 },
> +	{ 0x10, BIT(3), 0x15, 0x7f,  500, 1540,  10, 70 },
> +	{ 0x10, BIT(4), 0x16, 0x7f,  500, 1540,  10, 70 },
> +	{ 0x10, BIT(5), 0x17, 0x7f,  500, 1540,  10, 70 },
> +	{ 0x10, BIT(6), 0x18, 0x7f,  500, 1840,  10, 70 },
> +	{ 0x10, BIT(7), 0x19, 0x7f,  500, 1840,  10, 70 },
> +	{ 0x11, BIT(0), 0x1a, 0x7f,  500, 1840,  10, 70 },
> +};
> +
> +#define AXP_CHIP_VERSION	0
> +#define AXP_CHIP_VERSION_MASK	0
> +#define AXP_CHIP_ID		0
> +#define AXP_SHUTDOWN_REG	0x55
> +#define AXP_SHUTDOWN_MASK	BIT(7)
> +
>  #elif defined(CONFIG_AXP305_POWER)				/* AXP305 */
>  
>  static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
> 

