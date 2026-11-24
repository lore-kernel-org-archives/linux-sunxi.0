Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547245;
	b=h8ggtq0tJemysG8waQuYzKA/WB4RVrI0JWGlK/rgCy+u7o/tJjjHxu9kytjqlWicWqUM
	 K8BXfj/RhJ8iZ8o7vNSZ5Zvp4Nq4VDxwlSRRIR6XD5ERWGChKEg4a8sXZxUKvQ8pTn7rb
	 XE7Knk/T/DsKls3/8uapZvCxUCpUqexbXJ9gMHrG+TZ6ZkCPnNTBFEzInwf8S5JaAiMV2
	 Rk9MOWx+XRV1AfYmfTZqZAO27+OUEbgL+6TTgbGKbw66po0xi1BGgX81Pq2zs+SvoJ3RA
	 vpZcQXtiuEP4DTweKLZC9PeGvlY4N4tmm7XOOGKxIBJeOws3KZV/cx+O+zkj538XtkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547245;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DgGrkzJmFZWQtPibLYb2wzpNsiS5IONW5wJ5P8ZexXg=;
	b=SUR9Wp9yjvmvVLlsft6tSRRSnt0lSgZEhMMRYK+Frxfnx2mprY/YuPl032shM2qRTTlc
	 MAxtCfPcGrSPlxok1ICE17y7iaGwZqMCViivuUckJggiaVOIB6isSybG6vJN4iJVkkb6m
	 EXa23mm4O9eAbutsvDaKqAelopv8DWH3HZnio5wuS75lKQtJATY87cEzaUvB/CuEJoMS5
	 ppVH4zpDvF5IVub77isZ0e0Gw6XRMuj4cmRGDEqkOsHqMZ+kz+zHPWs8MdcpH5+57Qe3/
	 EXv4b9V+3Pta5T8j0xeTWDFvpKHJrHp9zN79p2dgj/nytSCn4KP4XykP35TrFfdC8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PQYQDj/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB70606A31E;
	Tue, 24 Nov 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQYQDj/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC441F000C4;
	Tue, 24 Nov 2026 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547244;
	bh=DgGrkzJmFZWQtPibLYb2wzpNsiS5IONW5wJ5P8ZexXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PQYQDj/+4pQgYpzPl6xOnSmGkgNxV/ryCOcW3JEXxVs5ZN3SHvDylHc2wwiJoN8Hv
	 F8D+SFd0uaLbceiilkOyWJestNHyUE/dZWwWmKWNM4H5/QSvlSblwHps021N4vFUIg
	 2pyOk1/C5NTYJn/bNjK2MGgsCrEVI1xgoTsDgEKqwiTgTGLuk631LED18sAJpXYnzW
	 SO3C1zHYQu5jtXgCdPd/WZ2JGRksHn1SAWmj1vuiPUpLzOxlN7Jv3rcHENQYVLC3EB
	 Mt60YFutqCZDXGjfHqDfKK9VezTnOE2gFuDzSPBxEusXsaigCyewh9ASX4evMj2Y6i
	 56wEP0wJP89nA==
Subject: Re: [PATCH net v3] net: stmmac: preserve RX checksum capability when
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
Date: Tue, 24 Nov 2026 19:07:22 +0000
Message-ID: <179554724297.3135.12604093728631257002@kernel.org>
In-Reply-To: <20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com>
References: <20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com>
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

- [Medium] When RXCSUM is wanted but the MAC never accepts the IPC
  enable, the reset-time reconcile goes through ndo_set_features.
- [Medium] Toggling RX checksum offload on a running interface
  (stmmac_set_features() -> stmmac_set_rx_csum()) flips the MAC IPC bit…
- [Low] The patch changes the stmmac_ops::rx_ipc contract in hwif.h to
  "Configure RX checksum offload and return whether the checker is…

--

net: stmmac: preserve RX checksum capability when offload is disabled

This patch keeps the detected RX COE type when the IPC bit reads back as
clear, and adds an enable argument to the rx_ipc callback. If an enable
fails, it masks NETIF_F_RXCSUM in feature negotiation until the next MAC
reset. It also splits stmmac_hw_setup() so open and resume can reconcile
RX checksum features before RX is started.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..d7dd6c5d95d47 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -699,7 +699,7 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
>  }
>  
>  /* caution this function must return non 0 to work */
> -static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
> +static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw, bool enable)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 v;

[Severity: Low]

The new rx_ipc comment in hwif.h says the callback should "Configure RX
checksum offload and return whether the checker is enabled". The body
here still ignores the new enable argument:

sun8i_dwmac_rx_ipc_enable() {
	...
	v = readl(ioaddr + EMAC_RX_CTL0);
	v |= EMAC_RX_DO_CRC;
	writel(v, ioaddr + EMAC_RX_CTL0);

	return 1;
}

On sun8i, running ethtool -K rx off on a running interface goes through:

stmmac_set_features()
  stmmac_set_rx_csum(priv, 0)
    stmmac_rx_ipc(priv, priv->hw, false)
      sun8i_dwmac_rx_ipc_enable(hw, false)

That call sets EMAC_RX_DO_CRC and reports the checker as enabled. The RX
path won't mark packets verified, because hw->rx_csum is 0. However, the
hardware checker stays on.

Should this clear EMAC_RX_DO_CRC when enable is false, so the requested
setting actually reaches this MAC as the commit message describes? The
notes below the --- defer the sun8i changes to a separate net-next series,
and that series isn't in this tree.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..88abac5afa0a3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3727,25 +3727,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
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
> +	return 0;
> +}

[Severity: Medium]

Does this fully handle the running interface case? stmmac_set_features()
calls this under RTNL only, while RX DMA and NAPI keep running. Nothing
quiesces or drains the RX ring around the IPC toggle.

On enable, once the readback succeeds and rx_csum is published, the next
stmmac_rx() poll takes a single snapshot:

	int coe = READ_ONCE(priv->hw->rx_csum);

That snapshot is then applied to descriptors that were written back
while IPC was still off. Those descriptors don't carry csum_none. For
example, dwmac4_wrback_get_rx_status() only sets csum_none on
RDES1_IP_HDR_ERROR or RDES1_IP_PAYLOAD_ERROR. RDES1_IP_CSUM_BYPASSED
only increments a counter. So stmmac_rx() reaches:

		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
		    (status & csum_none))
			skb_checksum_none_assert(skb);
		else
			skb->ip_summed = CHECKSUM_UNNECESSARY;

Can this mark frames that the checker never examined as
CHECKSUM_UNNECESSARY?

On disable, a poll that already cached a non-zero coe keeps marking
frames as verified after IPC is cleared, up to the NAPI budget.
stmmac_dispatch_skb_zc() has the same per-call snapshot.

On Type-1 COE cores, enh_desc_get_rx_frame_len() subtracts 2 bytes based
on the current software coe, not on the IPC state when the frame
arrived. stmmac_rx_buf1_len() and stmmac_rx_buf2_len() also re-read
rx_csum for each descriptor. Could frames in flight across a toggle end
up with lengths that are off by 2 bytes?

The commit message says:

  Check the result of an enable before allowing RX to mark packets
  CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
  running interface.

A similar window existed before this patch. It was wider, because
rx_csum was published before IPC was written. The patch only orders the
register write against the flag update.

Would RX or NAPI need to be quiesced around the toggle for the statement
above to hold?

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

[Severity: Medium]

What happens on later resets if the MAC never accepts the IPC enable
while NETIF_F_RXCSUM stays in wanted_features?

On the first open:

__stmmac_open()
  stmmac_init_rx_csum()
    stmmac_set_rx_csum(priv, rx_coe) fails, rx_csum_failed = true
  netdev_update_features()
    stmmac_fix_features() masks NETIF_F_RXCSUM out of dev->features

On the next open, MTU reopen or resume:

__stmmac_open() or stmmac_resume()
  stmmac_init_rx_csum()
    rx_csum_failed = false
    rx_csum is taken from dev->features, which no longer has RXCSUM
    stmmac_set_rx_csum(priv, 0) succeeds
    returns true because was_failed was set
  netdev_update_features()
    stmmac_fix_features() no longer masks NETIF_F_RXCSUM
    stmmac_set_features() with RXCSUM on, netif_running() is true
      stmmac_set_rx_csum(priv, rx_coe) fails again, returns -EIO
    __netdev_update_features() logs "set_features() failed (-5) ..."
    and returns -1, so netdev_features_change() fires

netif_running() is true here because __LINK_STATE_START is set before
ndo_open, and stmmac_resume() only gets this far when the interface is
running.

Is it intended that every later open, MTU reopen and resume prints this
core netdev_err and sends a NETDEV_FEAT_CHANGE notification? The
driver's own "RX IPC Checksum Offload disabled" warning is not printed
again on those resets.

There is a related problem in stmmac_set_features() when a live enable
fails:

	if (running && rx_csum != priv->hw->rx_csum) {
		ret = stmmac_set_rx_csum(priv, rx_csum);
		if (ret)
			return ret;
	}

This returns before hw_vlan_en is updated and before
stmmac_set_hw_vlan_mode() is called, so the core rejects the whole
request. With a command like "ethtool -K eth0 rx on rxvlan off", is the
VLAN stripping change dropped for that request?

The commit message says:

  This leaves unrelated changes, such as VLAN stripping, available even
  when RXCSUM is still requested.

The v3 notes also say "Keep a failed enable from blocking unrelated
feature changes". That only seems to hold for later requests, not for
the request in which the enable fails.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380%40gmail.com
