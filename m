Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030030FC27
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786171115; cv=none; b=s581jJ5E8FJlcvNO9pqFEf27sAcGd2HGtfwPXAI5nqR7E7iCMxT+p+NNhRMTvqHILTcNhos0G/XvNj+6XHkx3VSnDzddlhoBsrCLjzehab6jDhg0PAr03PHb5tSvLoL/WQ08T2ZfzWYgNVajkezvESP0WmUJhWZSo+YxSSJGbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786171115; c=relaxed/simple;
	bh=SBC/64Hw8zpoY2wFMqsN85Ybof7QOdVo07Zxav3Hsg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iHVBWvL0jNYqIRnaG4K/n9jZTYLVZegmd6DGAjYDazpf4mDC+L4uX+H/Hx9LDcXf7CtgmpDHNVS/Ux+i2iJqD8wymvC0nKSDJ1IJSbn5c78oekWVFPshICoONHK8JM3UBYjz3eECCWiShheyY4lbmU1yLuI+6Ssc4Hp2rhBTxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRKJxV4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRKJxV4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5321F000E9;
	Sat,  8 Aug 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786171113;
	bh=LjPRghXdPcx0mWq+xnyP4GK5nkc6JSO7tXKfcmLrVgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRKJxV4ur58xO5hF3N1pBglMP2Q0hPHlu7XPnZit86uWssWN2mtuk+iORN7XXcH3P
	 GGDIzZoOvc2dHLoZxjSUYgHb9bbRXqMrMJ53QOmMUozgSl7G1DnVkRqL+WVifIwjX7
	 Wfv4Qk0gg94nhjOQf2sQ0RYW2dDCfpYHTj4Q+yHPoGvvXnhZIwQgeuyToeM+FFjXSd
	 8RrBuJVXCi1rbiIu0M/BbEHbeNhFN9jzfANvLTFXQndSmPqwkRmWPjuR5uaZMzEDP2
	 bgMt04Qc3SYFHZIeP2XKzylDnK1mXMDaT+euELbKzZIvEBvkSVvBRvxgyDUWTeydAQ
	 jDt2xv++BP9+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: fix usage_count leak when
 autosuspend_delay is negative
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260808062029.2597581-1-lgs201920130244@gmail.com>
References: <20260808062029.2597581-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 06:38:33 +0000
Message-Id: <20260808063833.4F5321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Clock enable count leak during system resume if the device was run=
time-suspended.
- [High] Division by zero if clock-frequency property is 0.
- [High] Unclocked hardware access due to IRQ registration before clock ena=
blement.
- [High] Use-After-Free of child device `of_node` due to missing `of_node_g=
et()`.
- [High] Sleeping in atomic context within `.resume_noirq`.
--

--- Patch [1]: [PATCH] bus: sunxi-rsb: fix usage_count leak when autosuspen=
d_delay is negative ---
commit 353b6956f11193cdddcc23fba6f083e34c249931
Author: Guangshuo Li <lgs201920130244@gmail.com>

bus: sunxi-rsb: fix usage_count leak when autosuspend_delay is negative

The patch adds pm_runtime_dont_use_autosuspend() in sunxi_rsb_remove()
to fix a usage count leak when autosuspend delay is negative.

> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index daf0ea563e477..cd4c857756cfa 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
[ ... ]
> static struct sunxi_rsb_device *sunxi_rsb_device_create(struct sunxi_rsb =
*rsb,
> 		struct device_node *node, u16 hwaddr, u8 rtaddr)
> {
[ ... ]
> 	rdev->dev.bus =3D &sunxi_rsb_bus;
> 	rdev->dev.parent =3D rsb->dev;
> 	rdev->dev.of_node =3D node;
> 	rdev->dev.release =3D sunxi_rsb_dev_release;
[ ... ]
> static int of_rsb_register_devices(struct sunxi_rsb *rsb)
> {
[ ... ]
> 	for_each_available_child_of_node(np, child) {
> 		struct sunxi_rsb_device *rdev;
[ ... ]
> 		rdev =3D sunxi_rsb_device_create(rsb, child, hwaddr, rtaddr);

[Severity: High]
This isn't a bug introduced by this patch, but does this cause a
use-after-free of the child device node?

for_each_available_child_of_node() automatically drops the reference to the
previous node on each iteration. Since sunxi_rsb_device_create() assigns it
to rdev->dev.of_node without taking an extra reference via of_node_get(),
the node could be freed when the loop advances.

[ ... ]
> static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
> {
[ ... ]
> 	/* reset the controller */
> 	writel(RSB_CTRL_SOFT_RST, rsb->regs + RSB_CTRL);
> 	readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
> 			   !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
[ ... ]
> static const struct dev_pm_ops sunxi_rsb_dev_pm_ops =3D {
> 	SET_RUNTIME_PM_OPS(sunxi_rsb_runtime_suspend,
> 			   sunxi_rsb_runtime_resume, NULL)
> 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(sunxi_rsb_suspend, sunxi_rsb_resume)
> };

[Severity: High]
This is a pre-existing issue, but does this sleep in an atomic context?

sunxi_rsb_resume() is registered to run in the _noirq context via
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS, which executes with local interrupts
disabled. However, it calls sunxi_rsb_hw_init(), which uses
readl_poll_timeout() with a 1000us delay. This causes the macro to invoke
usleep_range() and attempt to sleep in an atomic context, which will
trigger a kernel panic during system resume.

[ ... ]
> static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
> {
[ ... ]
> 	p_clk_freq =3D clk_get_rate(rsb->clk);
> 	clk_div =3D p_clk_freq / rsb->clk_freq / 2;

[Severity: High]
This is a pre-existing issue, but can this cause a division by zero
exception?

In sunxi_rsb_probe(), the clock-frequency from the device tree is checked
against RSB_MAX_FREQ, but it's not checked for 0.

If it is 0, the division p_clk_freq / rsb->clk_freq / 2 will trigger a
division by zero panic.

[ ... ]
> static int __maybe_unused sunxi_rsb_runtime_resume(struct device *dev)
> {
> 	struct sunxi_rsb *rsb =3D dev_get_drvdata(dev);
>=20
> 	return clk_prepare_enable(rsb->clk);
> }
[ ... ]
> static int __maybe_unused sunxi_rsb_resume(struct device *dev)
> {
> 	struct sunxi_rsb *rsb =3D dev_get_drvdata(dev);
>=20
> 	return sunxi_rsb_hw_init(rsb);
> }

[Severity: High]
This isn't a bug introduced by this patch, but does this leak the clock
enable count during system resume?

If the device is runtime-suspended before a system suspend,
sunxi_rsb_resume() calls sunxi_rsb_hw_init() which calls
clk_prepare_enable().

Since it was runtime-suspended, a subsequent pm_runtime_resume_and_get()
would call sunxi_rsb_runtime_resume() which enables the clock a second
time, leaving the clock permanently enabled.

[ ... ]
> static int sunxi_rsb_probe(struct platform_device *pdev)
> {
[ ... ]
> 	ret =3D devm_request_irq(dev, irq, sunxi_rsb_irq, 0, RSB_CTRL_NAME, rsb);
> 	if (ret)
> 		return dev_err_probe(dev, ret,
> 				     "can't register interrupt handler irq %d\n", irq);
>=20
> 	ret =3D sunxi_rsb_hw_init(rsb);
> 	if (ret)
> 		return ret;
[ ... ]
> @@ -815,6 +815,7 @@ static void sunxi_rsb_remove(struct platform_device *=
pdev)
>  	struct sunxi_rsb *rsb =3D platform_get_drvdata(pdev);
> =20
>  	device_for_each_child(rsb->dev, NULL, sunxi_rsb_remove_devices);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	sunxi_rsb_hw_exit(rsb);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to an
unclocked hardware access?

In sunxi_rsb_probe(), the IRQ handler is registered before
sunxi_rsb_hw_init() enables the clock. If a pending interrupt triggers
immediately upon request, sunxi_rsb_irq() could read memory-mapped
registers while the clock is disabled.

Similarly, in sunxi_rsb_remove() shown in the diff here, the hardware clock
is disabled by sunxi_rsb_hw_exit(), but the devm-managed IRQ is still
registered and active, creating another window where sunxi_rsb_irq() could
execute after the clock is off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808062029.2597=
581-1-lgs201920130244@gmail.com?part=3D1
