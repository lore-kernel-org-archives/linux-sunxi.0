Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44B389
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Aug 2023 02:45:35 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8R63hSzzNn0t;
	Thu, 17 Aug 2023 10:41:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:25 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
CC: <robh@kernel.org>, <martin.blumenstingl@googlemail.com>,
	<philmd@linaro.org>, <geert+renesas@glider.be>,
	<u.kleine-koenig@pengutronix.de>, <rogerq@kernel.org>,
	<paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
	<yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
	<christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
	<jinpu.wang@ionos.com>, <lizetao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next 00/11] mtd: Use devm_clk_get_enabled() to simplify the drivers.
Date: Thu, 17 Aug 2023 10:44:58 +0800
Message-ID: <20230817024509.3951629-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*enabled(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clock explicitly when remove drivers or in the
error handling path.

Li Zetao (11):
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
  mtd: spi-nor: Use helper function devm_clk_get_enabled()

 drivers/mtd/devices/spear_smi.c               | 15 ++-------
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 +++-------------
 drivers/mtd/nand/raw/fsmc_nand.c              |  8 +----
 drivers/mtd/nand/raw/intel-nand-controller.c  | 15 ++-------
 drivers/mtd/nand/raw/lpc32xx_slc.c            | 12 ++-----
 drivers/mtd/nand/raw/mpc5121_nfc.c            | 11 ++-----
 drivers/mtd/nand/raw/mtk_nand.c               | 20 ++++-------
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 17 +++-------
 drivers/mtd/nand/raw/sunxi_nand.c             | 29 ++++------------
 drivers/mtd/nand/raw/vf610_nfc.c              | 29 +++++-----------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c   | 33 ++++---------------
 11 files changed, 48 insertions(+), 170 deletions(-)

-- 
2.34.1

