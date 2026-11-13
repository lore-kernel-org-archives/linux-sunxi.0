Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547694;
	b=I/UcZk6iG/kJ9VUTKl+8L/ppFH/fjs3bXsEav0KGIEQyKOS2KNYtoHrXmHPrdKSWi5il
	 euRukjiPqWNRPJYsoLuE2kAaynVx4MfRzYRa91XeQZhHz75cKa38o3Yjh7MYexUv00xUX
	 0ap213mD2kbWvz3If3hxc7QZAlGa/h6I4TvgtMCJ3YCPYda3dXbuDLYF1Qavb+7dNey8L
	 R/HHjC2t2WrkBzqdTGDq+O+zjmdFoNNnjCsfaKZCpg3ig7H2G1YKdziW395dQJMyiyXg+
	 J6tdS4Y0hE1B0JYISMXiLlR6vPi6vxLgBSzF2maLdGs4IPLhHvyh2jvV0XUQziP6QaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y3c4nPDrZwdZ8oAhZQ9otwMVMpXhvkV3ShfVekyeXYA=;
	b=MLugDDwxqpxZiWX05LBfuLOM8SGT+LdHZ5op+IwLvX1+HlMbTdKIRGocW8/eEQpe5hWG
	 XoSpapf1ARUcfhb728m5WsyToWgRXc6kHekkGBzdyreAiWTLHR7CQp/25a3aR140AI7d+
	 /Qleumnu2vE/T88ElkoDapvLJ+FYhQ4v2aI8S1GfXkiUTumV+NEnUM0Y1IvkKg/32Tngl
	 tGwZR5IwS01uhZpw8xtBpds9s75WNFGos9J86O6VMZELfjm//zB4/e1awAOTVctcy4YUx
	 aIEzjv1H5wCcRYdtxYZGVmPjw0M2Xe6jwRgVbVxSwujwwjFz+f4OU33LABa6wfnpfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNYqmm1v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECC606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 05:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNYqmm1v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1B51F000C4;
	Fri, 13 Nov 2026 05:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794547693;
	bh=y3c4nPDrZwdZ8oAhZQ9otwMVMpXhvkV3ShfVekyeXYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNYqmm1vBaiDvucljju2I0+/X2sc0hQeo8el0HrENPR5XeRQfQsmBP1MhFK++2+gk
	 CrDff/EAbyY+tmsX6/e1wHE6zyiLkGhvG/DnNGuporOquiTQHKhUgFlevw1W/xFb3P
	 4bJGbplx5fgwcPRa+TaN5u/okierIyWDGgO4pjx/v9Gm+bNdHacb8Dkxsne38ARVSw
	 Xz4RbIH94C7Ib/CEfOhjZJIcJTy0pOJxG2vrQsrGSLlgUWEp54rlJ8kv7fPVBN6/sr
	 bOdM57eAp5SeP0sWNxhLBCmh0wIfrC3OPe6IBKEIUHnG8DfCcPiMnLMeRjtRqN/6Xp
	 J4M5gA1Kvnlkg==
Message-ID: <sashiko-outbox-212228@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Fix use-after-free in the
 MDIO mux error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com>
References: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:28:12 +0000
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
- [High] net: stmmac: dwmac-sun8i: unhandled -EPROBE_DEFER in
  get_ephy_nodes() [1]
--

commit 0e3757128b0330be69abe1ee1230d93499f349af
Author: Arun Iyengar <aiyengar1990@gmail.com>

net: stmmac: dwmac-sun8i: Fix use-after-free in the MDIO mux error path

This commit unpowers the internal PHY on the sun8i_dwmac_probe() MDIO mux
error path before releasing gmac->rst_ephy and gmac->ephy_clk so that the
subsequent sun8i_dwmac_exit() call does not access freed resources.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 47954537b29e4..4436532af2dce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>  	return 0;
> =20
>  dwmac_mux:
> +	sun8i_dwmac_unpower_internal_phy(gmac);
>  	reset_control_put(gmac->rst_ephy);
>  	clk_put(gmac->ephy_clk);
>  dwmac_remove:

[Severity: High]
This problem wasn't introduced by this patch, but does get_ephy_nodes()
swallow -EPROBE_DEFER when acquiring ephy_clk [1]?

drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:get_ephy_nodes() {
	...
	for_each_child_of_node_scoped(mdio_internal, iphynode) {
		struct clk *ephy_clk;

		ephy_clk =3D of_clk_get(iphynode, 0);
		if (IS_ERR(ephy_clk))
			continue;
		gmac->rst_ephy =3D of_reset_control_get_exclusive(iphynode, NULL);
		if (IS_ERR(gmac->rst_ephy)) {
			ret =3D PTR_ERR(gmac->rst_ephy);
			clk_put(ephy_clk);
			if (ret =3D=3D -EPROBE_DEFER) {
				of_node_put(mdio_internal);
				return ret;
			}
			continue;
		}
	...
	of_node_put(mdio_internal);
	return -ENODEV;
}

Unlike the of_reset_control_get_exclusive() check right below it, an
IS_ERR(ephy_clk) result unconditionally continues the loop without checking
for -EPROBE_DEFER.  If the internal PHY clock provider is not registered
yet during boot, get_ephy_nodes() exhausts the child nodes and returns
-ENODEV, causing sun8i_dwmac_probe() to fail permanently instead of
deferring probe.

[1] https://sashiko.dev/#/bug/linux-98384c14-541e-410e-a074-fff5e98b3820

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sun8i-emac=
-mux-uaf-v1-1-308ae7e6fcf2@gmail.com?part=3D1
