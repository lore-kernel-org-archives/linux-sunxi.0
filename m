Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74EA15A2
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 03:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654572224; x=1686108224;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vzgEhhW4kNaICa/n+qlgLmF5Vog9iKUmfkdT1yy8unU=;
  b=m8sx0E962mcroGWKJkTuqfcdG/jVFsF5TROL+VeF6QsMia9PmGXhWsTr
   IS+MsW+vpMUNK6omyTUlg41136vulC7KnKkwfcssNKl1bihHRhVKFmFtY
   f3B2wLvfVn0UFvZ0XncAHoN9opufGa2AzglWrtwGQUn7Gk2MM4sDiZzIv
   X1Yxini1W2UxkQ4fW1Pays1vwl8WO7za5PZ2cLGoUpxaGIsWDB7g7u53p
   Ne7F8V7HAU+3Z88GMSAazw5uPZzGxxI3KZ9igwVFKYrqd6XyAWqUVkKJ6
   RA6/S4M4boo5oyDO6MKCc7QnneTPeqYjoizXTEVgJn4XC2UgFSyNQuVXp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259303204"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="259303204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 20:23:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="583980445"
Received: from zwang64-mobl1.ccr.corp.intel.com (HELO [10.249.174.202]) ([10.249.174.202])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 20:23:29 -0700
Message-ID: <f81b8b8f-b811-3be2-5dda-139dc1bd7bdd@linux.intel.com>
Date: Tue, 7 Jun 2022 11:23:27 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 alyssa@rosenzweig.io, alim.akhtar@samsung.com, dwmw2@infradead.org,
 yong.wu@mediatek.com, mjrosato@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 cohuck@redhat.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH 1/5] iommu: Return -EMEDIUMTYPE for incompatible domain
 and device/group
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, marcan@marcan.st, sven@svenpeter.dev, robin.murphy@arm.com,
 robdclark@gmail.com, m.szyprowski@samsung.com,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, heiko@sntech.de,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com
References: <20220606061927.26049-1-nicolinc@nvidia.com>
 <20220606061927.26049-2-nicolinc@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220606061927.26049-2-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/6/6 14:19, Nicolin Chen wrote:
> +/**
> + * iommu_attach_group - Attach an IOMMU group to an IOMMU domain
> + * @domain: IOMMU domain to attach
> + * @dev: IOMMU group that will be attached

Nit: @group: ...

> + *
> + * Returns 0 on success and error code on failure
> + *
> + * Specifically, -EMEDIUMTYPE is returned if the domain and the group are
> + * incompatible in some way. This indicates that a caller should try another
> + * existing IOMMU domain or allocate a new one.
> + */
>   int iommu_attach_group(struct iommu_domain *domain, struct iommu_group *group)
>   {
>   	int ret;

Best regards,
baolu
