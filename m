Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99B245001
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783549; cv=none; b=bZ8cuOC/gNpsjBDA4imLd3iYpLulq7fz1DfYyW2SQkN66Mo3RI3ncVRZMwYdB6Sc3JaYnVymrxazZvD8lc2z0ikHRcohNn/BMWfdehAK/JB1uk/tNPxGY1ZKDlfb2nHRR+jDGvaBv1eJ/t8PYbUBcKylXTrGedL5j8t89s5fugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783549; c=relaxed/simple;
	bh=w7qxWcK6Y+lr9flaT5izlqxkohZLAMbvmvIVsbTBCwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovsHC2MnKci86rqyD2HgFqPVCsyzqbCMiRp/pIrCSRIYci458U5DwrrM2ENxX9fimdVVAOwym+vPbYkothzWa47wedPONvJCbSsiwuziCr5Vq7A0QYnnYP940Ry4ZuvVvButxpPvC7TBPww11cfjhgvGV8byHcsdfqszkEppCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQ0KLx9a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQ0KLx9a"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso44145e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741783545; x=1742388345; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=sQ0KLx9axjSqYZ21A7AsgAa2NRLb5oRlWbylx4wUq+RYI9jE4anYSuxuc1BAQmWdT5
         glGBtD78kJHgEEJUUIHAxZr7EOFQ6GZr1dpz1fjyI+LdeiSWtgMJa1iPJ664tkiBxaJW
         G5pmdzW2/WpV+Y2fNXM3jZJAD4Q7Dp8jChwlIRc2VF0sbayTObo8Pzx/OfYY+Cx7ZNRC
         7iVwVHB3cwT7rd4wPnfJgqEBw1rIY32xuF7New1n/3FzlsONW6LLam2QG0YA651gS5MP
         8Rpo9UgNkERh1uqRXb8myY/ZvOrCvCGEvOvkGOtORB+nBSwUxJEFouqZ60LRCNwrJFgu
         6qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783545; x=1742388345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7nXrf8enrrb8z3uABVuZMTlrSLNofRDk6iKufuqXac=;
        b=Tj5sYmgFMjHSDhoWS+F3mmaCKOPICOMBDxjK3/R3/CIXBdVAQneZ0BYUyOEOsEdUhn
         ZftoAi6Fcpy3C9objNvb+pndWIa2leNutufFYdYO4J30jgaNMQU+Tg1uik5TbMaMtI7o
         3YaMkCC/iToap0Xmue842jIpCR12sh4eAENc0gBLZwtj3awb5RGwUn2hRFT+8WxgTmBp
         E9xspKJpn83SeG0pDm+UwHvh4R2vZH0gnEEci12xcaBpJBK0niMpn7OEO+kzDf2V0B0W
         +eqpzhib1siXvfdk7dzmyyrCXM0IPcfxP+3qYx5WTVRWmy3cOEnywjJ5scku+pSivOR9
         Kghg==
X-Forwarded-Encrypted: i=1; AJvYcCVIOKTNioIwqVeuektNhMMytIG0eide41LRxep741zmqyrhrDIYCDSptkdoy8foepnPPl/JYk77nIXBrw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp+eJ2BuHlhBqQaTfG/abFbgZv4oT5+03Bm45gF91bFGYGj946
	HuvelhVJAXohHNSppn6F2WTQxm0RDo6D/HKIzk4HGy3zPfgY60fsEw9981RUzw==
X-Gm-Gg: ASbGncsXvf1CJESq9YUgB1euwCXlTlADalk7TWodd574GjjwubwB9fg/K+r16L2E9J1
	dI7EDkz+WUKQ/EqOMN1q2iAOj/UaUjmJyL+vKFGNJsKWvnJ+OIdNppyl9EmUSgahqiPMkT1iDlm
	bEJC2z8YzUUYL2GmTdp1AsBcbvRtwNM04jlO7IsVevus+f7HUsE6SB/Sbws07f8gQCpm48N+xHj
	NA061JIUGhFbEUHAiKU7XJmVhnZWZ/54LFT2Z4dSWJ2HVA3wHxo0wtvceu5nHSxhtYNAd/tOc9p
	vysA8HkQIAa5lO44dPfOyPIyUbPlPFZMDoMZCYA+9uXGp3L5Zuw6UXhyaYyANWKEHu/wSfoANfn
	NPsQLGAReMF/JySs=
X-Google-Smtp-Source: AGHT+IGl6ij5XGs/qN6P6iUkVVrm0h4AAzKswiqP0QsBVlB9onr8dRHcRoIgJqJfm8N1ML/DsO9qAQ==
X-Received: by 2002:a05:600c:5801:b0:43b:bfe9:8b43 with SMTP id 5b1f17b1804b1-43d09ea3748mr1245205e9.4.1741783544916;
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8c5d0fsm20697625e9.32.2025.03.12.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:45:44 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:45:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 15/23] iommu/pages: Move the __GFP_HIGHMEM checks into
 the common code
Message-ID: <Z9GB8_j_8a4xCTsT@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>

On Tue, Feb 25, 2025 at 03:39:32PM -0400, Jason Gunthorpe wrote:
> The entire allocator API is built around using the kernel virtual address,
> it is illegal to pass GFP_HIGHMEM in as a GFP flag. Block it in the common
> code. Remove the duplicated checks from drivers.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c  | 2 --
>  drivers/iommu/io-pgtable-dart.c | 1 -
>  drivers/iommu/iommu-pages.c     | 4 ++++
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 62df2528d020b2..08d0f62abe8a09 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -267,8 +267,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>  	dma_addr_t dma;
>  	void *pages;
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
> -
>  	if (cfg->alloc)
>  		pages = cfg->alloc(cookie, size, gfp);
>  	else
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index 7efcaea0bd5c86..ebf330e67bfa30 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -111,7 +111,6 @@ static void *__dart_alloc_pages(size_t size, gfp_t gfp)
>  {
>  	int order = get_order(size);
>  
> -	VM_BUG_ON((gfp & __GFP_HIGHMEM));
>  	return iommu_alloc_pages(gfp, order);
>  }
>  
> diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
> index 3077df642adb1f..a7eed09420a231 100644
> --- a/drivers/iommu/iommu-pages.c
> +++ b/drivers/iommu/iommu-pages.c
> @@ -37,6 +37,10 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
>  	const unsigned long pgcnt = 1UL << order;
>  	struct folio *folio;
>  
> +	/* This uses page_address() on the memory. */
> +	if (WARN_ON(gfp & __GFP_HIGHMEM))
> +		return NULL;
> +
>  	/*
>  	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
>  	 * alloc_pages_node() did.
> -- 
> 2.43.0
> 
