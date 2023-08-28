Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93610F4
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693257524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FodHUOB7sj0ZriayRa+3vwqEqhxX2ARBJWyM2p3lcBE=;
	b=ZEbHQQyGyX4TQrbpNbbYQBzrULYs9z4H8s0szAfDSd1V9nphu/zd1u2t0ZDvju+viXcWt9
	iZh+AZ4xBULIwun+Cz1/4PmPSCnTWbWqrdJYi7t5l9pgXqHh5/xjW6xa9DAjW2iKdPKr2w
	+EqbTXtZErHWRBSpAsCla2ymJnHAyYU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-1DtT0bKTMzO6hLPdBphEIw-1; Mon, 28 Aug 2023 17:18:43 -0400
X-MC-Unique: 1DtT0bKTMzO6hLPdBphEIw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64f41d94d16so45500456d6.3
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 14:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693257522; x=1693862322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FodHUOB7sj0ZriayRa+3vwqEqhxX2ARBJWyM2p3lcBE=;
        b=P9xGJrJYF3fFgs4vi+B3I2jRx5bCkQmlnQowC5YHlZkwaqrUvnmyNyN7UUvuuXNi2O
         LqZsdjNGD4CqsmGNMmjB9qKi1riTroLIUYI5VS1RM6qDYrAxWoClfTUnY/MNrwiLOWO3
         LchQFjKyCLlIR907z6lEesADwL6xdZVrW03f3pObxtF6i2LtuKYhPQdSvovl8gy12A5A
         Mg6rAxH3hlHf29AStX2yJSRBxC1niCQqZ43SFL7vFdRE3PlnZV9nYao8vQDLZwOjFiqB
         cN7+X0M8iz4opXAhLsL1x90wuu6oBarzUxuy9CiKC/lClhSPOVFWt0f3454ps8CDTNej
         wyTQ==
X-Gm-Message-State: AOJu0YxbZMONOYjLozDfQcjg9VuEdZHajHPxoDbzfDiJpzHThDbDWgZF
	k9bz3XeYgDdTqeNFwbCCwwoJ3EKlrlOs0eCf1CMU2x0zY/u/SzZEsGRQ1rp4tCylUND3aRRUfMV
	b4Wb0plomsqAyIUBq1WFHy5k=
X-Received: by 2002:a0c:f444:0:b0:647:19b6:135a with SMTP id h4-20020a0cf444000000b0064719b6135amr29394551qvm.51.1693257522419;
        Mon, 28 Aug 2023 14:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHFP88UT9IzTJ8TXv+xW4YnqZau3haGE42Vmh/o6wjgQIKEglBvEtYvuI7Puclm3mw8YK0bQ==
X-Received: by 2002:a0c:f444:0:b0:647:19b6:135a with SMTP id h4-20020a0cf444000000b0064719b6135amr29394508qvm.51.1693257522132;
        Mon, 28 Aug 2023 14:18:42 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id k14-20020a0cf58e000000b0064f46422ddasm2855459qvm.145.2023.08.28.14.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:18:41 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:18:40 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 20/24] iommu: Require a default_domain for all iommu
 drivers
Message-ID: <55jub5vyeqqofj4wclvwk2qotlb6a5iu3darddrbzwdc7izsa2@qip6tyjmr7j2>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <20-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:47:34PM -0300, Jason Gunthorpe wrote:
> At this point every iommu driver will cause a default_domain to be
> selected, so we can finally remove this gap from the core code.
> 
> The following table explains what each driver supports and what the
> resulting default_domain will be:
> 
>                                         ops->defaut_domain
>                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> amd/iommu.c             Y       Y                       N/A             either
> apple-dart.c            Y       Y                       N/A             either
> arm-smmu.c              Y       Y                       IDENTITY        either
> qcom_iommu.c            G       Y                       IDENTITY        either
> arm-smmu-v3.c           Y       Y                       N/A             either
> exynos-iommu.c          G       Y                       IDENTITY        either
> fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> intel/iommu.c           Y       Y                       N/A             either
> ipmmu-vmsa.c            G       Y                       IDENTITY        either
> msm_iommu.c             G                               IDENTITY        N/A
> mtk_iommu.c             G       Y                       IDENTITY        either
> mtk_iommu_v1.c          G                               IDENTITY        N/A
> omap-iommu.c            G                               IDENTITY        N/A
> rockchip-iommu.c        G       Y                       IDENTITY        either
> s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
> sprd-iommu.c                    Y                       N/A             DMA
> sun50i-iommu.c          G       Y                       IDENTITY        either
> tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
> virtio-iommu.c          Y       Y                       N/A             either
> spapr                                   Y       Y       N/A             N/A     PLATFORM
>  * G means ops->identity_domain is used
>  * N/A means the driver will not compile in this configuration
> 
> ARM32 drivers select an IDENTITY default domain through either the
> ops->identity_domain or directly requesting an IDENTIY domain through
> alloc_domain().
> 
> In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
> forces an IDENTITY domain.
> 
> S390 uses a PLATFORM domain to represent when the dma_ops are set to the
> s390 iommu code.
> 
> fsl_pamu uses an PLATFORM domain.
> 
> POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.
> 
> The x86 drivers continue unchanged.
> 
> After this patch group->default_domain is only NULL for a short period
> during bus iommu probing while all the groups are constituted. Otherwise
> it is always !NULL.
> 
> This completes changing the iommu subsystem driver contract to a system
> where the current iommu_domain always represents some form of translation
> and the driver is continuously asserting a definable translation mode.
> 
> It resolves the confusion that the original ops->detach_dev() caused
> around what translation, exactly, is the IOMMU performing after
> detach. There were at least three different answers to that question in
> the tree, they are all now clearly named with domain types.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

