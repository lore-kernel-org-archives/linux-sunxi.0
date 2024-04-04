Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA2E128833
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Apr 2024 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712239016; cv=none; b=ibcTXgZslXJvX94CxQb2G4vbOe7stwhNSk2EpDd51BFNWu0zGB4mlBCxpDNe3Vp7s0fMuAluSISyTW5iyfOKdrD69mbIU3B5RJI1Gil9X9V8kKdtE9qfupZ5IFgak9IEyBqPVpVzqtA0qxKSVkHAc5sRf3i/bSPsGTEvmeZ81MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712239016; c=relaxed/simple;
	bh=dyJ8/jg3OEVZu3rV6eRPJgBUaaPW7kEy4ZucbMmQDWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5WJQYN1TsqKw9+WMeAMNzGEdANMH+afy9ZsiMJnYDRXb5MHYhyFE8A5zP7FulhcVhXb4d20um91QNW0U6cL+dnkQpyG/HmkWDqjl0CaUjWlUUlKCpL6YjLVYcrQQ0oPz0tdH74+iKMfsTHLDRxvFet4N24Ou/YmhKvOsPzxv5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=jYm83+u7; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="jYm83+u7"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-430c63d4da9so5707781cf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Apr 2024 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712239013; x=1712843813; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=msc9tQgMq343nFV4/DBdPcJS7hGm3uD+5fv8GwkMOjA=;
        b=jYm83+u7HGiOkoYkwajiJQUcNJ94ZYBpTdIhzUPrnuVl6UgDzbUy3QDR6FLVX+zg7w
         MIUIH+gFCxoXtiAFg6GCnewPevAgFbqayxKUBh9C0SLDDo786vlTZEXkxfjq3dch6O6q
         +bbMxkdrm1d1gRIikYwkbBrQg513V/J4Jf8ZAZCaT9H1poTGMm5f6XIDHkADgiuiva9G
         0DP0oRjUMbY4Zp91S5xP9m2sVV7Tpo3BIlXp0Nj2hgQGHkU7XTYhejFL1dFk98XWlwKp
         vbckTWkD2sfRxJO0qJa9qU1ll7M7uW8bA57Nfbak7sHfu/zERxDjdmqhUbxOps8E8rFl
         6owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239013; x=1712843813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msc9tQgMq343nFV4/DBdPcJS7hGm3uD+5fv8GwkMOjA=;
        b=brosm+XgUifLdKJQzmcW9RJbZHe1t6mUmZrHckm4XTq/28rFAIN1XbB251ZV4fduPm
         JF3U2Qumhr8jYCRAIGjmIlrJhXXrd9U9w7QN9klPPCyKKModL+qn5cxA/0rEEzXMEfrO
         /lQ7lB9HS6LLfMErT9nQeRim3TfMBBOjtNXD6fo0ANxXMq4SwRCwKGh1M3ZAkmRDKyZS
         JqLcdLFyzOvLnZ/70xz7/p36uVWbrsOqo2BBD1AvUtsdJYDt3oiz9bQJc32JwEz1qugD
         W5LFGJFJXF9v5B2URN2uPLfO5nbsGBmfZSAaZ9dQprfZUFJ2AQEbE0qBijcW//iciL/P
         N1kw==
X-Forwarded-Encrypted: i=1; AJvYcCVum7Ps/GqpKFxFwoidMrqe9hgHD+tAVY8geUdDolOegHDnnSnYAcDksTzZYXCYrJFculrkZqY0hlTtOPw845NUQzgxpcw+EyhsU5w=
X-Gm-Message-State: AOJu0YwHo1w1mRJI75w9lh0wrVrraUQb5whRO/arHuTiImKiPIn+oi+r
	saYPiU07DOoXZcd2/xoK4NYDDwdAABmoO0w0/E6ZeuSkMwfwSxFHsO/eBO2ZA7S7Df2gpDNYjJe
	4KAOZRLw/ycbMWl4NzbSKwyY4IOaAqidWIrXHGw==
X-Google-Smtp-Source: AGHT+IH9S7DU2DIf+z4/lTa3f7DcyJz1Y9kNOGjz2IQr7tohPqSHHhqayAGWHjuk7zhrLKiTZ6wb5Cu4ZzpulPIDrg0=
X-Received: by 2002:a05:622a:2:b0:431:378d:afa with SMTP id
 x2-20020a05622a000200b00431378d0afamr2733138qtw.34.1712239013126; Thu, 04 Apr
 2024 06:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
 <20240222173942.1481394-2-pasha.tatashin@soleen.com> <20240404121625.GB102637@hyd1403.caveonetworks.com>
In-Reply-To: <20240404121625.GB102637@hyd1403.caveonetworks.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Apr 2024 09:56:16 -0400
Message-ID: <CA+CK2bDmya+768tOvF0N-BYq8E+RwBw4xS8vC+MmbU9eoOv_3g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] iommu/vt-d: add wrapper functions for page allocations
To: Linu Cherian <lcherian@marvell.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> Few minor nits.

Hi Linu,

Thank you for taking a look at this patch, my replies below.

> > +/*
> > + * All page allocations that should be reported to as "iommu-pagetables" to
> > + * userspace must use on of the functions below.  This includes allocations of
> > + * page-tables and other per-iommu_domain configuration structures.
>
> /s/use on/use one/?

I will correct in the next version (if there is going to be one).

> > + *
> > + * This is necessary for the proper accounting as IOMMU state can be rather
> > + * large, i.e. multiple gigabytes in size.
> > + */
> > +
> > +/**
> > + * __iommu_alloc_pages - allocate a zeroed page of a given order.
> > + * @gfp: buddy allocator flags
>
> Shall we keep the comments generic here(avoid reference to allocator
> algo)  ?

There are no references to allocator algorithm. I specify the zero
page because this function adds __GFP_ZERO. The order and gfp
arguments are provided by the caller, therefore, should be mentioned.

> > + * @order: page order
> > + *
> > + * returns the head struct page of the allocated page.
> > + */
> > +static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> > +{
> > +     struct page *page;
> > +
> > +     page = alloc_pages(gfp | __GFP_ZERO, order);
> > +     if (unlikely(!page))
> > +             return NULL;
> > +
> > +     return page;
> > +}
> > +
> > +/**
> > + * __iommu_free_pages - free page of a given order
> > + * @page: head struct page of the page
> > + * @order: page order
> > + */
> > +static inline void __iommu_free_pages(struct page *page, int order)
> > +{
> > +     if (!page)
> > +             return;
> > +
> > +     __free_pages(page, order);
> > +}
> > +
> > +/**
> > + * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> > + * specific NUMA node.
> > + * @nid: memory NUMA node id
> > + * @gfp: buddy allocator flags
>
> Same here for this one and other references below.

ditto.

Thank you,
Pasha
