Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515813;
	b=hN3pS0vrm8Arps6hgByLJbgZKqV1bcdTflJM48ktI/Twf70cQzVhJCXKvH3jGw3VEbF2
	 rWGVO336x+2KS5zym4B+X0NwT/DLryBfDVxZq3L2RynfHcAKk1GB4VmZ28hUGoRnolm2a
	 1H7NbSLvdVXRD91zPN0q+jM73H2HWmTAlVngVBKyzqN358Zzagvmf2RuRZhJjSOfvFXbR
	 XXSv7FdEV1YQf1eeFmxTEnQw2GagygXdhFAWKNEzqFisLYdS9jClC37BMfzrP5BoGilR9
	 Sg0ZEJnmfWHgIeIjSCROnLUigQuf2PHRbNoISwR86H+il79qgKqhfyGyk+4YSCWcASQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
	b=ZeAVal6eIHI5NJCKE9AoH4eYZjPCzeB95t/kN4dO0ZDbOZ9yNV2mnU9h2xrpybQpuK/0
	 L5FA5O1ZgDqyp/2WHDomfTlKtC+LdsZdPruf+C7vrk/n/x1iaWEcNL//i7SfJBBGj9Fs2
	 /Yvf8+YlYclVMfZOEHi+QYTN9sUnG5WcOADbCPRREcHzhlyjFGFhNgQ44qy5ufceYRKJF
	 h9iHK+kb8/E63rMnb9UTlTDBrgimH0nwzuRFyNY1yPx/nqgKdyiwazILlsVFvfvoUbOuH
	 3mpANimgvFUy+jzQ+nwxvWk3kLDr4WW610mw8LZiQmf5dJ1buv6wFz0eEoFxnd66MTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qQms9V2g;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E6860A2600
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 17:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E6860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qQms9V2g
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cc1ab5f6cso388617485a.0
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515812; x=1793120612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=qQms9V2gAItqF1LE/2eya+jGx+tPvFIDpgZbKWMFpOpfAevgX0n6u3uIHMDTCX7hg0
         bcTZuMCH1MQ7l113kA+cmnqKyfNVrDkphZhp+3DKR82+4k6DFObLkhm0XJvIbbYhhAOd
         qUpkPV1FzriSTvaDsvbCWzBN5z9W3zR7Ip+vuAMZz6CIHISepZnbJ4ULY2CSuReyZq7M
         Lu4IckIQeqg0ZONSYJ4oUY+s5bikMgynl1WrDDaAyQQFVXNeLVqata5JpKUBc5Bl6IJb
         eLsLixajuwjLbCVp22VWiGY1ymfrMJK/HT1k1fYpV49qxx+gtnDHqkpmPVX9pup2yB9l
         5MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515812; x=1793120612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=JCiicZaR5AbRi5MPl3StiX7lnsbI05zmbKhclBXM2QgH52q9b/OD3jEQL/vFnCYEPJ
         zndvAgvTCRsuZRSW+dVH57vGITIa3uoEW6xboZLfTRi3e/etF1s8j7O5fh5MteXHU/8y
         sf3CnQs/vfBDc5oPP9GMx+SN/y/sLxjZrH6qv9D4IdDJjOIAx4gYMmYHSb2lMrDQ4AC0
         ht+VKCc+xNokC+EanphdsePf0RW5wOt+D3m7UKkkcB+ZZ/mrIBL0BcRSJr4uZ17qjlRR
         F0R7mk0f+FI9A65BR/svzSgHByRNVtBnGXF3u9uyU5me4rZDPyBhmakwP2GOIPM1NmoR
         iksw==
X-Forwarded-Encrypted: i=1; AKwUvBzSVudDlzdkHCFy88Pgxn3qRpvv8114c4u5sT/xlnugTTVLJmB/qTJkDrTCezRv52pO5pj2VRadSLV/+w==@lists.linux.dev
X-Gm-Message-State: AFq9FYL9JNg+NqNTKt2J4SbfGATo/QHRLSVxDHekJ+V3HZki0ZAqaB8+
	qYGb2TpQ31kI7cZiwADihqs86r0L4WTUxPOT1UrnLtnJr1NaOHtQO3Pj
X-Gm-Gg: AYBFou0G3UCLyLYAt4jmVwK3fnrtO0p4332b6zUp21/PNnyuZfWib3HZqs6p9BeKdtg
	N1yZSssVNnU2reYLQhY94iSK0wutMwK0z/JDGDv6uLVHnssFvAuGf+i5DNEYiL0/hNsNuFTjz94
	eYdQjk/VH/QWDRN0uvZ8h9Ajd1OZZ4zFbvSLDlNy7852z1TKjHRau1KUpx3Kwh0NCq16877zMff
	XJkEyDoE74TJKTnla7NktKnEvWrTbGIl9ZtTizXowCiXuE1a8oyzu6TI1rprI/CeIjD0+YyaXSE
	lBEhuZTcLjYn1zKEM8x5iNoDs88ZRJ16o6tEaZNwkyqDaPiKJ7qty3R0YQzB7zebSK0IF98rX1B
	QndWLJPsnAPdVWKr/elriw7Eli4VRuwfUB7Q2bpYgOX39qrONyq+vhIU/qqFHzGyXM0ayhgIwVf
	cBjJjnVZ1ZMzWaHa6c6aEgYcGplXfl144Ef1yfW6KcQ3MHRU1NZeoEzGvRx4gc0iThLkO0QhZ17
	vfsAXmkf7U6g0P0cWSx8A==
X-Received: by 2002:a05:620a:294c:b0:93f:26f6:6bab with SMTP id af79cd13be357-93f29ccce99mr1849718785a.18.1792515811784;
        Tue, 20 Oct 2026 10:03:31 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6e030sm31479985a.1.2026.10.20.10.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:03:30 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/sun50i: Report TLB invalidation timeouts from iotlb_sync_map
Date: Tue, 20 Oct 2026 13:03:11 -0400
Message-ID: <20261020170324.1223144-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun50i_iommu_iotlb_sync_map() invalidates the TLB and PTW cache entries
around a newly mapped range, as the IOMMU can otherwise keep using stale
entries for it (see commit e563cc0c787c ("iommu/sun50i: Implement
.iotlb_sync_map")). When an invalidation times out, it only prints a
warning and the callback still returns 0, so iommu_map() reports success
for a mapping that the IOMMU may not be using yet.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the result of the
invalidations, after still issuing all of them and restoring auto
gating. The page fault handler keeps ignoring it. The unmap path is not
changed, as .iotlb_sync() and .flush_iotlb_all() cannot report a
failure.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware; a timeout is not expected on working hardware.
Compile-tested only (ARCH=arm64 defconfig with SUN50I_IOMMU=y, W=1).

 drivers/iommu/sun50i-iommu.c | 42 ++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba2..74ca3625ae25c 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -298,8 +298,8 @@ static void sun50i_table_flush(struct sun50i_iommu_domain *sun50i_domain,
 	dma_sync_single_for_device(iommu->dev, dma, size, DMA_TO_DEVICE);
 }
 
-static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
-				  unsigned long iova)
+static int sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
+				 unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -313,10 +313,12 @@ static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "TLB invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
-				       unsigned long iova)
+static int sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
+				      unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -329,29 +331,36 @@ static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "PTW cache invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
-				   unsigned long iova, size_t size)
+static int sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
+				  unsigned long iova, size_t size)
 {
+	int ret;
+
 	assert_spin_locked(&iommu->iommu_lock);
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, 0);
 
-	sun50i_iommu_zap_iova(iommu, iova);
-	sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE);
+	/* Issue all invalidations even if one of them times out. */
+	ret = sun50i_iommu_zap_iova(iommu, iova);
+	ret = sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE) ?: ret;
 	if (size > SPAGE_SIZE) {
-		sun50i_iommu_zap_iova(iommu, iova + size);
-		sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE);
+		ret = sun50i_iommu_zap_iova(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE) ?: ret;
 	}
-	sun50i_iommu_zap_ptw_cache(iommu, iova);
-	sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M);
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova) ?: ret;
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M) ?: ret;
 	if (size > SZ_1M) {
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size);
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M);
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M) ?: ret;
 	}
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, IOMMU_AUTO_GATING_ENABLE);
+
+	return ret;
 }
 
 static int sun50i_iommu_flush_all_tlb(struct sun50i_iommu *iommu)
@@ -409,12 +418,13 @@ static int sun50i_iommu_iotlb_sync_map(struct iommu_domain *domain,
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = sun50i_domain->iommu;
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&iommu->iommu_lock, flags);
-	sun50i_iommu_zap_range(iommu, iova, size);
+	ret = sun50i_iommu_zap_range(iommu, iova, size);
 	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void sun50i_iommu_iotlb_sync(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

