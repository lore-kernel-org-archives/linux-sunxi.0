Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D803468F
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 21:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE488C433C1;
	Sun, 18 Sep 2022 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663536598;
	bh=YpmBPo+pKf43YdbJJrBAyrUA37x0u/KOh/wb/tvdmCo=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=aGwKOE1BH4+x049gJ0s98QtRWSQ3PLKJK1qH9Ej192goWkx3HQy4yoU9fzhihhJ1V
	 ytq/yckFi5TaFPSjrAi6ZHY8UQzi3Xh00PPa0zLTY91xGJJcQvbDAje4XKc3USBWQB
	 QFD+q0o1fuOh/q9Sn8b2d193HvU+Mo0gRszOdr/rr6997Dro3fyNM8XErgh0h9/jfu
	 p6DBgllMb5i187Aigau1TQio5Fo8WD4Mc3QqHFiKlZHkLJ86yTy38Jj/vs+Lwv4U11
	 T7kod8EwxH5afavFvi/ilBR2arKWMFV6F2Y2YZy1bhFunXzsSyZ3z8vGRKLoFmNmzl
	 MbuRFuRmchOEQ==
Date: Sun, 18 Sep 2022 23:29:54 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers fixes for 6.0
Message-ID: <YyeN0m78+m9nNEah@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following driver fixes for 6.0.

Best regards,
Jernej

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-fixes-for-6.0-1

for you to fetch changes up to e3c95edb1bd8b9c2cb0caa6ae382fc8080f6a0ed:

  soc: sunxi: sram: Fix debugfs info for A64 SRAM C (2022-09-08 22:28:42 +0200)

----------------------------------------------------------------
sunxi SRAM controller fixes for
- loading/unloading
- claiming regions
- debugfs info

----------------------------------------------------------------
Samuel Holland (4):
      soc: sunxi: sram: Actually claim SRAM regions
      soc: sunxi: sram: Prevent the driver from being unbound
      soc: sunxi: sram: Fix probe function ordering issues
      soc: sunxi: sram: Fix debugfs info for A64 SRAM C

 drivers/soc/sunxi/sunxi_sram.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)
