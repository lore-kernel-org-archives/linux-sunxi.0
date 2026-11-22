Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363136;
	b=Yu5TCZzLd/tvJKHZEqB1jHPbsuZTBX64Z9gtB0f8dHHvQDRcz6da30rrAhto6ovhgb7j
	 euDUQ7oqHQ1puMvUrF9p2MkuqXGXfUJP6C50UtTOzj4Ic9l+WYKXGgUo85SKK4mgRSw7f
	 CF0XiZQOxR4bbab1hzIV3RvDDnAXxK21MrBU12B1URhCAQ73mhlrzODQ8U3IuoF90ivNe
	 /PFaO1qSqui5qfHcmpzfk8NteJboRWGMU6n1iAXgEs7Bboo68lxMggTzBrzRl5cglenFN
	 8Y4gHBwvdwxyUKmi9L5vrVbbM/eh+wAfA7jspjGEK9CyM2XUCj4pv9xnxFB2rjif4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363136;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=;
	b=s060n0twRjIpmF5avhRSIVt8csTwYLr0rYaeFiDX40EsKGpkl64PrfBEEZpJQlmyM+FV
	 AUynA2Qm5fC7YaQsX7FyiPT+1RFfUXwWdTYk+c/8/DN8IPN64wu514w4FqHqDnXnuE7Ak
	 iPalJK0w0WRkMfwps06oWtNhSL/BIW8KFF0zLSLjf20bZKs6eJSrp5FZesxHdYzD4noPN
	 g6XC4LWLTKJ/TWcoK3cEjVVROzl5cmCVLketqYvref06bv0D1I/mvZ1hzoVpKOnEY8w+q
	 6pwMFAlydAPxdChGuNBnMpX9Q3ufYuXkZQRVNRgaOmjbNq0gVOYrd7pxMLAh1eYZn6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=4lEXrQEZ;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC551606A320
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 15:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC551606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=4lEXrQEZ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDCFCA157F;
	Sun, 22 Nov 2026 16:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795363132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ZV8cdqFBGoUVN0JXYMIHWaqsQ8elfBEyab0KgL/LQQ=;
	b=4lEXrQEZxrDyggcU/gr8xHKxGVKEtBXm1KE0CHNAsZYYAe/yR2fdv4/KxoE4PJ68qCUiXm
	Wa4EG6gQKhKJxwyZpZ+QoUnOXHVAW5F4vWj9bWStOh5lJuEDkbrlanXdwtymvXf3L+6GRr
	Kf4MwsZ8vOOOmiQkMfXojWszdw+UsV+U/Mc0AgrZ3uRwtGRkVLkL7puxG/UNUx41R8b2rI
	g91ycEdcDiwywkh6YNgR4TZ+dDWT3p8nSyoOd9gkKqEUm6qiJOU1DgrAm/EEef4I3Ixjt+
	JLvv77ElSVKk5bOkN/lhdekg+MCORQ37dldz4EF0vA43W0RYLrPh57DD6y92oA==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:58:50 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: stmmac: dwmac-sun8i: configure the
 pause time for TX flow control
In-Reply-To: <20261122144926.284857-4-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-4-maxime.chevallier@bootlin.com>
Message-ID: <19a0e0afd9e05731bbba69b6d765bfe4@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 22.11.2026 15:49, Maxime Chevallier wrote:
> When sending pause frames for flow control, we need to indicate the
> number of quantums the peer should wait before sending more frames.
> 
> This is maintained in stmmac's "pause_time" global variable (it's a
> module param).
> 
> Let's program the pause time value, and also allow sending the
> zero-quanta pause frame when the peer can resume sending traffic.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai
