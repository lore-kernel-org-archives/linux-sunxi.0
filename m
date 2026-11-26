Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688457;
	b=m3xeCAzhqLPjI/ODlxCkzbsMBS5Rs08BVVMExVds2Fc2UQQMKef5uno4ZDPco41gDTGp
	 dQAidFB76UzXWwkGzKC0QWOeZ5qCjz1GC6P/qwjeUtEanJbNAaXhNRpoTxCvP8X0zNEQv
	 vkZApAtKgzLVqJdh1B1kgvg/0YFGWAgWwRB+y8pCM7Bne8GUZFkw6SvUCHD24161zr2Rv
	 7GrN2KLuT2qd6bEe8E0qfV5ax15HRRq8CkQOQtAtLvJrUkgu12dV8nRhCTDnXQO0voXQi
	 Rf/42x13If2+L+wVmkX0LFm5P6oKRa9VM5JYRz3yKmuz1RB8oKmgdRDCdq+I0e4rfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688457;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=YB3wzJxxHDHi23P+//gC1AV+iO0J/fjZ+eovqPNBwYA=;
	b=rKFkh0zs34Bzlkud1BQczna3RDufX47PkchmWus24LbfPOaUlW0D/4YFj9sdwMx6x4z/
	 /pBqkieacubxMFo8is3HpByNe0PK2pq35k/3oGYHpZv9x2V21X0OQbq2tCP5/7xO2vcDQ
	 s/vUkydsafnaZtu/IE4VaP6v3hySV5BGJPYeVd3SFKYOckpqTeHVEDW0RJduS9xp7eTej
	 YUWQX9qXtmdq6Y84Wa28E+7NefipS63qJ3z6hR8bVAlAwaG8XNVGMyvy2fFOr9AidxIq4
	 22uWrF0G7t+OL9Xge0AGvO6HfdxivPpiIMHXStRvA8RxEVsgbcralnw2CeheQ6PgUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pmVcnvAd;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47169606A326
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 10:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47169606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pmVcnvAd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9DDC7C2B9C6;
	Thu, 26 Nov 2026 10:21:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A82760237;
	Thu, 26 Nov 2026 10:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B438211E68598;
	Thu, 26 Nov 2026 11:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795688454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YB3wzJxxHDHi23P+//gC1AV+iO0J/fjZ+eovqPNBwYA=;
	b=pmVcnvAdBlby3lhBVtVzuDtEQLF1hCM4Aizt/91F8Yjpmr8T+0TgMHD0rCk/d6cJS/wkUo
	oJtNkt3fpNUAb/E6WwJYBykOwgQUwUpogW46AxsssrZ5hDAv8CT9HNH0730k8SiybPLmdH
	0PbOd9YnzbknCGGvZX3m4kbbL1s3vJXEmlWkrPWLksq4AzKdEjo+N7NEwR3N/Y1WHaSmxx
	6XxIY5ikUIgYDU/pTZ7e8i/eZTZ701r34zw6/7ROZnXo0hqrr4VHkP7A9wKsF3dpTERtg+
	8M/1mDxKn2whFEZywyT7XJitLgSiQzeyAMoRCC4XZx1jV+kilYOgCl9i0ZveSA==
Message-ID: <652a5de2-4c63-4e0a-9af0-f968cae730fd@bootlin.com>
Date: Thu, 26 Nov 2026 11:20:47 +0100
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
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Drop received MAC control
 frames
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/26/26 10:56, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> sun8i_dwmac_set_filter() sets CTL_FRM_FILTER to "receive all control
> frames", so every PAUSE frame reaches the stack and is counted in
> rx_dropped. Leave it at 0, "drop", as the Allwinner BSP does; the MAC
> still obeys PAUSE.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This shouldn't go to net, this is fairly harmless.

> ---
> Tested on an Orange Pi Zero2 (H616), net/main, MAC loopback: TX still
> waits 32.6 ms per PAUSE; rx_dropped per 20 PAUSE frames 20 -> 0.
> Claude (AI) helped find the cause and write the patch; I reviewed and
> tested it.

How ? For me on H2+, mac-loopback with Pause didn't work without this series:

https://lore.kernel.org/r/20261122144926.284857-1-maxime.chevallier@bootlin.com

What does the "ethtool -t" flow control selftest report with this new patch ?

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..f669bf22b7dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -192,7 +192,6 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in EMAC_RX_FRM_FLT */
>  #define EMAC_FRM_FLT_RXALL              BIT(0)
> -#define EMAC_FRM_FLT_CTL                BIT(13)
>  #define EMAC_FRM_FLT_MULTICAST          BIT(16)
>  
>  /* Used in RX_CTL1*/
> @@ -720,7 +719,7 @@ static void sun8i_dwmac_set_filter(struct mac_device_info *hw,
>  	struct netdev_hw_addr *ha;
>  	int macaddrs = netdev_uc_count(dev) + netdev_mc_count(dev) + 1;
>  
> -	v = EMAC_FRM_FLT_CTL;
> +	v = 0;
>  
>  	if (dev->flags & IFF_PROMISC) {
>  		v = EMAC_FRM_FLT_RXALL;
> 
> ---
> base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
> change-id: 20261122-sun8i-emac-ctl-frames-186c03e03399
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>

