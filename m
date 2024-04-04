Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA561272AF
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Apr 2024 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238699; cv=none; b=Qpft2A/rdeFsoaxsi9P2q3nQjUiXvJBG7xYVAvS0ClyKxfzh3Lb4eJIpB/ZoB54iB0u4oS9Km/KTALq7bg6A/HnhBZ+ntiq3BGmFkbcRmu8//+SC4p8zP6e180/MXhU+GOpVX/CrcKnag8LeOi2p+aylZ+0W0+mSRwvNi6PoMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238699; c=relaxed/simple;
	bh=1F5VA5YE599dOlO3zQ9ZskLhNBoOk9J98W5SFXY1QOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWsBDtY85Y7F0w7/Q3O9Xu5Vu+b4kh9460rTAZXvTfqN5wyUT0rMwj+Ib1LBXw/LytJnfUN0wuf//NjFREtliBtEpqQk/vti+FQN2TOWikWYgmq9LmoNi7ERHFAniOguiygCAvP9OiMWXN0+qgU4MBRghyh992S6AlOGF2XJn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IzfE5vno; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IzfE5vno"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4317aff5cfdso5478231cf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Apr 2024 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712238697; x=1712843497; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=IzfE5vnoiAc9MJaXK8UgSvYV0wf4OC9IRAn5KqO0FvlPHGhZr3CO9nlAC9ab9zhR9x
         cjgkIzuUMTnvsTcSULmgVcZqZLMt7n9nfETyoOZbuFF9K3LNBt9AwMMY7Dlh4Po4Flcg
         oF+Wb+3B2fQNbMnIXz91wI7TP4BbHDp+r54zg8o4Gnvf0L2m8Vi5RhZzD4q8wZHn0e3a
         qmFdJQEvoIHHsPixthiIOEjhVLU9GCUyYRxy+tNIMzdNubPZ68SY0KlImQDAGgphl/Fo
         fLbqm+2J4aB+uQ4uCRxndYTNjmzBpZ1CC8sahNGj4xnrYdcaV5yvHiaEEqdTpnCplS/Y
         CV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238697; x=1712843497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=jJp1ycWsiUr7kN6IQusAtmvyzFEPR+cHvdT3JCK3ITnhOUNqMpCVWE5qubitHTJSkb
         EITvZyro2WUUQYxRwTuZ0gXzMk4LY16DbxHJ/keWnRoXKjLQNwQewdHmDrSDhi2TEIkS
         VrGlJtzGecfLL8pGayY7mXLHybhVQu77NANACKZysEDLlwhA5UHN+iapPkNVnzu6Ea8X
         WwGok3rAvSLLK/6MVrYSf7SyMq3Dr1eLhxGYFp/pENo3q/6J2uScvrD50i+JwP7GFhcC
         CP6sxgzLoQkTaZfNvJYrCp/LOsu4G21rbFCi3MSauk3BdtIgl8+Y/VMwIfHUt1Fk8y6z
         V/4w==
X-Forwarded-Encrypted: i=1; AJvYcCVqMhiaYeq3k5ze5bfgq6RIQaYtaM88JpQjAJX0Y8aWdS4SC30fTcCk+Q8qX18seyt4EtX+VGY49acvKbIvZ+ZSgYGSq4IE4UPc/xo=
X-Gm-Message-State: AOJu0YxLClickaWnzXg+Ayd9piIUNtivAIO+fr8O7tYeAJajh4nk7nPJ
	XgR0oAXkYX+rNeDOX/2LX/Zj+zoBfvg5WXiImJW7gcoQJTS17uTDkLVWsdTqc+KPPq6r+URn5v/
	v8FdBEzeyyt6XPqZoyfa/U+EZ579i+qTyLZm2dw==
X-Google-Smtp-Source: AGHT+IG34VfsrO/bFBQm1+tAdMAMjkEMbTIL7Igt83TuV9+7PUf7aasZynC6bg9Q2hezj4QPdzlhPGGLCOEcmSFudGM=
X-Received: by 2002:a05:622a:20d:b0:431:8135:6fa9 with SMTP id
 b13-20020a05622a020d00b0043181356fa9mr2490307qtx.61.1712238696692; Thu, 04
 Apr 2024 06:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240404005803.GA102637@hyd1403.caveonetworks.com>
In-Reply-To: <20240404005803.GA102637@hyd1403.caveonetworks.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Apr 2024 09:50:59 -0400
Message-ID: <CA+CK2bAiM_eC6k2EVL93uuOwB+hhV1WkDDK0YROo9-wAh=ju-w@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
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

> > Description
> > ----------------------------------------------------------------------
> > IOMMU subsystem may contain state that is in gigabytes. Majority of that
> > state is iommu page tables. Yet, there is currently, no way to observe
> > how much memory is actually used by the iommu subsystem.
> >
> > This patch series solves this problem by adding both observability to
> > all pages that are allocated by IOMMU, and also accountability, so
> > admins can limit the amount if via cgroups.
> >
> > The system-wide observability is using /proc/meminfo:
> > SecPageTables:    438176 kB
> >
> > Contains IOMMU and KVM memory.
>
> Can you please clarify what does KVM memory refers to here ?
> Does it mean the VFIO map / virtio-iommu invoked ones for a guest VM?

This means that nested page tables that are managed by KVM, and device
page tables that are managed by IOMMU are all accounted in
SecPageTables (secondary page tables). The decision to account them
both in one field of meminfo was made at LPC'23.

Pasha
