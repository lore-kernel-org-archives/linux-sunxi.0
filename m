Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DA41EEE9
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737596276; cv=none; b=qaOQuPxMDvow/A1f67bw40K3og0ZSKGDGHN6I909e+6i0Ra8u/q+JPwstEgeyewkrnYUg+IiDcvI+UWsIZwfLHVuy155vuKIAZsoJvkWQh+4vOYM2EMBx4OX6qb+wrDJNBXfoCglq1LZBdEQnpQ+B3/PQQoWwiHsROBComFirGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737596276; c=relaxed/simple;
	bh=0AjjOy11zC174iUzEgnMS1ubpadvMNholo3sYPDNxrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSmzHAdZQlKvoyBxGbD3Ft3Lh/nOdwg1B9F1hB55yHzpDSR4B6g4+2EA85Yt7uB+b2jH95ivIYaxbWRl6oeiO/e88WR3/tHs8ZIfsn/x06Y+86URMQDRkKGGcwdWh6en1Dsa7r5xGPz3j8t8g4uULfUqvWwAwB8JUcD0Ol8ggqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FA141063;
	Wed, 22 Jan 2025 17:38:21 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90463F66E;
	Wed, 22 Jan 2025 17:37:51 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2025.04
Date: Thu, 23 Jan 2025 01:36:20 +0000
Message-ID: <20250123013620.23914-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull sunxi changes for this cycle:

Following the move of the H616 family to OF_UPSTREAM in the last cycle,
now some older SoCs with identical DTs follow the lead: the F1C100s, A10,
A10s, A13. The remaining SoCs suffer from that IRQ cells incompatiblity,
breaking support for Linux < v5.13, so I am holding their move back still.

Otherwise we get proper support for the PinePhone v1.2, and PSTORE support
for all revisions of that device.

This is rounded up by a PMIC related fix for some A80 boards, and two
cleanup patches that are preparations for two new SoCs families, being
worked on as we speak. But they have to wait for the next cycle.

Gitlab CI passed, and I booted that briefly on some boards.

Thanks,
Andre

===========================================================
The following changes since commit 2eed5a1ff36217372e19f7513bd07077fc76718a:

  Merge https://source.denx.de/u-boot/custodians/u-boot-snapdragon (2025-01-22 11:23:35 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 73cbb3baa6ae26dc8693feb449f48a535292e7e5:

  sunxi: switch Allwinner A10s/A13 boards to OF_UPSTREAM (2025-01-22 22:49:15 +0000)

----------------------------------------------------------------
Andre Przywara (6):
      sunxi: clock: improve grouping of default clock register values
      sunxi: H616: DRAM: rename Kconfig parameters to be more generic
      power: pmic: sunxi: guard DCDC5 separately
      suniv: switch Allwinner F1Cx00 boards to OF_UPSTREAM
      sunxi: switch Allwinner A10 boards to OF_UPSTREAM
      sunxi: switch Allwinner A10s/A13 boards to OF_UPSTREAM

Andrey Skvortsov (2):
      sunxi: defconfig: Add pstore support for pinephone
      sunxi: pinephone: detect existed magnetometer and fixup dtb

 arch/arm/dts/Makefile                             |   48 +-
 arch/arm/dts/sun4i-a10-a1000.dts                  |  255 -----
 arch/arm/dts/sun4i-a10-ba10-tvbox.dts             |  151 ---
 arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts        |  159 ---
 arch/arm/dts/sun4i-a10-cubieboard.dts             |  255 -----
 arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts       |  218 ----
 arch/arm/dts/sun4i-a10-gemei-g9.dts               |  192 ----
 arch/arm/dts/sun4i-a10-hackberry.dts              |  140 ---
 arch/arm/dts/sun4i-a10-hyundai-a7hd.dts           |  115 --
 arch/arm/dts/sun4i-a10-inet1.dts                  |  229 ----
 arch/arm/dts/sun4i-a10-inet97fv2.dts              |  203 ----
 arch/arm/dts/sun4i-a10-inet9f-rev03.dts           |  357 ------
 arch/arm/dts/sun4i-a10-itead-iteaduino-plus.dts   |  126 --
 arch/arm/dts/sun4i-a10-jesurun-q5.dts             |  181 ---
 arch/arm/dts/sun4i-a10-marsboard.dts              |  182 ---
 arch/arm/dts/sun4i-a10-mini-xplus.dts             |  144 ---
 arch/arm/dts/sun4i-a10-mk802.dts                  |  144 ---
 arch/arm/dts/sun4i-a10-mk802ii.dts                |  111 --
 arch/arm/dts/sun4i-a10-olinuxino-lime.dts         |  225 ----
 arch/arm/dts/sun4i-a10-pcduino.dts                |  200 ----
 arch/arm/dts/sun4i-a10-pcduino2.dts               |   67 --
 arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts       |  206 ----
 arch/arm/dts/sun4i-a10-topwise-a721.dts           |  242 ----
 arch/arm/dts/sun4i-a10.dtsi                       | 1271 ---------------------
 arch/arm/dts/sun5i-a10s-auxtek-t003.dts           |  137 ---
 arch/arm/dts/sun5i-a10s-auxtek-t004.dts           |  149 ---
 arch/arm/dts/sun5i-a10s-mk802.dts                 |  127 --
 arch/arm/dts/sun5i-a10s-olinuxino-micro.dts       |  272 -----
 arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts          |  118 --
 arch/arm/dts/sun5i-a10s-wobo-i5.dts               |  195 ----
 arch/arm/dts/sun5i-a10s.dtsi                      |  173 ---
 arch/arm/dts/sun5i-a13-difrnce-dit4350.dts        |   50 -
 arch/arm/dts/sun5i-a13-empire-electronix-d709.dts |  190 ---
 arch/arm/dts/sun5i-a13-empire-electronix-m712.dts |   51 -
 arch/arm/dts/sun5i-a13-hsg-h702.dts               |  182 ---
 arch/arm/dts/sun5i-a13-inet-98v-rev2.dts          |   50 -
 arch/arm/dts/sun5i-a13-licheepi-one.dts           |  214 ----
 arch/arm/dts/sun5i-a13-olinuxino-micro.dts        |  141 ---
 arch/arm/dts/sun5i-a13-olinuxino.dts              |  247 ----
 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts |  258 -----
 arch/arm/dts/sun5i-a13-q8-tablet.dts              |   80 --
 arch/arm/dts/sun5i-a13-utoo-p66.dts               |  116 --
 arch/arm/dts/sun5i-a13.dtsi                       |  118 --
 arch/arm/dts/sun5i-gr8-chip-pro.dts               |  238 ----
 arch/arm/dts/sun5i-gr8-evb.dts                    |  333 ------
 arch/arm/dts/sun5i-gr8.dtsi                       |  126 --
 arch/arm/dts/sun5i-r8-chip.dts                    |  282 -----
 arch/arm/dts/sun5i-r8.dtsi                        |   47 -
 arch/arm/dts/sun5i-reference-design-tablet.dtsi   |  194 ----
 arch/arm/dts/sun5i.dtsi                           |  819 -------------
 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts      |   73 --
 arch/arm/dts/suniv-f1c100s.dtsi                   |  330 ------
 arch/arm/dts/suniv-f1c200s-lctech-pi.dts          |   76 --
 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts      |   81 --
 arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h |   18 +-
 arch/arm/mach-sunxi/Kconfig                       |   61 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c            |   26 +-
 board/sunxi/board.c                               |   27 +-
 configs/A10-OLinuXino-Lime_defconfig              |    2 +-
 configs/A10s-OLinuXino-M_defconfig                |    2 +-
 configs/A13-OLinuXinoM_defconfig                  |    2 +-
 configs/A13-OLinuXino_defconfig                   |    2 +-
 configs/Ampe_A76_defconfig                        |    1 +
 configs/Auxtek-T003_defconfig                     |    2 +-
 configs/Auxtek-T004_defconfig                     |    2 +-
 configs/CHIP_defconfig                            |    2 +-
 configs/CHIP_pro_defconfig                        |    2 +-
 configs/Chuwi_V7_CW0825_defconfig                 |    2 +-
 configs/Cubieboard_defconfig                      |    2 +-
 configs/Empire_electronix_d709_defconfig          |    2 +-
 configs/Empire_electronix_m712_defconfig          |    2 +-
 configs/Hyundai_A7HD_defconfig                    |    2 +-
 configs/Linksprite_pcDuino_defconfig              |    2 +-
 configs/Marsboard_A10_defconfig                   |    2 +-
 configs/Mele_A1000_defconfig                      |    2 +-
 configs/Mini-X_defconfig                          |    2 +-
 configs/UTOO_P66_defconfig                        |    2 +-
 configs/Wobo_i5_defconfig                         |    2 +-
 configs/anbernic_rg35xx_h700_defconfig            |   20 +-
 configs/ba10_tv_box_defconfig                     |    2 +-
 configs/difrnce_dit4350_defconfig                 |    2 +-
 configs/dserve_dsrv9703c_defconfig                |    2 +-
 configs/iNet_3F_defconfig                         |    1 +
 configs/iNet_3W_defconfig                         |    1 +
 configs/iNet_86VS_defconfig                       |    1 +
 configs/inet1_defconfig                           |    2 +-
 configs/inet97fv2_defconfig                       |    2 +-
 configs/inet98v_rev2_defconfig                    |    2 +-
 configs/inet9f_rev03_defconfig                    |    2 +-
 configs/jesurun_q5_defconfig                      |    2 +-
 configs/lctech_pi_f1c200s_defconfig               |    2 +-
 configs/licheepi_nano_defconfig                   |    2 +-
 configs/mk802_a10s_defconfig                      |    2 +-
 configs/mk802_defconfig                           |    2 +-
 configs/mk802ii_defconfig                         |    2 +-
 configs/orangepi_zero2_defconfig                  |    8 +-
 configs/orangepi_zero2w_defconfig                 |   16 +-
 configs/orangepi_zero3_defconfig                  |   16 +-
 configs/pinephone_defconfig                       |    3 +
 configs/pov_protab2_ips9_defconfig                |    2 +-
 configs/q8_a13_tablet_defconfig                   |    2 +-
 configs/r7-tv-dongle_defconfig                    |    2 +-
 configs/sunxi_Gemei_G9_defconfig                  |    2 +-
 configs/tanix_tx1_defconfig                       |   16 +-
 configs/transpeed-8k618-t_defconfig               |   14 +-
 configs/x96_mate_defconfig                        |   14 +-
 106 files changed, 172 insertions(+), 11031 deletions(-)
 delete mode 100644 arch/arm/dts/sun4i-a10-a1000.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-ba10-tvbox.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-cubieboard.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-gemei-g9.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-hackberry.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-hyundai-a7hd.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-inet1.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-inet97fv2.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-inet9f-rev03.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-itead-iteaduino-plus.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-jesurun-q5.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-marsboard.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-mini-xplus.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-mk802.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-mk802ii.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-olinuxino-lime.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-pcduino.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-pcduino2.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts
 delete mode 100644 arch/arm/dts/sun4i-a10-topwise-a721.dts
 delete mode 100644 arch/arm/dts/sun4i-a10.dtsi
 delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t003.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t004.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s-mk802.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s-olinuxino-micro.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s-wobo-i5.dts
 delete mode 100644 arch/arm/dts/sun5i-a10s.dtsi
 delete mode 100644 arch/arm/dts/sun5i-a13-difrnce-dit4350.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-d709.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-m712.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-hsg-h702.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-inet-98v-rev2.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-licheepi-one.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino-micro.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-q8-tablet.dts
 delete mode 100644 arch/arm/dts/sun5i-a13-utoo-p66.dts
 delete mode 100644 arch/arm/dts/sun5i-a13.dtsi
 delete mode 100644 arch/arm/dts/sun5i-gr8-chip-pro.dts
 delete mode 100644 arch/arm/dts/sun5i-gr8-evb.dts
 delete mode 100644 arch/arm/dts/sun5i-gr8.dtsi
 delete mode 100644 arch/arm/dts/sun5i-r8-chip.dts
 delete mode 100644 arch/arm/dts/sun5i-r8.dtsi
 delete mode 100644 arch/arm/dts/sun5i-reference-design-tablet.dtsi
 delete mode 100644 arch/arm/dts/sun5i.dtsi
 delete mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
 delete mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
 delete mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
 delete mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
