Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8E2FAD
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Jun 2021 08:33:07 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0KxT4QSNzWtMs;
	Wed,  9 Jun 2021 16:28:13 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 16:33:05 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 16:33:04 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>,
	"Chen-Yu Tsai" <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	iommu <iommu@lists.linux-foundation.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, linux-sunxi
	<linux-sunxi@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v3 1/2] iommu/iova: Fix spelling mistakes
Date: Wed, 9 Jun 2021 16:32:50 +0800
Message-ID: <20210609083251.13827-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210609083251.13827-1-thunder.leizhen@huawei.com>
References: <20210609083251.13827-1-thunder.leizhen@huawei.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected

Fix some spelling mistakes in comments found by "codespell":
detroyed ==> destroyed
defered ==> deferred
entrie ==> entry
alloced ==> allocated
regularily ==> regularly

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/iova.c |  2 +-
 include/linux/iova.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b6cf5f16123b..cce4571548c4 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -594,7 +594,7 @@ static void fq_destroy_all_entries(struct iova_domain *iovad)
 	int cpu;
 
 	/*
-	 * This code runs when the iova_domain is being detroyed, so don't
+	 * This code runs when the iova_domain is being destroyed, so don't
 	 * bother to free iovas, just call the entry_dtor on all remaining
 	 * entries.
 	 */
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 71d8a2de6635..16f671b04a37 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -49,12 +49,12 @@ typedef void (* iova_entry_dtor)(unsigned long data);
 /* Timeout (in ms) after which entries are flushed from the Flush-Queue */
 #define IOVA_FQ_TIMEOUT	10
 
-/* Flush Queue entry for defered flushing */
+/* Flush Queue entry for deferred flushing */
 struct iova_fq_entry {
 	unsigned long iova_pfn;
 	unsigned long pages;
 	unsigned long data;
-	u64 counter; /* Flush counter when this entrie was added */
+	u64 counter; /* Flush counter when this entry was added */
 };
 
 /* Per-CPU Flush Queue structure */
@@ -68,8 +68,8 @@ struct iova_fq {
 struct iova_domain {
 	spinlock_t	iova_rbtree_lock; /* Lock to protect update of rbtree */
 	struct rb_root	rbroot;		/* iova domain rbtree root */
-	struct rb_node	*cached_node;	/* Save last alloced node */
-	struct rb_node	*cached32_node; /* Save last 32-bit alloced node */
+	struct rb_node	*cached_node;	/* Save last allocated node */
+	struct rb_node	*cached32_node; /* Save last 32-bit allocated node */
 	unsigned long	granule;	/* pfn granularity for this domain */
 	unsigned long	start_pfn;	/* Lower limit for this domain */
 	unsigned long	dma_32bit_pfn;
@@ -91,7 +91,7 @@ struct iova_domain {
 	iova_entry_dtor entry_dtor;	/* IOMMU driver specific destructor for
 					   iova entry */
 
-	struct timer_list fq_timer;		/* Timer to regularily empty the
+	struct timer_list fq_timer;		/* Timer to regularly empty the
 						   flush-queues */
 	atomic_t fq_timer_on;			/* 1 when timer is active, 0
 						   when not */
-- 
2.25.1


