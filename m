Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366276;
	b=GURme612jXCJLRu5FSN2I51d5RwW6IxOiyU6+aNx7m3YOH3HOrVSH6L9i0v56qhiEDXj
	 aMUxI2t7jq8vEqHvYlyG76/Yu/KSLzFclwT8leCpYE3uR1ogvIya/ZYsa15X3MuEZmhF3
	 lfF2JnkYqo04fhp/2UlPPE/GzHrid1c0Hlx92skxO39zsBwAq2fg/QBpkBGY/8F2r6zSA
	 U13pyE6T2RfkHy7eHgVoBO0aTOYWn5rbf57N5mJxOhe6y2uiWWjTM0ft9w9sR7tFMSbAM
	 ulTCK65k2N21t6Nlp3nF8fdX+62ciQKX4idFxwwMqbqRWVbafROT79xpMaOpTSSm8pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366276;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=odH1W3Fi9GNbi7dCUOZXZg0rZVE2x7cWfH47Ss3QQR0=;
	b=qG8sX94sdohirir6lFAqzLHiU95CDQG4iOnKiSFftACYMpZdf73v0KqwD0OJDj/luwhF
	 xvgP9zNViJwThiF6Qk8cUcTsQZL930IKA5UgNI8CuiihMbvUwXI8X876kue067xfxDsW3
	 b0UeRmkqdJj62h41Yn3xLgHMIcEFYXPYKp3EojZd+d90u/I84DuZG36WmhSeEXva47CCH
	 uLO+64f/ST5dLya34SRGX58mkepsQzdit3gAlIyMWBLoGz+TAwLNXExudyzQYy09uEinT
	 UwrFVLNCNb6zHk1T/WDaB6uigPk/BIQs91BR2TqG68Ki6LZUXIroZx+SSJFYQcyhmSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vLlRJEb8;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612CD606A687
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612CD606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vLlRJEb8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 095E8C69140;
	Sun, 22 Nov 2026 16:51:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50CA060512;
	Sun, 22 Nov 2026 16:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 407BA11E624EE;
	Sun, 22 Nov 2026 17:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795366271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=odH1W3Fi9GNbi7dCUOZXZg0rZVE2x7cWfH47Ss3QQR0=;
	b=vLlRJEb8rXtT4eD7/MWgeYKI56QggNTzC1SZIMRYtzsk623ufNRqfVNA8UhqIIutP+qJC6
	ppfR2pVI8obtbkAUS8t8hxQZ+3CGnJiUQRwEw1uU/xT3vaoX+0aiyikzUav+op7SnCTuBh
	umGPGI3IE/fPb4eVcdqyuTqyxAd3pT4GEQjrWjbI56U4ERJs2iVatqVBarQAmIVRSFpoUG
	nUOdJeY4ZYTBCFFcHi6S6LYYQJaufgQwfUd2C1Mk7YmBdho9aEnGwj2C/5uvyV8vCGP4r/
	bWE/EgaEf5SX4ESO7KtT8Vhkj+dka/cA6njZ/WaUlFaBlZNQztGadrNtLmxMNQ==
Message-ID: <3608fc23-1d62-4118-be0d-fa1d2ed3e399@bootlin.com>
Date: Sun, 22 Nov 2026 17:51:06 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/5] net: stmmac: dwmac-sun8i: Get the EPHY
 clock and reset before the MAC probe
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> get_ephy_nodes() runs after stmmac_pltfr_probe() has registered the
> netdev, so its -EPROBE_DEFER comes too late. An EPHY clock that is not
> ready yet does not defer at all: the node is skipped and the probe
> fails with -ENODEV.
> 
> Look up the clock and reset before stmmac_pltfr_probe(), and defer on
> the clock as on the reset.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is a step in the right direction, thanks

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 34 ++++++++++++++---------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 9fb398f7cf9e..4acfda235394 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -775,16 +775,15 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>  }
>  
>  /* Search in mdio-mux node for internal PHY node and get its clk/reset */
> -static int get_ephy_nodes(struct stmmac_priv *priv)
> +static int get_ephy_nodes(struct device *dev, struct sunxi_priv_data *gmac)
>  {
> -	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  	struct device_node *mdio_internal;
>  	struct device_node *mdio_mux;
>  	int ret;
>  
> -	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
> +	mdio_mux = of_get_child_by_name(dev->of_node, "mdio-mux");
>  	if (!mdio_mux) {
> -		dev_err(priv->device, "Cannot get mdio-mux node\n");
> +		dev_err(dev, "Cannot get mdio-mux node\n");
>  		return -ENODEV;
>  	}
>  
> @@ -792,7 +791,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  						"allwinner,sun8i-h3-mdio-internal");
>  	of_node_put(mdio_mux);
>  	if (!mdio_internal) {
> -		dev_err(priv->device, "Cannot get internal_mdio node\n");
> +		dev_err(dev, "Cannot get internal_mdio node\n");
>  		return -ENODEV;
>  	}
>  
> @@ -801,8 +800,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  		struct clk *ephy_clk;
>  
>  		ephy_clk = of_clk_get(iphynode, 0);
> -		if (IS_ERR(ephy_clk))
> +		if (IS_ERR(ephy_clk)) {
> +			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
> +				of_node_put(mdio_internal);
> +				return -EPROBE_DEFER;
> +			}
>  			continue;
> +		}
>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>  		if (IS_ERR(gmac->rst_ephy)) {
>  			ret = PTR_ERR(gmac->rst_ephy);
> @@ -814,7 +818,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  			continue;
>  		}
>  		gmac->ephy_clk = ephy_clk;
> -		dev_info(priv->device, "Found internal PHY node\n");
> +		dev_info(dev, "Found internal PHY node\n");
>  		of_node_put(mdio_internal);
>  		return 0;
>  	}
> @@ -1209,9 +1213,15 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
>  
> +	if (gmac->variant->soc_has_internal_phy) {
> +		ret = get_ephy_nodes(dev, gmac);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		return ret;
> +		goto dwmac_ephy;
>  
>  	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -1230,9 +1240,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	 * so after stmmac_dvr_probe()
>  	 */
>  	if (gmac->variant->soc_has_internal_phy) {
> -		ret = get_ephy_nodes(priv);
> -		if (ret)
> -			goto dwmac_remove;
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> @@ -1247,10 +1254,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
> +dwmac_ephy:
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  
>  	return ret;
>  }
> 

