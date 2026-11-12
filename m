Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476780;
	b=hx0dwNgMGMMQ7QxmpXK+Ohjr8bB0KRgR6fIVSyeDxYLldSFa8MBCQ+iPEnY3zh+AL/EL
	 BsqIN3IzsLRqpQ13OeXRVVT3ed3GHp4kypofBTF2YykVXN1brBczTB5snaVeRNNsqW3lu
	 r7aVIx3+k6I/zt/mKF9QWk9X2N7PGCqQcE9kBhZbG1d69/6DTd8pVEf99It0SAssqQujd
	 DKqvj5FVAHQ8gDF1wXEkon79O1HH7qAc2uYgRGQyDw2knYjyYPaDly19ynN1VWdkSfT2C
	 DS9ULFg6GB/CtJvV1YSWuYch1zGpag3mv2nSuE16GUB9wws3boW2QD1SvHElNJJ3CpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476780;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zF4RKurSPbtIZr5y6aisxGcnIy7a/9xHHcRfZOEEHKY=;
	b=wcRwCs1QbqmdiYP/yrONnMqJmeI6H5dZTAbD314zWqoIm9JKSouLatZg6uIDQj/+RLxL
	 w22b/PlGv4Y+3/6N7j9yRNdbM8B2IsHepnwhHgg0MnO0+gpMejJWbSaRP8q6UapquvCJM
	 Bz1PI8qMD2xxHL+HFcUX5tjecMlPHarAau4RJ2/c0lEoJN7MGDGOQlbRO3qXevczy8Ujy
	 o50VaP9HrMxMcj6C4nWn4Z1isF71Dwfb3e2XttJrwCetM7uY6mQMV7fRSNzEuqLmLOm4f
	 E4kdaZN99vb1DHIERcXiYpYq828jkU9QE6UHawA1ciy8i9EWXJMqPBCtHKYRyc1shWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=2pXqmXMP;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86B606A327
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 09:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C86B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=2pXqmXMP
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85196A0064;
	Thu, 12 Nov 2026 10:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794476777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zF4RKurSPbtIZr5y6aisxGcnIy7a/9xHHcRfZOEEHKY=;
	b=2pXqmXMP8GV7SvW37kAVDSxQn4a35G1NODITlm961BJyJKuTT4HfH7yNcaBeBN4U7Eb3SF
	oGoK1o/QgNZ93MnAS6xYwRJFTIckJQVngdNqeBszfwHk3jZwF+9MUSzkvqSL3rUdWWOmIn
	/pZph+Gzp5APYCp3MmrS3XrDTJCFBDAo3ae2EZafPKBes8q1zu2HSsGOWEeCZsq//Hfd54
	pGZ6TMzePxnA/mbDS9PvreQE1Wmuurcx6zATx0sTy2N6DxcJwEygFLY7y6YKTnpcurFyiV
	mvOoMIx7Pmbs9BvgaXK6x1zNAiFJO+3VECTyNllVrq9nQZM3UDeQXq2vkYWX/Q==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:46:16 +0100
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
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
Message-ID: <328e66e47898b772f2956649bf4cf795@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Arun

On 12.11.2026 09:41, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>

> [...]

> Limit max_mtu so that a frame with two VLAN tags and the FCS fits in
> 2044 bytes (MTU 2018). A device tree max-frame-size can still lower it.

max-frame-size is only parsed for the snps,dwmac compatibles, not for 
sun8i.

> [...]

Thanks,
Nicolai
