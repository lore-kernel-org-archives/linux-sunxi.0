Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B4E207DEB
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664880; cv=none; b=f22hheIa8WDdzZq9HX37QhWFBg5TPXclE1RkpimIhhfyPOf0zrZy5o8vQ0uiP6fkjgM7AeBkDppswPOKqKPjtG9z2OKGLaSbCKpQx+gYU00tVnPUisZbeADvzXLo5PvXldjN7KwjkRJIxtGgdbdqexWb5ySMSUo2OvtVTas2dWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664880; c=relaxed/simple;
	bh=0gQE08bsk//WU3o4NJ7B2ZzVgPjBSesTgn0Wh9Vy0Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ACJeEMy3Rz6fA4xl1Y9PCsM19Bh3f6F1Tutg0TPPA7uK1ToDqWAlbzWEC0MSN5Sc6Sbm95sw/lawZw+izUDJYZg9TzKTdV/I1rxAj1nlYugmDViIBU7SD7V6uB3dW8gXUQdMks5XmpEjQVYI3V2Ztz5uSZrUPRrqn+Hb1KaA+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 257F211FB;
	Tue,  4 Feb 2025 02:28:20 -0800 (PST)
Received: from [10.1.25.176] (e134369.arm.com [10.1.25.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948313F63F;
	Tue,  4 Feb 2025 02:27:55 -0800 (PST)
Message-ID: <5c2f4f75-d49e-4514-80d1-bfd250b99d11@arm.com>
Date: Tue, 4 Feb 2025 10:27:50 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
To: Regis Dargent <regis.dargent@gmail.com>, linux-sunxi@lists.linux.dev
References: <20250203171955.5858-1-regis.dargent@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250203171955.5858-1-regis.dargent@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Regis,

first: can you say which version of U-Boot this should apply against? I 
cannot find a struct watchdog_info anywhere in the mainline source.

But more importantly:

On 03/02/2025 17:19, Regis Dargent wrote:
> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (on my Allwinner H616).

This is expected. The probe routine does this to reset the watchdog.
The reason it stays disabled is CONFIG_WATCHDOG_AUTOSTART, which 
defaults to "n" on sunxi, see commit 86798ee0c148 for the reasons.
Also there were mailing list threads with more background info:

https://lore.kernel.org/u-boot/20211109220953.57b94ce8@slackpad.fritz.box/
https://lore.kernel.org/u-boot/20211109101901.24015-1-heinrich.schuchardt@canonical.com/

So long story short: if you really want to enable the watchdog in your 
particular case, you should just configure CONFIG_WATCHDOG_AUTOSTART to 
"y", in your local config.

Cheers,
Andre

> This avoids automatic reboot in case a problem occurs during boot (and for example handling in the bootloader).
> 
> The driver should detect if the HW watchdog is already running during probe and set its appropriate status bit to allow the kernel to handle the watchdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device configuration.
> By default, the kernel will then ping the HW watchdog at apropriate frequency, but the user can have it stop after a time with open_timeout parameter.
> 
>   drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
>   	return 0;
>   }
>   
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +	u32 reg;
> +	void __iomem *wdt_base = wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
> +
> +	reg = readl(wdt_base + regs->wdt_mode);
> +	return (reg & WDT_MODE_EN);
> +}
> +
>   static const struct watchdog_info sunxi_wdt_info = {
>   	.identity	= DRV_NAME,
>   	.options	= WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
>   	sunxi_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
>   	sunxi_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
>   	sunxi_wdt->wdt_dev.parent = dev;
> +	if (sunxi_wdt_enabled(sunxi_wdt)) {
> +		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +	} else {
> +		clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +	}
>   
>   	watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>   	watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
>   
>   	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>   
> -	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +	else
> +		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
>   
>   	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>   	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

