Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE507C
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Sep 2022 03:31:39 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MXP6B1MqSzHpfS;
	Wed, 21 Sep 2022 11:29:22 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 11:31:30 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <fengzheng923@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>
CC: <zengheng4@huawei.com>, <liwei391@huawei.com>
Subject: [PATCH -next] sound: sunxi: fix declaration compile error
Date: Wed, 21 Sep 2022 11:38:19 +0800
Message-ID: <20220921033819.2188233-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected

Just fix compile error without any logic changes.

sound/soc/sunxi/sun50i-dmic.c:62:1: error: ‘static’ is not at beginning of declaration [-Werror=old-style-declaration]
   62 | const static struct dmic_rate dmic_rate_s[] = {
      | ^~~~~

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index cd3c07f2070f..86cff5a5b1bd 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -59,7 +59,7 @@ struct dmic_rate {
 	unsigned int rate_bit;
 };
 
-const static struct dmic_rate dmic_rate_s[] = {
+static const struct dmic_rate dmic_rate_s[] = {
 	{48000, 0x0},
 	{44100, 0x0},
 	{32000, 0x1},
-- 
2.25.1

