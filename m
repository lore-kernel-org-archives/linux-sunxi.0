Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D660937C
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jan 2023 01:19:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 891FA1515;
	Mon,  2 Jan 2023 17:20:20 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78F513F881;
	Mon,  2 Jan 2023 17:19:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 1/2] Kconfig: sunxi: prepare for using drivers/ram/sunxi
Date: Tue,  3 Jan 2023 01:17:54 +0000
Message-Id: <20230103011755.10756-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230103011755.10756-1-andre.przywara@arm.com>
References: <20230103011755.10756-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment all Allwinner DRAM initialisation routines are stored in
arch/arm/mach-sunxi, even though those "drivers" are just a giant
collection of writel's, without any architectural dependency.

The R528/T113-s SoC (with ARM cores) and the D1/D1s Soc (with RISC-V
cores) share the same die, so should share the same DRAM init routines as
well.

To prepare for this, add a new sunxi directory inside drivers/ram, and
add some stub entries to prepare for the addition of the share DRAM code
for those SoCs.

The RISC-V D1(s) SoCs will probably use SPL_DM, so make this entry
depend on that already.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/ram/Kconfig       |  3 ++-
 drivers/ram/sunxi/Kconfig | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ram/sunxi/Kconfig

diff --git a/drivers/ram/Kconfig b/drivers/ram/Kconfig
index 86857c06272..75ec6fa651b 100644
--- a/drivers/ram/Kconfig
+++ b/drivers/ram/Kconfig
@@ -97,7 +97,8 @@ config IMXRT_SDRAM
 	  This driver is for the sdram memory interface with the SEMC.
 
 source "drivers/ram/aspeed/Kconfig"
+source "drivers/ram/octeon/Kconfig"
 source "drivers/ram/rockchip/Kconfig"
 source "drivers/ram/sifive/Kconfig"
 source "drivers/ram/stm32mp1/Kconfig"
-source "drivers/ram/octeon/Kconfig"
+source "drivers/ram/sunxi/Kconfig"
diff --git a/drivers/ram/sunxi/Kconfig b/drivers/ram/sunxi/Kconfig
new file mode 100644
index 00000000000..97e261de542
--- /dev/null
+++ b/drivers/ram/sunxi/Kconfig
@@ -0,0 +1,13 @@
+config DRAM_SUN20I_D1
+	bool "DM DRAM driver support for Allwinner D1"
+	depends on RAM && ARCH_SUNXI
+	default y
+	help
+	  This enables support for DRAM drivers using the driver model
+	  for Allwinner SoCs.
+
+config DRAM_SUN8I_R528
+	bool "DRAM driver support for Allwinner R528/T113s"
+	default y if MACH_SUN8I_R528
+	help
+	  Select this DRAM controller driver for the R528/T113s SoCs.
-- 
2.35.5

