Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133C53A7
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Sep 2022 13:39:56 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MTZrS5kzczBsM4;
	Fri, 16 Sep 2022 21:37:44 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 21:39:49 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 16 Sep
 2022 21:39:48 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] crypto: sun4i-ss - use DEFINE_SHOW_ATTRIBUTE to simplify sun4i_ss_debugfs
Date: Fri, 16 Sep 2022 22:13:40 +0800
Message-ID: <20220916141340.2174495-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 .../crypto/allwinner/sun4i-ss/sun4i-ss-core.c    | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 44b8fc4b786d..006e40133c28 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -235,7 +235,7 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 #endif
 };
 
-static int sun4i_ss_dbgfs_read(struct seq_file *seq, void *v)
+static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
 {
 	unsigned int i;
 
@@ -266,19 +266,7 @@ static int sun4i_ss_dbgfs_read(struct seq_file *seq, void *v)
 	}
 	return 0;
 }
-
-static int sun4i_ss_dbgfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, sun4i_ss_dbgfs_read, inode->i_private);
-}
-
-static const struct file_operations sun4i_ss_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = sun4i_ss_dbgfs_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(sun4i_ss_debugfs);
 
 /*
  * Power management strategy: The device is suspended unless a TFM exists for
-- 
2.25.1

