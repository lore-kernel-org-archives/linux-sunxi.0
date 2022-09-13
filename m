Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705596AAB
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:33:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54B901AED;
	Tue, 13 Sep 2022 16:33:50 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BD4B3F73B;
	Tue, 13 Sep 2022 16:33:42 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] sunxi: Kconfig: use SoC-wide values for some symbols
Date: Wed, 14 Sep 2022 00:32:16 +0100
Message-Id: <20220913233217.24717-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220913233217.24717-1-andre.przywara@arm.com>
References: <20220913233217.24717-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some configuration symbols formerly defined in header files were
recently converted to Kconfig symbols. This moved their value definition
into *every* defconfig file, even though those values are hardly board
choices.
Use the new Kconfig option to define per-SoC default values, in just one
place, which makes the definition in each defconfig file redundant.

We refrain from setting a sunxi specific value for CONFIG_SYS_BOOTM_LEN,
so this defaults to a much better 64MB for uncompressed arm64 kernels.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 cmd/Kconfig        | 1 +
 common/spl/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 0e0be94f41f..2c5f91f8446 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -86,6 +86,7 @@ config SYS_CBSIZE
 
 config SYS_PBSIZE
 	int "Buffer size for console output"
+	default 1024 if ARCH_SUNXI
 	default 1044
 
 config SYS_XTRACE
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index 70d97815f0a..ccf00fc7950 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -80,6 +80,7 @@ config SPL_MAX_SIZE
 	default 0x10000 if ARCH_MX6 && !MX6_OCRAM_256KB
 	default 0x7fa0 if SUNXI_SRAM_ADDRESS = 0x10000
 	default 0x7fa0 if SUNXI_SRAM_ADDRESS = 0x20000 && !MACH_SUN50I_H616
+	default 0xbfa0 if MACH_SUN50I_H616
 	default 0x7000 if RCAR_GEN3
 	default 0x5fa0 if SUNXI_SRAM_ADDRESS = 0x0
 	default 0x10000 if ASPEED_AST2600
@@ -352,6 +353,11 @@ config SPL_STACK
 	default 0x946bb8 if ARCH_MX7
 	default 0x93ffb8 if ARCH_MX6 && MX6_OCRAM_256KB
 	default 0x91ffb8 if ARCH_MX6 && !MX6_OCRAM_256KB
+	default 0x118000 if MACH_SUN50I_H6
+	default 0x58000 if MACH_SUN50I_H616
+	default 0x54000 if MACH_SUN50I || MACH_SUN50I_H5
+	default 0x18000 if MACH_SUN9I
+	default 0x8000 if ARCH_SUNXI
 	help
 	  Address of the start of the stack SPL will use before SDRAM is
 	  initialized.
-- 
2.35.3

