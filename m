Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4C2F6577;
	Sun,  6 Sep 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734290; cv=none; b=PPeOKxBmC+SSGh0qCXVPBkpGt4jeO2yILbIovNEnb/ewPXD6Sg/jcAM+2lwkyfbJeUjpO2oAL9wKkC5UUWHAM/5xWuNSKaLLjML6LKaN+A89Z1ZelUKcty504r85D9s5rlmKdEgSmE83HIVwkXYSUirIOzaYPJMGPUt/VXvNFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734290; c=relaxed/simple;
	bh=kMjvCcaMvhAQChIZ2GSFf4YCkOieeTewNAfNlTSkRfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LiWK2bQeqsDNzZYP2b8E6umSUcZrdchisCg2qgYqg7xPgYtKOBIIzGrpHmovCw8cJ95Wfvcsj5gSpMpUxV715GXoQeNQUgjsrKYr+WHF7DdI3rsjoPQsQwTVgvrSwMHaSMeIfwXmYDkQtEPWJ4NkKg31HQ9Xkg/sXHEJG4m4Kv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtlFWxUD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtlFWxUD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13251F00A3A;
	Sun,  6 Sep 2026 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788734289;
	bh=NIF/FC6dzX++EzqCsN2zsRfswTPzHmi9gUna+uiJlKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtlFWxUDmM2vj4bE23SNSUgqnyXEmZubIOezwN/VIaR7Fy1c+jyX3xYYo0f5IZnfC
	 DjolwVajISgW+rqJQlAPSX0Xrlc/0yAbDhp7E6PG/q1R28qznk491NIQG6/znqXhH4
	 cT3RzwoFm5SxDL/E5+I2hiLqHhRubtK2G4E+X49JmDxkXzNkeTXiUmrKGWgm5wqYAR
	 JipvrzobsNjU3mfVUu5p+pSn96SjkYA1e7Yglmji9GeRprOL93zRYw+SKHOp5kmyDk
	 UYQBpU4rOcWhD5skDSx3h18XyaTX6Lf/2Sw62ayP58FNd7g0YUZbXM02eBWIDky5X4
	 aukpbw4g1Ds1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260906-submit-ac200-mfd-v10-2-f522e8dc2bd4@gmail.com>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
 <20260906-submit-ac200-mfd-v10-2-f522e8dc2bd4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 22:38:08 +0000
Message-Id: <20260906223808.C13251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Creating a local stack copy of the mfd_cell array for dynamic am=
endments violates MFD subsystem guidelines.
--

commit 89b84971b8215b5790b042d0288d352785ec348e
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: ac200: Add X-Powers AC200 support

This patch adds support for the X-Powers AC200 mixed-signal companion IC. It
provides shared regmap access, an IRQ controller for the INTB output, and
instantiates the individual function devices like the audio codec and TV
encoder.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> new file mode 100644
> index 0000000000000..30828e113c11b
> --- /dev/null
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
> +		of_node_put(child);
> +	}
> +
> +	if (!num_cells)
> +		return 0;
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells,
> +				   NULL, 0, NULL);

[Severity: Medium]
Does this pass a dynamically amended local stack copy of the mfd_cell array
to the MFD core?

The MFD subsystem guidelines advise against creating local copies of mfd_ce=
ll
arrays for dynamic amendments, as standard practice requires static const=20
references for these arrays.=20

Could this be updated so the static array is passed directly, leaving the
node availability checks to either the MFD core or the individual child
drivers during their own probe sequences?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-submit-ac2=
00-mfd-v10-0-f522e8dc2bd4@gmail.com?part=3D2
