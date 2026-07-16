Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6C3C555C
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jul 2026 21:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237658; cv=none; b=MeGrlXTmT/gZk67XIlLav3RiG4xS/y6UItVXtXCBGRCZbz8troqbpTKs/sKJfwnJdKV/za86ovYCX2SfR+RqJEGVpsBRijd/+tfCT6ufnyQa0pAbHdARrir5K1glc8/fAoGi5xdcEBE2dpKp3GqqRhRql7B717RkKiNVupopznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237658; c=relaxed/simple;
	bh=poAbK2qQgt06miNHGf+VeMOs69RtyQmvDNhuyJpZYso=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrwylLPWFSyTJkzewXCFOqF5TrAwVyD+s4hWczWAmXtywbT3nJGh/UJ074ybIETL2E4+M3qsYUPeZv0mD8i+sO7bNK3DqqxBq8uMMZ9qDOsbxTPOnMWJr4zB8CEbrl5FRibvcABj00r6QHm796GepPxKpNowPNUsI7EV9QRaZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKugmIgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKugmIgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E911F000E9;
	Thu, 16 Jul 2026 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237656;
	bh=dqR3ckVvWXYkCVsm6mOBctQwxwnVG+6w8ilQLe57WYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKugmIgiNGDLAxOk5HsYe6yCwHKaa+59cnNxTOkgzRc4T2lVMXSSZB9OFyfdC93HP
	 S6nBJAh/GtsYVAqOP9/z0Hx6vaJtmqPKr629yc8aCJlm4tvxQfcqZYXpdPVVQCVxGe
	 zf5aLhWxIQzer5spwSP02qEinekdANYdzEzjguHewna2oZ73lko+S0blgsFm2JbpHY
	 aaYvjISLhQpyRGkL1WaomnZeGDsvC44pBoK9zFHp+rbvMY9p+JcT3TrIUkyvDVdOu8
	 jcDlve4b46Q4xq+NyvbQ2lKiVuXYD3Fdth1JKVeI2ckvQ4K2eYiWbmmq2zHpTec0zB
	 MhDh7NfL/ROBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] media: sunxi-cir: Ensure no more interrupts
 can occur before free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Young" <sean@mess.org>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <397628f5644f6488f111a3a3ee07d00ce01a13b0.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
 <397628f5644f6488f111a3a3ee07d00ce01a13b0.1783977550.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:34:16 +0000
Message-Id: <20260716213416.91E911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The teardown sequence fails to synchronize with or disable the act=
ive devm-managed IRQ handler, leaving a race window that guarantees either =
a fatal bus error (unclocked register access) or a Use-After-Free.
- [High] Device interfaces and the IRQ handler are registered before hardwa=
re initialization in probe(), allowing userspace or interrupts to access un=
clocked registers and cause a bus fault.
- [High] The suspend callback disables clocks without synchronizing or disa=
bling the device interrupt, allowing an unclocked MMIO access race.
--

--- Patch [6]: [PATCH v2 06/11] media: sunxi-cir: Ensure no more interrupts=
 can occur before free ---
commit 2912f57e54d0f869a5daead9e5ddf88c0db3d980
Author: Sean Young <sean@mess.org>
media: sunxi-cir: Ensure no more interrupts can occur before free

This commit attempts to fix a race condition during module removal by moving
the call to rc_free_device() after sunxi_ir_hw_exit().

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
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
This isn't a bug introduced by this patch, but does the teardown sequence
leave a race window with the devm-managed IRQ handler?

The commit message mentions ensuring no more interrupts can occur before
free, but sunxi_ir_hw_exit() only disables the clocks and asserts reset:

sunxi_ir_hw_exit() {
        clk_disable_unprepare(ir->clk);
        clk_disable_unprepare(ir->apb_clk);
        reset_control_assert(ir->rst);
}

Because the IRQ is managed by devm_request_irq(), it remains active until
after sunxi_ir_remove() returns. If an interrupt fires concurrently after
the clocks are disabled, sunxi_ir_irq() will attempt to access unclocked
MMIO registers:

sunxi_ir_irq() {
        ...
        status =3D readl(ir->base + SUNXI_IR_RXSTA_REG);

Could this lead to a synchronous external abort? Should there be an
explicit disable_irq() or similar synchronization before disabling the
clocks?

Additionally, this same pattern appears to exist in sunxi_ir_suspend(),
which also calls sunxi_ir_hw_exit() while the IRQ is still globally active.

[Severity: High]
This is also a pre-existing issue, but is there a similar unclocked access
risk during driver initialization?

In sunxi_ir_probe(), rc_register_device() and devm_request_irq() are called
before the hardware clocks are enabled via sunxi_ir_hw_init():

sunxi_ir_probe() {
        ...
        ret =3D rc_register_device(ir->rc);
        ...
        ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DE=
V, ir);
        ...
        ret =3D sunxi_ir_hw_init(dev);
}

If userspace immediately issues a LIRC_SET_REC_TIMEOUT ioctl after the
device is registered, sunxi_ir_set_timeout() will write to SUNXI_IR_CIR_REG
before the clocks are enabled. Similarly, a pending interrupt could cause
sunxi_ir_irq() to run before sunxi_ir_hw_init().

Should the hardware initialization be moved before exposing the device and
requesting the IRQ?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783977550.gi=
t.sean@mess.org?part=3D6
