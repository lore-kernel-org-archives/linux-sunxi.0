Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326881871
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 13:07:56 +0000 (UTC)
Received: from p508fd39e.dip0.t-ipconnect.de ([80.143.211.158] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o7GN7-0001bD-JW; Fri, 01 Jul 2022 15:07:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 4/6] pinctrl: sunxi: Refactor register/offset calculation
Date: Fri, 01 Jul 2022 15:07:45 +0200
Message-ID: <20243196.sWSEgdgrri@phil>
In-Reply-To: <20220626021148.56740-5-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 26. Juni 2022, 04:11:45 CEST schrieb Samuel Holland:
> Starting with the D1/D1s/T113 SoC, Allwinner changed the layout of the
> pinctrl registers. This new layout widens the drive level field, which
> affects the pull register offset and the overall bank size.
> 
> As a first step to support this, combine the register and offset
> calculation functions, and refactor the math to depend on one constant
> for field widths instead of three. This minimizes the code size impact
> of making some of the factors dynamic.
> 
> While rewriting these functions, move them to the implementation file,
> since that is the only file where they are used. And make the comment
> more generic, without mentioning specific offsets/sizes.
> 
> The callers are updated to expect a shifted mask, and to use consistent
> terminology (reg/shift/mask/val).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

On a D1-Nezha
Tested-by: Heiko Stuebner <heiko@sntech.de>

Change also looks good
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


