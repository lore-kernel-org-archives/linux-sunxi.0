Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3674A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19D9C34114;
	Thu, 14 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812705;
	bh=e6uOQSiiMmKGWMZhwDJkmBnPhx03MeAufyZNqA3dI5w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kgs9GC8K9jiYUHo2bk3nzSW4qANyh7pi2yzHZn2+Q4YTZI4n1FfRXX6aXIskkwMHw
	 XjAikf2jNUOOmLE7QDCvM66i7odfRAj28grHOIPydbcMahqWpnS1TBRoEcerNvVxJ4
	 ngq0MlkBLoMH0opbQluJtRcQL2p5PO8iYZCKLP2J89VZKxRhu0KXmxqR8Q3/RnvHxa
	 2Ti6OT6ciSSolh+3VOt+9Pb/FkMopI/6AHBGtwbcFDqIuCHLynBMVsbFhuKKzJcAOO
	 AgTwFrACSuuw2+htazAIc4cBc+gA1uLSZG4MgVGvohhZdNUbmhxjzCbjlMSFYCe9P0
	 1xlVdadNJtssg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner DT fixes for 5.19
Date: Thu, 14 Jul 2022 17:31:27 +0200
Message-Id: <165781258563.3193274.7144022791216312653.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YshiPKZRq6NHxPzO@kista.localdomain>
References: <YshiPKZRq6NHxPzO@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 18:58:36 +0200, Jernej Skrabec wrote:
> Please pull following DT binding fix for 5.19.
> 
> Best regards,
> Jernej
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 884b66976a7279ee889ba885fe364244d50b79e7

       Arnd
