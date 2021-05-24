Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697D82FB0
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F6D16D;
	Mon, 24 May 2021 16:30:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E72373F73D;
	Mon, 24 May 2021 16:30:51 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/8] mmc: sunxi: Fix warnings with CONFIG_PHYS_64BIT
Date: Tue, 25 May 2021 00:30:23 +0100
Message-Id: <20210524233029.16417-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

When enabling PHYS_64BIT on 32-bit platforms, we get two warnings about
pointer casts in sunxi_mmc.c. Those are related to MMIO addresses, which
are always below 1GB on all Allwinner SoCs, so there is no problem with
anything having more than 32 bits.

Add the proper casts to make it compile cleanly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 87b79fcf5ef..869af993d35 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -631,14 +631,14 @@ static int sunxi_mmc_probe(struct udevice *dev)
 	cfg->f_min = 400000;
 	cfg->f_max = 52000000;
 
-	priv->reg = (void *)dev_read_addr(dev);
+	priv->reg = dev_read_addr_ptr(dev);
 
 	/* We don't have a sunxi clock driver so find the clock address here */
 	ret = dev_read_phandle_with_args(dev, "clocks", "#clock-cells", 0,
 					  1, &args);
 	if (ret)
 		return ret;
-	ccu_reg = (u32 *)ofnode_get_addr(args.node);
+	ccu_reg = (u32 *)(uintptr_t)ofnode_get_addr(args.node);
 
 	priv->mmc_no = ((uintptr_t)priv->reg - SUNXI_MMC0_BASE) / 0x1000;
 	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * 4;
-- 
2.17.5

