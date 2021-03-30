Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF0C70
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:01:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F4CCD6E;
	Tue, 30 Mar 2021 06:01:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458FC3F694;
	Tue, 30 Mar 2021 06:01:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] sunxi: H616: Change TF-A load address to beginning of DRAM
Date: Tue, 30 Mar 2021 14:01:21 +0100
Message-Id: <20210330130122.3915-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210330130122.3915-1-andre.przywara@arm.com>
References: <20210330130122.3915-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Loading Trusted-Firmware's BL31 at 16KB into DRAM was originally a hack
to allow sharing more code with the other SoCs (which use this offset
in SRAM). However there is no longer a reason for that, as the
problematic macros have been properly separated there.

The latest (and hopefully final) TF-A code drop now changes the load
address to the beginning of DRAM, which is also more easily protected
by the Trustzone memory controller (code to be done).

Adjust the load address of BL31 now, to avoid any issues with
incompatible versions later on (the TF-A patches are about to be merged).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/sunxi-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index abe629c55e5..cd096bf2a06 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -4,7 +4,7 @@
 #define BL31_ADDR 0x104000
 #define  SCP_ADDR 0x114000
 #elif defined(CONFIG_MACH_SUN50I_H616)
-#define BL31_ADDR 0x40004000
+#define BL31_ADDR 0x40000000
 #else
 #define BL31_ADDR  0x44000
 #define  SCP_ADDR  0x50000
-- 
2.17.5

