Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771FC10F4
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Apr 2024 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967930; cv=none; b=m58BD3G1KMEMfdKUppn05CQrdslgbFJjFCmnd3H2gyooJul0giYVh5Mm4jSxsYETr69T9vo7YQoz6xV/P6+uFF9ZO3/o2eR/VGaxUglLG7OKM/yWqHPbRraALJAXvItAIav7fyEZi+7atEzy8c3KiSr1oSUP2rpgf0CHumWvxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967930; c=relaxed/simple;
	bh=TehD/Ru/HAYMBDFGU99nYa4e2M5BvXq7XtR91Hn0y80=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPyrBvJsXerbQvLj2vnjIlJZac9oasoFmkiA/J9F8gyK3Z8idl4QjeCvjzyeLT+ba0oAr+7CTuNrbzLKT0J/md4iR6fMsKC2mEmLQXkog5Bryo9qBwocv/wCarOLZ1+nMkK3nsSdikFBpS5nL7o+4wpOt8rfz/kQZexNNfcrMc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=xDreLT3+; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="xDreLT3+"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78d57bd5781so91681385a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967927; x=1713572727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZlpX3txUE4TJWo1dAHShmrFptGg2d9oY1hNAoNGiuE=;
        b=xDreLT3+gv5wmFdJVclnHROK3Rnelf2MXPVfmTm5HTYIQcTsn5y1jYWdMu9BwBCJuT
         BDDIMwdK8HgCUr13s9zVIvL+1Z2hUYd4dHdT0655KKdmneah6xyTJyPWSFsV7o0TK5I/
         Uhhy22KuFle128KneC0cZ3eo4cNHRPNxA3o4qlo/QVqNMUDrP9RAUtCaSoGlAaiq9z2a
         RypQ+FLn3pSO/P0W3ObA1hESwD9mlCGl4ePqQZoBM4tE18Qw6ziococveiYwp1J2HCaa
         R0kvzxDFOizv3rd7pf1QZLPfMUvIfBNzCyFgLydjln9f9b1sBs/Oh4TSiObayUyr2q63
         xwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967927; x=1713572727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZlpX3txUE4TJWo1dAHShmrFptGg2d9oY1hNAoNGiuE=;
        b=WM9ljpujecYoTXmrSLVMOYVIxRtuTxhF47wY/PtcvZZYX2yhh5ZLVoIkFCSDMZSiUe
         NBfEEIBlZp3FQctYu24ltd62QZjGQ1zt6sbdGYFtUQYblanST16DZpS9LhI9RgstYOfG
         0WGMhwqFLK2vO3Vofv+MYt+cOhpnDdAB5py9uzw6F7Vv+0gF0le414dlv7mHgCBw4dFC
         FpBRu/+ULcu63ATRoc4xetLU3wqlfe8khASLg/hyw6IwFntSZpTlJaaTODtQuVzy1doo
         Gw6HbCtV2J8UUaSmA2vLCeo3+lId9TwI1d57EM+PCZZS9VQ+ciYVxI5ohkz+KWRwZdaX
         zV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaFzA/7wOPyC3SNXA8qCYra4JHLTiTlpNwaVeXsSMSJimSPZHc4jN/TMdKMpNUKTVU8btwCAIf5UrSoV8a6FdGJEdWuNd2g02wW44=
X-Gm-Message-State: AOJu0YzdHHwVan3pFTqhuND9b3l9/3ADVNFsyrLcQ1qgANME03brLlAI
	quasWPOr/NiexqazGtNUd3R/MjkzHMkI6EQ+JdPomB4gPWjcTBVHI9pqnSzRIP4=
X-Google-Smtp-Source: AGHT+IHnFRJRktafMl8iFWoPD2wZry7L4eUZEKmr/HQPmjiBtsCGzy14Fj8Nir/jZCpUWrNk2ovbMw==
X-Received: by 2002:a05:620a:56a:b0:78a:f5b:ed05 with SMTP id p10-20020a05620a056a00b0078a0f5bed05mr3835236qkp.22.1712967927419;
        Fri, 12 Apr 2024 17:25:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:26 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 02/11] iommu/dma: use iommu_put_pages_list() to releae freelist
Date: Sat, 13 Apr 2024 00:25:13 +0000
Message-ID: <20240413002522.1101315-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Free the IOMMU page tables via iommu_put_pages_list(). The page tables
were allocated via iommu_alloc_* functions in architecture specific
places, but are released in dma-iommu if the freelist is gathered during
map/unmap operations into iommu_iotlb_gather data structure.

Currently, only iommu/intel that does that.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
---
 drivers/iommu/dma-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index e4cb26f6a943..16a7c4a4f3db 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -32,6 +32,7 @@
 #include <trace/events/swiotlb.h>
 
 #include "dma-iommu.h"
+#include "iommu-pages.h"
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -156,7 +157,7 @@ static void fq_ring_free_locked(struct iommu_dma_cookie *cookie, struct iova_fq
 		if (fq->entries[idx].counter >= counter)
 			break;
 
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 		free_iova_fast(&cookie->iovad,
 			       fq->entries[idx].iova_pfn,
 			       fq->entries[idx].pages);
@@ -254,7 +255,7 @@ static void iommu_dma_free_fq_single(struct iova_fq *fq)
 	int idx;
 
 	fq_ring_for_each(idx, fq)
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 	vfree(fq);
 }
 
@@ -267,7 +268,7 @@ static void iommu_dma_free_fq_percpu(struct iova_fq __percpu *percpu_fq)
 		struct iova_fq *fq = per_cpu_ptr(percpu_fq, cpu);
 
 		fq_ring_for_each(idx, fq)
-			put_pages_list(&fq->entries[idx].freelist);
+			iommu_put_pages_list(&fq->entries[idx].freelist);
 	}
 
 	free_percpu(percpu_fq);
-- 
2.44.0.683.g7961c838ac-goog

