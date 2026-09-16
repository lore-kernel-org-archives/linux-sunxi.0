Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4BB4EC64E
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649198; cv=none; b=TNZd4QJWSsGBh/wkvVKn32rqWEtE9OZ+A564yKWEP+aruXXMa7jKceBBmbtEjv3gApM/QXvl7y+l062UbEXZWwV/bjuix+JCucsrP4Oe6IPe+GF8jGBpbhxMYNCWp5JJvKZZKys7PLJ/Et8vKGUksREfvMZRmM6pjdVSTf99h5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649198; c=relaxed/simple;
	bh=k3ScdfA9PqDWRY3MfiNIIXC+eBpcIk4o416YThAwRLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjiyPlJ6Gds8eVC9/203HSnjZearN20yuHfOcL4GK7Ywy+KRTbul3OH8lOKoh1YNpPrV+rl5JP+GOGQgsMzuM7m3Ay5sNA5tCERnWxF3MkfpZv0sVje35cX27kQILyu/pMqXwp5ZP1uek+xHlCEmNzQc65inrlazqQYR0FFnmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 662AD200291;
	Thu, 17 Sep 2026 14:46:08 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1x7BVA-001OrE-11;
	Thu, 17 Sep 2026 14:46:08 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8A79C59EEA1;
	Wed, 16 Sep 2026 11:40:18 +0000 (UTC)
Date: Wed, 16 Sep 2026 13:40:18 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: sashiko-bot@kernel.org
Cc: Jonas Rebmann <jre@pengutronix.de>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
Message-ID: <20260916-ambitious-lively-herring-c04878-mkl@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
 <20260914-spi-sun4i-fixes-v3-4-9fe919d5cecf@pengutronix.de>
 <20260914155003.550CD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkto3urghvvrvzgc"
Content-Disposition: inline
In-Reply-To: <20260914155003.550CD1F000FF@smtp.kernel.org>


--lkto3urghvvrvzgc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
MIME-Version: 1.0

Dear humans,

On 14.09.2026 15:50:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The interrupt handler reads the interrupt status without
>   masking it with the interrupt enable register. Combined with the
>   removal of the status bit clearing, this exposes the driver to
>   spurious interrupts causing destructive double-completions.

Spurious interrupts have not been observed with this hardware.

> Pre-existing issues:
> - [High] SMP read-modify-write data race on `SUN4I_INT_CTL_REG` between t=
he timeout path and the IRQ handler can re-enable disabled interrupts, lead=
ing to Use-After-Free.
> - [High] The SPI interrupt is requested before the completion structure i=
s initialized, exposing the driver to a NULL pointer dereference if an earl=
y interrupt fires.
> --
>
> commit a883667a9345430d63d8a01e0fab4daa8e1e23c6
> Author: Marc Kleine-Budde <mkl@pengutronix.de>
>
>     spi: spi-sun4i: sun4i_spi_handler(): fix race condition between trans=
fer completion and RX FIFO interrupt
>
>     In commit 196737912da5 ("spi: sun4i: Allow transfers larger than FIFO
>     size"), support for transfers larger than the FIFO size was added.
>
>     This commit moves the draining of the RX-FIFO from
>     sun4i_spi_transfer_one() (after completion of the transfer) to the IRQ
>     handler when the IRQ "transfer complete" is handled. In addition, the
>     IRQ "RX-FIFO 3/4 full" is activated for all transfers.
>
> > diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> > index 8a9dcd3b6b8f4..ea8be0170fbfd 100644
> > --- a/drivers/spi/spi-sun4i.c
> > +++ b/drivers/spi/spi-sun4i.c
> > @@ -333,6 +335,7 @@ static int sun4i_spi_transfer_one(struct spi_contro=
ller *host,
> >  	start =3D jiffies;
> >  	time_left =3D wait_for_completion_timeout(&sspi->done,
> >  						msecs_to_jiffies(tx_time));
> > +
> >  	end =3D jiffies;
> >  	if (!time_left) {
> >  		dev_warn(&host->dev,
> > @@ -340,12 +343,11 @@ static int sun4i_spi_transfer_one(struct spi_cont=
roller *host,
> >  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
> >  			 jiffies_to_msecs(end - start), tx_time);
> >  		ret =3D -ETIMEDOUT;
> > -		goto out;
> > +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
> > +		synchronize_irq(sspi->irq);
> >  	}
>
> [Severity: High]
> This is a pre-existing issue, but does this timeout path create an SMP re=
ad-
> modify-write data race with the IRQ handler?
>
> If a timeout occurs, CPU0 executes sun4i_spi_write(sspi, SUN4I_INT_CTL_RE=
G, 0).
> Concurrently on CPU1, if the TF_E34 interrupt fires, the IRQ handler calls
> sun4i_spi_disable_interrupt(), which performs a read-modify-write:
>
> drivers/spi/spi-sun4i.c:sun4i_spi_disable_interrupt() {
> 	u32 reg =3D sun4i_spi_read(sspi, SUN4I_INT_CTL_REG);
>
> 	reg &=3D ~mask;
> 	sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, reg);
> }
>
> If CPU1 reads the register before CPU0 writes 0, and writes its value back
> afterwards, it could unintentionally re-enable the TC and RF_F34 interrup=
ts.
> Could this lead to a use-after-free if the re-enabled interrupt later fir=
es
> and writes to a freed SPI buffer?
>
> [ ... ]
>
> > @@ -357,8 +359,7 @@ static irqreturn_t sun4i_spi_handler(int irq, void =
*dev_id)
> >
> >  	/* Transfer complete */
> >  	if (status & SUN4I_INT_CTL_TC) {
> > -		sun4i_spi_write(sspi, SUN4I_INT_STA_REG, SUN4I_INT_CTL_TC);
> > -		sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
> > +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
> >  		complete(&sspi->done);
> >  		return IRQ_HANDLED;
> >  	}
>
> [Severity: Medium]
> Will omitting the clearing of the status bit expose the driver to spurious
> interrupts causing destructive double-completions?

Spurious interrupts have not been observed with this hardware.

> The interrupt handler reads the status directly from the hardware without
> masking it against the enabled interrupts in SUN4I_INT_CTL_REG:
>
> drivers/spi/spi-sun4i.c:sun4i_spi_handler() {
> 	u32 status =3D sun4i_spi_read(sspi, SUN4I_INT_STA_REG);
>
> 	/* Transfer complete */
> 	if (status & SUN4I_INT_CTL_TC) {
> 		...
> }
>
> Because the pending interrupts are cleared at the start of a transfer in
> sun4i_spi_transfer_one():
>
> drivers/spi/spi-sun4i.c:sun4i_spi_transfer_one() {
> 	reinit_completion(&sspi->done);
> 	sspi->tx_buf =3D tfr->tx_buf;
> 	sspi->rx_buf =3D tfr->rx_buf;
> 	sspi->len =3D tfr->len;
>
> 	/* Clear pending interrupts */
> 	sun4i_spi_write(sspi, SUN4I_INT_STA_REG, ~0);
> 	...
> }
>
> There is a narrow race window here. If a spurious interrupt fires right a=
fter
> reinit_completion() but before the status register is cleared, the unmask=
ed
> status check in the handler could see an old TC flag. Could this cause
> complete(&sspi->done) to be called prematurely, leading the SPI core to
> tear down an active transfer and result in data corruption?

Spurious interrupts have not been observed with this hardware.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lkto3urghvvrvzgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaqqAIAAKCRDMOmT6rpmt
0o6VAQCjOhOzbjOxaDaqLEnuul3cawf0ui56KDHCUxMg0K/JTwD8DexFwfGRQqL5
Ebw/AhtCxEjvtG+J9PFqqRC+BAKLsww=
=i8p4
-----END PGP SIGNATURE-----

--lkto3urghvvrvzgc--
