Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C03D16FC;
	Thu, 17 Sep 2026 04:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620153; cv=none; b=YNTRgTjLWp7NfkIA2z3B+3QCs8riqtASDZ6PjkHJ3S4AeaD2804jL7bWK4ZxGebmSKuAj+VxK0PD+eizZnU3lbXR2dfxY6df41pyZWMuotXc7BM4rczvE7rqVgqRsDRjh0JXHKOqLj+Ma0NQxWTETSIcq0ajoC/Er2x/z4Us8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620153; c=relaxed/simple;
	bh=iOBYGCcUCfmsNWf+BzqQHThbA94au9hWYnPqo7zKu9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWO1WWx0XZwIYIhNGlWiJ3Ee0BcUlVMTfB1lmxJCzRRG388evLIlb7KOwtkoiOGR/LsskVV2vUljCFGAvQ4+Jv0cj3kzgizFcDPC/uAlZTAlIlKn0ZVwHDWUCaSYSn1OJRdFdHglqFOFnW5ZKckN2XbfO3SbddUa1Av5OhcP2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0fO+X4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0fO+X4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100981F00898;
	Thu, 17 Sep 2026 04:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789620152;
	bh=LYj1Y9FtvdMw0tExYKNybvzhpOWVnppooG9/RmRb0Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R0fO+X4BnJe2ubYla2LPd5jOERriPZo2uLrBMbMaX09lsj4eOeyKAR11x4LmCT03y
	 NT4Y66Qi2K0MAvAHwL2ETENEFct4XfNbibKmfOaOS2tVI6cNIv1UrpK/NyUGqo3Yxz
	 Ua01sC0HhXaR5jWkEG+gAz3b0Kj4EdfFM+3eA7ye6WRiiG3+ggx+VS9HzX8PpbdglX
	 +0F7K0t2fwzpcvecrmMBXGU54UQikxzyYpBpE5Ag7a5SNWQGpMWfKfPmtXfR3OdzEt
	 lBVk7ucUSqrmW8QpEcd6gU80ni78OMFjFo/XbpyEg1ouJJNA/nQ+llA0aaLPP+3Q6m
	 iJKr7Q4f/bVEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/4] net: phy: Add Allwinner AC300 EPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxhc3RhaXIgRCdTaWx2YQ==?= <alastair@d-silva.org>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916044119.475666-3-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-3-alastair@d-silva.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 04:42:31 +0000
Message-Id: <20260917044232.100981F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phy: ac300: leaked PHY page state on error paths
- [High] net: phy: ac300: race condition in paged PHY register access
- [Medium] pm: incorrect PHY suspend sequence causes MDIO operations on pow=
ered-down device
--

commit f19e9d7452b2e059755510b20bf6ea442e025e0f
Author: Alastair D'Silva <alastair@d-silva.org>

net: phy: Add Allwinner AC300 EPHY driver

Adds support for the Allwinner AC300 integrated Fast Ethernet Physical
Layer (EPHY) co-packaged on Allwinner H616 and H618 SoCs.

> diff --git a/drivers/net/phy/ac300-phy.c b/drivers/net/phy/ac300-phy.c
> new file mode 100644
> index 0000000000000..c70f567c31794
> --- /dev/null
> +++ b/drivers/net/phy/ac300-phy.c

[ ... ]

> +static int ac300_phy_config_init(struct phy_device *phydev)
> +{
> +	struct ac300_phy_priv *priv =3D phydev->priv;
> +	int ret;
> +
> +	/* Write page-based EPHY transceiver and signal path optimizations */
> +	ret =3D phy_write(phydev, 0x1f, 0x0100); /* Switch to Page 1 */
> +	if (ret)
> +		return ret;
> +	ret =3D phy_write(phydev, 0x12, 0x4824); /* Disable APS */

[Severity: High]
Can a concurrent MDIO operation interleave during this unlocked window?
phy_write() internally acquires and immediately releases the shared mdio_lo=
ck
for each individual register access. This leaves the MDIO bus unlocked betw=
een
the page switch and the data write. Should the driver hold mdio_lock across
the entire page manipulation sequence, or implement the .write_page callback
and use phy_write_paged() instead?

> +	if (ret)
> +		return ret;

[Severity: High]
If a transient MDIO error occurs and triggers this early return, does this
leave the PHY permanently stuck on Page 1 instead of restoring it to Page 0?
Subsequent PHY operations, including generic link status polling like
genphy_read_status(), assume the PHY is on Page 0 and might read garbage da=
ta
if left on the wrong page.

> +
> +	ret =3D phy_write(phydev, 0x1f, 0x0200); /* Switch to Page 2 */

[ ... ]

> +static int ac300_phy_suspend(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret =3D ac300_phy_disable(phydev);
> +	if (ret)
> +		return ret;
> +	return genphy_suspend(phydev);

[Severity: Medium]
Will genphy_suspend() fail or produce warnings when called here?
ac300_phy_disable() powers down and resets the PHY, but genphy_suspend()
subsequently issues standard IEEE MDIO writes to MII_BMCR to set BMCR_PDOWN.
Should genphy_suspend() be called while the hardware is still active, before
powering it down?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916044119.4756=
66-1-alastair@d-silva.org?part=3D2
