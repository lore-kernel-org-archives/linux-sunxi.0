Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518983;
	b=39lZJYKEkNZBvHzUaZkpuzcqzNLl1GfyTM9ikUfPigdyiah7bFaoGqGN4aVdhejuXZ4f
	 2Js7LiJGg5SsfS0SnJdp1zBKtvLe4dy+1iUa3+lUqb01b6NWtHoe/ugTMQ8W+F+mSGZsM
	 2S04SBuI2aO2LqWgrVRIDnf+M6+haddSZwQgA8C1LgzD4AKttwdrX40leuGAdoC52+NAW
	 XRXDs9va1gUejelV98nHqNzjMH374uY1Xg0FneNhLbH++/A1voqaDKYZUoWVCq2WZcZxw
	 H6ZQKtRU758rwFogSSz6wpkAAGTPk4ekROAFOaZ1BF5Kb8/qh7Nl/V78Nrr1sTmnl0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518983;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZgGUj/jaoNiS6CrTSxsHf/IwQ+EgQ0chfRhTZQrXa9Q=;
	b=5R+kj96ci0NV7Wzi1KniYHWKyeSBzRhG2SGhL0mu9TLgj9kR3Q7KqxGfTcctA8Eo0vhz
	 tP0IE7Pagin1wAJGNXazpjhV1FpoB4y81VbukfpbaAR3mQ9UedQLSvrNBatYKdFVfqiDp
	 IehHzjS9i3Ru3trtDOBVF1APClsLY3pzdZzP6fIyXSbwgLj3h/gdC5mf9S4GEw4JlEDOB
	 1swP0LQllbM8cRzOndfbNBrmL5/ERDAqBR7hIwnW3tuh6bkDUI3AW5dl9pSFCgC/Cqopn
	 bCJcOxSRf7+g9qtRcRilgiC8TiWOl4GQxOBGtsXn6JFW+JyU9gP3AfnU/0WHLRPQXSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkcbMMU5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FCE606A33A;
	Tue, 24 Nov 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkcbMMU5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EA71F000EF;
	Tue, 24 Nov 2026 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518982;
	bh=ZgGUj/jaoNiS6CrTSxsHf/IwQ+EgQ0chfRhTZQrXa9Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PkcbMMU5SKcnD617v++0PTbpcAYDiVO3I3SftUfbq/x3/C+mh/tEEpx4DSV0KmpGB
	 vcLwg7jDaVvtHjzfYvApVTFDthluYn6Eq2cXtmE1+RxsXG1LcRRDFl1oOMBzlqxlV+
	 Yxn/3uJZJUbuwsJSQ42GHrdq3TCXDD/mhOAVRR1gj8KNzUNzwzWFn97xaQWWKa1OeD
	 sPE002aRjnlqBDqh+mjiR00hvTbWZpDApZ9QmGX2GG9bGbRrwBAzWIIAfQqiXzgAm3
	 QKccZKg0U22AhMh5d1cl4++Qjp1gUB9i+4BvXddVqKYPeAmggtQy3P4yUA6VAmGvd4
	 UaZj6gMobPcww==
Subject: Re: [PATCH net-next v4 4/5] net: stmmac: Add MDIO init and exit
 platform hooks
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:21 +0000
Message-ID: <179551898118.3135.17931835729016827308@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] stmmac_dvr_remove()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c) asserts the MAC…

--

net: stmmac: Add MDIO init and exit platform hooks

This commit adds two platform hooks, mdio_init() and mdio_exit(), to
plat_stmmacenet_data. mdio_init() runs once the stmmac MDIO bus is
registered and mdio_exit() runs before it is unregistered. Glue drivers
can use them to add devices such as an MDIO mux on top of the bus.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 7396b68899c66..fb1f7b1a5323b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c

[ ... ]

> @@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
>  
> +	if (priv->plat->mdio_exit)
> +		priv->plat->mdio_exit(priv);
> +

[Severity: Medium]
Is the MDIO bus still usable when mdio_exit() runs on the remove path?

stmmac_dvr_remove() asserts the MAC resets before it calls
stmmac_mdio_unregister():

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_dvr_remove() {
    ...
	phylink_destroy(priv->phylink);
	if (priv->plat->stmmac_rst)
		reset_control_assert(priv->plat->stmmac_rst);
	reset_control_assert(priv->plat->stmmac_ahb_rst);

	stmmac_pcs_clean(ndev);
	stmmac_mdio_unregister(ndev);
    ...
}

As a result, mdio_exit() runs while the MAC, which is the MDIO master, is
held in reset.

Later in this series, dwmac-sun8i uses this hook to call mdio_mux_uninit().
That unregisters the mux child buses and removes the PHYs on them. PHY
removal can issue MDIO transactions through the mux:

stmmac_dvr_remove()
  reset_control_assert(stmmac_rst)
  stmmac_mdio_unregister()
    mdio_exit() -> sun8i_dwmac_unregister_mdio_mux()
      mdio_mux_uninit()
        mdiobus_unregister(child)
          phy_remove()
            phy_leds_unregister()
              led_classdev_unregister() -> phy_led_set_brightness()
            phydev->drv->remove()

Each of these can reach mdio_mux_syscon_switch_fn(), which calls
sun8i_dwmac_reset() on the MAC registers, and then
stmmac_mdio_read_c22() or stmmac_mdio_write_c22(). The H3/H5 DT names
its EMAC reset "stmmaceth", so plat->stmmac_rst is asserted while this
happens.

With the register file in reset, the busy poll in stmmac_mdio_wait() can
read 0 and report the bus as idle:

	if (readl_poll_timeout(reg, v, !(v & mask), 100, 10000))
		return -EBUSY;

In that case, would MDIO writes be dropped without any error, and reads
return 0 as if they had succeeded? On interconnects that stall on
accesses to a block in reset, could the access hang instead?

Before this series, the sun8i mux teardown ran before
stmmac_pltfr_remove(), while the MAC was still out of reset. The commit
message says mdio_exit() is "called before it is unregistered", which
suggests the bus still works when the hook runs. The new member in
include/linux/stmmac.h does not mention any restriction either.

Should mdio_exit() be called before the resets are asserted in
stmmac_dvr_remove()? If not, should the hook document that the MDIO
master may be in reset when it runs?

>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com
