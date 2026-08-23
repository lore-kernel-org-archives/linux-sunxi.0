Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F9493634
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Aug 2026 04:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787461023; cv=none; b=HJYoyfA1PseT4siArmbBPY8IiDcXDffjK4N8tAltgwdtFVzccWcvt60b+qRikMKb1NTR+LjlFBmA/RazZlmJ4XHdk0xV/6+EgozFKXxNbBteMBMtyClaltN6pIhlTWBg2wBFpvb37k4ftZ48Zf80TNuaneF+JWNm+UWXoQUSilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787461023; c=relaxed/simple;
	bh=DPuVkPsUrwjDUsNOhLFAVZ9comp+p8FT+KGBWNlsC6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lm3Lr2eh72ykpeN3DyeJJB6fMvW097wfFIm8WNZ5ZjiCncBLWTczmg1zLzOwMyuphpUgyGK+kXmBz0wkrdieTJLgKpbwJPubNtg3JjQ6SjoEtV+mYpUlIdOmllme9BB8vHrsdnAuRrf8CTQLxCc3Z4UZ7w0zqlwkgxS0kWSgtw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2PitmSN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2PitmSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842A1F000E9;
	Sun, 23 Aug 2026 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787461022;
	bh=QSHAZyRDiXW0u1U8u6iY9MBhJhLUUJQaCbnPzuzNf40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2PitmSN4iihP0Tbc/U12yvxItyIVre4XZf5DYtvsHoV/jHzLA3Je6Aht3TTF+FQw
	 BvjevH98CG9ujrNDft1Tk3M1FjHjsFVNkrbS7w587vk43w71TpLdgbbwSgn5UsqpYv
	 HShWsEsgM7y1ACrqeRqjRWhFax5lacYhtw47/wSGMY44+au4wWF2W5HJRhFvlsqL5a
	 hq8f22X3v/HD74LZxfBlbnf9CRiA3Y0n5GjWFis3qreUsbHMP90HpxkSA4adJxk7E8
	 yk6FbyjrSxl+Q5vLfo40luRwd6vt87PYKL3b+It2VZcN7uaEO+oQjrCWhFCu/VYAXC
	 LgODt/I1Xq4Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: reset the EMAC when
 opening, not when probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pedro Santos" <hartmnn.p@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260822045641.19282-1-hartmnn.p@gmail.com>
References: <20260822045641.19282-1-hartmnn.p@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 04:57:01 +0000
Message-Id: <20260823045701.E842A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fails to fix the EMAC soft reset timeout bug for boards =
with an internal PHY that are configured to use an external PHY.
- [High] Uncoordinated MAC soft reset triggered by MDIO mux switching cause=
s silent network interface hang.
--

--- Patch [1]: [PATCH net] net: stmmac: dwmac-sun8i: reset the EMAC when op=
ening, not when probing ---
commit 5f11ae1c8c7c87b062343e837c4c5de6f8022782
Author: Pedro Santos <hartmnn.p@gmail.com>

net: stmmac: dwmac-sun8i: reset the EMAC when opening, not when probing

This patch moves the EMAC soft reset from the probe function to the DMA
reset hook (called during interface open). This ensures the PHY is powered
up and driving the RX clock before the MAC reset is triggered, fixing
reset timeouts on boards with external PHYs after a warm reboot.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 48c52eb962335..748ebabd933cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -740,23 +766,12 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device=
_info *hw,
> =20
>  static int sun8i_dwmac_reset(struct stmmac_priv *priv)
>  {
> -	u32 v;
> -	int err;
> -
> -	v =3D readl(priv->ioaddr + EMAC_BASIC_CTL1);
> -	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
> +	int err =3D sun8i_dwmac_soft_reset(priv->ioaddr);

[Severity: High]
This isn't a bug introduced by this patch, but does the MDIO mux switch
callback cause a silent network interface hang?

If userspace queries the inactive PHY's MDIO bus (for example, via ethtool
or /dev/mdio), the multiplexer invokes mdio_mux_syscon_switch_fn(), which
unconditionally calls sun8i_dwmac_reset().

This calls sun8i_dwmac_soft_reset(), asserting the hardware soft reset bit
and wiping all MAC registers, filters, and DMA engine state. Since the stmm=
ac
core driver is completely unaware of this reset, will it fail to reinitiali=
ze
the hardware, resulting in all traffic being dropped until the interface is
administratively restarted?

> =20
> -	/* The timeout was previously set to 10ms, but some board (OrangePI0)
> -	 * need more if no cable plugged. 100ms seems OK
> -	 */
> -	err =3D readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
> -				 !(v & 0x01), 100, 100000);
> -
> -	if (err) {
>  		dev_err(priv->device, "EMAC reset timeout\n");
> -		return err;
> -	}
> -	return 0;
> +
> +	return err;
>  }

[ ... ]

> @@ -1217,10 +1232,6 @@ static int sun8i_dwmac_probe(struct platform_devic=
e *pdev)
>  			dev_err(&pdev->dev, "Failed to register mux\n");
>  			goto dwmac_mux;
>  		}
> -	} else {
> -		ret =3D sun8i_dwmac_reset(priv);
> -		if (ret)
> -			goto dwmac_remove;
>  	}

[Severity: High]
This is a pre-existing issue, but does this patch miss the reset timeout
for boards with an internal PHY that are configured to use an external PHY?

When sun8i_dwmac_probe() calls sun8i_dwmac_register_mdio_mux() just above
this block, mdio_mux_init() synchronously scans the child buses. This invok=
es
mdio_mux_syscon_switch_fn() for the first time, which then unconditionally
calls sun8i_dwmac_reset().

Since this still happens at probe time, wouldn't the external PHY still be
powered down from a warm reboot, causing the soft reset to time out here
just like it did before?

> =20
>  	pm_runtime_put(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822045641.1928=
2-1-hartmnn.p@gmail.com?part=3D1
