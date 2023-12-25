Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F252F62
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Dec 2023 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9mqPlfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703520585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqafsTsLWFL6NUacBRAsGtc9kpoOdr+j/kVqdz2KGps=;
	b=D9mqPlfTwYuNJi4B6KW9virIn25oAF6KJO1DPRjL3QgxGoYi/aZvQhQ6SxaAucfl1mfkTI
	2BhAsqnTfOgOxR+qFBkoEO02/lLWZdSG4DtRAMJ7mE1KRUKAFVGeLstdjJ6VVrBdaG+4BT
	HC6YfH4aB8ZfJIQTKQ076gm3A3IuBSk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-qNvhP-0DMQ-DgvyOf9r3xA-1; Mon, 25 Dec 2023 11:09:44 -0500
X-MC-Unique: qNvhP-0DMQ-DgvyOf9r3xA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40d5970422cso16425e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Dec 2023 08:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703520583; x=1704125383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqafsTsLWFL6NUacBRAsGtc9kpoOdr+j/kVqdz2KGps=;
        b=wflORiZIhRwFRFJk4NFqEDC1ntHL1qaIW7PkJEPeUdgTMViBReSQhQlSaHdlQZ7LcC
         jcWyqz8SMFOT0H2dR2JweB5OnV4Y+zPHvyV6iEqHGpdh8fk3lkSY3pdZcNu5cFH5OR1Y
         M9mrHeY//V6pibVRDerPVcEptr0p13r/6iN4Wh3bRl6NGjbgGR6plseYbt7HSpiXfq+w
         IHMJD2D1+FrY4phHag3jTqBCp07IkAAV8tNrHwAmUBltCzliQYXOeoi6kvUSjML8C4LT
         mypyTfgOqx2GDJcvOlapChnwe9/1tC3zKmmU8vGXJ5EysApN/gdxqypPQ8lWoact34pZ
         dkUg==
X-Gm-Message-State: AOJu0Yz5YD2swgaa/Zxj/a2ZgUB7HxSIALFQQY9G8VMWdU6BaOOVFvww
	0bSiuV3V1gUbw6qppvvM13bGfPDPj+tBKuq1Sk+U1tK5hbU5jaQXEF7cGgef/S5V/lUF26m4q+F
	rESMUbSRyJNddof5EWvbE1qPVwTRkwFY=
X-Received: by 2002:a05:600c:4587:b0:40c:33be:d193 with SMTP id r7-20020a05600c458700b0040c33bed193mr4060339wmo.78.1703520582971;
        Mon, 25 Dec 2023 08:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfGGCax+SlWX/roShT1Wqm6zJg2zHkXbA4PNy8JwUTudzLUljk5TaAwhoH/7jZ8kvUv2pY7Q==
X-Received: by 2002:a05:600c:4587:b0:40c:33be:d193 with SMTP id r7-20020a05600c458700b0040c33bed193mr4060329wmo.78.1703520582646;
        Mon, 25 Dec 2023 08:09:42 -0800 (PST)
Received: from redhat.com ([2a06:c701:73ef:4100:2cf6:9475:f85:181e])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b0040d3db8186fsm16769282wmq.5.2023.12.25.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 08:09:41 -0800 (PST)
Date: Mon, 25 Dec 2023 11:09:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com,
	alim.akhtar@samsung.com, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, baolu.lu@linux.intel.com,
	bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net,
	david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org,
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com,
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com,
	joro@8bytes.org, kevin.tian@intel.com,
	krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com,
	marcan@marcan.st, mhiramat@kernel.org, m.szyprowski@samsung.com,
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org,
	robin.murphy@arm.com, samuel@sholland.org,
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev,
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org,
	will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH 15/16] vhost-vdpa: account iommu allocations
Message-ID: <20231225110930-mutt-send-email-mst@kernel.org>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-16-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231128204938.1453583-16-pasha.tatashin@soleen.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 28, 2023 at 08:49:37PM +0000, Pasha Tatashin wrote:
> iommu allocations should be accounted in order to allow admins to
> monitor and limit the amount of iommu memory.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  drivers/vhost/vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index da7ec77cdaff..a51c69c078d9 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -968,7 +968,8 @@ static int vhost_vdpa_map(struct vhost_vdpa *v, struct vhost_iotlb *iotlb,
>  			r = ops->set_map(vdpa, asid, iotlb);
>  	} else {
>  		r = iommu_map(v->domain, iova, pa, size,
> -			      perm_to_iommu_flags(perm), GFP_KERNEL);
> +			      perm_to_iommu_flags(perm),
> +			      GFP_KERNEL_ACCOUNT);
>  	}
>  	if (r) {
>  		vhost_iotlb_del_range(iotlb, iova, iova + size - 1);
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog

