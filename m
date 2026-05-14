Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC62989B5
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 03:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730849; cv=none; b=gEBdFC0ylCwJv+RFnrqC+/MIzP12Vz3ucbRVLla9dAjhBFMaGlWCHQL2kkw55ms6gVQ3l/sd2X1pkKp47PDUH274yIzVoPA7SEBdTnTnOpwxjlcxTahYFUZmtTk/GUuygJvl3hCC7jukn/gUXWg40VKtr2xOv605xcK1HkfHASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730849; c=relaxed/simple;
	bh=MY7bOLosAKsZquOyggD2EO9Gtx6yqrYBQT0YdkXnxXY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K5TjPt+rNIwVkUzMcqN7t/77pqHqxVb8GYPX85vcV9xyo9ty7NXMP0OEgs8WemJeLSBn1wweGjJpP/kZ+AAxi/J4xdrbGaGBUCh9p6hlYRe/ALmHZWH/JzAERhnjwqhmWZK7xYt4XA7LunBBnDNS+JjuO1agPNOWopE6u1PnUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXHIOLm8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXHIOLm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AE9C2BCB7;
	Thu, 14 May 2026 03:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778730848;
	bh=MY7bOLosAKsZquOyggD2EO9Gtx6yqrYBQT0YdkXnxXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UXHIOLm8tAlwMxnRk6UsUtSg74ECkEd1oHXwm66YxomwZwnpS60hs+uOkFrdBRKPC
	 eEMktLTkClh/yDEoYyCAaecuy1hVuW2K4ZlTfWrpAKkM54xqSYAkRjQAN7PCqFogig
	 zkIbY1eEhDhgeqmPeZJkmAtStjjtQfjErQKQtpWvmuO48xuuDA5pHXPZcYrW3EmR2z
	 n4MqDtCNrwUIxT4r0+CX4UtD7POov4HSGL8v2SMJyBiJjlNXv0DQwkoi68JAk0cJb9
	 s1/d3aZq5BXJ2Iy4kg1xb8qe/ORK8xPvldAhwpLqnZsXD399W1FZQLWYOtt1JzSCCQ
	 ECKBEXaexvfyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] iio: adc: sun20i-gpadc: support non-contiguous channel
 lookups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
References: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:54:08 +0000
Message-Id: <20260514035408.A9AE9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing bounds check on `iiospec->nargs` leads to uninitialized =
stack memory read
--

commit b20d529d5a2f9f0071b7ae62b25da6250c765297
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

iio: adc: sun20i-gpadc: support non-contiguous channel lookups

This commit adds a fwnode_xlate callback to map a device tree phandle
argument to the registered channel. This allows the driver to support
non-contiguous channel lookups for consumers like iio-hwmon.

> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 861c14da75add..95f34a3521583 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
[ ... ]
> +static int sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> +		const struct fwnode_reference_args *iiospec)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < indio_dev->num_channels; i++)
> +		if (indio_dev->channels[i].channel =3D=3D iiospec->args[0])

Could this read uninitialized stack memory if the consumer requests a chann=
el
with 0 arguments?

In the IIO core, __fwnode_iio_channel_get() allocates the iiospec structure
on the stack without zero-initializing it. While the Device Tree backend
zero-initializes unused arguments, other backends like Software Nodes
might not.

If iiospec->nargs is 0, this comparison could use a garbage value from the
stack, leading to unpredictable channel selection or probe failure.

Should we verify if (!iiospec->nargs) before accessing iiospec->args[0]?

> +			return i;
> +
> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-fix-sunxi-=
gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl?part=3D1
