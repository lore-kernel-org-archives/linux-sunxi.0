Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4A317F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92ED8101E;
	Mon, 24 May 2021 16:30:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 586013F73D;
	Mon, 24 May 2021 16:30:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/8] mmc: sunxi: Enable "new timing mode" on all new SoCs
Date: Tue, 25 May 2021 00:30:26 +0100
Message-Id: <20210524233029.16417-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

All SoCs since the Allwinner A64 (H5, H6, R40, H616) feature the so
called "new timing mode", so enable this in Kconfig for those SoCs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index bc8509b72a2..b8abe2fefa9 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -152,6 +152,7 @@ config SUN50I_GEN_H6
 	bool
 	select FIT
 	select SPL_LOAD_FIT
+	select MMC_SUNXI_HAS_NEW_MODE
 	select SUPPORT_SPL
 	---help---
 	Select this for sunxi SoCs which have H6 like peripherals, clocks
@@ -297,6 +298,7 @@ config MACH_SUN8I_R40
 	select CPU_V7_HAS_VIRT
 	select ARCH_SUPPORT_PSCI
 	select SUNXI_GEN_SUN6I
+	select MMC_SUNXI_HAS_NEW_MODE
 	select SUPPORT_SPL
 	select SUNXI_DRAM_DW
 	select SUNXI_DRAM_DW_32BIT
@@ -346,6 +348,7 @@ config MACH_SUN50I_H5
 	bool "sun50i (Allwinner H5)"
 	select ARM64
 	select MACH_SUNXI_H3_H5
+	select MMC_SUNXI_HAS_NEW_MODE
 	select FIT
 	select SPL_LOAD_FIT
 
-- 
2.17.5

