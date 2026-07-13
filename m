Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956934266B3
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948675; cv=none; b=BzR8wB5gt+dNtbWZilSceekP/vvN10EzhkjpA1JJ8Gx7PUfBj1KEanCMLOesohf/wdfeBgdTVDjnsLcrkRdeovNnkTVp4aW7HVBbgK+EM0BSUT2QPeLVYVabs90G5N7IJOuv8S4ZF0+ZvXr9vJbehteUsp7d8kDYtSEvUGpoLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948675; c=relaxed/simple;
	bh=oz04jqY7ntQrG/gxkd6lBFU+FO1XOuaVAH/6aBGwzuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aS/DJ5LpyW39wjtHoVsQl4Rm1gE2XnRZwtbXexuTABoVt3mAjM5dSV53rcgHJq6bXd72S+w3fTPRv9iDgRMKV6E20JkDcJWSEr8x2cS+C9ONBAiEoZct0iGtjgCs83CroW9JWOHjFJkn4ymdCzxn0peSYPvD7tQSI2z4pgF8t3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGQ7yhlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGQ7yhlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8871F00A3A;
	Mon, 13 Jul 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948674;
	bh=ldcdFpOs/xTBr8wNQsN2JD/tV/ZMSvg5zmFQBw7ikHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eGQ7yhlzbqw/flT7UupPX0xZsTOJJqNPQUsbARqv5Qx5KM4lGeRdpuONNRJQQZjMs
	 9E0Y0aY2QmeJfI5/oUDmVXf0UztlfVFWiCx1KyxrTIL8diqVKr2ykoOQqpiVvhMy+R
	 /c8wynFlgHJUzU8j5jzSeBHt87Vu6SP7QIOlfSrJSrqBqCZwOjLA/5k2L5NwC5GLEA
	 Xmy3K/kZUaBnSkc4R5KyhNAkYJT0WTV/bUrbhQHROEm4PEM2/chhc20X5DwGKLx7Q1
	 BD5jI3v6exJdV7rzDdktuwp5+V0Wzmt7YiZh6oMKOcyHf4vTOGVAVIs6t+GFClta5T
	 j6HRxfdYD8aiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clocksource: Remove redundant dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260713130740.293502-1-panchuang@vivo.com>
References: <20260713130740.293502-1-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:17:53 +0000
Message-Id: <20260713131754.4B8871F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `devm_request_irq()` fails, the driver exits with an error with=
out unregistering the clockevent device, leaving a dangling pointer in the =
global clockevents subsystem which leads to a use-after-free.
--

--- Patch [1]: [PATCH] clocksource: Remove redundant dev_err()/dev_err_prob=
e() ---
commit 6abdbb5acc54b54b2834aaea50a1948deb00002c
Author: Pan Chuang <panchuang@vivo.com>

clocksource: Remove redundant dev_err()/dev_err_probe()

This commit removes redundant driver-specific error logging following
devm_request_irq(), since the core function now automatically logs detailed
error messages on failure.

[ ... ]

> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/time=
r-sun5i.c
> index 6ab300d226215..bcf155fb9cac2 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -247,10 +247,8 @@ static int sun5i_setup_clockevent(struct platform_de=
vice *pdev,
>  	ret =3D devm_request_irq(dev, irq, sun5i_timer_interrupt,
>  			       IRQF_TIMER | IRQF_IRQPOLL,
>  			       "sun5i_timer0", ce);
> -	if (ret) {
> -		dev_err(dev, "Unable to register interrupt\n");
> +	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying this
error path, does this return leave a dangling pointer in the clockevents
subsystem?

In sun5i_setup_clockevent(), clockevents_config_and_register() is called
just prior to devm_request_irq() to register the clockevent on the global
list. If the IRQ request fails, the function returns immediately without
unregistering the clockevent device.

Since the struct sun5i_timer is managed by devres, it is freed when the
probe fails, potentially leading to a use-after-free when the clockevents
core evaluates or iterates over its global list.

Should this path unregister the clockevent on failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130740.2935=
02-1-panchuang@vivo.com?part=3D1
