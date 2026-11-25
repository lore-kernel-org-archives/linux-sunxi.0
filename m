Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627828;
	b=ZRFCvzfBAxETHXbzP+/NSjrMZkv4qlxowATrtqmnWpZeIcZl7MTtof5I5haJPt5Hh3yi
	 Tf+f1s0ri9ISKZoeyXM6n8e0rQVMBQ3k4QPr1VDTla0zVHSmqKtM65G92AaQry52D27Vi
	 CYBaMcivd11k/g7sdK+cH+BwmQnnQCWJ4b7lC1GV40CEsGdrgj/HKXShphjwxKuXSmk2w
	 kx+Pf3eY0+h84JejrFriptu1hDIJurqI4X1fv04dwmPDOJN8H2ItsEhOON4sZks3Ye8yD
	 CTCR2po/W8mpuUZ4Ve6qag7BTzWqBYy23Khf0E1/agA8DPNLbCas1phAjb681ae68TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627828;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ajL/VFptsdMJF1T3+aHmoepAhsBn1dk3R0lg5KaZ3QQ=;
	b=lDocYfmezRrNw+ZIDvJdRG8eWAd0S9TJg7o2MP/TQ5fx5456nSz07ZdGcKgNJn7k5BwW
	 c0W9eUcT+CmGPOHjaCCVXko4kR/LImY9RVv5Xflo8VWQCv6GorHviOnVSOwd8cRULGBpw
	 9jMpXIC5u0x03DKTBPVOTXEC0VUk0lDcNFyR40kCCO7ul/WRDvYzBDBLpHDzdwZxS4feV
	 bahq3uTZhs1U3jnMqSl8xi/iuUXL3AKfwPBIy0QAb4gpvTPe4kafV9bSHwp7Y4NDEn/SD
	 8xZCd8pLY3ye6caATqBUY8PElBVGn7dFH8GD1Ocp7LLSjPlw6GAdPIPqbWPJ16TAVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=6WXnP4dF;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3062606A327;
	Wed, 25 Nov 2026 17:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3062606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=6WXnP4dF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ajL/VFptsdMJF1T3+aHmoepAhsBn1dk3R0lg5KaZ3QQ=; b=6WXnP4dFj4zAmHxohBB1f8BPSK
	rXYKOqmDheVofjgyfEpWWecV+KDEwZqGGVBNYq09PIwVyZq9Zo0EaOP8s0LEHSvEoPcRxP/z83cy/
	5LxmHY+4cGqRevnN0Ve9UK1jgdBiCSH+h45qYIFkoH+uXcV7o/s3FqTTQSMM8Godxqws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWGp6-001Nca-DL; Wed, 25 Nov 2026 18:30:24 +0100
Date: Wed, 25 Nov 2026 18:30:24 +0100
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
Message-ID: <292b18e4-dbad-42ba-9f1f-cfbe2af52148@lunn.ch>
References: <20261125130613.4191841-1-alastair@d-silva.org>
 <20261125130613.4191841-6-alastair@d-silva.org>
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
In-Reply-To: <20261125130613.4191841-6-alastair@d-silva.org>

On Thu, Nov 26, 2026 at 12:06:13AM +1100, Alastair D'Silva wrote:
> The Orange Pi 4 Pro connects A733 GMAC0 to a Motorcomm YT8531 Gigabit
> PHY over RGMII without PCB trace delays. Use phy-mode = "rgmii" rather
> than "rgmii-id" so PHY-side delays stay disabled and the MAC applies the
> calibrated TX (2160 ps) and RX (3780 ps) delays directly.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the PCB. If the PCB has no delays, rgmii-id should
be used.

The MAC/PHY pair need to decide which of the two add the delays. This
is not decided by phy-mode.

3780 ps is also huge, much greater than the 2ns required by the
standard. It suggests something else is going on, maybe a clock is
inverted? Please investigate.

   Andrew
