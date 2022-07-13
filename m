Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929EF4681
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 15:59:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A76E15A1;
	Wed, 13 Jul 2022 08:59:03 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C5F03F792;
	Wed, 13 Jul 2022 08:59:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>
Cc: Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: configs: streamline include/configs/sun*.h wrappers
Date: Wed, 13 Jul 2022 16:58:57 +0100
Message-Id: <20220713155857.83170-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For mostly historic reasons we had configuration headers for each
Allwinner CPU "family". These days they are mostly just including one
common header, with the rest being somewhat empty.
There were attempts to remove them, and to just use the one common header
to begin with, but this has implications to the build system, which me
might not be ready for, yet.

To document this behaviour, and to avoid something sneaking in over
time, make those files all the same (minus the CPU family name and
the copyrights), and add a comment explaining that.
This makes it easier to just remove those files later on, when needed
and possible.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi Tom,

this is mostly to just confirm and document what we already established
earlier: that those files are redundant, and are just needed to match
CONFIG_SYS_CONFIG_NAME. In case we don't need or want that anymore, we
can just remove them, without needing to think too hard about it.

Cheers,
Andre

 include/configs/sun4i.h  | 10 ++--------
 include/configs/sun50i.h | 19 ++-----------------
 include/configs/sun5i.h  | 10 ++--------
 include/configs/sun6i.h  |  7 ++-----
 include/configs/sun7i.h  |  6 ++----
 include/configs/sun8i.h  | 13 ++-----------
 include/configs/sun9i.h  | 11 ++---------
 include/configs/suniv.h  |  7 ++-----
 8 files changed, 16 insertions(+), 67 deletions(-)

diff --git a/include/configs/sun4i.h b/include/configs/sun4i.h
index 0e1baa91bb..70d451f224 100644
--- a/include/configs/sun4i.h
+++ b/include/configs/sun4i.h
@@ -2,18 +2,12 @@
 /*
  * (C) Copyright 2012-2013 Henrik Nordstrom <henrik@henriknordstrom.net>
  *
- * Configuration settings for the Allwinner A10 (sun4i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A10 (sun4i) CPU
+ * based devices separately. Please do not add anything in here.
  */
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * A10 specific configuration
- */
-
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun50i.h b/include/configs/sun50i.h
index bc2e3a3d00..dfcb321d42 100644
--- a/include/configs/sun50i.h
+++ b/include/configs/sun50i.h
@@ -1,26 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Configuration settings for the Allwinner A64 (sun50i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A64 (and later) sun50i
+ * CPU based devices separately. Please do not add anything in here.
  */
-
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * A64 specific configuration
- */
-
-#ifndef CONFIG_SUN50I_GEN_H6
-#define GICD_BASE		0x1c81000
-#define GICC_BASE		0x1c82000
-#else
-#define GICD_BASE		0x3021000
-#define GICC_BASE		0x3022000
-#endif
-
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun5i.h b/include/configs/sun5i.h
index ada18de753..3017307854 100644
--- a/include/configs/sun5i.h
+++ b/include/configs/sun5i.h
@@ -2,18 +2,12 @@
 /*
  * (C) Copyright 2012-2013 Henrik Nordstrom <henrik@henriknordstrom.net>
  *
- * Configuration settings for the Allwinner A13 (sun5i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A13 (sun5i) CPU
+ * based devices separately. Please do not add anything in here.
  */
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * High Level Configuration Options
- */
-
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun6i.h b/include/configs/sun6i.h
index 0b1fedda10..cbe04ac3c2 100644
--- a/include/configs/sun6i.h
+++ b/include/configs/sun6i.h
@@ -4,15 +4,12 @@
  * (C) Copyright 2013 Luke Kenneth Casson Leighton <lkcl@lkcl.net>
  * (C) Copyright 2013 Maxime Ripard <maxime.ripard@free-electrons.com>
  *
- * Configuration settings for the Allwinner A31 (sun6i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A31 (sun6i) CPU
+ * based devices separately. Please do not add anything in here.
  */
-
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun7i.h b/include/configs/sun7i.h
index bc2779fa26..ad24ab98b5 100644
--- a/include/configs/sun7i.h
+++ b/include/configs/sun7i.h
@@ -3,14 +3,12 @@
  * (C) Copyright 2012-2013 Henrik Nordstrom <henrik@henriknordstrom.net>
  * (C) Copyright 2013 Luke Kenneth Casson Leighton <lkcl@lkcl.net>
  *
- * Configuration settings for the Allwinner A20 (sun7i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A20 (sun7i) CPU
+ * based devices separately. Please do not add anything in here.
  */
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun8i.h b/include/configs/sun8i.h
index 106139d090..b6cd8d39a8 100644
--- a/include/configs/sun8i.h
+++ b/include/configs/sun8i.h
@@ -2,21 +2,12 @@
 /*
  * (C) Copyright 2014 Chen-Yu Tsai <wens@csie.org>
  *
- * Configuration settings for the Allwinner A23 (sun8i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A23 (and later) sun8i
+ * CPU based devices separately. Please do not add anything in here.
  */
-
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * A23 specific configuration
- */
-
-#include <asm/arch/cpu.h>
-
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/sun9i.h b/include/configs/sun9i.h
index 6ee08cf0d9..6bf5fc3f66 100644
--- a/include/configs/sun9i.h
+++ b/include/configs/sun9i.h
@@ -2,19 +2,12 @@
 /*
  * (C) Copyright 2015 Hans de Goede <hdegoede@redhat.com>
  *
- * Configuration settings for the Allwinner A80 (sun9i) CPU
+ * Placeholder wrapper to allow addressing Allwinner A80 (sun9i) CPU
+ * based devices separately. Please do not add anything in here.
  */
-
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * A80 specific configuration
- */
-
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/suniv.h b/include/configs/suniv.h
index 6118cd5e1a..9cc1a77f6c 100644
--- a/include/configs/suniv.h
+++ b/include/configs/suniv.h
@@ -1,14 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Configuration settings for new Allwinner F-series (suniv) CPU
+ * Placeholder wrapper to allow addressing Allwinner F-series (suniv) CPU
+ * based devices separately. Please do not add anything in here.
  */
-
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/*
- * Include common sunxi configuration where most the settings are
- */
 #include <configs/sunxi-common.h>
 
 #endif /* __CONFIG_H */
-- 
2.25.1

