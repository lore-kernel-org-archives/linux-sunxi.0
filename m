Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6E18B0E;
	Mon, 12 Jun 2023 10:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CB2FC4339E;
	Mon, 12 Jun 2023 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686564020;
	bh=fd4cfXXX+PL9XfONOIfuuKx40StrUtxc6WwcSiy9Q0U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iySDKzKjo2ln1pXfyHGboc5hcwaLHVMvCWUke2VRF5bgeoX98N71gYZkCcHpHo/Zr
	 KPXU4P/6SiL1aZdnNOy+dMEtBittCA7FO5pGdj4YH54c/HLZs7RlNgAyn1qc/qfzzt
	 Cm8zkDen8zagaz1Nt2NgpioXY8ewXECKmWDnuYmI/EE2sGKXJH38KiRxJ0ZmCKRue9
	 BU+uf24apUEiKt3nzSzAzVg/caXGfR3XPr3yGXH/Us6xx6O15PeasrAGDFBnCegy+r
	 sYCMX8FiKWa/abOjyjfkAc5t3rLogATn0XxT3eF4PP6h2YEkHUMYKFU8aDuSfh0sRU
	 knDZCcGbLYRJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D81D1C395EC;
	Mon, 12 Jun 2023 10:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: drop unneeded quotes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168656401987.30960.9087751436682057307.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jun 2023 10:00:19 +0000
References: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, opendmb@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, heiko@sntech.de,
 nobuhiro1.iwamatsu@toshiba.co.jp, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mripard@kernel.org,
 vineetha.g.jaya.kumaran@intel.com, biao.huang@mediatek.com,
 xiaoning.wang@nxp.com, david.wu@rock-chips.com, grygorii.strashko@ti.com,
 nsekhar@ti.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri,  9 Jun 2023 16:07:12 +0200 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml     | 2 +-
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 2 +-
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml   | 2 +-
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml     | 2 +-
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml        | 4 ++--
>  .../devicetree/bindings/net/toshiba,visconti-dwmac.yaml       | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - dt-bindings: net: drop unneeded quotes
    https://git.kernel.org/netdev/net-next/c/61ab5a060a57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


