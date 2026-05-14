Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48344450F2
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760969; cv=none; b=npHFA2wTNCSt4S9i+uw+ATSdMa3/kHug5rdJ3vyz1CuEtN1inctj5MFOMGSjg9IYar1pMFnIDTTzZc7YxecO1mXFj34vHcxHqK0+JfUmK3uS52F68ws7wKfzJJ5XpMGyxH1J5kA1FRQiRhKqDg9CNlrNaORGfIwh/UP4tgrZAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760969; c=relaxed/simple;
	bh=2V4SLiA3wW29QspwGoWEgaATM0utxyW7w1qrQgVnE1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sxlM4dtGXpQlCB5/aO4wseAdAaAPXVyAE0b2GkaAPVhK5gZIMstWZ6dmj1blJRbqE3acsXGXg60+18B/qjpbkrzFKP5A5HAitlCcLQR0scdP4wUnOIHKkkOyv6OWlE39ipjF4XjZFGejqlylr2t2l7OTBcZCCp82PAPWRRYhp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0kV4dKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0kV4dKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF78FC2BCB3;
	Thu, 14 May 2026 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760969;
	bh=2V4SLiA3wW29QspwGoWEgaATM0utxyW7w1qrQgVnE1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M0kV4dKCrb2zEq7qUPk/QZr9S0Sa3hxl+sNMuFiUdNoOr1qdmdXcNoK0Lu75jcAqL
	 0U18N/KJa8E8z4NK0W21JiXPlxqlhzAwD/LfG8FbiNTe04EJvmc0k19TNdzrFU49rM
	 2B0lJsUlbV/ijHZ4JWyagsuU6oZJFbaE4dKg2Ymv3dMY397jISGFmwwYMFwq+3XxcK
	 7aQu/PuQKcM3LwwOCmdu/3HIaF7+VKHb7mjlvmwbr/rvHdesOse1zyV/hdv6clFMfy
	 V2mx6soBo8abtR0fm1hxq7h58Q2wLzrPIjfbaV1oy6aEVChj/KmYp8ZjVV6Wd+9neh
	 t1YWJfk2+AWtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] iio: adc: sun20i-gpadc: support non-contiguous
 channel lookups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl>
References: <20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:16:08 +0000
Message-Id: <20260514121608.EF78FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing validation of iiospec->nargs leads to uninitialized stac=
k memory read
- [Low] Spelling and grammar errors in the commit message
--

commit 0da362a2628891f0ec84a4906fcbc3b1521286d2
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

iio: adc: sun20i-gpadc: support non-contiguous channel lookups

This commit adds a fwnode_xlate callback to support sparse channel maps
by mapping the devicetree phandle argument to the registered channel whose
ID matches the hardware channel number.

> Using consumer driver like iio-hwmon which resolve channels thorugh
> io-channels phandles will fail for sparse channels because IIO core by
> default threats phandle argument as index into channel array.

This isn't a bug, but there are typos in the commit message: "thorugh"
instead of "through", and "threats" instead of "treats".

> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 861c14da75add..78c9a52f38df0 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c

[ ... ]

> @@ -139,8 +139,20 @@ static irqreturn_t sun20i_gpadc_irq_handler(int irq,=
 void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int
> +sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> +			  const struct fwnode_reference_args *iiospec)
> +{
> +	for (unsigned int i =3D 0; i < indio_dev->num_channels; i++)
> +		if (indio_dev->channels[i].channel =3D=3D iiospec->args[0])

Is it possible to read uninitialized stack memory here?

The IIO core function __fwnode_iio_channel_get() allocates iiospec on the
stack without zero-initializing it. When parsing a reference from a
malformed devicetree node (e.g., #io-channel-cells =3D <0>), an ACPI table,
or a software node, fwnode_property_get_reference_args() returns success
and sets iiospec->nargs =3D 0 but leaves the args array unmodified.

If iiospec->nargs is not verified, this evaluates iiospec->args[0]
using uninitialized memory. If this garbage data happens to match an
existing channel ID, the driver could spuriously map a random channel.

Should this function check if iiospec->nargs < 1 before accessing the
arguments array?

> +			return i;
> +
> +	return -EINVAL;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-fix-sunxi-=
gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl?part=3D1
