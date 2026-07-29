Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C929B4052A9
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Jul 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339066; cv=none; b=QvZGlzUYLWZ8g2EN4z2ixtS1EgX2zSuhL3vU2Se3qBfqppY0aprLb90P16fs9R+jS5OzrTZyXPfQb3PSGOf+LskVabK7Xi0R+c6i8Kae7bl0v91paYyvKPKZzqkzr6lmjRH0FmsmrwkDb9/Cs796VZ5QqPRVgOqaPS2DhDbasTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339066; c=relaxed/simple;
	bh=e0hzv6Qr489YzxBASWiNvYy+vYJcBhCfIDw4hfkxje8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oVnGZDdSgFhWJKvJzsHyY/nYz6WCTj7lRJMtfCqCKp/77bq13yS8ersrk4JSGZ7c80uK+fYsdxhBrF+Hjwoy/QE+OSbgXaICsIYGP5/LEX4c8pcols8Q4I4RGzpqnUEuwcxmjAFlHZj0w2RyIaLhVqXhG8zNhMk2clvJRLdFYP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7Y/sYjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7Y/sYjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6641F00AC4;
	Wed, 29 Jul 2026 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785339064;
	bh=fFngezCcl0eeCWHhwJfWja+A6jHkJlSX9/qjeyR2P/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V7Y/sYjgdvhmII4XtkaZd4GvOkP3v31+BYMPP7EikEFvv4rIdLESNw9OpL3yDD3SO
	 Xp6OEWkizyqhO+j6Fuq0PQgh9PS3gWD6NzxNxuErlDHKb5VwGVvTMi69V9m4LN2nJA
	 rpeIv82k2KL2A3q205YNkxJemIB8mAWuLTtnYr+nn0WJypHbVwQSGun8yamAmFN3yv
	 JXavl4hrfzsg9iOZ9sOposNS5vDI9qIxsj8FAJWNctNmPZi2u+LthFOdi+e3AleFD0
	 o1hxY5L6nq9TBsii1W7Q/6bqlKd1SLmVMYEwwA1FBglwE8RI+R8JPKwRJJh1QG+eEP
	 ZfwDHjD09rs3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/15] media: sunxi-cir: Ensure no more interrupts
 can occur before free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sean Young" <sean@mess.org>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <ca5cac44353fdae4d664b22de709cc45837414ee.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
 <ca5cac44353fdae4d664b22de709cc45837414ee.1785338381.git.sean@mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:31:03 +0000
Message-Id: <20260729153104.3F6641F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The teardown race between `sunxi_ir_remove()` and `sunxi_ir_irq()`=
 is not resolved by the patch. The interrupt remains active and unsynchroni=
zed while clocks are disabled and memory is freed, leading to synchronous e=
xternal aborts and use-after-free vulnerabilities. A similar issue exists i=
n `probe()` where the IRQ is requested before clocks are enabled.
--

--- Patch [6]: [PATCH v5 06/15] media: sunxi-cir: Ensure no more interrupts=
 can occur before free ---
commit 485344025b667511dbe1afe16a5fb9cab1f312f6
Author: Sean Young <sean@mess.org>

media: sunxi-cir: Ensure no more interrupts can occur before free

This commit delays rc_free_device() until after sunxi_ir_hw_exit() in the
remove path. It attempts to ensure the hardware is stopped and no further
interrupts can occur before the device memory is freed.

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
This is a pre-existing issue, but does this actually prevent interrupts from
occurring before the free?

The driver requests the IRQ via devm_request_irq() in sunxi_ir_probe(), whi=
ch
means the IRQ is not freed or synchronized until devres cleanup runs after
sunxi_ir_remove() returns.

While sunxi_ir_hw_exit() disables the APB clock, it does not explicitly dis=
able
or synchronize the IRQ handler. If an interrupt executes concurrently, can =
it
fault when reading unclocked MMIO registers?

drivers/media/rc/sunxi-cir.c:sunxi_ir_irq() {
	...
	status =3D readl(ir->base + SUNXI_IR_RXSTA_REG);
	...
	ir_raw_event_store_with_filter(ir->rc, &rawir);
}

Because the IRQ handler is unsynchronized, could it also dereference the fr=
eed
ir->rc if it races with or runs after rc_free_device()?

Additionally, is there a similar window in sunxi_ir_probe()?

drivers/media/rc/sunxi-cir.c:sunxi_ir_probe() {
	...
	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir);
	...
	ret =3D sunxi_ir_hw_init(dev);
	...
}

The IRQ handler is requested and enabled before sunxi_ir_hw_init() enables
the APB clock. Could a pending interrupt trigger the handler and access
unclocked registers during boot?

>  }
> =20
>  static void sunxi_ir_shutdown(struct platform_device *pdev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785338381.gi=
t.sean@mess.org?part=3D6
