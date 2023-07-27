Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8427132
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Jul 2023 21:43:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9F127C0C8A
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Jul 2023 21:32:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B14E81BF205;
	Thu, 27 Jul 2023 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690493521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RVzGt1hU6/zJ2p8ESrItLga9WOYSY12aapmt+gJTTm0=;
	b=KuzkthgvdjwJnivEU/aryJfGIVIwS2Jo2FGYznAjBe2XO2ObIJRvGb4lZ+5IDN1HoNpZYG
	4od2IsUmCvD1rkxDQUX70EEy/OerDBhxZu3PYbTnWRsnA+Uh3PCr6Soiqs7oTND51Z5H12
	vPxGYo5bgxbp54fa9pK//rRC9ZjhXRAtXs5LXD+g2zg8loPvxEOC0OU9LKtcey5kXGqFUV
	3owWu3CEW9oVKY03yZ19bLiumKfiItmQPfrW7xy4+Zjs6amZuo4MDBNNBF0yaCOsre4eZ+
	CZksNyGouFQz3JfaVim3BzM6WwJl4QqifmvRDrXEUYS0+aUG+hl2XEUkrWRj6g==
Date: Thu, 27 Jul 2023 23:31:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] rtc: Explicitly include correct DT includes
Message-ID: <169049349537.641428.12895115995770744599.b4-ty@bootlin.com>
References: <20230724205456.767430-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724205456.767430-1-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Mon, 24 Jul 2023 14:54:54 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] rtc: Explicitly include correct DT includes
      commit: 48144c2890503b919bc8ee128b63e37008d69250

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
