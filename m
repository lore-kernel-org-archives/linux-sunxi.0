Received: from mail142-4.mail.alibaba.com (mail142-4.mail.alibaba.com [198.11.142.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C956173
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Jan 2022 08:05:01 +0000 (UTC)
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1070646|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00848475-0.00139035-0.990125;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.MWR.1lZ_1641276209;
Received: from sunxibot.allwinnertech.com(mailfrom:michael@allwinnertech.com fp:SMTPD_---.MWR.1lZ_1641276209)
          by smtp.aliyun-inc.com(10.147.41.199);
          Tue, 04 Jan 2022 14:03:29 +0800
From: Michael Wu <michael@allwinnertech.com>
To: ulf.hansson@linaro.org,
	mripard@kernel.org,
	wens@csie.org,
	samuel@sholland.org,
	andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Wu <michael@allwinnertech.com>
Subject: [PATCH v2] mmc: sunxi-mmc: check ocr_avail on resource request
Date: Tue,  4 Jan 2022 14:03:25 +0800
Message-Id: <20220104060325.3957-1-michael@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some platforms have no regulator, discrete power devices are used instead.
However, sunxi_mmc_probe does not catch this exception when regulator is
absent in DTS. This leads to sd or eMMC init failure.

To solve this, a fixed vmmc regulator must be hooked up in DTS, like this:
reg_dummy_vmmc: dummy_vmmc {
	compatible = "regulator-fixed";
	regulator-name = "dummy-vmmc";
	regulator-min-microvolt = <3300000>;
	regulator-max-microvolt = <3300000>;
};

mmc0:mmc@4020000 {
	compatible = "allwinner,sun50i-a100-emmc";
	device_type = "mmc0";
	vmmc-supply = <&reg_dummy_vmmc>;
}

In this patch, we print an error message and abort the probe process if
the regulator is not specified in DTS.

Signed-off-by: Michael Wu <michael@allwinnertech.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 2702736a1c57..0da74bddaf87 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1300,6 +1300,11 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
 	if (ret)
 		return ret;
 
+	if (!host->mmc->ocr_avail) {
+		dev_err(&pdev->dev, "Could not get mmc regulator\n");
+		return -EINVAL;
+	}
+
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
 		return PTR_ERR(host->reg_base);
-- 
2.29.0

