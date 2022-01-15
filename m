Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CAA2C9C
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jan 2022 22:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C08C36AEC;
	Sat, 15 Jan 2022 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642286409;
	bh=CM/dcwr1T5eT7kHp/PEIguWwvyAkBSLmzeeBHvnaeI0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ettey1UYCiVK1B1C6dzZQupVWDuoqaO7OIOCLHFbkd9m4O5wzE/iH59O7s7r038Cn
	 QHtQgRqDcmHjzbb115HYzco1y11wOQJC+TUy7pl1YljQljSUVPxV3LQ7RzlerMzf/2
	 +NpBtnZXhakmdnx+8FVjUV0OF3wBNjneDWRS27MGqhWKo9+6iiCmylZI9Pu+YiNiwh
	 vOZcqYv6K+AJ49uhG5EuzbZ8IgTWSddcPM6mx14y5rUU/4eQSUH3/pMiHBGHXxuaoO
	 5iOQu6gY94hoo4g4Cu8HsQBcF1YtH3ebkLpqxHTzgCsoqq3t6urhJQdIwnwP8za//K
	 QRf2idOQLovIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D2D8F60796;
	Sat, 15 Jan 2022 22:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: sun4i-emac: Fix an error handling path in
 emac_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164228640957.24744.13688338637735089336.git-patchwork-notify@kernel.org>
Date: Sat, 15 Jan 2022 22:40:09 +0000
References: <aa2344da574f58aeba869a9219b3549dbd65d8e4.1642250684.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <aa2344da574f58aeba869a9219b3549dbd65d8e4.1642250684.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, conleylee@foxmail.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 15 Jan 2022 13:45:03 +0100 you wrote:
> A dma_request_chan() call is hidden in emac_configure_dma().
> It must be released in the probe if an error occurs, as already done in
> the remove function.
> 
> Add the corresponding dma_release_channel() call.
> 
> Fixes: 47869e82c8b8 ("sun4i-emac.c: add dma support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - net: ethernet: sun4i-emac: Fix an error handling path in emac_probe()
    https://git.kernel.org/netdev/net/c/9a9acdccdfa4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


