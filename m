Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C65363
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 00:33:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 935A614BF;
	Thu,  5 May 2022 17:33:21 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2720F3FA31;
	Thu,  5 May 2022 17:33:20 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: clk: fix unhandled clocks warnings
Date: Fri,  6 May 2022 01:32:59 +0100
Message-Id: <20220506003301.13194-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The introduction of the DM pinctrl driver saw many clocks, referenced in
the respective pinctrl DT nodes, being enabled by the DM clock driver.

We didn't model all them correctly, so there are now some warnings on
the console when booting:
=========
sunxi_set_gate: (CLK#58) unhandled
=========

This series fixes them. The first patch just describes some missing gate
clocks, mostly for the pin controller directly.
The second patch introduces a GATE_DUMMY macro, that allows to just
ignore some other clocks, and to suppress the warnings.

Please have a look and test!

Cheers,
Andre

Andre Przywara (2):
  clk: sunxi: add PIO bus gate clocks
  clk: sunxi: add and use dummy gate clocks

 drivers/clk/sunxi/clk_a10.c   | 2 ++
 drivers/clk/sunxi/clk_a10s.c  | 2 ++
 drivers/clk/sunxi/clk_a23.c   | 2 ++
 drivers/clk/sunxi/clk_a31.c   | 2 ++
 drivers/clk/sunxi/clk_a64.c   | 4 ++++
 drivers/clk/sunxi/clk_a80.c   | 2 ++
 drivers/clk/sunxi/clk_a83t.c  | 2 ++
 drivers/clk/sunxi/clk_h3.c    | 4 ++++
 drivers/clk/sunxi/clk_h6.c    | 4 ++++
 drivers/clk/sunxi/clk_h616.c  | 4 ++++
 drivers/clk/sunxi/clk_h6_r.c  | 2 ++
 drivers/clk/sunxi/clk_r40.c   | 2 ++
 drivers/clk/sunxi/clk_sunxi.c | 3 +++
 drivers/clk/sunxi/clk_v3s.c   | 2 ++
 include/clk/sunxi.h           | 5 +++++
 15 files changed, 42 insertions(+)

-- 
2.35.3

