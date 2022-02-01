Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958C43FDD
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Feb 2022 01:41:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 080C2113E;
	Mon, 31 Jan 2022 17:41:36 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 446203F73B;
	Mon, 31 Jan 2022 17:41:34 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/5] sunxi: remove lowlevel_init
Date: Tue,  1 Feb 2022 01:41:11 +0000
Message-Id: <20220201014116.25864-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi,

a smallish update, following the comments of the diligent reviewers
(thanks Samuel and Simon!).
ARMV7_SET_CORTEX_SMPEN is now a blind symbol, set by the SoCs that
need it. The rest are more cosmetic changes, see below for a changelog.

==================
For a long time the Allwinner platform was using the lowlevel_init()
routine in U-Boot's boot process, even though there did not seem to be
a real need for that. The README file suggests it should only be used
for "bare minimum" tasks to reach board_init_f(). The routines called
in arch/arm/mach-sunxi/board.c:s_init() did nothing that really
warranted the early and special execution. Since we always run with an
SPL, the board_init_f() routine in there seems to be the right place
for early peripherals initialisation.
Having those routines in s_init() actually forced other parts of U-Boot
to follow suit: for instance we added a lowlevel_init() function to the
armv8 side, just for sunxi. The same game seems to repeat for the
ARM9 support we need for the F1C100s chip, and possibly for the RISC-V
part as well.

To avoid this and to cleanup some code on the way, remove the need for
lowlevel_init for sunxi completely, by:
- moving the early peripheral init (clocks, timer, pinmux) to
  board_init_f(). This also avoids executing those bits a second time when
  we boot up U-Boot proper. (patch 1/5)
- move the "SRAM setup" bits for just a few old SoCs into a separate file,
  and include this only if needed. (patch 3/5)
- move the ACTLR.SMPEN bit setting from board.c into start.S, because we
  actually need to set this bit early. Other platforms should be able to
  scrap their own copies and piggy back on this change. (patch 2/5)
This allows us to actually remove the lowlevel_init.S file from armv8 in
patch 4/5, as sunxi was the only user.
For good measure, we also clean up some bits in sunxi_common.h. (patch 5/5)

I compile tested this for all sunxi boards, and boot tested (into Linux) on
Pine64, PineH64, BananaPi M1, OrangePi Zero. But there is a high chance of
something breaking, so please give it a good shake on whatever Allwinner
hardware you have access to.

Thanks,
Andre

Changelog v1 ... v2:
- Move i2c_init_board() into existing I2C guard (patch 1/5)
- Make ARMV7_SET_CORTEX_SMPEN a blind symbol and select it (patch 2/5)
- Use sunxi_get_sram_id() instead of open coding it (patch 3/5)
- More precise wording in patch 4/5 commit message (lowlevel_init.S)
- Add Reviewed-by: and Tested-by: tags

Andre Przywara (5):
  sunxi: move non-essential code out of s_init()
  sunxi: move Cortex SMPEN setting into start.S
  sunxi: move early "SRAM setup" into separate file
  armv8: remove no longer needed lowlevel_init.S
  sunxi-common.h: remove pointless #ifdefs

 arch/arm/Kconfig                            |  3 -
 arch/arm/cpu/armv7/Kconfig                  |  5 ++
 arch/arm/cpu/armv7/start.S                  | 11 +++
 arch/arm/cpu/armv7/sunxi/Makefile           |  3 +
 arch/arm/cpu/armv7/sunxi/sram.c             | 40 +++++++++++
 arch/arm/cpu/armv8/Makefile                 |  1 -
 arch/arm/cpu/armv8/lowlevel_init.S          | 43 ------------
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h |  1 +
 arch/arm/mach-sunxi/Kconfig                 |  6 +-
 arch/arm/mach-sunxi/board.c                 | 76 +++++----------------
 include/configs/sunxi-common.h              |  7 --
 11 files changed, 82 insertions(+), 114 deletions(-)
 create mode 100644 arch/arm/cpu/armv7/sunxi/sram.c
 delete mode 100644 arch/arm/cpu/armv8/lowlevel_init.S

-- 
2.17.6

