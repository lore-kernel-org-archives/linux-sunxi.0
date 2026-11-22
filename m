Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367025;
	b=oSOe1f0nCbubB63/RgsAp2pv4okB3wbsa7ITvm+6Zk2RPRrWC7etpJvGelCaKw+TyGll
	 uthfKnbXI92wb77cygfXgChkxMhTTbR5EYY1Iij6Pg1sjU1cNadBP6e8FPIOXNRLRjYsA
	 MvpK7wbEC7JlCvka2ofS2GD3rWwJW7f0/6W7uKjW/i/3hK1KQSgLSYRIY607V/EtDFbbS
	 RqUWHpcOiXiW6hi2l0P3l/6bLRHyHHaht2cOsYAqAK1MHbWjU9i0eYyjSLMZKzb8/hpuS
	 sZIEgWjeAyeFnYcanJ6y8hmWI+OICwo0RVRS9veuoNqqaV5v1gTNxeDXBitBKi6GfqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367025;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=H7I8f7k1W+MvbLqlposU+ufKq5AqOagDbSY2Y1sQhYo=;
	b=O8cAvh42RjumsQLZAuijTaPOTbi/giW7yF/x7REIZ7bfwhXAeizm0MRPvvb/tj9xnitl
	 qX17d1O90xg+K6vKM1+k1QPnc9mmGdV9ZNqtPuRBfif4x2Uhm/BsnJZyR8cp0M6/DgrBF
	 sb2FWpmOxfEXx+Q24S1agzC9gEVjfUXysuooqTPEu+LrSSQ5W4P/RVjNEcQ7Ng/uKcvYm
	 4XmHlhrL36GBIdwu1svVD90nuFzLhIhWoBbgC6DRFcsKb0kaKxFUwqLPV0zDC9ywUFo56
	 u2dg6ieQNQaRjPc3hTKPxxBhpQGgr6v8+f7gI0vrOITETDUFXxGZocSnQSG4jH8c9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EoqZ9CD1;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E3606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 17:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EoqZ9CD1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24A901A1786;
	Sun, 22 Nov 2026 17:03:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE15260512;
	Sun, 22 Nov 2026 17:03:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BCF211E625D6;
	Sun, 22 Nov 2026 18:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795367021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H7I8f7k1W+MvbLqlposU+ufKq5AqOagDbSY2Y1sQhYo=;
	b=EoqZ9CD1O1jJLUCpBhJaK3m4W3bvoGrp4ru9CZrL9o7WMRAHjjLlnUE7+r8BwF22rneynC
	WXxAAv9xcUcdi4VKM5P9Wy6WLgdJzun1hchFDfQyF39pbTkzDCmWHDpiUNyWKrHfH2C2ra
	U1B01KRQMaF4WGEdE/mySJpDqReLjIbuuyQagWUPqiDNDI36BHUw5YeUgh/ZAShzrmOefx
	EmDcB2R6Lhd8k/h1qSWOCvLRz9T9z6HURaaJcHtLxymo9J61DCwaPyiyIzUn1YaI7cFn1e
	jaxdSf6p4VWweQThXDLffn5RKghX+a2EHV1Rd+i39Gw0YAilgegT95+LSCs/rA==
Message-ID: <5d0fb0b7-54c8-4145-819e-3cbbb9b253ea@bootlin.com>
Date: Sun, 22 Nov 2026 18:03:32 +0100
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
Subject: Re: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when the
 probe fails
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> __stmmac_dvr_probe() enables runtime PM and takes a usage count before
> it registers the MDIO bus, but its error path undoes neither. After a
> failed or deferred probe the device never runtime-suspends.
> 
> Undo both, as stmmac_dvr_remove() does.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d1..4ebf4b625374 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_disable(device);

Note that in __stmmac_dvr_probe(), we enable runtime PM with:

if (!pm_runtime_enabled(device))  
        pm_runtime_enable(device);

And I discovered painfully this weekend that on PCIe (dwmac-motorcomm), the PCI bus
does a pm_runtime_enable on the device before probing, so here we'd have a mismatch.

OTOH there's no easy way around that. The proper way would be to get rid of that PM
handling in __stmmac_dvr_probe() and do that closer to the bus (so, in the stmmac
platform code for non-PCI devices) but lots of glues are currently bypassing this...

We're trading one unbalance for another one, but I'd say let's go with this for
now, and we can then properly deal with PM driver-wide.

Let's see what sashiko says too.

Maxime

