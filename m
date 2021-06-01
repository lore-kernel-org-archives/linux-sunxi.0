Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A74173
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Jun 2021 06:34:10 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvMh55w3rzWpfF;
	Tue,  1 Jun 2021 14:29:25 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 14:34:07 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 14:34:06 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Lee Jones <lee.jones@linaro.org>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi
	<linux-sunxi@lists.linux.dev>, linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mfd: sun6i-prcm: Use DEFINE_RES_MEM() to simplify code
Date: Tue, 1 Jun 2021 14:34:01 +0800
Message-ID: <20210601063401.9830-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected

No functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mfd/sun6i-prcm.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
index c31927d4bbbecde..ee03db0b8485266 100644
--- a/drivers/mfd/sun6i-prcm.c
+++ b/drivers/mfd/sun6i-prcm.c
@@ -20,43 +20,23 @@ struct prcm_data {
 };
 
 static const struct resource sun6i_a31_ar100_clk_res[] = {
-	{
-		.start = 0x0,
-		.end = 0x3,
-		.flags = IORESOURCE_MEM,
-	},
+	DEFINE_RES_MEM(0x0, 4)
 };
 
 static const struct resource sun6i_a31_apb0_clk_res[] = {
-	{
-		.start = 0xc,
-		.end = 0xf,
-		.flags = IORESOURCE_MEM,
-	},
+	DEFINE_RES_MEM(0xc, 4)
 };
 
 static const struct resource sun6i_a31_apb0_gates_clk_res[] = {
-	{
-		.start = 0x28,
-		.end = 0x2b,
-		.flags = IORESOURCE_MEM,
-	},
+	DEFINE_RES_MEM(0x28, 4)
 };
 
 static const struct resource sun6i_a31_ir_clk_res[] = {
-	{
-		.start = 0x54,
-		.end = 0x57,
-		.flags = IORESOURCE_MEM,
-	},
+	DEFINE_RES_MEM(0x54, 4)
 };
 
 static const struct resource sun6i_a31_apb0_rstc_res[] = {
-	{
-		.start = 0xb0,
-		.end = 0xb3,
-		.flags = IORESOURCE_MEM,
-	},
+	DEFINE_RES_MEM(0xb0, 4)
 };
 
 static const struct resource sun8i_codec_analog_res[] = {
-- 
2.26.0.106.g9fadedd


