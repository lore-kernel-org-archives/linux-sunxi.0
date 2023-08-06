Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC35696
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 18:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F23FC433C8;
	Sun,  6 Aug 2023 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691345092;
	bh=R0jDL4VOB0TXPVk/kSGZ4LYNLUyti/l/sAW8hldzcVA=;
	h=Date:From:To:Cc:Subject:From;
	b=X5hU+HF8LxTPLv0BQ68yEug0sO7ancxlbLtKJOeu6GocVAIwDh5eq3CsoqdhIsCZY
	 9lFdHV5YCBLXt1T2Iq70BIqxZzBvEd/s/bPbmxKCqkMP5wFoBkUn0RhnrMRpJdEs+4
	 2E134csHeStAqXp1Oa2RXthxUGGrsAgapOZare/Nr5MeukGvs5CEXMSlkkpPsl6DAs
	 XME2KA6sMJfEE6vEn4uj8Qgo1vWk9CYWu0c9ySTbHw6ZYLf6/LhFVWrcdFlevn8SqN
	 KswWpcsEUAV0tlM2Ays2xoxeJhGRoivWUEmrUOOadE63k0d6bPWag00mufRCJ+hGSh
	 G/wKgWpBKqJtg==
Date: Sun, 6 Aug 2023 20:04:48 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.6
Message-ID: <20230806180448.GA126918@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.6.

Best regards,
Jernej

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.6-1

for you to fetch changes up to 075d9ca5b4e17f84fd1c744a405e69ec743be7f0:

  clk: sunxi-ng: Modify mismatched function name (2023-07-31 00:52:36 +0200)

----------------------------------------------------------------
- Convert sun9i-mmc clock to use devm_platform_get_and_ioremap_resource()
- Fix function name in a comment in ccu_mmc_timing.c

----------------------------------------------------------------
Yangtao Li (1):
      clk: sunxi: sun9i-mmc: Use devm_platform_get_and_ioremap_resource()

Zhang Jianhua (1):
      clk: sunxi-ng: Modify mismatched function name

 drivers/clk/sunxi-ng/ccu_mmc_timing.c |  2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c     | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)
