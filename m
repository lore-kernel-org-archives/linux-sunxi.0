Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9E92F80
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Jun 2021 08:33:07 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G0Kyd1RGHz6vjQ;
	Wed,  9 Jun 2021 16:29:13 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 16:33:04 +0800
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
Subject: [PATCH v3 0/2] iommu: Fix spelling mistakes
Date: Wed, 9 Jun 2021 16:32:49 +0800
Message-ID: <20210609083251.13827-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
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

v2 --> v3:
1) Add some new fixes for the latest linux-next:
   drivers/iommu/fsl_pamu_domain.c:366: Traverese ==> Traverse
   drivers/iommu/mtk_iommu.c:977: Uppon ==> Upon
   drivers/iommu/intel/svm.c:488: shuld ==> should
   drivers/iommu/intel/svm.c:920: requeset ==> request
   drivers/iommu/intel/dmar.c:2131: Specifiction ==> Specification
2) Add a new fix "Additionally, The ==> Additionally, the", discovered by Will Deacon
3) Add some new fixes for the header files of iommu/iova
   The header files to be checked are as follows:
   include/linux/iommu*.h
   include/linux/iova.h
   include/uapi/linux/iommu.h
4) Changes to files "iova.h" and "iova.c" are grouped into a new patch.


v1 --> v2:
1. Merge into one patch
2. Add a new fix "appropriatley --> appropriately" in iommu.c, discovered by John Garry

Zhen Lei (2):
  iommu/iova: Fix spelling mistakes
  iommu: Fix spelling mistakes

 drivers/iommu/amd/amd_iommu_types.h   |  2 +-
 drivers/iommu/amd/init.c              |  2 +-
 drivers/iommu/amd/iommu.c             |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c |  2 +-
 drivers/iommu/fsl_pamu.c              |  2 +-
 drivers/iommu/fsl_pamu_domain.c       |  2 +-
 drivers/iommu/intel/dmar.c            |  8 ++++----
 drivers/iommu/intel/iommu.c           |  2 +-
 drivers/iommu/intel/irq_remapping.c   |  2 +-
 drivers/iommu/intel/svm.c             |  4 ++--
 drivers/iommu/iommu.c                 |  6 +++---
 drivers/iommu/iova.c                  |  2 +-
 drivers/iommu/mtk_iommu.c             |  4 ++--
 drivers/iommu/omap-iommu.c            |  2 +-
 drivers/iommu/sun50i-iommu.c          |  2 +-
 include/linux/iova.h                  | 10 +++++-----
 16 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.25.1


