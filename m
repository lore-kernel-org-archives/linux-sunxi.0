Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D28D230D1E
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739537766; cv=none; b=iB5v/udwvywljU9TX7mE3pkszUAjMU0dhDL/XbJMA9uQruXy+zQ+s8Yhyd51ggT2lfJ0hWjqXgIqYJ+gVwFLkryTONIXNuvhQUXjATaCvnh1CrMe8QN+zdw69h5EtBvdSQ/v4M98eDjum9cqdjw8E3S/fhozB/uFhAlmjKEULzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739537766; c=relaxed/simple;
	bh=4T7OLcqGW/wYv42Er8iU0CmHpl1TG9/5qKHcWsLu3wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS2NmZcg/7e8OfpcGsUs830K+83pcOcdZ+Fs9hLtXz+SbbFTBmmSgsquRXNLfI7wlJJk7IKHyAC86mbw/r5owzoxsDoznS8r9krsqvlpVItJE/PGd2sORgBL0x8KcsHhPs/h6xcPj64R4BOA85+DMqaQKhj0J5py6NL7g1PyX6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64D6113E;
	Fri, 14 Feb 2025 04:56:23 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971273F58B;
	Fri, 14 Feb 2025 04:56:01 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/15] clk: sunxi-ng: add A523 clock support
Date: Fri, 14 Feb 2025 12:53:44 +0000
Message-ID: <20250214125359.5204-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the second drop of the series introducing basic clock support for
the Allwinner A523 family of SoCs, comprising A523, A527, T527, H728. [1]
Since the posting of v1, a T527 user manual surfaced, so we could add
an extra clock, and confirm and clarify on some existing (guessed) ones.
This also contains some fixes to some clock definitions, which were
found either during testing or while checking for new clocks.
One big change in this series is the split of the main CCU driver into 9
patches, purely to help review. For a more detailed changelog, see below.

*************
Please note that the clock numbers changed compared to v1, so DTs from
that era cannot be used anymore with this driver: you have to update
the DTB. Just copying the binding header and recompiling the DTB should do
the trick, since the symbols stayed mostly the same, at least as far they
are used in the basic DTs we use today.
*************

The SoCs contain *four* CCU components, aside from the usual main clock
device and the PRCM clock (in the always-on-domain), there is an MCU
clock and a DSP clock. This series just adds support for the first two,
the other two don't seem to be required for the basic functionality.

The clock tree of each SoC has always been individual, even though the
main clock *types* mostly remain the same. This time we see two slight
variations: There is an MP clock without the P (shift) part, and there
is one with two dividers instead of one divider and one shift field.
The first three patches add support for these new clock types.

Patch 04/15 add the DT binding description for the main CCU, along with
all the clock numbers already defined in the binding headers.
Since the main CCU is massive, and contains a lot of detail, I decided
to split this driver up into 9 patches, simply to help review. I tried
to group them somewhat logically, although this is rather arbitrary, and
just to make each individual patch smaller. I am happy to squash them
all back into one patch once they have been reviewed, for the final
merge. The PRCM CCU is comparably small, so I kept this in one patch.

Interestingly the Allwinner BSP has switched to using the existing sunxi
CCU framework for modelling the clocks (they had their own way before), so
we could theoretically use their code. However when I started working on
this more than a year ago, their files had a GPL-3.0-only license header,
which, according to my research, makes them incompatible for mainline
inclusion. I thus started from "scratch" (adjusting the D1 driver, really).
Meanwhile they seem to have changed the license, and a quick comparison
turned up some differences, some of which seem to be bugs on their, some
on my side, probably. I hope having such a "reference" helps the mainline
code quality, as people can help the review by comparing code.

Given the level of detail required in CCU drivers, I am certain there are
many bugs in there, also many things that can be improved. But after
starring and editing this for weeks, I feel like it's time for the
community to have a look, so please help with the review, and also test.

Based on v6.14-rc1.

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3

Changelog v1 .. v2:
- rebase onto v6.14-rc1
- split main CCU definition patch into 9 smaller patches
- rename RST_BUS_VO1_TCONLCD0 to RST_BUS_TCON_LCD2
- insert CLK_PLL_VIDEO3_xx clocks
- add clock for 2nd EMAC
- add R_SPI name (though clock definiton is still missing)
- fix ISP clock definition
- remove BSP comments from clocks now documented in the T527 manual
- add Conor's binding ACKs (with thanks!)

Andre Przywara (15):
  clk: sunxi-ng: mp: Add SUNXI_CCU_P_DATA_WITH_MUX_GATE wrapper
  clk: sunxi-ng: mp: introduce dual-divider clock
  clk: sunxi-ng: mp: provide wrapper for setting feature flags
  dt-bindings: clk: sunxi-ng: add compatible for the A523 CCU
  clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
  clk: sunxi-ng: a523: Add support for bus clocks
  clk: sunxi-ng: a523: add video mod clocks
  clk: sunxi-ng: a523: add system mod clocks
  clk: sunxi-ng: a523: add interface mod clocks
  clk: sunxi-ng: a523: add USB mod clocks
  clk: sunxi-ng: a523: remaining mod clocks
  clk: sunxi-ng: a523: add bus clock gates
  clk: sunxi-ng: a523: add reset lines
  dt-bindings: clk: sunxi-ng: add compatible for the A523 PRCM-CCU
  clk: sunxi-ng: add support for the A523/T527 PRCM CCU

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   76 +-
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    4 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      |  245 +++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h      |   14 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        | 1641 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |   14 +
 drivers/clk/sunxi-ng/ccu_common.h             |    1 +
 drivers/clk/sunxi-ng/ccu_mp.c                 |   51 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   39 +-
 include/dt-bindings/clock/sun55i-a523-ccu.h   |  190 ++
 include/dt-bindings/clock/sun55i-a523-r-ccu.h |   37 +
 include/dt-bindings/reset/sun55i-a523-ccu.h   |   87 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h |   25 +
 14 files changed, 2394 insertions(+), 40 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h

-- 
2.46.3

