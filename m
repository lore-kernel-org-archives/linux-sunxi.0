Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381065;
	b=ckLtjhfZWfy1PBBNm2BRjON8QZnRhH59JYdsHu2PGLqxH6exZv3FuHCu3615n9ix38hC
	 jHyRs7/It4pRYg4S7mh+Gm3QCt9bBHU/ELLVcd5IhqQY6gkYnKDDlCE7+VlKlkvblMY8g
	 dl3g87lwYPTKLYbvbPxXVjpuGVQJA5hZ6ds3mkTRXejbDD2YbBhrl63kTCdA8SL5Rqsmv
	 BaclvSi+BI8DVG6RwKS+QrRSKfdAhszAGIvlYjIP5/FdCGnELt+Qa6rN+xuID8cmXI68g
	 5fCPVcmM1eYtlmaYYVHHzVq9gAuAhi4tWQ6xB+d5J6YACQAa1spfwyqpEVxjkT1WuiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381065;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=iDERK68xOldbgeUiiGYyw/w8twcI1O8oq6PXPbGFfdU=;
	b=y4WjCJotxiPzeOPDbZKO86B3SjnoeQMYFq6LuNgqwhIfDPXV76R4svc6TcbVktCr6MFe
	 Np4hRz7MLTMRr4OVHLFZAOpd5LTMB2qx4qXDvAGjV1mjoYpczRbvOIYtQskD56rR4vOlv
	 i7d48ramjQ39sH6sNy8k4LdrZxP2xTwx4P+c19VZ8ALU4DWMPRFO6UXgijQxmWhcfqis/
	 wENsXo68WNWk3zu/XB8JupVSZ+TLkRJHZtCdhMxVC88RyNa21UP6+33iQ3T3eNLvkJSkt
	 7Ohgcejt1Y6A2uwaTRX+O+26ZMcGtsFz5aS0ysEshWLQGLT/fsqHVWS5s17ZstyW88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bFKN3hQc;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C9606A31A;
	Sun, 22 Nov 2026 20:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bFKN3hQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iDERK68xOldbgeUiiGYyw/w8twcI1O8oq6PXPbGFfdU=; b=bF
	KN3hQc8rftOmJOB85CjYZtIUwFRh3FHC98U/Jxsa5dG0F7/Q+MlsyaPWa6ziHHenmf2Xrj2E0WgEq
	96ZmT9hIRl02+gh9IlaBgc6fG3CbNLOmyIHE7AhAIxGXG5T7dryZsIVsCAnsCt2JyeJxKxTa7CMy1
	rHTAMPX0T/xRf2M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVEcy-000cTP-42; Sun, 22 Nov 2026 21:57:36 +0100
Date: Sun, 22 Nov 2026 21:57:36 +0100
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
Message-ID: <97515dd2-72b1-4275-910f-94336f8f18a4@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
 <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
 <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>

On Sun, Nov 22, 2026 at 01:05:48PM -0700, James Hilliard wrote:
> On Sun, Nov 22, 2026 at 11:39 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
> > >  {
> > > +     struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
> > >       u32 v;
> > >
> > > -     v = readl(ioaddr + EMAC_RX_CTL1);
> > > -     v |= EMAC_RX_DMA_START;
> > > -     v |= EMAC_RX_DMA_EN;
> > > -     writel(v, ioaddr + EMAC_RX_CTL1);
> > > +     guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> > > +     v = readl(priv->ioaddr + EMAC_RX_CTL1);
> > > +     writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
> >
> > Netdev does not like these magical guard constructs. scoped_guard is
> > acceptable, but good old fashioned lock/unlock is preferred.
> >
> > It is also unclear why this now needs locks, when before it did not.
> 
> I added the lock because changing rx-all adds a new writer to RX_CTL1
> while the interface is up. The runt-forwarding bit shares that register
> with the RX DMA enable bit. If ethtool read the register just before
> another CPU stopped RX DMA, writing it back with runt forwarding
> enabled could also turn DMA back on.
> 
> I went back through the callers to see whether that can actually
> happen. RTNL serializes the ethtool change with opening and closing the
> interface, resetting it, and reconfiguring RX queues. Neither the sun8i
> IRQ handler nor its TX completion path requests a DMA threshold change.
> System suspend does stop RX DMA outside RTNL, but userspace is frozen
> before the driver reaches that point on the normal sun8i suspend path.
> 
> So although the register is shared, I couldn't find a path where the
> new writer races an existing one. I think we can drop the lock and
> leave the existing DMA callbacks alone.

And this is where, small changes, with good commit messages helps
you. In order to write the commit message for a small patch adding a
new lock, you would of done this investigation in order to write the
commit message, answering the question "Why?"

I don't say this just for reviewers benefit. It also helps you get
your code correct.

     Andrew
