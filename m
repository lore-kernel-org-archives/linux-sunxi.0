Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E294173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:18 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935456t8vhzm7p
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:55 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: L8+aRVORnLnOyJHbeOEHJmw5XwiArYMu3RzZ/lHhXwaalPk7qe3fiA953A9km
	ZGBJ4khV6j//JwBf8U7isxzPOnXldOCI0YOoO/52goiV+EN7/gzWduZrE/a3u0QvasODzId
	XCGCL2ll6CUh9ODqOdMBefAlcV0O/iLqGRHfCDCNYZ4yxnL2drIEueUBbaexchU090H68gB
	HtPZpUW+Fitk5kloI4hAt4Tsd3Iy+DlwfxEYePirnJzImA554ZjhezR5+6tvpp2HC0l00tj
	znIR0zOGAIN6AqUIoYsFbRK9qvTxys+5iu8cpn5zG376xAhy3Qz5UmBwOYYQ7i5ouhf37WH
	v6+h+m+xgzj3hcxQ0pUHJWOx+OMtw==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 11/13] mmc: sunxi: add support for R329 MMC controller
Date: Thu, 22 Jul 2021 14:30:13 +0800
Message-Id: <20210722063015.421923-12-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam2

R329 SoC has similar MMC controllers with previous Allwinner SoCs.

Add support for it by adding its compatible string.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 drivers/mmc/sunxi_mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 6b809c001f..59cc28794d 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -734,6 +734,7 @@ static const struct udevice_id sunxi_mmc_ids[] = {
 	{ .compatible = "allwinner,sun50i-h6-emmc" },
 	{ .compatible = "allwinner,sun50i-a100-mmc" },
 	{ .compatible = "allwinner,sun50i-a100-emmc" },
+	{ .compatible = "allwinner,sun50i-r329-mmc" },
 	{ /* sentinel */ }
 };
 
-- 
2.30.2


