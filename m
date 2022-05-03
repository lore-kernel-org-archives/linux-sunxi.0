Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7643833C9
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BD4F12FC;
	Tue,  3 May 2022 14:21:12 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52D233FA53;
	Tue,  3 May 2022 14:21:10 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 7/7] sunxi: licheepi_nano: enable SPI flash
Date: Tue,  3 May 2022 22:20:40 +0100
Message-Id: <20220503212040.27884-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220503212040.27884-1-andre.przywara@arm.com>
References: <20220503212040.27884-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many LicheePi Nano boards come with SPI flash soldered, which already
works for booting the SPL and loading U-Boot proper.
With the updated DTB, we can now also use the SPI flash from U-Boot
proper, so enable the bits in the defconfig, to allow loading binaries
from SPI flash.
There seem to be board revisions with a Winbond SPI chip, but also
others with an XTX chip, so include support for both: the actual chip
used will be autodetected.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/licheepi_nano_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index 9fd1dcc9958..dfdc7d46855 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -10,3 +10,6 @@ CONFIG_DRAM_CLK=156
 CONFIG_DRAM_ZQ=0
 # CONFIG_VIDEO_SUNXI is not set
 CONFIG_SPL_SPI_SUNXI=y
+CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_SPI_FLASH_XTX=y
+CONFIG_SPI=y
-- 
2.35.3

