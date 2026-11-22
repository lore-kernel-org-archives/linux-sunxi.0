Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368959;
	b=OLLFTiGBXimci5dbD901QUjATqFGeNJVdqpehvHssuTSoJ1nzTQ1f507RerBKuH7DG0k
	 4Do3DZyYxZ00/QTsZHgQ07KTGbt0JpGsbDFf2W6+3qfUZvtdLJhoY2UMhTo0LpoHMea6w
	 mHwew3Bqz98DSxgVx4BQNCdoaCoKwsyM6IDzeFgSch5XXQ52h6k1ePh4EqhtRJKQQi32Y
	 oU4x9OjjaLEWUDqnqszKb6SEFpZLtxTurRzBXj3bIzWPYCVP3LqEwnH4V6A7y3o0XjIfZ
	 DD6GHtV9TpF2WsIfAEg8vnGip9X3a77Le+tNIkGQE+PvSTpeBUp8oEvDrGvHJRGTZRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368959;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=2vMjYyTFhWJCTrJmGUbixPZ6wCp7swb0ApFE0Hp03Lo=;
	b=fBrKtaglgvjXifYAicgXfSEzQ21a0Z97IkH3vpqVksMGbRYDaJkl/6izzZ6BMFZ07TVg
	 GOCLTgo1Zlbhmwbxe7c+G5mXvvFvA0T4rvTxgW2h/jYf/5DdIrbbMl244Yu4b+MyL3Wgf
	 ChnFDBcPiP0yces/4NgAHVNsjhfsLAQhoGkV11IeE5auz1/fAPpTtanMrCPS7JwA2DXBR
	 64QdV+pntTPshYUjPMGWDn/C2LBMMxAjSi10L53anyZTihZEwUoUrJ4VkB/XS18coWhxL
	 2cZwUl1FIorBYLTUnD4ouhlI5iMiAlDekOoFGaQij6hdBMdu/Wigj/be3DpRxeE5Z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zNRmYkSv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81D606A33A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 17:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC81D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zNRmYkSv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ECA09C6223F;
	Sun, 22 Nov 2026 17:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F51660512;
	Sun, 22 Nov 2026 17:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 676F811E61B2A;
	Sun, 22 Nov 2026 18:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795368954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2vMjYyTFhWJCTrJmGUbixPZ6wCp7swb0ApFE0Hp03Lo=;
	b=zNRmYkSvMIH7cXgMV8K5iRg0WqNLOciUWQnXRteH17Ph7cI4kaEEXhnAAv8c3SlYcUS25j
	ysfya2BRE20ESnevTSd1M9Zmgi+GoEpHeUoLaUn1tt63XoqdNtu2tGYYXbCgUfJVxX1VRQ
	l5iSj0/4SXT2EQawrTX9KRuhJwmZ4GWQkKD8odVA5JRg2WKDWRfyu3sKWw8Zbtygt9HuOH
	qt0SUatHmQ4isJ5Wfsy+/fvtkPxksnsYPfb5aO+EdKXZrxX9ts6jeUBCKrXldGmTMq8jKM
	mr6s+r/BVWVBDRcbnRBluzBN6Zh+X42k4LPuJgUv08QXSOYv1G4U78Edpq1QNg==
Message-ID: <abcc0261-ed4b-4b1f-9035-04d17d630d22@bootlin.com>
Date: Sun, 22 Nov 2026 18:35:49 +0100
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
Subject: Re: [PATCH net-next v4 4/5] net: stmmac: Add MDIO init and exit
 platform hooks
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
 <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi again,

On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> A glue driver that adds devices on top of the stmmac MDIO bus, such as
> an MDIO mux, can only do so after stmmac_dvr_probe() has registered the
> netdev.
> 
> Add mdio_init(), called once the bus is registered, and mdio_exit(),
> called before it is unregistered.
> 
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Manually tested on H2+,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++++++++++
>  include/linux/stmmac.h                            |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 7396b68899c6..fb1f7b1a5323 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -682,8 +682,16 @@ int stmmac_mdio_register(struct net_device *ndev)
>  bus_register_done:
>  	priv->mii = new_bus;
>  
> +	if (priv->plat->mdio_init) {
> +		err = priv->plat->mdio_init(priv);
> +		if (err)
> +			goto mdio_init_fail;
> +	}
> +
>  	return 0;
>  
> +mdio_init_fail:
> +	priv->mii = NULL;
>  no_phy_found:
>  	mdiobus_unregister(new_bus);
>  bus_register_fail:
> @@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
>  
> +	if (priv->plat->mdio_exit)
> +		priv->plat->mdio_exit(priv);
> +
>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..e94f9cab973d 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -296,6 +296,8 @@ struct plat_stmmacenet_data {
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
>  			   void *ctx);
>  	void (*dump_debug_regs)(void *priv);
> +	int (*mdio_init)(struct stmmac_priv *priv);
> +	void (*mdio_exit)(struct stmmac_priv *priv);
>  	int (*pcs_init)(struct stmmac_priv *priv);
>  	void (*pcs_exit)(struct stmmac_priv *priv);
>  	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
> 

