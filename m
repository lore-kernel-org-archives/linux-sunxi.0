Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6817E
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MVzmwksZEc5xV3HD02y8j5y1x9GRvHeT5B5x20Hc+0I=; b=hOtZV+3Jreg66zFUzHNsrUzalN
	p6D+X363nLkmBv7oaSZq1VDVIPZ/T1IDPbuqkuQc5Gv1C0L7P/alcPhlD+Y2O7jWBzYqgdyS7vTN+
	9B+My78PJSGo3Y4689YybuQK6ubPPuU+h3sHlz2bYm+DX5KPC1HIUPWIz8bhR39do6OQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1no2Mx-001wIt-3n; Mon, 09 May 2022 14:20:07 +0200
Date: Mon, 9 May 2022 14:20:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: alexandre.torgue@foss.st.com, broonie@kernel.org,
	calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk,
	pabeni@redhat.com, peppe.cavallaro@st.com, robh+dt@kernel.org,
	samuel@sholland.org, wens@csie.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/6] arm64: add ethernet to orange pi 3
Message-ID: <YnkG9yV+Fbf7WtCh@lunn.ch>
References: <20220509074857.195302-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509074857.195302-1-clabbe@baylibre.com>

On Mon, May 09, 2022 at 07:48:51AM +0000, Corentin Labbe wrote:
> Hello
> 
> 2 sunxi board still does not have ethernet working, orangepi 1+ and
> orangepi 3.
> This is due to the fact thoses boards have a PHY which need 2 regulators.

Why PHY make/module is it which is causing problems?

    Andrew
