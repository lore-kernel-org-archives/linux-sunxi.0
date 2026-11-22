Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372743;
	b=JPOXU4gXLml/4PtnsQMo8pLQboqXs05iKLclmQ8R/v9K9Ud8FfupjR+P6sB+dsjpp+zD
	 BZaoVSPTasAhhfMrWduzpU8tvQhHFEz4TwWQOy2mFUrETzI6TSKINJlig25fKAXd5GOeP
	 5JfrZ9vKXBeJSjRll0dx8nxUAuzz7/WD6JpSQKfi1VlIqcsWFfF/aGOc7hXOiYfBZlocY
	 WpeRsPx1L+pslzOVq7TzfqJzAOBZP4zsWeAfBYn85DA3YSJIm+PtuBUP43e1nfmu5oVE2
	 eKucpYbF6cLqroFrZpLAzX0aTQGn9X25Yb3zQLOcjluWtH7Ok03Gi3zbhJRt5remcog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372743;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lAtDglAyGhv+VlnVH8lG4/rJZAFJRFJmGCz7AGksEO8=;
	b=t3J9c0XzjVbcbhj2Xpp/k6YXBoqktkgeDIHcIj7eG0gpXnSMA0G7/VB2TQ+459l9yp+a
	 3+B6HX1t34L6YlPapLPFmHHsTPbWwjh/7el1Ns30acMWhIXVt78UTU4T5DLTveWbjEJNg
	 d5hnJyRhr/mxaqb73pYcw8EBeaWJ68/zULoP8TG1pZ/qWZ2FbGv2FZ1TCSmk+ZJACGyxA
	 0dC+GmMlmDfIA0SXF/w7JwO1yFq5fFUfqxqlqO7VsR4VCQNlkzvb19/3T6hI7FaqpErKD
	 rja5stsFEqia80Dj0ADfTZuoNdpMZ/D4BjomFQigSfC8FE2ji09fjfDvLw+wUihWwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="apS/MljX";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6DA606A320;
	Sun, 22 Nov 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E6DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=apS/MljX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lAtDglAyGhv+VlnVH8lG4/rJZAFJRFJmGCz7AGksEO8=; b=apS/MljXunN4YkuWtEK6bNo4wX
	N5yhZYG4GXmfiJnlx/L2HsgUg73eqsMBWvOJ5/8iCw52H4lroAM5b7z9sTR8+S+b9yY6qbJvij+uD
	/nGHDRbWh9GHsTBiXrF2xlyJHpPzZKdicP907fVrN2IxDB58ozMzr4mI2wa8R27UvTck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCSn-000bPx-Kt; Sun, 22 Nov 2026 19:38:57 +0100
Date: Sun, 22 Nov 2026 19:38:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
Message-ID: <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>

> +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
>  {
> +	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  	u32 v;
>  
> -	v = readl(ioaddr + EMAC_RX_CTL1);
> -	v |= EMAC_RX_DMA_START;
> -	v |= EMAC_RX_DMA_EN;
> -	writel(v, ioaddr + EMAC_RX_CTL1);
> +	guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> +	v = readl(priv->ioaddr + EMAC_RX_CTL1);
> +	writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);

Netdev does not like these magical guard constructs. scoped_guard is
acceptable, but good old fashioned lock/unlock is preferred.

It is also unclear why this now needs locks, when before it did not.

This patch is too big, does too many things. Please break it up into
smaller changes, with good commit messages, which are obviously
correct.

	Andrew
