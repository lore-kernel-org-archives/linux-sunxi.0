Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CED7C
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 00:24:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6032F4;
	Tue, 13 Dec 2022 16:25:21 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72E453F71E;
	Tue, 13 Dec 2022 16:24:39 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/4] sunxi: minor cleanups and refactoring
Date: Wed, 14 Dec 2022 00:22:40 +0000
Message-Id: <20221214002244.31479-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a collection of patches I came up with while trying to refactor and
reorganise the Allwinner SPL code.
Patch 1/4 aims to replace Tom's patch [1], which made
CONFIG_MMC_SUNXI_SLOT a proper Kconfig variable. A closer inspection
reveals that we don't really need that at all.
Patch 2 and 3 are just random cleanups.
Patch 4 is a low hanging fruit in the effort to separate ARM specific
code from strictly Allwinner platform routines. It also removes some
#ifdef's.

Please have a look!

Cheers,
Andre

[1] https://lore.kernel.org/u-boot/20221127152536.1556469-6-trini@konsulko.com/

Andre Przywara (4):
  sunxi: remove unused CONFIG_MMC_SUNXI_SLOT
  sunxi: remove bogus mmc_pinmux_setup() prototype
  sunxi: board: annotate #endif lines
  sunxi: move arch timer setup out of board/ directory

 arch/arm/mach-sunxi/Makefile      |  4 +++
 arch/arm/mach-sunxi/arch_timer.c  | 39 +++++++++++++++++++++
 arch/arm/mach-sunxi/board.c       | 22 +++++++-----
 arch/arm/mach-sunxi/clock_sun6i.c |  4 +--
 board/sunxi/board.c               | 58 +++++++------------------------
 include/configs/sunxi-common.h    |  3 --
 scripts/config_whitelist.txt      |  1 -
 7 files changed, 72 insertions(+), 59 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/arch_timer.c

-- 
2.35.5

