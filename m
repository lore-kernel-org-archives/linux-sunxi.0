Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE88F77
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708561667; cv=none; b=LZdvoJpvpLwFHFlzHO3CadVz6iTpYwotFz9owJ/cAldbiS3jckK/Yrtj+2QHxL+leS7jqj+P8UrcUQO/PzAgnkrQX4aN1D65+wuL31+kPjj1fZY90zAxEFsr433xXfKObE3ZWC4070TZiguFVx7uapL+WbpB/Nc8Wec03tA9EPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708561667; c=relaxed/simple;
	bh=KFCl6fU1744flulJCJ4xzKP7ZfOs3jlFHZaEmtavvFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUN0Y0JRHVOgnuKLU05xoa4relMuGP9caC4901y4n1RXC7aGHAdoKo0mBKPGS05CFt6ASEjNKhrD1zyIkl0RSvLvF79qIx4EyGntgvSnSDrWz+OvMmctq59mCkBKDJ1NfakBzae3nt/4RA12pC4GEQ1Bi9bfbvgwR8O3De0qfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=LHHDn/nF; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="LHHDn/nF"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42c7c1cb2e9so42174451cf.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 16:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708561664; x=1709166464; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ94+F18kEzvELBZYdN+dTOkgUJXZz4kfGzznQZui6Y=;
        b=LHHDn/nFsRHTm0vQNZYLmNE2zDndtM7VgpFD9VLaZPMhSF9svJ5+7adKUcj3ND0N9G
         IjH1seXf03hg+7dwZv1Rk5QGSQ5iJwASrxWfg5fZIMDpqelseS6ZqXiexzwDqgw6WF0u
         KjVZnYfSNuUh/nEQsyE23elBoPHA9anTC2w4gtuMB5PPKsGocgy2JpmNeKsIO1us9ved
         3ErClLEkYqLB/mAp9bBKr02SkUUV3QcRY/XQNgwQi+p16Ho4q1vGMD5EGd1nGyD99GSv
         2Kfp7wcp1tlU7X8XQG1KBYLsyZxj4PkqlmR9ZaxdD4pmdnCvlER4EMUCdJS9XECuNzsK
         B2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708561664; x=1709166464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ94+F18kEzvELBZYdN+dTOkgUJXZz4kfGzznQZui6Y=;
        b=KJg5ier8kaGqk9lBZXwQ8x3n/1QZg3XTRH7EzLYga3117OZ/X5WRAbOGHUem8lVTTZ
         CKdpj582ErCZFVpKHR8//Kld99RFuhAKXNqJ4WP9Vbg2B+PHFMG2qDfM8+r09Un+Wssm
         8SlwbgV4OMK/Y3hdeKj1VLiTaLHtGjKliOa+Ygk0ABmz+br1g01uk2cfeyW/M3QASyrf
         rAKEyGTW3DFr3pwhvdfKbNblc/HdCLVK/6Qh80arx0Z06KiWd8fQ/eYmuyuPdnlp156G
         rpp4DXgk/krYKyHg0qTtlAC2ZKjHvzwZ067YCXhK/7Yv+rMbSEtb8XX0k7lkRLhgkQdA
         SfPA==
X-Forwarded-Encrypted: i=1; AJvYcCXvA30gr9TmChHh6kQ/1BXLY0evw4Gj8nyFxvotBEu+mLvB7gCbdBj+iZopvmO59f0O5dEAwudoFkihtceTC2y9sblNMn8SDusHIC0=
X-Gm-Message-State: AOJu0YzYKFOZvqfAgKgBxIEuTzSQ6FkpcmTd3ErWTpMT97pDaCO8RPHT
	OW+i/3PWLkErAlfbNRmVlHawSPRjU0NJldbvyD+JYOZNr4diFxVWwvC/9cxHCirc7cBorJ/7+ex
	idTTAI8movFzKiu8JZy0NssDmGSIjRIAWjtESQg==
X-Google-Smtp-Source: AGHT+IGOmZsSpC2Y4SyYnlcRyS9zDA76SD5RvGLDRLTwS53fSOkMzROnT7IsmFNQ2MsELKRVDDNbuO1hZG2u+Llmnq0=
X-Received: by 2002:a05:622a:1391:b0:42c:6fef:90e with SMTP id
 o17-20020a05622a139100b0042c6fef090emr25244584qtk.65.1708561663980; Wed, 21
 Feb 2024 16:27:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226200205.562565-1-pasha.tatashin@soleen.com>
 <20231226200205.562565-11-pasha.tatashin@soleen.com> <20240213131210.GA28926@willie-the-truck>
 <CA+CK2bB4Z+z8tocO79AdsAy+gmN_4aVHgFUsm_gYLUJ2zV1A6A@mail.gmail.com>
 <20240216175752.GB2374@willie-the-truck> <CA+CK2bDURTkZFo9uE9Bgfrz-NwgXqo4SAzLOW6Jb35M+eqUEaA@mail.gmail.com>
 <20240222002152.GG13491@ziepe.ca>
In-Reply-To: <20240222002152.GG13491@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 19:27:07 -0500
Message-ID: <CA+CK2bBGzM8Xbfq9A7HHNr40oukvAk7-1RK7AFbW3qFcNstb5g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] iommu: account IOMMU allocated memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, akpm@linux-foundation.org, alim.akhtar@samsung.com, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, baolu.lu@linux.intel.com, 
	bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
	david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
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
	yu-cheng.yu@intel.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"

> > > > > While I can see the value in this for IOMMU mappings managed by VFIO,
> > > > > doesn't this end up conflating that with the normal case of DMA domains?
> > > > > For systems that e.g. rely on an IOMMU for functional host DMA, it seems
> > > > > wrong to subject that to accounting constraints.
> > > >
> > > > The accounting constraints are only applicable when GFP_KERNEL_ACCOUNT
> > > > is passed to the iommu mapping functions. We do that from the vfio,
> > > > iommufd, and vhost. Without this flag, the memory useage is reported
> > > > in /proc/meminfo as part of  SecPageTables field, but not constrained
> > > > in cgroup.
> > >
> > > Thanks, Pasha, that explanation makes sense. I still find it bizarre to
> > > include IOMMU allocations from the DMA API in SecPageTables though, and
> > > I worry that it will confuse people who are using that metric as a way
> > > to get a feeling for how much memory is being used by KVM's secondary
> > > page-tables. As an extreme example, having a non-zero SecPageTables count
> > > without KVM even compiled in is pretty bizarre.
> >
> > I agree; I also prefer a new field in /proc/meminfo named
> > 'IOMMUPageTables'. This is what I proposed at LPC, but I was asked to
> > reuse the existing 'SecPageTables' field instead. The rationale was
> > that 'secondary' implies not only KVM page tables, but any other
> > non-regular page tables.
>
> Right, SeanC mentioned that the purpose of SecPageTables was to
> capture all non-mm page table radix allocations.
>
> > I would appreciate the opinion of IOMMU maintainers on this: is it
> > preferable to bundle the information with 'SecPageTables' or maintain
> > a separate field?
>
> I think you should keep them together. I don't think we should be
> introducing new counters, in general.

Thanks Jason, I will keep it as-is. I will send a new version soon
with your comments addressed.

> Detailed memory profile should come from some kind of more dynamic and
> universal scheme. Hopefully that other giant thread about profiling
> will reach some conclusion.

+1! Memory profiling is going to be a very useful addition to the kernel.

Pasha
