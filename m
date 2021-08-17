Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A02F80
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 08:38:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E4F5CC9069
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 08:13:20 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 73E60FF80B;
	Tue, 17 Aug 2021 08:13:11 +0000 (UTC)
Date: Tue, 17 Aug 2021 10:13:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 02/11] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <YRtvl2FWKqAw4b3l@piout.net>
References: <20210723153838.6785-1-andre.przywara@arm.com>
 <20210723153838.6785-3-andre.przywara@arm.com>
 <20210726144137.6dauuxdssu7yszox@gilmour>
 <20210802013938.29fa18ed@slackpad.fritz.box>
 <20210817073810.7stuzrppyjf4spab@gilmour>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817073810.7stuzrppyjf4spab@gilmour>

On 17/08/2021 09:38:10+0200, Maxime Ripard wrote:
> > > It's not entirely clear to me what those clocks are about though. If we
> > > look at the clock output in the user manual, it looks like there's only
> > > two clocks that are actually being output: the 32k "fanout" clock and
> > > the losc. What are the 3 you're talking about?]
> > 
> > I see three: the raw SYSTEM "CLK32K_LOSC", the RTC input + debounce
> > clock (/32), and the multiplexed PAD.
> 
> But the input and debounce clock is only for the RTC itself right? So it
> should be local to the driver and doesn't need to be made available to
> the other drivers
> 

Shouldn't they be exposed to be able to use assigned-clock?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
