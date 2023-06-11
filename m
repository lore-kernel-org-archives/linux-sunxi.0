Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E01EA8
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 201482F4;
	Sun, 11 Jun 2023 16:34:25 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A823F663;
	Sun, 11 Jun 2023 16:33:37 -0700 (PDT)
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
Subject: [PATCH v2 7/7] sunxi: H616: enable USB support for H616 boards
Date: Mon, 12 Jun 2023 00:32:41 +0100
Message-Id: <20230611233241.14235-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230611233241.14235-1-andre.przywara@arm.com>
References: <20230611233241.14235-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the PHY driver supports the H616 USB PHY, we can enable USB
support for the two H616 boards.
As the OrangePi Zero2 has a USB-C port hard-wired to peripheral mode,
let's enable USB gadget mode for port 0, so people can use fastboot,
ethernet or mass storage functionality.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/orangepi_zero2_defconfig | 3 +++
 configs/x96_mate_defconfig       | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 6cb942f511a..4178ee6a286 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -19,3 +19,6 @@ CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_MUSB_GADGET=y
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index 122c1a99e32..32ef0a42ee2 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -18,3 +18,5 @@ CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
 CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.35.8

