Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35FCEDA
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41180C433EF;
	Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686275370;
	bh=5yCCx637qN6JiLW7I6+8zEHQGblEuFICtzq96prQWME=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K6IhUHPIMyX6G51Gvg9LBUJ3F+NMA6t6yEqi3fTeDTd+AJzCCvvookTr/6vQqGmIn
	 YHm6xCzH29XDY1RxhGUWWRXRiWAz+w4FinVcWL9BZIaqu935rDcsd9srsnN7LexnGZ
	 GCkr6cL3K8SIP7mxO9yA8OMPuNRkbBGzshyF7AScJsc0Echnlzdy6HrJq2B3P6eqEB
	 C/vA6phGnqUiPVssfsHiLNKrmW37L5wDKBSmCLTQDZ9XlTE9d38MUMidr99RQRsQ6o
	 iveJTt876EEgX7IN09+I3JVakkYPpa1Fbdci55u3kgBWbiPwoqFEOp6SBpvW+XcWiw
	 hoc+eH+MLB+dw==
Message-ID: <431d1ae3993d1fc78decbcd065442f29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
Subject: Re: [PATCH v4 00/68] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>, Abel Vesa <abelvesa@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wenst@chromium.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, David Lechner <david@lechnology.com>, Dinh Nguyen <dinguyen@kernel.org>, Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Liam Girdw
 ood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Miles Chen <miles.chen@mediatek.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai <orsonzhai@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Peng Fan <peng.fan@nxp.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, linux-actio
 ns@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, patches@opensource.cirrus.com, Pengutronix Kernel Team <kernel@pengutronix.de>, Liam Beguin <liambeguin@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Pawel Moll <pawel.moll@arm.com>, alsa-devel@alsa-project.org
To: Maxime Ripard <maxime@cerno.tech>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 Jun 2023 18:49:28 -0700
User-Agent: alot/0.10

Quoting Maxime Ripard (2023-05-05 04:25:02)
> Hi,
>=20
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
>=20
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
>=20
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
>=20

I've applied this to clk-next after squashing in an export. Thanks for
taking this on.

I'll have to monitor for wreckage with any in-flight drivers. I suspect
I'll have to take out the last commit, but maybe we can just let those
in-flight drivers get fixed up later.
