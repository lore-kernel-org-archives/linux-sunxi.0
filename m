Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641996;
	b=lNP6rl5zbEAd7wwRsqmNiUMXM2Bw8+Jbxe0Z308CDi56JTR4FIoIQWxSZmHMnlmQt0w3
	 8NUc98XYqz0Sn0wzHum64nvfRsx8oYouNsDZJLFd5TL2+5e5d56xrCFUz7qEwKIfJdxAp
	 YvJXpB2bfRXdhoMvN38t6fhxQq/IKR+O5/Aa3T8r0kWHWdNYSapD9y0IJDe493VeKkqgj
	 kuYTFPA49jZLFA/VZ1ZXxKwlz4RPzfnbmxSMpKzTILE3r+HqKsS7J6Rj0qcq2IkSv/ow/
	 moGNsO9Vnqc57HuWiLOimpfw2pSSX52pbYL7jIClABFtiEZXtf4fB+kmcRRS5Vp44Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641996;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=U7s9iUOSOkmOT3uFzFWi/VaQ4Kk2CxReJCkLr/OxACc=;
	b=aBvECbddvIWC4+BNb6OoCVO+ox7oazPq7GUofKZsDNxfqAOzXyZCbWBc9V4RXx8y23V6
	 bgdmr6WS3gaMc4gQbKkLMK8f1kNmX+nbrGKHpJsU71WpH4Dy+NyQ4mUTrQnwHy85Ix0xs
	 8lWRqnog8lmqa6T6m42cDlNNd0Ol0DogdI0it/bqbM+18PpZ+5rYdGndN9CvswC1dRYXG
	 yxbpi9ca68M/6riX6/Evk4dGkCPYQW4pQCk3nIcbKxu8vyjmhIV7xCLTGJ6uwjpBTRdEX
	 1zzXvVHCECgfFSKZcvPA9MAQbUseYxD7fMWbhZWVVbXEi7wtqTqw9UYu4l2fyoxXrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DUV+M1iM;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92D606A331;
	Wed, 25 Nov 2026 21:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C92D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DUV+M1iM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=U7s9iUOSOkmOT3uFzFWi/VaQ4Kk2CxReJCkLr/OxACc=; b=DUV+M1iMoOS9UDKEBIjXzHenib
	D6usOMeaewkhL6rhiD2Zub91D/pVdDYfHshNeie0SVXsK2ARYym4iCbXZa3qtfxUkcAm6ph8DJB83
	hcezrILyjGrOnPmxddbrkqzilOIFCw8yBQk6mxu+VRDFmCAhGmaVynrmlvMZnX3zOs8w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWKVb-001RJc-NH; Wed, 25 Nov 2026 22:26:31 +0100
Date: Wed, 25 Nov 2026 22:26:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro:
 Enable GMAC0 Ethernet
Message-ID: <9d53ad67-33c5-4626-b98e-98c86393ecba@lunn.ch>
References: <20261125130613.4191841-1-alastair@d-silva.org>
 <20261125130613.4191841-6-alastair@d-silva.org>
 <292b18e4-dbad-42ba-9f1f-cfbe2af52148@lunn.ch>
 <20261125211335.719843-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125211335.719843-1-alastair@d-silva.org>

> For v2, I will switch the board DTS to phy-mode = "rgmii-id".

Good.

> and drop
> tx-internal-delay-ps so the YT8531 PHY provides the standard ~2 ns
> delays,

Good.
> while keeping ERXIE = 0 and setting rx-internal-delay-ps = <2160>
> to compensate for the RX clock phase (matching existing dwmac-sun55i
> boards).

Not good. Please fix the clock inversion. Since this is a new
compatible, there is no need to preserve old broken behaviour.

The majority of boards should not need rx|tx-internal-delay-ps. The
RGMII standard says there needs to be 2ns. phy-mode rgmii-id means the
MAC/PHY pair will add 2ns. That is typically all that is needed. 

rx|tx-internal-delay-ps are only really needed for badly designed
boards where the lines have not been kept equal length.

	    Andrew
