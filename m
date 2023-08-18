Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96CE56C
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 07:47:09 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv751dK3zkX6d;
	Fri, 18 Aug 2023 15:45:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:46:59 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <mcoquelin.stm32@gmail.com>, <michael@walle.cc>,
	<michal.simek@amd.com>, <miquel.raynal@bootlin.com>,
	<nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
	<rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
	<tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
	<vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next v2 00/12] mtd: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Fri, 18 Aug 2023 15:46:30 +0800
Message-ID: <20230818074642.308166-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clock explicitly when remove drivers or in the
error handling path.

Change log:

v2:
 - Modify the format of the reference commit, use "since" instead of
 "after".
 - Drop the helper functions mtk_nfc_enable_clk() and
 mtk_nfc_disable_clk(), because both of them now have a single user.
 - Add a new patch, replace devm_clk_get_optional() +
 clk_prepare_enable() with devm_clk_get_optional_enabled().

v1: https://lore.kernel.org/all/20230817024509.3951629-1-lizetao1@huawei.com/

Li Zetao (12):
  mtd: spear_smi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
  mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: intel: Use helper function devm_clk_get_enabled()
  mtd: rawnand: lpc32xx_slc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mpc5121: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
  mtd: rawnand: stm32_fmc2: Use helper function devm_clk_get_enabled()
  mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
  mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: orion: Use helper function
    devm_clk_get_optional_enabled()

 drivers/mtd/devices/spear_smi.c               | 15 +----
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++-------
 drivers/mtd/nand/raw/fsmc_nand.c              | 12 +---
 drivers/mtd/nand/raw/intel-nand-controller.c  | 15 +----
 drivers/mtd/nand/raw/lpc32xx_slc.c            | 12 +---
 drivers/mtd/nand/raw/mpc5121_nfc.c            | 11 +---
 drivers/mtd/nand/raw/mtk_nand.c               | 62 ++++++-------------
 drivers/mtd/nand/raw/orion_nand.c             | 22 ++-----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 17 ++---
 drivers/mtd/nand/raw/sunxi_nand.c             | 29 ++-------
 drivers/mtd/nand/raw/vf610_nfc.c              | 29 +++------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c   | 33 ++--------
 12 files changed, 67 insertions(+), 219 deletions(-)

-- 
2.34.1

