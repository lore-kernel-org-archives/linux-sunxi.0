Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D2A79E2
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 10:56:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFFF7AB6;
	Fri,  9 Jun 2023 03:57:13 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BA953F587;
	Fri,  9 Jun 2023 03:56:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Vasut <marex@denx.de>,
	Sam Edwards <cfsworks@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] phy: sun4i: Allwinner F1C100s support and cleanup
Date: Fri,  9 Jun 2023 11:56:18 +0100
Message-Id: <20230609105621.1410483-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This mini series adds support for the Allwinner F1C100s USB PHY. There
is really not much to it, we just need to connect the compatible string
to a description that says we have one "old-style" PHY (patch 2/3).
Doing this revealed a bug, which is fixed in patch 1/3.

Also use the opportunity to fix a long-standing annoyance: we were
"select"ing the USB PHY driver from each SoC's Kconfig stanza, which does
not only look questionable, but also prevents USB support from being
deliberately disabled, for boards without USB sockets or to save
memory and boot time.

The fix in patch 1/3 is not urgent, since we were not hitting this
condition before, so this would all be 2023.10 material.

Cheers,
Andre

Andre Przywara (3):
  phy: sun4i-usb: Fix of_xlate() argument check
  phy: sun4i-usb: add Allwinner F1C100s support
  sunxi: Kconfig: rework PHY_USB_SUN4I selection

 arch/arm/mach-sunxi/Kconfig           | 11 -----------
 drivers/phy/allwinner/Kconfig         |  6 +++++-
 drivers/phy/allwinner/phy-sun4i-usb.c | 14 +++++++++++++-
 3 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.25.1

