Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D702C9E
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 09:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAB0C433C1;
	Mon, 29 Aug 2022 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766172;
	bh=ih6IcClzDh+9YhRELNL3SpJIptvLt19plqo3VbHdwwQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqn0cqxfTgzrn0h26mvc7qiunpLt6qstH7DSXfrcZ1zImjaXU4WGHB+8HTVdWcQKm
	 yPpTx9uHkSQWZR7SRMEKWWYdMm2whwrQ7/MkHtj5NUHme5+OVzzNl0or5vBRyt00ZO
	 Tbm01MDTCfjea8v8hFeJ3Tx8gd4mnqfO9CwmUNEOVcfEEXwGsJziLN4LtLyCYcQPaa
	 n6IcYK/P8JDNNPk0Zbf/7sA8PH0fSGy37sMGmlw5+avvx9sz0ZOcp7wC+wT94zn22G
	 nY7FxeAMvw0ob1I/MQdtAeoLtEF2bDFuDqDi77jbwamgPMYklq3vdmsxhtyCA+jvVC
	 +/968EKus/yIw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	olof@lixom.net,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stefan Hansson <newbie13xd@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	Takao Orito <orito.takao@socionext.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Chen-Yu Tsai <wens@csie.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-renesas-soc@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-oxnas@groups.io,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-samsung-soc@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	soc@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-omap@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH] ARM: configs: replace CONFIG_NO_HZ=y with CONFIG_NO_HZ_IDLE=y
Date: Mon, 29 Aug 2022 11:42:38 +0200
Message-Id: <166176606750.192368.4738422285067111975.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220825162034.5901-1-newbie13xd@gmail.com>
References: <20220825162034.5901-1-newbie13xd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 25 Aug 2022 18:20:35 +0200, Stefan Hansson wrote:
> According to https://www.kernel.org/doc/html/latest/timers/no_hz.html,
> CONFIG_NO_HZ=y should be replaced by CONFIG_NO_HZ_IDLE=y for newer
> kernels, so let's reflect that in the 32-bit ARM defconfigs.

Applied to arm/defconfig, thanks!

[1/1] ARM: configs: replace CONFIG_NO_HZ=y with CONFIG_NO_HZ_IDLE=y
      commit: 5b8e894163bedd81dacdf517a6aa49625aa98d1f

       Arnd
