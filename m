Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9943A809
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Sep 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795892; cv=none; b=K7ogGfShaIb9jIs8UrVJ4RaBTnRa6aZNPfZqSkA7A5pqiUt3mLpp3zftQEop+Byhz/z2CR4RJKKPTbfdo2CCNcY2XamwV370ursQuqMprqt0MYzQLLss/8W3CEYxao9Sc//F35GiAIWJtXACz+vS+LNAuriqtk64a1VGvDrDsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795892; c=relaxed/simple;
	bh=vDXeoKCcbzBb+V7m0UGu7NqMZjpXiiuSeqxhXWf1SXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XDQFhiBM5AYxoiRayGEejwZkASrRRjl2JujuGCYJcbT7bp4QDgdXB+naLjvHxl6oPq3n9kiHU4ViOBHp/g/tHW1lcnWDEsJYeWjaYpT8sgKElgCALHLAYZd6RFR0gmrrzYDznpRCZslIiOP3OQ0A37YR0pRLfmfTyZbLf4TKo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APXA2rCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APXA2rCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5161F00A3A;
	Mon,  7 Sep 2026 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795887;
	bh=wpaX8UX7iDqr/qN8Hgzr3vYk3uE7mF9XzrbK9pt251o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APXA2rCW1IG7h6zfq0PJex8xxrukGmAArF7zEWxKmCcaUJFmHCxArJ05zZ5D40XYu
	 VXcUFDfnYd3RkebuiS+NzosPWMrM3q4/XheymiAmg5t2D4rnCe0XJ9ClFz0CGwSUDW
	 bJXS5SR8PKuVoavFeRey3exsoRp6Y5rpjlZln+S4UMzrFSSuqcJvVl4//MdxdtB2W1
	 9wlPZzsgL71aVtYpAsvDK/KqfTH5E2dUS1xHQ0pZKqKxlUaXFtOwrAxj0YTt7CyZgl
	 7nKF65z+hpaUfRel0pfhkc7xCATgyMZiOnaFSTDUtXCQPalqeBMY0ccuFcrTSw+ApV
	 AgXUnASlcexiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260907-spi-sun4i-fixes-v2-4-7e805662b9bd@pengutronix.de>
References: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
 <20260907-spi-sun4i-fixes-v2-4-7e805662b9bd@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:44:46 +0000
Message-Id: <20260907154447.0A5161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing Interrupt Acknowledgment causes race condition and data co=
rruption.

Pre-existing issues:
- [High] Interrupt requested before clocks enabled and synchronization prim=
itives initialized.
--

commit 56eb9747daccb855b98e335a87134c61f8b8487e
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer co=
mpletion and RX FIFO interrupt

This commit moves RX-FIFO draining back to sun4i_spi_transfer_one() and
disables all interrupts in the IRQ handler when processing the transfer
complete interrupt to close a race window.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 8a9dcd3b6b8f4..ea8be0170fbfd 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c

[ ... ]

> @@ -357,8 +359,7 @@ static irqreturn_t sun4i_spi_handler(int irq, void *d=
ev_id)
> =20
>  	/* Transfer complete */
>  	if (status & SUN4I_INT_CTL_TC) {
> -		sun4i_spi_write(sspi, SUN4I_INT_STA_REG, SUN4I_INT_CTL_TC);
> -		sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
> +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);

[Severity: High]
Does this change leave the Transfer Complete (TC) bit active in the status
register?

It looks like replacing the write to SUN4I_INT_STA_REG with a write to
SUN4I_INT_CTL_REG masks the interrupt, but fails to acknowledge and clear
the pending status bit.

If a spurious interrupt fires during the setup of a new transfer, could this
cause the new transfer to complete prematurely? For example, in
sun4i_spi_transfer_one(), there is a window between reinitializing the
completion and clearing the status register:

	reinit_completion(&sspi->done);
	sspi->tx_buf =3D tfr->tx_buf;
	sspi->rx_buf =3D tfr->rx_buf;
	sspi->len =3D tfr->len;

	/* Clear pending interrupts */
	sun4i_spi_write(sspi, SUN4I_INT_STA_REG, ~0);

If a spurious interrupt arrives just before SUN4I_INT_STA_REG is cleared,
the handler will read the stale TC bit and call complete(&sspi->done). The
wait_for_completion_timeout() would then return immediately, potentially
leading to use-after-free of DMA buffers or silent data corruption since the
hardware might still be active.

>  		complete(&sspi->done);
>  		return IRQ_HANDLED;
>  	}

[ ... ]

> @@ -456,6 +457,7 @@ static int sun4i_spi_probe(struct platform_device *pd=
ev)
>  		return ret;
>  	}
> =20
> +	sspi->irq =3D irq;

[Severity: High]
This is a pre-existing issue, but looking at the surrounding probe function,
is it safe to request the IRQ before the clocks are enabled and the
completion is initialized?

In sun4i_spi_probe(), devm_request_irq() is called just above this hunk,
enabling the IRQ line. However, the completion structure is initialized much
later via init_completion(&sspi->done), and the AHB/module clocks required
for MMIO access are only enabled during sun4i_spi_runtime_resume().

If the bootloader left the interrupt asserted (e.g., during kexec) or a
spurious interrupt fires before initialization is complete, the handler
sun4i_spi_handler() could execute early. Accessing MMIO registers without
the AHB clock enabled often causes a synchronous external abort on ARM.
Additionally, calling complete() on an uninitialized completion structure
dereferences an invalid waitqueue lock, resulting in an Oops.

>  	sspi->host =3D host;
>  	host->max_speed_hz =3D 100 * 1000 * 1000;
>  	host->min_speed_hz =3D 3 * 1000;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-spi-sun4i-=
fixes-v2-0-7e805662b9bd@pengutronix.de?part=3D4
