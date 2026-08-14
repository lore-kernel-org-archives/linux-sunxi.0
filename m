Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066D33B6F9
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741519; cv=none; b=g/H08zD3B/zAeUSKoF9MHhPYDWhL+9eobXX+6gD/OWe4otDej04za15kXZZZE1xypcB6I1cRSyiNOHxaU4ee/V6XnLvDoGzuWNdB+XrvqmGfei1Zh6p2dxXl/fJRZWqrlrGmy9j1nHfvARswza6A/G3HR2aPGS8caOYJpD/Ow6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741519; c=relaxed/simple;
	bh=krTpbe1WB2hYoad2Dq/c8r+tZaeAT8jUyYUlNAwXD54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M1KqtTHaMq+UmqCq9pWfp7yB+UB9RsMmVUpYOPYg+begwIvKbjc0l+9vsnfK2sxZV3a25/hf9tK9/ZZYSjZyrEppoFQGtz9P7qHz68wMwDEJ1V6ijwi0wIhCyatFXkcwomY0PKCTTLopuHLIPk5vAv8rkgbLyzDZc7quzdqIB/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOr+PAHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOr+PAHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C429A1F000E9;
	Fri, 14 Aug 2026 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786741518;
	bh=ks5Dj2iWNQ/oU8CuyW+3KohuIig9Ta+S0WP4ROOacPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOr+PAHQOv7jeGlDSXf5u+ljXO8683Xnm+A+qFs1WEEZks2T7T4jfbIR2vEK2TvMs
	 N7ozNQua4bNvgRop0GLWkwayPF1j4FQ0Podjk3auIpLNwJMfb9l+ZQtNsswwMmK3Ff
	 wYSaT2pQlhugGbj37E+tlAOn30ppnZXSYkc1erY3YQOyHScKcHlISmzEdrezfgiDVq
	 AQNOsvHJ7ZdDuNGZFOivHdJatnfKjotzDg/ucbJMcjT34Imbmj8sXVOkl2efZD7tg5
	 fVkBoI8V3ZRAQ8goCtv0/CaxOY+bCDgz/6df9vuswru9zGjhpxJXX7MCpEPMeyRj7t
	 STkgxYAvHr4qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] mailbox: sun6i: modernize probe and convert to fully
 managed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260814205553.39894-1-rosenp@gmail.com>
References: <20260814205553.39894-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 21:05:17 +0000
Message-Id: <20260814210517.C429A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent execution of the IRQ handler (`sun6i_msgbox_irq`) and t=
he channel shutdown path (`sun6i_msgbox_shutdown`) can lead to a NULL point=
er dereference of the mailbox client structure.
--

--- Patch [1]: [PATCHv2] mailbox: sun6i: modernize probe and convert to ful=
ly managed ---
commit 434af1afe360881d346c32eafbc6541d4984e655
Author: Rosen Penev <rosenp@gmail.com>

mailbox: sun6i: modernize probe and convert to fully managed

This commit modernizes the probe function by replacing irq_of_parse_and_map
with platform_get_irq, and converting clk, reset, and controller
registration to their fully devres-managed variants. It eliminates the
manual error paths and the remove callback.

> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbo=
x.c
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
[ ... ]
> @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_devic=
e *pdev)
[ ... ]
> -	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
> -			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -	if (ret) {
> -		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> +	ret =3D devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), =
mbox);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does the interrupt handler
have a race condition with the channel shutdown path?

If CPU0 calls mbox_free_channel() and invokes sun6i_msgbox_shutdown(),
it masks the interrupt in the hardware but does not synchronize with
already-running handlers:

drivers/mailbox/sun6i-msgbox.c:sun6i_msgbox_shutdown() {
    ...
    if (readl(mbox->regs + CTRL_REG(n)) & CTRL_RX(n)) {
        /* Disable the receive IRQ. */
        spin_lock(&mbox->lock);
        writel(readl(mbox->regs + LOCAL_IRQ_EN_REG) & ~RX_IRQ(n),
               mbox->regs + LOCAL_IRQ_EN_REG);
        spin_unlock(&mbox->lock);
    ...
}

If CPU1 is concurrently executing sun6i_msgbox_irq(), it can push data to
the framework without knowing the channel has been shut down:

drivers/mailbox/sun6i-msgbox.c:sun6i_msgbox_irq() {
    ...
    mbox_chan_received_data(chan, &msg);
    ...
}

Meanwhile, CPU0 can return from shutdown and set chan->cl to null in
mbox_clean_and_put_channel(). This causes CPU1 to trigger a null pointer
dereference when the framework locklessly accesses the client:

drivers/mailbox/mailbox.c:mbox_chan_received_data() {
    ...
    if (chan->cl->rx_callback)
        chan->cl->rx_callback(chan->cl, mssg);
    ...
}

Could this sequence actually occur and cause a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814205553.3989=
4-1-rosenp@gmail.com?part=3D1
