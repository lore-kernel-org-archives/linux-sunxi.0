Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC841B373
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163215; cv=none; b=G/3oYbKDzFXdZ3iCRWDtY16KaNyQrZpesfxBFHWjXmlasjvfIDN4mOTg7mLfHHMF9oN9MFg4K62McEUKjujrNXSg1diA6pHS/BUtCbqC21B+Ezf1A47hhTw4cux3/JcR2WR+1ov4m7juaOJ90tjHCb0zs0k5PWXBSKQ0zrd4vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163215; c=relaxed/simple;
	bh=wNR4bOaCKXzfy2PMlSEJUahf4u47n5BT07pnHLfwqdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eWUYVTgggs1uHg53c1bQmB+KJXKSlRJZh10e8tNtHX5wyM85cIDYzQ3EJoP4i10fyTnMfj9gAO817mTkUNteA/u7pazyVpqOrxzipApgmofoWKr5iJUy71RqFouP4+mo4kP6ZhY7wMkuSuO7cRtGJ3U6F5MmSXwWAB777CeeRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl01rTN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl01rTN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7D01F000E9;
	Mon, 27 Jul 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785163214;
	bh=uW4Uxt8H7psYHbtpwfy4zMCnESHxDBrBaVBW5LoTgvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hl01rTN/Av1jdnkOCrINblYIidKPWCVkXrCywIOpvwbS6EXgWThKv4DNzAuJ33bI5
	 g09p5tYSwtqMUcoR6Bu0+4vzCKn3XLsUV8BTIpmnZR1CmG9b6L842FRU5quqTDLpZ7
	 4PGH7B5YLvx6Wz4Yp7MZhgFFeMh8FIPTzOvSyZOJZmZ0ZNJ6OdHrtyWm9FXTh85gvq
	 AiAOi3XPnxtrV6l80NuuuzuXu7tgZnynaXFuDM9saOHnfbg5URxApMKxtliCGaKtG/
	 eE+/nduT5TGlc6b1Wzc2trKqwaqfGSisq4cPIvQMSqvxsNBbmdrle3F8OnXBVXHG38
	 GNkNDVh+UOzug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/15] media: sunxi-cir: Ensure no more interrupts
 can occur before free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Young" <sean@mess.org>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <9c73eb433ce34de243d5be7a5e81e38fe26d39c5.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
 <9c73eb433ce34de243d5be7a5e81e38fe26d39c5.1785158244.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:40:13 +0000
Message-Id: <20260727144013.BC7D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch attempts to fix a use-after-free by delaying `rc_free_de=
vice()` until after `sunxi_ir_hw_exit()`. However, `sunxi_ir_hw_exit()` onl=
y disables the hardware clocks and asserts reset; it does not mask the devm=
-managed IRQ or wait for in-flight interrupt handlers to complete via `sync=
hronize_irq()`. This leaves the driver vulnerable to two fatal issues: 1) I=
f an IRQ handler is executing concurrently, disabling the APB clock while i=
t accesses memory-mapped registers will cause a synchronous external abort =
(bus hang). 2) If the handler continues executing after `sunxi_ir_hw_exit()=
` returns, it will access `ir->rc` while it is being freed by `rc_free_devi=
ce()`, resulting in a use-after-free.
- [High] The IRQ is requested via `devm_request_irq()` before the hardware =
clocks are initialized by `sunxi_ir_hw_init()`, risking a synchronous exter=
nal abort (bus hang) on spurious or pending interrupts during probe.
- [High] The devm-managed IRQ handler can execute and access a freed RC dev=
ice if `sunxi_ir_hw_init()` fails in `sunxi_ir_probe()`.
--

--- Patch [6]: [PATCH v4 06/15] media: sunxi-cir: Ensure no more interrupts=
 can occur before free ---
commit 6e49e6c93b7dee54eb10aca37f27b9448afeb67a
Author: Sean Young <sean@mess.org>

media: sunxi-cir: Ensure no more interrupts can occur before free

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq ca=
llbacks")
Cc: stable@vger.kernel.org

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

[Severity: High]
This is a pre-existing issue, but does sunxi_ir_hw_exit() adequately prevent
further interrupts from executing?

sunxi_ir_hw_exit() disables clocks and asserts reset, but it doesn't appear
to mask the devm-managed IRQ or wait for in-flight handlers to finish via
synchronize_irq().

If an interrupt fires concurrently or an IRQ handler is already running:

drivers/media/rc/sunxi-cir.c:sunxi_ir_irq() {
    ...
    status =3D readl(ir->base + SUNXI_IR_RXSTA_REG);
    ...
}

Could disabling the APB clock while this handler is accessing memory-mapped
registers cause a synchronous external abort? Furthermore, if the handler
continues executing after sunxi_ir_hw_exit() returns, could it access the
freed ir->rc device pointer?

>  }

Looking at the probe function in the same file:

drivers/media/rc/sunxi-cir.c:sunxi_ir_probe() {
    ...
    ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, i=
r);
    if (ret) {
        dev_err(dev, "failed request irq\n");
        goto exit_unregister_dev;
    }

    ret =3D sunxi_ir_hw_init(dev);
    if (ret)
        goto exit_unregister_dev;
    ...
exit_unregister_dev:
    rc_unregister_device(ir->rc);

exit_free_dev:
    rc_free_device(ir->rc);
}

[Severity: High]
This is a pre-existing issue, but is it safe to request the IRQ before the
hardware clocks are initialized?

If a pending interrupt from the bootloader or a spurious IRQ triggers
sunxi_ir_irq() before sunxi_ir_hw_init() enables the clock, could this lead
to a synchronous external abort when the handler reads ir->base?

[Severity: High]
This is another pre-existing issue, but does the error path for a failed
sunxi_ir_hw_init() leave the devm-managed IRQ active until the probe functi=
on
returns?

If an interrupt fires during this window, could the handler dereference
ir->rc after it has been freed by rc_free_device() at the exit_free_dev
label?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785158244.gi=
t.sean@mess.org?part=3D6
