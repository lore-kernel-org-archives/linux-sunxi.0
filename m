Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984B528EA
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2785716F3;
	Wed, 12 Oct 2022 09:35:20 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BCA13F766;
	Wed, 12 Oct 2022 09:35:12 -0700 (PDT)
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
Subject: [PATCH 3/6] sunxi: f1c100: move SKIP_LOWLEVEL_INIT_ONLY into Kconfig
Date: Wed, 12 Oct 2022 17:34:55 +0100
Message-Id: <20221012163458.1968900-4-andre.przywara@arm.com>
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

So far we stated the lack of a lowlevel() init function for the F1C100s
board by defining the respective SKIP_* symbol in the board's
defconfig. However we don't expect any *board* to employ such low level
code, so expect this to be never used for the ARMv5 Allwinner SoCs.

Select the appropriate symbols in the Kconfig, so that we can remove
them from the defconfig, and avoid putting them in future defconfigs for
other boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig     | 2 ++
 configs/licheepi_nano_defconfig | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 9aa66deb9fd..fc5d8bb3c19 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -185,6 +185,8 @@ config MACH_SUNIV
 	select CPU_ARM926EJS
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
+	select SKIP_LOWLEVEL_INIT_ONLY
+	select SPL_SKIP_LOWLEVEL_INIT_ONLY
 
 config MACH_SUN4I
 	bool "sun4i (Allwinner A10)"
diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index 14e6bcda927..09f1a19cdbe 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -1,6 +1,4 @@
 CONFIG_ARM=y
-CONFIG_SKIP_LOWLEVEL_INIT_ONLY=y
-CONFIG_SPL_SKIP_LOWLEVEL_INIT_ONLY=y
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-licheepi-nano"
-- 
2.25.1

