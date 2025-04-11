Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EE2C80
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388140; cv=none; b=kK+Psp2BOKgwF0SCjgYyRHeLneaotIwDa8o9cyVfoW50Z8CQ0KYa570ba+I/NJ9edp2PVPaD9JAzk9uAO5wvXrZFP1HAJAVDMe1KFhoqcTrMKit50o5iuOBOSkcJ0MvIZU4IX6XxzVy1QpZ2OKgO67PH8Sp2ldhmdX3x4d+M2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388140; c=relaxed/simple;
	bh=Emah7c0c98xLXWjP6mTM/1M6lWgwU9DUIAKb4vmhMiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bnrt8hpamEBij6kjOIL4Z2YHCP1Es9t8KNEMSfkQ9F5HoH9sNQtagywUlrSM4VY8cBB/CApt47uXs7zHoZP3y8MHpimNbd7IbR2IGBGhDB8ET6Ew10LVvO0TO3I255E6idrOOsPB4ElZn7mfm8QTUD2KQmGhMGRKKLNhm0SMERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPWKF7St; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPWKF7St"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3185770a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388137; x=1744992937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w01KBsbTIugC5zV/0g7RHk3vVtVqf8PWUKKuQxBBtqg=;
        b=ZPWKF7St73DCuE4T4vfAwDKVLrg56EzC5Ej8UcxRz6iTxF01yj4+F/ipKO/WAi2BHE
         SeG3xVZNk9h5iNI3QLCf5S66u6AbYa4GkNDGxT/codDxOvgk55npTBL1WJJTv5xH53ZS
         vrCpmqCrAxGj/jE2oSd4dDq05ufDN1DB2dXtTcWfdNqHdtxQw6BqmVQZQJ0nen7W4qFp
         eGJM7eNHYAfNxk8F9L15WmiFH+hu2C92QgmAzMTMtu+vQ2uns55bCSJajLlZnlVkKF6q
         iELL1sE5kxlXxZuSrm69pJsmy625QAUvYSsrAr07nwimbkXjxJobmSKId5JodkNknSYt
         k57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388137; x=1744992937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w01KBsbTIugC5zV/0g7RHk3vVtVqf8PWUKKuQxBBtqg=;
        b=LAppU/6iGm63bkH695wON85yPIJGwl85WqhXoazfnkFuMWDVYTU5XrIxdBcLyWFEXz
         W+AmWBfF6weTA0rY2Y8zrMzZUmTXhlTmzK67ml1b+Au75sJlRuSKG5VbRQpoFxi+Hogg
         pQcxMAMwKapoYALusiKAultgVQSED1akGMCDwkYHlmFAD69F24xLHi1OBdTf2HVwIa3G
         GpYlXboFsmCEHhcedWM/sl6UhoDcuPgOyHQ4lBl/XXW1KInnvzMyDHcOWyO0URXaHEKU
         ZiJ8GlVBN2Fsurtk+oNjZUbFso7RKOq2AgK07uGJKADsziDT3Yr9odKAH7Jfo/mwCGBh
         /3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCW3JjfG4a1MUpEz7l8x4B4NAtozyQkUJk2RafDdz1Q4QFo/dimK25PLM7+imbXB95oS9+fCnLe45dcLbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm4nWD6k92jIqWfTXfpO4hVOIPcOMcLFSHkNtHbEY+rZzlLgA3
	uGAj7wnog1nF7pY8HlKwDUuJWwLdastiTaSs3/Vhd0Y9LqJI0RLe
X-Gm-Gg: ASbGnctOGCq7oLTK+K0z3hXsHZG2B76zoTjwVN9+qVpwvYV1L8i9cODpcjXpRTJWqfc
	qyR5zJZYzNcEqfXAoLFv1JOCpSxGf3AKQvEzSIjDcnCUWVDvCuDDpzEHKAPUFTcYh47ozZtgZ4j
	E05Q4i4pR9uO5AKpePg3pLLm2vH1lofTJnErbDkjr4XAYdPfI0QGQdKM9qDOhbswDgraDG7+aTT
	O665TXMfxfoadBQiz9RimYO8436bVGCym3Pn3wo6pWgyXIx5G2xG0/CW6pxKpB/A2R510KixbJH
	FkLNaXZkmpqluzPoDOTUx7EuKPKMhkfzL/FRpvBrhWewvrXEBWpotd0jIw==
X-Google-Smtp-Source: AGHT+IH+0U1OCIXeucwjkY7F6UJCKLrFhssqPNORxtqi9bU4G5Xhj41S1VNiRfUAGVu+wJMNguisPQ==
X-Received: by 2002:a05:6402:280b:b0:5e1:dac1:fa22 with SMTP id 4fb4d7f45d1cf-5f36fee2fe1mr2227288a12.21.1744388136655;
        Fri, 11 Apr 2025 09:15:36 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:36 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 5/5] sunxi: h6/h616: Reuse common DRAM infrastructure
Date: Fri, 11 Apr 2025 18:14:39 +0200
Message-ID: <20250411161439.4743-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411161439.4743-1-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H616 rank and size detection code is superior to the H6. Nevertheless,
they are structurally the same. Split functions from H616 into new file
and reuse them in H6 DRAM driver too. This should also fix some bugs for
H6 too, like incorrect DRAM size detection.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../include/asm/arch-sunxi/dram_dw_helpers.h  |  22 +++
 arch/arm/mach-sunxi/Makefile                  |   4 +-
 arch/arm/mach-sunxi/dram_dw_helpers.c         | 160 ++++++++++++++++++
 arch/arm/mach-sunxi/dram_sun50i_h6.c          |  91 +---------
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 155 +----------------
 5 files changed, 190 insertions(+), 242 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
 create mode 100644 arch/arm/mach-sunxi/dram_dw_helpers.c

diff --git a/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h b/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
new file mode 100644
index 000000000000..bc9e0d868c55
--- /dev/null
+++ b/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Helpers that are commonly used with DW memory controller.
+ *
+ * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
+ *
+ */
+
+#ifndef _DRAM_DW_HELPERS_H
+#define _DRAM_DW_HELPERS_H
+
+#include <asm/arch/dram.h>
+
+bool mctl_core_init(const struct dram_para *para,
+		    const struct dram_config *config);
+void mctl_auto_detect_rank_width(const struct dram_para *para,
+				 struct dram_config *config);
+void mctl_auto_detect_dram_size(const struct dram_para *para,
+				struct dram_config *config);
+unsigned long mctl_calc_size(const struct dram_config *config);
+
+#endif
diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index eb6a49119a13..a33cd5b0f07a 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -41,8 +41,8 @@ obj-$(CONFIG_DRAM_SUN9I)	+= dram_sun9i.o
 obj-$(CONFIG_SPL_SPI_SUNXI)	+= spl_spi_sunxi.o
 obj-$(CONFIG_SUNXI_DRAM_DW)	+= dram_sunxi_dw.o
 obj-$(CONFIG_SUNXI_DRAM_DW)	+= dram_timings/
-obj-$(CONFIG_DRAM_SUN50I_H6)	+= dram_sun50i_h6.o
+obj-$(CONFIG_DRAM_SUN50I_H6)	+= dram_sun50i_h6.o dram_dw_helpers.o
 obj-$(CONFIG_DRAM_SUN50I_H6)	+= dram_timings/
-obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_sun50i_h616.o
+obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_sun50i_h616.o dram_dw_helpers.o
 obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_timings/
 endif
diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunxi/dram_dw_helpers.c
new file mode 100644
index 000000000000..885d1f2c0b12
--- /dev/null
+++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Helpers that are commonly used with DW memory controller.
+ *
+ * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
+ *
+ */
+
+#include <init.h>
+#include <asm/arch/dram_dw_helpers.h>
+
+void mctl_auto_detect_rank_width(const struct dram_para *para,
+				 struct dram_config *config)
+{
+	/* this is minimum size that it's supported */
+	config->cols = 8;
+	config->rows = 13;
+
+	/*
+	 * Strategy here is to test most demanding combination first and least
+	 * demanding last, otherwise HW might not be fully utilized. For
+	 * example, half bus width and rank = 1 combination would also work
+	 * on HW with full bus width and rank = 2, but only 1/4 RAM would be
+	 * visible.
+	 */
+
+	debug("testing 32-bit width, rank = 2\n");
+	config->bus_full_width = 1;
+	config->ranks = 2;
+	if (mctl_core_init(para, config))
+		return;
+
+	debug("testing 32-bit width, rank = 1\n");
+	config->bus_full_width = 1;
+	config->ranks = 1;
+	if (mctl_core_init(para, config))
+		return;
+
+	debug("testing 16-bit width, rank = 2\n");
+	config->bus_full_width = 0;
+	config->ranks = 2;
+	if (mctl_core_init(para, config))
+		return;
+
+	debug("testing 16-bit width, rank = 1\n");
+	config->bus_full_width = 0;
+	config->ranks = 1;
+	if (mctl_core_init(para, config))
+		return;
+
+	panic("This DRAM setup is currently not supported.\n");
+}
+
+static void mctl_write_pattern(void)
+{
+	unsigned int i;
+	u32 *ptr, val;
+
+	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
+	for (i = 0; i < 16; ptr++, i++) {
+		if (i & 1)
+			val = ~(ulong)ptr;
+		else
+			val = (ulong)ptr;
+		writel(val, ptr);
+	}
+}
+
+static bool mctl_check_pattern(ulong offset)
+{
+	unsigned int i;
+	u32 *ptr, val;
+
+	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
+	for (i = 0; i < 16; ptr++, i++) {
+		if (i & 1)
+			val = ~(ulong)ptr;
+		else
+			val = (ulong)ptr;
+		if (val != *(ptr + offset / 4))
+			return false;
+	}
+
+	return true;
+}
+
+void mctl_auto_detect_dram_size(const struct dram_para *para,
+				struct dram_config *config)
+{
+	unsigned int shift, cols, rows, found;
+	u32 buffer[16];
+
+	/* max. config for columns, but not rows */
+	config->cols = 11;
+	config->rows = 13;
+	mctl_core_init(para, config);
+
+	/*
+	 * Store content so it can be restored later. This is important
+	 * if controller was already initialized and holds any data
+	 * which is important for restoring system.
+	 */
+	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
+
+	mctl_write_pattern();
+
+	shift = config->bus_full_width + 1;
+
+	/* detect column address bits */
+	found = 0;
+	for (cols = 8; cols < 11; cols++) {
+		if (mctl_check_pattern(1ULL << (cols + shift))) {
+			found = 1;
+			break;
+		}
+	}
+	if (!found)
+		panic("DRAM init failed: Can't detect number of columns!");
+	debug("detected %u columns\n", cols);
+
+	/* restore data */
+	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
+
+	/* reconfigure to make sure that all active rows are accessible */
+	config->cols = 8;
+	config->rows = 17;
+	mctl_core_init(para, config);
+
+	/* store data again as it might be moved */
+	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
+
+	mctl_write_pattern();
+
+	/* detect row address bits */
+	shift = config->bus_full_width + 4 + config->cols;
+	found = 0;
+	for (rows = 13; rows < 17; rows++) {
+		if (mctl_check_pattern(1ULL << (rows + shift))) {
+			found = 1;
+			break;
+		}
+	}
+	if (!found)
+		panic("DRAM init failed: Can't detect number of rows!");
+	debug("detected %u rows\n", rows);
+
+	/* restore data again */
+	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
+
+	config->cols = cols;
+	config->rows = rows;
+}
+
+unsigned long mctl_calc_size(const struct dram_config *config)
+{
+	u8 width = config->bus_full_width ? 4 : 2;
+
+	/* 8 banks */
+	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
+}
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index 6a9e53f965eb..fbb865131e08 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -10,6 +10,7 @@
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
+#include <asm/arch/dram_dw_helpers.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/prcm.h>
 #include <linux/bitops.h>
@@ -40,8 +41,8 @@ static void mctl_com_init(const struct dram_para *para,
 static bool mctl_channel_init(const struct dram_para *para,
 			      const struct dram_config *config);
 
-static bool mctl_core_init(const struct dram_para *para,
-			   const struct dram_config *config)
+bool mctl_core_init(const struct dram_para *para,
+		    const struct dram_config *config)
 {
 	mctl_sys_init(para->clk);
 	mctl_com_init(para, config);
@@ -560,92 +561,6 @@ static bool mctl_channel_init(const struct dram_para *para,
 	return true;
 }
 
-static void mctl_auto_detect_rank_width(const struct dram_para *para,
-					struct dram_config *config)
-{
-	/* this is minimum size that it's supported */
-	config->cols = 8;
-	config->rows = 13;
-
-	/*
-	 * Previous versions of this driver tried to auto detect the rank
-	 * and width by looking at controller registers. However this proved
-	 * to be not reliable, so this approach here is the more robust
-	 * solution. Check the git history for details.
-	 *
-	 * Strategy here is to test most demanding combination first and least
-	 * demanding last, otherwise HW might not be fully utilized. For
-	 * example, half bus width and rank = 1 combination would also work
-	 * on HW with full bus width and rank = 2, but only 1/4 RAM would be
-	 * visible.
-	 */
-
-	debug("testing 32-bit width, rank = 2\n");
-	config->bus_full_width = 1;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 32-bit width, rank = 1\n");
-	config->bus_full_width = 1;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 2\n");
-	config->bus_full_width = 0;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 1\n");
-	config->bus_full_width = 0;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	panic("This DRAM setup is currently not supported.\n");
-}
-
-static void mctl_auto_detect_dram_size(const struct dram_para *para,
-				       struct dram_config *config)
-{
-	/* TODO: non-(LP)DDR3 */
-
-	/* detect row address bits */
-	config->cols = 8;
-	config->rows = 18;
-	mctl_core_init(para, config);
-
-	for (config->rows = 13; config->rows < 18; config->rows++) {
-		/* 8 banks, 8 bit per byte and 16/32 bit width */
-		if (mctl_mem_matches((1 << (config->rows + config->cols +
-					    4 + config->bus_full_width))))
-			break;
-	}
-
-	/* detect column address bits */
-	config->cols = 11;
-	mctl_core_init(para, config);
-
-	for (config->cols = 8; config->cols < 11; config->cols++) {
-		/* 8 bits per byte and 16/32 bit width */
-		if (mctl_mem_matches(1 << (config->cols + 1 +
-					   config->bus_full_width)))
-			break;
-	}
-}
-
-unsigned long mctl_calc_size(const struct dram_config *config)
-{
-	u8 width = config->bus_full_width ? 4 : 2;
-
-	/* TODO: non-(LP)DDR3 */
-
-	/* 8 banks */
-	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
-}
-
 #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
 	{{  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
 	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index d1768a7e7d3a..80d9de557876 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -17,6 +17,7 @@
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
+#include <asm/arch/dram_dw_helpers.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/prcm.h>
 #include <linux/bitops.h>
@@ -1310,164 +1311,14 @@ static bool mctl_ctrl_init(const struct dram_para *para,
 	return true;
 }
 
-static bool mctl_core_init(const struct dram_para *para,
-			   const struct dram_config *config)
+bool mctl_core_init(const struct dram_para *para,
+		    const struct dram_config *config)
 {
 	mctl_sys_init(para->clk);
 
 	return mctl_ctrl_init(para, config);
 }
 
-static void mctl_auto_detect_rank_width(const struct dram_para *para,
-					struct dram_config *config)
-{
-	/* this is minimum size that it's supported */
-	config->cols = 8;
-	config->rows = 13;
-
-	/*
-	 * Strategy here is to test most demanding combination first and least
-	 * demanding last, otherwise HW might not be fully utilized. For
-	 * example, half bus width and rank = 1 combination would also work
-	 * on HW with full bus width and rank = 2, but only 1/4 RAM would be
-	 * visible.
-	 */
-
-	debug("testing 32-bit width, rank = 2\n");
-	config->bus_full_width = 1;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 32-bit width, rank = 1\n");
-	config->bus_full_width = 1;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 2\n");
-	config->bus_full_width = 0;
-	config->ranks = 2;
-	if (mctl_core_init(para, config))
-		return;
-
-	debug("testing 16-bit width, rank = 1\n");
-	config->bus_full_width = 0;
-	config->ranks = 1;
-	if (mctl_core_init(para, config))
-		return;
-
-	panic("This DRAM setup is currently not supported.\n");
-}
-
-static void mctl_write_pattern(void)
-{
-	unsigned int i;
-	u32 *ptr, val;
-
-	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
-	for (i = 0; i < 16; ptr++, i++) {
-		if (i & 1)
-			val = ~(ulong)ptr;
-		else
-			val = (ulong)ptr;
-		writel(val, ptr);
-	}
-}
-
-static bool mctl_check_pattern(ulong offset)
-{
-	unsigned int i;
-	u32 *ptr, val;
-
-	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
-	for (i = 0; i < 16; ptr++, i++) {
-		if (i & 1)
-			val = ~(ulong)ptr;
-		else
-			val = (ulong)ptr;
-		if (val != *(ptr + offset / 4))
-			return false;
-	}
-
-	return true;
-}
-
-static void mctl_auto_detect_dram_size(const struct dram_para *para,
-				       struct dram_config *config)
-{
-	unsigned int shift, cols, rows, found;
-	u32 buffer[16];
-
-	/* max. config for columns, but not rows */
-	config->cols = 11;
-	config->rows = 13;
-	mctl_core_init(para, config);
-
-	/*
-	 * Store content so it can be restored later. This is important
-	 * if controller was already initialized and holds any data
-	 * which is important for restoring system.
-	 */
-	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
-
-	mctl_write_pattern();
-
-	shift = config->bus_full_width + 1;
-
-	/* detect column address bits */
-	found = 0;
-	for (cols = 8; cols < 11; cols++) {
-		if (mctl_check_pattern(1ULL << (cols + shift))) {
-			found = 1;
-			break;
-		}
-	}
-	if (!found)
-		panic("DRAM init failed: Can't detect number of columns!");
-	debug("detected %u columns\n", cols);
-
-	/* restore data */
-	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
-
-	/* reconfigure to make sure that all active rows are accessible */
-	config->cols = 8;
-	config->rows = 17;
-	mctl_core_init(para, config);
-
-	/* store data again as it might be moved */
-	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
-
-	mctl_write_pattern();
-
-	/* detect row address bits */
-	shift = config->bus_full_width + 4 + config->cols;
-	found = 0;
-	for (rows = 13; rows < 17; rows++) {
-		if (mctl_check_pattern(1ULL << (rows + shift))) {
-			found = 1;
-			break;
-		}
-	}
-	if (!found)
-		panic("DRAM init failed: Can't detect number of rows!");
-	debug("detected %u rows\n", rows);
-
-	/* restore data again */
-	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
-
-	config->cols = cols;
-	config->rows = rows;
-}
-
-static unsigned long mctl_calc_size(const struct dram_config *config)
-{
-	u8 width = config->bus_full_width ? 4 : 2;
-
-	/* 8 banks */
-	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
-}
-
 static const struct dram_para para = {
 	.clk = CONFIG_DRAM_CLK,
 #ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333
-- 
2.49.0

