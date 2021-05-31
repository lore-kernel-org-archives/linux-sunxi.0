Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F6E72
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 00:24:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65A096D;
	Sun, 30 May 2021 17:24:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E843F774;
	Sun, 30 May 2021 17:24:13 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Simon Baatz <gmbnomis@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: Pull request: u-boot-sunxi/master for v2021.07
Date: Mon, 31 May 2021 01:23:45 +0100
Message-Id: <20210531002345.1335-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

please pull the master branch from u-boot-sunxi, containing the fix
to bring back the SD card as MMC0. In the long run we are looking into a
more robust solution, but for now we need to fix this, as this breaks
the user experience left, right, and centre.
Also add the one MAINTAINERS path addition from Samuel.

Thanks,
Andre

==============
The following changes since commit ffd810487ec2ff6095edf3f3d058d7ed6eb85ff3:

  Merge tag 'u-boot-stm32-20210528' of https://source.denx.de/u-boot/custodians/u-boot-stm (2021-05-28 14:11:06 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to f264e796c06d7ce6c039bfc7255390309cbc5191:

  MAINTAINERS: Add allwinner/sunxi driver directories (2021-05-31 00:39:54 +0100)

----------------------------------------------------------------
Andre Przywara (1):
      sunxi: Bring back SD card as MMC device 0

Samuel Holland (1):
      MAINTAINERS: Add allwinner/sunxi driver directories

 MAINTAINERS                    | 3 +++
 arch/arm/dts/sunxi-u-boot.dtsi | 1 +
 2 files changed, 4 insertions(+)
