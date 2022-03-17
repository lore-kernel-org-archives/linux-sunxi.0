Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FA348DE
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 18:30:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EE01688;
	Thu, 17 Mar 2022 11:30:53 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097613F7F5;
	Thu, 17 Mar 2022 11:30:51 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/5] ARM: configs: multi_v5_defconfig: remove deleted platforms
Date: Thu, 17 Mar 2022 18:30:39 +0000
Message-Id: <20220317183043.948432-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
References: <20220317183043.948432-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some ARMv5 platforms got removed from the kernel over time, so we don't
need their symbols in the multi_v5_defconfig anymore:

- ARCH_U300 got removed with commit ce1380c9f4bc ("ARM: remove u300
  platform"), so CONFIG_ARCH_U300 is not around anymore.
- ARCH_U300 was the only platform selecting ARCH_AMBA, which I2C_NOMADIK
  depends on. So we won't need this symbol anymore, and can't select it
  anyway.
- i.MX27 got converted to DT in 879c0e5e0ac7 ("ARM: imx: Remove i.MX27
  board files"). Remove the now obsolete board file version symbols.

No change in the generated .config or savedefconfig.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index fe8d760256a4..5d754aad0272 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -24,11 +24,6 @@ CONFIG_MACH_DM355_LEOPARD=y
 CONFIG_MACH_MITYOMAPL138=y
 CONFIG_MACH_OMAPL138_HAWKBOARD=y
 CONFIG_ARCH_MXC=y
-CONFIG_MACH_MX21ADS=y
-CONFIG_MACH_MX27ADS=y
-CONFIG_MACH_MX27_3DS=y
-CONFIG_MACH_IMX27_VISSTRIM_M10=y
-CONFIG_MACH_PCA100=y
 CONFIG_SOC_IMX25=y
 CONFIG_SOC_IMX27=y
 CONFIG_ARCH_MVEBU=y
@@ -57,7 +52,6 @@ CONFIG_MACH_WNR854T=y
 CONFIG_MACH_RD88F5181L_GE=y
 CONFIG_MACH_RD88F5181L_FXO=y
 CONFIG_MACH_RD88F6183AP_GE=y
-CONFIG_ARCH_U300=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
@@ -159,7 +153,6 @@ CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=y
 CONFIG_I2C_IMX=y
 CONFIG_I2C_MV64XXX=y
-CONFIG_I2C_NOMADIK=y
 CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_IMX=y
-- 
2.25.1

