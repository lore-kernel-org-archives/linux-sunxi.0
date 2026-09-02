Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E94A3F18
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364067; cv=none; b=HTF0QsvWkwR3A17O1htyvqI9egRllyzUgWqE9SlmlpEIqq58ugfs1nDbYRVj1SFGHlvb+ak4LiP7B8AAJ2kvR5PKQaiVwhsoUtqIuVGQ4swSM/jxENx+uVY9O48Zi6J9eN+gZ8FL7W/mfunw3XBalmn29q54FRXLSKJM6svPvy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364067; c=relaxed/simple;
	bh=LULypjSJPZHX0S+lwyp8i+Jev8Pj8uLnzWnS3hB5e38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q17eNIBWaB49/Og3vgGAGCcUh8hxpufoDRInlLizvFhdDLzWRL5kLals9oK17NQahldkGHy9aR1vyzXpJ//CsBg1t5rowgYKcx/b0BF4Ci7WAMG3jhmzrdd0BGKNs5UJsd8FcbHcJTpzT3TJwJIpbufLHBOu3ExlKi+DsFtl6eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfyccQE8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfyccQE8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748AB1F00A3A;
	Wed,  2 Sep 2026 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364064;
	bh=UqIScFc4FivkxZTLi6CYRzjegzniZrysefN5rqBfyUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gfyccQE8MJkSqdcB+jYGkNhMXtVw2cK9y9sXrpxUV9nQMs2A2INM7aEUQegIff7KP
	 BIjfrRlNEjXjdlPIsnWl3NNaWDRIM2xh0chSorP9RZrN/CC70IBToj3DSXYfHY79Bl
	 TKHz8oOl9j+zP10nHJnd+SZBzC6XKa2n5dzuodbpWes13pNtYg166iRVWy9S4mfTnX
	 kUIkKxaMZLAsaFFYJw00V3ro49gGY6d/bsSsGn6ax7hTpO6/JdUNGe1YF7+FLXWmTU
	 HSJ0HKg8TkXAAUJLWwi05RYUlMcj37JCFdSnix0XYwj9SrtRllYAx59vQv1T4RvIBv
	 RhPuzh0rBDXYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260902-spi-sun4i-fixes-v1-4-19985ef75673@pengutronix.de>
References: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
 <20260902-spi-sun4i-fixes-v1-4-19985ef75673@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:47:44 +0000
Message-Id: <20260902154744.748AB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Data race and out-of-bounds write due to unsafe concurrent executi=
on of `sun4i_spi_drain_fifo()` on the timeout path.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing IRQ sync=
hronization on the timeout error path leads to use-after-free and state cor=
ruption.
--

commit 2cab2ade096996934bf270db7137df45f943bc9b
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer co=
mpletion and RX FIFO interrupt

This commit moves the RX-FIFO draining back to sun4i_spi_transfer_one() and
attempts to close a race window by disabling interrupts early in the IRQ
handler.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index ae009d5984505..18951c1972da6 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -333,6 +333,9 @@ static int sun4i_spi_transfer_one(struct spi_controll=
er *host,
>  	start =3D jiffies;
>  	time_left =3D wait_for_completion_timeout(&sspi->done,
>  						msecs_to_jiffies(tx_time));
> +
> +	sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
> +

[Severity: High]
Can this unconditionally drain the FIFO while interrupts are still enabled?

If wait_for_completion_timeout() times out, the main thread will call
sun4i_spi_drain_fifo(). Because SPI interrupts are not disabled until the
subsequent timeout error block, a SUN4I_INT_CTL_RF_F34 interrupt can
fire concurrently.

This allows sun4i_spi_handler() to also invoke sun4i_spi_drain_fifo()
simultaneously:

CPU1:
sun4i_spi_transfer_one()
    sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
        if (sspi->rx_buf)
            *sspi->rx_buf++ =3D byte;

CPU2:
sun4i_spi_handler()
    if (status & SUN4I_INT_CTL_RF_F34) {
        sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
            if (sspi->rx_buf)
                *sspi->rx_buf++ =3D byte;

Could this concurrent execution lead to non-atomic increments of sspi->rx_b=
uf,
pointer corruption, and potential out-of-bounds memory writes?

>  	end =3D jiffies;
>  	if (!time_left) {
>  		dev_warn(&host->dev,
> @@ -340,13 +343,12 @@ static int sun4i_spi_transfer_one(struct spi_contro=
ller *host,
>  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
>  			 jiffies_to_msecs(end - start), tx_time);
>  		ret =3D -ETIMEDOUT;
> +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
>  		goto out;
>  	}
> =20
> =20
>  out:
> -	sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
> -
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the timeout error path
need synchronization with currently executing IRQ handlers?

If an SPI transfer times out while the IRQ handler is already executing on
another CPU, the transfer function will disable interrupts at the controller
level, return -ETIMEDOUT, and the SPI core will tear down the transfer.

Since the code does not wait for in-flight handlers using synchronize_irq()
or a lock, the still-running sun4i_spi_handler() can subsequently write to
freed buffers in sun4i_spi_drain_fifo(), or call complete(&sspi->done)
which corrupts the state of the next transfer.

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-spi-sun4i-=
fixes-v1-0-19985ef75673@pengutronix.de?part=3D4
