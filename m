Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706084AA1E1
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364190; cv=none; b=o772YO0DaBLIdJPThMe46hDz5hQHwLfDPkRGaMnO4pdA33SDt5Bq/sy4JuXUJ44ZqsCb6rLjU0GQrWBuC4NdYIluP6bTR5bJs94Wcvd74mJqU46sy2CldOAgyOQ2SWNL5VOjNVp2Sz5mTUe222le2jQtjxlx5Jny6Gd/oO3LUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364190; c=relaxed/simple;
	bh=OA3Whh7HrtlUeo27jwsUBGNq7xuVx+/0/OGqt484wzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wn+K1MeU+o7LnRcHplYc5Jt1xiGMXYyf08b38tvDxd7KD+KXpjejjpzXMGHh4VepTU0M5e5LEs3+5lgQcF602sYAQ7nc00wjFrwxxhImfWLDtSOFT9spooTrblHWzFmSm+aWtRaU2+9UniZNdaUtQUk4UimmDq8B1N3x9uqAAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKtxobuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKtxobuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF1F1F00A3A;
	Wed,  2 Sep 2026 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364187;
	bh=+7FwXG2buKHq7IHFSDQyC5davNxGBnpboOXguXcpl+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKtxobujoATli44qXw/uIqgcm95+FcSMHQ5gnW219Pe9pqJ/Sn8hGmCdUbaUGALkw
	 8RS7oHANA7p7YUVM/vY2TdSibs7pF9wNEh2G+Bqogu82pNhlt+D2/bwup9nTLJkOW/
	 3dj6WliA+OW2XtQ01emOo4YAbx31ctDR3ZkDf6riZF91kJ1OLw0QNmNBG+n92UqA2b
	 5a0pS8SjtpXI80OE45k8DSWrsHqiwj+JQRureE2DiNuPhRlJhQYqaaqmpOndB/q3Vc
	 GI9UmAXDh39A1shHRYZI1NjZi0pdl7srsmmGwF0wp6TTPKmmg8ATCMDHflE1cNprp1
	 7OyvblWaEqpHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply
 A10 FIFO fill level workaround
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260902-spi-sun4i-fixes-v1-2-19985ef75673@pengutronix.de>
References: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
 <20260902-spi-sun4i-fixes-v1-2-19985ef75673@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:49:47 +0000
Message-Id: <20260902154947.9BF1F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition on the SPI transfer timeout path due to missing int=
errupt disable/locking, leading to concurrent FIFO access.
--

commit 1dffb9065c85ba457023e16b227c366bf84a8ee4
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level wor=
karound

This commit removes the length argument from sun4i_spi_fill_fifo() and upda=
tes
it to always apply the A10 FIFO fill level workaround internally. This ensu=
res
the TX FIFO is limited to SUN4I_FIFO_DEPTH - 1 bytes regardless of where the
function is called.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 2e23244539053..3649bcabcc9a7 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c

[ ... ]

> @@ -311,12 +317,8 @@ static int sun4i_spi_transfer_one(struct spi_control=
ler *host,
>  	sun4i_spi_write(sspi, SUN4I_BURST_CNT_REG, SUN4I_BURST_CNT(tfr->len));
>  	sun4i_spi_write(sspi, SUN4I_XMIT_CNT_REG, SUN4I_XMIT_CNT(tx_len));
> =20
> -	/*
> -	 * Fill the TX FIFO
> -	 * Filling the FIFO fully causes timeout for some reason
> -	 * at least on spi2 on A10s
> -	 */
> -	sun4i_spi_fill_fifo(sspi, SUN4I_FIFO_DEPTH - 1);
> +	/* Fill the TX FIFO */
> +	sun4i_spi_fill_fifo(sspi);
> =20
>  	/* Enable the interrupts */
>  	sun4i_spi_enable_interrupt(sspi, SUN4I_INT_CTL_TC |

[Severity: High]
Does this code expose a race condition on the SPI transfer timeout path due=
 to
missing interrupt disable or locking?

If wait_for_completion_timeout() times out later in sun4i_spi_transfer_one(=
),
the code calls sun4i_spi_drain_fifo() while SPI interrupts are still enable=
d:

sun4i_spi_transfer_one() {
    ...
    time_left =3D wait_for_completion_timeout(&sspi->done,
                                            msecs_to_jiffies(tx_time));

    sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
    ...
}

If the SUN4I_INT_CTL_RF_F34 interrupt fires concurrently, the IRQ handler in
sun4i_spi_handler() will also execute sun4i_spi_drain_fifo() on another CPU
without synchronization:

sun4i_spi_handler() {
    ...
    /* Receive FIFO 3/4 full */
    if (status & SUN4I_INT_CTL_RF_F34) {
        sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
        /* Only clear the interrupt _after_ draining the FIFO */
        sun4i_spi_write(sspi, SUN4I_INT_STA_REG, SUN4I_INT_CTL_RF_F34);
        return IRQ_HANDLED;
    }
    ...
}

Both threads will read from the hardware FIFO and increment sspi->rx_buf
locklessly. Can this cause a data race, duplicate bytes, and a buffer overf=
low
on sspi->rx_buf?=20

This would be reachable under error conditions or interrupt storms if a
hardware timeout occurs during an SPI transfer followed by an interrupt.

Note that this race was introduced by a subsequent patch in this series
('spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer
completion and RX FIFO interrupt') which moved the drain call outside the
timeout condition without disabling interrupts first.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-spi-sun4i-=
fixes-v1-0-19985ef75673@pengutronix.de?part=3D2
