Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB82516D
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 19:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3334C433CD
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315168;
	bh=jVkGbzOh79AEXIeMVY1s/WgLpPOOReQVmsy9pu11HgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DEhjBsvrOOkcqhVPMF0ywdTWs8Z08Oh+MPV+DI+LuayXmNg5RPsI+06xanIZr41yf
	 RulCXs3D/yfE4rW3H0mBUoYYTTekXk7UtuQu/6tPx6E6UGYoVUP//DcKZnKvYdCY7m
	 LDadwlsN3uiJtuz+P/1vbQiCRFS8xJEgzz56R89YkZUyoeWUBmxW/L2f1uTVJKWxhx
	 MVlyTrNJ7H+fq//crmAaDyeNM5a++sk5fr1a2lcBtBfETk2FHDfcwxa9aH2EpzoAPn
	 zp5i4YLu+nwwjALW0PlPIJnHz+Xa+AmKS5YFoc6mujZXB0gvA8UxLyWev/HbE7XmpG
	 j6X5adm3rh5Kg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so9375936e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Jul 2023 12:59:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLZHPkOO/KRB4Ew6SNPsc0Sg2Ah9QClv3qYyK4DnyK30wRWizyDq
	2SaWkfoKCHSnTea9ZD6o92R9rlFC6zYP6nX7Uw==
X-Google-Smtp-Source: APBJJlFwGjXaJCJydGIeGV4iVYCIq6ysqPH1CxKSwb/h2lZDdMtrrV65McGRvNB57SLo+rUN/j76IhUhQXfq96gAGDg=
X-Received: by 2002:a2e:8786:0:b0:2b6:dd26:c02a with SMTP id
 n6-20020a2e8786000000b002b6dd26c02amr8693672lji.14.1690315146580; Tue, 25 Jul
 2023 12:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724212222.809909-1-robh@kernel.org> <ZMAD25Yp6gCNq+wH@corigine.com>
In-Reply-To: <ZMAD25Yp6gCNq+wH@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jul 2023 13:58:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Subject: Re: [PATCH v2] net: Explicitly include correct DT includes
To: Simon Horman <simon.horman@corigine.com>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Anderson <sean.anderson@seco.com>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Douglas Miller <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>, 
	Russell King <linux@armlinux.org.uk>, Taras Chorny i <taras.chornyi@plvision.eu>, 
	Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, 
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Timur Tabi <timur@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Steve Glendinning <steve.glendinning@shawell.net>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Alexander Aring <alex.aring@gmail.com>, 
	Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alex Elder <elder@kernel.org>, A ndrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Alex Elder <elder@linaro.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, 
	linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-wpan@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 11:18=E2=80=AFAM Simon Horman <simon.horman@corigin=
e.com> wrote:
>
> On Mon, Jul 24, 2023 at 03:22:16PM -0600, Rob Herring wrote:
>
> ...
>
> >  90 files changed, 88 insertions(+), 92 deletions(-)
>
> Hi Rob,
>
> I suppose that it's reasonable to take this patch through netdev.
> But it does have a pretty wide surface, and netdev moves a lot.
>
> As it stands the patch doesn't apply due to a conflict
> in dwmac-qcom-ethqos.c

It did yesterday... Anyways, looks like 0-day decided to find something els=
e.

Rob
