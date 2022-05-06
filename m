Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF78632
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 00:33:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37127152B;
	Thu,  5 May 2022 17:33:23 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C58543FA31;
	Thu,  5 May 2022 17:33:21 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] clk: sunxi: add PIO bus gate clocks
Date: Fri,  6 May 2022 01:33:00 +0100
Message-Id: <20220506003301.13194-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220506003301.13194-1-andre.przywara@arm.com>
References: <20220506003301.13194-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The introduction of the DM pinctrl driver made its probe function enable
all clocks enumerated in the DT. This includes the "CLK_BUS_PIO" (and
variations) gate clock, but also CLK_PLL_PERIPH0. So far we didn't
describe those clocks in our clock driver.
As we enable them already in the SPL, the devices happen to work, but
the clock driver still complains about not finding those clocks:
=========
sunxi_set_gate: (CLK#58) unhandled
=========

Add the one-liners that are needed to announce the gate bit for those
clocks, to silence that message on the console.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi/clk_a10.c  | 2 ++
 drivers/clk/sunxi/clk_a10s.c | 2 ++
 drivers/clk/sunxi/clk_a23.c  | 2 ++
 drivers/clk/sunxi/clk_a31.c  | 2 ++
 drivers/clk/sunxi/clk_a64.c  | 4 ++++
 drivers/clk/sunxi/clk_a80.c  | 2 ++
 drivers/clk/sunxi/clk_a83t.c | 2 ++
 drivers/clk/sunxi/clk_h3.c   | 4 ++++
 drivers/clk/sunxi/clk_h6.c   | 2 ++
 drivers/clk/sunxi/clk_h616.c | 2 ++
 drivers/clk/sunxi/clk_r40.c  | 2 ++
 drivers/clk/sunxi/clk_v3s.c  | 2 ++
 12 files changed, 28 insertions(+)

diff --git a/drivers/clk/sunxi/clk_a10.c b/drivers/clk/sunxi/clk_a10.c
index 90b929d3d32..db92848aafd 100644
--- a/drivers/clk/sunxi/clk_a10.c
+++ b/drivers/clk/sunxi/clk_a10.c
@@ -31,6 +31,8 @@ static struct ccu_clk_gate a10_gates[] = {
 
 	[CLK_AHB_GMAC]		= GATE(0x064, BIT(17)),
 
+	[CLK_APB0_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_APB1_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_APB1_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_APB1_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a10s.c b/drivers/clk/sunxi/clk_a10s.c
index addf4f4d5cd..0c6564ef3b6 100644
--- a/drivers/clk/sunxi/clk_a10s.c
+++ b/drivers/clk/sunxi/clk_a10s.c
@@ -25,6 +25,8 @@ static struct ccu_clk_gate a10s_gates[] = {
 	[CLK_AHB_SPI1]		= GATE(0x060, BIT(21)),
 	[CLK_AHB_SPI2]		= GATE(0x060, BIT(22)),
 
+	[CLK_APB0_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_APB1_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_APB1_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_APB1_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a23.c b/drivers/clk/sunxi/clk_a23.c
index c45d2c35298..0280fb51e2d 100644
--- a/drivers/clk/sunxi/clk_a23.c
+++ b/drivers/clk/sunxi/clk_a23.c
@@ -23,6 +23,8 @@ static struct ccu_clk_gate a23_gates[] = {
 	[CLK_BUS_EHCI]		= GATE(0x060, BIT(26)),
 	[CLK_BUS_OHCI]		= GATE(0x060, BIT(29)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a31.c b/drivers/clk/sunxi/clk_a31.c
index 251fc3b705e..26d25f32408 100644
--- a/drivers/clk/sunxi/clk_a31.c
+++ b/drivers/clk/sunxi/clk_a31.c
@@ -30,6 +30,8 @@ static struct ccu_clk_gate a31_gates[] = {
 	[CLK_AHB1_OHCI1]	= GATE(0x060, BIT(30)),
 	[CLK_AHB1_OHCI2]	= GATE(0x060, BIT(31)),
 
+	[CLK_APB1_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_APB2_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_APB2_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_APB2_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a64.c b/drivers/clk/sunxi/clk_a64.c
index 1004a795033..cbb9168edb9 100644
--- a/drivers/clk/sunxi/clk_a64.c
+++ b/drivers/clk/sunxi/clk_a64.c
@@ -14,6 +14,8 @@
 #include <linux/bitops.h>
 
 static const struct ccu_clk_gate a64_gates[] = {
+	[CLK_PLL_PERIPH0]	= GATE(0x028, BIT(31)),
+
 	[CLK_BUS_MMC0]		= GATE(0x060, BIT(8)),
 	[CLK_BUS_MMC1]		= GATE(0x060, BIT(9)),
 	[CLK_BUS_MMC2]		= GATE(0x060, BIT(10)),
@@ -26,6 +28,8 @@ static const struct ccu_clk_gate a64_gates[] = {
 	[CLK_BUS_OHCI0]		= GATE(0x060, BIT(28)),
 	[CLK_BUS_OHCI1]		= GATE(0x060, BIT(29)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a80.c b/drivers/clk/sunxi/clk_a80.c
index 8a0834d83a3..1ee1f99a8f4 100644
--- a/drivers/clk/sunxi/clk_a80.c
+++ b/drivers/clk/sunxi/clk_a80.c
@@ -25,6 +25,8 @@ static const struct ccu_clk_gate a80_gates[] = {
 	[CLK_BUS_SPI2]		= GATE(0x580, BIT(22)),
 	[CLK_BUS_SPI3]		= GATE(0x580, BIT(23)),
 
+	[CLK_BUS_PIO]           = GATE(0x590, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x594, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x594, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x594, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_a83t.c b/drivers/clk/sunxi/clk_a83t.c
index 8c6043f51e2..4b57434cfaa 100644
--- a/drivers/clk/sunxi/clk_a83t.c
+++ b/drivers/clk/sunxi/clk_a83t.c
@@ -25,6 +25,8 @@ static struct ccu_clk_gate a83t_gates[] = {
 	[CLK_BUS_EHCI1]		= GATE(0x060, BIT(27)),
 	[CLK_BUS_OHCI0]		= GATE(0x060, BIT(29)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_h3.c b/drivers/clk/sunxi/clk_h3.c
index 59afba53eef..08a830bd188 100644
--- a/drivers/clk/sunxi/clk_h3.c
+++ b/drivers/clk/sunxi/clk_h3.c
@@ -14,6 +14,8 @@
 #include <linux/bitops.h>
 
 static struct ccu_clk_gate h3_gates[] = {
+	[CLK_PLL_PERIPH0]	= GATE(0x028, BIT(31)),
+
 	[CLK_BUS_MMC0]		= GATE(0x060, BIT(8)),
 	[CLK_BUS_MMC1]		= GATE(0x060, BIT(9)),
 	[CLK_BUS_MMC2]		= GATE(0x060, BIT(10)),
@@ -30,6 +32,8 @@ static struct ccu_clk_gate h3_gates[] = {
 	[CLK_BUS_OHCI2]		= GATE(0x060, BIT(30)),
 	[CLK_BUS_OHCI3]		= GATE(0x060, BIT(31)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_h6.c b/drivers/clk/sunxi/clk_h6.c
index 4a53788352c..f4e26cbcd45 100644
--- a/drivers/clk/sunxi/clk_h6.c
+++ b/drivers/clk/sunxi/clk_h6.c
@@ -14,6 +14,8 @@
 #include <linux/bitops.h>
 
 static struct ccu_clk_gate h6_gates[] = {
+	[CLK_PLL_PERIPH0]	= GATE(0x020, BIT(31)),
+
 	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
 	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
 	[CLK_BUS_MMC2]		= GATE(0x84c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_h616.c b/drivers/clk/sunxi/clk_h616.c
index af97d3bb9f7..65ab44643da 100644
--- a/drivers/clk/sunxi/clk_h616.c
+++ b/drivers/clk/sunxi/clk_h616.c
@@ -13,6 +13,8 @@
 #include <linux/bitops.h>
 
 static struct ccu_clk_gate h616_gates[] = {
+	[CLK_PLL_PERIPH0]	= GATE(0x020, BIT(31) | BIT(27)),
+
 	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
 	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
 	[CLK_BUS_MMC2]		= GATE(0x84c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_r40.c b/drivers/clk/sunxi/clk_r40.c
index 4d5b69a9765..45633a2a524 100644
--- a/drivers/clk/sunxi/clk_r40.c
+++ b/drivers/clk/sunxi/clk_r40.c
@@ -32,6 +32,8 @@ static struct ccu_clk_gate r40_gates[] = {
 
 	[CLK_BUS_GMAC]		= GATE(0x064, BIT(17)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_I2C2]		= GATE(0x06c, BIT(2)),
diff --git a/drivers/clk/sunxi/clk_v3s.c b/drivers/clk/sunxi/clk_v3s.c
index cce5c658ca0..67d215cbba8 100644
--- a/drivers/clk/sunxi/clk_v3s.c
+++ b/drivers/clk/sunxi/clk_v3s.c
@@ -20,6 +20,8 @@ static struct ccu_clk_gate v3s_gates[] = {
 	[CLK_BUS_SPI0]		= GATE(0x060, BIT(20)),
 	[CLK_BUS_OTG]		= GATE(0x060, BIT(24)),
 
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+
 	[CLK_BUS_I2C0]		= GATE(0x06c, BIT(0)),
 	[CLK_BUS_I2C1]		= GATE(0x06c, BIT(1)),
 	[CLK_BUS_UART0]		= GATE(0x06c, BIT(16)),
-- 
2.35.3

