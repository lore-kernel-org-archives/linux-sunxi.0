Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421637;
	b=qbFcT6UP8uqBqeO92WJ4Fln76OcQ0vmxuLLB8zhSlfeaTMEsCHJh/q43tZYEJywg9na9
	 JkHtErb7STHJUzLTCCsgj26oGgD8f4X/wG1Xirk9sv6+d6Vu8nTs0ovSslfHIkQCaJ5l4
	 +lvbQH9Sqq98y7W5QfB6cy6qwadP2HMzKxfCNHbRPGdByr0sJlY143sG0IFydZNeXsbBA
	 PgSCtzoknTlHdT7Elvew20Dv06B2yngf5vup9hD9vA8kppUJ1SW952FPQL6DGCxc03ZL6
	 WvS3vhgdSE4K9VcyNc4bsSBYVztQRIB6SvNafMSn7+95lImcLtdugrQYEnWI4wF8VCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421637;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Y1VdEYkOFsdjBJ4FhwL8M9gh2t6rskpg0TRoh1e25yA=;
	b=d9RulYzDx9RfHFZ64VXlmK3jzYu80HRmeHVxNwc2pTCaYgVaaoidY8GgKJfP0FvAYkiV
	 7GGCbcWbtJme7ji8rnyL9alowREq01cSNm1kuX2D/H4r9HqVBw8U5cJel5wmE5a3iQ9ld
	 BiJfa+js5Vjgx2NuLS35uqXIqbNIWp0DtROpLr7pqmmVJsFFwd7/3EokhhNnmrwrPlkGH
	 M68Gld2T/Uw5CH3JWGDqnm9YtI+B4c28DNP2tYS9lSpI4d13i0uk2GUtbSqcwhmcsXFY1
	 Hr9/Q0M4EcTqviVhJtiHd6nZhgv1kSHQMKYmFxIHg9RMrSc6SAV7lx1OajWBV849mtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZceTKAIe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CD606A31E;
	Mon, 23 Nov 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZceTKAIe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE48A1F000CF;
	Mon, 23 Nov 2026 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421636;
	bh=Y1VdEYkOFsdjBJ4FhwL8M9gh2t6rskpg0TRoh1e25yA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZceTKAIeBcgVkkVLqhcltRBe/mvkHF0yq1cHkYA7Xr6s5K7iBpNALqzO0V/e/o8LM
	 wjzPq6dsbfD7uPAeO8Oagu+bn6fXAGMdNvqwktcrmSgBu4FEF6YiOcv5xQl9JbHtFJ
	 TJJhOeIWLfbGfaVc9n7aa3cBpy2cAjXRcnGNiQFhY5lv54HP44bP+lleKXhxi4Ji9W
	 KpAIu7nevQdoaNeMmNS9UIZvQzkhgDuMeL6y5iLpFFgZHGXrnIGh8DT3m0eUr2GrQp
	 6/gitOqrTvz03EtIhV2yEIKHmg4ucWZEPawky2v/r9o+yzHm1SvC+04/PWSRCnhmm7
	 1aRX6IocvcFWQ==
Subject: Re: [PATCH net v4] net: stmmac: preserve RX checksum capability when
 offload is disabled
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 08:13:55 +0000
Message-ID: <179542163545.3135.9945110205092257108@kernel.org>
In-Reply-To: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
References: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When stmmac_set_features() fails to enable RX checksum on a
  running interface, it returns -EIO before applying the split-header…
- [Medium] Toggling RX checksum offload on a running interface still
  changes the IPC bit while the MAC receiver, the MTL RX FIFO and the RX…
- [Low] On a MAC that advertises RX COE but does not keep the IPC bit set
  (the case the original d2afb5bdffde3 check handled), the patch retries…

--

net: stmmac: preserve RX checksum capability when offload is disabled

This commit keeps stmmac_hw_setup() from throwing away the detected RX
checksum type when the IPC bit reads back clear after a disable. The
requested state is now passed straight to the rx_ipc callbacks. After a
failed enable, a new rx_csum_failed flag masks RXCSUM in feature
negotiation until the next MAC reset, and open and resume now reconcile
features before RX starts.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..739c6aca447ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
>  	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
>  }
>  
> +static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
> +{
> +	int ret;
> +
> +	if (!rx_csum) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		stmmac_rx_ipc(priv, priv->hw, false);
> +		return 0;
> +	}
> +
> +	ret = stmmac_rx_ipc(priv, priv->hw, true);
> +	if (ret <= 0) {
> +		WRITE_ONCE(priv->hw->rx_csum, 0);
> +		priv->rx_csum_failed = true;
> +		return ret ?: -EIO;
> +	}
> +
> +	WRITE_ONCE(priv->hw->rx_csum, rx_csum);

[Severity: Medium]
The commit message says:

  Check the result of an enable before allowing RX to mark packets
  CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
  running interface.

When stmmac_set_features() calls this on a live interface, is RX still
running? The IPC bit changes while the MAC receiver, the MTL RX FIFO, the
RX DMA ring and NAPI all keep going.

Frames already in the RX ring or FIFO were received with IPC off. If NAPI
handles them after the WRITE_ONCE() above, could they be marked
CHECKSUM_UNNECESSARY even though the engine never checked them?

The descriptor status does not seem to show whether the engine ran:

- dwmac4_wrback_get_rx_status() sets csum_none only for
  RDES1_IP_HDR_ERROR or RDES1_IP_PAYLOAD_ERROR.
- RDES1_IP_CSUM_BYPASSED only increments a counter.
- enh_desc_coe_rdes0() decodes status 0x4 as good_frame.

stmmac_rx() and stmmac_dispatch_skb_zc() then do:

	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
	    (status & csum_none))
		skb_checksum_none_assert(skb);
	else
		skb->ip_summed = CHECKSUM_UNNECESSARY;

The disable path has the same problem in the other direction.
stmmac_rx() reads coe once per poll:

	int coe = READ_ONCE(priv->hw->rx_csum);

A poll already running on another CPU keeps the old non-zero coe for its
whole budget. Frames the MAC receives after IPC is cleared could then also
be marked CHECKSUM_UNNECESSARY.

On TYPE1 COE cores, would frames that straddle the toggle also get a
length that is off by 2 bytes? stmmac_get_rx_frame_len() strips the
appended checksum bytes based on the sampled coe, not on the IPC state
the frame was received under.

The readback shows the checker is on from this point on, but not that
frames already queued were checked. Would RX need to be quiesced around
the IPC change to close the window, for example by stopping RX DMA and
NAPI and draining or reinitialising the ring before publishing rx_csum?

> +	return 0;
> +}
> +
> +/* Recheck the wanted features if this reset clears or uncovers a failure. */
> +static bool stmmac_init_rx_csum(struct net_device *dev)
> +{
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +	bool was_failed = priv->rx_csum_failed;
> +	unsigned int rx_csum;
> +
> +	priv->rx_csum_failed = false;
> +	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
> +	if (stmmac_set_rx_csum(priv, rx_csum))
> +		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
> +
> +	return was_failed || priv->rx_csum_failed;
> +}

[ ... ]

> @@ -4216,6 +4244,12 @@ static int __stmmac_open(struct net_device *dev,
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
>  		return ret;
>  	}
> +	if (stmmac_init_rx_csum(dev)) {
> +		netdev_update_features(dev);
> +		if (priv->rx_csum_failed)
> +			netdev_update_features(dev);
> +	}
> +	stmmac_hw_start(dev);

[Severity: Low]
Some MACs report RX COE but do not keep the IPC bit set, which is the
case d2afb5bdffde3 handled. On those MACs, does this retry the enable on
every open and resume, and fail each time?

On the first open, stmmac_init_rx_csum() fails, sets rx_csum_failed and
warns. netdev_update_features() then masks RXCSUM out of dev->features.

On the next ifdown/ifup, or on resume, the sequence looks like this:

__stmmac_open()
  stmmac_init_rx_csum()
    was_failed = true
    priv->rx_csum_failed = false
    stmmac_set_rx_csum(priv, 0)   succeeds, RXCSUM not in dev->features
    returns true
  netdev_update_features()
    stmmac_fix_features()         no longer masks RXCSUM
    stmmac_set_features()
      stmmac_set_rx_csum(priv, rx_coe)
        rx_ipc(true) reads back 0, returns -EIO
    __netdev_update_features()
      netdev_err "set_features() failed (-5); wanted ..., left ..."
      returns -1, so netdev_features_change() sends NETDEV_FEAT_CHANGE
  netdev_update_features()        masks RXCSUM again

stmmac_resume() follows the same path.

Before this patch, the capability was cleared once with a single
netdev_warn(). With this patch, every ifup and every resume would log a
netdev_err() from the core and send an extra NETDEV_FEAT_CHANGE
notification. Is that intended?

The commit message says "a reset can restore offload if it is still
wanted", but it does not mention this behavior on hardware where the
enable always fails.

[ ... ]

> @@ -6400,18 +6434,18 @@ static int stmmac_set_features(struct net_device *netdev,
>  			       netdev_features_t features)
>  {
>  	struct stmmac_priv *priv = netdev_priv(netdev);
> +	bool running = netif_running(netdev);
> +	unsigned int rx_csum;
> +	int ret;
>  
[ ... ]
> +	rx_csum = features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
> +	if (running && rx_csum != priv->hw->rx_csum) {
> +		ret = stmmac_set_rx_csum(priv, rx_csum);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
If stmmac_set_rx_csum() fails here on a running interface, the early
return skips the split header update and the hw_vlan_en and
stmmac_set_hw_vlan_mode() changes requested in the same call. Open and
resume run a second netdev_update_features() to recover, but is there
anything like that on this path?

For example:

1. The interface is opened with RXCSUM off, so rx_csum_failed stays
   false.
2. An admin runs "ethtool -K eth0 rx on rxvlan off".
3. stmmac_fix_features() does not mask RXCSUM. stmmac_set_rx_csum() fails,
   sets rx_csum_failed and returns -EIO before hw_vlan_en is updated.
4. __netdev_update_features() logs the error and leaves dev->features
   unchanged. VLAN stripping stays on in hardware and in dev->features,
   while wanted_features asks for it to be off.
5. Repeating "ethtool -K eth0 rxvlan off" over netlink does nothing,
   because ethnl_set_features() only calls __netdev_update_features() when
   the requested wanted bitmap differs from the old one.

The VLAN change stays pending until an unrelated netdev_update_features()
call, a reopen or a resume.

The v3 changelog says "Keep a failed enable from blocking unrelated
feature changes", but that seems to cover only open and resume.

Should this path also run feature negotiation again, or apply the
remaining changes before it returns the error?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d%40gmail.com
