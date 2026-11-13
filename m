Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559471;
	b=D0YsiJhQiCDxCGt4gHf1piJVnVYnFvhjt9RTS/B2OBBBpPSLJETNdLMyZR7cNZ/LYd8H
	 S7MAezHtE32Fk5KOdrso5O9TS59DrIzl4G+gieEsCdu29bzjqYUTyoCm8sV2SLQewXcKw
	 qrt+d9ysZb9krMuxkhwvpNFby37Dcyv0EQ2iNH5lszWQecnsqg86nLr7gpw8eSDKYdeV9
	 5D6B/xcWuOhjQeChFtt//9Lb5XeIk6ot6BJecj9GMzjzzs39ZjptJjjDw04hiARHce83c
	 +H5NObR90VjTo6W0XN0tOa/BZbX6prnqJGCATfoIyOovTPJlRbFTi2i7/z7G36uPH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559471;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BgJLne5GDxvCsGUeYB1OM6BnTvtNmwAjZmYS2krvclc=;
	b=ndx8HSjngfKpEkfDoW6y6ihyDR5x7lI9OtTaRk2t/rtj1cViLFbWFYO53Yu4lObjhAGM
	 4iURpQ5lPFGdF9wvCnAHNMLMx8A4ifEHwF/k8ugFBgnndFSM2FcpyCLsubHce7nFX0UFQ
	 dRprQijZbuYDE2Uaxe7RitjggKpl1UmEZGLbLtXZozcbLC3xvFVoGvsSKkY1zXe+wviZ1
	 4iflrNRI/Eannw/q02lfTYKMARlFTciTowweyyCQW9hqHTsJRXxFvg/aNPGW7W4xqDp78
	 /+ZSV3XkZiG/iSDQEFYd9iHjXpo9hK4sFwYB8sca3KJvwe3HVbgmorsDdLKuvMTvM7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gdAA8m/7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F2606A882
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gdAA8m/7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6322B1F000CA;
	Fri, 13 Nov 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559470;
	bh=BgJLne5GDxvCsGUeYB1OM6BnTvtNmwAjZmYS2krvclc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gdAA8m/7HBfUM49g/Ip+gJo5P6HsJR3uIAloG91q19qE1gyb57Xi1gLdlEFgxGFE/
	 Agu52ZLHeknx472bEvJp4awtlFz96MXwosJ0nKFD6IYU+o54RTG7gS/cm+//Zj3l1l
	 oGDUUgjTVFWFg3No5phDXmT3gr9H1ulEYiLDwv91l4u32PMqzpTPKGCulxXxUyS5Yi
	 U5imW2pJe9pQ1IinvVk/TUjkC9CdCg66O1AiF86hA+uwsXuhXgFrkGAOmIJXLRj4oN
	 1jxW4piD0GkZUm0LZ91VpF7/fZsq+eeNlq+bCsuAddEhTtlg9CH/krpvNqEvBuU8iM
	 a0o90JxWpkX4A==
Message-ID: <sashiko-outbox-212453@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:44:30 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: stmmac: dwmac-sun8i: DT max-frame-size ignored in
  sun8i_dwmac_probe()
--

commit 51742ecb57f35bd210c0c45ef051593dd802ce68
Author: Arun Iyengar <aiyengar1990@gmail.com>

net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

This commit sets EMAC_RX_JUMBO_FRM_EN in sun8i_dwmac_core_init() and bounds
plat_dat->maxmtu to 2018 bytes so frames fit within a single 2044-byte DMA
descriptor buffer.

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

[Severity: Medium]
Does min(plat_dat->maxmtu, EMAC_MAX_MTU) honor a device tree max-frame-size
property as intended?

devm_stmmac_probe_config_dt() initializes plat_dat->maxmtu to JUMBO_LEN
(9000), and stmmac_probe_config_dt() only reads max-frame-size for specific
compatibles:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_probe_config_d=
t() {
	...
	if (of_device_is_compatible(np, "st,spear600-gmac") ||
		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
		of_device_is_compatible(np, "snps,dwmac")) {
		...
		of_property_read_u32(np, "max-frame-size", &plat->maxmtu);
	...
}

Because dwmac-sun8i device tree nodes only use allwinner,sun8i-* and
allwinner,sun50i-* compatibles, plat_dat->maxmtu is always JUMBO_LEN here a=
nd
a max-frame-size property in the device tree will never lower it below
EMAC_MAX_MTU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sun8i-emac=
-jumbo-v2-0-aca0cf23cf17@gmail.com?part=3D2
