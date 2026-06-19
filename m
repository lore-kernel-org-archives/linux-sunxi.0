Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B706B30E0FD
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jun 2026 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880637; cv=none; b=KoioonBrDlaUYw03RBrcHr0KWIkYwV/+MDHMcI4l/x+T3I4+y9NNXSd7I2X4jWswR0thZrcg1gjPp/qMArmeAgtTTDMcz083aizNw54UcoPFIE7VsGggZv4WsN8EmuBDgPOzfb6pPQAP59QwkpBSpfLDSqw735iYtFTK3uhUrKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880637; c=relaxed/simple;
	bh=xkeTN0idoqNVUgzIK5XLtbG4MKIjUrD7HtzFFf2iWH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=gNKVm4H5JKFpP6WeAUg6+V6gdpOkL+cVm3qKVXjruTuZE/+yEMn5tshXIyzYCgT9cNVHxA7U4naUPklmwq6zFmAm9CHTHd+1rblkBYvEwNNZsbjRYXu3hZZ//BY2d+KRVf/akSv9W3kHtwi1nzvujZYbbF55HugGXSArLi3ET40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jT/YbhiE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jT/YbhiE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C1D326B9;
	Fri, 19 Jun 2026 07:50:29 -0700 (PDT)
Received: from [10.1.26.191] (e142021.arm.com [10.1.26.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F393F62B;
	Fri, 19 Jun 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781880633; bh=xkeTN0idoqNVUgzIK5XLtbG4MKIjUrD7HtzFFf2iWH4=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=jT/YbhiENLBam+PERa1Jw1bhJ0SYdSU7IUMRl1ENXf/ssozAJ+37QFmuAi6b2FQwa
	 NTOK8IWAwV501mwQ2nCR146ocrnOgT2rY9DPQ4eOVEdNQ8ItE2vqcFaIHY+W3A8hx2
	 xsHAXgadVhxWDzO/P0P2DP61oRtszk3gKcp8YfjA=
Message-ID: <2e9b4819-de5c-49ca-a42a-241cf11ef62b@arm.com>
Date: Fri, 19 Jun 2026 15:50:30 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: axp: Add support for devicetree
To: Denis Burkov <hitechshell@mail.ru>, u-boot@lists.denx.de
References: <20260121115437.31406-1-hitechshell@mail.ru>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260121115437.31406-1-hitechshell@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

thanks for sending this patch!

On 1/21/26 12:54, Denis Burkov wrote:

I am afraid you need to put some commit message in here. You can refer 
to the comment you are removing, so that there *is* now DT support for 
the AXP GPIOs. But also please mention what this fixes - why do we need 
this patch? If you can provide an example usage, it would be easier to 
take this patch.

> Signed-off-by: Denis Burkov <hitechshell@mail.ru>
> ---
>   board/sunxi/board.c     |  4 ----
>   drivers/gpio/axp_gpio.c | 28 +++++++++++-----------------
>   2 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 2929bc17f08..3c61bfb8822 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -226,10 +226,6 @@ int board_init(void)
>   	}
>   #endif /* !CONFIG_ARM64 && !CONFIG_MACH_SUNIV */
>   
> -	ret = axp_gpio_init();
> -	if (ret)
> -		return ret;
> -
>   	eth_init_board();
>   
>   	return 0;
> diff --git a/drivers/gpio/axp_gpio.c b/drivers/gpio/axp_gpio.c
> index 181c53bfe72..1c5882a25d4 100644
> --- a/drivers/gpio/axp_gpio.c
> +++ b/drivers/gpio/axp_gpio.c
> @@ -98,35 +98,29 @@ static const struct dm_gpio_ops gpio_axp_ops = {
>   
>   static int gpio_axp_probe(struct udevice *dev)
>   {
> +	int ret;
>   	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
>   
>   	/* Tell the uclass how many GPIOs we have */
>   	uc_priv->bank_name = AXP_GPIO_PREFIX;
>   	uc_priv->gpio_count = AXP_GPIO_COUNT;
>   
> +	ret = pmic_bus_init();
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> +static const struct udevice_id gpio_axp_match[] = {
> +	{ .compatible = "x-powers,axp209-gpio" },

Why is it only this compatible string? What about the others? I guess 
the driver was just not enabled on newer AXPs before?
Can you maybe look what it takes to support the other PMICs? If you look 
at the Linux driver, that's mostly about what pins each AXP supports.

And peeking into the driver here, there are some #ifdef's in there 
(AXP_GPIO[23]_CTRL), I think now collides with the DT description, and 
whatever this was doing should be detected at runtime, potentially by 
supporting multiple compatible strings.

Cheers,
Andre

> +	{ }
> +};
> +
>   U_BOOT_DRIVER(gpio_axp) = {
>   	.name	= "gpio_axp",
>   	.id	= UCLASS_GPIO,
> +	.of_match = gpio_axp_match,
>   	.ops	= &gpio_axp_ops,
>   	.probe	= gpio_axp_probe,
>   };
> -
> -int axp_gpio_init(void)
> -{
> -	struct udevice *dev;
> -	int ret;
> -
> -	ret = pmic_bus_init();
> -	if (ret)
> -		return ret;
> -
> -	/* There is no devicetree support for the axp yet, so bind directly */
> -	ret = device_bind_driver(dm_root(), "gpio_axp", "AXP-gpio", &dev);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}

