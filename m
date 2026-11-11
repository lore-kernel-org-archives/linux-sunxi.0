Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377029;
	b=fxlHI15hFQEA29S+ZgzciRCzQP0dUI4C3MPgdXh4cMplWzQYIq9EGGNfJL1EstibbNSt
	 6j9G17zA1cXPgkHNj59PXQ4fRO4uwQiu7q8amI9FknO2dmstlAZw2W9erM8noU/cwYG22
	 Z5v6FBgMUz8JKGHfq/ZjR6Z6cad6aR6T+ebaxaO09gQijWSG1F04VA71AIfCMD/dWe14R
	 XWW23fp9xp1AYYI0lUpCOTdfaJ6qkO1jug1bvMs1RgZla9TSu7NNwMyoveNbKOz0kGlMJ
	 FswwXwRogvtaK6sGF/ZVrwai6t7OgNLUd57NuNqJEgwwVvfIGVushM0GumEAMrg/V6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h0rfEEM6NK+XhlxIX4jHrs9EeGJDcQUrV+wehKKu1Nk=;
	b=EYd7puWbyqrqzjMawckrNFzm69aQkprUrBIC5o0w82WCCZqgJYMFEdRW9VfzHY9RBAgW
	 X1sq1skCz7t/qJFo+GcTvQ+CQaLIJv08cUEm6vq59iKZ5oMKVnhMPwGo9KaFXFrsXRobq
	 n3X0h5A9wpZyRsAvPJfJsIhxCgihm/O4CYRs0X5yHL59znTpNXMOJf3Kp5MdxO/xu0e4l
	 213qbPqFBvoR++HqBiYSXQDmqgaldCH31Q2/gPwR3QvFHHiBQzTeOYc15ElI5pxJKC2Ox
	 u/VmI3H5iGgWG+3qnfLmZ4H6nDInpKMuIoKQb38uviRMGLQiczZ+DJrbZ9yuVHO5Cpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hTpXUuq/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8185606A320
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTpXUuq/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDE01F00A06;
	Wed, 11 Nov 2026 06:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377028;
	bh=h0rfEEM6NK+XhlxIX4jHrs9EeGJDcQUrV+wehKKu1Nk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTpXUuq/tZiynQZtdJBMG4GX8Pma4+8NldfAUBbncoT+KS6a//T8lV4ZYeFVS4wE6
	 UMfWmr/E8uCIFH7vVjqn0nW+pYJtZnTO9FBZUsfoRXWEtwnY/q+Amb4mTrTY0lyiQY
	 oMIetyCICnniFEglkT96lwpmy3rHkGLvJ5Wi/Fki9u0YNXbkB/TDQHJGvPMJtGDjEP
	 8FwuktjeWYFb4bQ+bmjiqCFr8cK4Uh9C/CkA/wfTePjTspgMI76XoP8QpXl5GceTH0
	 /WB2f8L6mJqA0AnwDt/V21OXItwju8M+rCXUqU8vW8Q9PxEoqwM9spXu8kDzFWwjGj
	 WkxCmZWFw63Wg==
Message-ID: <sashiko-outbox-208380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261110-sun8i-emac-jumbo-v1-2-84bf00e9ffa3@gmail.com>
References: <20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com>
 <20261110-sun8i-emac-jumbo-v1-2-84bf00e9ffa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:03:48 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] net: stmmac: dwmac-sun8i: use-after-free in
  sun8i_dwmac_probe() [1]
--

commit c1b9df3d167772eb81ad19c92d811c6f17d19aa6
Author: Arun Iyengar <aiyengar1990@gmail.com>

net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

This commit enables EMAC_RX_JUMBO_FRM_EN in sun8i_dwmac_core_init() and
caps plat_dat->maxmtu at 2018 bytes so frames fit within a single
normal-mode DMA descriptor buffer.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 0c82662fbe6ea..a18d3daf6a3ff 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -1209,6 +1232,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>  	plat_dat->mac_setup =3D sun8i_dwmac_setup;
>  	plat_dat->tx_fifo_size =3D 4096;
>  	plat_dat->rx_fifo_size =3D 16384;
> +	plat_dat->maxmtu =3D min(plat_dat->maxmtu, EMAC_MAX_MTU);
> =20
>  	ret =3D sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)

[Severity: Critical]
This problem wasn't introduced by this patch, but can the dwmac_mux error
path in sun8i_dwmac_probe() trigger a use-after-free on gmac->ephy_clk and
gmac->rst_ephy [1]?

If sun8i_dwmac_register_mdio_mux() fails after mdio_mux_init() has switched
to and powered the internal PHY (setting gmac->internal_phy_powered =3D tru=
e),
jumping to dwmac_mux releases gmac->rst_ephy and gmac->ephy_clk before
calling stmmac_pltfr_remove():

drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_probe() {
	...
dwmac_mux:
	reset_control_put(gmac->rst_ephy);
	clk_put(gmac->ephy_clk);
dwmac_remove:
	pm_runtime_put_noidle(&pdev->dev);
	stmmac_pltfr_remove(pdev);
	...
}

stmmac_pltfr_remove() then invokes plat_dat->exit (sun8i_dwmac_exit()),
which calls sun8i_dwmac_unpower_internal_phy() and passes the freed
gmac->ephy_clk and gmac->rst_ephy pointers to clk_disable_unprepare() and
reset_control_assert().  Releasing rst_ephy and ephy_clk after
stmmac_pltfr_remove() returns would avoid this.

[1] https://sashiko.dev/#/bug/linux-00a700e2-db38-4b13-88b6-6eb44a168172

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-sun8i-emac=
-jumbo-v1-0-84bf00e9ffa3@gmail.com?part=3D2
