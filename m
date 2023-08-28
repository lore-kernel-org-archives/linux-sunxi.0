Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197D5134D4
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SWaOyZqAW1ypmmx+bKaDOztNb8uWrADkHnWIObYyr8=;
	b=FGcHqYGFoFOTyRHHrq9cpEwA7YtprHbh3xHvZVhDlwZvXjnzdmOFoiLC/vbR/hujj/ssSQ
	au073uBZm3TNctOX3lMEO8rl3i4iSGCtVBV8b9XK4UQsU+WmpG+XfKjFvPAhvb/SYs16fB
	ZvRC3gi3YSAjiF6IuILQv0hNmzcLPPA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-jIASs7NbMwulO1mrEyXJSg-1; Mon, 28 Aug 2023 16:23:34 -0400
X-MC-Unique: jIASs7NbMwulO1mrEyXJSg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76f0b7e3879so226885985a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 13:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254214; x=1693859014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SWaOyZqAW1ypmmx+bKaDOztNb8uWrADkHnWIObYyr8=;
        b=WPGTmMKXggSCAbRMLmRrNcRaF2nv4OSbqfdaIq3MML0FlDv97yZ50AYl2cS4q/Z7nY
         qWql6jgae03a5YEQocRrA4tejYHcuHBK45j8ZvNfQhL2KMMSgdRwzrSihsjVyG1jFKFU
         QY2qmmn1eKAjCcSvmPrGgX1geFX5/FEQi1Q4bCFoPNbavG0ZB6THoneB8ltFyHXqMqZ0
         vhfC/6SzuaH5DKl+FiSK6QNsb6H5KdDyWNMGsqr6Rx4cAvUccc0nNToW7hfEnBhRF8dp
         SrOIbLzURlspwExbu4w3kdZepMZ4xMAXQuBAur2X0b/DHC8W20g+1Sk7hzyJNQXfe0fp
         +KJA==
X-Gm-Message-State: AOJu0Yx6a+LSvqNLoANrLi2oB03mrtZpI3dMw+AXIRIIB1NfgTk42nx+
	dDL78Gcehcdc6AJT/Cu7079RaFScMVs+ppaqYiu/Ll8Gd7eruLvj8IntpmhYLNE5kUj4eEaoVp8
	9d37joXRfUeGnYQz8BSZ4W78=
X-Received: by 2002:a05:620a:444f:b0:76d:b0d9:8714 with SMTP id w15-20020a05620a444f00b0076db0d98714mr26208240qkp.5.1693254214080;
        Mon, 28 Aug 2023 13:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOGXo/skhCWFBeQ+UjSUbgbXxxw2vI3Xem+7mdhyD8WFWDReG5aEYLekTiVlVTA/jMtEv3Aw==
X-Received: by 2002:a05:620a:444f:b0:76d:b0d9:8714 with SMTP id w15-20020a05620a444f00b0076db0d98714mr26208198qkp.5.1693254213880;
        Mon, 28 Aug 2023 13:23:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id pe40-20020a05620a852800b0076ca9f79e1fsm2608267qkn.46.2023.08.28.13.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:23:33 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:23:31 -0700
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
Subject: Re: [PATCH v7 10/24] iommu/exynos: Implement an IDENTITY domain
Message-ID: <p4rskudydgzbrgdhod2jiv7ksj2a2pxopsfnbvc6jfxtay4oaa@x5xu6eiqfpl5>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <10-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <10-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:47:24PM -0300, Jason Gunthorpe wrote:
> What exynos calls exynos_iommu_detach_device is actually putting the iommu
> into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

