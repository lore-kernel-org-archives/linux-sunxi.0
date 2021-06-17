Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49846173
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 05:04:14 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G58X026HYz1BNKW;
	Thu, 17 Jun 2021 12:41:20 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 12:46:22 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Jun
 2021 12:46:21 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sunxi@lists.linux.dev>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>
Subject: [PATCH -next 0/3] ASoC: sunxi: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 17 Jun 2021 12:50:09 +0800
Message-ID: <20210617045012.1119650-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

Use devm_platform_get_and_ioremap_resource() to simplify
code.

Yang Yingliang (3):
  ASoC: sunxi: sun4i-codec: Use devm_platform_get_and_ioremap_resource()
  ASoC: sun4i-i2s: Use devm_platform_get_and_ioremap_resource()
  ASoC: sunxi: sun4i-spdif: Use devm_platform_get_and_ioremap_resource()

 sound/soc/sunxi/sun4i-codec.c | 3 +--
 sound/soc/sunxi/sun4i-i2s.c   | 3 +--
 sound/soc/sunxi/sun4i-spdif.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

-- 
2.25.1

