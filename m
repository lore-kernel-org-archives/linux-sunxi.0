Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3819ABDE;
	Thu,  9 Jan 2025 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736452992; cv=none; b=Ii8TvOidvF+53uMA6ag7H0JA7hvkHuEKTr2DTf2kSJJ8VFq2dvnJohKeN/PtCAqv5zEy2eZi1/FLG6jKYxO33E/ddVEdg52MrtTHx2MXdRE41n79k4ChmwmRfJxaJvKy+/6wk0GArcfzut9Np7uKnccGrk+4JEH960cXDzlxqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736452992; c=relaxed/simple;
	bh=CEraVU4ce4vgP8jPE97cGax/9P4aNGpnQ4WcUIe/0vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZb6L7g1yM+WQZCc7InPbmUE5T1jTw0XAvFx6r1i0PwasPudg8y13cR6UT0aVXJr0+c7WH8tebyrpDyAPRygFFnqsyFur4t462nIgjChPaZ7QgWaVAWg6WxFYuykWDZ+z3YOhK0krg+dMVLAamYZgcIe+8ODODwIfoP/vBoPm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aqnMgi8d; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aqnMgi8d"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E65FF802;
	Thu,  9 Jan 2025 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736452988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufquL8MTaCaDartUz08Jv9Co5w4deNYxwsOj/E8fcww=;
	b=aqnMgi8dmXNmdqbb82gZLgfSEWXhFqHsrY4xDCQkXxC1eVbQ/WCgrOzndGV9myrqe/hElG
	jef5H3/ls9gbinUu25fBKeiz2GZiCFulJ+4WhYBhfC45VCcq4EfPtR0KIHfjbcek+Q1VfV
	9wBuydXTJ3vjy+3TBFcHwgj4253G33JMK1TEdzYz0Ww2Ja4TgQmwoyNJWYJWfnKuos+WPd
	cU46FTlgkwEX3NlsLIdW4FYBG1lIgDNygresvTuecEYNDGFWiC7SET7ShqD2glnBctwGq+
	pVYOLHmLiyMp2+38SZucpgCpNOe0nHGnaKhJZh2gFh8WYrNUDI6LJ28dYOimqg==
Date: Thu, 9 Jan 2025 21:03:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <173644377117.1019413.12980385173648327961.b4-ty@bootlin.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 17 Dec 2024 08:13:26 +0100, Wolfram Sang wrote:
> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> 

Applied, thanks!

[1/1] rtc: use boolean values with device_init_wakeup()
      https://git.kernel.org/abelloni/c/8c28c4993f11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
