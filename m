Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2386B70
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 00:37:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC4C113E;
	Sun, 23 May 2021 17:37:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CE913F73D;
	Sun, 23 May 2021 17:37:06 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Heiko Schocher <hs@denx.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [RFC PATCH 1/3] fastboot: Allow runtime determination of MMC device
Date: Mon, 24 May 2021 01:36:48 +0100
Message-Id: <20210524003650.24469-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524003650.24469-1-andre.przywara@arm.com>
References: <20210524003650.24469-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

At the moment the fastboot code relies on the Kconfig variable
CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
flash command. This value needs to be the *U-Boot device number*, which
recently got more dynamic, and depends on other MMC nodes in the
devicetree, but also on mmc aliases defined. This leads to situations
where it's hard to fix this number at compile time, because a WiFi
device might enumerate before the wanted eMMC device, for instance.

To avoid this fragile situation, allow this value to be determined at
runtime. This decision is probably platform specific, so introduce a
weak function that returns the needed number, and use that everywhere
instead of the Kconfig variable.

For now the default implementation just returns this very Kconfig
variable, but this can be overwritten by platforms later.

No functional change at this point.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/fastboot/fb_command.c |  6 +++---
 drivers/fastboot/fb_common.c  |  3 ++-
 drivers/fastboot/fb_mmc.c     | 12 ++++++++----
 include/fastboot.h            |  7 +++++++
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
index 3a5db5b08fc..77184901505 100644
--- a/drivers/fastboot/fb_command.c
+++ b/drivers/fastboot/fb_command.c
@@ -452,7 +452,7 @@ static void oem_format(char *cmd_parameter, char *response)
 		fastboot_fail("partitions not set", response);
 	} else {
 		sprintf(cmdbuf, "gpt write mmc %x $partitions",
-			CONFIG_FASTBOOT_FLASH_MMC_DEV);
+			fastboot_get_mmc_device());
 		if (run_command(cmdbuf, 0))
 			fastboot_fail("", response);
 		else
@@ -479,7 +479,7 @@ static void oem_partconf(char *cmd_parameter, char *response)
 
 	/* execute 'mmc partconfg' command with cmd_parameter arguments*/
 	snprintf(cmdbuf, sizeof(cmdbuf), "mmc partconf %x %s 0",
-		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
+		 fastboot_get_mmc_device(), cmd_parameter);
 	printf("Execute: %s\n", cmdbuf);
 	if (run_command(cmdbuf, 0))
 		fastboot_fail("Cannot set oem partconf", response);
@@ -506,7 +506,7 @@ static void oem_bootbus(char *cmd_parameter, char *response)
 
 	/* execute 'mmc bootbus' command with cmd_parameter arguments*/
 	snprintf(cmdbuf, sizeof(cmdbuf), "mmc bootbus %x %s",
-		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
+		 fastboot_get_mmc_device(), cmd_parameter);
 	printf("Execute: %s\n", cmdbuf);
 	if (run_command(cmdbuf, 0))
 		fastboot_fail("Cannot set oem bootbus", response);
diff --git a/drivers/fastboot/fb_common.c b/drivers/fastboot/fb_common.c
index cbcc3683c47..a64fefc7d72 100644
--- a/drivers/fastboot/fb_common.c
+++ b/drivers/fastboot/fb_common.c
@@ -101,7 +101,8 @@ int __weak fastboot_set_reboot_flag(enum fastboot_reboot_reason reason)
 	if (reason >= FASTBOOT_REBOOT_REASONS_COUNT)
 		return -EINVAL;
 
-	return bcb_write_reboot_reason(CONFIG_FASTBOOT_FLASH_MMC_DEV, "misc", boot_cmds[reason]);
+	return bcb_write_reboot_reason(fastboot_get_mmc_device(), "misc",
+				       boot_cmds[reason]);
 #else
     return -EINVAL;
 #endif
diff --git a/drivers/fastboot/fb_mmc.c b/drivers/fastboot/fb_mmc.c
index 2f3837e5591..c97e88a3bbd 100644
--- a/drivers/fastboot/fb_mmc.c
+++ b/drivers/fastboot/fb_mmc.c
@@ -76,13 +76,18 @@ static int raw_part_get_info_by_name(struct blk_desc *dev_desc,
 	return 0;
 }
 
+int __weak fastboot_get_mmc_device(void)
+{
+	return CONFIG_FASTBOOT_FLASH_MMC_DEV;
+}
+
 static int do_get_part_info(struct blk_desc **dev_desc, const char *name,
 			    struct disk_partition *info)
 {
 	int ret;
 
 	/* First try partition names on the default device */
-	*dev_desc = blk_get_dev("mmc", CONFIG_FASTBOOT_FLASH_MMC_DEV);
+	*dev_desc = blk_get_dev("mmc", fastboot_get_mmc_device());
 	if (*dev_desc) {
 		ret = part_get_info_by_name(*dev_desc, name, info);
 		if (ret >= 0)
@@ -489,8 +494,7 @@ int fastboot_mmc_get_part_info(const char *part_name,
 
 static struct blk_desc *fastboot_mmc_get_dev(char *response)
 {
-	struct blk_desc *ret = blk_get_dev("mmc",
-					   CONFIG_FASTBOOT_FLASH_MMC_DEV);
+	struct blk_desc *ret = blk_get_dev("mmc", fastboot_get_mmc_device());
 
 	if (!ret || ret->type == DEV_TYPE_UNKNOWN) {
 		pr_err("invalid mmc device\n");
@@ -641,7 +645,7 @@ void fastboot_mmc_erase(const char *cmd, char *response)
 	struct blk_desc *dev_desc;
 	struct disk_partition info;
 	lbaint_t blks, blks_start, blks_size, grp_size;
-	struct mmc *mmc = find_mmc_device(CONFIG_FASTBOOT_FLASH_MMC_DEV);
+	struct mmc *mmc = find_mmc_device(fastboot_get_mmc_device());
 
 #ifdef CONFIG_FASTBOOT_MMC_BOOT_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_BOOT1_NAME) == 0) {
diff --git a/include/fastboot.h b/include/fastboot.h
index 57daaf12982..839877f6a67 100644
--- a/include/fastboot.h
+++ b/include/fastboot.h
@@ -173,6 +173,13 @@ void fastboot_data_download(const void *fastboot_data,
  */
 void fastboot_data_complete(char *response);
 
+/**
+ * fastboot_get_mmc_device() - Get mmc device number of fastboot flash storage
+ *
+ * Return: U-Boot number of MMC device to use as the flash provider.
+ */
+int fastboot_get_mmc_device(void);
+
 #if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
 void fastboot_acmd_complete(void);
 #endif
-- 
2.17.5

