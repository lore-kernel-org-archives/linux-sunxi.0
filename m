Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDCF219A81
	for <linux-sunxi@lists.linux.dev>; Thu, 29 May 2025 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748551585; cv=none; b=Y+c4f1c/F+OqBcFrOfADzp3mMas6muZ4Q3+AW0Ci1V0bkfLJ7UF+H/KcSVfWjQfUIVdo9yxArCpqM8sTQTKMQIxsehYSSuA6XW/p935AcxDjSZhTK7Zax6HbmzfLiU06G3BOrCKD5g2e3szgAU7F2TQa3z0JlW+KPQ6Bf15Q0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748551585; c=relaxed/simple;
	bh=/6z1v/qNBfUFOoxicD1V48QdZQfp4IVH4S3L1yiqKHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6f3tKNj9IDGaL1OvkLsMYxXDt+aOVGL++rH0yHlNxOit1V+QMOuZEEhw9pbzyMGPFjpC2+OBp3OsHHJp1eSSl2UYfh19XRcOiYH+70GUCT8D65Sw1VQmtQzWyHZLlGAFkhHUl52dsYxtp5h8vA4ssEuFSLR/cIDfyiOtmzBlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I0t6PiXS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I0t6PiXS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so884370a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=I0t6PiXSoZrBF9J5KO5c/+TWwhbLPDqzCbnETq88BbHJPm/JDwrvmZ/8E/8s/2vcH7
         ghjD5okdEGDLVyuLJxOJp4VGX+y7J0PyeqPWffzJWl92rDOnFCFoVs4tVNd/41Zqw25x
         o57NpwVM74chDLx0+ulFXTGCKz23JhENKaFX/IKV98gYVzM0pq4aOT1jj5wXCM0OFShr
         60bbKWMLDPMpCO0YTzObVuWqVuqxAQfYxw0/vH5B0lF8EOdavfcmaRhb/9Xh78ZdfaVF
         1kaV9VTGps6KzYs55kZh0lPj/GmBF7ugYQjgukohSYZyElelLr1CTl4huFDqY+sDpdbv
         hzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=nv4BC8FDen+7njzcuz/yguTHGaf3aBclqMFy4GQiO0wOSxnr/qliPTbgJ69nbLtNfU
         qt6Fh1MWPbtwjxazNuFM7VCBsoxVJvw6OLOOZG4iXFI5S3400U+gmPlSh3wxn3qheXvW
         pD+StHyNqkkzK0q1LKyM6KcVUfH8eg3SMvgwDO8wGq9FtstL3/JR3pFbQNLAIm5Az8Pa
         iHChhcbivlhA9CKyZWQsNSPUzXgNU6e4O9c1rDX+pnlOI4mnfJwzMBQSWVtKx6lCbPgS
         CjU59nJoIgThgcjqETJ5oM74oMt42c5wT2N8Dx3RpOA2CAQUEox23eLlDUSCpzFj3jEM
         lMbw==
X-Forwarded-Encrypted: i=1; AJvYcCVZo746w26V5+CfppomgLK+XAL3vnJlq1P/tVP/eVOaABv0tl3TYuh2Guzw8GJV8/BEG900lr2QfCmj1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7s+FxGg819bT4hI5nKWPAw/dx9HxMtrNVtnj8IUNUpOMAAF9V
	+D8ihGLql4CB4mlU0SRFdAUVMWcL/zaHIIgq50X48PduJj/FIJQU+shriLtLnDj9ADg=
X-Gm-Gg: ASbGnctsZNYE5Hbk4a8YqhEqtQa1+zZZPwaoPTSApHz8q72wWS9H1kpQP65kFxHOEtN
	OfGReoahe0r57mb4nqaPi3V6KWv98gDgiBB8e5v3JSzSgLH85/lscaht//hd33vAlIQ4gcxpA94
	F7cui8nJ8Xt19Bdcfb1vFoeSrDWJACO2JVKdu6/C6KnOC6sux486Kuo+DFEBs6G2i+OqBMiIbh+
	uyXY7WYv/2Jtgfjwd6cIQ0VIMAG4WlK+oGSfdpanxzfuwYE4Z7Z7nIn+IDIwEO3M23kbf3x2Wvz
	LIC9h/KV0NX0bSfPSacsDV7Datvqo6FdLjnPrD9FY/B4QAizka0XDXfDnXZ1OSx45dAGDA==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz
