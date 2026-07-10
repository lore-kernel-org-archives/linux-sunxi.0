Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79FEED8
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682374; cv=none; b=bLEL/x+GCFR4+bp3/uCpHxIfYUeG/CSzBm4pbprJ4WVdYKDItecV0FL9j60bb2vKMxoI1a008BpAdRXQJCHSZQizLOrwTxewdu8h0n7SDUoYMGkpxQ2ilHwNVlRChFp/bfFdY+S+49ufGUge9JJBdNS0Mdd/lB+qthCnFdeqBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682374; c=relaxed/simple;
	bh=3Zu8aXcwHqIBgO4+yTMtQJAkQGbH03UlFCny3Bb4E60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IXS7BqHOgmHfoGYDMj6gVLBg1b2pQ7NcPwgXirn4wmTYJgvNEeYf03ObiO1qN9qbabQ4yoVKDD8c4w6S+Gdfg9fY53i/i8siEQTOZ7udu5E9Z0DeJwxR3h63g6YvEFhGv9FODuPqQB9aLMStrjsA4FQnc3qmZ2ceOPVj85ZDP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmthUv29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmthUv29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06F71F000E9;
	Fri, 10 Jul 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682360;
	bh=J8fq+fr1opYbocZX7ZFH/N7cPzl8QfB9Eacgl8kHuLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmthUv29jSZ9G6v2Xiwo5+Mkp/3CjxxS4V/P0GcdvaXnbSb7SfWxAKN9sLk9TLa9n
	 ehR2uiwSDmTJKej83QxkcEq9TGDAIYzk9KGMJ5mZ8ii2MOOWjggU6bR2zN11Aq+3rh
	 a/a+ujNygGR09sBmDeDdD9Btsf8rCB/MmCU5ZEclMe7fEyvPLAz0ZLQoXw9JkjD5Eh
	 pBNIGq+MU9XXmQ8/X76f7TgoAeYEeQztqnVLlsOP+SR+FHHdqzYNNVSxS+RUrjp8GK
	 6AfGomu70lcjw16Pcuy6c74HzldLLHi7m1ZPpItdsLAhF0+OXP0QyyVcHTTBJQAGH8
	 M2cMsrKSsHOdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] bus: Remove redundant dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260710110930.462109-3-panchuang@vivo.com>
References: <20260710110930.462109-1-panchuang@vivo.com>
 <20260710110930.462109-3-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:19:20 +0000
Message-Id: <20260710111920.A06F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled negative error code from platform_get_irq() in omap_l3_n=
oc is passed directly to devm_request_irq(), masking the original error and=
 breaking probe deferral.
- [High] IRQ is requested and enabled before hardware clock and reset initi=
alization in sunxi-rsb, risking synchronous bus aborts.
- [High] The IRQ handler in sunxi-rsb remains registered after the device's=
 clock is disabled during driver removal, risking a fatal crash on spurious=
 interrupts.
- [Medium] Use of a static struct pointer in the probe function of omap_l3_=
noc leads to a race condition and data corruption on concurrent device prob=
es.
--

--- Patch [2]: [PATCH 2/2] bus: Remove redundant dev_err()/dev_err_probe() =
---
commit 78c3bde11117dc0a88b0af99a88dd1bbb4e58713
Author: Pan Chuang <panchuang@vivo.com>
   =20
bus: Remove redundant dev_err()/dev_err_probe()
   =20
Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.
   =20
> diff --git a/drivers/bus/omap_l3_noc.c b/drivers/bus/omap_l3_noc.c
> index eb1ba6319fdaf..45f3f793976c5 100644
> --- a/drivers/bus/omap_l3_noc.c
> +++ b/drivers/bus/omap_l3_noc.c
> @@ -278,17 +278,12 @@ static int omap_l3_probe(struct platform_device *pd=
ev)
>  	l3->debug_irq =3D platform_get_irq(pdev, 0);
>  	ret =3D devm_request_irq(l3->dev, l3->debug_irq, l3_interrupt_handler,
>  			       IRQF_NO_THREAD, "l3-dbg-irq", l3);

[Severity: Medium]
This isn't a bug introduced by this patch, but could the use of the l3 poin=
ter
here lead to cross-linked interrupts or data corruption on concurrent probe=
s?

Looking at omap_l3_probe(), the l3 pointer is declared as a static struct:

static int omap_l3_probe(struct platform_device *pdev)
{
        ...
        static struct omap_l3 *l3;
        ...
        l3 =3D devm_kzalloc(&pdev->dev, sizeof(*l3), GFP_KERNEL);

If two instances are probed concurrently, one thread's allocation could
overwrite the other's before it is passed to devm_request_irq().

[Severity: High]
This is also a pre-existing issue, but does passing an unhandled negative
error code from platform_get_irq() directly into devm_request_irq() mask
probe deferral errors?

If platform_get_irq() returns -EPROBE_DEFER, passing it as an unsigned int
to devm_request_irq() will result in a permanent -EINVAL failure. Since
this patch causes devm_request_irq() to log the -EINVAL on failure, this
could also unnecessarily log errors in the kernel during probe deferral.

> -	if (ret) {
> -		dev_err(l3->dev, "request_irq failed for %d\n",
> -			l3->debug_irq);
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	l3->app_irq =3D platform_get_irq(pdev, 1);
>  	ret =3D devm_request_irq(l3->dev, l3->app_irq, l3_interrupt_handler,
>  			       IRQF_NO_THREAD, "l3-app-irq", l3);
> -	if (ret)
> -		dev_err(l3->dev, "request_irq failed for %d\n", l3->app_irq);
> =20
>  	return ret;
>  }
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index daf0ea563e477..671c9b33e783a 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -787,8 +787,7 @@ static int sunxi_rsb_probe(struct platform_device *pd=
ev)
> =20
>  	ret =3D devm_request_irq(dev, irq, sunxi_rsb_irq, 0, RSB_CTRL_NAME, rsb=
);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "can't register interrupt handler irq %d\n", irq);
> +		return ret;
> =20
>  	ret =3D sunxi_rsb_hw_init(rsb);

[Severity: High]
This is a pre-existing issue, but does registering the IRQ handler before
sunxi_rsb_hw_init() enables the clock and clears the reset risk a
synchronous external abort?

If an interrupt is already pending from a previous boot stage, the
sunxi_rsb_irq handler will execute immediately. Because the clocks are
gated and the device is in reset, reading the device registers inside the
handler could crash the system.

[Severity: High]
This is another pre-existing issue related to the devm_request_irq() usage.
Does the IRQ handler remain registered after the device's clock is manually
disabled during driver removal?

Because sunxi_rsb_remove() manually disables the hardware by calling
sunxi_rsb_hw_exit(), but relies on devres to free the interrupt handler
afterward, a spurious interrupt firing in that window could cause a crash
when the handler attempts to access gated device registers.

>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710110930.4621=
09-1-panchuang@vivo.com?part=3D2
