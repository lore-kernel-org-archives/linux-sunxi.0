Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFDF35FF5B;
	Sat,  1 Aug 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785601861; cv=none; b=XXWBv6clVzul7AZ+90BMHPos118wscx20F3OMh/MxIlDJcU6U33EtXBNt8pL5023zlZNgQrFsH3rJV6MxIXoALl7oDXGIHAveElQ1ICy9vIVQWX3a+oASzzkGEzgXF/FncRvM5TjlRls2bXHX1jI6neSgjAAxZ2/9fVAGqwJtkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785601861; c=relaxed/simple;
	bh=MC9tQf9XR+TO5bwzTI8TGuK0J42UYLTuShmksDcL8p8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vAKc/uZ7CUDa7rVuhrbmVKkdcWo4d907bEN7SCgoL2Rz+lTbt7wQ33sTeKK0uz/oZcN/IRbZ+fHEw5ujIlQ8qlSuVoJbISZL/4WvmW+ncFreD092IGEYHUfyy2L4e4tV+L0fsleLayMce+qa4suwGS9rFziIJGBOFTJPdNIHgZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/faIYqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/faIYqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639F21F00AC4;
	Sat,  1 Aug 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785601860;
	bh=x9gB/O7nUQHqaCVj3NjA3ZdBPo9Tc+fJ7fnhCmLs5YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/faIYqoLSkz5UuMwMKpI+93ZfwesEDwGqLWGUeqFLjoCJxhvdsjHWU36BRLsXvXD
	 YWyLv3XPSiALZSxNaMCXx9NrVmbWmQrrY1Izs2Hou46SK467mt7PP/T7GsmtyVrz/u
	 C/M4DGBwkadbVdZ84JErlZT+hmBTSqLYWQJ/bneSVlTzQXnrcT1FX3d1lXSQvfjDUq
	 3tTe/6NSgFJXH9+SBfUiI1BBSK+nnv2C2CBhUYC2dSdXMGu/9OjZq2Zk4D0M6Yyohu
	 x6wH/JZbGuozlHkGbhxqFAL4dR6S+OoNrBCBHCaGCJV2DK0aUlhUwlDBUPkmwJes/t
	 5knlUbH1ZsrjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC/RFT 2/2] net: stmmac: Add support for Allwinner A733
 GMAC210
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260731-allwinner-a733-gmac-support-v1-2-d0a8732bfa82@baylibre.com>
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
 <20260731-allwinner-a733-gmac-support-v1-2-d0a8732bfa82@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 16:30:59 +0000
Message-Id: <20260801163100.639F21F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing AHB reset deassertion before MMIO access causes bus hang.
- [High] Missing suspend/resume callback permanently breaks network after s=
leep.
--

--- Patch [2]: [PATCH RFC/RFT 2/2] net: stmmac: Add support for Allwinner A=
733 GMAC210 ---
commit 00717a07b743c8a2cc8bc07f479795f3772f17e1
Author: Jerome Brunet <jbrunet@baylibre.com>

net: stmmac: Add support for Allwinner A733 GMAC210

This commit adds support for the Allwinner A733 GMAC210 controller. It
handles a dedicated MMIO region for glue configuration, specific TX clock
delay fields, and per-DMA-channel interrupts.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> index 862df173d963f..3d434a52fb02d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

[ ... ]

> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *=
pdev,
> +						struct plat_stmmacenet_data *plat)
> +{

[ ... ]

> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
> +		dev_err(dev, "missing required reset controls\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * The configuration registers are inside the controller
> +	 * reset domain, so the reset must happen before any write to them
> +	 * and should not be done again by stmmac or the configuration will
> +	 * be lost.
> +	 */
> +	ret =3D reset_control_assert(plat->stmmac_rst);
> +	if (!ret)
> +		ret =3D reset_control_deassert(plat->stmmac_rst);

[Severity: High]
Will this cause a bus hang when writing to the MMIO registers?

The code checks that plat->stmmac_ahb_rst is present earlier in this
function, but only toggles the main mac reset here.=20

When sun55i_gmac200_setup() later calls regmap_write(), accessing an IP
block over the AHB bus while its AHB interface is still held in reset
typically causes a synchronous external abort or bus hang.

> +
> +	if (ret) {
> +		dev_err_probe(dev, ret, "device reset failed\n");

[ ... ]

>  static int sun55i_gmac200_setup(struct platform_device *pdev,
>  				struct plat_stmmacenet_data *plat,
>  				const struct sun55i_gmac_data *data)
>  {

[ ... ]

> -	ret =3D regmap_write(regmap, SYSCON_REG, reg);
> +	ret =3D regmap_write(regmap, data->offset, reg);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
> =20
> +	plat->flags |=3D data->flags;
> +	plat->host_dma_width =3D 32;
> +
>  	return 0;
>  }

[Severity: High]
Are these custom hardware settings lost after a system suspend?

The driver configures critical hardware properties like TX/RX delays and
PHY interface modes in the MAC's internal glue configuration registers
here, but does not appear to assign a plat->resume callback to the
plat_stmmacenet_data structure.

If the MAC loses power during suspend, won't these registers revert to
their default states on resume, leaving the network broken because the
generic stmmac_resume() has no way to invoke this glue logic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-allwinner-=
a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com?part=3D2
