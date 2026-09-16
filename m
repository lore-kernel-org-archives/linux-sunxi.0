Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5884F55A8
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649186; cv=none; b=pJaMgJuVelFa8ZHUcjAGbehbfb2TIxMSvGVGrLQKPdUm1DdGZz5XnTNUl5qyiL2wNH+13mpR0I5mRFVkxY3pa7nDUXdec55QfuWApqAy3PzW9jmT3xBD36Wi33Rey2tT1Yy/M9isa6CzfwIU3xaTZrnwvJ6I/j0rJ9bpc5WxKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649186; c=relaxed/simple;
	bh=VVOd418ipnUWK70ISoczhfylE3iZAA07Z64cOP7S1sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs7ju0QwUEifl6TModqmaSju0gWDDA32sfp9DgoxZfI/pxUiY01VQOlWP1e5Gx2O3TBKakvrXy8ogJHMbvc83vJ/amozm1fgXCZCy31T1AiZ1Rs/UMQA57h+2jWecm95sG4rP+GJw/oxeqbPH16VMkKFyZkAFO4p1kRXYw92/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 51EA7200124;
	Thu, 17 Sep 2026 14:46:08 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1x7BVA-001OrC-0l;
	Thu, 17 Sep 2026 14:46:08 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2714759EE96;
	Wed, 16 Sep 2026 11:36:15 +0000 (UTC)
Date: Wed, 16 Sep 2026 13:36:14 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: sashiko-bot@kernel.org
Cc: Jonas Rebmann <jre@pengutronix.de>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/6] spi: spi-sun4i: sun4i_spi_fill_fifo(): always
 apply A10 FIFO fill level workaround
Message-ID: <20260916-affable-skinny-emu-22b0c2-mkl@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
 <20260914-spi-sun4i-fixes-v3-2-9fe919d5cecf@pengutronix.de>
 <20260914155009.08B0B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tt6ri7wspiufulxs"
Content-Disposition: inline
In-Reply-To: <20260914155009.08B0B1F000FF@smtp.kernel.org>


--tt6ri7wspiufulxs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/6] spi: spi-sun4i: sun4i_spi_fill_fifo(): always
 apply A10 FIFO fill level workaround
MIME-Version: 1.0

Dear humans,

On 14.09.2026 15:50:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Integer underflow in `sun4i_spi_fill_fifo()` causes an infinite =
loop and buffer overflow when calculating available TX FIFO space.
>
> Pre-existing issues:
> - [High] Unbounded writes to the receive buffer in `sun4i_spi_drain_fifo`=
 can cause a heap buffer overflow.
> --
>
> commit 293e40dd169fc9a0b7d04d7abe8b6d6292a688f1
> Author: Marc Kleine-Budde <mkl@pengutronix.de>
>
> spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level w=
orkaround
>
> This commit removes the length argument from sun4i_spi_fill_fifo() and
> directly limits the TX FIFO fill level internally to work around timeouts
> on A10s SoCs. It ensures the workaround is always applied regardless of
> where the FIFO is refilled.
>
> > diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> > index 2e23244539053..3649bcabcc9a7 100644
> > --- a/drivers/spi/spi-sun4i.c
> > +++ b/drivers/spi/spi-sun4i.c
> > @@ -142,15 +142,21 @@ static inline void sun4i_spi_drain_fifo(struct su=
n4i_spi *sspi, int len)
> >  	}
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but does sun4i_spi_drain_fifo() lack bounds
> checking against the allocated receive buffer size?
>
> Looking at sun4i_spi_drain_fifo():
>
> static inline void sun4i_spi_drain_fifo(struct sun4i_spi *sspi, int len)
> {
>         ...
>         if (len > cnt)
>                 len =3D cnt;
>
>         while (len--) {
>                 byte =3D readb(sspi->base_addr + SUN4I_RXDATA_REG);
>                 if (sspi->rx_buf)
>                         *sspi->rx_buf++ =3D byte;
>         }
> }
>
> Data from the hardware is read based on what the hardware reports as
> available, and unconditionally written to sspi->rx_buf. It doesn't appear
> to track the total bytes written against the transfer length limit.
>
> If the hardware asserts spurious interrupts or reports more bytes than
> requested (e.g., when called from sun4i_spi_handler with SUN4I_FIFO_DEPTH=
),
> couldn't this blindly advance the pointer past the end of the allocation
> and cause a heap buffer overflow?

Neither spurious interrupts nor more bytes than requested have been
observed. So far we trust the hardware.

> >
> > -static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi, int len)
> > +static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi)
> >  {
> >  	u32 cnt;
> > +	int len;
> >  	u8 byte;
> >
> > -	/* See how much data we can fit */
> > -	cnt =3D SUN4I_FIFO_DEPTH - sun4i_spi_get_tx_fifo_count(sspi);
> > +	/*
> > +	 * See how much data we can fit
> > +	 *
> > +	 * Filling the FIFO fully causes timeout for some reason
> > +	 * at least on spi2 on A10s
> > +	 */
> > +	cnt =3D SUN4I_FIFO_DEPTH - 1 - sun4i_spi_get_tx_fifo_count(sspi);
> >
> > -	len =3D min3(len, (int)cnt, sspi->len);
> > +	len =3D min_t(int, cnt, sspi->len);
> >
> >  	while (len--) {
> >  		byte =3D sspi->tx_buf ? *sspi->tx_buf++ : 0;
>
> [Severity: High]
> Can this subtraction underflow if the hardware reports a full FIFO?

With this change the hardware TX buffer is only filled up to
SUN4I_FIFO_DEPTH - 1, so it will never report to be filled with
SUN4I_FIFO_DEPTH.

> If sun4i_spi_get_tx_fifo_count(sspi) returns 64 (the physical maximum
> depth), cnt will evaluate to 63 - 64 =3D -1. Because cnt is a u32, this
> underflows to 0xFFFFFFFF.
>
> The min_t() macro then compares (int)0xFFFFFFFF (which is -1) against
> sspi->len. Assuming sspi->len is greater than zero, min_t() returns -1.
>
> The subsequent while (len--) loop will post-decrement on the negative
> integer and could spin indefinitely, leading to out-of-bounds reads from
> sspi->tx_buf and continuous writes to the memory-mapped register.

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tt6ri7wspiufulxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaqp/LAAKCRDMOmT6rpmt
0jBsAQDC1yVL9EOc0hrCJbwgAo2yO7x47SYMo2Rc1+1eVySJoQEA24lMAq/pDYN+
vlaCA9pxJbdUeQbMQUI0NulpOkUv6gM=
=sxEv
-----END PGP SIGNATURE-----

--tt6ri7wspiufulxs--
