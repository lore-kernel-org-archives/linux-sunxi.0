Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535235;
	b=cv4Cf2MspfEzfJ77Um0Gt5p7JwZjO4UIyHRMu6KhLHvj/4Yx3yrkVMpoPCP3kvCV+m/L
	 mV8Z5gq4wpYGIJBbZMFEdrV3f3Om91RpP6o1Xxmy+MPTtcAzWTerJm2FVGBPdW3Mc8K0n
	 zNnB528HhHr/kQloMSpsQYTy4cZJnGQ33zFXFtodEgQMpHASs8R1w7tA+eP8VjoEcgOos
	 Z69OeRMf5q6k3hyr7b1Y5EnGagU1toFbcUH0OD1Z9+lrFp7UgR4c2J9lklAa4ds8B3Ecz
	 0bnC14P5d4YEbNq8bEx8j1sHDklycNH2LWc0jPj/iihBSd8v7WUImR1WMLqflGyeTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535235;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mnw6E1h7bjfHhFgcDHd+fVMgItD42/KW+vwcJIrj1Cs=;
	b=2ylh3EM5NUDARZwuBhMPVF4wfE4EUyy67oEBtRgZDldQN7XTYx1M0HDKawZ7+poHxCD6
	 hiRJ3DgqpWGNv+US0HCTcjj/NFrR6omNjGS3iXZewBXos9wOvR35QlfQ0eFxAvrQhgkO1
	 3RUVgxe9Z4BO1boN28FhG/Zn4JDDQPXzibJysnCniYxhxNau2/Iv0Q0dM0HwbRMy2Iz87
	 ZY27hU5W9swiW31aLHQ8PO2bAogwj/C5IvtkxXQqcDrx1A5HOaA4cNNXN7CTg3q0SAG5S
	 /9JnvPb4mbfPQ2ophGTA0bJ5F98l3Q6JOJ8Fk9fGIF0ubW7StOKQlPM/eRyJHG49+zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWwl+S8x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C1606A33D;
	Tue, 24 Nov 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWwl+S8x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D121F000C0;
	Tue, 24 Nov 2026 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535234;
	bh=mnw6E1h7bjfHhFgcDHd+fVMgItD42/KW+vwcJIrj1Cs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VWwl+S8xDi+iSPm5J3H3Y2yII0plP3fQQHf4974Vo5SIvkxXxysZJoHbrcEW65xuA
	 qQc69KmjxB/6YUCFSTUeXTiJSp2FUKd+POPfrBpSy+u/WhcZM8rl2gROZUAUKFdWak
	 eFVWuL4qBHQ7hgjI437RDB65un0cSDswsEqM59HAAtj2Yqu4CfJ0rLvLaciTCkwmtc
	 4EyBdZqLYf07592ekZKOcqirdHwGypFCymgTlmZrUy7EC0lXVlZn5DihWla8hujsUK
	 st08k68Op6Gm/OtFEhXGaUygAi4Svc8AaJixgEv626Ko25b5rKDNOR87+4JOPionKJ
	 gg3VwJhUlZsNw==
Subject:
 Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 boon.leong.ong@intel.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com, kuba@kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Date: Tue, 24 Nov 2026 15:47:13 +0000
Message-ID: <179553523359.3135.5161173895419384474@kernel.org>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch adds a `set_rx_all` member to `struct stmmac_ops`
  (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) but no…

--

net: stmmac: dwmac-sun8i: support ethtool rx-all

This adds opt-in NETIF_F_RXALL support for dwmac-sun8i. With it, complete
frames with a reported wire error, and runts the MAC can forward, are
delivered to the stack and are not counted in the good packet and byte
totals. A new set_rx_all op in struct stmmac_ops updates the runt
forwarding bit in RX_CTL1, and a new spinlock serializes those updates
against the DMA start/stop bits.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 047d809b8b889..2cfadc6861047 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -319,6 +319,7 @@ struct stmmac_ops {
>  	void (*set_mac)(void __iomem *ioaddr, bool enable);
>  	/* Enable and verify that the IPC module is supported */
>  	int (*rx_ipc)(struct mac_device_info *hw);
> +	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
>  	/* Enable RX Queues */
>  	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
>  	/* RX Queues Priority */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2f33fc0126b11..0a893c2cea78b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6453,6 +6466,11 @@ static int stmmac_set_features(struct net_device *netdev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(netdev);
>  
> +	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
> +	    netif_running(netdev) && netif_device_present(netdev) &&
> +	    priv->hw->mac->set_rx_all)
> +		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
> +

[Severity: Low]
This isn't a bug, but should the new op get a stmmac_set_rx_all() wrapper
in hwif.h like the other struct stmmac_ops members have?

Every other MAC op in that table goes through stmmac_do_callback() or
stmmac_do_void_callback(), which checks both hw->mac and the op pointer
for NULL:

drivers/net/ethernet/stmicro/stmmac/hwif.h:
#define stmmac_core_init(__priv, __args...) \
	stmmac_do_void_callback(__priv, mac, core_init, __args)
...
#define stmmac_rx_ipc(__priv, __args...) \
	stmmac_do_callback(__priv, mac, rx_ipc, __args)

Here stmmac_set_features() calls priv->hw->mac->set_rx_all() directly
and does its own NULL check. A few lines below, the same function calls
stmmac_rx_ipc() through the wrapper.

__stmmac_dvr_probe() also reads priv->hw->mac->set_rx_all directly to
decide whether to advertise NETIF_F_RXALL.

Both sites check for NULL today, so nothing breaks now. Only
sun8i_dwmac_ops sets this op, though. If a later caller copies the
direct call without the NULL check, could it oops on every other MAC?

>  	/* Keep the COE Type in case of csum is supporting */
>  	if (features & NETIF_F_RXCSUM)
>  		priv->hw->rx_csum = priv->plat->rx_coe;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3%40gmail.com
