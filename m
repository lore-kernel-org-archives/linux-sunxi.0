Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8044430
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jan 2023 15:24:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1pCMf4-0005r2-4U; Mon, 02 Jan 2023 16:23:38 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1pCMf0-0007z1-VD; Mon, 02 Jan 2023 16:23:34 +0100
Date: Mon, 2 Jan 2023 16:23:34 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: Add D1 CAN bus gates and
 resets
Message-ID: <20230102152334.GB30338@pengutronix.de>
References: <20221231231429.18357-1-samuel@sholland.org>
 <20221231231429.18357-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231231429.18357-6-samuel@sholland.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Sat, Dec 31, 2022 at 05:14:28PM -0600, Samuel Holland wrote:
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
[...]
> diff --git a/include/dt-bindings/reset/sun20i-d1-ccu.h b/include/dt-bindings/reset/sun20i-d1-ccu.h
> index de9ff5203239..f8001cf50bf1 100644
> --- a/include/dt-bindings/reset/sun20i-d1-ccu.h
> +++ b/include/dt-bindings/reset/sun20i-d1-ccu.h
> @@ -73,5 +73,7 @@
>  #define RST_BUS_DSP_CFG		63
>  #define RST_BUS_DSP_DBG		64
>  #define RST_BUS_RISCV_CFG	65
> +#define RST_BUS_CAN0		66
> +#define RST_BUS_CAN1		67

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
