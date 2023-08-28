Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445F134D4
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
	b=Kv2QBpvSOoatKoDFgXcGUUVmV33pdrW05takVvS5elUSIr8kpZJD6ldQC3vAVxLh5FBtAd
	HO0LdxbJtwtFn0hUZ6Ue2vrO8c5oEsfMBXMb50TBtX83f9AezxKrZ2yrhgePLNhCioWhs9
	TwmdaHsZjBPearDc7zNWSZMw5f5MaAo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-g5B6PqrHNIWK30npdG0D_w-1; Mon, 28 Aug 2023 16:25:54 -0400
X-MC-Unique: g5B6PqrHNIWK30npdG0D_w-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-76d882c4906so459169685a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254353; x=1693859153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
        b=btA0cWDJ+yRuLWQab6dV/XJ8qF+RUqpZaVbLQ6Cs19ZpYHhvyY5Kge2JsmMd3wjwCR
         ZuvIIPOkJ+lswk5XBhTX2hUcbN4zkpWyjl6m/jqPegv7LjlqgU9Wd4OX9RW3sbsOSGCD
         a0danjhvWKl2h7QSC9oIQauMAXWFFvxV/A/FRkiSzvYzibiyoff+OJDYP60cC061SoyK
         /1Ty8OC7stJp6DcE+kZuPK/Zd+HMZScNzMxlbpCXUjr1oDaEHZKY9Nzfuo1qdEedmHhs
         nlgmSH99sz9IC7kKq1h4KaOPkVwmyl5uznq76WtztyrO+DzGhFHR1I/CiXk4Dlrg73oY
         3ZFA==
X-Gm-Message-State: AOJu0YxUSXnFImGivV6AWmKTQGOEA4oyf4cjkso5L/avUnfjYdTLE0n4
	EVmtf+NlAb7vzOaj91oJddzVoTM5qnv2PP1zxAdKw6rFOYWOA3E5wrkZtqQjyG0X5zsTlEEHA4B
	epOv/cNDZOWKYHLCGUn2Jk70=
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041504qkm.27.1693254353201;
        Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9O6FxP0inVTnVJ2vRf5VolLj9Ux6/2WGBYm17sZOw53hmRs71i9SgIXCArw27HMmN5iSTDg==
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041474qkm.27.1693254352979;
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id o22-20020a05620a111600b0076816153dcdsm2613458qkk.106.2023.08.28.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:25:51 -0700
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
Subject: Re: [PATCH v7 11/24] iommu/tegra-smmu: Implement an IDENTITY domain
Message-ID: <mqc777v7h4bpz5xgfcqjqig4zoo3ifobiyut4r43dghkxp3yl2@uyb72ermxszs>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:47:25PM -0300, Jason Gunthorpe wrote:
> What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
> putting the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

