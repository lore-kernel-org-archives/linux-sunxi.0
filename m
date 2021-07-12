Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F3172
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 10:07:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF64AD6E;
	Mon, 12 Jul 2021 03:07:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4E823F694;
	Mon, 12 Jul 2021 03:07:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Sunil Mohan Adapa <sunil@medhas.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [RESEND PATCH v2 3/3] sunxi: defconfig: enable eMMC boot partition support
Date: Mon, 12 Jul 2021 11:06:51 +0100
Message-Id: <20210712100651.6912-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210712100651.6912-1-andre.przywara@arm.com>
References: <20210712100651.6912-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Now that the SPL can safely detect whether it was loaded from an eMMC
boot partition or the normal user data partition, let's enable this
feature on some boards that feature eMMC storage.

That covers the boards where I could test this on, and allows the same
build to be written to an SD card, eMMC user partition, eMMC boot
partition, or into SPI NOR flash.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---

(resent to also include forgotten U-Boot list)

 configs/bananapi_m64_defconfig             | 1 +
 configs/emlid_neutis_n5_devboard_defconfig | 1 +
 configs/pine64-lts_defconfig               | 1 +
 configs/pine_h64_defconfig                 | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 292044d7b8b..0c0117e3c14 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -6,6 +6,7 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SUPPORT_EMMC_BOOT=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/emlid_neutis_n5_devboard_defconfig b/configs/emlid_neutis_n5_devboard_defconfig
index e2d3b1397e2..586f0f031aa 100644
--- a/configs/emlid_neutis_n5_devboard_defconfig
+++ b/configs/emlid_neutis_n5_devboard_defconfig
@@ -7,4 +7,5 @@ CONFIG_DRAM_CLK=408
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SUPPORT_EMMC_BOOT=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/pine64-lts_defconfig b/configs/pine64-lts_defconfig
index 6209e68e2d1..b3727009d73 100644
--- a/configs/pine64-lts_defconfig
+++ b/configs/pine64-lts_defconfig
@@ -8,6 +8,7 @@ CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine_h64_defconfig b/configs/pine_h64_defconfig
index 4e621db0c03..75f49fc81d1 100644
--- a/configs/pine_h64_defconfig
+++ b/configs/pine_h64_defconfig
@@ -7,6 +7,7 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MACPWR="PC16"
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_USB3_VBUS_PIN="PL5"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_PSCI_RESET is not set
-- 
2.17.5

