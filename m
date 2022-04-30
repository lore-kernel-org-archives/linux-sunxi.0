Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0B1852
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 856F5C385AF;
	Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651286412;
	bh=gJ66qBEwi6fImRHOzmZNTdLhzaPPZUa4anUgFG2RYFM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qjRGdWUb2rVvisgnKlfUR8hwrLknIuM2HlB/jq5kkMqlo4jH7M2SQ86qXwvxRBxDp
	 cT6aJRFCezr7IuWaW5NhqO9GLf85a5vwKjQFZnh73KGQu5SRqQcnjw+ydeCyJK1Iaa
	 TBVeYEOGK/B0ZiO4wLz15EwzkGGvB8vIdzdHrCBgWpkjJz80B7ZLOJjd+qI9JuLNJb
	 4A5CmZGxEx0+7fQFRQsffMU9mJdJKqEbDLENWQKPaeK5r6h0R2IVjL8jDiSdK+7Kpu
	 g2SJThl9mCvCa+IIGhWyMhDhiR86JdgxjMgJp0yglmx2YZ1XhDWp41pazUBpcRGnbv
	 8ex6IqJ2d9ayQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5FBCBF03847;
	Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: dwmac-sun8i: add missing of_node_put() in
 sun8i_dwmac_register_mdio_mux()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165128641238.32243.12546342277289932199.git-patchwork-notify@kernel.org>
Date: Sat, 30 Apr 2022 02:40:12 +0000
References: <20220428095716.540452-1-yangyingliang@huawei.com>
In-Reply-To: <20220428095716.540452-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, clabbe.montjoie@gmail.com,
 andrew@lunn.ch, davem@davemloft.net, kuba@kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 28 Apr 2022 17:57:16 +0800 you wrote:
> The node pointer returned by of_get_child_by_name() with refcount incremented,
> so add of_node_put() after using it.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-sun8i: add missing of_node_put() in sun8i_dwmac_register_mdio_mux()
    https://git.kernel.org/netdev/net/c/1a15267b7be7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


