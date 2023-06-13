Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97513C25
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jun 2023 11:22:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544B71FB;
	Tue, 13 Jun 2023 04:22:48 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7793F587;
	Tue, 13 Jun 2023 04:22:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	=?UTF-8?q?=E8=B7=AF=E8=BE=89?= <luhux76@gmail.com>
Subject: [PATCH] usb: musb-new: sunxi: read SRAM controller address from DT
Date: Tue, 13 Jun 2023 12:21:58 +0100
Message-Id: <20230613112158.1572725-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some older SoCs (<=A20, F1C100s) do not have a dedicated SRAM buffer for
the USB-OTG controller, but require the CPU to relinquish one of its SRAM
blocks to the USB controller. This is done by flipping a bit in the SRAM
controller (aka "syscon").
So far we were doing this using the hardcoded SRAM controller address,
but that breaks the abstraction, and we can find that address in the DT.

Follow the "allwinner,sram" phandle property in the devicetree to get to
the SRAM node. The reg property in there gives us the SRAM MMIO address,
as seen by the CPU, but we need the SRAM *controller* address, which is
two levels up from that node.

Utilise U-Boot's DT code to do the traversal and DT address translation
for us, then store the controller address in the glue struct, to later
hand it to the routine that programs the SRAM controller.
This allows us to drop the usage of the hardcoded SUNXI_SRAMC_BASE from
the MUSB code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this patch goes on top of Sam's musb sunxi fixes. Can someone look at
the DT calls? There are quite some interfaces to U-Boot's DT framework,
so I want to be sure to got the right one.
If that patch looks fine, I would send a new series including Sam's two
patches, this patch here, and a (simple) patch adding F1C100s support.

Cheers,
Andre

 drivers/usb/musb-new/sunxi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb-new/sunxi.c b/drivers/usb/musb-new/sunxi.c
index 4bf0ee346a4..1da05e29a56 100644
--- a/drivers/usb/musb-new/sunxi.c
+++ b/drivers/usb/musb-new/sunxi.c
@@ -23,13 +23,12 @@
 #include <malloc.h>
 #include <phy-sun4i-usb.h>
 #include <reset.h>
-#include <asm/arch/cpu.h>
-#include <asm/arch/clock.h>
 #include <dm/device_compat.h>
 #include <dm/lists.h>
 #include <dm/root.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/ioport.h>
 #include <linux/usb/musb.h>
 #include "linux-compat.h"
 #include "musb_core.h"
@@ -93,6 +92,7 @@ struct sunxi_glue {
 	struct sunxi_musb_config *cfg;
 	struct device dev;
 	struct phy phy;
+	uintptr_t syscon_base;
 };
 #define to_sunxi_glue(d)	container_of(d, struct sunxi_glue, dev)
 
@@ -181,6 +181,7 @@ static void USBC_ForceVbusValidToHigh(__iomem void *base)
  */
 static void sunxi_musb_claim_sram(uintptr_t syscon_base)
 {
+	debug("%s(0x%lx);\n", __func__, (unsigned long)syscon_base);
 	/*
 	 * BIT(0) of SRAM_CTRL_REG1 (syscon+0x04) controls SRAM-D ownership:
 	 * '0' -> exclusive access by CPU
@@ -326,7 +327,7 @@ static int sunxi_musb_init(struct musb *musb)
 		 * block 'D', ownership of which needs to be handed over by
 		 * the CPU
 		 */
-		sunxi_musb_claim_sram(SUNXI_SRAMC_BASE);
+		sunxi_musb_claim_sram(glue->syscon_base);
 	}
 
 	USBC_EnableDpDmPullUp(musb->mregs);
@@ -450,6 +451,7 @@ static int musb_usb_probe(struct udevice *dev)
 	struct sunxi_glue *glue = dev_get_priv(dev);
 	struct musb_host_data *host = &glue->mdata;
 	struct musb_hdrc_platform_data pdata;
+	struct ofnode_phandle_args args;
 	void *base = dev_read_addr_ptr(dev);
 	int ret;
 
@@ -476,6 +478,24 @@ static int musb_usb_probe(struct udevice *dev)
 		return ret;
 	}
 
+	ret = dev_read_phandle_with_args(dev, "allwinner,sram", NULL, 1, 0,
+					 &args);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "failed to get SRAM node\n");
+		return ret;
+	} else if (!ret) {
+		/* The SRAM *controller* address is in the grandparent node. */
+		ofnode node = ofnode_get_parent(ofnode_get_parent(args.node));
+		struct resource res;
+
+		ret = ofnode_read_resource(node, 0, &res);
+		if (ret) {
+			dev_err(dev, "failed to read SRAM controller base\n");
+			return ret;
+		}
+		glue->syscon_base = res.start;
+	}
+
 	ret = generic_phy_get_by_name(dev, "usb", &glue->phy);
 	if (ret) {
 		pr_err("failed to get usb PHY\n");
-- 
2.25.1

