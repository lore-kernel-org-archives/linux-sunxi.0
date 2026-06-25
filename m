Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801F18CBE1
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jun 2026 00:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782348330; cv=none; b=jnZk2DOPVKRGKBjOwkeIA6THwDQaPNRKP9bvFwMZh8czJoaI/XzuA54Do7rOk8Oyzkq1Ikq5FR0bUZ43nDvXv+1N+akvAO3DB+VNcZSg/NN1/kNeMmj21NAHZOoojmpfC/pWpESgZ6QBJSxAvGOF71gfBDDCTUJ0ztNJedj0CxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782348330; c=relaxed/simple;
	bh=MKpJ2RQaE6gK9B/ri93onnZzSwVTDbzdFd6icob8KcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JJD2MZuer1/gaartaU5sW0eq7+G2Uvlxr55Cvuy/aavDUy9IOK1AI5Xun5UD58tWrWxmepCmsxedpay2cfpe3dQbbVgka6xXRSkgOk+vK/1LeOU94Xl5AfFIxSPhDVWRnV1K9u5rmX48QaofCh6pOMMKK50/0gHq5kJRYyIat6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSDE0/Ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSDE0/Ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC261F000E9;
	Thu, 25 Jun 2026 00:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782348328;
	bh=eTHjuQLB/sNouZYGJsS+3F6O7G3erRb70yTIVPBc5XU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSDE0/AhVxK0XVQJ+4oTWZvjgq9dnfoKZQH9wmO0ancMUduuoU3re0ZdGiIYmlQOM
	 kwqUDy5Umx7+txQMcyXIUWcSVzLdOd1iY/QYzmBbwAW4ec0XYJj3wBU0E2a3oYHiBO
	 9A31lGnMFaXHsxGjB7NkbB+u8kaM0320LwzW8kBbZDcwm59Pr/32JdgMSja+s2P2aL
	 6mCLe9IU3wpd3VMmDUdbxNM5gfDxUnL3pBHxrkFQ0tSKHzo7Yj50FVH52VUw/rx7Uh
	 yhq4/0JIsNy7gjFmB6MR3VO6LujLBQQULalX7k4qO6CxaRLEbE0G/kOVewJKRnnz9q
	 1N/JPG3El85Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: fail hardware init on soft-reset
 timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
References: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 00:45:27 +0000
Message-Id: <20260625004527.DBC261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Asserting the hardware reset line on soft-reset timeout during sys=
tem resume leaves the IP in reset, which causes a fatal bus hang when child=
 devices subsequently attempt to access the controller.

Pre-existing issues:
- [High] If a malformed Device Tree explicitly sets `clock-frequency =3D <0=
>;`, it causes a kernel panic due to division by zero.
- [High] The IRQ handler is requested before the hardware is initialized an=
d its module clock is enabled, risking a fatal bus error.
--

commit 1ad9a12cbc21560f6a2fb1e0bd342a6de275080c
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

bus: sunxi-rsb: fail hardware init on soft-reset timeout

This commit adds a check for the controller soft reset in sunxi_rsb_hw_init.
If the reset times out, the code now asserts the hardware reset line,
disables the clock, and returns a timeout error instead of continuing.

> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index daf0ea563e477..f83224dea804d 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -669,8 +669,12 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
> =20
>  	/* reset the controller */
>  	writel(RSB_CTRL_SOFT_RST, rsb->regs + RSB_CTRL);
> -	readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
> -			   !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
> +	ret =3D readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
> +				 !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
> +	if (ret) {
> +		dev_err(dev, "soft reset timed out\n");
> +		goto err_reset_assert;
> +	}
> =20
>  	/*
>  	 * Clock frequency and delay calculation code is from

[ ... ]

> @@ -696,6 +700,8 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
> =20
>  	return 0;
> =20
> +err_reset_assert:
> +	reset_control_assert(rsb->rstc);

[Severity: High]
If sunxi_rsb_hw_init() fails due to this soft-reset timeout during system
resume, it asserts the hardware reset line and returns an error:

drivers/bus/sunxi-rsb.c:sunxi_rsb_resume() {
	struct sunxi_rsb *rsb =3D dev_get_drvdata(dev);

	return sunxi_rsb_hw_init(rsb);
}

The PM core logs the resume error but continues system resume. When child
devices, such as PMICs, are subsequently resumed, they attempt to access the
RSB bus to restore registers. The driver's runtime resume callback only
enables the clock, which means the driver will attempt MMIO access while the
controller is still held in hardware reset.

Will writing to an IP block held in hardware reset cause a synchronous
external abort and fatal bus hang on Allwinner SoCs?

>  err_clk_disable:
>  	clk_disable_unprepare(rsb->clk);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but if a malformed Device Tree
explicitly sets clock-frequency =3D <0>, sunxi_rsb_probe() successfully rea=
ds
the 0 and bypasses the upper boundary check:

drivers/bus/sunxi-rsb.c:sunxi_rsb_probe() {
    ...
    if (of_property_read_u32(np, "clock-frequency", &clk_freq)) {
        ...
    } else if (clk_freq > RSB_MAX_FREQ) {
        ...
    }
    ...
}

Later, sunxi_rsb_hw_init() uses this unchecked value as a divisor:

drivers/bus/sunxi-rsb.c:sunxi_rsb_hw_init() {
    ...
    clk_div =3D p_clk_freq / rsb->clk_freq / 2;
    ...
}

Can this cause a fatal division by zero exception when rsb->clk_freq is 0?

[Severity: High]
This is a pre-existing issue, but devm_request_irq() is called before
sunxi_rsb_hw_init() initializes the hardware and enables its module clock:

drivers/bus/sunxi-rsb.c:sunxi_rsb_probe() {
    ...
    ret =3D devm_request_irq(dev, irq, sunxi_rsb_irq, 0, RSB_CTRL_NAME, rsb=
);
    if (ret)
        return dev_err_probe(...);

    ret =3D sunxi_rsb_hw_init(rsb);
    ...
}

If an interrupt fires immediately from a pending state from a previous boot
stage, sunxi_rsb_irq() will execute and access the RSB_INTS register using
readl() before the clock is enabled:

drivers/bus/sunxi-rsb.c:sunxi_rsb_irq() {
    ...
    status =3D readl(rsb->regs + RSB_INTS);
    ...
}

Could accessing unclocked or reset MMIO space on Allwinner SoCs cause a fat=
al
synchronous external abort here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625003416.1584=
1-1-pengpeng@iscas.ac.cn?part=3D1
