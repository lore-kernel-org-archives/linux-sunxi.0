Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E793BB11B;
	Thu,  2 Jul 2026 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029621; cv=none; b=rTAQ1rmQOJi/FZKJcxHWyiGhMLknnNUAUV5B5iKcmeayueSLVmo5z2TR3aB7N6FUIbxopN8N9W4E/iY8RbH5ymc2FYIZUcBdZZcpyH15HfVzchK/o0hSeaZ2YRb4Z2bCu2XLV+qulvukR8WNaylCnkS5SKLmHLx9CBY+3JPHmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029621; c=relaxed/simple;
	bh=4E3uPmJLTzLPGnGXylvlBTY1e4qEddtq/7fqpn07zyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eJuI1778uLK9UyCbrWu2r6k6j8DrAHoMyCfV0l+yqGms2zrIZx69kmavtlPVHiqphxFaSv7YoEFLxWJv6L8AoXrM7dto2eOzLYpIY4Q6yn/Drxmyrmhk/E/cJXBrQwTgnMY8BfilY8vYG+6/rIdytobxFxpoiUCoo3a/a4w+r1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKUMrAgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKUMrAgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FBD1F000E9;
	Thu,  2 Jul 2026 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029620;
	bh=oQIjLP9TVDNz4PvVPK5lkW7gtFo4dqmaY71KLP+cN6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKUMrAgVYTo9Za2RVN1i5hj7nHube0IIi/UzQ0+i/ic05Y5/qq/EtXVlPyDQCuS6M
	 CI4sY0K6KulUmJAkDYL5aVsOPHP1istqeDvU5Wa1/xWlges7iqp3V4abfOe172tzOd
	 xdOMnH86nZ/MNSSg9EY5eKlsgoTEpjqWBisYvcXoGKAhv5Mb5Nvczy7h+QnsZ84pQ8
	 /MJzfPscERCEuoXA8ew1PcCNOXO/pYLDPoKsPExMITelI1NuPuH793KOaGWS81Yn0f
	 wgBmT5lVPKgkncXhiyxS9cE1T0eIh6hUzw5jO1Xt0TeAAUtThDLZpnAH6lYBPrHDxZ
	 lzFqbn7yBpeHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] media: rc: sunxi-cir: add support for the A523
Reply-To: sashiko-reviews@lists.linux.dev
To: "Justin Suess" <utilityemal77@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702214750.3428694-3-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-3-utilityemal77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:00:18 +0000
Message-Id: <20260702220019.E2FBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect device registration order in probe and missing `rc_unreg=
ister_device` on failure leads to race conditions and Use-After-Free.
- [High] Rounding mismatch in timeout calculations causes the maximum timeo=
ut to wrap around to 0, breaking IR reception.
- [Medium] Malformed `clock-frequency` causes a division by zero kernel pan=
ic during timeout calculations.
- [Medium] Inconsistent use of DT-requested clock frequency versus actual c=
lock rate introduces timing inaccuracies.
--

commit ca10429d8baf92c8b3413bded6e91ab88182edf2
Author: Justin Suess <utilityemal77@gmail.com>

media: rc: sunxi-cir: add support for the A523

This patch adds support for the A523 (sun55i) SoC to the sunxi-cir
driver. It introduces support for programming pulse polarities and a
parameterized sample clock divider required by the newer IP revision.

> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c

[ ... ]

> @@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *de=
v_id)
> =20
>  /* Convert idle threshold to usec */
> -static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned i=
nt ithr)
> +static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned i=
nt div,
> +				       unsigned int ithr)
>  {
>  	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
> -				 base_clk / (128 * 64));
> +				 base_clk / (128 * div));

[Severity: Medium]
This is a pre-existing issue, but does this calculation risk a division by
zero panic during device probe?

If the clock provider rate evaluates to a value smaller than 128 * div,
base_clk / (128 * div) evaluates to 0. This resulting zero is then passed
as the divisor to DIV_ROUND_CLOSEST(), which would cause a panic.

>  }
> =20
>  /* Convert usec to idle threshold */
> -static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned i=
nt usec)
> +static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned i=
nt div,
> +				       unsigned int usec)
>  {
>  	/* make sure we don't end up with a timeout less than requested */
> -	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
> +	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
>  }
> =20
>  static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int time=
out)
>  {
>  	struct sunxi_ir *ir =3D rc_dev->priv;
>  	unsigned int base_clk =3D clk_get_rate(ir->clk);
> =20
> -	unsigned int ithr =3D sunxi_usec_to_ithr(base_clk, timeout);
> +	unsigned int ithr =3D sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
> +					       timeout);
> =20
>  	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
> =20
> -	/* Set noise threshold and idle threshold */
> -	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
> +	/* Set sample clock divider, noise threshold and idle threshold */
> +	writel(REG_CIR_SDIV(ir->sample_div_sel) |
> +	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
>  	       ir->base + SUNXI_IR_CIR_REG);

[Severity: High]
This is a pre-existing issue, but does the rounding mismatch between
sunxi_ithr_to_usec() and sunxi_usec_to_ithr() cause the maximum timeout
to wrap around to 0?

Because sunxi_ithr_to_usec() uses DIV_ROUND_CLOSEST, it can round the
fractional value up when calculating the maximum timeout. If userspace
requests this maximum timeout, sunxi_usec_to_ithr() uses DIV_ROUND_UP,
which pushes the resulting threshold over the maximum of 255 to 256.

Since REG_CIR_ITHR masks the value to 8 bits, passing 256 wraps it to 0
when written to the hardware, which would immediately break IR reception.

[ ... ]

> @@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *p=
dev)
>  	ir->rc->dev.parent =3D dev;
>  	ir->rc->allowed_protocols =3D RC_PROTO_BIT_ALL_IR_DECODER;
>  	/* Frequency after IR internal divider with sample period in us */
> -	ir->rc->rx_resolution =3D (USEC_PER_SEC / (b_clk_freq / 64));
> +	ir->rc->rx_resolution =3D (USEC_PER_SEC / (b_clk_freq / ir->sample_divi=
sor));

[Severity: Medium]
This is a pre-existing issue, but does this calculation introduce timing
inaccuracies by using the DT-requested clock frequency instead of the
actual clock rate?

If the clock provider rounds the requested rate set earlier in
sunxi_ir_probe(), using the raw b_clk_freq here instead of
clk_get_rate(ir->clk) means the software's sample period drifts from the
actual hardware timing.

[Severity: High]
This is a pre-existing issue, but does the registration order in
sunxi_ir_probe() create a race condition and potential Use-After-Free?

Looking later in sunxi_ir_probe(), rc_register_device() is called before
sunxi_ir_hw_init() enables the hardware clocks:

sunxi_ir_probe() {
    ...
    ret =3D rc_register_device(ir->rc);
    ...
    ret =3D sunxi_ir_hw_init(dev);
    ...
}

If userspace accesses the device via ioctl before the hardware clocks are
enabled, it will access clock-gated memory and cause a bus fault.

Additionally, if probe fails during hardware initialization or IRQ request,
it branches to the exit_free_dev label:

exit_free_dev:
    rc_free_device(ir->rc);

This only calls rc_free_device() without calling rc_unregister_device()
first. The device remains exposed to userspace while its backing driver
data is freed, which could lead to a Use-After-Free memory corruption.

>  	ir->rc->timeout =3D IR_DEFAULT_TIMEOUT;
> -	ir->rc->min_timeout =3D sunxi_ithr_to_usec(b_clk_freq, 0);
> -	ir->rc->max_timeout =3D sunxi_ithr_to_usec(b_clk_freq, 255);
> +	ir->rc->min_timeout =3D sunxi_ithr_to_usec(b_clk_freq, ir->sample_divis=
or, 0);
> +	ir->rc->max_timeout =3D sunxi_ithr_to_usec(b_clk_freq, ir->sample_divis=
or, 255);
>  	ir->rc->s_timeout =3D sunxi_ir_set_timeout;
>  	ir->rc->driver_name =3D SUNXI_IR_DEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702214750.3428=
694-1-utilityemal77@gmail.com?part=3D2
