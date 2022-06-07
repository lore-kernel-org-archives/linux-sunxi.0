Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D447C
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654587896; x=1686123896;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OSBO16dRCwR6Wb79tDIGbzqHZ301kVBrdpEBr6LRMRc=;
  b=e9d8bm4hLVivdzTQ0m6PKVs6DWuZ2mL3otYuVjJXNkC8BnmZjZuIZkH0
   7mbVn3LedlxhapVD9+LnpJ3gqHw7hxBVnc2SMm1PpFZJ9SIfFbdEsp5tK
   HfSi3yOixk/bUe+sBitZeEKr58FehiMfs+8ZpnPnsAqoUndmf0KG08gx7
   RpWtQ+zEVkzbJvvkKm8/MGGqjzHNcqqRkCKWg/yo1y21ibYLPcjxsQY0m
   PGoRuZfX+xaeTsZHAJzkjZetoBYtXWnJCK1r1hLYXkptq/k5MLgI2AUGG
   6OOiEjoo5WHa3ADkZ8fHKDjQ5ALpTItILIVdgFWSG1YnZNHntfWafemma
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="363054753"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="363054753"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:44:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="584086830"
Received: from zwang64-mobl1.ccr.corp.intel.com (HELO [10.249.174.202]) ([10.249.174.202])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:44:45 -0700
Message-ID: <d357966b-7abd-f8f3-3ca7-3c99f5e075b9@linux.intel.com>
Date: Tue, 7 Jun 2022 15:44:43 +0800
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
Subject: Re: [PATCH 0/5] Simplify vfio_iommu_type1 attach/detach routine
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
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220606061927.26049-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/6/6 14:19, Nicolin Chen wrote:
> Worths mentioning the exact match for enforce_cache_coherency is removed
> with this series, since there's very less value in doing that since KVM
> won't be able to take advantage of it -- this just wastes domain memory.
> Instead, we rely on Intel IOMMU driver taking care of that internally.

After reading this series, I don't see that Intel IOMMU driver needs any
further change to support the new scheme. Did I miss anything?

Best regards,
baolu
