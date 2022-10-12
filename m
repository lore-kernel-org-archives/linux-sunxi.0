Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC1A28FD
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B2E3165C;
	Wed, 12 Oct 2022 09:35:18 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1ED3F766;
	Wed, 12 Oct 2022 09:35:11 -0700 (PDT)
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
Subject: [PATCH 2/6] sunxi: fix 32MB load address layout
Date: Wed, 12 Oct 2022 17:34:54 +0100
Message-Id: <20221012163458.1968900-3-andre.przywara@arm.com>
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

The default load addresses for the various payloads (kernel, DT,
ramdisk) on systems with just 32MB of DRAM have some issues:
For a start the preceding comment doesn't match the actual values:
apparently they were copied from the 64MB S3 layout, then halved, but
since 0x5 is NOT the half of 0x10, they don't match up.
Also those projected maximum sizes are quite restrictive: it's not easy
to build a compressed kernel image with just 4MB. The only defconfig in
mainline Linux that supports the F1C100s (the only 32MB user so far)
creates a 6MB compressed / 15MB uncompressed kernel.
Rearrange the default load addresses to accommodate such a kernel: we
allow an 7MB/16MB kernel, and up to 5MB of ramdisk, stuffing the smaller
binaries like the DTB towards the end, just before the relocated U-Boot.
Shrink the size for DTB and scripts on the way, there is no need for
allowing up to 512K for them.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 include/configs/sunxi-common.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 416a0422861..fe90d55bd45 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -165,17 +165,17 @@
 
 #elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 32)
 /*
- * 32M RAM minus 1MB heap + 8MB for u-boot, stack, fb, etc.
- * 8M uncompressed kernel, 4M compressed kernel, 512K fdt,
- * 512K script, 512K pxe and the ramdisk at the end.
+ * 32M RAM minus 2.5MB for u-boot, heap, stack, etc.
+ * 16M uncompressed kernel, 7M compressed kernel, 128K fdt, 64K script,
+ * 128K DT overlay, 128K PXE and the ramdisk in the rest (max. 5MB)
  */
 #define BOOTM_SIZE        __stringify(0x1700000)
-#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(0500000))
-#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(0C00000))
-#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(0C50000))
-#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(0D00000))
-#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(0D50000))
-#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(0D60000))
+#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(1000000))
+#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(1d50000))
+#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(1d40000))
+#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(1d00000))
+#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(1d20000))
+#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(1800000))
 
 #else
 #error Need at least 32MB of DRAM. Please adjust load addresses.
-- 
2.25.1

