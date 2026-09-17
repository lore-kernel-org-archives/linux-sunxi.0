Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE03CB56E;
	Thu, 17 Sep 2026 04:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620152; cv=none; b=FCsyrj/anAq3U/Z1L6qnSObJqrmvPjmJZkS4glMuIwn7ZevReTz3c4wV38pUyF7qxAPcjMR1GN82M0e1RlsgjR8F7AQzFVajYZ8+Sg8ZgFgK2y3VB9zcEQcfkxlSwV7G5gA66FevX/lWsyzTO9nmNmnO62HeuXqWQkbJvhIBDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620152; c=relaxed/simple;
	bh=+uclSvVlw8cy6FQRk/PnfNnw4EnJNeVtkoXBsSZezgc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CQivDf34BaPtMiuD52/AvjuAAlOrLXyeo28r4D/ji217sIOscqPC001Q8BwjwxoBW693uGmRJfPDSuq7vXiigznnzYe1AhAzkPwFgmXEqvMjf8DHAAI3XmrJUOSmD8j0xzi4nlCPTSrNYYqI7sgDmgo3l2PmbsZJRsIfq1jqtfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZrsBG3E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZrsBG3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679651F000FF;
	Thu, 17 Sep 2026 04:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789620150;
	bh=n7a20XI5P58ueBWoAH7JNyjNRhVfRlpOVcikUsn9zX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZrsBG3EwYwrNFYqscLvvdWcZmRsFB85zKA4u9XXNKnrDIexSBsRcbB61E8mS+X7I
	 BrOSi5pRmWulWCi0drrgBUSoD3/yy6KsDagol2s+3eupWt2j4QvZ1FloEz6I563odr
	 klsUh/6g/1xfueXvDQMZjtAviyYqs70ulDn6kAa0jJQ0Hq7h071w2Tjol4NnYwfImu
	 nFa84wFQIwNR/eCzBuNNZiLFiGNs4Y4IS3EsACEwCk+1R+gk/zsvOkADvEAPV3lMFG
	 hUPETUTPjRKm5waVt9oPPd383mRcfUBBzoYABwFZKkGUOtpFd7WHH8ufm7BVELeLHQ
	 iKprm9XcpScZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner
 H616 EMAC clock index and internal PHY support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxhc3RhaXIgRCdTaWx2YQ==?= <alastair@d-silva.org>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916044119.475666-5-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-5-alastair@d-silva.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 04:42:29 +0000
Message-Id: <20260917044230.679651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: stmmac: MAC soft reset is completely bypassed for internal PHY
- [Medium] net: stmmac: silent acceptance of missing clocks and resets for =
internal PHY
- [Medium] net: stmmac: internal PHY clock and reset leaked if MAC reset fa=
ils
--

commit a3ca47044e22ce48b791f8eb8f51a44d49d7ba43
Author: Alastair D'Silva <alastair@d-silva.org>

net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and internal =
PHY support

This commit adds support for EMAC1 and the internal Fast Ethernet PHY (AC30=
0)
on Allwinner H616 and H618 SoCs. It allows reading a register index from the
syscon property and introduces emac_variant_h616_internal with internal PHY
support.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 48c52eb962335..1728893589a68 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -589,6 +600,10 @@ static int sun8i_dwmac_init(struct device *dev, void=
 *priv)
>  		ret =3D sun8i_dwmac_power_internal_phy(netdev_priv(ndev));
>  		if (ret)
>  			goto err_disable_regulator;
> +
> +		ret =3D sun8i_dwmac_reset(netdev_priv(ndev));
> +		if (ret)
> +			goto err_disable_regulator;

[Severity: Medium]
If sun8i_dwmac_reset() returns an error here, the code jumps directly to
err_disable_regulator. Will this skip the call to
sun8i_dwmac_unpower_internal_phy(), leaving the internal PHY powered and its
clock enabled?

[ ... ]

> @@ -784,16 +799,23 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  	/* Seek for internal PHY */
>  	for_each_child_of_node_scoped(mdio_internal, iphynode) {
>  		gmac->ephy_clk =3D of_clk_get(iphynode, 0);
> -		if (IS_ERR(gmac->ephy_clk))
> -			continue;
> +		if (IS_ERR(gmac->ephy_clk)) {
> +			ret =3D PTR_ERR(gmac->ephy_clk);
> +			if (ret =3D=3D -EPROBE_DEFER) {
> +				of_node_put(mdio_internal);
> +				return ret;
> +			}
> +			gmac->ephy_clk =3D NULL;
> +		}

[Severity: Medium]
If of_clk_get() returns an error other than -EPROBE_DEFER (such as -EINVAL),
the error handling now sets gmac->ephy_clk to NULL and continues to the res=
et
control fetch, which eventually returns 0 on success. Does this silently
accept a device tree node missing the required clock instead of skipping it
via continue?

>  		gmac->rst_ephy =3D of_reset_control_get_exclusive(iphynode, NULL);
>  		if (IS_ERR(gmac->rst_ephy)) {
>  			ret =3D PTR_ERR(gmac->rst_ephy);
>  			if (ret =3D=3D -EPROBE_DEFER) {
> +				clk_put(gmac->ephy_clk);
>  				of_node_put(mdio_internal);
>  				return ret;
>  			}
> -			continue;
> +			gmac->rst_ephy =3D NULL;
>  		}

[Severity: Medium]
Similarly, if of_reset_control_get_exclusive() returns a non-EPROBE_DEFER
error, the pointer is set to NULL and the loop returns 0 (success). Will th=
is
cause the driver to silently accept missing resets and later perform
operations with NULL pointers?

[ ... ]

> @@ -892,10 +916,13 @@ static int mdio_mux_syscon_switch_fn(int current_ch=
ild, int desired_child,
>  		} else {
>  			sun8i_dwmac_unpower_internal_phy(gmac);
>  		}
> -		/* After changing syscon value, the MAC need reset or it will
> +		/* After changing syscon value, the MAC needs reset or it will
>  		 * use the last value (and so the last PHY set).
> +		 * For internal PHY, the MAC reset will timeout because the PHY
> +		 * is not yet enabled/clocked. Delay the reset to dwmac_init.
>  		 */
> -		ret =3D sun8i_dwmac_reset(priv);
> +		if (!gmac->use_internal_phy)
> +			ret =3D sun8i_dwmac_reset(priv);
>  	}
>  	return ret;

[Severity: High]
The comment states the MAC reset is delayed to dwmac_init. However, during
driver probe in sun8i_dwmac_probe(), plat_dat->init (which points to
sun8i_dwmac_init) executes before the MDIO mux is registered.

During that initial execution of sun8i_dwmac_init(), gmac->use_internal_phy
is false (zero-initialized), so the reset block is skipped. Later, this
MDIO switch function sets gmac->use_internal_phy =3D true but explicitly sk=
ips
the MAC reset here.

Because both execution paths skip the reset, does this mean the MAC soft
reset is completely bypassed during initialization when using the internal
PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916044119.4756=
66-1-alastair@d-silva.org?part=3D4
