Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC771193A8
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692998157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNGvpBuIiKL3Cl4QX+janawTefek15UWSwqXPvpbHmo=;
	b=gRhpycgOb2dKRaMXZlC1CskvcaBcynRFKdasCY+zSMBe6HLs+ADIk8xTxbeYjhBbtMh11J
	xgfrjsbmJhpRO0VGnwFpVAFCJhhGw6Jiv9bzAJMoPHdmRcJeQmG4BG+sJTm0Vl8B0TXgqC
	hBu2LAnxbsgHHjQV+LtixkwC7Zs6cBc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-D5lsoW1aNoG9TPbzQ2jggw-1; Fri, 25 Aug 2023 17:15:54 -0400
X-MC-Unique: D5lsoW1aNoG9TPbzQ2jggw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76d84238f37so142617885a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 14:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692998154; x=1693602954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNGvpBuIiKL3Cl4QX+janawTefek15UWSwqXPvpbHmo=;
        b=i+p/m9lhUXS+xiED/6CUUyAa2J1hojf3xDyDI+lmRkW3ulb9O8zsm/3flXAbEjBBGY
         mNsEybbPVojodqlbpAXdcim4NkiOsyvovaJwWQGBUYC+LdrkaTD82qI1+Keq4XCWOdm0
         wF+LUjZRXwwEN2qBKc6tm6gtmPYR1qQ/NOYW5VXWCaQdYW/FsODviyxpJdACYA5l8k60
         nY3k62LPqRHZrYGHu3lDuW+GFeFGtXJe60cRl7H/PlbDEtCN2TQetTj95Q1mA7+iHBfc
         EDPm5Uu/UMYKQ+ulqPEKGVbp3jC8/13RAHTT7yY1n5gYBdm6ONMGb23/SUoELCtB26Mn
         8ifA==
X-Gm-Message-State: AOJu0YyXfN5wgQxD4QwmB4t+neO/C1i8MqlDGhggXKo8crpUQ71TOwPh
	OhyOwFthmQmjcQMKcwCLonA7IbAkl6pzyHX02BPOJTwbTLtldLFwfjd1gYh17ePuRrD5HDL33KG
	PrbSRVlX1KhkuBN4CZbrGO0k=
X-Received: by 2002:a05:622a:138c:b0:411:fc77:5863 with SMTP id o12-20020a05622a138c00b00411fc775863mr9742832qtk.34.1692998153919;
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGkTdJ1PESb45xmKP1IyMr0VhacrVsFun4AHO5ghG+vkiiDrIbNOg/oEp2bfPugUDBb4fzHQ==
X-Received: by 2002:a05:622a:138c:b0:411:fc77:5863 with SMTP id o12-20020a05622a138c00b00411fc775863mr9742803qtk.34.1692998153629;
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id i3-20020ae9ee03000000b0076745f352adsm759948qkg.59.2023.08.25.14.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:15:51 -0700
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
Subject: Re: [PATCH v7 04/24] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Message-ID: <qlgsyftnpb55wn6jcsdx27u3vnc66h5dmtcuelw4y5wgk3vorf@ctgykaa5wp7d>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <4-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:47:18PM -0300, Jason Gunthorpe wrote:
> The PLATFORM domain will be set as the default domain and attached as
> normal during probe. The driver will ignore the initial attach from a NULL
> domain to the PLATFORM domain.
> 
> After this, the PLATFORM domain's attach_dev will be called whenever we
> detach from an UNMANAGED domain (eg for VFIO). This is the same time the
> original design would have called op->detach_dev().
> 
> This is temporary until the S390 dma-iommu.c conversion is merged.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

