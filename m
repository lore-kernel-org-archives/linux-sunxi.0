Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445519;
	b=MW1S4LrCmhXbcXKVH1mCXXs7SwmPMWTeYcSOw2BpkY62fwaz9OsnWLu2cucEqBi6gDat
	 xeH5F4tcVsEvkmBDMGv4MPE+X+A3AboLK36LI1DATt3HcTgLHqQDtavVU1PcR8WzymBB3
	 SWLXQkudZLVUiSrq+3B8x/8J0kex0rWX8+qt8KaHwNJIPmkcGIoKEhUs75RvC38KvXz2b
	 9RO6h+XrwfDB9z2CqZaEC1HEb4xmmLjMRcVNm4V/jip5gnGETdtR3q8LVFoXqugqbJmFx
	 f6IKKfrcgi6G3i1vfCuZWaQDOk22PPSelY5duElIA4fGNtrDLTprTGV9mYiM1SmgMew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445519;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OM5RiI5MPg9K/gV7t/uunDu6RnP3U/TYNj4L/SIdYKc=;
	b=ux5ua7gpWPjXFcvrDM9NOHcOIG8sDB7RRXnWcd/GzDYwcNz5D3kivhUS5AQ188PJa7EK
	 b1SqXPiobBgzb1mnDC6UP0oS5mq3yPIjkFWfSZVaBoY4YwJmJg7HTLACRVapNKOw8klss
	 cVxy5cmjo2zixsWW611hmbyOOZrbSrdf3Y/y+I9FyPKS4KsDegZg23vXlE363N4Al+WWH
	 F/mG464LAq6gIguvPb6+FZHV3WXdPtkR/+BfKBSjL98qpxpvW6Ot+apdPxpOygWkXinU/
	 sN9x1md1A1Ct8C9meMN5COKdf+5CldkZOAd9aTWd3lsvtHBIODxKHqsVRLG74fC9smQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAZVdFjD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649DC606A31E;
	Mon, 23 Nov 2026 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAZVdFjD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B739C1F000CA;
	Mon, 23 Nov 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445518;
	bh=OM5RiI5MPg9K/gV7t/uunDu6RnP3U/TYNj4L/SIdYKc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YAZVdFjDFEs0NzeNC9ZBFipCn50+OJD1FhfJDKJIG9+2Ye+6MuGT+5KOdWqzczomL
	 1vDrFJmuDqfKIM4Gihh3D7LyHgVFo5g3cwIzrwfsc6XD7VxKYi8AthMvCm+OvHVMaE
	 Y/tlkC8M5TpfIlLC3BoxgfdUQ20PB+5gFH5BmCxRCJhiyJ+7h2OacdXCsVX9jFzW4m
	 yijw7+N4MT0qDz5XVvjQtxr6wxytTWJ6agFqBBf5yikMZsadymw1KW2pH8Z/W6GwyJ
	 X7Ui+2IFY7ahw1ZYRShTIZRe1EHv7akMEnt2os4lmsF9e/BV/1SngxKXwJ6pK/UK1Z
	 V42Wjr7MN15Dg==
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
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
Date: Mon, 23 Nov 2026 14:51:57 +0000
Message-ID: <179544551726.3135.4955672049699501900@kernel.org>
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
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

- [Low] In drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c, the commit
  message for sun8i_dwmac_flow_ctrl() presents the change as a new…

--

net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately

This changes sun8i_dwmac_flow_ctrl() in dwmac-sun8i.c to test the FLOW_RX
and FLOW_TX bits on their own. Before, it only enabled
EMAC_RX_FLOW_CTL_EN and EMAC_TX_FLOW_CTL_EN when fc == FLOW_AUTO.

> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
>
> Allow enabling RX/TX flow control directions separately.

[Severity: Low]
Would this be better described as a fix than as a new capability?

Since commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific MAC
capabilities"), sun8i_dwmac_setup() advertises asymmetric pause to
phylink:

    mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
                     MAC_10 | MAC_100 | MAC_1000;

When pause resolves asymmetrically, stmmac_mac_link_up() passes a single
direction:

    if (rx_pause && tx_pause)
        flow_ctrl = FLOW_AUTO;
    else if (rx_pause && !tx_pause)
        flow_ctrl = FLOW_RX;
    else if (!rx_pause && tx_pause)
        flow_ctrl = FLOW_TX;

With the old fc == FLOW_AUTO test in sun8i_dwmac_flow_ctrl(), FLOW_RX or
FLOW_TX alone cleared both EMAC_RX_FLOW_CTL_EN and EMAC_TX_FLOW_CTL_EN.
Phylink and ethtool -a still reported pause as active.

There are two ways to reach the rx-only case:

- The link partner advertises only Asym_Pause, so linkmode_resolve_pause()
  gives rx_pause=1 and tx_pause=0.
- The admin runs "ethtool -A ethX autoneg off rx on tx off".

In that case the MAC ignores the partner's PAUSE frames.

Should the commit message say that this fixes that behaviour, and add a
tag like this one?

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")

That would let the stable maintainers consider it for backporting.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122144926.284857-1-maxime.chevallier%40bootlin.com
