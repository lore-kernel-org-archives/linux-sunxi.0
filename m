Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445521;
	b=or2GsNjiQEDv4wrqTnEy3CMeW8w9l6AVYplC6xKv27HXgEcQwX3Qo1Hv97lGwkN0JhQc
	 U8W8v1nLd96OEKgNcsUXm0uk2RIA6RFNPBOXeNxtfNHmnjQLkQre2Y4foH1BPn+ox8T8f
	 9ZF60nlG2wH02n1YFS4QyX4sZxE4voofzLV/2p9It4EECBSkSBawj+V16efgucNfz0ynL
	 yT6oGwdczeF8M2ybaf1x8Oot7IdugWnPOsNCFLABG5BDGL7sanBtjetcoBHW0bXYk3rWg
	 Bvz+7iUc19nQNmTWCFGyJ6C+joDESrrZdVJMjAjglMDNJqbDhpIjEKsRwZr5qSbsCpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445521;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9JDW8BjO8pV2V62+zC72GsPlWIjoxqy4Dkv4PW8Y9/w=;
	b=vRI2cjCXLaYyzTSRRp8hPORKqEnI1iEgRQcFT609M8usgSFLpL4VPEERuHZ4YmiqFORE
	 BAqySo1X+v7xlX/23ZaZSSqNIwH0b4i6n68rMaaSyMKkHbTK8mYj17bJejcrdnwKP+rY0
	 5YyK3gVdestvCq3hCE9x4zwnaWSHq3PaK6VehB3WvSOYmVQM4TnSk30tbLcT4cLELk10v
	 30hiCy/HAd2xudSWpjb1Rms2/MZxD66qdbNi+MdcFeJBuqyTkFGnA62tf4FoH8QCH0lzG
	 leA9f5CdcoBtiEVxIJ5+SypktXKKJrTT+GGZyMDvIATYHbR+1trbxay7l8e7N/D/ZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qak6zpwX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB3606A32E;
	Mon, 23 Nov 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qak6zpwX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C253E1F000D1;
	Mon, 23 Nov 2026 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445521;
	bh=9JDW8BjO8pV2V62+zC72GsPlWIjoxqy4Dkv4PW8Y9/w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qak6zpwXQJLL3Kvq6BKWq53jr5EnQT+eXPjt5h9GM9HBjjdLh8vjMyXNOJ3ihQOmR
	 oKSJyZ0ARs+nkqN3CUTDERe7H7uXl1iFvONORXopVNbfNZajlZvSqpoXFRT/vXUFtm
	 4xxzBjadJV/vlVscAEFb1qk8HB+EX5nT3/2mSSQromZXe1m/UKTTqfa0ggEp0y0qnc
	 rxp1gwWEDnxihTYnd7RveF0HylGtogWM7lsHvmO7J9tXjoA1U/fRvz/sr4hx0BjwHI
	 D1CKEUYtXjsoErHwgqloaC9NIIwv+GBnPKFsLgqY3OYk4UzmAmuPzYN0enAOeu4jCh
	 Q2dGMnPGPwkCw==
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 14:51:59 +0000
Message-ID: <179544551937.3135.9976133356956488963@kernel.org>
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
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

- [Medium] Unserialized read-modify-write of EMAC_RX_CTL1 in
  sun8i_dwmac_flow_ctrl() (drivers/net/ethernet/stmicro/stmmac/dwmac-…

--

net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills

This commit sets the RX FIFO flow control thresholds in EMAC_RX_CTL1 from
sun8i_dwmac_flow_ctrl(). With these thresholds, the MAC sends pause
frames when less than 2K is left in the RX FIFO and stops when more than
4K is free. The new bits are set only when TX flow control is requested.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index c63f4d87de509..75c743dfe3483 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>  		v &= ~EMAC_RX_FLOW_CTL_EN;
>  	writel(v, ioaddr + EMAC_RX_CTL0);
>  
> +	v = readl(ioaddr + EMAC_RX_CTL1);
> +	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
> +	       EMAC_RX_FLOW_CTL_TH_DEACT);
> +	if (fc & FLOW_TX)
> +		v |= EMAC_RX_FIFO_FLOW_CTL |
> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
> +				EMAC_RX_FLOW_CTL_TH_2K) |
> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
> +				EMAC_RX_FLOW_CTL_TH_4K);
> +	writel(v, ioaddr + EMAC_RX_CTL1);

[Severity: Medium]
Can this read-modify-write of EMAC_RX_CTL1 race with the RX DMA start and
stop helpers?

EMAC_RX_CTL1 also holds EMAC_RX_DMA_EN and EMAC_RX_DMA_START.
sun8i_dwmac_dma_start_rx() and sun8i_dwmac_dma_stop_rx() update those bits
without a lock:

    v = readl(ioaddr + EMAC_RX_CTL1);
    v &= ~EMAC_RX_DMA_EN;
    writel(v, ioaddr + EMAC_RX_CTL1);

The phylink resolve worker reaches sun8i_dwmac_flow_ctrl() through this
path:

phylink_resolve()
  phylink_link_up()
    stmmac_mac_link_up()
      stmmac_mac_flow_ctrl()
        sun8i_dwmac_flow_ctrl()

That path holds pl->phydev_mutex and pl->state_mutex, but not rtnl.

On the XDP and XSK paths, the DMA start and stop callers hold only rtnl
and never call phylink_stop(). One example:

stmmac_xdp_set_prog()
  stmmac_xdp_release()
    stmmac_stop_all_dma()
    free_dma_desc_resources()

The same applies to stmmac_xdp_open()->stmmac_start_all_dma(), and to
stmmac_disable_rx_queue() and stmmac_enable_rx_queue() during XSK pool
setup.

If a link-up event is handled while an XDP program is being attached or
detached, two interleavings look possible.

In the first, flow_ctrl reads RX_CTL1 while DMA_EN is set. Then
stmmac_xdp_release() clears DMA_EN and frees the RX rings. Finally,
flow_ctrl writes back the stale value, which sets DMA_EN again.

If the sun8i RX DMA resumes on DMA_EN alone, could the hardware then
access the freed descriptors?

In the second, flow_ctrl reads DMA_EN as 0. Then stmmac_xdp_open() or
stmmac_enable_rx_queue() sets DMA_EN | DMA_START, and flow_ctrl writes
DMA_EN back as 0.

Would RX then stay stopped until the interface is reconfigured?

Before this patch, flow_ctrl did not touch EMAC_RX_CTL1, so these writers
could not overlap. Could accesses to this register be serialized, or could
the thresholds be programmed from a path that is already ordered against
DMA start and stop?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122144926.284857-1-maxime.chevallier%40bootlin.com
