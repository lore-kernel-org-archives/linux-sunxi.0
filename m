Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866A3FC1
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Sep 2021 10:40:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 303E56113E;
	Wed,  8 Sep 2021 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631097608;
	bh=cwGwpyPgGjtx7N76e9aQnnpNpHqqVis1mt5jprqX9iU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K6NjXNn4YUQK9alkY5m/RmXF4/egz6y1fS1/BZg58O82ZvI0QPwtdUAc6//NFhSWd
	 q/5uAFr0NgWLuhniY722XjUE5xHjk32ybHKy+8NF1kAx5eHto1Z4Kn8CGduAaL1tmb
	 oOy8wo4edVNq13SKlr3696Ihb3W8LJ6BN/BISIh0Gkm/Yy70WRbQcJiJPaNG9fegsi
	 J0ueU1p9lG7rOm93IbFy/AFcegZn7Twi3RIEqvdjvVdHrdPHNFbSW0u9KTRlFBT/nO
	 pt0pOFkHvB9sgwZ5lm5FJi5OD16b/vuoH1LgzLZhS8jX8fM46j+FXnHFNLiGw5zsGr
	 4hwVoJmdfMcCg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2A10860A6D;
	Wed,  8 Sep 2021 10:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: sun8i-emac: Add compatible for D1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163109760816.16056.7636731189140150415.git-patchwork-notify@kernel.org>
Date: Wed, 08 Sep 2021 10:40:08 +0000
References: <20210908030240.9007-1-samuel@sholland.org>
In-Reply-To: <20210908030240.9007-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
Cc: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 guoren@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  7 Sep 2021 22:02:40 -0500 you wrote:
> The D1 SoC contains EMAC hardware which is compatible with the A64 EMAC.
> Add the new compatible string, with the A64 as a fallback.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - dt-bindings: net: sun8i-emac: Add compatible for D1
    https://git.kernel.org/netdev/net/c/0f31ab217dc5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


