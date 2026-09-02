Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666354A64C1
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364174; cv=none; b=jPIW1rqTqNcZJindF6GpCA4erH9mio2/Lan4tWnFPVGGI3opKNL9gFXsK5C7oP0X/nR8K7f0y7li1DDU/cq8/UKSpFztXkKnXfqwPUqAZv+96Q3b40z4fbv2id5XYfP6vQqwt4FxwvLmDcGbqJELtTQzWW+RF2912tXai2tfO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364174; c=relaxed/simple;
	bh=WDCuYonDybo3b/tVuXG+0QccmE+NqUQOW6h5QQnV7cQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O/xLLONTyvtNrBEvznP+DCCaPkQNqKp/igeaviAdPa9HuWMvggpM73uaqPErXkxB5477TGjAgr9k3XqDNpR2T+BsKwHJoawNTcERsRzfCRlC4t+1p/IJFvtamMN+KfRzQjN58xaVqaaDLdZVPbhfPhVudbgb2/EOWWmc+P4tloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTMcRvWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTMcRvWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155791F00A3A;
	Wed,  2 Sep 2026 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364172;
	bh=bx55eSXbcDH4nPmbKvgfBX7g4ycH6V29BXSR+J8EmEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTMcRvWZMQ0AQkSSVsCPtPQQ0FsuNTxDqGrJSfDNXHtEKshTDSAIZsT6HPC/H3s3f
	 t1ZiITqVa4O2qO4aTE2L+9gxNAhu1GBHBKizS1rn9tXJRbEDqV84miOC4Dj3Aaz3kE
	 RTYt30IG7rxaRti3XuGzGc87xU9ub42Z1tgKUBqwytYAQy9LkTjO8Uqbp4ZAWTrHOh
	 tEiKlqsNr30rEhqGQ6rZVLgTD7X3hHqWs05dP1xPVkFmWNLU0GmupTdExY4tia+89O
	 dAz64V3St5hZ3mLlNkDQVjJSVxhviSPHH0uk8EbwTqe9KqspxcBLccZn1MfDIlP6uY
	 NmINAwpFjoSuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] spi: spi-sun4i: sun4i_spi_transfer_one(): fix
 transfers for SUN4I_FIFO_DEPTH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260902-spi-sun4i-fixes-v1-1-19985ef75673@pengutronix.de>
References: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
 <20260902-spi-sun4i-fixes-v1-1-19985ef75673@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:49:30 +0000
Message-Id: <20260902154931.155791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If the hardware reports a TX FIFO count greater than SUN4I_FIFO_DE=
PTH - 1 (e.g., a full FIFO of 64), sun4i_spi_fill_fifo encounters an intege=
r underflow and enters a nearly infinite loop.
--

commit bfe90ee7eb547aed612b50ceef43a3538623eb4d
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_transfer_one(): fix transfers for SUN4I_FIFO_DEPTH

This commit fixes SPI transfers with exactly 64 bytes by enabling the
TX-FIFO empty interrupt when the transfer length is greater than
SUN4I_FIFO_DEPTH - 1. Previously, the interrupt was only enabled for
transfers strictly larger than the 64-byte FIFO, causing timeouts since
only 63 bytes are initially filled.

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index d5c16392cd4d7..2e23244539053 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -322,7 +322,7 @@ static int sun4i_spi_transfer_one(struct spi_controll=
er *host,
>  	sun4i_spi_enable_interrupt(sspi, SUN4I_INT_CTL_TC |
>  					 SUN4I_INT_CTL_RF_F34);
>  	/* Only enable Tx FIFO interrupt if we really need it */
> -	if (tx_len > SUN4I_FIFO_DEPTH)
> +	if (tx_len > SUN4I_FIFO_DEPTH - 1)
>  		sun4i_spi_enable_interrupt(sspi, SUN4I_INT_CTL_TF_E34);

[Severity: High]
This isn't a bug introduced by this patch, but does the hardware reporting a
TX FIFO count greater than SUN4I_FIFO_DEPTH - 1 cause an integer underflow?

If sun4i_spi_get_tx_fifo_count(sspi) returns a value >=3D 64 (which is
structurally possible since SUN4I_FIFO_DEPTH is 64 and the register mask is
0x7f), the unsigned subtraction in sun4i_spi_fill_fifo() underflows:

drivers/spi/spi-sun4i.c:sun4i_spi_fill_fifo() {
	cnt =3D SUN4I_FIFO_DEPTH - 1 - sun4i_spi_get_tx_fifo_count(sspi);

	len =3D min_t(int, cnt, sspi->len);

	while (len--) {
		...
}

This underflow produces 0xFFFFFFFF, which min_t(int, cnt, sspi->len) casts
to -1.

This negative length could cause the while (len--) loop to evaluate -1 as
true, turning it into an infinite loop that executes ~4 billion times and
overruns sspi->tx_buf.

This problem appears to be made more likely by the subsequent commit "spi:
spi-sun4i: sun4i_spi_fill_fifo(): always apply A10 FIFO fill level
workaround" which lowered the underflow threshold from > 64 to >=3D 64.

Can this out-of-bounds memory access occur if the hardware FIFO is complete=
ly
full (64 bytes) or reports spurious values?

> =20
>  	/* Start the transfer */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-spi-sun4i-=
fixes-v1-0-19985ef75673@pengutronix.de?part=3D1
