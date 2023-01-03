Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5407F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jan 2023 01:19:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35BF44B3;
	Mon,  2 Jan 2023 17:20:19 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDBBC3F663;
	Mon,  2 Jan 2023 17:19:35 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 0/2] sunxi: D1/D1s/R528/T113-s DRAM init code
Date: Tue,  3 Jan 2023 01:17:53 +0000
Message-Id: <20230103011755.10756-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the extracted version of the Allwinner D1/D1s/R528/T113-s DRAM
"driver", to be included into mainline U-Boot at some point. With this
on top of my previous T113-s3 support series[1], I can boot my MangoPi MQ-R
without the help of awboot.
The DRAM init code is based on awboot's version, though has been heavily
reworked. To show what has been done, I pushed a history branch [2], which
takes a verbatim copy of awboot's mctl_hal.c, then converts this over the
course of about 80 patches into the version posted here. The series there
contains an awboot/U-Boot compat layer, so the file can be used in both
repositories. This compat layer is dropped here, but can be put back by
reverting the top patch of [2].

I was wondering if people could have a look at this version here, to give
early feedback. I will (re-)post this as part of a proper R528/T113-s
support series, but first need to sort out some minor issues and address
Samuel's comments on the previous version.

If you wonder, the (working!) Kconfig DRAM variables for the T113-s3 are:
CONFIG_DRAM_CLK=792
CONFIG_DRAM_ZQ=8092667
CONFIG_DRAM_SUNXI_ODT_EN=0
CONFIG_DRAM_SUNXI_TPR0=0x004a2195
CONFIG_DRAM_SUNXI_TPR11=0x340000
CONFIG_DRAM_SUNXI_TPR12=0x46
CONFIG_DRAM_SUNXI_TPR13=0x34000100

For the D1 with DDR3 chips (most boards?), it should be those values:
CONFIG_DRAM_CLK=792
CONFIG_DRAM_SUNXI_ODT_EN=1
CONFIG_DRAM_SUNXI_TPR0=0x004a2195
CONFIG_DRAM_SUNXI_TPR11=0x870000
CONFIG_DRAM_SUNXI_TPR12=0x24
CONFIG_DRAM_SUNXI_TPR13=0x34050100

According to the dump of some MangoPi MQ-1 firmware, the D1s should work with:
CONFIG_SUNXI_DRAM_DDR2=y
CONFIG_DRAM_CLK=528
CONFIG_DRAM_ZQ=8092665
CONFIG_DRAM_SUNXI_ODT_EN=0
CONFIG_DRAM_SUNXI_TPR0=0x00471992
CONFIG_DRAM_SUNXI_TPR11=0x30010
CONFIG_DRAM_SUNXI_TPR12=0x35
CONFIG_DRAM_SUNXI_TPR13=0x34000000

Many thanks!
Andre

[1] https://lore.kernel.org/u-boot/20221206004549.29015-1-andre.przywara@arm.com/
[2] https://github.com/apritzel/u-boot/commits/d1_dram_history

Andre Przywara (2):
  Kconfig: sunxi: prepare for using drivers/ram/sunxi
  sunxi: add R528/T113-s3/D1(s) DRAM initialisation code

 drivers/Makefile                   |    1 +
 drivers/ram/Kconfig                |    3 +-
 drivers/ram/Makefile               |    2 +
 drivers/ram/sunxi/Kconfig          |   68 ++
 drivers/ram/sunxi/Makefile         |    4 +
 drivers/ram/sunxi/dram_sun20i_d1.c | 1425 ++++++++++++++++++++++++++++
 drivers/ram/sunxi/dram_sun20i_d1.h |   70 ++
 7 files changed, 1572 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ram/sunxi/Kconfig
 create mode 100644 drivers/ram/sunxi/Makefile
 create mode 100644 drivers/ram/sunxi/dram_sun20i_d1.c
 create mode 100644 drivers/ram/sunxi/dram_sun20i_d1.h

-- 
2.35.5

