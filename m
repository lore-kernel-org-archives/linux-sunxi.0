Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5742A9E
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Aug 2024 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725069933; cv=none; b=Yhn/werm6RCvQU+JVEsF/0tAK5pDWf0Z6qi9sfRVcKOCg3rKxLoWxHNdPgji4cieO+OmxbGq1MaMjMkm4xY18VTswuSNrpo3Zx+bJGzj2YRV/oST5+XXoedpSGifD+IkcWHiLHA/a89wJugoRV4G6ZKRJYSFFdlacvjiHtdYaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725069933; c=relaxed/simple;
	bh=Q1SNNG9W7ef1hqVdI0Qsork16INSEJRnz5CvBADlNwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDdFzlHNKiSasT28bW2KgkP0F6erDChr+tZJ827FIQpmjfDEa3GdwRITn8IS7ifhg/FmVO6OICpL3swOk5Dx58hZmw9/JHgXsJLIrkqqYix7t1Wx680RG6kXHBiMCkwmNRHquLmkf2ftl29hU6aX2tirqXwzhvuzzBkjdWcilvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wwdbh1Dd5zpVB5;
	Sat, 31 Aug 2024 10:03:44 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D0CD18010A;
	Sat, 31 Aug 2024 10:05:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:28 +0800
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
Subject: [PATCH net-next 12/12] wifi: wilc1000: Convert using devm_clk_get_optional_enabled() in wilc_bus_probe()
Date: Sat, 31 Aug 2024 10:13:34 +0800
Message-ID: <20240831021334.1907921-13-lizetao1@huawei.com>
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
no need to execute clk_disable_unprepare(clk) on the error path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/wireless/microchip/wilc1000/spi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/spi.c b/drivers/net/wireless/microchip/wilc1000/spi.c
index 5ff940c53ad9..05b577b1068e 100644
--- a/drivers/net/wireless/microchip/wilc1000/spi.c
+++ b/drivers/net/wireless/microchip/wilc1000/spi.c
@@ -228,12 +228,11 @@ static int wilc_bus_probe(struct spi_device *spi)
 	if (ret < 0)
 		goto netdev_cleanup;
 
-	wilc->rtc_clk = devm_clk_get_optional(&spi->dev, "rtc");
+	wilc->rtc_clk = devm_clk_get_optional_enabled(&spi->dev, "rtc");
 	if (IS_ERR(wilc->rtc_clk)) {
 		ret = PTR_ERR(wilc->rtc_clk);
 		goto netdev_cleanup;
 	}
-	clk_prepare_enable(wilc->rtc_clk);
 
 	dev_info(&spi->dev, "Selected CRC config: crc7=%s, crc16=%s\n",
 		 enable_crc7 ? "on" : "off", enable_crc16 ? "on" : "off");
@@ -266,7 +265,6 @@ static int wilc_bus_probe(struct spi_device *spi)
 	return 0;
 
 power_down:
-	clk_disable_unprepare(wilc->rtc_clk);
 	wilc_wlan_power(wilc, false);
 netdev_cleanup:
 	wilc_netdev_cleanup(wilc);
@@ -280,7 +278,6 @@ static void wilc_bus_remove(struct spi_device *spi)
 	struct wilc *wilc = spi_get_drvdata(spi);
 	struct wilc_spi *spi_priv = wilc->bus_data;
 
-	clk_disable_unprepare(wilc->rtc_clk);
 	wilc_netdev_cleanup(wilc);
 	kfree(spi_priv);
 }
-- 
2.34.1

