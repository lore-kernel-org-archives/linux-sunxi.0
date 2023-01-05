Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBB77B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 02:06:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBEF01063;
	Wed,  4 Jan 2023 18:07:21 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD8AB3F663;
	Wed,  4 Jan 2023 18:06:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: f1c100s: re-enable SYSRESET
Date: Thu,  5 Jan 2023 02:04:51 +0000
Message-Id: <20230105020451.19256-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC .dtsi originally submitted for the Allwinner F1C100s had the
wrong compatible string for the watchdog, which broke U-Boot's reset
functionality. To quickly fix this, we disable CONFIG_SYSRESET in
cfcf1952c11e6ffcbbf88 ("sunxi: f1c100s: Drop SYSRESET to enable reset
functionality"), so that U-Boot's hardcoded reset driver could take over.

After this was properly fixed in the devicetree, we reverted that patch
in 92373de041ea ("Revert "sunxi: f1c100s: Drop SYSRESET to enable reset
functionality"), however this line sneaked back in with d0ee7f295d74
("Convert CONFIG_SYS_PBSIZE to Kconfig"), so during a Kconfig update.

Remove this line (again), to use the proper reset driver.

Fixes: d0ee7f295d74 ("Convert CONFIG_SYS_PBSIZE to Kconfig")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this is not critical (so nothing for 2023.01), reset works either way.
But we should fix it anyway.

Cheers,
Andre

 configs/licheepi_nano_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index 12a43c1ec10..b25c9ba77cc 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -10,4 +10,3 @@ CONFIG_SPL_SPI_SUNXI=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SPI_FLASH_XTX=y
 CONFIG_SPI=y
-# CONFIG_SYSRESET is not set
-- 
2.35.5

