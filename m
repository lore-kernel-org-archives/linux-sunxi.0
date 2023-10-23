Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1176B18E3F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D21EFEC;
	Mon, 23 Oct 2023 06:25:46 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015503F762;
	Mon, 23 Oct 2023 06:25:03 -0700 (PDT)
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
Subject: [PATCH v3 02/24] net: sunxi_emac: chase DT nodes to find PHY regulator
Date: Mon, 23 Oct 2023 14:24:27 +0100
Message-Id: <20231023132449.813863-3-andre.przywara@arm.com>
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

At the moment the sun4i EMAC driver relies on hardcoded CONFIG_MACPWR
Kconfig symbols to enable potential PHY regulators. As we want to get rid
of those, we need to find the regulator by chasing up the DT.

The sun4i-emac binding puts the PHY regulator into the MDIO node, which
is the parent of the PHY device. U-Boot does not have (and does not
need) an MDIO driver, so we need to chase down the regulator through the
EMAC node: we follow the "phy-handle" property to find the PHY node,
then go up to its parent, where we find the "phy-supply" link to the
regulator. Let U-Boot find the associated regulator device, and put that
into the private device struct, so we can find and enable the regulator
at probe time, later.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 drivers/net/sunxi_emac.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/sunxi_emac.c b/drivers/net/sunxi_emac.c
index 4c90d4b4981..b599b84852f 100644
--- a/drivers/net/sunxi_emac.c
+++ b/drivers/net/sunxi_emac.c
@@ -17,6 +17,7 @@
 #include <net.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
+#include <power/regulator.h>
 
 /* EMAC register  */
 struct emac_regs {
@@ -165,6 +166,7 @@ struct emac_eth_dev {
 	struct phy_device *phydev;
 	int link_printed;
 	uchar rx_buf[EMAC_RX_BUFSIZE];
+	struct udevice *phy_reg;
 };
 
 struct emac_rxhdr {
@@ -572,6 +574,9 @@ static int sunxi_emac_eth_probe(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	if (priv->phy_reg)
+		regulator_set_enable(priv->phy_reg, true);
+
 	return sunxi_emac_init_phy(priv, dev);
 }
 
@@ -585,9 +590,42 @@ static const struct eth_ops sunxi_emac_eth_ops = {
 static int sunxi_emac_eth_of_to_plat(struct udevice *dev)
 {
 	struct eth_pdata *pdata = dev_get_plat(dev);
+	struct emac_eth_dev *priv = dev_get_priv(dev);
+	struct ofnode_phandle_args args;
+	ofnode phy_node, mdio_node;
+	int ret;
 
 	pdata->iobase = dev_read_addr(dev);
 
+	phy_node = dev_get_phy_node(dev);
+	if (phy_node == ofnode_null()) {
+		dev_err(dev, "failed to get PHY node\n");
+		return ret;
+	}
+	/*
+	 * The PHY regulator is in the MDIO node, not the EMAC or PHY node.
+	 * U-Boot does not have (and does not need) a device driver for the
+	 * MDIO device, so just "pass through" that DT node to get to the
+	 * regulator phandle.
+	 * The PHY regulator is optional, though: ignore if we cannot find
+	 * a phy-supply property.
+	 */
+	mdio_node = ofnode_get_parent(phy_node);
+	ret= ofnode_parse_phandle_with_args(mdio_node, "phy-supply", NULL, 0, 0,
+					    &args);
+	if (ret && ret != -ENOENT) {
+		dev_err(dev, "failed to get PHY supply node\n");
+		return ret;
+	}
+	if (!ret) {
+		ret = uclass_get_device_by_ofnode(UCLASS_REGULATOR, args.node,
+						  &priv->phy_reg);
+		if (ret) {
+			dev_err(dev, "failed to get PHY regulator node\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.25.1

