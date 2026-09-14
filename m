Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEF47F3DD
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400914; cv=none; b=VVZDfP6YE1stjFFphR5W6zyLgW6blqYizv+psww5ZcJDrSkf2eqHBpL3y1YjktZfiPoKIjHmVK54aQItdKSP29vEiM9irYnzVxuybi6qG+cW/8aD6+E/KXgILr2fksLtLYsqooSWLyUkeYRdxUWq4p9Rnjz3pohHxF4agskia30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400914; c=relaxed/simple;
	bh=C5NwsP/dH7avQZqssw7DYXzwiSyz7St91hFL6ftVITI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bq4M7+1lcCXhXo09ArjUMYtBC5gzsf0ttG7ie2aUvCgPuBq69DIbzUjkp6bgFcNv0xajSjTGC6wpiNdwaUFbC7alSbTLJuJaecKMt8kMkyth8s74+b0gWQHI3v+pcI1KEICjNybSktWx5wj7D053iWfsSj8hwXCiMvbzSF+J7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxJKSvcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxJKSvcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9350E1F000FF;
	Mon, 14 Sep 2026 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789400912;
	bh=1LMlj8tvcq2D21ZaFAlzPxvc4JhDBu0lsFX6zbyXYeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XxJKSvcGA2uZiVYy8lJW+RhIcgdlw7qtgqjMbgdny9t2aFkdkvI24aAaI8HsgIsaG
	 VK+j/tU7SGrYlJ0s8KW7mTuI82oaE59q6oPqJyXKxG5qFAPyWwQhJxUKkcuzWkJ+jA
	 rudUjzOb30Dy8r0cB1jU6GPFm8NnqCGaWoBg4vl1aHgHTfZvEbFhQS+krD3wDt4pbG
	 fLR5AQ0bnlZNhW+Rihcd5JzS9hzkxNDDavcbXLmeTdTUYhYZBVyktVS7HHKjfHk3+S
	 nsyIGC5LExupruuzbX5ecIYzr/QnwnoCUxVWd0nOJzpIct82hnNa7ZERUiaA/isPhg
	 h4AiDn4ada1Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] spi: spi-sun4i: sun4i_spi_transfer_one(): report
 effectively used speed_hz of transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260914-spi-sun4i-fixes-v3-6-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
 <20260914-spi-sun4i-fixes-v3-6-9fe919d5cecf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:48:32 +0000
Message-Id: <20260914154832.9350E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The SPI controller is not properly stopped or reset on transfer ti=
meout, leading to state corruption for subsequent transfers.
- [High] Potential out-of-bounds write in `sun4i_spi_drain_fifo` due to mis=
sing bounds check against the receive buffer length.
--

commit 6f977d6ebfc9cf20201026442f97064e4b99df02
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_transfer_one(): report effectively used speed_hz =
of transfer

Report the effectively used speed_hz for the transfer by setting
tfr->effective_speed_hz. This allows the SPI core to track the actual speed
used.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 94e1c7bbd6325..59941b38b7574 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -310,9 +310,11 @@ static int sun4i_spi_transfer_one(struct spi_control=
ler *host,
>  	div_cdr2 =3D DIV_ROUND_UP(div_cdr1, 2);
>  	if (div_cdr2 <=3D (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
>  		reg =3D SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
> +		tfr->effective_speed_hz =3D mclk_rate / (2 * div_cdr2);
>  	} else {
>  		div =3D min(SUN4I_CLK_CTL_CDR1_MASK + 1, order_base_2(div_cdr1));
>  		reg =3D SUN4I_CLK_CTL_CDR1(div - 1);
> +		tfr->effective_speed_hz =3D mclk_rate / (1 << div);
>  	}
> =20
>  	sun4i_spi_write(sspi, SUN4I_CLK_CTL_REG, reg);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the
timeout handling further down in sun4i_spi_transfer_one(). When a timeout
occurs, does the error path properly stop the hardware transfer?

In sun4i_spi_transfer_one():

    time_left =3D wait_for_completion_timeout(&sspi->done,
                                            msecs_to_jiffies(tx_time));
    ...
    if (!time_left) {
        dev_warn(&host->dev, ...);
        ret =3D -ETIMEDOUT;
        sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
        synchronize_irq(sspi->irq);
    }

It appears this path disables interrupts and returns but fails to clear the
SUN4I_CTL_XCH bit or issue a soft-reset to the controller. Could this leave
the hardware active and corrupt the state machine for subsequent transfers,
especially since the next transfer might read back and write XCH=3D1 during
setup?


[Severity: High]
This is also a pre-existing issue, but could the lack of a hardware reset
during a timeout trigger an out-of-bounds write in sun4i_spi_drain_fifo()?

If a timeout leaves XCH=3D1, the next transfer might start prematurely and
load data based on the previous burst count into the RX FIFO. When
sun4i_spi_drain_fifo() runs, it appears to blindly trust the hardware FIFO
count without verifying it against the size of the receive buffer:

    static inline void sun4i_spi_drain_fifo(struct sun4i_spi *sspi, int len)
    {
        ...
        reg =3D sun4i_spi_read(sspi, SUN4I_FIFO_STA_REG);
        reg &=3D SUN4I_FIFO_STA_RF_CNT_MASK;
        cnt =3D reg >> SUN4I_FIFO_STA_RF_CNT_BITS;

        if (len > cnt)
            len =3D cnt;

        while (len--) {
            byte =3D readb(sspi->base_addr + SUN4I_RXDATA_REG);
            if (sspi->rx_buf)
                *sspi->rx_buf++ =3D byte;
        }
    }

Since sun4i_spi_drain_fifo() is called with len =3D SUN4I_FIFO_DEPTH, if the
hardware provides more bytes than tfr->len, will this loop unconditionally
write past the end of sspi->rx_buf?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-spi-sun4i-=
fixes-v3-0-9fe919d5cecf@pengutronix.de?part=3D6
