Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737717FC
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E55C4339C;
	Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679547618;
	bh=NPnB/UKnNUercF44HUDX/+E3dqZ3zJVMKeECg6m+d1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IsZJcdwN7BEzr41ZzVOxogP/fo9bLZra4v8eGb4EUa1bebhFu3AHFwAuHzM+uW3j4
	 FVEGqDpUtiyjsw6cxk/EY51PNCkW5TDrwdTjTsd51ePOQUek5onn2Tl45jGa/lPq7B
	 IrTXp0IXIZHn9lfxZ7RvJ23PQuYkYopnkYjMbLUUsMtjrHPdokfHMkQCvc4qPucy3i
	 87hhPSfaDMVrjblhVr9BbaSaj6CmkEPSrOyN5Fqm7vs01FRYrO2P4wqjGa7Gb80a6N
	 4bncUA09GxrPJxzloqiV5FOTNOtkvYP1pWr5dwyhHFQJHmeSVQfZaM7bnhYKVJbr9U
	 grdHl1qm9Jsfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A7FDE4F0D7;
	Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: Drop unneeded quotes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167954761809.22889.18341092686850307793.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 05:00:18 +0000
References: <20230320233758.2918972-1-robh@kernel.org>
In-Reply-To: <20230320233758.2918972-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, afaerber@suse.de,
 mani@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, joel@jms.id.au,
 andrew@aj.id.au, rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
 f.fainelli@gmail.com, appana.durga.rao@xilinx.com,
 naga.sureshkumar.relli@xilinx.com, wg@grandegger.com, mkl@pengutronix.de,
 michal.simek@xilinx.com, andrew@lunn.ch, olteanv@gmail.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, tobias@waldekranz.com,
 lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, richardcochran@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 krzysztof.kozlowski@linaro.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Mar 2023 18:37:54 -0500 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for bindings/net/can
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: Drop unneeded quotes
    https://git.kernel.org/netdev/net-next/c/3079bfdbda6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


