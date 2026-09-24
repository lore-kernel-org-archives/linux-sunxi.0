Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C84CB8BA;
	Thu, 24 Sep 2026 20:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282924; cv=none; b=SPffsu78seLPHuyMqfo/bIPeaortHoF1hoWmD+dFqkDfIkz/Rt3Qqr5+zcla7a5+jejti0/Otz01XQmO5NG3s+8V3rIjgXlSGJF5sblHdWGT/e2ELgzNndfOu/7dlK8tSWYJgMVy7/nP/IGQ9h5aoWCnR3bQc/WGui+j1M0db3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282924; c=relaxed/simple;
	bh=OwrUaxOBwrORiuE+26iX1lVpdDAXltYshOCLR10paNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=quGpBo+UnKJfTANfTMXT8pmRDJ0y0HELS/3A1+tmuaz9qrw6haokZd6EtBZ9Ik+iRmF0WzqP1JMOK1OnMbFi5mpdYxg5ZAo7Q4WEVo1PD5Wch85saX9mZ1YOsu88oDoFT99H460lk46BTeC9bEVCjCUv7UJ/a1GLLnBIfQGdGh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx6L0djV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx6L0djV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9457B1F00893;
	Thu, 24 Sep 2026 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790282922;
	bh=j+heeD2eTEBi9j719YYqc1Dl+RIBzQuLQx+H6PkX+Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jx6L0djVMgSKhPNL7JUJQw7we6lSruOAEg5i3sVd7UJBHS7dEXpv3g9qEkPdXZd8c
	 ihbXnuSqssP7qGNm66CWZH9eTT8IfVAWk+HWDRd9xc/Aa0Mz3GXYD7suRHLwiURMsN
	 OemynV28/fs6it/zmvVYSQNbLSH36K1I+sOj/LHvXz6xiCrzd4v2bG0/cz67NiKjJL
	 MWR7TVLNrjLAHOaR+psgqxA/flbV3J+iwcO8lsq6ySXaHzK3gQOzM81NnDtm71vkAu
	 bHAq47Gj2LxzukluyQOcSvdZ2ytwHC/o05koRWii4jt0PFLJhNWjsAIKLWLl1EUNvA
	 oeTKECFUxPLwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/5] net: stmmac: sun55i: Add per-compatible
 match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:48:42 +0000
Message-Id: <20260924204842.9457B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] net: stmmac: sun55i: sun55i_gmac pointer is lost after probe
--

commit 96a080b2a3499368db013319e188847cee61183d
Author: Jerome Brunet <jbrunet@baylibre.com>

net: stmmac: sun55i: Add per-compatible match data

The A733 GMAC210 glue registers are in a dedicated MMIO region of the
controller rather than in a syscon. This commit adds per-compatible match
data holding the glue resource init callback, the stmmac flags, and the
glue register offset.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> index 862df173d963f..c4df532850074 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

[ ... ]

> @@ -107,22 +128,34 @@ static int sun55i_gmac200_probe(struct platform_dev=
ice *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev =3D &pdev->dev;
> +	struct sun55i_gmac *gmac;
>  	struct clk *clk;
>  	int ret;
> =20
> +	gmac =3D devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
> +	if (!gmac)
> +		return -ENOMEM;
> +

[ ... ]

> @@ -138,8 +171,15 @@ static int sun55i_gmac200_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to get or enable PHY supply\n");
> =20
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }

[Severity: Low]
Does this code intentionally discard the gmac pointer after probe?

The sun55i_gmac structure is dynamically allocated via devm_kzalloc(), but
it does not appear to be saved (for example, to plat_dat->bsp_priv) before
sun55i_gmac200_probe() returns.

If the structure is only intended for use during initialization, could it be
allocated on the stack to prevent an unnecessary heap allocation that
persists for the lifetime of the device? Alternatively, if it is meant to
hold state (like the regmap) for future callbacks, does the pointer need to
be saved here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-allwinner-=
a733-gmac-support-v3-0-15735155a789@baylibre.com?part=3D2
