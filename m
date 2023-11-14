Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F8567D
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Nov 2023 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D815FEC;
	Mon, 13 Nov 2023 17:33:05 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068203F7B4;
	Mon, 13 Nov 2023 17:32:18 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Vignesh R <vigneshr@ti.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] mtd: spi-nor: Add support for zBIT ZB25VQ128
Date: Tue, 14 Nov 2023 01:31:04 +0000
Message-Id: <20231114013106.31336-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20231114013106.31336-1-andre.przywara@arm.com>
References: <20231114013106.31336-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the zBIT ZB25VQ128 (128M-bit) SPI NOR flash memory chip,
as used on the Xunlong Orange Pi Zero 3 board.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mtd/spi/Kconfig       | 5 +++++
 drivers/mtd/spi/spi-nor-ids.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/spi/Kconfig b/drivers/mtd/spi/Kconfig
index 732b0760452..abed392c28d 100644
--- a/drivers/mtd/spi/Kconfig
+++ b/drivers/mtd/spi/Kconfig
@@ -224,6 +224,11 @@ config SPI_FLASH_XTX
 	  Add support for various XTX (XTX Technology Limited)
 	  SPI flash chips (XT25xxx).
 
+config SPI_FLASH_ZBIT
+	bool "ZBIT SPI flash support"
+	help
+	  Add support for Zbit Semiconductor Inc. SPI flash chips (ZB25xxx).
+
 endif
 
 config SPI_FLASH_USE_4K_SECTORS
diff --git a/drivers/mtd/spi/spi-nor-ids.c b/drivers/mtd/spi/spi-nor-ids.c
index 3cb132dcffc..f86e7ff8e58 100644
--- a/drivers/mtd/spi/spi-nor-ids.c
+++ b/drivers/mtd/spi/spi-nor-ids.c
@@ -571,6 +571,11 @@ const struct flash_info spi_nor_ids[] = {
 	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ INFO("xt25w01g", 0x0b651B, 0, 64 * 1024, 2048,
 	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+#endif
+#ifdef CONFIG_SPI_FLASH_ZBIT
+	/* Zbit Semiconductor Inc. */
+	{ INFO("zb25vq128", 0x5e4018, 0, 64 * 1024, 256,
+	       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 #endif
 	{ },
 };
-- 
2.35.8

