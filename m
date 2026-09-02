Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D63C4575
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363785; cv=none; b=DzRFoi6wBA7h+O0pAkEdDO2A3ANsol2gfPhx1wf1SdbqbuLHhbMVJpjgAfiYSv39qLns/+bNE5cfJXRbXsANS0GLPe8Ko/gRN26JSfOg4cWzA7NuJPADSBh7HHWXMS1wPHKTF15HgaZxaNVukwPZsnZfNl18/u3QvwrS8y5gYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363785; c=relaxed/simple;
	bh=D71oXkm4HcVbMnzXExdDn3deEisuH5TDm3uNxzG9myg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kn3HlWEQSQyNCnHKVCRIk/ilcueSxWqSFwDfmZ8ZeaKrwqn8tVgW1+eLCQcw46GCUB9QZgbEHUho3nsV01vKXwCj5Up+RL0ZKaqurywiQ2fu6y+9sWiFKzAyQkqcQvxtyai5IiHmTDHywDQgE6spHhhgVU4q4WeYZZ5JF0pjaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKT/S9Ru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKT/S9Ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490AD1F000E9;
	Wed,  2 Sep 2026 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788363783;
	bh=JBNkJ6oeH1doZb/HK4cxIU6tJIzbpQPjaEYy/TH2gvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKT/S9RuFyfgskTAcE4ZtjtRg6lIC4bfuR3qdoxB2kbU7qBA4j6gwGKoQkrX0kHwR
	 UC7Pg4RN5LUeM06ab1ZWpvMibG2PWBk+XkkS8BEWlsgB+D/ysErNyLwAGdCDiE0M7n
	 Q+XtExiIq5tmKWX2cK3mWkN9elcuZ0PPufz9US4P764VaSSxDo/YDyhMLxSGrh+rwL
	 Wrcha0aXynAn1GwhlXyE3H7F+OuLFT4yEyTscXOZ84aiU9tfgCh22S+lzA8r2J1ZDC
	 Otm9tqt8TDTOT4+xN7JWFk/LreLyJK5Bqu/PQ7+eT/fAcMWzk8pVgjx3VOLxZaU43V
	 0NNaKMS+ObH6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] spi: spi-sun4i: sun4i_spi_transfer_one(): report
 effectively used speed_hz of transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260902-spi-sun4i-fixes-v1-5-19985ef75673@pengutronix.de>
References: <20260902-spi-sun4i-fixes-v1-0-19985ef75673@pengutronix.de>
 <20260902-spi-sun4i-fixes-v1-5-19985ef75673@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:43:02 +0000
Message-Id: <20260902154303.490AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Kernel panic due to division by zero when calculating `effective_s=
peed_hz` if `mclk_rate` evaluates to 0.
--

commit 035881eeeccd1fd72487c3c0c263d972c7662e72
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-sun4i: sun4i_spi_transfer_one(): report effectively used speed_hz =
of transfer

This commit updates the sun4i SPI driver to report the effectively used
transfer speed by setting tfr->effective_speed_hz. It calculates this
based on the chosen clock divider (CDR1 or CDR2).

> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 18951c1972da6..fff0065ce9af9 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
[ ... ]
> @@ -300,9 +300,11 @@ static int sun4i_spi_transfer_one(struct spi_control=
ler *host,
>  	div_cdr2 =3D DIV_ROUND_UP(div_cdr1, 2);
>  	if (div_cdr2 <=3D (SUN4I_CLK_CTL_CDR2_MASK + 1)) {
>  		reg =3D SUN4I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN4I_CLK_CTL_DRS;
> +		tfr->effective_speed_hz =3D mclk_rate / (2 * div_cdr2);

[Severity: High]
Could this result in a division by zero kernel panic if the clock rate
fails to initialize or is stubbed?

If clk_get_rate(sspi->mclk) returns 0 (which can happen if the clock is
missing or fails to set a rate), the calculation for div_cdr1 becomes:
div_cdr1 =3D DIV_ROUND_UP(0, tfr->speed_hz);

This evaluates to 0, which then makes div_cdr2 evaluate to 0:
div_cdr2 =3D DIV_ROUND_UP(0, 2);

Since 0 is less than or equal to SUN4I_CLK_CTL_CDR2_MASK + 1, this
branch is taken. The new code then evaluates to:
tfr->effective_speed_hz =3D 0 / (2 * 0);

Would it be safer to check if div_cdr2 is non-zero before performing
this division, or perhaps handle a 0 mclk_rate earlier in the function?

>  	} else {
>  		div =3D min(SUN4I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
>  		reg =3D SUN4I_CLK_CTL_CDR1(div);
> +		tfr->effective_speed_hz =3D mclk_rate / (1 << div);
>  	}
> =20
>  	sun4i_spi_write(sspi, SUN4I_CLK_CTL_REG, reg);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-spi-sun4i-=
fixes-v1-0-19985ef75673@pengutronix.de?part=3D5
