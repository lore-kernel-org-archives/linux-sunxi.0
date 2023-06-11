Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687791641D
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B791FB;
	Sun, 11 Jun 2023 16:34:11 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD54F3F663;
	Sun, 11 Jun 2023 16:33:23 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Sam Edwards <cfsworks@gmail.com>,
	=?UTF-8?q?=E8=B7=AF=E8=BE=89?= <luhux76@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/7] phy: sun4i: Allwinner F1C100s/H616 support and cleanup
Date: Mon, 12 Jun 2023 00:32:34 +0100
Message-Id: <20230611233241.14235-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

version 2 of this series does not change anything in the first three
patches adding F1C100s support (apart from adding Jernej's review tags,
many thanks for that!), but also adds support for the H616 USB PHY.
This is a bit more involved this time, since the USB PHY on this SoC
requires some weird quirk to enable most ports. Along with this it adds
some cleanup that we used in the Linux driver, which helps to keep the
code clean and simplifies future support.

Patch 1/7 fixes a bug that prevented the V3s from being supported, and
also affects the F1C100s. Patch 2/7 adds the compatible string for the
F1C100s, along with its specific properties. Patch 3/7 uses the
opportunity to cleanup the U-Boot Kconfig selection of the sunxi USB
PHY, and patch 4/7 continues the spring clean with copying some PHY
quirk rework done in the Linux kernel recently.
The remaining three patches then deal with the H616 USB PHY: patch 5 adds
the quirk support, patch 6 wires up the compatible string, while the
final patch enables USB support in the defconfig of the two supported
boards.

Please have a look and test!

Cheers,
Andre

Andre Przywara (7):
  phy: sun4i-usb: Fix of_xlate() argument check
  phy: sun4i-usb: add Allwinner F1C100s support
  sunxi: Kconfig: rework PHY_USB_SUN4I selection
  phy: sun4i-usb: Replace types with explicit quirk flags
  phy: sun4i-usb: Add H616 USB PHY quirk support
  phy: sun4i: Add H616 USB PHY support
  sunxi: H616: enable USB support for H616 boards

 arch/arm/mach-sunxi/Kconfig           |  11 ---
 configs/orangepi_zero2_defconfig      |   3 +
 configs/x96_mate_defconfig            |   2 +
 drivers/phy/allwinner/Kconfig         |   5 +-
 drivers/phy/allwinner/phy-sun4i-usb.c | 111 ++++++++++++++++++--------
 5 files changed, 88 insertions(+), 44 deletions(-)

-- 
2.35.8

