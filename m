Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450766;
	b=OG7twX8PJ4e5qzIR2R4MCh90FeI5nD11Mj2QYqJ86io8AyZHJzfGNixkbqADzynni9pk
	 0lLCI7gnaYnLbhjz3Bt68qqUC/uimzvElThIg6ZMXzXpLEPFMlGzJNw5EIgNoA//kmmfi
	 Uuz2bORlpYFe02mdLzKOl9f0kYXLs6XxmzQElS0kQmDVphu+jk/uGXxnrXkQSFvh5v+mn
	 2kZS3OmSSwhBt1i/BfgKS3BuZS4+Gh2Eq1h9KN7lXxZLMQ0WPOlWKr/cO2TSVMw63wuEC
	 5KaIBj4To7Z88f4IKNE0dkDjEsP71J/Jt8R1JHdGDrQXC3aGa3hZSjFqVraWiTOlcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450766;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=55skxeKZ9XJ2oPQI1dpQfpuUvuGaN5lAgogsDovX5xc=;
	b=JnrAcM/rzgd7MTs9vTUYGEGAIQWWRIEtiBhsooxtYV6jwcUec8rVo9HxwcYmmHYHLMOT
	 PbcASZtu7R+02nSOng567XTRkU3lSs9eV7YfrEZUsRarH5QCKw9GHOki+lwvOx14wCT1X
	 yEApPTlr14zlXcu3/N5QYIZbYjZaYmWhwV7Fwl6k0p76SkVGK1saCDVe2L8nnyOGwegCd
	 qIdREvRbCJFkKBWiBTcf3W+C/4w0KDvHiABBOeYBfyPWEG95uzI67o8vsqTcDxJiGCzIV
	 tPrpP8mXo0VD8nHpLu9xB2pRI/n6LUuPlZwkxO3k+iqyi37WolCZFkNYPxYdVEEGGIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IKbczG5d;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002C606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 16:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5002C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IKbczG5d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF1EF1A179F;
	Mon, 23 Nov 2026 16:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A044601E1;
	Mon, 23 Nov 2026 16:19:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1A9F11E6A730;
	Mon, 23 Nov 2026 17:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795450762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=55skxeKZ9XJ2oPQI1dpQfpuUvuGaN5lAgogsDovX5xc=;
	b=IKbczG5d7XD6KV38kQVObMWAt+QUHAu4ETZvLtVo8dmG+nqKFdURsuU2BF3jboRnqBluFz
	sNFBUN8uVGXLMTEUUbjdXddSnvGlp/3M/9jgO1ibnNXR53yTQhCk0EkGo2C3CMb7tvOATw
	oF88Uj9saaCklyMjkkDgrTICMVQ37/6Zl8LUUcW9Gb9DFJRrOgWmQvuc4KvWOmcOuaUrGB
	53rICNqC3tGVbboUCsXSOTMvHe3Q55HHeT3iAb48w+BnOTa2YEfK3jZ5A/UUTlW1AjgynJ
	sYu6pyW+Sx4gZAvvPbtiN7ZT4mWWf7ZRRv0bEtlBzpysxZ2iSdOKwYaFyH+ZLg==
Message-ID: <c4dfa9e9-6df3-4251-945c-b476d6c65fbd@bootlin.com>
Date: Mon, 23 Nov 2026 17:19:11 +0100
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
 <179544551937.3135.9976133356956488963@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179544551937.3135.9976133356956488963@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 15:51, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Unserialized read-modify-write of EMAC_RX_CTL1 in
>   sun8i_dwmac_flow_ctrl() (drivers/net/ethernet/stmicro/stmmac/dwmac-…
> 
> --
> 
> net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
> 
> This commit sets the RX FIFO flow control thresholds in EMAC_RX_CTL1 from
> sun8i_dwmac_flow_ctrl(). With these thresholds, the MAC sends pause
> frames when less than 2K is left in the RX FIFO and stops when more than
> 4K is free. The new bits are set only when TX flow control is requested.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> index c63f4d87de509..75c743dfe3483 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> 
> [ ... ]
> 
>> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>>  		v &= ~EMAC_RX_FLOW_CTL_EN;
>>  	writel(v, ioaddr + EMAC_RX_CTL0);
>>  
>> +	v = readl(ioaddr + EMAC_RX_CTL1);
>> +	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
>> +	       EMAC_RX_FLOW_CTL_TH_DEACT);
>> +	if (fc & FLOW_TX)
>> +		v |= EMAC_RX_FIFO_FLOW_CTL |
>> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
>> +				EMAC_RX_FLOW_CTL_TH_2K) |
>> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
>> +				EMAC_RX_FLOW_CTL_TH_4K);
>> +	writel(v, ioaddr + EMAC_RX_CTL1);
> 
> [Severity: Medium]
> Can this read-modify-write of EMAC_RX_CTL1 race with the RX DMA start and
> stop helpers?

Hmmm yes indeed, I think we can work around that by writing these FIFO
values in sun8i_dwmac_dma_operation_mode_rx(), just like we do in dwmac1000
and dwmac4, that way no race :)

I'll iterate and fix my typos,

Maxime

