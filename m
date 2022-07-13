Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24C44681
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 15:28:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70CDD15A1;
	Wed, 13 Jul 2022 08:28:05 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22F0F3F73D;
	Wed, 13 Jul 2022 08:28:04 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 0/3] sunxi: FEL boot fixes
Date: Wed, 13 Jul 2022 16:27:55 +0100
Message-Id: <20220713152758.56929-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While investigating a FEL boot failure on the OrangePi Zero 2 board
(with an H616 SoC), I stared at our FEL code and found some issues,
which this series fixes.

Unfortunately those didn't fix the H616 problem, but they are worth
having anyway.

For the records on the FEL failure: with certain H616 DRAM parameters,
newer GCCs (starting with GCC 11, GCC 10 is fine) generate an SPL binary
that doesn't properly return to the BootROM after the SPL code has
finished. This does not occur on other H616 boards using different DRAM
parameters. Staring at the disassemblies from the different compiler
versions for a while didn't show anything obvious, the best theory so
far is that it's due to a subtle timing issue in the DRAM initialisation
code. Inserting a "udelay(0);" at the beginning of
mctl_phy_read_calibration() seems to avoid the problem, but is obviously
not a proper fix. I will keep looking.

However the issues addressed in this series should be fixed, regardless.

Cheers,
Andre

Andre Przywara (3):
  sunxi: armv8: fel: load only 32-bit values
  sunxi: h616: lower SPL stack address to avoid BROM data
  sunxi: fel: drop redundant "control register" save/restore

 arch/arm/cpu/armv7/sunxi/fel_utils.S | 4 ----
 arch/arm/cpu/armv8/fel_utils.S       | 8 ++++----
 arch/arm/mach-sunxi/board.c          | 1 -
 include/configs/sunxi-common.h       | 2 +-
 4 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.25.1

