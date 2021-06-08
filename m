Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13642FAD
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jun 2021 09:38:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD13861246;
	Tue,  8 Jun 2021 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623145130;
	bh=vxDRlETdFI2PxULKoexaolR76e6sEkGi4SwEVNAONko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3vtJ+jhevpN9HMr0yO5HHI84E7BaAUQhqF0Is8p+TOQLEKDl1floYBhTkmAvtQM+
	 ZdeXq1S9f6rO205DS6HunWGzB47PxBEoRKTuQirizr0lOj7HODwIlDrCXB8+BFfK/2
	 Ra/9/vghohxzMzsnYoPcnmX2/q7Ed+iyeaK2ayM04oSLmiP9kj9ebRdfqgY+rabkfX
	 qxT83QpM5F0jxJHzd2CF8aJbWdBXFAZcfOAVDU/cjNcKG9CsjJZk8KHCq1EwBIN+m+
	 Hg28jb+pCFoeaWpwhkGlf7WqIQpcs/1fQDvkjDwh6+Ltr3tRM2v8EKhAJYaRXWakHJ
	 fn39WWUD+sXvA==
Date: Tue, 8 Jun 2021 10:38:45 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	iommu <iommu@lists.linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
Message-ID: <20210608093845.GC8935@willie-the-truck>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
 <20210510035425.3212-2-thunder.leizhen@huawei.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510035425.3212-2-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 10, 2021 at 11:54:25AM +0800, Zhen Lei wrote:
> All spelling mistakes are in the comments, no functional change.

[...]

> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
>   * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
>   * bit32 of the CPU physical address always is needed to set, and for Region
>   * 'E', the CPU physical address keep as is.
> - * Additionally, The iommu consumers always use the CPU phyiscal address.
> + * Additionally, The iommu consumers always use the CPU physical address.

If we're fixing typos, then I think the 'T' in "The iommu" should be
lowercase here.

Anyway, all the other fixes look correct to me. I'll leave it up to Joerg as
to whether he wants to apply this or not, given the impact on git blame and
the potential for conflicts.

Will
