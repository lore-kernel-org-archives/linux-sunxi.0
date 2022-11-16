Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DA7C
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yFmAK950q45cj8aoIbkBUEry3On2mPcjgESz/yzDyYE=; b=tB/JO8Oqb+80yOuMZjJ1ej2CRs
	NNR2Jj7ECGDSJrFQFkZvokN8l6AqhTZVabEQhevH9BeH8Y1kqK3UDJlfmxH858OjGc5yces0BZw9A
	V40XbF0ZOeX41t+/BWNNZvhNBu5++7hA6ioMsxEKzSGV03/y9yCWkl45bdDJb2dQGcbU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ov7OG-002W6v-Mj; Wed, 16 Nov 2022 02:39:00 +0100
Date: Wed, 16 Nov 2022 02:39:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: broonie@kernel.org, calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 0/3] arm64: add ethernet to orange pi 3
Message-ID: <Y3Q/NL4ikhxt1YJI@lunn.ch>
References: <20221115073603.3425396-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115073603.3425396-1-clabbe@baylibre.com>

> But this way could have some problem, a netdev driver could handle
> already its PHY (like dwmac-sun8i already do) and so both phy-core and
> the netdev will use both.
> It is why phy-supply was renamed in ephy-supply in patch #3.

A MAC driver will put its DT properties in the MAC node. A PHY will
put its DT properties in the PHY node of the MDIO bus. Since they are
in different locations, they can use the same name. So please keep
with phy-supply.

Please also update
Documentation/devicetree/bindings/net/ethernet-phy.yaml with these new
properties.

	Andrew
