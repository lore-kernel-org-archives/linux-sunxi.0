Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EA442A
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Nov 2022 23:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3TiYJwh6WLGjngXJXq9QOuYOjjjU6e7ZQDDyVdCxrBc=; b=TaX2Qp5iJY8V4EU+rHut+AlB7T
	MVzcV4ldtP1TlXSubk9wVTIpULARgYL8V1zRrA+CqWAscYYVwjamNJduUKZUpgzmRuzZSM6vi6SNW
	hFWWV4EaqXSRmdRHEmjawx2/zRymExa8e+d+aHZatov+FCyGL2vdEiPhnDlUXjFZB3/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1owtx0-002xBP-NF; Mon, 21 Nov 2022 00:42:14 +0100
Date: Mon, 21 Nov 2022 00:42:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Renze Nicolai <renze@rnplus.nl>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	Conley Lee <conleylee@foxmail.com>, krzysztof.kozlowski@linaro.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: add device tree for SOPINE on
 Pine64 Clusterboard
Message-ID: <Y3q7VnjHD+pLdl+H@lunn.ch>
References: <3351526.aeNJFYEL58@werkpc>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3351526.aeNJFYEL58@werkpc>

> +&emac {
> +	allwinner,tx-delay-ps = <500>;
> +};

Is this direct MAC to MAC without a PHY in the middle? And RGMII?

500ps seems odd. It is normally 1000ps. And you need to specify a
delay for both Rx and Tx. I could understand

&emac {
	allwinner,tx-delay-ps = <500>;
	allwinner,rx-delay-ps = <500>;
};

then each end adds 1/2 the delay on both Rx and Tx.

     Andrew
