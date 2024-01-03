Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEC31100
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80BDA152B;
	Tue,  2 Jan 2024 16:14:25 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 958403F5A1;
	Tue,  2 Jan 2024 16:13:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 09/19] sunxi: compile clock.c for SPL only
Date: Wed,  3 Jan 2024 00:12:29 +0000
Message-Id: <20240103001239.17482-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the clock_twi_onoff() function now being called only from the SPL,
the whole clock.c file in arch/arm/mach-sunxi is needed by SPL code
only.

Remove the redundant #ifdef from the clock_init() function, actually
this function was already only called from the SPL.
Then adjust the Makefile to compile clock.c only with CONFIG_SPL_BUILD
defined.

This avoids unnecessary code in U-Boot proper and allows further
refactoring and code-split between the SPL and U-Boot proper.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Makefile | 2 +-
 arch/arm/mach-sunxi/clock.c  | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 1d4c70ec352..3f83c0280ef 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -7,7 +7,6 @@
 # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 
 obj-y	+= board.o
-obj-y	+= clock.o
 obj-y	+= cpu_info.o
 obj-y	+= dram_helpers.o
 obj-$(CONFIG_SUN6I_PRCM)	+= prcm.o
@@ -31,6 +30,7 @@ obj-y	+= timer.o
 endif
 
 ifdef CONFIG_SPL_BUILD
+obj-y				+= clock.o
 obj-$(CONFIG_MACH_SUNIV)	+= dram_suniv.o
 obj-$(CONFIG_DRAM_SUN4I)	+= dram_sun4i.o
 obj-$(CONFIG_DRAM_SUN6I)	+= dram_sun6i.o
diff --git a/arch/arm/mach-sunxi/clock.c b/arch/arm/mach-sunxi/clock.c
index b6c68c94f67..5e9fa0d0748 100644
--- a/arch/arm/mach-sunxi/clock.c
+++ b/arch/arm/mach-sunxi/clock.c
@@ -23,10 +23,8 @@ __weak void gtbus_init(void)
 
 int clock_init(void)
 {
-#ifdef CONFIG_SPL_BUILD
 	clock_init_safe();
 	gtbus_init();
-#endif
 	clock_init_uart();
 	clock_init_sec();
 
-- 
2.35.8

