Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DEE3205
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 22:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACB9C433EF;
	Fri, 27 Jan 2023 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674860313;
	bh=gQ8vaQncjKOaKdDjatdbtt0SVCi9A+uFR2TXWoX9N2o=;
	h=Date:From:To:Cc:Subject:From;
	b=B+8+1oZiEaL5d79WLxWaWuSYdySY39QIZxt7dFQPqbLCqJcq8EXhiYTaHLuJ+EUK7
	 zacPRgTaZ3iVdszCc3MkaS+uD+ttpEkZIqMkorIr6GOy0lpBt8G7FT7ZEuq3prcOpa
	 0WQj4uRsb/0X9/CXmFl3X9aSYnV3FpssqfwAECfOijjs7IX59kSAb8MC/fEnFVEs72
	 7plFlR4U48zDvNv3XreZEkXyXTuQvI6s0iw+TPXMfEs5o9RBYOejka+NKBqUhu4fmQ
	 QxaK+FNPfuurVIFwWHsQk9oiEMyTHCSLteX0tjEa7+SlAKanUrmG1ROhjnzwaG2riK
	 uFJaReV1wLAWQ==
Date: Fri, 27 Jan 2023 23:58:29 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.3
Message-ID: <Y9RXFUH6URVE4LMG@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

Please pull following clock changes for 6.3.

Best regards,
Jernej

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.3-1

for you to fetch changes up to e6f2ffeaf58b23614cc818587aa3a4fc7c108a55:

  clk: sunxi-ng: d1: Add CAN bus gates and resets (2023-01-08 22:06:10 +0100)

----------------------------------------------------------------
- add D1 CAN bus gates and resets
- mark D1 CPUX clock as critical
- reuse D1 driver for R528/T113
- cleanup sunxi-ng kconfig
- fix sunxi-ng kernel-doc issues
- model H3/H5 DRAM clock as fixed clock

----------------------------------------------------------------
András Szemző (1):
      clk: sunxi-ng: d1: Mark cpux clock as critical

Fabien Poussin (1):
      clk: sunxi-ng: d1: Add CAN bus gates and resets

Randy Dunlap (1):
      clk: sunxi-ng: fix ccu_mmc_timing.c kernel-doc issues

Samuel Holland (6):
      clk: sunxi-ng: h3/h5: Model H3 CLK_DRAM as a fixed clock
      clk: sunxi-ng: Avoid computing the rate twice
      clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
      clk: sunxi-ng: Move SoC driver conditions to dependencies
      clk: sunxi-ng: d1: Allow building for R528/T113
      dt-bindings: clock: Add D1 CAN bus gates and resets

 drivers/clk/sunxi-ng/Kconfig              | 71 ++++++++++++++++---------------
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c      | 13 +++++-
 drivers/clk/sunxi-ng/ccu-sun20i-d1.h      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c       | 15 ++++---
 drivers/clk/sunxi-ng/ccu_mmc_timing.c     |  8 ++--
 drivers/clk/sunxi-ng/ccu_mp.c             | 11 ++---
 drivers/clk/sunxi-ng/ccu_nk.c             |  9 ++--
 drivers/clk/sunxi-ng/ccu_nkm.c            | 10 ++---
 drivers/clk/sunxi-ng/ccu_nkmp.c           | 10 ++---
 drivers/clk/sunxi-ng/ccu_nm.c             |  9 ++--
 include/dt-bindings/clock/sun20i-d1-ccu.h |  2 +
 include/dt-bindings/reset/sun20i-d1-ccu.h |  2 +
 12 files changed, 93 insertions(+), 69 deletions(-)
