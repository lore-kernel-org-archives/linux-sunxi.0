Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD37B13AE8
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70BA2F4;
	Mon, 23 Oct 2023 06:26:06 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AF6D3F762;
	Mon, 23 Oct 2023 06:25:24 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Okhunjon Sobirjonov <okhunjon72@gmail.com>
Subject: [PATCH v3 15/24] Kconfig: sunxi: prepare for using drivers/ram/sunxi
Date: Mon, 23 Oct 2023 14:24:40 +0100
Message-Id: <20231023132449.813863-16-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023132449.813863-1-andre.przywara@arm.com>
References: <20231023132449.813863-1-andre.przywara@arm.com>
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

The RISC-V D1(s) SoCs will probably use SPL_DM, so for that SoC this
would be the right directory anyway.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/ram/Kconfig       | 3 ++-
 drivers/ram/sunxi/Kconfig | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ram/sunxi/Kconfig

diff --git a/drivers/ram/Kconfig b/drivers/ram/Kconfig
index bf999645774..5b07e920301 100644
--- a/drivers/ram/Kconfig
+++ b/drivers/ram/Kconfig
@@ -109,8 +109,9 @@ config IMXRT_SDRAM
 
 source "drivers/ram/aspeed/Kconfig"
 source "drivers/ram/cadence/Kconfig"
+source "drivers/ram/octeon/Kconfig"
 source "drivers/ram/rockchip/Kconfig"
 source "drivers/ram/sifive/Kconfig"
 source "drivers/ram/stm32mp1/Kconfig"
-source "drivers/ram/octeon/Kconfig"
 source "drivers/ram/starfive/Kconfig"
+source "drivers/ram/sunxi/Kconfig"
diff --git a/drivers/ram/sunxi/Kconfig b/drivers/ram/sunxi/Kconfig
new file mode 100644
index 00000000000..d7cf84c39a3
--- /dev/null
+++ b/drivers/ram/sunxi/Kconfig
@@ -0,0 +1,6 @@
+config DRAM_SUN20I_D1
+	bool
+	depends on ARCH_SUNXI
+	help
+	  This enables support for the DRAM controller driver covering
+	  the Allwinner D1/R528/T113s SoCs.
-- 
2.25.1

