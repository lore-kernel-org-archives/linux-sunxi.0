Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4FD530
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 20:16:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 19F78C6C8C
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 19:39:28 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 600B420002;
	Tue, 21 Mar 2023 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679427559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBHkU6tb5xg5smOIlShgBtygMh+FM3sL86bax3a5bDo=;
	b=Gqqu81VcF0q1VsN48gRKkyeZZ3R6+UANTWm2J0WaavxgBCkF8PFF1FerT5b2POxH1Hq7s9
	1Qv0wA5bBLGiB1yBLatCXEeo/olRqMhkC5dE4arA3WU73R7BIuzPPg4vfFc1u/sVLYaKUn
	m2OghwcQmLKpja/d6gy4765C02hTkInW1+wBxz83j1dyTKQe4ZMhwBitXC40IKLdqmfHTU
	BAMM0YHBvatH/VDQ67MXVxu7s73gDTtd4aJxEGXc5aVBqOchr9VzbdyawWSJcaBYaQZlD0
	VbHpWvQhmbAASjUzsLZ8sIYPYNcy9pB0mKubjbE0R6u2nurh6F5U/M0+ADg2EA==
Date: Tue, 21 Mar 2023 20:39:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Message-ID: <167942752119.675121.3470511868063129229.b4-ty@bootlin.com>
References: <20230317233634.3968656-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>


On Fri, 17 Mar 2023 18:36:33 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Drop unneeded quotes
      commit: ab0fccc373d505c9a09bf459557768ab3177e0d2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
