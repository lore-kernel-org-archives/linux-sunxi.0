Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4C313AE8
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAE60C15;
	Mon, 23 Oct 2023 06:26:20 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E94E3F762;
	Mon, 23 Oct 2023 06:25:38 -0700 (PDT)
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
Subject: [PATCH v3 24/24] sunxi: add MangoPi MQ-R board support
Date: Mon, 23 Oct 2023 14:24:49 +0100
Message-Id: <20231023132449.813863-25-andre.przywara@arm.com>
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

The MangoPi MQ-R board uses an Allwinner T113s Soc (with 128MB of
embedded DRAM), support for which was just added to the code.

Since the devicetree was already synced from the latest Linux kernel
tree, all we need is a _defconfig file to add support for the board.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/Makefile          |  2 ++
 configs/mangopi_mq_r_defconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 configs/mangopi_mq_r_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 4569483d5fd..3a9b365de10 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -776,6 +776,8 @@ dtb-$(CONFIG_MACH_SUN8I_V3S) += \
 	sun8i-s3-pinecube.dtb \
 	sun8i-v3-sl631-imx179.dtb \
 	sun8i-v3s-licheepi-zero.dtb
+dtb-$(CONFIG_MACH_SUN8I_R528) += \
+	sun8i-t113s-mangopi-mq-r-t113.dtb
 dtb-$(CONFIG_MACH_SUN50I_H5) += \
 	sun50i-h5-bananapi-m2-plus.dtb \
 	sun50i-h5-emlid-neutis-n5-devboard.dtb \
diff --git a/configs/mangopi_mq_r_defconfig b/configs/mangopi_mq_r_defconfig
new file mode 100644
index 00000000000..66ae639326f
--- /dev/null
+++ b/configs/mangopi_mq_r_defconfig
@@ -0,0 +1,15 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun8i-t113s-mangopi-mq-r-t113"
+CONFIG_SPL=y
+CONFIG_MACH_SUN8I_R528=y
+CONFIG_DRAM_CLK=792
+CONFIG_DRAM_ZQ=8092667
+CONFIG_SUNXI_MINIMUM_DRAM_MB=128
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_DRAM_SUNXI_ODT_EN=0
+CONFIG_DRAM_SUNXI_TPR0=0x004a2195
+CONFIG_DRAM_SUNXI_TPR11=0x340000
+CONFIG_DRAM_SUNXI_TPR12=0x46
+CONFIG_DRAM_SUNXI_TPR13=0x34000100
+CONFIG_CONS_INDEX=4
-- 
2.25.1

