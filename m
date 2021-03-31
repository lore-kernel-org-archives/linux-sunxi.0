Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8116F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 10:02:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0321042;
	Wed, 31 Mar 2021 03:02:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B148E3F792;
	Wed, 31 Mar 2021 03:02:46 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] sunxi: Last minute Allwinner H616 fixes
Date: Wed, 31 Mar 2021 11:02:29 +0100
Message-Id: <20210331100229.23557-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

please pull the sunxi master branch, containing two fixes to make U-Boot
match the H616 TF-A port, which has been merged this morning.
The link address of BL31 was changed last minute, so we need to fix this
in U-Boot as well. Since the H616 support was only added to U-Boot in
this cycle, this should hit the v2021.04 release still, to avoid
compatibility issues.

Booted to the Linux prompt on the OrangePi Zero2 and on a Pine64-LTS,
build tested for all 156 sunxi boards.

Thanks,
Andre

==============

The following changes since commit d8eafb16c85bc3b5d85d7ba8ebb1438cc0ae168f:

  Prepare v2021.04-rc5 (2021-03-29 17:20:13 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git 

for you to fetch changes up to 62acef239f77583f3083f8c842ea2d28f4a1623c:

  sunxi: dts: H616: Drop reserved-memory node (2021-03-31 09:50:31 +0100)

----------------------------------------------------------------
Andre Przywara (2):
      sunxi: H616: Change TF-A load address to beginning of DRAM
      sunxi: dts: H616: Drop reserved-memory node

 arch/arm/dts/sun50i-h616.dtsi  | 12 ------------
 arch/arm/dts/sunxi-u-boot.dtsi |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)
