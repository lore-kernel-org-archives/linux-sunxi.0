Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535234;
	b=pi1OrRTRp99HIzeZ5Cv16B8wv749eTifPGKVk8GYQT3o/JO6sWSWMXzWVGA5GtDw2cdI
	 tN8RfzYG04/hnUBSWHtgXZpkiQFpEQvncobPoH1r7Zx3XrBqC1Yz4txDn06doM3vxSaZA
	 cZeh96DzeePXaVirFB7AwCgDDRMH7IJLJrTTMaXj3dgsvdOr7Y5yWICKJIqLoU9QMKk8n
	 VGu5U6rY0V8NMCbKKZ+VFsY+0ZMtDJFpIEbz6Zd5KGCVOWB12v+kZ6tN8/SKoloQkqMg3
	 xTzd2/Sm972OIYtdetU3ba4GYfDp24CM7pTuOdPaXhHKkbiVQCcLsbE5JGRlyzy16Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535234;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9zEJxflfBniiY+wvUsbxVAoRdntkckm8MJAOX0ZXzi4=;
	b=0wou/NlAaiQ9sboNgW5H0XTEG7oMUb9S9S3kf9lJGXgOYGoaVTCB4x627JCAQBx7oxRB
	 sr+whivFD1y4sNI0r2ZS7eCk/CJOMh4ugurnw7lJqOLzBfGY8M96ydKlxWFMFFBqNrH6p
	 U6CCgL4EzNh3ADCry06SisgxYEjnF3I9U2BZEHtrNaQ+9wY+Bk4L4Uck1xxUo7siv1lX3
	 XY9UzVnIT6jzWjDIvR7wfakwPV9uGOJWE8e6Gx7tmTRVuVXDh9c77T4Nsn+KQmX48Fumx
	 niWguMM6KeK8Ms+74hSuMMhaZdVpQaYfHAOeRawAkziiZnrfBkaT3WskPWWrGIlnM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gt9ITcAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4055606A31E;
	Tue, 24 Nov 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gt9ITcAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869EF1F000C4;
	Tue, 24 Nov 2026 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535233;
	bh=9zEJxflfBniiY+wvUsbxVAoRdntkckm8MJAOX0ZXzi4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gt9ITcAbyFHLOBwroTcionVoSNlqa4MVtgiDTBD6zfr7mOcI8H3VNYdNZ8Tk6bE9J
	 zT2uyo0V6Z+0h+2KrjHMxfPYx07EtJymNgCPgAx0Qpkh8GnGXd4vFCizrdrAbZRGpL
	 Yj/0rHIBhLS5w3I2K/xbvOLdNPJxzkm6OOpDqRJtCx54dpPiINyr+74QjsMM+1keWM
	 O7GaY7zt6FavDpNyOmua3UWtWJ4+A7gyj9WxYb880byL9/41+AhShwCfF4YbNbkpbO
	 IRGFJNax2KUGvq/QmKYMBp8eljaP3C8Qj2hSZdtYGeR2jGp9XvuVNXLzY2DMWlmYgg
	 H/nTpWw4/0QKw==
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: deliver RX
 checksum errors to the stack
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 boon.leong.ong@intel.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com, kuba@kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Date: Tue, 24 Nov 2026 15:47:12 +0000
Message-ID: <179553523210.3135.15394293018328027264@kernel.org>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
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

- [Medium] The patch has `Fixes: 9f93ac8d4085` (the 2017 commit that
  added dwmac-sun8i), which invites backporting to every stable tree…
- [Low] The commit is titled and described as a dwmac-sun8i-only fix and
  carries a Fixes: tag, but it also changes the shared stmmac RX…

--

net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack

This patch turns on error-frame forwarding on the sun8i EMAC and adds a
sun8i RX status decoder. Frames with IP or L4 checksum failures now go to
the stack with CHECKSUM_NONE instead of being dropped by the hardware. To
make this possible it adds an rx_status hook to struct mac_device_info,
which defaults to the descriptor decoder and is called from stmmac_rx()
and stmmac_rx_zc(), and it moves EMAC_RX_DO_CRC from rx_ipc into set_mac.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index a972bee66504b..706feb7bcbeda 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -615,6 +615,8 @@ struct mii_regs {
>  struct mac_device_info {
>  	const struct stmmac_ops *mac;
>  	const struct stmmac_desc_ops *desc;
> +	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
> +	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
>  	const struct stmmac_dma_ops *dma;
>  	const struct stmmac_mode_ops *mode;
>  	const struct stmmac_hwtimestamp *ptp;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..0ad2203f76c34 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -644,6 +646,9 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
>  
>  	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
>  	writel(v, ioaddr + EMAC_BASIC_CTL1);
> +
> +	/* Forward checksum failures to software before starting RX. */
> +	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
>  }
>  
>  static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
> @@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
>  	r = readl(ioaddr + EMAC_RX_CTL0);
>  	if (enable) {
>  		t |= EMAC_TX_TRANSMITTER_EN;
> -		r |= EMAC_RX_RECEIVER_EN;
> +		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
>  	} else {
>  		t &= ~EMAC_TX_TRANSMITTER_EN;
>  		r &= ~EMAC_RX_RECEIVER_EN;
> @@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
>  			    EMAC_MACADDR_LO(reg_n));
>  }
>  
> -/* caution this function must return non 0 to work */
> -static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
> +static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
>  {
> -	void __iomem *ioaddr = hw->pcsr;
> -	u32 v;
> -
> -	v = readl(ioaddr + EMAC_RX_CTL0);
> -	v |= EMAC_RX_DO_CRC;
> -	writel(v, ioaddr + EMAC_RX_CTL0);
> -
> +	/* The receiver always records the checksum result, even with RXCSUM off. */
>  	return 1;
>  }

[ ... ]

> @@ -1061,6 +1059,83 @@ static const struct stmmac_ops sun8i_dwmac_ops = {

[ ... ]

> +static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *p)
> +{

[ ... ]

> +	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
> +	if (!(status & RDES0_FRAME_TYPE) || (status & (csum_mask | RDES0_DRIBBLING)))
> +		return csum_none;
> +
> +	return good_frame;
> +}

[Severity: Medium]
This commit has Fixes: 9f93ac8d4085, so it will probably be picked up
for stable trees that have dwmac-sun8i. Is it safe there without the core
change that makes stmmac_rx() honour csum_none?

Before this patch, sun8i_dwmac_dma_reset() zeroed EMAC_RX_CTL1 and nothing
set EMAC_RX_ERR_FRM, so the MAC dropped frames with bad IP or L4
checksums. Now sun8i_dwmac_core_init() sets EMAC_RX_ERR_FRM. Those frames
reach the ring, and sun8i_dwmac_rx_status() returns csum_none for them.

The only thing that stops them being marked CHECKSUM_UNNECESSARY is this
test in stmmac_rx():

		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
		    (status & csum_none))
			skb_checksum_none_assert(skb);
		else
			skb->ip_summed = CHECKSUM_UNNECESSARY;

The csum_none clause there came from ee0aace5f844 ("net: stmmac:
Correctly handle Rx checksum offload errors"). That commit has no Fixes:
or Cc: stable tag, so older stable trees may not have it. The matching
clause in stmmac_dispatch_skb_zc() came from fcfc52fcf89a, which is
tagged for stable.

sun8i sets plat_dat->rx_coe = STMMAC_RX_COE_TYPE2, so coe is non-zero and
RXCSUM is on by default. In a tree without ee0aace5f844, would a frame
with a corrupt TCP or UDP checksum go up as CHECKSUM_UNNECESSARY? Before
this patch the hardware would have dropped it.

Could a stable dependency note be added, for example
"Cc: stable@vger.kernel.org # x.y: ee0aace5f844"?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 8ae95e91a36ab..047d809b8b889 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -125,8 +125,6 @@ struct stmmac_desc_ops {
>  	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
>  #define stmmac_get_rx_frame_len(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
> -#define stmmac_rx_status(__priv, __args...) \
> -	stmmac_do_callback(__priv, desc, rx_status, __args)
>  #define stmmac_rx_extended_status(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
>  #define stmmac_enable_tx_timestamp(__priv, __args...) \
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..2f33fc0126b11 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -5978,7 +5978,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		p = stmmac_get_rx_desc(priv, rx_q, entry);
>  
>  		/* read the status of the incoming frame */
> -		status = stmmac_rx_status(priv, &priv->xstats, p);
> +		status = priv->hw->rx_status(&priv->xstats, p);
>  		/* check if managed by the DMA otherwise go ahead */
>  		if (unlikely(status & dma_own))
>  			break;
> @@ -7809,6 +7809,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  			return ret;
>  	}
>  
> +	if (!priv->hw->rx_status)
> +		priv->hw->rx_status = priv->hw->desc->rx_status;
> +

[Severity: Low]
The subject and message describe a dwmac-sun8i only fix. The patch also
changes the shared stmmac RX path that every platform uses:

  struct mac_device_info gets a new rx_status hook in common.h

  hwif.h loses the stmmac_rx_status() wrapper, and with it the NULL
  checks on hw->desc and desc->rx_status that stmmac_do_callback() did

  stmmac_rx() and stmmac_rx_zc() now call priv->hw->rx_status() directly

  stmmac_hw_init() sets the default from priv->hw->desc->rx_status

The default only works because it runs after priv->hwif_quirks(). That is
where stmmac_dwmac1_quirks() sets mac->desc for the GMAC and MAC100
cores, whose hwif table entries have .desc = NULL.

This holds in the current tree. All the desc ops tables define
.rx_status, and every hwif entry either sets .desc or uses
stmmac_dwmac1_quirks(). The Fixes: tag will send this toward stable
trees, though. Could the commit message mention the core refactor and
this ordering requirement?

The message also says:

  Keep the hardware checker running whenever the receiver is enabled.

Is that actually a change in behaviour? The removed
sun8i_dwmac_rx_ipc_enable() set EMAC_RX_DO_CRC on every stmmac_rx_ipc()
call. Those calls come from stmmac_hw_setup() and stmmac_set_features(),
including when RXCSUM is turned off, and nothing cleared the bit. Moving
it into sun8i_dwmac_set_mac() seems to leave the behaviour as it was.

>  	/* Set alternate descriptor size (which tells the hardware that
>  	 * descriptors are 8 32-bit words) when using extended descriptors
>  	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3%40gmail.com
