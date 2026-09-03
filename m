Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67A44781A;
	Thu,  3 Sep 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466814; cv=none; b=NBqmD4vDViEaF7ANtqL1e7dNovUh/+TtV8i+yVpSlJUmOGl0sWAJVN7GX98z9NQW8ttqRtFvgWhBiXyZ2xpTZAG/gHnUvhJekX6xvJjvYleT1n7L5wmMec6HiBfAqDv/pPmWgBrcUXh4vAZ/j1jq1CJZvX+FVLjkur3R694jujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466814; c=relaxed/simple;
	bh=zF9kMV/aAEf21S3NPX57vhzag76ttWzk3Z9zl3MtyZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=frpz3T9zyylu1fyv5iXgW6iPaCYDgLm0p7ChZjqqoHnNRrynZXMqgWuMiFMfxZ1FdjJWIdCbnBdqWHKCWFaEE1/PHNPlg9rKY+x+M+dkqCrxKjxfheHREk0lZ39BSffj67Aph28u0iH4IzvjOMs3/cH8+BlNZTOkhtMQAIGt+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivTcQs0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivTcQs0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06D81F000E9;
	Thu,  3 Sep 2026 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466803;
	bh=ay/xH8T4gQaCzQHXuDjeB/c7+4a0w7FaqRDMG3rlkC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivTcQs0XjLp8/z5ZJPxR6XVsM4P3uKZKVOA4Rf1ENfOv1OPegeVJMm6z/OGI7zV/k
	 dYGYl/n63Ek1qxy9CTtfEOInYaHllCf2/N13cPi7wTfR005/nPd9kenBb/3dST6s3U
	 appznPMfORm1BguFpa0EU1dyRhzgk7p2OuQyeGC734TDFzLQifzosOKFkjWHy5JAF0
	 ziZSdj3T6oeN1g+oPlfy0AMeNahu0eCt67XSbRtbIVAX7cpCRdzIxS7xZ21yADk4GW
	 0vB5cP7p44x3a0PQk+h6yI1mfv6xV+aOIlzxaE8IWppBkSS0T2FEA4cgt4sS6ac8co
	 53XillpdDLa4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/4] mfd: ac200: Add codec and TV encoder cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-sunxi@lists.linux.dev
In-Reply-To: <20260903-submit-ac200-mfd-v9-4-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-4-6b7ed278989c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:20:02 +0000
Message-Id: <20260903202002.E06D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Using PLATFORM_DEVID_NONE instead of PLATFORM_DEVID_AUTO causes =
sysfs device naming collisions.
- [Low] Dynamic creation of a local stack copy of the mfd_cell array for fi=
ltering violates MFD architectural rules.
--

commit 5b7692c955e218224dd53b696f2b08c851828b93
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

mfd: ac200: Add codec and TV encoder cells

Register the AC200 audio codec and TV encoder as MFD cells when their
enabled child nodes are present. Filtering the cell list avoids creating
unused platform devices.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> index 94aa13deb0f8c..f7d818141d9cb 100644
> --- a/drivers/mfd/ac200.c
> +++ b/drivers/mfd/ac200.c
[ ... ]
> +static int ac200_add_devices(struct device *dev)
> +{
> +	struct mfd_cell cells[ARRAY_SIZE(ac200_cells)];
> +	unsigned int num_cells =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ac200_cells); i++) {
> +		const struct mfd_cell *cell =3D &ac200_cells[i];
> +		struct device_node *child;
> +
> +		child =3D of_get_compatible_child(dev->of_node,
> +						cell->of_compatible);
> +		if (!child)
> +			continue;
> +		if (of_device_is_available(child))
> +			cells[num_cells++] =3D *cell;

[Severity: Low]
Does creating a dynamic local stack copy of the mfd_cell array here
violate the MFD architectural guidelines?

The MFD subsystem rules typically require cell arrays to remain static cons=
t.
Dynamically amending and explicitly copying into a local array during probe
in ac200_add_devices() bypasses the standard static definition approach.=20

Could this instead use static references or a switch statement if variants=
=20
or filtering are needed?

> +		of_node_put(child);
> +	}
> +
> +	if (!num_cells)
> +		return 0;
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, cells, num_cells,
> +				   NULL, 0, NULL);

[Severity: Medium]
Can passing PLATFORM_DEVID_NONE here cause sysfs device naming collisions?

If a system developer instantiates multiple AC200 chips in the device tree,
the second instance might fail during devm_mfd_add_devices() because both
instances will attempt to register child platform devices with identical
hard-coded names (like 'ac200-codec').

Would it be safer to use PLATFORM_DEVID_AUTO to allow automatic cell
indexing and properly support multi-instance configurations?

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add function devices\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-submit-ac2=
00-mfd-v9-0-6b7ed278989c@gmail.com?part=3D4
