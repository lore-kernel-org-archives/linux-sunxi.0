Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43471C04
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 14:13:48 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNaqZ-00047x-KE; Mon, 15 Aug 2022 16:13:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 09/10] soc: sunxi: sram: Export the LDO control register
Date: Mon, 15 Aug 2022 16:13:38 +0200
Message-ID: <3177019.N7aMVyhfb1@diego>
In-Reply-To: <20220815041248.53268-10-samuel@sholland.org>
References: <20220815041248.53268-1-samuel@sholland.org> <20220815041248.53268-10-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 15. August 2022, 06:12:46 CEST schrieb Samuel Holland:
> Some newer Allwinner SoCs contain internal LDOs managed by a register in
> the system control MMIO space. Export this from the regmap in addtion to
> the EMAC register.
> 
> Use generic names now that the regmap is no longer EMAC-specific.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>


