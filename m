Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72073205
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 22:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E32C433EF;
	Fri, 27 Jan 2023 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674860384;
	bh=U3BOKzfZzIZB6JhfmPPDnEtV8wNN8Pi6WnecOmiii6k=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=MXPG6RNHnTtAOuWYIL0Q7RiJLIwVaxc2tSsR9Watol/UHBb1Zl23AFK+mucbc9XRg
	 pBK6K7lmiGjqP6Ifz/9/AyT17bszJhWGRh3oILogDgU7qrGhrRPTKOfa0lEc5Emyw8
	 51sjocHT5vl62K+RaidCVhE8hzBTLELK6ypza3xakdlJ/0AfMoS6V8sqUQ7YxA72Ww
	 v2rrOwHXUsHqm43W7mjvVEgQLQkBc1oLy3pxUwE9dUvztl8c1ny7hpJR9wwn8X9ft7
	 nTfKqaIUnnx6bSJtEOIhYZ3SvCgCuiz8cW1gY/DlFFYxvIfCEZb8cIgKZ3zojeolJO
	 DyHeSMmpngQRQ==
Date: Fri, 27 Jan 2023 23:59:40 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers changes for 6.3
Message-ID: <Y9RXXATRNqEv0GJT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following driver changes for 6.3.

Best regards,
Jernej

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.3-1

for you to fetch changes up to 0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d:

  soc: sunxi: Add Allwinner D1 PPU driver (2023-01-27 23:20:37 +0100)

----------------------------------------------------------------
- introduce Allwinner PPU driver
- limit iteration in sram debugfs

----------------------------------------------------------------
Samuel Holland (3):
      soc: sunxi: sram: Only iterate over SRAM children
      dt-bindings: power: Add Allwinner D1 PPU
      soc: sunxi: Add Allwinner D1 PPU driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    |  54 ++++++
 drivers/soc/sunxi/Kconfig                          |   8 +
 drivers/soc/sunxi/Makefile                         |   1 +
 drivers/soc/sunxi/sun20i-ppu.c                     | 207 +++++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                     |   3 +
 .../dt-bindings/power/allwinner,sun20i-d1-ppu.h    |  10 +
 6 files changed, 283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
 create mode 100644 drivers/soc/sunxi/sun20i-ppu.c
 create mode 100644 include/dt-bindings/power/allwinner,sun20i-d1-ppu.h
