Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AF028EE
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B59E7165C;
	Wed, 12 Oct 2022 09:35:24 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35DA23F766;
	Wed, 12 Oct 2022 09:35:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/6] sunxi: add CherryPi-F1C200s support
Date: Wed, 12 Oct 2022 17:34:58 +0100
Message-Id: <20221012163458.1968900-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012163458.1968900-1-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CherryPi F1C200s board is a small development board, featuring the
F1C200s with 64MB of co-packaged DRAM. It comes with two USB-C sockets,
of which one is connected to a USB-UART chip, that provides easy access
to UART1.
Beside the usual micro-SD card slot, the board comes with a SPI NAND
flash chip, which is not yet supported.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../dts/suniv-f1c100s-cherrypi-f1c200s.dts    | 45 +++++++++++++++++++
 configs/cherrypi_f1c200s_defconfig            | 11 +++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
 create mode 100644 configs/cherrypi_f1c200s_defconfig

diff --git a/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
new file mode 100644
index 00000000000..f0ebcb6d893
--- /dev/null
+++ b/arch/arm/dts/suniv-f1c100s-cherrypi-f1c200s.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR X11)
+/*
+ * Copyright 2022 Arm Ltd.
+ * based on another DT, which is:
+ *   Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+/dts-v1/;
+#include "suniv-f1c100s.dtsi"
+
+/ {
+	model = "Cherry Pi F1C200s";
+	compatible = "lctech,cherrypi-f1c200s", "allwinner,suniv-f1c100s";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart1;
+		spi0 = &spi0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc3v3: vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&mmc0 {
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+	vmmc-supply = <&reg_vcc3v3>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pa_pins>;
+	status = "okay";
+};
diff --git a/configs/cherrypi_f1c200s_defconfig b/configs/cherrypi_f1c200s_defconfig
new file mode 100644
index 00000000000..306d363f485
--- /dev/null
+++ b/configs/cherrypi_f1c200s_defconfig
@@ -0,0 +1,11 @@
+CONFIG_ARM=y
+CONFIG_SYS_DCACHE_OFF=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-cherrypi-f1c200s"
+CONFIG_SPL=y
+CONFIG_MACH_SUNIV=y
+CONFIG_DRAM_CLK=156
+CONFIG_DRAM_ZQ=0
+CONFIG_SUNXI_MINIMUM_DRAM_MB=64
+# CONFIG_VIDEO_SUNXI is not set
+CONFIG_CONS_INDEX=2
-- 
2.25.1

