Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC845696
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 18:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E18C433C8;
	Sun,  6 Aug 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691345214;
	bh=3NAzULMLz/dbSVkYQa36feJv4a4rNOOxzLUC+AXVVIM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=TlGP4JmSSx4V4twkd+dBJRqHQiK8czo5SxQGfWcE8HXDQNbfrRBnSLgHlBUyCSkn1
	 BUGI5UkX+VQj00ycT/HmzdPAgPzkyN2IQX7S4ugWne6gH/RhT0kpSmmjjicpIxy+f/
	 BABc6mC2Ks6rm//ee0w8n1EsLsFXlJ5kL3jqpD3OwJ3UoPl1AbiP9DWZn8/g4DGGZt
	 gbVL08hxD3qxDOPGvFnV8yIKZilTUv/Slk3mKQix+vFWtp/p5SkaqjsthSCbpvaMM9
	 /JkJ6dwU+NOIBTn4YsEQaErczAOt1LXyz3jve0D2rnbPLpc4GyTmZmfx4dzntZnAPv
	 0/SCZhIFUGosw==
Date: Sun, 6 Aug 2023 20:06:50 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers changes for 6.6
Message-ID: <20230806180650.GA127142@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following driver changes for 6.6.

Best regards,
Jernej

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.6-1

for you to fetch changes up to 23e9bf8e78ba2ed32e9bf5a37c5074b9dfc29110:

  soc: sunxi: Explicitly include correct DT includes (2023-08-06 13:41:08 +0200)

----------------------------------------------------------------
- simplify code in sunxi-rsb
- fix includes in sunxi_sram

----------------------------------------------------------------
Rob Herring (1):
      soc: sunxi: Explicitly include correct DT includes

Yangtao Li (1):
      bus: sunxi-rsb: Convert to devm_platform_ioremap_resource()

 drivers/bus/sunxi-rsb.c        | 4 +---
 drivers/soc/sunxi/sunxi_sram.c | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)
