Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8331871
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 13:04:50 +0000 (UTC)
Received: from p508fd39e.dip0.t-ipconnect.de ([80.143.211.158] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o7GK7-0001ZP-Tv; Fri, 01 Jul 2022 15:04:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Support the 2.5V I/O bias mode
Date: Fri, 01 Jul 2022 15:04:40 +0200
Message-ID: <9219098.18pcnM708K@phil>
In-Reply-To: <20220626021148.56740-4-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 26. Juni 2022, 04:11:44 CEST schrieb Samuel Holland:
> H616 and newer SoCs feature a 2.5V I/O bias mode in addition to the
> 1.8V and 3.3V modes. This mode is entered by selecting the 3.3V level
> and disabling the "withstand function".
> 
> H616 supports this capability on its main PIO only. A100 supports this
> capability on both its PIO and R-PIO.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

On a D1-Nezha
Tested-by: Heiko Stuebner <heiko@sntech.de>



