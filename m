Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12EA8F5A
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E53C165C;
	Wed, 12 Oct 2022 09:35:15 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BC303F766;
	Wed, 12 Oct 2022 09:35:07 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/6] sunxi: improve F1C200s support
Date: Wed, 12 Oct 2022 17:34:52 +0100
Message-Id: <20221012163458.1968900-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner F1C200s is reportedly the same chip as the F1C100s, just
with twice the amount of co-packaged DRAM: 64MB instead of just 32MB.
U-Boot's F1C100 platform supported this quite naturally (since the DRAM
size is auto-detected), but those better chips do not need to suffer
from the same memory constraints as their smaller siblings.

Patch 1/6 adds a notion of "minimum DRAM size" to Kconfig, so that we
can select those smaller sizes independently from the actual SoC. This
makes it easy to let the F1C200s use a more generous memory map, but
also paves the way for the T113-S3 and D1s, later.
Patch 2/6 uses the opportunity to improve the 32MB memory map, which was
not really practical, and arguably also somewhat buggy.
Patch 3/6 helps to keep the _defconfig files small, while patch 4+5 add
support for the console on UART1.
The final patch then adds a defconfig and .dts file for the CherryPi
F1C200s board, which is used as an example for a F1C200s board.

Please have a look and test, if possible.

Cheers,
Andre

Andre Przywara (6):
  sunxi: Kconfig: introduce SUNXI_MINIMUM_DRAM_MB
  sunxi: fix 32MB load address layout
  sunxi: f1c100: move SKIP_LOWLEVEL_INIT_ONLY into Kconfig
  sunxi: f1c100: add UART1 support
  sunxi: f1c100: dtsi: add UART1 pins
  sunxi: add CherryPi-F1C200s support

 Kconfig                                       |  6 +--
 .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++
 arch/arm/dts/suniv-f1c100s.dtsi               |  5 ++
 arch/arm/mach-sunxi/Kconfig                   | 14 ++++++
 arch/arm/mach-sunxi/board.c                   |  4 ++
 boot/Kconfig                                  |  4 +-
 configs/cherrypi_f1c200s_defconfig            | 11 +++++
 configs/licheepi_nano_defconfig               |  2 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  1 +
 include/configs/sunxi-common.h                | 49 ++++++++++---------
 10 files changed, 111 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
 create mode 100644 configs/cherrypi_f1c200s_defconfig

-- 
2.25.1

