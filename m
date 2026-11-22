Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365192;
	b=Zlgaics3GKRP+IDSlFk5dLHFZor+WGPvKmGUgxgrP1qQZvm5VxGRWsJpGj4KQUtyCQSs
	 L9ZhRBcc7TegHNN7ilqeVNovqAVfcwKA0V6+rj6u2RNgSPtiAO6dwtdYpEtMJBF1RQtM2
	 PPt2Zgn4OF8b2tHB/LQBWM8RjTJaZLOMmAqr0GHNKxaNR2B7pggxRIC5SEQ7KrTS1yMA2
	 6D7sW/3BrWjDgh5zdjzA51VAgepT8gg9J/B6t88r4TG0Ef85AH/gUxXZV6XOnksfYSMpE
	 GelhQI2urRYyXLVsXHEGfm90x2AA9YuAU0e1BiySTiVR3mIfqaXJ/LfNrsJ5OaOx0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365192;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=oxiR/oDYkJlm/vmgSNXn/0eNQdL2U0MFqxfA2Te5+Uk=;
	b=Wn6tp4ep2IJ5GwylSh1gx+hnzO9ZheCWnR5cygS5NBDcm7MBkThq0sLHeV3sf8KKKP4K
	 rJs15/7+duUPMs4Pu/1nb3WyOg3nXx7bzD/B/izyXqVSNrvaIYkXwJjxrjGSto8wujrHv
	 hj1rxbZPDCWWB6V3kKkFU83PQeISyO0UiwaqvlEjQC7ltBj8gEHPPE2Ok4yluFVs6zZs4
	 JRgdFMWDaQyLnqLYfkdNyD3lEBVHbUbDSwRrKfWLnpQuuHuucl/NhOPoEzxLB+rBW7uMB
	 JbTO1k/Tb3njW7KIsWNirG7Fv3agc/Ogx1proDcgkgig91PgkAZN8+otaUf5SMsx0Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=PBDjuNP1;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A519606A32A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A519606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=PBDjuNP1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 055F4A157F;
	Sun, 22 Nov 2026 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795365189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oxiR/oDYkJlm/vmgSNXn/0eNQdL2U0MFqxfA2Te5+Uk=;
	b=PBDjuNP1jLkd2CMknU31M13Jiu2TwgpX8U+M1mm8vjZWz+pKAMxVeGIkwnktuOyABYzsCk
	WbCrPvICu6bMf4yP2RDup3IHwovqqh0ocCc68eStaUQtRpKqrLdjyKlAnVwu79O1BPtzNg
	2NcZoK3sgqTi6Q73QIsM+rP8fGJhW3kfT+utpLGHcnoIzUyz3T2AIbPfwN0932aUGqf+1U
	mcdYMCKaygzmPVA++2UrphRRtfCU9IUquMeC+5dve4oj1NbmQTPWeaIDejcHJfqjbhfgBF
	vZEtDU5Bmvp5J+0hWy88ScAnWB0M7ft6d2qGmEn3GyZ3YLdL7LcSFZNMbO49yw==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:33:07 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Russell
 King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
Message-ID: <fd55b3381a6ea99be2befc9bc3e6f34f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 22.11.2026 10:13, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The H616 RX DMA fills only 2044 bytes of a buffer, so frames of 2045 to
> 2047 bytes, allowed by the previous patch, are dropped. Limit the MTU
> so that a frame with two VLAN tags and the FCS fits 2044 bytes.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
