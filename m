Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0024468F
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 21:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AC8C433D6;
	Sun, 18 Sep 2022 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663536826;
	bh=IGybAkUKTAeegT00+S/CFLvWR6vgrSiP6EdY3Y78Cg8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=PliAUkdYAtT6bZ/s4RBXU6bw9MUUaSGYL0pdcr4UZUOEsvSDThErsHV2en9ybNM3E
	 XZzdrne+3edMvsYNwK/kmaToANjdWLWmnTkLAHW+vByv/g62fWEuEl9c7+2TLndYQ0
	 Uhx6rqGdw4vy11Y/7BdfIqcO3gI4ldC6moMWU1uuc/qaeb9gT1N3P0Re0dxbM5CQ8I
	 uNrToU9oClLaXmuvJ4wBKi+Y6eym39g82J6gMFYyetQLRpPNiwUZEw9TJUO72Z2x/J
	 vDTC/ZJKSyY8WnDixA8YN5zAtKfEgssmQXGzTRsU9baWaOb0HDqxjw/4VPE2Mfpwc3
	 0fnwRiXmDLQ/Q==
Date: Sun, 18 Sep 2022 23:33:42 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers changes for 6.1
Message-ID: <YyeOthH4y8wy8A8R@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following driver changes for 6.1. Note that this PR is based
on top of sunxi-drivers-fixes-for-6.0-1.

Best regards,
Jernej

The following changes since commit e3c95edb1bd8b9c2cb0caa6ae382fc8080f6a0ed:

  soc: sunxi: sram: Fix debugfs info for A64 SRAM C (2022-09-08 22:28:42 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.1-1

for you to fetch changes up to 1f698cb11dd48ec5c430886f794953878e1ff016:

  soc: sunxi: sram: Add support for the D1 system control (2022-09-18 22:54:38 +0200)

----------------------------------------------------------------
sunxi SRAM driver changes:
- minor code refactor
- support for Allwinner D1

----------------------------------------------------------------
Samuel Holland (4):
      soc: sunxi: sram: Return void from the release function
      soc: sunxi: sram: Save a pointer to the OF match data
      soc: sunxi: sram: Export the LDO control register
      soc: sunxi: sram: Add support for the D1 system control

 drivers/soc/sunxi/sunxi_sram.c       | 53 +++++++++++++++++++++---------------
 include/linux/soc/sunxi/sunxi_sram.h |  2 +-
 2 files changed, 32 insertions(+), 23 deletions(-)
