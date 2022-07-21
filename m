Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E16AB3
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 21:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5B3C3411E;
	Thu, 21 Jul 2022 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658438608;
	bh=K0ItI/WHfLgQ+BjxViAN5tVcOFKHARnyVGVtzdq8OaM=;
	h=Date:From:To:Cc:Subject:From;
	b=KbvIaBBDiHDI1CnXeVwsIfPC2RHjCUvWPpZ2OuI0pL/UBEXlMpvI0F02WXqDuEhpK
	 inngNMs/ola/WcYJYJwD2itqHbYlphZo62pzmpZJ5cwMOO2IY3JKuRtqtHCMsnQ9b3
	 RASBROwNrvvJ80FLiyGwoW5IMZC66Fk6c07uSc9bNNL2hFNJ1YdAFIs/610aLCHKhy
	 5yKx7sE9ifx+B7C1wE7+cen+T6iaokq4HwqrLrwodUf+L9lCkhXDMA8sLQvBIbvaRc
	 RQEMh7NZnIbb/H8jqP06T3qiZWh6n38nvtiSgEHBuInnLUujg1VkUqhw1rXA1Po1K2
	 MGMzgdZynR86Q==
Date: Thu, 21 Jul 2022 23:23:23 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 5.19
Message-ID: <YtnDy29glGFDhqU1@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

As it turns out, commit 38d321b61bda ("clk: sunxi-ng: h6-r: Add RTC gate
clock"), queued for 5.19, introduced a bug. This bug is accidentally
fixed by commit e1c51d31befc ("clk: sunxi-ng: Deduplicate ccu_clks
arrays"), which is already queued for 5.20.

Although this commit as a fix is much bigger than it needs to be, I
still suggest that's fast tracked to 5.19. This will also avoid any
merge conflicts during merging material for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-5.19-1

for you to fetch changes up to 48e29e0f3be086a28a9384befa77d02a43be2f98:

  clk: sunxi-ng: Deduplicate ccu_clks arrays (2022-07-21 23:11:28 +0200)

----------------------------------------------------------------
Fix H6 RTC clock

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: Deduplicate ccu_clks arrays

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c |  16 +----
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c   |  79 ++++++-----------------
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c    | 113 +--------------------------------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c     |  40 +++---------
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  84 ++----------------------
 5 files changed, 40 insertions(+), 292 deletions(-)
