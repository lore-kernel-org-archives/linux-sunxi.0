Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BAFAD30
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g1iudGydG7aJ//r1cD+24YDDJDUMwVZ9P78R6YNPIw4=; b=1dQmz6sSEGUQhr7NS/wucU+aoJ
	3jf+Gga+KmC8oDuZCZk7wjsVhtegfCdydax6o3wMn5hidfk8eTm28B7ZjQQ93o0OfrHRHGTVFlwDl
	y3+AeyuEiwj9g7iNfd9pl/YfNULltX6iGnZQ4KUH/nL55p0ZoycD4FCT+8rQkcpDisEM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ouwJ7-002Ss3-BC; Tue, 15 Nov 2022 14:48:57 +0100
Date: Tue, 15 Nov 2022 14:48:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mark Brown <broonie@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Corentin LABBE <clabbe@baylibre.com>, calvin.johnson@oss.nxp.com,
	davem@davemloft.net, edumazet@google.com, hkallweit1@gmail.com,
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, lgirdwood@gmail.com, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 1/3] regulator: Add of_regulator_bulk_get_all
Message-ID: <Y3OYyX2o6BsJKxFh@lunn.ch>
References: <20221115073603.3425396-1-clabbe@baylibre.com>
 <20221115073603.3425396-2-clabbe@baylibre.com>
 <Y3Nj4pA2+WRFvSNd@sirena.org.uk>
 <Y3NnirK0bN71IgCo@Red>
 <Y3NrQffcdGIjS64a@sirena.org.uk>
 <Y3NtKgb0LpWs0RkB@shell.armlinux.org.uk>
 <Y3N1JYVx9tB9pisR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3N1JYVx9tB9pisR@sirena.org.uk>

On Tue, Nov 15, 2022 at 11:16:53AM +0000, Mark Brown wrote:
> On Tue, Nov 15, 2022 at 10:42:50AM +0000, Russell King (Oracle) wrote:
> > On Tue, Nov 15, 2022 at 10:34:41AM +0000, Mark Brown wrote:
> 
> > > Well, it's not making this maintainer happy :/  If we know what
> > > PHY is there why not just look up the set of supplies based on
> > > the compatible of the PHY?
> 
> > It looks to me like this series fetches the regulators before the PHY
> > is bound to the driver, so what you're proposing would mean that the
> > core PHY code would need a table of all compatibles (which is pretty
> > hard to do, they encode the vendor/device ID, not some descriptive
> > name) and then a list of the regulator names. IMHO that doesn't scale.
> 
> Oh, PHYs have interesting enough drivers to dynamically load
> here?

Yes. And you sometimes have the chicken/egg problem that you don't
know what PHY it is until you have turned its regulators on and you
can talk to it. So the PHY code will poke around in the DT
description, and turn on the regulator before enumerating the bus.

	Andrew	     
