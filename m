Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F43B2FC2
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791998; cv=none; b=XfUYSmokeM5fv8xlvJJxKFWzg4M3q1VBXMVXX11NaHnZMInLgh5tQmSFUweCOV0vq2FxrZ9VfI7GSix9TgFIUxHErs9lmOBKmDwC2X97hHVaZyH8BP+WTRyoeQ0w1N5axDrEsrIwIgQG73vVb+3OCHUjr7sizqu5W7HQbJK99Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791998; c=relaxed/simple;
	bh=qQQ8HbpwgcH5pGuLi940mCfFJdR8vltV6hQ41AqNE9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C1qmmbF/J87IrFcTOtE4w/0paHNq4rPUxSZopxbp/sjP2bP2860cRAr1Ne9UUpFyz1wuEL3EthtyScUPbzwEh24clm2xsN1i87b1qQa9hXG5MmmmyTPKwsplrpWy/AqOXdmFXusAlYC2UM4lFtUna6CXVy1YmY+1lvA7eF365yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhOV9qw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhOV9qw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2366B1F00ADF;
	Thu, 18 Jun 2026 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781791997;
	bh=BV7/hD3HQ/Tz8aGtlanGp4CmzgZV3ZHNnVCr4T8tILQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhOV9qw1spM9PqAlK+x+46zRDstyaA1e0wuwjCkdiRBySOg0FpeF0vA1dhnH/ejRP
	 ROdO1jLic/MtA9cIVPd7Skj/yTxSLKkRDm1TWHYE157qB7geK5yclEDYAPK6NNrmKi
	 w1Wg+DBh4AfTyQyHCMZjgnreC23FOWOQfqBGeB4PkaPMU8p0iQFJZheD+62uuMfXqL
	 hWXtdGh+Kdkg8cXNT0gFtD9lR7JseSB87WwPFKCle2Q3mECXRcq/A7XrYpvaukHojN
	 FuiSOgcgIGShHBXt4eku0sNX1ZZVnmwFCsFHbGNbVN+6+js8tU+EdvkURBkKhPHR8l
	 qq2t4E5P+eRTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: sun6i-p2wi: Fix device node reference leak in
 p2wi_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Uday Khare" <udaykhare77@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260618140525.11526-1-udaykhare77@gmail.com>
References: <20260617194522.114984-1-udaykhare77@gmail.com>
 <20260618140525.11526-1-udaykhare77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 14:13:16 +0000
Message-Id: <20260618141317.2366B1F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Mixing `goto`-based error handling with scope-based `__free()` c=
leanup in the same function.

Pre-existing issues:
- [High] Hardware reset is asserted before unregistering the I2C adapter, r=
isking bus faults during concurrent access.
- [High] Indefinite sleep in `wait_for_completion()` can cause a permanent =
bus deadlock if the hardware misses an interrupt.
--

commit e9f19d117f2197dcc4d4457a0ba48848fb326e26
Author: Uday Khare <udaykhare77@gmail.com>

i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released, causing a device node reference leak.

Fix this by declaring childnp with the __free(device_node) cleanup
attribute, which automatically releases the device node reference
when childnp goes out of scope.

> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index dffbe776a195d..8469a0ea98d7d 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
[ ... ]
> @@ -217,7 +217,9 @@ static int p2wi_probe(struct platform_device *pdev)
>  	 * In this case the target_addr is set to -1 and won't be checked when
>  	 * launching a P2WI transfer.
>  	 */
> -	childnp =3D of_get_next_available_child(np, NULL);
> +	struct device_node *childnp __free(device_node) =3D
> +		of_get_next_available_child(np, NULL);
> +

[Severity: Medium]
Does this mix scope-based cleanup with goto-based error handling?

p2wi_probe() continues to use a goto label for manual cleanup of the reset
controller further down:

	ret =3D devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
	if (ret) {
		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
		goto err_reset_assert;
	}
	...
err_reset_assert:
	reset_control_assert(p2wi->rstc);

Mixing goto-based error handling and __free() declarations in the same rout=
ine
is discouraged in include/linux/cleanup.h as it can create confusing owners=
hip
semantics and increases the risk of double-free bugs.

Should the entire routine either be converted to use scope-based cleanups
exclusively, or rely solely on goto with manual of_node_put()?

>  	if (childnp) {
>  		ret =3D of_property_read_u32(childnp, "reg", &target_addr);
>  		if (ret)

[Severity: High]
This is a pre-existing issue, but does p2wi_remove() tear down resources in
the wrong order?

p2wi_remove() asserts the hardware reset before unregistering the i2c adapt=
er:

static void p2wi_remove(struct platform_device *dev)
{
	struct p2wi *p2wi =3D platform_get_drvdata(dev);

	reset_control_assert(p2wi->rstc);
	i2c_del_adapter(&p2wi->adapter);
}

This places the underlying hardware into a reset state while the i2c adapter
abstraction is still actively registered. If a concurrent i2c transfer
(p2wi_smbus_xfer) is executing or initiates, the driver will perform i/o
operations on hardware registers of a reset device, which could cause an
unrecoverable system crash or hang.

Should i2c_del_adapter() be called first to flush pending transfers and pre=
vent
new ones before shutting down hardware resources?

[Severity: High]
This is another pre-existing issue, but could p2wi_smbus_xfer() cause a
permanent bus deadlock?

The transfer function p2wi_smbus_xfer() calls wait_for_completion() without
a timeout:

	writel(P2WI_CTRL_START_TRANS | P2WI_CTRL_GLOBAL_INT_ENB,
	       p2wi->regs + P2WI_CTRL);

	wait_for_completion(&p2wi->complete);

This function is invoked with the i2c bus lock held by the caller. If the
hardware fails to generate an interrupt due to a bus glitch or hardware fau=
lt,
the task will block indefinitely in the uninterruptible state. This
permanently deadlocks the entire i2c bus.

Would it be safer to use wait_for_completion_timeout() to allow recovery fr=
om
hardware faults and propagate the error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618140525.1152=
6-1-udaykhare77@gmail.com?part=3D1
