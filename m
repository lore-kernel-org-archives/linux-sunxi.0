Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974431;
	b=g/7s0mnQAVZBDhYoALyZm+teke5/nz5oKrDxLBXLdUqqMUjT5b0Gvz6xTXOLeGUkV5S+
	 rDWUHrY7dYjKddBWp2CLZqIdZE5F9NBsTGy/eGlQD8Qeol28CiYWx/aejzJ3+SiCY7fm6
	 y+vMwF17XvmBa99TomSDUYBwNSmNU2DBETxxBV1kZGVgu6HjvjpB/N7EzGLlMKHohnHbk
	 w2d0WxuAhSeUgLeRTcfAe15b7D7oFoEeUnJu4pU+qy6wcDr0GdtrkICOQgxu8fm3GObHo
	 hfwVDTdxmpzwhINpfwOoQ6bncdEyZGGYIkqtr41PWfLrpK+HFF3zYRjBvbpiq9YcSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974431;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ce09li/mRE3QKbeYZW0hYgjy4tmbydFrUNpFWj4zNGo=;
	b=uQfx5sSaX+JqnMzOlKvY8oV+vSPyuRxECRwit+clEC67UohImtGKj6kpZFS5GEJjAJNL
	 R8AenLvTCOzFfU8332ZyuLnKktIzx3Ps0DMZQJu/fJHP9ne0M7WD7nmBSoEh4QAeKrnI8
	 3YfeVc3QJiuJC/BFpUs7HxMxI7a+T54wUK0orhlK4OzHxy3bkYtSY9wziSO6slqIiyA8N
	 oDi6HOdIP6pK9304ed1ujEP5I9LFiOgN/1wP51qmnWPNqx44bh/aub33+1cCotZEorC/s
	 FVaWSXsRwboVGUVuuqUIMi6Fojit0ahglxXb2QWo0P/7yHdpqx8iOvYJXqT6dFLlWWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fo2sJyOz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BB5606A31C;
	Wed, 18 Nov 2026 04:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fo2sJyOz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD081F000C4;
	Wed, 18 Nov 2026 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974431;
	bh=ce09li/mRE3QKbeYZW0hYgjy4tmbydFrUNpFWj4zNGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fo2sJyOzhoOIx3tm7h6MSHaw2g65Rdo7lkEFqCZA5pMcvsSs2luGzSNylqaOHkBrz
	 ZXLS0J6AXNLqEfhmLzE/Y3me9hev9Ip3uIk8JPtLjryuTxU0yPPgabZKL0Ejp9nev6
	 cLuj9wQ9z9SHNHfgu1EVR45eqD9RI7Ge5XYdMzgadCgVoai8fDGAT7diGzZTQEv534
	 Pj9D5nmoX/pAVeC5kEiFd5Y/W4HGqc9v1Dw7x1ffHULi0ZBa7m42/8BS7SFjaRTGbG
	 PMdTJlIs751SFo+vYN56dGXymMvfZrwsWe49EVzn4EbvMAoo76NrBJnWCEZ76AIL69
	 XXhTAOr7ImL3A==
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 04:00:29 +0000
Message-ID: <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
  NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS…
- [Low] When RX checksum offload is turned back on, frames the sun8i MAC
  received while EMAC_RX_DO_CRC was clear can be marked…

--

net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting

Before this patch, sun8i_dwmac_rx_ipc_enable() always set
EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
hw->rx_csum, so that turning off RX checksum offload through ethtool
also turns off the hardware checksum engine.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..98cc7503bddeb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
>  	u32 v;
>
>  	v = readl(ioaddr + EMAC_RX_CTL0);
> -	v |= EMAC_RX_DO_CRC;
> +	if (hw->rx_csum)
> +		v |= EMAC_RX_DO_CRC;
> +	else
> +		v &= ~EMAC_RX_DO_CRC;

[Severity: Medium]
Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
FCS check, and not only the IP/L4 checksum engine?

The bit is named after the CRC:

    #define EMAC_RX_DO_CRC BIT(27)

The probe code says the hardware features were "copied from Allwinner
drivers". That code sets this bit with the comment "Enable CRC & IPv4
Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
CRC and check the IPv4 Header Checksum".

On this path, sun8i does not have the hardware strip the FCS.
stmmac_rx() removes it in software without checking it:

    /* ACS is disabled; strip manually. */
    if (likely(!(status & rx_not_ls)))
        len -= ETH_FCS_LEN;

The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
ndesc_get_rx_status() turns into discard_frame.

Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
off", the path is stmmac_set_features() -> hw->rx_csum = 0 ->
sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
than "RX checksum offload off".

Is there a datasheet reference or a bad-FCS test showing that bit 27
gates only the L3/L4 checksum? If the hardware ties the two checks
together, a different approach may be needed. For example, keep bit 27
set and, when rx_csum is 0, stop discarding frames whose only error is
the IP or payload checksum.

[Severity: Low]
Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
checksum-verified once RX checksum offload is turned back on?

When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
software flag before the MMIO write that re-enables the engine:

stmmac_set_features() {
    ...
    if (features & NETIF_F_RXCSUM)
        priv->hw->rx_csum = priv->plat->rx_coe;
    else
        priv->hw->rx_csum = 0;
    ...
    stmmac_rx_ipc(priv, priv->hw);
    ...
}

NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
Meanwhile, stmmac_rx() may run on another CPU and read the flag
directly:

    int coe = priv->hw->rx_csum;
    ...
    if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
        (status & csum_none))
        skb_checksum_none_assert(skb);
    else
        skb->ip_summed = CHECKSUM_UNNECESSARY;

sun8i uses normal descriptors. ndesc_get_rx_status() never returns
csum_none, so nothing in the descriptor says whether the hardware
actually checked a given frame.

Any unchecked frame still in the RX ring would then be passed up as
CHECKSUM_UNNECESSARY. That covers frames received before the writel()
in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
Before this patch, the bit was never cleared, so this state could not
happen on sun8i.

Swapping the two writes would narrow the window, but it would not cover
frames already in the ring. Would RX need to be quiesced or drained
across this transition?

>  	writel(v, ioaddr + EMAC_RX_CTL0);
>
>  	return 1;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com
