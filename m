Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02A6173
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Dec 2021 00:08:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1D0611FB;
	Wed,  8 Dec 2021 16:08:41 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF02D3F73D;
	Wed,  8 Dec 2021 16:08:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	5kft@5kft.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Simon Glass <sjg@chromium.org>
Subject: Pull request: u-boot-sunxi/master fixes for 2022.01
Date: Thu,  9 Dec 2021 00:06:50 +0000
Message-Id: <20211209000650.2446-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

please pull those two fixes from the sunxi tree.
This fixes two regressions: eMMC operation on boards with WiFi (so using
three MMC devices), and a repeated wrong error message in USB gadget
mode (fastboot, ums).

Thanks,
Andre

===========================
The following changes since commit 558002a0f2230bedf6b38716f3ed86a92fc9010b:

  Merge https://source.denx.de/u-boot/custodians/u-boot-riscv (2021-12-03 09:02:49 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to fbd9207e7fe3712b372ca9889a2a82402161fd27:

  sunxi: Remove misleading USB-OTG charger message (2021-12-08 23:07:15 +0000)

----------------------------------------------------------------
Andre Przywara (2):
      sunxi: dts: Fix typoed eMMC check
      sunxi: Remove misleading USB-OTG charger message

 arch/arm/dts/sunxi-u-boot.dtsi | 2 +-
 board/sunxi/board.c            | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)
