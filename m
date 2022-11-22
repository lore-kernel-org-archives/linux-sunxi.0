Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005F7E
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Nov 2022 01:47:15 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VVPc8zs_1669079778;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VVPc8zs_1669079778)
          by smtp.aliyun-inc.com;
          Tue, 22 Nov 2022 09:16:19 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] clk: Fix one kernel-doc comment
Date: Tue, 22 Nov 2022 09:16:16 +0800
Message-Id: <20221122011616.1530-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype for sunxi_ccu_set_mmc_timing_mode(). Prototype was for sunxi_ccu_get_mmc_timing_mode() instead

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3230
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/sunxi-ng/ccu_mmc_timing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mmc_timing.c b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
index de33414fc5c2..c6a6ce98ca03 100644
--- a/drivers/clk/sunxi-ng/ccu_mmc_timing.c
+++ b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
@@ -43,7 +43,7 @@ int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode)
 EXPORT_SYMBOL_GPL(sunxi_ccu_set_mmc_timing_mode);
 
 /**
- * sunxi_ccu_set_mmc_timing_mode: Get the current MMC clock timing mode
+ * sunxi_ccu_get_mmc_timing_mode: Get the current MMC clock timing mode
  * @clk: clock to query
  *
  * Returns 0 if the clock is in old timing mode, > 0 if it is in
-- 
2.20.1.7.g153144c

