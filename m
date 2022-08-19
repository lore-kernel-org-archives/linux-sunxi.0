Received: from out29-75.mail.aliyun.com (out29-75.mail.aliyun.com [115.124.29.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F07B
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 03:02:34 +0000 (UTC)
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3962243|-1;BR=01201311R191S52rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0462487-0.00114242-0.952609;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.OwdZ-kK_1660877148;
Received: from SunxiBot.allwinnertech.com(mailfrom:michael@allwinnertech.com fp:SMTPD_---.OwdZ-kK_1660877148)
          by smtp.aliyun-inc.com;
          Fri, 19 Aug 2022 10:45:49 +0800
From: Michael Wu <michael@allwinnertech.com>
To: linus.walleij@linaro.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: Fix name for A100 R_PIO
Date: Fri, 19 Aug 2022 10:45:41 +0800
Message-Id: <20220819024541.74191-1-michael@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of A100 R_PIO driver should be sun50i-a100-r-pinctrl,
not sun50iw10p1-r-pinctrl.

Fixes: 473436e7647d6 ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")

Signed-off-by: Michael Wu <michael@allwinnertech.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
index afc1f5df7545..b82ad135bf2a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
@@ -99,7 +99,7 @@ MODULE_DEVICE_TABLE(of, a100_r_pinctrl_match);
 static struct platform_driver a100_r_pinctrl_driver = {
 	.probe	= a100_r_pinctrl_probe,
 	.driver	= {
-		.name		= "sun50iw10p1-r-pinctrl",
+		.name		= "sun50i-a100-r-pinctrl",
 		.of_match_table	= a100_r_pinctrl_match,
 	},
 };
-- 
2.29.0

