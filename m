Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5E1BB20
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 20:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61230C433C8;
	Wed, 19 Jul 2023 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689800396;
	bh=k7BbwM3GQt5I5q5RKKmQE4Ls2lVgeaaUmKNOmM9jUwo=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=XiRNOi+ajvcZJ5KWWPClFXwc34hq/dw/zfm5LCYQkwgBRm8t2dGeRC+5McphSl6op
	 9cnF5D4xW96bcJyXlW8s4VupdeO9QeKhIl5K/eYygsUC/uXlHbVP7jhpSWJ2BNj/tW
	 o1hRZAXjkYdDB8x51REfrCGhZhfBNvf32v08ZtxCFOwuw4T3RrCEFKim5qUXyXebOJ
	 rkHYo1HHsHniiLde3LRODH4jJQ1pX3k8pVnjKlEiFqsk2sbOmxjEOhrYX+4DpJ/AIl
	 rSXxqEyzBt/ngxwa/ZgRpZHeo+txMy3Q/DckGpqBsn2hkuXUdcbmHIZXzvT5HVgzG4
	 P3WhxmxzCy9CQ==
Message-ID: <2198bbf6e40906ee76b734d0f6afa08f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230718143156.1066339-1-robh@kernel.org>
References: <20230718143156.1066339-1-robh@kernel.org>
Subject: Re: [PATCH v2] clk: Explicitly include correct DT includes
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-oxnas@groups.io, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Abel Vesa <abelvesa@kernel.org>, Alex Helms <alexander.helms.jy@renesas.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>, Andy Gross <agross@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, Dinh Nguyen <dinguyen@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Gregory Clement <gregory.clement@boo
 tlin.com>, Hal Feng <hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Te
 am <kernel@pengutronix.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Santosh Shilimkar <ssantosh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sh iraz Hashim <shiraz.linux.kernel@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tero Kristo <kristo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Viresh Kumar <vireshk@kernel.org>, soc@kernel.org
Date: Wed, 19 Jul 2023 13:59:53 -0700
User-Agent: alot/0.10

Quoting Rob Herring (2023-07-18 07:31:43)
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # samsung
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # versaclock5
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
