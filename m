Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476598;
	b=ZKubqvxmeIAvv/Ga/+EyBHSMbkR0lKEgXnSutCchMGy0S0wF1Oys4JKsb4GXwibiZ24T
	 WTXDbFtzefv/S4+UplVWkZOSOmx5uUPOZGV7gIYs1JcR/h6WufOjLyQdYUQJeQFc+zHWv
	 tj0z4K6O9AGt66vTMQgRU+dNO3m8e6RolQQHhXgwLsAOraCbAJocjcP6GcxOQ4g9vcBTr
	 2nW4SV5f8Nrj2TjIz1Xz8nX6WO14Ibyf6mngY+ar6xD4l8FlGtldP894N8/ZCYqjRgD4M
	 s1IQEQsnwVMhhavQNQgJN+NMzUHpt+KrmRzON/slrfKesYr0f0G6BpkwM9/wBvApIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476598;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=HoRCw77ZwoLoLapCSKXoJHWwYpZwKjiCThC98/UXUv0=;
	b=GHuk6bBBdKnPxsq8y45FrgAG3zA/zHgwcp0hvGNgay4HuYNxt+RHyq3CiLj8zAiG0mYJ
	 vP/v71hqOIO82M2QD9PbyfPa6iSxsDBiAAIwVY3/UTxnoV1sGXrNgwd0LV+FqRZBwNNOM
	 uY4bxWy8BhRv9Qo0LisC9aiZehbBR+P/OTzRYAu8nsGdifG8LDdG7qmpPJYQ/8M3MDIOZ
	 cin+N8QkK/zW8h41sVgTCdJtXi346ihBzw2sVurDbeio78GEUIOf0hYguHcr25YmgnzZQ
	 oxCpRRnmpx3eSfAOzfSL8KcFUCe5qC1mDTfK/YP81TORQnSwfiw6K9E5gedG/rCxijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=YD5jokag;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BC606A33B
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 09:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24BC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=YD5jokag
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A19D9A1632;
	Thu, 12 Nov 2026 10:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794476594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HoRCw77ZwoLoLapCSKXoJHWwYpZwKjiCThC98/UXUv0=;
	b=YD5jokagYA6izzSHyGkcS07RAUIFMpS/3kZfLRecMVHQrBIxESaCOw5UZZviDzldV+gken
	awTT+Mo0KFXVOfSmLRia78oTafNSahzA5fenahWpog3hjufNnBTBNLZnHA/k9UNIBvFz80
	mPJIVm9z3nb/KvRjqWAUlzyEtndbl0+kKxSVCHVJGxxnQIe/EkRZJl0SQxFMNOnN4/bsFw
	q1O827qAbGguuQakCraEZ39UvyGjHCwR6PtFRFCmdxmNDMHv1PBeTVAjxdaOSEcbDaGlh3
	Ud5mkdUMFonKD3235XuaiyPDgwfdSzR6KuA9Kl/iYvolI3hILEN3V5ft4P0jrA==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:43:10 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-sun8i: Fix the RX_TH
 threshold encoding
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-1-aca0cf23cf17@gmail.com>
Message-ID: <58be9817f150b4b67de284c68b3265dc@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12.11.2026 09:41, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The EMAC RX_CTL1 RX_TH field (bits 5:4) encodes 00 = 64 bytes and
> 01 = 32 bytes (H616 user manual v1.0, 6.5.10; 10 = 96 and 11 = 128 
> bytes
> as in the driver). The driver has the first two swapped.
> 
> The values are only used in RX threshold mode, which stmmac selects 
> only
> when the snps,force_thresh_dma_mode property is set. No Allwinner 
> device
> tree sets it, so no in-tree board is affected.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 47954537b29e..0c82662fbe6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -198,8 +198,9 @@ static const struct emac_variant 
> emac_variant_h616_emac1 = {
>  /* Used in RX_CTL1*/
>  #define EMAC_RX_MD              BIT(1)
>  #define EMAC_RX_TH_MASK		GENMASK(5, 4)
> -#define EMAC_RX_TH_32		0
> -#define EMAC_RX_TH_64		(0x1 << 4)
> +/* RX_CTL1 RX_TH encoding (H616 UM 6.5.10): 00 = 64, 01 = 32 bytes */
> +#define EMAC_RX_TH_32		(0x1 << 4)
> +#define EMAC_RX_TH_64		0
>  #define EMAC_RX_TH_96		(0x2 << 4)
>  #define EMAC_RX_TH_128		(0x3 << 4)
>  #define EMAC_RX_DMA_EN  BIT(30)

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
