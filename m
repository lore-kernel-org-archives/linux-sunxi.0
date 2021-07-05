Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757DB177
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 23:05:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DCD1042;
	Mon,  5 Jul 2021 16:05:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45C393F73B;
	Mon,  5 Jul 2021 16:05:20 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] sunxi: SPL SPI: Allow larger SPL
Date: Tue,  6 Jul 2021 00:04:43 +0100
Message-Id: <20210705230445.14834-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210705230445.14834-1-andre.przywara@arm.com>
References: <20210705230445.14834-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The more recent Allwinner SoCs BootROMs can actually load SPL images
larger than 32KB. We use this on the H616 to fit the extra code needed
for the PMIC into the image, and have provisions in board.c to respect
that larger SPL size when booting from MMC.

However the sunxi SPL SPI loader has a hardcoded load offset of 32KB,
which will fail on the H616.

To fix this, use the same algorithm we use for MMC: if the SPL size is
smaller than 32KB, we use 32KB, otherwise we expect the U-Boot payload
directly after the SPL code.

This prepares for SPI booting with larger SPLs like on the H616.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/spl_spi_sunxi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/spl_spi_sunxi.c b/arch/arm/mach-sunxi/spl_spi_sunxi.c
index 15e86cbac8f..3499c4cc5f8 100644
--- a/arch/arm/mach-sunxi/spl_spi_sunxi.c
+++ b/arch/arm/mach-sunxi/spl_spi_sunxi.c
@@ -7,6 +7,7 @@
 #include <image.h>
 #include <log.h>
 #include <spl.h>
+#include <asm/arch/spl.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <linux/bitops.h>
@@ -326,10 +327,13 @@ static int spl_spi_load_image(struct spl_image_info *spl_image,
 	int ret = 0;
 	struct image_header *header;
 	header = (struct image_header *)(CONFIG_SYS_TEXT_BASE);
+	int load_offset = readl(SPL_ADDR + 0x10);
+
+	load_offset = max(load_offset, CONFIG_SYS_SPI_U_BOOT_OFFS);
 
 	spi0_init();
 
-	spi0_read_data((void *)header, CONFIG_SYS_SPI_U_BOOT_OFFS, 0x40);
+	spi0_read_data((void *)header, load_offset, 0x40);
 
         if (IS_ENABLED(CONFIG_SPL_LOAD_FIT) &&
 		image_get_magic(header) == FDT_MAGIC) {
@@ -342,14 +346,14 @@ static int spl_spi_load_image(struct spl_image_info *spl_image,
 		load.bl_len = 1;
 		load.read = spi_load_read;
 		ret = spl_load_simple_fit(spl_image, &load,
-					  CONFIG_SYS_SPI_U_BOOT_OFFS, header);
+					  load_offset, header);
 	} else {
 		ret = spl_parse_image_header(spl_image, header);
 		if (ret)
 			return ret;
 
 		spi0_read_data((void *)spl_image->load_addr,
-			       CONFIG_SYS_SPI_U_BOOT_OFFS, spl_image->size);
+			       load_offset, spl_image->size);
 	}
 
 	spi0_deinit();
-- 
2.17.5

