Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227A17C
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jun 2023 00:08:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A0CAB6;
	Tue,  6 Jun 2023 17:09:03 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A831B3F587;
	Tue,  6 Jun 2023 17:08:16 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/5] sunxi: H616: improve DRAM setup and add LPDDR3 support
Date: Wed,  7 Jun 2023 01:07:40 +0100
Message-Id: <20230607000745.10245-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series picks up on Mikhail's H616 LPDDR3 DRAM support (many thanks
again for sending that!), and prepends some patches that help to keep
the code size down.
This was triggered by Mikhail's patches creating bigger binaries, even
though the DRAM type is known at compile time, and the compiler should
optimise out the unused code parts.
Looking at the disassembly I found some issues that this series fixes:
- One function was not declared static, so was issued separately in the
  object file (patch 1/5).
- Many functions do not change the values in the struct that gets passed
  in, so we should mark this pointer as "const", to help the compiler
  with the "constant propagation" optimisation (patch 2/5).
- This alone does not really help, as this structure contains both
  variable and fixed fields. Patch 3/5 splits that up, so we can define
  one struct as "static const", which finally convinces the compiler to
  fold the compile-time constants into the code, and removes the code
  for the unused DRAM variant, along with other code parts. Even without
  the LPDDR3 support this reduces the code size by about 2KB(!), and
  allows the LPDDR3 patches to come for free, code-size wise.
- The final two patches are Mikhail's patches, slightly massaged: white
  space issue, keeping the static const phy_init[] array, rebased on
  top of the "const" work above. I haven't reviewed the patch in anger,
  though.

Please have a look and test.

Cheers,
Andre

Andre Przywara (3):
  sunxi: dram: make MBUS configuration functions static
  sunxi: H616: dram: const-ify DRAM function parameters
  sunxi: H616: dram: split struct dram_para

iuncuim (2):
  sunxi: H616: add DRAM type selection
  sunxi: H616: add LPDDR3 DRAM support

 .../include/asm/arch-sunxi/dram_sun50i_h616.h |  12 +-
 arch/arm/mach-sunxi/Kconfig                   |  18 +-
 arch/arm/mach-sunxi/dram_sun50i_h6.c          |   3 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 383 +++++++++++-------
 arch/arm/mach-sunxi/dram_sunxi_dw.c           |  18 +-
 arch/arm/mach-sunxi/dram_timings/Makefile     |   4 +-
 .../mach-sunxi/dram_timings/h616_ddr3_1333.c  |   2 +-
 .../arm/mach-sunxi/dram_timings/h616_lpddr3.c |  95 +++++
 configs/orangepi_zero2_defconfig              |   1 +
 configs/x96_mate_defconfig                    |   1 +
 10 files changed, 372 insertions(+), 165 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c

-- 
2.35.8

