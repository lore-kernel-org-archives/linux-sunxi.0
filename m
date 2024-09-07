Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366D364BE
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Sep 2024 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678641; cv=none; b=h4lH2EedR/g08E1AjPNvmtX54od+adUfWt/O0r898V7XouOGVSBLsMxKqcBGY5oMbcfTSk7BKE9FUz/FOlohpKmMmBLUloKOLztA70rR3otoyFpbVL2am0VfYAN2Y54sAouG7RDXs/fYuNp0P3bt+IYGSskce+zuN2LZbRv3fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678641; c=relaxed/simple;
	bh=fdKYo9K1OXr0IDZFawPQMci//VX89V9KaEj7kZo7VWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SkjfeflyTs5DHWq9w1X99uZDbpbi6AH6uIjjml4ED4kfNz/DQRPyQ7LrIHUO11CQksqIkFDadlSSa0AcjYGVlMXiVMdJ2qZ+PtyViov9HAuvAedpAT978czsPqF4klEOvCg1rEC3qYpYezAZ6UH0Aw9OiXTEkek/SL6+m3aaZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0yds3ykNz20nY1;
	Sat,  7 Sep 2024 11:05:37 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C0041A0188;
	Sat,  7 Sep 2024 11:10:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:36 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <florian.fainelli@broadcom.com>, <andrew@lunn.ch>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
	<lizetao1@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH net-next v2 00/10] net: Convert using devm_clk_get_enabled()/devm_clk_get_optional_enabled()
Date: Sat, 7 Sep 2024 11:19:16 +0800
Message-ID: <20240907031926.3591353-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)

v1 -> v2:
  1) Patch 5 optimizes the check and adds commit information for easier
  inspection.
  2) It is no longer necessary to use clk, so delete the clk member of
  the spl2sw_common structure.
  3) Remove patches 11 and 12, they should be sent to wireless-next
  individually

v1:
https://lore.kernel.org/all/20240831021334.1907921-1-lizetao1@huawei.com/

There are many examples[1][2] of clk resource leakage in LTS. The
reason is that developers need to maintain the allocation and release
of clk resources themselves, but this will increase the burden on
developers. Using the API related to devm_clk_get_*_enable ensures
that the life cycle of clk is consistent with that of the device,
reducing the risk of unreleased resources like clk.

Several other developers are also working on converting to more
secure interfaces, and this patch set is in principle the same as
theirs.

[1]:
https://lore.kernel.org/all/20240812160128.338041191@linuxfoundation.org/
[2]:
https://lore.kernel.org/all/20240812160135.992451065@linuxfoundation.org/

Li Zetao (10):
  net: dsa: bcm_sf2: Convert using devm_clk_get_optional_enabled() in
    bcm_sf2_sw_probe()
  net: ethernet: Convert using devm_clk_get_enabled() in emac_probe()
  net: ethernet: arc: Convert using devm_clk_get_enabled() in
    emac_probe()
  net: ethernet: ethoc: Convert using devm_clk_get_enabled() in
    ethoc_probe()
  net: ftgmac100: Convert using devm_clk_get_enabled() in
    ftgmac100_setup_clk()
  net: ethernet: hisilicon: Convert using devm_clk_get_enabled() in
    hisi_femac_drv_probe()
  net: lantiq_xrx200: Convert using devm_clk_get_enabled() in
    xrx200_probe()
  net: stmmac: dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled()
    in dwc_qos_probe()
  net: ethernet: sunplus: Convert using devm_clk_get_enabled() in
    spl2sw_probe()
  net: xilinx: axienet: Convert using devm_clk_get_optional_enabled() in
    axienet_probe()

 drivers/net/dsa/bcm_sf2.c                     | 28 ++----
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 13 +--
 drivers/net/ethernet/arc/emac_rockchip.c      | 34 ++-----
 drivers/net/ethernet/ethoc.c                  | 18 ++--
 drivers/net/ethernet/faraday/ftgmac100.c      | 26 +----
 drivers/net/ethernet/hisilicon/hisi_femac.c   | 17 +---
 drivers/net/ethernet/lantiq_xrx200.c          | 17 +---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
 drivers/net/ethernet/sunplus/spl2sw_define.h  |  1 -
 drivers/net/ethernet/sunplus/spl2sw_driver.c  | 25 ++---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 +--
 11 files changed, 62 insertions(+), 230 deletions(-)

-- 
2.34.1

