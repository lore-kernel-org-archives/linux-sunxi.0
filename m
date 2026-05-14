Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD42D3EF2;
	Thu, 14 May 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725779; cv=none; b=t5a7NtQhB2M6MgOhwWfAfbb4nlo4VwoVm0imUmPo07UczI60VDZoceI/zbXXr/Zw3DEb/GQB/lDs2VGhdxvzgVrdBF+fSY0myVzV37diJ04kShhPw+zWE/jWYVeloGM8GH2QvcF8IsvMtsNDaayI2hNC1JhJ8lfG1/xrQ61dpc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725779; c=relaxed/simple;
	bh=UUSAxOI+k3W9IGtr2fELZf9Wm7ZNchPQsmG34mI/Pik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTaIWnvlrNh6dHec8QQ73f30wLKuv5GkcvxAF8NRy+mbQ4yeJV66+6bXjZfgtATnI2eZ5ObSP8cevMEsbnn1KF+Sye4e4LetuigoTEec/43zh0LnhnJrI6KHMATAY52EW6Mwx0h4uTtlQ7ZWyf8SxLO/2cxY9HLXZaC9iEPBOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7TtMoZj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7TtMoZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5889BC19425;
	Thu, 14 May 2026 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778725778;
	bh=UUSAxOI+k3W9IGtr2fELZf9Wm7ZNchPQsmG34mI/Pik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=E7TtMoZjV9oTmwL687sSBMVHk2tti/Dh/AMHjDl5ni+j18llDi5dMd1/I1E6yZ6dS
	 W03TMH7c3IuC6BlTNtcKetVOLL183+hJVNwsDDbB6pvNAASAHo5kiHgy7oV4rf72ie
	 TSW7ZWMWpmtgwoWvBLh1+JO2bW2eH0gQNfhsb0S6YGe3csfrx+RJay1GuPTucwGV4x
	 GjxaSf3nSSHHPqZfDxxMq9aCXExkGoKW2lA2W8pBiO0CKNcZob8dWDdT1zk2pNqxJl
	 2a5MKIijJgkLKcDbJ/3yslAoi3IdszHQHMbfbz89rrOUlNmIsRLxI1jz6XMiwIRHHD
	 zEDb0cPj+J1lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:29:37 +0000
Message-Id: <20260514022938.5889BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] If `devm_clk_bulk_get_all_enabled()` returns 0 (meaning no clocks =
are defined in the device tree), the driver aborts the probe early but inco=
rrectly returns 0 (success).
--

commit 6e1c58e982371b9be677bdb51d74117b3577cd6f
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

iio: adc: sun20i-gpadc: add A523 gpadc support

This commit adds support for the A523 gpadc by switching to the bulk clock
API to handle both bus and module clocks.

> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 861c14da75add..3f1f07b3a3856 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
[ ... ]
> @@ -205,9 +205,11 @@ static int sun20i_gpadc_probe(struct platform_device=
 *pdev)
>  	if (IS_ERR(info->regs))
>  		return PTR_ERR(info->regs);
> =20
> -	clk =3D devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(clk))
> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n"=
);
> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret <=3D 0)
> +		return dev_err_probe(
> +			dev, ret,
> +			"failed to enable clocks or no clocks defined\n");

When devm_clk_bulk_get_all_enabled() returns 0 (meaning no clocks are defin=
ed),
will this code return 0 from the probe function?

Since dev_err_probe() returns the error code passed to it, returning 0 here
would cause sun20i_gpadc_probe() to succeed while skipping all remaining
initialization like reset deassertion, IRQ registration, and IIO device
registration.

Should ret be explicitly set to a negative error code (like -ENODEV) before
calling dev_err_probe() if ret is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-sunxi-a523=
-gpadc-v2-0-d5efde151dac@mmpsystems.pl?part=3D2
