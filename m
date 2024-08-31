Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FB22F1C
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Aug 2024 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725069932; cv=none; b=VOEdKGOqIbKPQ/effumNtrX2J4+diD3uFBThQOz54DCzgcw/Chb0THueN4OWzX/A6SihHBuOYGfYOlRUjYrGQ6EHiDeDbw7+tZAf363pGbAKSXoGzEayt9zLnfD7/no4tuxMbzb7nqv8zjFJUDvXE/pkpoi+63YhQYMd27OTGCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725069932; c=relaxed/simple;
	bh=XXaSyRz4jVXQCNfUM/WwpnTW0LR/5eni4LuVbJ82wgQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+5Cm5u9XCk7D9L1vHW2dec5P2DHusC5XntNijzBGUECULzDdbLpimeb+nSK1coMhKrpMxFsUnnqTMms3aH5H5nh1uKO8n0iV3CK/c30GDmEHEmNioAUABU945jDqb7ET6MDoNUYOe/CNmhSNPbPcdvJLFIKSYfoMRZAAPimMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wwdbg0w2fzpV9X;
	Sat, 31 Aug 2024 10:03:43 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 243231400CF;
	Sat, 31 Aug 2024 10:05:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:27 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <florian.fainelli@broadcom.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <heiko@sntech.de>, <yisen.zhuang@huawei.com>,
	<salil.mehta@huawei.com>, <hauke@hauke-m.de>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
	<ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>, <kvalo@kernel.org>,
	<lizetao1@huawei.com>, <u.kleine-koenig@pengutronix.de>,
	<jacky_chou@aspeedtech.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-wireless@vger.kernel.org>
Subject: [PATCH net-next 11/12] wifi: wilc1000: Convert using devm_clk_get_optional_enabled() in wilc_sdio_probe()
Date: Sat, 31 Aug 2024 10:13:33 +0800
Message-ID: <20240831021334.1907921-12-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831021334.1907921-1-lizetao1@huawei.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use devm_clk_get_optional_enabled() instead of devm_clk_get_optional() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the clk_disable_unprepare label, and the original error process can change
to dispose_irq.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/wireless/microchip/wilc1000/sdio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/sdio.c b/drivers/net/wireless/microchip/wilc1000/sdio.c
index 0043f7a0fdf9..a09ea24074e2 100644
--- a/drivers/net/wireless/microchip/wilc1000/sdio.c
+++ b/drivers/net/wireless/microchip/wilc1000/sdio.c
@@ -174,19 +174,18 @@ static int wilc_sdio_probe(struct sdio_func *func,
 	wilc->bus_data = sdio_priv;
 	wilc->dev = &func->dev;
 
-	wilc->rtc_clk = devm_clk_get_optional(&func->card->dev, "rtc");
+	wilc->rtc_clk = devm_clk_get_optional_enabled(&func->card->dev, "rtc");
 	if (IS_ERR(wilc->rtc_clk)) {
 		ret = PTR_ERR(wilc->rtc_clk);
 		goto dispose_irq;
 	}
-	clk_prepare_enable(wilc->rtc_clk);
 
 	wilc_sdio_init(wilc, false);
 
 	ret = wilc_load_mac_from_nv(wilc);
 	if (ret) {
 		pr_err("Can not retrieve MAC address from chip\n");
-		goto clk_disable_unprepare;
+		goto dispose_irq;
 	}
 
 	wilc_sdio_deinit(wilc);
@@ -195,14 +194,12 @@ static int wilc_sdio_probe(struct sdio_func *func,
 				   NL80211_IFTYPE_STATION, false);
 	if (IS_ERR(vif)) {
 		ret = PTR_ERR(vif);
-		goto clk_disable_unprepare;
+		goto dispose_irq;
 	}
 
 	dev_info(&func->dev, "Driver Initializing success\n");
 	return 0;
 
-clk_disable_unprepare:
-	clk_disable_unprepare(wilc->rtc_clk);
 dispose_irq:
 	irq_dispose_mapping(wilc->dev_irq_num);
 	wilc_netdev_cleanup(wilc);
@@ -217,7 +214,6 @@ static void wilc_sdio_remove(struct sdio_func *func)
 	struct wilc *wilc = sdio_get_drvdata(func);
 	struct wilc_sdio *sdio_priv = wilc->bus_data;
 
-	clk_disable_unprepare(wilc->rtc_clk);
 	wilc_netdev_cleanup(wilc);
 	kfree(sdio_priv->cmd53_buf);
 	kfree(sdio_priv);
-- 
2.34.1

