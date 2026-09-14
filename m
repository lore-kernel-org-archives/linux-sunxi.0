Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83219481A9E
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401010; cv=none; b=nrcbRw76Ec+fAMCY0B1Pnvo5ACCxahDBVuBQRZ8JMHDUONIJIgONAdLk1AwWynG9TVBK9kuIexsgvV4X33/nDkVdfX3SEJHMz0eP011w8TesWi9zDw2/p8qAfQDClV7PTI/zXi9eWuym9dKAIfyg+2T11DP+i73JfNaJThQGU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401010; c=relaxed/simple;
	bh=RbZCKlYd82LllWUN04IRvGhMEnYH6yRtO4RS8eyAzhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o73CV/KWXJfZ85jWCNy7zXZkQP6e1iTzqf8LJaZ2T3L9+SjpadlYEDzMJRua7MWAdnPPRuJ05kDqhjgcKa33HyzHcY16phIhckJ5sbtWbJ3/9rsCfNRtq2hQ9lCM7ISZUBAQxDnl/CCOx4R2k6HlpYNbIgZPK/HDYVY/2YIH61s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh/raM8R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh/raM8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B0B1F000FF;
	Mon, 14 Sep 2026 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789401009;
	bh=OrUwJ8UF7DLsA83eAuiN7PvG0DXTVqSKsBD1/HY3fPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dh/raM8RFWdGoFuemst5SzqczRRTTNJZnZmBXVY0evDnEB+JTU0RTjdhKZsdiQeyw
	 vxMaATM+QKfof/FGswUotxi4f6llPOniEUyqh/DUt+exJVQHrY/ENthoC4b3ztqetF
	 SSsLEI46IFvJe8IzePt99syPM/DVuihorOi4jW3yGSuNuurYp1BVtBcwCnSVflQNRw
	 WjT71bqzpbnmzPgV3DTz//DUh3pW7YIiiEl3bg3UE+7F8njhcGItS9Np7CEIx4il0H
	 +6iqAE+0ReBsskbebSKdXGdN7s93awHZLueB8v1DztNRZl/p92Y68iP1uhyaue1HE7
	 2YcfqgSVvQzWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] spi: spi-sun4i: sun4i_spi_fill_fifo(): always
 apply A10 FIFO fill level workaround
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260914-spi-sun4i-fixes-v3-2-9fe919d5cecf@pengutronix.de>
References: <20260914-spi-sun4i-fixes-v3-0-9fe919d5cecf@pengutronix.de>
 <20260914-spi-sun4i-fixes-v3-2-9fe919d5cecf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:50:08 +0000
Message-Id: <20260914155009.08B0B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Integer underflow in `sun4i_spi_fill_fifo()` causes an infinite lo=
op and buffer overflow when calculating available TX FIFO space.

Pre-existing issues:
- [High] Unbounded writes to the receive buffer in `sun4i_spi_drain_fifo` c=
an cause a heap buffer overflow.
--

commit 293e40dd169fc9a0b7d04d7abe8b6d6292a688f1
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level wor=
karound

This commit removes the length argument from sun4i_spi_fill_fifo() and
directly limits the TX FIFO fill level internally to work around timeouts
on A10s SoCs. It ensures the workaround is always applied regardless of
where the FIFO is refilled.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 2e23244539053..3649bcabcc9a7 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -142,15 +142,21 @@ static inline void sun4i_spi_drain_fifo(struct sun4=
i_spi *sspi, int len)
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does sun4i_spi_drain_fifo() lack bounds
checking against the allocated receive buffer size?

Looking at sun4i_spi_drain_fifo():

static inline void sun4i_spi_drain_fifo(struct sun4i_spi *sspi, int len)
{
        ...
        if (len > cnt)
                len =3D cnt;

        while (len--) {
                byte =3D readb(sspi->base_addr + SUN4I_RXDATA_REG);
                if (sspi->rx_buf)
                        *sspi->rx_buf++ =3D byte;
        }
}

Data from the hardware is read based on what the hardware reports as
available, and unconditionally written to sspi->rx_buf. It doesn't appear
to track the total bytes written against the transfer length limit.

If the hardware asserts spurious interrupts or reports more bytes than
requested (e.g., when called from sun4i_spi_handler with SUN4I_FIFO_DEPTH),
couldn't this blindly advance the pointer past the end of the allocation
and cause a heap buffer overflow?

> =20
> -static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi, int len)
> +static inline void sun4i_spi_fill_fifo(struct sun4i_spi *sspi)
>  {
>  	u32 cnt;
> +	int len;
>  	u8 byte;
> =20
> -	/* See how much data we can fit */
> -	cnt =3D SUN4I_FIFO_DEPTH - sun4i_spi_get_tx_fifo_count(sspi);
> +	/*
> +	 * See how much data we can fit
> +	 *
> +	 * Filling the FIFO fully causes timeout for some reason
> +	 * at least on spi2 on A10s
> +	 */
> +	cnt =3D SUN4I_FIFO_DEPTH - 1 - sun4i_spi_get_tx_fifo_count(sspi);
> =20
> -	len =3D min3(len, (int)cnt, sspi->len);
> +	len =3D min_t(int, cnt, sspi->len);
> =20
>  	while (len--) {
>  		byte =3D sspi->tx_buf ? *sspi->tx_buf++ : 0;

[Severity: High]
Can this subtraction underflow if the hardware reports a full FIFO?

If sun4i_spi_get_tx_fifo_count(sspi) returns 64 (the physical maximum
depth), cnt will evaluate to 63 - 64 =3D -1. Because cnt is a u32, this
underflows to 0xFFFFFFFF.

The min_t() macro then compares (int)0xFFFFFFFF (which is -1) against
sspi->len. Assuming sspi->len is greater than zero, min_t() returns -1.

The subsequent while (len--) loop will post-decrement on the negative
integer and could spin indefinitely, leading to out-of-bounds reads from
sspi->tx_buf and continuous writes to the memory-mapped register.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-spi-sun4i-=
fixes-v3-0-9fe919d5cecf@pengutronix.de?part=3D2
