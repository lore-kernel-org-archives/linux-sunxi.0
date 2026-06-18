Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E5308F39
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793876; cv=none; b=Q49iXKfw/ZomD0SAHeVuLRFJov1pGb2+ZL7o9b1EMSsUYBA7ncc4WO4+yYGYS+G52u0Nh/iw0wyRJYYi6OqX5UC0K0BdpUc9u8NnTTFU2fs8dixo1CBrbeQXxd32dXuBnv9l4YzOOTBSPnjGRWhX2rxS8fEY7CbuwRdBntxvqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793876; c=relaxed/simple;
	bh=9GfX/dgX6/4JwyxPgytGhhrGYWGGYwQt7QJ/BbtOjtE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WNMDmhN46bARnJCNbuX2+kZy4sD42TiuW1DRjChYsP3UqCr3yJ9WVjmaNvS1r7h5GzZx9Ja3M7lDgZniN7vNQsIO22odub6DDiZWBZkDEMrwpTD2OAwecdB5zPHbcnJiNJsThdlgTSThWBULlUAZhsMe1uXwe/hDLGsYxMNaLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRsSa0T4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRsSa0T4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AC21F000E9;
	Thu, 18 Jun 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793874;
	bh=A+l3gkXt2exJZ2zNRiPsj9q1wej+QacmYGNicDI5/RY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HRsSa0T4AyOjsKISHnNmUJ4gC0ckTGeX2AbAdaUe8mHt8fsK3X1+tyDIFs8DYu5Nx
	 mcNX8ACypXa3ApxFWEAlC8V7drRb2+rG677iA5hso2wN+fe7jMXqDWUztA8fYe73ma
	 VoWnbIEp4ZtcsJtOHylTlaZ3/AAjYKSI7wUIzIP2/Fyg/ORNWW3NnXQMehL3DKNzJh
	 chbYXD5cSfLvr+TlodrYOthTyYFgWi3EfltGmQg1923mHsuWmNxajpA22rq7qOw/83
	 IjPzHsrVGV/j8tZ6CMC4gf2tBoxm97Eddo65m3OG9SHfXr5iXg16cmRhsmQo6qf96l
	 /5rZutQSFQwYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i2c: sun6i-p2wi: Fix device node reference leak in
 p2wi_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Uday Khare" <udaykhare77@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260618143727.18534-1-udaykhare77@gmail.com>
References: <20260618143727.18534-1-udaykhare77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 14:44:34 +0000
Message-Id: <20260618144434.A3AC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Calling `of_node_put(childnp)` before passing `childnp` to `dev_er=
r_probe()` causes a use-after-free because the `%pOF` format specifier dere=
ferences the freed node.

Pre-existing issues:
- [High] Hardware reset is asserted before the I2C adapter is deleted in `p=
2wi_remove()`, risking hangs and incomplete transfers.
- [High] The I2C transfer function `p2wi_smbus_xfer()` uses `wait_for_compl=
etion()` without a timeout, which can permanently hang the kernel task if t=
he hardware fails.
--

commit c8d2fd420d274dc476834daabf9f1fb97be750d0
Author: Uday Khare <udaykhare77@gmail.com>

i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe

This commit addresses a device node reference leak in p2wi_probe() by calli=
ng
of_node_put() on the child node reference obtained via
of_get_next_available_child(). The fix is applied to both the success and
error paths.

> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index dffbe776a195d..7c0239f8937ea 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c

[ ... ]

> @@ -217,14 +216,19 @@ static int p2wi_probe(struct platform_device *pdev)
>  	 * In this case the target_addr is set to -1 and won't be checked when
>  	 * launching a P2WI transfer.
>  	 */
> +	struct device_node *childnp;
> +
>  	childnp =3D of_get_next_available_child(np, NULL);
>  	if (childnp) {
>  		ret =3D of_property_read_u32(childnp, "reg", &target_addr);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(childnp);
>  			return dev_err_probe(dev, -EINVAL,
>  					     "invalid target address on node %pOF\n", childnp);

[Severity: High]
Does calling of_node_put() before dev_err_probe() cause a use-after-free?

The %pOF format specifier in dev_err_probe() will dereference childnp to re=
ad
its full name. Since of_node_put() decrements the reference count and can
potentially free the node, accessing it immediately afterwards might lead to
a use-after-free.

Could the node be released after logging the error instead?

> +		}
> =20
>  		p2wi->target_addr =3D target_addr;
> +		of_node_put(childnp);
>  	}

While reviewing the above, I also noticed a couple of pre-existing issues in
the same file:

drivers/i2c/busses/i2c-sun6i-p2wi.c:p2wi_remove() {
    ...
	reset_control_assert(p2wi->rstc);
	i2c_del_adapter(&p2wi->adapter);
}

[Severity: High]
This is a pre-existing issue, but could asserting the hardware reset before
deleting the I2C adapter risk hanging the system?

If reset_control_assert() disables the hardware while i2c_del_adapter() is
still waiting for ongoing transfers to finish or accepting new ones, any
in-flight transfers might interact with a disabled controller. This could
lead to the driver waiting indefinitely for an interrupt.

Should i2c_del_adapter() be called before asserting the hardware reset?


drivers/i2c/busses/i2c-sun6i-p2wi.c:p2wi_smbus_xfer() {
    ...
	writel(P2WI_CTRL_START_TRANS | P2WI_CTRL_GLOBAL_INT_ENB,
	       p2wi->regs + P2WI_CTRL);

	wait_for_completion(&p2wi->complete);
    ...
}

[Severity: High]
This is a pre-existing issue, but can this wait_for_completion() hang the
kernel task permanently?

If the hardware fails to generate an interrupt due to a bus lockup, a missed
edge, or reset, the calling thread will block indefinitely in an
uninterruptible sleep state because there is no timeout mechanism.

Would it be safer to use wait_for_completion_timeout() and handle the
timeout condition by reporting an error and cleaning up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618143727.1853=
4-1-udaykhare77@gmail.com?part=3D1
