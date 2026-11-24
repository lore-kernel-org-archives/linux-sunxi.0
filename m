Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518985;
	b=zxbNpe/Y0rOwUSdz822patC6FoyyNcS/aw7xjl3DCGP6XlV+Bj8CjVjpDKTOj10XYhRk
	 gxa1n/JFN59WA9AlrsuUjqkulcaB2J3rVEaDuxy9WEAO8137ZfzjKjdlJOMXe9GhWI6Gt
	 6Zc4P3zyWJtoQaP6mna/0JwlX5QuXoH1rCRH6jAxVy1n8vReJ12qy6dY2W+V2pTb37gcO
	 DMYPgrHDYA9s5pjTs+rJunsplzEDWXdAphe+6pJDRpV0nhdcUjjHibTeZZa1bV1g3y5mx
	 Olf1VERErxtGu3RkEDfWjJRepy/JWfK5YXBjvaFNp70HB5nntBTkOCq2F/32jMif50A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518985;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FgfkXvgrc7uLZ8CZZkTM/Ni360utD6hlAVDSp6eqokk=;
	b=RLWHYanLiW9+R3twj+izaWl8Hnr3iXR3Izc5BeUqrn63ZtG1VwiMVdmy/gjPemSLXR6g
	 EW8WRbn3oBsZeY9kTYuAQ4JsKTtiHD14SFkyiMNUOnDrROCyLf3qI9LFmVGOvN8DHvkOy
	 37cfWqCrXr+7j0IzC+GsL4VJdR5JpRMbMvUh7+a/IagfwlBT5XioY5vlG6/X65IKI3eNX
	 4iWQ0EARdIV9yRUbqn32poaHzKn+NA05qBnbTpykFicg7dvzxtYU+egO6g1rau6jQYPuK
	 0B1qdzjYnKcQ6XAsu8CqpHlvpcLbj4sqPSo+fNVez5LlyROIP8TQFZhfxgQgmrtMb3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0kVkh8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E53606A32A;
	Tue, 24 Nov 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0kVkh8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39731F000C0;
	Tue, 24 Nov 2026 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518985;
	bh=FgfkXvgrc7uLZ8CZZkTM/Ni360utD6hlAVDSp6eqokk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k0kVkh8dZcS/xPqg16cgv3QP+uZzFSq2766UJlz1RxFDRIymeZXSFErQy7uhrfZLR
	 VT/mwGl14pTgUJ4A2BYosFih2psoKYXILqbhLHy3Z390QCcdA3nBrjR9dS2bjgbNSw
	 R6UUBCbAWaZ93WvZQMXK4Wg32x85Fxzzy9tQ1IRodkJmsbOX1wukPze5ZNE8sW1osT
	 10thy26lELO1nJlPytAKtP9Yncw0tVEmA+YdXSHdh8W7Rbk0Lawy4tmEikl0t28srd
	 Ip2tZEhVDWIHrBuIeH6jcifwLxkIVK12H4G6o9Pwam0UA46I3Bj8uSNn6d7VN3xF15
	 +nTqmbvqvsKjg==
Subject: Re: [PATCH net-next v4 5/5] net: stmmac: dwmac-sun8i: Register the
 MDIO mux in the MDIO setup
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:23 +0000
Message-ID: <179551898345.3135.1078888477341036847@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-5-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-5-57eba8915f25@gmail.com>
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

- [Low] The commit fixes two user-visible bugs but has no Fixes: tag and
  no Cc: stable.
- [Low] The mux children (and the PHYs on them) are now torn down after
  the EMAC has been put back into reset.

--

net: stmmac: dwmac-sun8i: Register the MDIO mux in the MDIO setup

This patch moves registration of the sun8i MDIO mux out of
sun8i_dwmac_probe(), where it ran after stmmac_pltfr_probe() returned,
and into the new plat->mdio_init() hook. The mux now exists before
register_netdev(). Teardown moves from sun8i_dwmac_remove() into
plat->mdio_exit(), which runs after unregister_netdev().

> On remove, the mux goes away before
> unregister_netdev(), and unbinding with the link up oopses in
> phy_stop().
>
> Register and unregister the mux through the new mdio_init() and
> mdio_exit() hooks.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
The message describes two user-visible bugs: an early open that cannot
find the PHY, and an oops on unbind. There is no Fixes: tag and no
Cc: stable. Should these tags be added so the fix is picked up for
backporting?

The probe-side logic ("The mux must be registered after parent MDIO so
after stmmac_dvr_probe()") seems to come from commit 634db83b8265
("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs").

The remove-side ordering seems to come from commit 529254216773. That is
the ordering where sun8i_dwmac_remove() calls mdio_mux_uninit() before
stmmac_pltfr_remove().

A backport would also need the earlier patch "net: stmmac: Add MDIO init
and exit platform hooks". The message says "the new mdio_init() and
mdio_exit() hooks" but does not name that patch. Could the dependency be
named explicitly?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4acfda235394d..0ec25ae0b77ef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -941,6 +940,13 @@ static int sun8i_dwmac_register_mdio_mux(struct stmmac_priv *priv)
>  	return ret;
>  }
>  
> +static void sun8i_dwmac_unregister_mdio_mux(struct stmmac_priv *priv)
> +{
> +	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
> +
> +	mdio_mux_uninit(gmac->mux_handle);
> +}
> +

[ ... ]

> @@ -1269,9 +1251,6 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  
> -	if (gmac->variant->soc_has_internal_phy)
> -		mdio_mux_uninit(gmac->mux_handle);
> -
>  	stmmac_pltfr_remove(pdev);

[Severity: Low]
With this change, stmmac_mdio_unregister() calls mdio_mux_uninit()
through plat->mdio_exit(). In stmmac_dvr_remove() that call comes after
the EMAC resets are asserted:

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

Before this patch, sun8i_dwmac_remove() tore down the mux children while
the EMAC was still out of reset. On H3/H5, sunxi-h3-h5.dtsi supplies the
stmmaceth reset, so plat->stmmac_rst is non-NULL there.

Could MDIO accesses made while the PHYs behind the mux are being removed
now reach an EMAC held in reset? This happens with CONFIG_PHYLIB_LEDS
and a PHY driver that implements led_brightness_set. The path looks like
this:

stmmac_mdio_unregister()
  sun8i_dwmac_unregister_mdio_mux()
    mdio_mux_uninit()
      mdiobus_unregister(child)
        phy_remove()
          phy_leds_unregister()
            led_classdev_unregister()      /* LED_OFF */
              drv->led_brightness_set()
                mdio_mux_write()
                  mdio_mux_syscon_switch_fn()
                  pb->mii_bus->write()     /* stmmac MDIO write */

If the target child is not the one currently selected,
mdio_mux_syscon_switch_fn() also does more work against the block in
reset. It rewrites the syscon EPHY select bits, toggles internal EPHY
power, and calls sun8i_dwmac_reset(priv->ioaddr).

It is not verified what the hardware returns for reads from a block in
reset. If it returns 0, the MII busy-bit poll and the soft-reset poll
would pass at once and the PHY write would be dropped silently. The PHY
LED could then stay in its previous state after unbind.

The practical impact looks limited:

The only in-tree H3/H5 board with PHY LED nodes is
sun50i-h5-orangepi-pc2.dts. It uses an RTL8211E, and that realtek driver
entry has no led_brightness_set.

Other glue drivers already have the same reset-before-mdio_unregister
ordering for PHYs that sit directly on the stmmac bus.

sun8i_dwmac_exit() and sun8i_dwmac_unset_syscon() still reconcile EPHY
power and syscon afterwards.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com
