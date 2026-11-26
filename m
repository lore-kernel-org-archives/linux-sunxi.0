Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653609;
	b=CcINBBX1g3Hu2p8zpnGSrjCRh7kggbgKJsifWdm3i1QAAhJcRQ1qSTM4JBjOYM3JJm+k
	 OmL9/cT/q0dGEdJr0vHvJ9mjFzKO9xk1XJsRonrDZ61V7rE6fB+gCBkpjvHKfQOc6klpr
	 8DM8PTUXzjCybvbj5Z0WfQICBrcRF5veqsPSQboSwu6a/KLqBuDOYUeixiDWtZKWRFycP
	 8o4OHLwufY+RJ2ub2lLCprk4IQzMr2cF4lm7NOaMNY2VbiOy2ou3tMw+zRqzz761AmrTd
	 8HINp5YXMC9W/8He30wgHx0hTpR9xHUOLBM1h9xJsqOUlA49ROMediudT5CYaPKlUgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653609;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=dQm7LikkEBfw+B+30vtpusJDOLGfvvT4vrOt4kNA/ro=;
	b=kbEGguHAJB5KjJ4/G7waIPr5CBoGR6eeV3pFKQjiHFVm83MEncvFcceAPQgOJ0rt1tvl
	 pzySi3+tcw/Teb5kj44bXP0Gr8HQecST6i50D+mnIMKYnuGBZhTEWTHW82vftnxQvSJUC
	 5YDkgnz/vMgPhfI7kzaAjVMyJVJKuUriUUUgismKmMStvqlILsAFa0j1m+UDOqtBQU+V/
	 6Br4S7ZQ0Mg+RFIAqNnIcWxs8dybTxpJEUvupwtpSixX3dIvPNJ67wqp1lYAG/zc/4qRE
	 Lf9/UtkA9TLYb0CPNE3F9ZD5xEDaFWOCmSlM+NVjnjj5pYVFlJarjn5n3z5v+CF6wjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLszMzLw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB936606A337;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLszMzLw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA541F000C6;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653609;
	bh=dQm7LikkEBfw+B+30vtpusJDOLGfvvT4vrOt4kNA/ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MLszMzLw+jzjvra04ywRzp1QJWuOntXAHvCjzCxa1FBbYR8paD1DpYZmVkCy0tc5t
	 NlG2gcGOyVqA3RIfIEM+zaLu76C1Dkh/WcCYlALdDyIxA7iijjM7IrmJn/reFdELcC
	 XuWTwtjulRB0Q/Do96Yt9NvXESAHj4cIvxla0d8uc1KwOvdWVV/0Z5Jzinq231oH2+
	 fiiNi54+LGPwIw76rWl/l9OHAW4FEwKe95YTAZbI3m+ItG78954SegDAUuRR8xcY04
	 RJI6DMiHFyseI80WPu2m4xHHAq8EuXMaOTATc3IHK4PRdBdorgSMY6gNGe6ombmyvZ
	 LU4Dejv7shBHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7750E3809A24;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-sun8i: enable Flow
 Control
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565360801.1416723.7797795365715043690.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:40:08 +0000
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Sun, 22 Nov 2026 15:49:22 +0100 you wrote:
> While running the "ethtool -t" selftests on H2+ (orangepi zero), the
> Flow Control selftests consistently fails.
> 
> I originally blamed that on the fact that the board was connected to a
> peer that didn't support Pause and that we didn't negotiate Pause at all.
> 
> The ethtool selftest are sensitive to what the Peer advertises even
> though this is a full loopback test, but it is what it is :(
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately
    https://git.kernel.org/netdev/net-next/c/1e38a237abdf
  - [net-next,2/3] net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
    https://git.kernel.org/netdev/net-next/c/22fc89783468
  - [net-next,3/3] net: stmmac: dwmac-sun8i: configure the pause time for TX flow control
    https://git.kernel.org/netdev/net-next/c/24276dd35154

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


