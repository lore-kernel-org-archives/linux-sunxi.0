Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68AD2F80
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Jun 2021 01:41:12 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G08qL4kCZz6vm6;
	Wed,  9 Jun 2021 09:37:18 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 09:41:09 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 09:41:09 +0800
Subject: Re: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
To: Will Deacon <will@kernel.org>
CC: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	"David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Maxime Ripard" <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@siol.net>, iommu <iommu@lists.linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, linux-sunxi
	<linux-sunxi@lists.linux.dev>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
 <20210510035425.3212-2-thunder.leizhen@huawei.com>
 <20210608093845.GC8935@willie-the-truck>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <6c5d2840-c329-1e23-00ac-b063dd0d2b74@huawei.com>
Date: Wed, 9 Jun 2021 09:41:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210608093845.GC8935@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected



On 2021/6/8 17:38, Will Deacon wrote:
> On Mon, May 10, 2021 at 11:54:25AM +0800, Zhen Lei wrote:
>> All spelling mistakes are in the comments, no functional change.
> 
> [...]
> 
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
>>   * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
>>   * bit32 of the CPU physical address always is needed to set, and for Region
>>   * 'E', the CPU physical address keep as is.
>> - * Additionally, The iommu consumers always use the CPU phyiscal address.
>> + * Additionally, The iommu consumers always use the CPU physical address.
> 
> If we're fixing typos, then I think the 'T' in "The iommu" should be
> lowercase here.

OK, I will change it.

In addition, the current linux-next has several new spelling errors.

> 
> Anyway, all the other fixes look correct to me. I'll leave it up to Joerg as
> to whether he wants to apply this or not, given the impact on git blame and
> the potential for conflicts.

Currently, there are no conflicts in linux-next.

> 
> Will
> 
> .
> 

