Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627366;
	b=4LG3anj/l1jduH1OE2xErwV3JcNuIojqzRV9QZyuLdrsHNlIsXtpD2V+VedNnm/ewek/
	 PDR+Fp9te5GYD8KEXeS0bv+j+4UVQftQKS4Dr1khN0+hdOK7tokcC3xhX2vCi3RZi+Wwg
	 /ppDMs7efPbfsFbyyOUJk2OFKyl3qT/W2BZfo+JT0ynBWIfhidVxXvFJD3KZKdyhLL9k7
	 quZsTF4zk1XSI5dxwbXBfPMyH+PmqqY3eWxf7eziL7OTV5AGqCEma0FZvZG5Cj/o8CvT2
	 3KKT4r8t89eYop9Gj1RvRivUK2ArA3Btgwo9EEJogO6lkReqHz333oW61utb4WR+vkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mLfPElIyPXz6zxiRqYU60ghHw+KmsGu8Z+q9oThTr0g=;
	b=IeePgYMqrLsqzOZqE3nOo27hBM/WGgNgD4vlPkJ4ySektPCFPaNblsZ00yITtKimIJpm
	 9hDkZ9cWlYbzB/op7Pohp+d6mwQwdEUYfEKtylbU6oZP7wRrTalpu4uxWQv4HzR+rodxK
	 tml26hrtVEzOsYjfvv1lc3Xf3+mM+yND01jmKwtNCDjaRRSLRd+LFFBrhIGK7vff2WAHC
	 Ps/mUy9LlyEwA+QTbOBBkEkNqLdrFtH4kBZeCvgo5tGO2/7RRTA5BNzOH60+s5XX0oMPt
	 hi281YgdHDqWU97cj7G9nZbYbo+dL0jDQNLu0HCORw+tZsQoj5cgT2n8Aye7VnNH65w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J1hFBGGV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74122606A31E
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 17:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J1hFBGGV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00261F000D2;
	Wed, 25 Nov 2026 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795627365;
	bh=mLfPElIyPXz6zxiRqYU60ghHw+KmsGu8Z+q9oThTr0g=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=J1hFBGGVqTmabRzkDeGr5FFQ5a1AfyxtJX4CCE9uDS76cvSe+OzwqFK/bnRBnzWEi
	 gD+PWvoDLxMar/4VIZJ9MHwA9eiP7Lzhp4IrebkMIwqE8rAqv+xT8fy3/+47cTuFfn
	 yNmORa7aPEwI4YJqYhGIQNLI1Sy5DTUww8j8rsrAqSL9BW3pLhaGg+IbQ5yFhDvHl6
	 cI/+9W+hyOhT0OBouvMdgPYJ1ta4gWyBDSDLUqHTzkwF+MiJdaM1Cq3+zY112sSao0
	 kdLtIebwhFKNzN9EfUXzbLqwo5RRELhUy+wKg6KQeqLLxNCE/4jVcZ1fiewyNz0vgl
	 4TkW5YFg5qqWA==
Message-ID: <sashiko-outbox-233833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: allwinner: Use devm_clk_get_enabled() in
 emac_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-sunxi@lists.linux.dev
In-Reply-To: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
References: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:22:45 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] net: sun4i-emac: use-after-free in emac_remove() [1]
--

commit c91169d2a4aeb95968164b2a476fe9e5315cf021
Author: Markus Elfring <elfring@users.sourceforge.net>

net: allwinner: Use devm_clk_get_enabled() in emac_probe()

This commit replaces devm_clk_get() and clk_prepare_enable() with
devm_clk_get_enabled() in emac_probe() and drops the explicit
clk_disable_unprepare() calls from the error path and emac_remove().

> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index d7ee42b2c1976..c075356cf6ccd 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
[ ... ]
> @@ -1093,7 +1085,6 @@ static void emac_remove(struct platform_device *pde=
v)
>  	unregister_netdev(ndev);
>  	of_node_put(db->phy_node);
>  	sunxi_sram_release(&pdev->dev);
> -	clk_disable_unprepare(db->clk);
>  	irq_dispose_mapping(ndev->irq);
>  	iounmap(db->membase);
>  	free_netdev(ndev);

[Severity: Critical]
This problem wasn't introduced by this patch, but can releasing
db->rx_chan before unregister_netdev() in emac_remove() cause a
use-after-free [1]?

drivers/net/ethernet/allwinner/sun4i-emac.c:emac_remove() {
	...
	if (db->rx_chan) {
		dmaengine_terminate_all(db->rx_chan);
		dma_release_channel(db->rx_chan);
	}

	unregister_netdev(ndev);
	...
}

Until unregister_netdev() shuts down the interface, an incoming packet can
still trigger an RX interrupt and submit DMA on the freed db->rx_chan:

CPU0                              CPU1
emac_remove()
  dma_release_channel(db->rx_chan)
                                  emac_interrupt()
                                    emac_rx()
                                      emac_dma_inblk_32bit()
                                        dmaengine_prep_slave_single(db->rx_=
chan, ...)
                                          <-- use-after-free
  unregister_netdev(ndev)

[1] https://sashiko.dev/#/bug/linux-bb13c48b-2561-4c90-be1e-ab97f0255c59

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/780975ed-825f-4f9b-=
8ac2-67664a7a2a2f@web.de?part=3D1
