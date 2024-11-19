Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4468A1CC881
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Nov 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023968; cv=none; b=JC75YBeA7C/5DVLMA+5tZVm+kK1PT/KYAt28NGSXXuAKNLepfk6uLpPl/qZ4aQwyBHLUdwwrtwe54dihctRhnjyedsxvLYhmPytBOJG6+ZB2wUf89WtFBwrLm3Z0VMM9ZmKRaABxJdpxl2hC3I8Y4kn4FcKPKZ8uQargppD0h10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023968; c=relaxed/simple;
	bh=/gS/B7G2CRJG+6o22nnO+cT7Z4PcqGdc8NqrzZ8tNoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQxwomSR/zT4rkG5gTUMPCa6gBqgDmASk/fX/gRzytkfB5HRyuWHoSD3AB1CXH97Rbh7mNEBu5lXIQO3Z2Yo7/n2WuS/drquTNHG3RjK131jT5Nj8AaPXaMcDJP/lyf01OzO7LnHJC/g9hYvePD5RgyXUZ95CN9d72Giaw4uHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=BXoN120v; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="BXoN120v"
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id DNIkt2klLvH7lDOYKt4HP3; Tue, 19 Nov 2024 13:46:00 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id DOYHtBjALaZVDDOYJt9HyJ; Tue, 19 Nov 2024 13:46:00 +0000
X-Authority-Analysis: v=2.4 cv=J9qs7hnS c=1 sm=1 tr=0 ts=673c9698
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=7CQSdrXTAAAA:8
 a=GWX1jMILmsxrC0RoNDMA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i0dOS4jN5ICgemXKNVZOn4+iwWHoz0NoRCd7tpSQfxg=; b=BXoN120vLXVty5euOX0iIf98xk
	gFWjlbyJRktvstAnFeFokjGm0U8VrUPZW7s6qkB3xf5FulB/Vq+yTd4+qNbcztMXtugX/+5GrdalG
	W0/gNutrUcjmtftg+wcr+wMFddx2JHlbnCGXkIDHeCKW6zg1tVK4KviC9aWlE2l5cBe5DsWXvR662
	SwCKFOrraF9ECX+6PWwA9n+I2kVK8Pi/APTN6OUIb/5pC2CSDSReTCrnUTWe6z/mxKijewycClqbi
	VjiSN3H3V9FEKrBW3K9yYZ+jLPtdd4aHfQnfANVChCvcEx3QYG55F8+aboI28FuyUL2Wkei0GFxDC
	YoaVVhsw==;
Received: from [122.165.245.213] (port=51434 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tDOY9-002THc-27;
	Tue, 19 Nov 2024 19:15:49 +0530
Message-ID: <470460f9-e032-4dec-b7e3-5306c166c66d@linumiz.com>
Date: Tue, 19 Nov 2024 19:15:42 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] iommu: sun50i: allocate page tables from below 4
 GiB
To: Andre Przywara <andre.przywara@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 piotr.oniszczuk@gmail.com
Cc: Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin
 <ryan@testtoast.com>, Philippe Simons <simons.philippe@gmail.com>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 parthiban@linumiz.com
References: <20240616224056.29159-1-andre.przywara@arm.com>
 <20240616224056.29159-3-andre.przywara@arm.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20240616224056.29159-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tDOY9-002THc-27
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:51434
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 5
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDP4P5EBPtiPibYPsaKfJw67vBh45B79jVLPQBBobE0ai1fX3211LC50K4BULf3ZTyO40lGX8+VL19aDcnk7aTvUZhK2uXECvsWlrTJ3D+mHoOHFxBZH
 zGqyd2trT1bibm97PkTELE0B3DFEWFXgcv7fDStEpeine0A6e1dyJ4p03+TNtfxHZ8sNY6qviB3ypbh87l6agF0IlEzxtm9A7xc=

On 6/17/24 4:10 AM, Andre Przywara wrote:
> The Allwinner IOMMU is a strict 32-bit device, with its input addresses,
> the page table root pointer as well as both level's page tables and also
> the target addresses all required to be below 4GB.
> The Allwinner H6 SoC only supports 32-bit worth of physical addresses
> anyway, so this isn't a problem so far, but the H616 and later SoCs extend
> the PA space beyond 32 bit to accommodate more DRAM.
> To make sure we stay within the 32-bit PA range required by the IOMMU,
> force the memory for the page tables to come from below 4GB. by using
> allocations with the DMA32 flag.
> Also reject any attempt to map target addresses beyond 4GB, and print a
> warning to give users a hint while this fails.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index dd3f07384624c..20a07f829085d 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -602,6 +602,14 @@ static int sun50i_iommu_map(struct iommu_domain *domain, unsigned long iova,
>  	u32 *page_table, *pte_addr;
>  	int ret = 0;
>  
> +	/* the IOMMU can only handle 32-bit addresses, both input and output */
> +	if ((uint64_t)paddr >> 32) {
> +		ret = -EINVAL;
> +		dev_warn_once(iommu->dev,
> +			      "attempt to map address beyond 4GB\n");

A133 uses the same IOMMU block and works fine when claimed by the display engine under 1GB
RAM. When used with 4GB,

root@helper-board-a133:~# head /proc/meminfo 
MemTotal:        4021212 kB

root@helper-board-a133:~# dmesg | grep -i -e drm -e iommu
[    0.465613] iommu: Default domain type: Translated
[    0.470892] iommu: DMA domain TLB invalidation policy: strict mode
[    0.914097] sun8i-mixer 6100000.mixer: Adding to iommu group 0
[    1.092400] sun4i-drm display-engine: Adding to iommu group 0
[    1.100044] sun4i-drm display-engine: bound 6100000.mixer (ops 0xffff800080b05dc0)
[    1.108399] sun4i-drm display-engine: bound 6510000.tcon-top (ops 0xffff800080b0a628)
[    1.116694] sun4i-drm display-engine: bound 6511000.lcd-controller (ops 0xffff800080b04220)
[    1.126415] [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0
[    1.135110] sun50i-iommu 30f0000.iommu: attempt to map address beyond 4GB
[    1.142559] sun4i-drm display-engine: [drm] *ERROR* fbdev-dma: Failed to setup generic emulation (ret=-12)
[    1.154210] sun4i-drm display-engine: [drm] *ERROR* fbdev-dma: Failed to setup generic emulation (ret=-12)

allocation fails. Limiting the memory mem=2G to the kernel works.

Thanks,
Parthiban

> +		goto out;
> +	}
> +
>  	page_table = sun50i_dte_get_page_table(sun50i_domain, iova, gfp);
>  	if (IS_ERR(page_table)) {
>  		ret = PTR_ERR(page_table);
> @@ -682,7 +690,8 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
>  	if (!sun50i_domain)
>  		return NULL;
>  
> -	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL, get_order(DT_SIZE));
> +	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL | GFP_DMA32,
> +					      get_order(DT_SIZE));
>  	if (!sun50i_domain->dt)
>  		goto err_free_domain;
>  
> @@ -997,7 +1006,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
>  
>  	iommu->pt_pool = kmem_cache_create(dev_name(&pdev->dev),
>  					   PT_SIZE, PT_SIZE,
> -					   SLAB_HWCACHE_ALIGN,
> +					   SLAB_HWCACHE_ALIGN | SLAB_CACHE_DMA32,
>  					   NULL);
>  	if (!iommu->pt_pool)
>  		return -ENOMEM;

