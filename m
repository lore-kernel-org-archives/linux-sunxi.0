Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367146;
	b=grjbEPdU6IQzkCNu/VMyohmNrjtQn7aEnDSOr2pbS/C8naJfJQOynF9tUVNf9OrDwkXu
	 /F3LZXGolVGpGce7YoA5tGcRkzCobLnhQcu0A4dOmLR99ZrAxb4doYlLtjfgKwnGdC/kA
	 UibapRhcFHOHMHT+Y50FMfKv4ek5j4aiHaXGg70DG/9MGIp/681SFtYt3TOuHJh2EsJwY
	 +c3zE4WqMJsf2B3qKXZQDRJaeCDLU0r3mm9pnMZPcyPTB3zW/TSYgg59urw+CXnr8wKvK
	 PhP87XyMo3kTTzHoQjnXZK7CvG/nzaKjPt5ToiDwUNj5efiBlywoNXnv7VhJgvghGZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367146;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kuKL7b/uFjj/kh9m7DzaXizkG9DLYfZ9ZZ4A8ixWy+M=;
	b=UB60exCFVl3YyFQNETg2zo6nyni6Wnme8vtH/v5V+LevGzmL4GHaV8XKPPjswR+fyvf+
	 We9bY5brh/OAYqEol781QDyFIJ5S6mu5JW7g3IpM4biw4pLesCgxK716QTrUc6vDkfJIy
	 p+/MJXD57FwBOA4mBZojWYhfXmtC4S7bT3v9H1dDDoO1If8J6upBCPaaRHd1CgIn7vDGM
	 DquRgPEClC4wRVRYhOsunLtC1sG3JQGDPU4F5WmIOgD6/TSeh8r0F6eixN/5vClZtfCpK
	 tMv7SLzi/tqXd3rzsLptU70cXOrYFfvy3Z6qDxgDS1vXyL4Qb5LbL4s1DD1+3PGLrFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YGvjbnNe;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC5606A32C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 17:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DC5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YGvjbnNe
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4809F4E416E5;
	Sun, 22 Nov 2026 17:05:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1424760512;
	Sun, 22 Nov 2026 17:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CE3D11E62428;
	Sun, 22 Nov 2026 18:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795367142; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kuKL7b/uFjj/kh9m7DzaXizkG9DLYfZ9ZZ4A8ixWy+M=;
	b=YGvjbnNewMZ6IUn+9z5/8MlcfTA2Afsxl5UPqe+BGo7wK7Tm9GGkm1Fb6T5lxf9RUTuT/r
	qaTnPzpaf4rREvTgdOKoyY1Ry7V1OMXGpqAl4j66dtypvX4S4il7hmK8Jv0muYTKmhh0uf
	8h1FsrgjkwNezaJ8MQK8Oue/PlDdgyXGuNzGw2lfmUXhlWpE63H4G4aHBuGVoO3E2RkGdq
	48AXZfEL2QfJaq0vT63p12g1+yokd4ckHLOByKoGiUK8Yr/V7L5PiPnxsfR6n+Kzv2xvkA
	qmmF7BiqrRRsm123bdVZVzvUO3LFdVkCziVjd8dMTyKoYh2/WAobwysXRxAgyw==
Message-ID: <fa13b218-97ef-49b6-ab8f-4e6707837a91@bootlin.com>
Date: Sun, 22 Nov 2026 18:05:37 +0100
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

Hi,

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

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

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

