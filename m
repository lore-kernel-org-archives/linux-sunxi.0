Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8F218EBA;
	Thu,  3 Sep 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466902; cv=none; b=jBkhAn0YMmbXbldJ8H+RToenA+c7+uxaFaPGViAcqqPFaN2SR5CNQVyMbvkYk01pzBTPfgfVoNAZUm7USGdEqu84daDIozuql+Lz/xdRcp+QAMdzqBvdRUUyCGDhCL+cLRxrXC+1p+QZhDvMVgcru74FP3Bh3O7/YScbNdLllOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466902; c=relaxed/simple;
	bh=C06TrYzedZxZ2WddrSMRQ7b2wCm8FuWvqCEZZ0sdWtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TgTcWsr3u1MFtQkek2PcOI6Sa5VEPcfIwB504OmxrkQupHlwl0EuavxYyxRbCWfqRYyBwckgM9Ng8gDBnEDyFNPPzrS8oHqJYODGdXESQHFgDncI+TjgG+q8TtVTR6kQ+usai+VHkxE7OeveqO3CbZp7L9hc6XutuhBFPcMcVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFYpulWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFYpulWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD771F00A3E;
	Thu,  3 Sep 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466889;
	bh=SXhOH/bttQJcbxEJzN+35NF0/M45fA/TvqTKDA/6pdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFYpulWKS3peh6ogDaKVDlCG4Jvz7nsEUazj60+JIECYsNZKxYe8d5ogx/ho/fJIF
	 U+RuyxYlISPFAtKpKLf6kwzyDfpLJbCZOOz4IbBu++91O+kUyujkEPRDfy/rsyUQ+T
	 Qx1qFrZmrIvXPJe+Bln92UHbT4BBTpme9a8n4tpFG6aKSv5XrAK/hwcQTkPZjYGMV9
	 14P7C+vCa2ThPKzBjAjCioWzKqbf4aUgRZ5/7Bebkn+ZqXl9K27WUBvU2UPGR7wnmr
	 4TU08M4X10SnicrXreYQ71TpgBgTuKmT7M04E6MsNnQvFaLU451u1ALlrFw1p2YRpP
	 bvoHBrPQPP4Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/4] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260903-submit-ac200-mfd-v9-2-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-2-6b7ed278989c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:21:28 +0000
Message-Id: <20260903202129.4DD771F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Regmap exposed to userspace and consumers before hardware initia=
lization delay completes.
--

commit 35526ae046a1822af569d5228aa956640657303c
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: ac200: Add X-Powers AC200 support

This commit adds MFD core driver support for the X-Powers AC200 mixed-signal
companion IC. It configures the shared regmap over I2C, handles clock
enabling, and manages the common reset state for the device.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> new file mode 100644
> index 0000000000000..94aa13deb0f8c
> --- /dev/null
> +++ b/drivers/mfd/ac200.c

[ ... ]

> +static int ac200_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk =3D devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable input clock\n");
> +
> +	ret =3D devm_clk_rate_exclusive_get(dev, clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
> +
> +	regmap =3D devm_regmap_init_i2c(client, &ac200_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to initialize regmap\n");
> +
> +	/*
> +	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
> +	 * before its first AC200 register access after enabling the input cloc=
k.
> +	 */
> +	msleep(40);

[Severity: Medium]
Could exposing the regmap before the 40 ms initialization delay completes l=
ead
to I2C bus lockups or device malfunctions?

The devm_regmap_init_i2c() call exposes the regmap to userspace via debugfs
and to other consumers, such as an asynchronously probing Ethernet PHY. Dur=
ing
this 40 ms window, these concurrent access paths might attempt to access the
hardware before the stabilization delay is met.

Would it be safer to move the msleep(40) above the regmap initialization to
prevent this race condition?

> +
> +	ret =3D regmap_set_bits(regmap, AC200_SYS_CONTROL_REG,
> +			      AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-submit-ac2=
00-mfd-v9-0-6b7ed278989c@gmail.com?part=3D2
