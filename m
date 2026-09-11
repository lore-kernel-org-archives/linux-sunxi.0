Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE025776;
	Fri, 11 Sep 2026 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122350; cv=none; b=sn4jKcDrVyyjX7UmwdV0bBh3q1Ax0PoX80/38zTVnyhMG8Kb4FIdC7D/oLWtmWrXeAq/62qO7wUkyBYWmoRXdBtGuWmA7Ms6d3hSnTZx0/7DOxi+DVgwgNZl2o1EEWpueXXJ3gFQ5wqp9g2mgSHD1j5XuUgiWbfpYw38MQHy97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122350; c=relaxed/simple;
	bh=1j10lVz9ztdLzz1VqqwL4Xu4TzfFZhref/B8LBC0Xnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KWj93+wx4AXtSzRt+heVrv+u1My8d05r1iQZ4C2glFah/RkYqwQ2nxv9Gxx9o3BPEgh9CaEPH3BmjGqB9NSf147z2e0PAzLNirrXORmCDDxEAWm8cwWs4nEgDRC/2McjH26CuIrUYDlYmGYBkBVqbQd1R7OalNcl0xYEfMaOh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKuD3+HJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKuD3+HJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABB81F000FF;
	Fri, 11 Sep 2026 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122349;
	bh=Xm8LpErDgPLwVyb/O9eV1KPkABEqE0lOrqlk7CzKl2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aKuD3+HJYcw04ugsm/HD5ZRGKrPJPIY0rhXqbdux7VqZcRhCcIZdmnhfCLBBYFeqC
	 n/dsm+alqUHQzkmvRvXJE40Jr/SEBbMeF/wxJhlLJfYmz0UPrIf4x3hagy9f377xEw
	 4nmDKKu0hYHCTEblu/fAUD7KcUWXGv1YDPoKvw+q//MSPJrGrKE/VZYG55MqWLnP6G
	 wx4QPuKYEnryFnjLhUFM/Yn4uZL/Z2dt+YXM5OROoJTuJXx2ni6/JFem9oS7sr8SWW
	 TSdnKPwpGC87sDgc1jRHvmsnY2ZwX6gSnw82UfKDuCIyzR6Sz20a8b01fvM3oqzK76
	 isKGCZGvv88tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:25:48 +0000
Message-Id: <20260911102548.AABB81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Writing to the GMAC configuration MMIO registers before the requir=
ed AHB reset is deasserted and bus clocks are enabled will cause a bus faul=
t (synchronous external abort) and hang the system.
- [Medium] Hardware configuration programmed into the controller's glue reg=
isters will be lost if the power domain is cycled during suspend, because t=
he driver lacks a resume callback.
--

commit b1b91e273360986b68768571246550826028aa8d
Author: Jerome Brunet <jbrunet@baylibre.com>

net: stmmac: Add support for Allwinner A733 GMAC210

This commit adds support for the A733 GMAC210 controller, introducing
a dedicated MMIO region for glue configuration registers. It handles TX
clock delays, enables per-DMA-channel interrupts, and configures TX LPI
clock gating.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> index 862df173d963f..3d434a52fb02d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
[ ... ]
> @@ -37,17 +38,99 @@
[ ... ]
> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *=
pdev,
> +						struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(base)) {
> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n"=
);
> +		return ERR_CAST(base);
> +	}
> +
> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
> +		dev_err(dev, "missing required reset controls\n");
> +		return ERR_PTR(-EINVAL);
> +	}

[Severity: High]
Does this leave the AHB reset asserted during register access?

The driver verifies that plat->stmmac_ahb_rst is present, but it does
not appear to deassert it before returning the regmap or performing
writes.

[ ... ]
> @@ -118,11 +212,7 @@ static int sun55i_gmac200_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> =20
> -	/* BSP disables it */
> -	plat_dat->flags |=3D STMMAC_FLAG_SPH_DISABLE;
> -	plat_dat->host_dma_width =3D 32;
> -
> -	ret =3D sun55i_gmac200_setup(pdev, plat_dat, data);

[Severity: High]
Can writing to the controller's MMIO region here trigger a synchronous
external abort?

sun55i_gmac200_setup() calls regmap_write() on the glue configuration
registers. However, at this point, the AHB reset has not been deasserted,
and the mbus clock is only enabled below this call.

Accessing an ARM SoC peripheral's MMIO registers while its reset is
asserted or its bus clocks are disabled typically results in a bus fault
and a system hang.

>  	if (ret)
>  		return ret;
> =20
> @@ -138,8 +228,27 @@ static int sun55i_gmac200_probe(struct platform_devi=
ce *pdev)
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }

[Severity: Medium]
Will the hardware configuration be lost after a system suspend?

The commit message notes that the glue configuration registers are in the
controller's reset domain. When the system enters suspend (e.g., S2RAM),
power is cycled and these registers will likely revert to their hardware
defaults.

Since the driver writes this configuration exactly once during probe in
sun55i_gmac200_setup(), and there is no resume callback assigned (e.g.,
via plat_dat->resume) to restore it on wake, could this lead to a
silent network failure after system resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-allwinner-=
a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com?part=3D2
