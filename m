Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CB2F2C
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Jan 2023 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88490C433F0;
	Sun,  1 Jan 2023 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672585215;
	bh=AdABbiK8La2IZNdmjy2lEpsrgzzj+C1zEfL7CbSljFA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kFMVwgGyPp8rTiEKwPkqUjO7cXoXJIRtYWe5AUHgdYU566ZRG0FfcdDPaUuXueOFb
	 E5T1A9RS0WDCjsYwo7bG6T9Q2mZtQfpREMcXSGHvWExXObKqavxiNWTSBnn5wj9H/G
	 AaM+/wbuHNq2QdbnCmHF7ZKxoN9eU30Ti3fK4o9i+JD9LiZDklv6DIyAqQMwTsFNSP
	 4530jmGBaY9AVrcR3KeSXlbV8niiydzIvD9cz4zSf8I5b0+b+cjK9DdXZbCyitSDUI
	 TeLy72z103WdrLIB4icAJzZR07mOT9V0FMtDyWGR9I1XRu19fa65Y5zERaYkkMa2Sc
	 fNE6lXn70gLFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E49BC197B4;
	Sun,  1 Jan 2023 15:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH net v2] dt-bindings: net: sun8i-emac: Add phy-supply
 property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167258521544.10293.9609750669288869867.git-patchwork-notify@kernel.org>
Date: Sun, 01 Jan 2023 15:00:15 +0000
References: <20221231220546.1188-1-samuel@sholland.org>
In-Reply-To: <20221231220546.1188-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, andre.przywara@arm.com, wens@csie.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 clabbe.montjoie@gmail.com, mripard@kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 31 Dec 2022 16:05:46 -0600 you wrote:
> This property has always been supported by the Linux driver; see
> commit 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i"). In fact, the
> original driver submission includes the phy-supply code but no mention
> of it in the binding, so the omission appears to be accidental. In
> addition, the property is documented in the binding for the previous
> hardware generation, allwinner,sun7i-a20-gmac.
> 
> [...]

Here is the summary with links:
  - [RESEND,net,v2] dt-bindings: net: sun8i-emac: Add phy-supply property
    https://git.kernel.org/netdev/net/c/a3542b0ccd58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


