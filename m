Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518977;
	b=2MZPtFwxmyVqktBIfWbF8UnuXlELHIFnaw3Tst9NCK00LDNbA7s4PjQGkl66IfRcBcpy
	 58OyLecBLp89a4e5da7eazDQnTbPYyjHUC6KDsjnmyN/ym6Vd0jyEGA4Azj8kdzrlOPQ6
	 hphTOrSKjkBFoa6Ip1Nk96zo5BiN5/9iuzVOZYUWE05DFer3siWaDE/tCgDfkI25c8RoL
	 EH+17IMs/Vcerjt5a80w+7gtjCBBQB2Jqg54fifa6r1SQcUgIwvFy5bmPbosUWkBYHeiQ
	 S7h6gVVl+5gmC2colKUdjxAw402Z+QB3MH6Go4sIcT1K9M6WaGwD7uts5jI0szx9wAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518977;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tybZ8A9gQEPaCmNc6ZBx7xtz6zHhGLsPWUWzuEyVLfQ=;
	b=23aYU1YxB5v/N7Wfie4MJeJzRoDrxp1dHTj5hyhzf6n7FhXRnvDIc8HQP436eBRXfSTy
	 YcLssJxXov++Q/j3ZeVFBisqCGmYAgxBtAfiDSdUP+I7kIqAY/XLCbvOhh4wpirlY40+r
	 2Qlfb0fft7XjLro5ruQ1yWtzYZDoH8fs356hXFsQbF5LlIZQtWuVTBp2TFR4E3RZVfrbo
	 Pr8a4GDwaAL3r7magnwLMKNexkl8LnF5AWplI66sl2N71dwX9W+8FPfEo0tJBGGYj9erN
	 LBT1WMlm7E0qG1Hrux34cBpXvZwH4l3nqZ89Sh2VP25tItmjNyeELPlxVxZjMvCdnfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWX15aP3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49504606A31E;
	Tue, 24 Nov 2026 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWX15aP3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45611F000C0;
	Tue, 24 Nov 2026 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518976;
	bh=tybZ8A9gQEPaCmNc6ZBx7xtz6zHhGLsPWUWzuEyVLfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QWX15aP3PT81dY6/DPQL3gVieVvQ6oTnTRBjI50dADq62vH9PBHJZ1bw/kPPeDTe6
	 2WTm2ZTLjFV5Wq0WgxvA68MI3/eT3T0jzYH2ohpsw0qvCZ480OTVKSj4/8Nbi4OIVp
	 J7Y+K3TgTTF0fUcUQ8fI5AOdFwAGYc6f01YD4dqv/LU4qDqlUoqxptNgFGlH6x3xBI
	 xShKmi0u3MFPxWBC6YhhZvTqcsuxXxGuBFDfovKufkrMpgHd+oijxwiKn4UW0+peMb
	 Wpz0+WglLKkwG4AKdGBR1mYuT2bm1UJ2vkGYT3g9RAylLi5lbcmBAHCoAv1gUxk2B1
	 BG8xoxVz6Qa8g==
Subject: Re: [PATCH net-next v4 1/5] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:15 +0000
Message-ID: <179551897540.3135.862711203479532427@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
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

- [Low] The commit fixes a real use-after-free on the sun8i_dwmac_probe()
  error path but has no Fixes: tag and no Cc: stable, so stable trees…

--

net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC

This commit moves the reset_control_put() and clk_put() calls for the
internal PHY so they run after stmmac_pltfr_remove(). Before, they ran
before it, both on the sun8i_dwmac_probe() mdio-mux error path and in
sun8i_dwmac_remove(). This fixes a use-after-free because
sun8i_dwmac_exit() still uses ephy_clk and rst_ephy to unpower the
internal PHY.

> net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC
>
> sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
> rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
> before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
> the scan of the internal bus has powered the PHY, this is a
> use-after-free.
>
> Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
> is then redundant.
>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Should this have a Fixes: tag, and perhaps Cc: stable? Without them, the
stable trees won't pick up the use-after-free fix automatically.

The ordering problem seems to come from commit 529254216773 ("net: stmmac:
dwmac-sun8i: Balance internal PHY resource references"). That commit added
the puts under the dwmac_mux label, and that error path then called
sun8i_dwmac_exit() explicitly.

Today, the same error path falls through to:

stmmac_pltfr_remove()->stmmac_dvr_remove()->sun8i_dwmac_exit()
    ->sun8i_dwmac_unpower_internal_phy()

When internal_phy_powered is true, that runs clk_disable_unprepare() and
reset_control_assert() on handles that have already been released.

The flag can be true here. mdio_mux_init() scans the internal bus first,
and mdio_mux_syscon_switch_fn()->sun8i_dwmac_power_internal_phy() sets it.
A later child bus can then fail with -EPROBE_DEFER, which is an ordinary
event.

Would something like this be appropriate?

Fixes: 529254216773 ("net: stmmac: dwmac-sun8i: Balance internal PHY resource references")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..9fb398f7cf9ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1236,7 +1236,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> -			goto dwmac_mux;
> +			goto dwmac_remove;
>  		}
>  	}
>
> @@ -1244,12 +1244,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>
>  	return 0;
>
> -dwmac_mux:
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com
