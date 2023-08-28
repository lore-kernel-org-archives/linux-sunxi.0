Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469161110
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
	b=M8r6rZBU9LrEhYHADcGLbqegvB5OrT+yqsmTY6nOHKHxLQ1nrGK2/uEQXIXFEHg8Q3driv
	pyAtaFjvSwVxaudrN5ZnqTOU51V4wqVUi6EHEJrsVE8xYRAF+SB0PXX16b4vtbsseUfjlH
	Jwpws3KdZAnsQdz9VaC5nCMkUUToLs8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-riR-p2lnMb2KGtNB_Sc5Pg-1; Mon, 28 Aug 2023 17:02:42 -0400
X-MC-Unique: riR-p2lnMb2KGtNB_Sc5Pg-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-44ea3b44f9eso1608661137.3
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256562; x=1693861362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
        b=KpBdInsxycTtk37iyfJkJ5kG6NdvxuMN/zpmvXf+B2RH2ksz4uyA1Ul4ISB1DW12ZO
         SBeTaXzrhxVbVrIM6gPW7uRKr2OZUuUqi5OAUSvMPzqpMUReQkiHhY51vZzPaBlDxw5c
         Lb9BzgduY2jFR15qYZpJDA/je+Nw+KR0pbDtFg+I++kzlJ4nsGpuafeZH/pZ6nVe+OU/
         pNm8+e6EKb+MMrewbfd8DVNrMnCYGYuwAacbW4TDCJ+k8o7tlxxXxoDAtErH8zNtqhrS
         pvIJ1pxSSrN5LaqVhQ+VxSHmg/fOYursHvFJfl9fFzmc6ZaPb6UFSWZY3jV2Qfkta8mk
         uhhw==
X-Gm-Message-State: AOJu0YxDOPMIuOi1ERkMgzjV0tpO5FUjW2LPfWE5BvpBrH3CwwcWiltb
	IJ47WS7Sr9O1ZVhWD1CcaR+OgNdqLOOm4paQERfyFg89GrzXqLaLRxgstLLbDTYQa1S7LjouxqH
	rcrCeho/J/2v7tgH63HLqRRY=
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657415vsl.14.1693256562297;
        Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1O+ulqQs16fLrviLhIDcWj2NFGLF73P8fTFl1IfopkK1Ei1hjIoNJD//dyDhnkd8Fjfj6aA==
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657332vsl.14.1693256561816;
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cf50a000000b0064f732aa45csm2873129qvm.133.2023.08.28.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:02:40 -0700
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
Subject: Re: [PATCH v7 17/24] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ftxla3xdnxqknqg4k6qxwh6nquhdpzfmzyuvkzg7gwjxf42p6w@7ek73gnk5mue>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:47:31PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
> ipmmu_utlb_disable()")
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

