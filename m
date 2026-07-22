Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF740F74E
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716598; cv=none; b=YlSvXTP9DiZ7rLS3IOp8RZQ79nUZ6YCVyXUS9JHFJ2t8yseEh4O+yaEBvVy6PNjVe5HP/9H4eVcZ07uu9uj4BS2DSDMOXhJ3q+mXezzXezfbpGUDSrguv3xGYDoxqMj7jpdHCgAnzr/ik071Pr5uEIUVguMMsitb+EUoOPVpr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716598; c=relaxed/simple;
	bh=WOcKe3QE+F8rdXHoLf5zcrP94v0SrxICPi5shZF4SIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulhERk+VR5ZEPmTeKt4x1vzLqNfglEjvuHoKb3ek4IIW5rsaq2o92HHGtxTlIHO5ImQnocOYgXhY3NEI+ZALhqTgtOEBrbMWd/0HMDgNbxlT9hRSuCQ0xOTZfo69ds2Ir+YQZvUjSGhQ6PYTL1JpcinhYrm9N227xhq7+RSJT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0mscua0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0mscua0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D251F000E9;
	Wed, 22 Jul 2026 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784716597;
	bh=vp/FVKUCtMPs83XkRlM8yFaIJOUQmqcs0ewmcVtOrXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f0mscua02wVHPryb675zx77YA3pLdllox9jgPnOqXh6kHueNwYxgRAJf6t7dH6ZGa
	 nYHf33dKRKCA9R1U7zfwW6zkP9z7jY27WekZFip/XpvP2J72dVZ+rUjCKfmmGI2n+e
	 l6aRd5rfm8BIB4ZqMYa/NJcTVHP40XTcZK4+pxTUcVLC5szLB5dkVC4xHuyQhRSV85
	 RchHAxOFyxB10bxsbJg/dgaRYy+68HZA5Do0wY2AhVeb2G9IAXzkaM4HD1YNoDrWrU
	 HsYwCIY56lvvD2eJrHOxtdHuu1wdwP4/B/N7xHC6FSS6ISHFaliCkRhgOEeKXVm3VH
	 cdrC6VhV8CgCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/13] media: sunxi-cir: Ensure no more interrupts
 can occur before free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Young" <sean@mess.org>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <d16aa75a7f94678499b37e45a5215f231658e0b0.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
 <d16aa75a7f94678499b37e45a5215f231658e0b0.1784715737.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:36:36 +0000
Message-Id: <20260722103636.C4D251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch attempts to fix a race condition by reordering `rc_free_=
device()` after `sunxi_ir_hw_exit()`, but fails to synchronize or explicitl=
y disable the devm-managed IRQ, leaving the race open.
- [High] The device is registered with the RC core before its hardware cloc=
ks are enabled, resulting in MMIO accesses to unclocked registers during pr=
obe.
--

--- Patch [6]: [PATCH v3 06/13] media: sunxi-cir: Ensure no more interrupts=
 can occur before free ---
commit a8d7020d0e53fc07953c4088225c769898287e76
Author: Sean Young <sean@mess.org>

media: sunxi-cir: Ensure no more interrupts can occur before free

This commit reorders rc_free_device() in the remove function so that it is
called after the hardware is shut down. This is intended to fix a race
between device unregistration and the interrupt callback.

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 28e840a7e5b8c..af1ee08ffdbec 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *p=
dev)
>  	struct sunxi_ir *ir =3D platform_get_drvdata(pdev);
> =20
>  	rc_unregister_device(ir->rc);
> -	rc_free_device(ir->rc);
>  	sunxi_ir_hw_exit(&pdev->dev);
> +	rc_free_device(ir->rc);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this actually close the
race condition?

In sunxi_ir_remove(), sunxi_ir_hw_exit() disables the hardware clocks.
However, if the devm-managed interrupt is not explicitly disabled and
synchronized (for example, using disable_irq()), couldn't an interrupt
still run concurrently or immediately after clocks are disabled?

If sunxi_ir_irq() fires after sunxi_ir_hw_exit() runs, it will attempt to
read SUNXI_IR_RXSTA_REG while the clocks are disabled, which could cause a
crash. Additionally, since the IRQ is devm-managed, it could also race with
rc_free_device(), leading to a use-after-free on ir->rc.

This same issue appears to exist in sunxi_ir_suspend(), where clocks are
disabled while system interrupts are still active.

[Severity: High]
This is a pre-existing issue, but I noticed another potential problem in
the probe path. Does sunxi_ir_probe() access unclocked registers during
device registration?

In sunxi_ir_probe(), rc_register_device() is called before sunxi_ir_hw_init=
():

	ret =3D rc_register_device(ir->rc);
	if (ret) {
		dev_err(dev, "failed to register rc device\n");
		goto exit_free_dev;
	}
...
	ret =3D sunxi_ir_hw_init(dev);

The registration synchronously invokes core callbacks which unconditionally
call the driver's protocol change hook, and in turn sunxi_ir_set_timeout().
This callback writes to the SUNXI_IR_CIR_REG MMIO register. Since ir->clk
and ir->apb_clk are not enabled until sunxi_ir_hw_init() runs later, won't
this cause an abort or bus fault by accessing APB memory-mapped registers
without their clocks enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784715737.gi=
t.sean@mess.org?part=3D6
