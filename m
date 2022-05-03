Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2877533C9
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0799212FC;
	Tue,  3 May 2022 14:21:10 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8513FA53;
	Tue,  3 May 2022 14:21:08 -0700 (PDT)
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
Subject: [PATCH 6/7] Revert "sunxi: f1c100s: Drop SYSRESET to enable reset functionality"
Date: Tue,  3 May 2022 22:20:39 +0100
Message-Id: <20220503212040.27884-7-andre.przywara@arm.com>
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

The original Allwinner F1C100 .dtsi imported from the Linux kernel tree
used the wrong compatible string for the watchdog timer, so the Allwinner
DM reset driver was not working properly. We worked around this by
disabling the SYSRESET driver, so the hardcoded SPL reset driver took
over.
Now the issue was fixed in the DTs in mainline Linux, and we synced the
fixed .dtsi file into U-Boot, so drop the hack and use the normal U-Boot
proper reset infrastructure.

This reverts commit cfcf1952c11e6ffcbbf88eb63c49edca2acf1d5e.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/licheepi_nano_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index 67b7b85c491..9fd1dcc9958 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -10,4 +10,3 @@ CONFIG_DRAM_CLK=156
 CONFIG_DRAM_ZQ=0
 # CONFIG_VIDEO_SUNXI is not set
 CONFIG_SPL_SPI_SUNXI=y
-# CONFIG_SYSRESET is not set
-- 
2.35.3

