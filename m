Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E209D53C
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Dec 2022 22:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75663C433C1;
	Thu,  1 Dec 2022 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669934047;
	bh=Uq1l4BgLlKqVDMyvtY+SMzQv/bliKLm/IypcYi8plHk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=I/RiAYoUbcK7MDuWH4SxhjdwwfkDlcK81s6TTMNad9RbBv87TGg//UGog3mvk08kc
	 KeJvTwKPYgyrbP+AQ8ohNh45GW0+cq13sk+ecwFTdPRwUfZnPnAXLtaDz28MaPdIMi
	 If2+zk7b6neGK9OmZcRrsSVJq6XHg3+uy/NgWUcGcxKsrsXxA687iDOOSWZMLx4fqC
	 YhVIj+BzjGiafIeKyzoEjH0mAy3CozQe4yGuHnu1P0IL+64VeMsoxZZ32g8eiEc9J9
	 Yv15iKEcVBQsCNgxRwJAyw6AUbM+NurbuZ21MEegoj9R96Wrspq7gT9CHYdyogn0g/
	 POVrLgCImxl9A==
Date: Thu, 1 Dec 2022 16:34:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefan Agner <stefan@agner.ch>, Heiko Stuebner <heiko@sntech.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Oleksij Rempel <linux@rempel-privat.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
Message-ID: <20221201223401.5yews4hlbyyaasop@builder.lan>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-3-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>

On Wed, Nov 30, 2022 at 05:10:37PM +0300, Arınç ÜNAL wrote:
[..]
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts                 | 2 --

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
