Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334212;
	b=n5c+tgf2LWm3X1NRa4hDMMszfAZ2jFLbloKqECKXpJCPg88h25vkcaxos6HJXi18Vf8m
	 opQtIG9EeLVDcEdUPpmNVxRpiw8Ev6xSBzj84znXNtgSeeI9p641+g5TsC3uCmyOIwIL8
	 R6vxXBm4MPZ+l4ZP8fOJhrlJ+M7D2/h4m2CT6qNzD9BSuS7o1SA2rytzrYO/CxQjUrdA0
	 cWwBFm1jG+JylvSDqMdwu8nMt64SzkMjSo4KpgoUveHeVo3rAzCeWMJ94Vz6KMM4VD29J
	 7v78BMlqXVFm0KmNXi293XJE5IydeCDiSGG7adUz9kFv2tz3OSbkIFidJEcDdMVjLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334212;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=48NwR66oWATlkGwRxtUnW7lJfKhnRbRUVaG3NPw5B6w=;
	b=12h3K6OMik3Vh2nQ4f3dniUAxpa03i9mTU4J9dJ01yFOaksDHN2u08GgG96S/YE62Nbx
	 5nruFu1Tg3oPqd4n3tUQ2l9XyKRiZIai3qsNKgKy8Sk5/RjmH55fihCBfjjzMs1niy5xK
	 Fqpj0uVvAZV9jutgT41s+CKMNVZUQFZuXjwhaYs/F3fKSk11KmNAWh43uFyuSj00Z3Ztg
	 LEdmke/d8/aN4ebesciFluImAlZvIWZ5L8H1cv9RcBTjDs62NWdnRUhJPK+eddXhvyKmY
	 LpSSCP7Bz2GJM0zKJqzz3ADKuzcduzxdYXFmKuQG5qOqUyyW7nqob4Yldfp0qU5wK4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Sf7csIt5;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDED606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 07:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Sf7csIt5
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87ED8C6223A;
	Sun, 22 Nov 2026 07:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF43860512;
	Sun, 22 Nov 2026 07:56:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C6AF11BC000E;
	Sun, 22 Nov 2026 08:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795334188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=48NwR66oWATlkGwRxtUnW7lJfKhnRbRUVaG3NPw5B6w=;
	b=Sf7csIt5NvVdKgckM/WCiS9vkzuDRHN6MTgDU0WksDvsD6pWWjJLuVPpfCas6Wty+LMrEs
	nzpga915s9GzQ/xNFlDjE0sGWaMi56FVYOAOK2PPY9VY7NzMxqk79CZj5AN31wfRdFR0UI
	t/CklDLUPi1tLU6P+qCPVWcAVWb39x3JR3tMQ0z8W4VO1KR7x+gTM5tkDZ51XxlPWXMupO
	nRI8KgIukTpYnyTe7fKvCoa12PX+uoMfZYUWMdwxE0sBVupbv6rNBAc3a9gC3SfFY/DErY
	D8rsd4i8NHuNEJZvlfpN2xgJGPgg13pYr8rKMQbW56zcBlLB3GWi9a7upkTniQ==
Message-ID: <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
Date: Sun, 22 Nov 2026 08:56:13 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz
 <nb@tipi-net.de>, stable@vger.kernel.org
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/21/26 05:43, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Russell King pointed out in [1] that max_mtu ignores the 11-bit buffer
> size of normal descriptors. dwmac-sun8i always uses them in chain mode,
> so a frame must fit one buffer, but max_mtu is SKB_MAX_HEAD() (3712 on
> arm64). Sashiko asked in [2] for this to go in as a fix.
> 
> On an H616 the RX DMA fills 2044 bytes of a buffer and
> ndesc_get_rx_status() drops a frame that spans two. On TX the MAC cuts
> a frame after 2048 bytes (TX_FRM_LEN_CTL is clear). At MTU 2033 no UDP
> datagram gets through in either direction.
> 
> Limit the MTU so that a frame with two VLAN tags and the FCS fits 2044
> bytes (MTU 2018). MTU 2019-2026, which worked without VLAN tags, is now
> refused.
The problem is real indeed, but not specific to this glue. Rather, the max_mtu
computation should be fixed for normal descriptors altogether. Can you work
on such a fix ? I'd be happy to test, I have a few devices with normal descs
lying around.

Thanks,

Maxime

> Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk [1]
> Link: https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com [2]
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Nicolai Buchwitz <nb@tipi-net.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi Zero2 (H616) on net/main with and without this
> patch (RX fill measured on v7.3.5). Claude (AI) helped write this patch;
> I reviewed and tested it.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..1f4fa722529f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/if_vlan.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mdio-mux.h>
> @@ -1208,6 +1209,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->mac_setup = sun8i_dwmac_setup;
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
> +	plat_dat->maxmtu = 2044 - ETH_HLEN - 2 * VLAN_HLEN - ETH_FCS_LEN;
>  
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> 
> ---
> base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
> change-id: 20261121-sun8i-emac-mtu-limit-66a936064965
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>

