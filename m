Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891DE7B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 02:10:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 944411063;
	Wed,  4 Jan 2023 18:11:40 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B26F3F663;
	Wed,  4 Jan 2023 18:10:57 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	Icenowy Zheng <uwu@icenowy.me>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: f1c100s: Drop no-MMC hack
Date: Thu,  5 Jan 2023 02:09:08 +0000
Message-Id: <20230105020908.19534-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When support for the Allwinner F1C100s SoC was originally introduced,
its DT lacked any MMC nodes, which upset our sunxi-u-boot.dtsi overlay,
when it tried to add an alias to the SD card.  To quickly fix this back
then, we guarded that alias with a preprocessor macro.

Now the F1C100s family has gained MMC nodes, so we don't need the
special treatment anymore. Just remove this guard.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/sunxi-u-boot.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index 2028d5b6a90..e959eb2a405 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -12,9 +12,7 @@
 
 / {
 	aliases {
-#ifndef CONFIG_MACH_SUNIV
 		mmc0 = &mmc0;
-#endif
 #if CONFIG_MMC_SUNXI_SLOT_EXTRA == 2
 		mmc1 = &mmc2;
 #endif
-- 
2.35.5

