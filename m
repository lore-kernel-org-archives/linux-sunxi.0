Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDD3537DA
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Mar 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772961633; cv=none; b=IwXD5425Tk+1PWyMO3tNj9PBJFuM25rclylSD2mSHukBOuvHiuG+uJnigJZiH7QVKd1GK8FpNaN1qJI9eNVqyTonOIwRtaJ/su4OhcK3LCArqvzDxtY9MaeN/TVZofLL5WXvl0Zro0E7pVMYNWmcCnaaPF6Rb62EryDf00QYo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772961633; c=relaxed/simple;
	bh=0LZDtn8JtPRJMlCx1W8pvuWB7H8Xp1Sg7TEx3GBZpOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpeQqCBwc3FYRFtpehbZcZNkQb+myJnKV75iflVd+J/J4KQ2dLQoNdeO4eldSTgm+JWEciNT/ZFGt4xVGNVX5RDm16kLJAL4sL5/pH5uQv6QzrTWo7B2VFwD6hCjjAkTJgqKpSQGsPQlGNdewtvyxpBhOOIXbKihuUJnlhODlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1E99pZk; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1E99pZk"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1722060285a.2
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Mar 2026 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772961631; x=1773566431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=S1E99pZk+fdOE7gJudogsipG0SjM0tS8fHq2zYUB0NwSRarFslqdfu9cvFTHmPO8wO
         S8fTuS5GKMZXhjJ22mx76AGo8R+O9qPqrmAu155dPICw6gjqmOf0Ikry7GKfekJXoYaZ
         qWndxdzrPrBKu+MPc8kJvIGhYEpMRWM/xDA0rPq3jDTzs7/Jv4Qp8Ff+QpLoPFukfU8z
         EN4LeQDiqDzpJ2sQaDzRjK3n5e3j4jCDyEQU958mA8o3kNqjt03KUtm7ZfhKBVXm+P1D
         iinfSYikwy7MGjXPk8AfqLwTJA8GP94CRTU4ozvIwi5fBBaIUVdTvmowET/KMWKt1Tbe
         zG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772961631; x=1773566431;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=BVGKbgu8SSovtjXMc9e5Pffiboqo61AP/9hdA0et1EIr759QTmQag0FWyC4tYKxHjm
         UQpRaJc0hw76KXECQsFhdxn+l/L+K9Zga6vtmyXP+VOtCtJR3QU6BYNXRWpr6fE4FwI1
         e9+QZ0NUOCAJBtV3Fl4+HdYl0zL7K1Qs6KODm8eWvpeCi4BqVjW6/FW9u8fGQrtx+ysj
         r4P8XuZm3VhJwjXKzQGtQyfeznW8DnGbMi/KCqcdR6qAiStUwB4uiA5iML8CP/wVM9bS
         ijUY293NZw2Aaczso7HFWw5HQiNGJp8OfVkFMovhCrMOrmuhzkk6ozTtqJUhRRwU2lvJ
         xqwA==
X-Forwarded-Encrypted: i=1; AJvYcCUqtXrpslAgujfqEUfxPKpXrXZIPIlO9dgubqsDhs0oVNlB1mDcI7MUFsdcYu6vpDCYIe6mQCe8OcDQmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCTsB4qbrO31jHPHXozJGwHlF5M+OejnG6yO47umGXr+zz/u9k
	0B76Dmo4lPd+33Dj+UDsW0kGzbztiK/UGz3uY51pE06Ef+UdJ2FzB8+T
X-Gm-Gg: ATEYQzyw13RBHfv/AGm8CzaYQsPbTipGtqr4cGrjoO08SqaB4b/3BKENiVlLtvpxLkn
	kBEjc5fwKktaIY+fc27zDAXrk9WVa4kiWmrdYXgkPFKohFwwRsziiMI/a+0rIOYBbjr+urOe2j1
	DtyNXSEn6xbmOaw7MrJhLKIk6tGqecLL2YVQh/SQVNFfVVoy8b5xMfpS8Qwtonu88aZaL5o+qTR
	FSPC0dxFN0D+g/NPFQh8rOkQGQp5VQ0oDAG6vatLPzwNjegBRElFCfrItMrgwbm+JTpqL6z9C49
	zQnPCnS8vX7RKuOOwAuD5VpEh4i8O0dXRQ0Np/1nZxGpGlmbkahtBopiQYegzUTgOIJI7Pfn6VT
	2kFMGh0UEMKv9322/nvnKv4qIYYFOTSjuGyD5LecFnzhuOxpNBORGnqsf9i3MvEmVp7CvJzNk4f
	nMuRA16brf2kdF/NvogQQHu0vemSR8
X-Received: by 2002:a05:6214:248b:b0:89a:929:9e4e with SMTP id 6a1803df08f44-89a30a174cbmr113884606d6.14.1772961630635;
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316da67esm51697736d6.25.2026.03.08.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Date: Sun, 8 Mar 2026 12:20:28 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <aa0_XDMMtReKQ0Vh@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260224092419.1275016-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224092419.1275016-1-wens@kernel.org>

On 26-02-24 17:24, Chen-Yu Tsai wrote:
> After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> a warning will be printed if the gpio driver does not implement this
> callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> sanitize the return value of gpio_chip::get_direction()"), but was
> masked by the "redundant" check.
> 
> The warning can be triggered by any action that calls the callback,
> such as dumping the GPIO state from /sys/kernel/debug/gpio.
> 
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Please merge for fixes.
> 
> Changes since v1:
> - Corrected commit attribution for the warning
> - Add example scenario that triggers the warning
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..27b2a3e9d78d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
>  	return NULL;
>  }
>  
> +static struct sunxi_desc_function *
> +sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
> +						const u16 pin_num,
> +						const u8 muxval)
> +{
> +	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
> +		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
> +		struct sunxi_desc_function *func = pin->functions;
> +
> +		if (pin->pin.number != pin_num)
> +			continue;
> +
> +		if (pin->variant && !(pctl->variant & pin->variant))
> +			continue;
> +
> +		while (func->name) {
> +			if (func->muxval == muxval)
> +				return func;
> +
> +			func++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> @@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.strict			= true,
>  };
>  
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	const struct sunxi_desc_function *func;
> +	u32 pin = offset + chip->base;
> +	u32 reg, shift, mask;
> +	u8 muxval;
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> +	if (!func)
> +		return -ENODEV;


This change introduces regression in linux-next. Several drivers on
Allwinner A64 fail to probe. For example,

 gpio gpiochip1: (1c20800.pinctrl): gpiochip_lock_as_irq: cannot get GPIO direction
 sun50i-a64-pinctrl 1c20800.pinctrl: unable to lock HW IRQ 69 for IRQ
 genirq: Failed to request resources for inv_mpu (irq 163) on irqchip sunxi_pio_edge

inv_mpu6050_i2c tries to get interrupt without initializing gpio before.

muxval in the case of uninitialized gpio is 0x7 (IO Disable) and
returned func value is NULL.


Some pinctrl return error for alternate configuration. For example,
pinctrl-stm32 returns -EINVAL [1].


But other drivers return one of non-error values.

pinctrl-axp209 defaults to GPIO_LINE_DIRECTION_OUT [2] 
        /*
	 * This shouldn't really happen if the pin is in use already,
	 * or if it's not in use yet, it doesn't matter since we're
	 * going to change the value soon anyway. Default to output.
	 */
	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
		return GPIO_LINE_DIRECTION_OUT;

pinctrl-upboard defaults to GPIO_LINE_DIRECTION_IN [3].
       /* If the pin is in function mode or high-z, input direction is
       returned */


pinctrl-rza2 defaults to GPIO_LINE_DIRECTION_IN as well [4].
        /*
	 * This GPIO controller has a default Hi-Z state that is not input or
	 * output, so force the pin to input now.
	 */


Should default be here GPIO_LINE_DIRECTION_IN here as well instead of -ENODEV?

> +	if (!strcmp(func->name, "gpio_out"))
> +		return GPIO_LINE_DIRECTION_OUT;
> +	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
> +		return GPIO_LINE_DIRECTION_IN;
> +	return -EINVAL;



Alternative solution would be converting handling of return value in
gpiochip_lock_as_irq to warning level. Since the value dir isn't
used. The call flushes the direction setting if something changed
behind our back. [5]

--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4107,11 +4107,9 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
        if (!gc->can_sleep && gc->get_direction) {
                int dir = gpiod_get_direction(desc);
 
-               if (dir < 0) {
-                       gpiochip_err(gc, "%s: cannot get GPIO direction\n",
+               if (dir < 0)
+                       gpiochip_warn(gc, "%s: cannot get GPIO direction\n",
                                     __func__);
-                       return dir;
-               }
        }


1. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/stm32/pinctrl-stm32.c#L437
2. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-axp209.c#L175
3. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-upboard.c#L840
4. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/renesas/pinctrl-rza2.c#L148
5. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/gpio/gpiolib.c#L4084

-- 
Best regards,
Andrey Skvortsov
