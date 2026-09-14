Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB50468C27
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401004; cv=none; b=uQeAERZjEjt9xSn81+ZPctrhzQSziekUju+GaFPs3UMWyZDLZPVhLorF0dJH1dJEje7akFhrFPmnNuKv10U4pcUIqJxQThiJSH1B2uh1Hav6E4OESNjkpO5pTNPxUUJuluVhuc2U6q9Cq8/8QUR/Z1g57S+VnZYh5wGlZLoEgbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401004; c=relaxed/simple;
	bh=xnxbYcV1VJO0lP1P/0eZTLQBAgYYeoXah1eLptvw8cA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YBFMJoCnma3e5JWPcPQJvDMOPXnVpBbb1522XVcmY4vxEOU5UyDTdnDtrbgiaHgELBapthCgEBKY49tzfIbKgMSdC+chJs3QW4TayEFK9rbth/+Abbwt7nGt+Dqyw7bhM4ult1I0733BrCrQ2qMuMCfaxIuS/3v57iDlaqlKQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5yVq2a0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5yVq2a0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550CD1F000FF;
	Mon, 14 Sep 2026 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789401003;
	bh=JWvjcJ19aSdvbiT9S1QpaFb5kHQ8XjGCFJAspZV3auY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S5yVq2a0u+Rlr29yB2RmxLXwxGPcXHFdKxmk2Ly6QFmJW6pHJRtpOTUQ3FRtmEkzl
	 1C96Burafk3AnU5I4KofjDl9wpqD4suo/9K9q5tYqTHxpJRn32kyUqBzY/VFqJKwtw
	 6v5Usiw3N04goN7bBT5MEnA3KgLfDP3+bJoLWFnhxap3XOlEl8dQsWAG5lIYbC9npM
	 cHgmdgCaiTqvaAVvnWNA7ipsXNYB1a4PXw3fHpmATQg4qS3EGtOr0DketgP70gcUpm
	 fiTltlAlSEfLIS+jSA5PDohX1uom7vIgcBKtr2CfupjTvw0WdRpOpfNW4tFPnVAlR/
	 LLg3zJdS48v9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260914-spi-sun4i-fixes-v3-4-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
 <20260914-spi-sun4i-fixes-v3-4-9fe919d5cecf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:50:02 +0000
Message-Id: <20260914155003.550CD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The interrupt handler reads the interrupt status without masking=
 it with the interrupt enable register. Combined with the removal of the st=
atus bit clearing, this exposes the driver to spurious interrupts causing d=
estructive double-completions.

Pre-existing issues:
- [High] SMP read-modify-write data race on `SUN4I_INT_CTL_REG` between the=
 timeout path and the IRQ handler can re-enable disabled interrupts, leadin=
g to Use-After-Free.
- [High] The SPI interrupt is requested before the completion structure is =
initialized, exposing the driver to a NULL pointer dereference if an early =
interrupt fires.
--

commit a883667a9345430d63d8a01e0fab4daa8e1e23c6
Author: Marc Kleine-Budde <mkl@pengutronix.de>

    spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfe=
r completion and RX FIFO interrupt

    In commit 196737912da5 ("spi: sun4i: Allow transfers larger than FIFO
    size"), support for transfers larger than the FIFO size was added.
   =20
    This commit moves the draining of the RX-FIFO from
    sun4i_spi_transfer_one() (after completion of the transfer) to the IRQ
    handler when the IRQ "transfer complete" is handled. In addition, the
    IRQ "RX-FIFO 3/4 full" is activated for all transfers.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 8a9dcd3b6b8f4..ea8be0170fbfd 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -333,6 +335,7 @@ static int sun4i_spi_transfer_one(struct spi_controll=
er *host,
>  	start =3D jiffies;
>  	time_left =3D wait_for_completion_timeout(&sspi->done,
>  						msecs_to_jiffies(tx_time));
> +
>  	end =3D jiffies;
>  	if (!time_left) {
>  		dev_warn(&host->dev,
> @@ -340,12 +343,11 @@ static int sun4i_spi_transfer_one(struct spi_contro=
ller *host,
>  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
>  			 jiffies_to_msecs(end - start), tx_time);
>  		ret =3D -ETIMEDOUT;
> -		goto out;
> +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
> +		synchronize_irq(sspi->irq);
>  	}

[Severity: High]
This is a pre-existing issue, but does this timeout path create an SMP read-
modify-write data race with the IRQ handler?

If a timeout occurs, CPU0 executes sun4i_spi_write(sspi, SUN4I_INT_CTL_REG,=
 0).
Concurrently on CPU1, if the TF_E34 interrupt fires, the IRQ handler calls
sun4i_spi_disable_interrupt(), which performs a read-modify-write:

drivers/spi/spi-sun4i.c:sun4i_spi_disable_interrupt() {
	u32 reg =3D sun4i_spi_read(sspi, SUN4I_INT_CTL_REG);

	reg &=3D ~mask;
	sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, reg);
}

If CPU1 reads the register before CPU0 writes 0, and writes its value back
afterwards, it could unintentionally re-enable the TC and RF_F34 interrupts.
Could this lead to a use-after-free if the re-enabled interrupt later fires
and writes to a freed SPI buffer?

[ ... ]

> @@ -357,8 +359,7 @@ static irqreturn_t sun4i_spi_handler(int irq, void *d=
ev_id)
> =20
>  	/* Transfer complete */
>  	if (status & SUN4I_INT_CTL_TC) {
> -		sun4i_spi_write(sspi, SUN4I_INT_STA_REG, SUN4I_INT_CTL_TC);
> -		sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
> +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
>  		complete(&sspi->done);
>  		return IRQ_HANDLED;
>  	}

[Severity: Medium]
Will omitting the clearing of the status bit expose the driver to spurious
interrupts causing destructive double-completions?

The interrupt handler reads the status directly from the hardware without
masking it against the enabled interrupts in SUN4I_INT_CTL_REG:

drivers/spi/spi-sun4i.c:sun4i_spi_handler() {
	u32 status =3D sun4i_spi_read(sspi, SUN4I_INT_STA_REG);

	/* Transfer complete */
	if (status & SUN4I_INT_CTL_TC) {
		...
}

Because the pending interrupts are cleared at the start of a transfer in
sun4i_spi_transfer_one():

drivers/spi/spi-sun4i.c:sun4i_spi_transfer_one() {
	reinit_completion(&sspi->done);
	sspi->tx_buf =3D tfr->tx_buf;
	sspi->rx_buf =3D tfr->rx_buf;
	sspi->len =3D tfr->len;

	/* Clear pending interrupts */
	sun4i_spi_write(sspi, SUN4I_INT_STA_REG, ~0);
	...
}

There is a narrow race window here. If a spurious interrupt fires right aft=
er
reinit_completion() but before the status register is cleared, the unmasked
status check in the handler could see an old TC flag. Could this cause
complete(&sspi->done) to be called prematurely, leading the SPI core to
tear down an active transfer and result in data corruption?

[ ... ]

> @@ -456,6 +457,7 @@ static int sun4i_spi_probe(struct platform_device *pd=
ev)
>  		return ret;
>  	}
> =20
> +	sspi->irq =3D irq;
>  	sspi->host =3D host;
>  	host->max_speed_hz =3D 100 * 1000 * 1000;
>  	host->min_speed_hz =3D 3 * 1000;

[Severity: High]
This is a pre-existing issue, but is the IRQ requested before the completion
structure is initialized?

Earlier in sun4i_spi_probe(), the interrupt is requested:

drivers/spi/spi-sun4i.c:sun4i_spi_probe() {
	...
	ret =3D devm_request_irq(&pdev->dev, irq, sun4i_spi_handler,
			       0, "sun4i-spi", sspi);
	...
}

However, init_completion(&sspi->done) is only called later in the probe
sequence. If the bootloader leaves the SPI controller active with a pending
interrupt, it will be unmasked at the GIC and fire immediately when request=
ed.

The IRQ handler would then call complete(&sspi->done) on a zero-allocated,
uninitialized completion structure. Could this result in a NULL pointer
dereference and a kernel panic on boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-spi-sun4i-=
fixes-v3-0-9fe919d5cecf@pengutronix.de?part=3D4
