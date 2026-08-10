Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9C3769E9
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357269; cv=none; b=TbmCB+jS9URuxvfSqAUCEjf6LJZi4KwBdnW4xVbqqXm8ssI309cmYouIxw+3h/A0PtUWs/EwRFxgqY/ouh8i9IRunR2lqTuD1Xe3UHsVzKfoxCCcJtzU/Q4GEviu9UDVGI4Onr9NFpUQ59xmI5vQb/oQ6rCJO8t5dG5f5YxSi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357269; c=relaxed/simple;
	bh=jluzJusjx8HFXTzca86JgoRcy38vgjw9MxDZ6gYe/IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZppJiQ/RQGb8WnTCJf3p55D5L8/SvRC/Yids+Kb5WfnqTTOEHBGhURUD+DnPNMOjkg5gQiZ55DbKc8RDTSnKwNdAVtkJFhVo4LRllLoEe2d7NV/DhufMIyqUM8zyk91Q0XoUGhvSuasV8hHkiMczOEmCIp9UffYV+GleqvVZpys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0Vcri2k; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0Vcri2k"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1680374a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357267; x=1786962067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=i0Vcri2kCQ4FbmYxyUmQkcedcCXZRVwbobJj7YbisYD77p8rROpyYkrIsRJmfrSLvM
         z62rSh9XC+VunHMQD8botJinv7BeYX7IVXej18jBS8XN5I7wObQIqiKIfcWqvI9mdox/
         Yx6UvvAPfnmXsYPSrzaEHzmHRQtkb23vuuGrmeGBVPsxnxhz1Sv0coJ/Nd0PD40ue1FG
         8KycgbaCH17sk5Jwn5w8WY2kwP9GtC5gHs0H1dV0rUnMdIDZq81CYRwMcb8bukyUYyWo
         x+jbibwYEOTkd+2jT6C3O0wFAvdi7jT3fopDw0uT/mZD6HUUHW+NCHJes9RiLzkoCejS
         836w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357267; x=1786962067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=SJSPf3xSE+4lB8B6uz0dL7AQJ9aPKXVnTZJKXqSbwaCaNgI07PvCFJfcpLRJIk+6v6
         HIPJepwX6g8gOGlTn2esgE1J+lkzAcnPxI4ZuTBXmbKl49Puy3vcwWxbC1YsiDgzv4/N
         19/Vvb5q+huWLgfg3UuViMyU5SafNSuVOocdFSs5olV4v+9iZ5niVolx59p/sAmHGVtg
         Om37b9+TaQcuWYZWKFeBto3JC9OLDHYSz9iBUnwbmum+CnmTQFbp3yGhqM28QO+zSSFD
         zIgGNlI5xm+HqurlMZHOlb6zN9lSYqsHZk3Q22HX+x4QDOJ2g5cETXt82zT1pW5Bitmr
         JqnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro684Lu77f3u45hF5sTZKSXxp3j/Fi+/e3f7sihcwFEEwuMJgRWEgUBiJV8oD4YAhM6EL0EKS6PjuVbsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMhYsnlXn+MxnQSEZMHl1Su5o46no2b/jIgTab1AXiwjohb30
	nz9REBiD/zz6kIcPj2EuWiNzyNoXhwUhqwZQjmqiKyZT7ybKoflFNJI7
X-Gm-Gg: AR+sD12X5DqQMxRhzWQbI0mO0jFk0vaeZqKq/Kqm4akYo6eR70gQBYWDnIE2jmdQ2o1
	tb5tU6KVZ1A5vJejo6IEGxjERTHq85oRfPH6e2VN5RRFlJaTKzlI5la6VaZe4TY4jESckKlI/d0
	X78uKlECrgMGamubyVJBsULxJ5QQtoooGSJXX3bRduR2EVpgQ37LRDLGTRWwcdLB9lCFkrMKPnb
	9q/BMd6TN0HiNiwYLypux8RVMmDQIK3RAMAb/AK+m0ZgEm6QBBmDA5zzfgjbcjRNNUMbHyMNsyJ
	nVa+7DuwzxRoH/clKeYhH8WDICpo1zImb0o8IfdSvvWODQrpBTOSWRW4V2yVVHtd2Ac1gTOXXUO
	CAVfkWgQYHOHQoMnT438wld2ZvdaXBQ06CTZNbQwbBavL7A0ikcpvJTp8UBvKvd2Dy9TuEVGebi
	9knvcA05eKKbShFT1wqURLTFvg1FaZ29pb24cy2P5b4WaXhdm5gW3GoQ8OLtWwOuUOYlHKGEO8b
	Q==
X-Received: by 2002:a05:6a20:728c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cbc03b5531mr22783805637.22.1786357267350;
        Mon, 10 Aug 2026 03:21:07 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec68468sm44276912eec.31.2026.08.10.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:21:06 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Mon, 10 Aug 2026 10:20:44 +0000
Message-ID: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
and then dereference the freed node to obtain v_lli_next and
p_lli_next for the next loop iteration.

Save the next pointers before freeing, matching the pattern already used
in sun6i_dma_free_desc().

Fixes: 9aa48806edb8 ("dmaengine: sun6i: Do not use virt_to_phys")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..2439fa6564f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
 	struct scatterlist *sg;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	int i, ret;
 
@@ -789,8 +789,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
@@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	unsigned int i, periods = buf_len / period_len;
 	int ret;
@@ -870,8 +873,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.43.0

